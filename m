Return-Path: <linux-arm-msm+bounces-91591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB6lMnCQgWl/HAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:06:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD666D4F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 07:06:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9053930098B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 06:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9B5036B05D;
	Tue,  3 Feb 2026 06:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IQMJdR+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q00K+sQE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21436A024
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 06:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770098793; cv=none; b=MyLQgoyYIrsBnR/BrfsGhQHE81EQ7FqHecT1TzTvRtNg61ojCkDv94NwLeoN26GY3YtSRMPrvQo7to90U+qN8Z3rexKZpjdyU3WdYvu1h7XuhFmGjyDKzMDf/ljQyBJ2ZG7Fet3LhdhazkWeCmC5BZyL1OaqlVMkYuGZVDzC3wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770098793; c=relaxed/simple;
	bh=/erASaTkNZVAHgvgjcOcyjOInc9leuRak6jY/6XVndM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AXb8e/Vgwc9ac9guVns62nwjuiaTqbsJrfw0fw2/HU/QgWZOh936napLH3Hq3sXN3JrmLQbC+C+uJUbPaOjvB2OLC3WHog3oEYSdTqen4rInauwCUH1JTs98+ttX+D9irv/7eqzPsziCstjYPql9CIeeNmlnyurGkcpsnffSuJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IQMJdR+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q00K+sQE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Mb3HH2357068
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 06:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zsZ/U7PUTlguv4sMgTQQkx
	AYAwi24B48tXfX5JkFjSI=; b=IQMJdR+IyWmy6CB8NxFf9F3Vw9Cr6cSusmxs1f
	LSYrJ9C6gwkBnDR7k/13ubTK9+9Xcm8sOJna0/bvv+MHaGP0Gp+BBq8sVXsG/fEZ
	2BOhda1Xp0Tk1lLOpAJDOwEn9ITupEIUQcQTHZ93stJY7+ySQ5KgsUJQluK8jV66
	NHsJDpXk4VSgE5aq0SInJHqeGcsRQKwTcFHIww/VQ6EsK+vvZ5gS1lBZvUC+dsRP
	4vV9EPnN1NjlfpWjWakei4Xvc5B6XeUs9v2SD/xngMbCDlTX3/y8I1/1YSID0nuU
	E3UICfX4tzB0bd7zARYbuyHqpwECEVuin25wDHGq74x5qbbQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0maudp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 06:06:30 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b7155ca88cso5227266eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 22:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770098789; x=1770703589; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsZ/U7PUTlguv4sMgTQQkxAYAwi24B48tXfX5JkFjSI=;
        b=Q00K+sQE2JXkVncvycXkQijfwyry5P3o5pkK9LOyY41/kRKNiUzlpv/XCUvsraEORM
         gNlPEYwHvHrNdzU82eIJtcG6eu11sJHupCpyawY6ZN/E8FCWWt8kH8ljGbBwn2dTMWyI
         r5B3anAfsghWJIKZ6oAxcYYLqFCIVk10tV2p/RwX9s98xFrLEDGzg+p4Cg6KnsOyxMsL
         Yy3Xfq/OB08V1y9PJ2z35c0KGYKhOK+JM+Jq8hIgagPD51BVJ9KgRxZjGIapQHZjN9FL
         QfyzNHVvwQozP1XbHAlubPihiUhs2lqPXL5gPJpo0yxx+o3sx5DkgL8EKuYzpmOAGj41
         lmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770098789; x=1770703589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsZ/U7PUTlguv4sMgTQQkxAYAwi24B48tXfX5JkFjSI=;
        b=kZvxMR5NfHjFjTmE7QmwEj0Z13UZ8OQLoP/7NHZ0LXgZE2C56AE7d/SPtndEJOIIfR
         pU8pa7U28gE3I7v2DpTM6+eOYB2bou6f0ooSy1xi8QX/znU2JpVstQ9DL6Y/c8BZ44s9
         h6A+d8IpPI7iZp+vGpUKr27NUwWSK+Y9BN//ITyAjnWrs4l7SrkUeUh76PYRkcbH9PRq
         xfFJa5kcRDQfnamVeB3KjGkPzhKY5DZq5FzBeLLCkfnjyQhGlDNJVgiGZs+PtQ0gWFKY
         Pb3dGxqY6aCD7y1bJ0pftA9EAxQws3JNMvRbQPwUm0zlx6wre5W1p8NePxL4pFElI4l3
         AMhw==
X-Forwarded-Encrypted: i=1; AJvYcCWSIuYx5lpLRzZXLI96VRsRO/KT4rBBGoY8797JmShyDPaquLC3L5GzBoZ9UVNnnQ4jpYLW5Kk4QCwy88PX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0H7w4JAJe7uZnld0fSerpQrspImQkgW6bzFnZs4hdO6h8GJNR
	IP0VeD8SMZRZLSmztgHESaY/XfwtVOVan0OkIY5YdC9Iqj4e2uFgSxu+c5dwMI7YkhEcTWh/rG4
	3l6+FACf4oFT/zGUlq0xUiXHS0aSTYOLt1wPoiZ7/bDASvCWW7q+uB9Jgdtbud7Dk6thB
X-Gm-Gg: AZuq6aJ6Rt9ovQK153Gd8SmL+sW+JmYovjZK/90mq7YLAgTn7/K8qyOXH/oIw0DkXRH
	kZYHk2/jdXC/8+DXxF9Q6Dtk1+wTlKX2SQpS8j1Qgc4FCmWwxTsmGjk0J8x8aX4r53WmCq6GM4K
	8Hq4FQtL0ofOIUhZq+F65vCuhHaj4HmdLo5O5MYEH0yKEsheW3NCLDDSwRdWtHfpSdC5Z43nyp5
	JGkWKM2DnpmLUZNce4esSdvuCjcrTcfmKd++B6PvcsNaE1N2bCOk6ZooMkWffMv0cCgckMnc4s5
	EW9ip4hChVum6SVQhqNiMV3cZR8khoX6921dX52U2pThsR2ADxObG7D1nhC+6yL9Msb1P4XM4GW
	MXXvw6rKsI8fC6sjt5qnxR+nMQulvfcXK+4PY0iPzHZ10sirVMMgKyqf0Zk3X
X-Received: by 2002:a05:693c:6092:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2b7fdb6e72cmr2286674eec.14.1770098789093;
        Mon, 02 Feb 2026 22:06:29 -0800 (PST)
X-Received: by 2002:a05:693c:6092:b0:2b7:fdb6:ccf6 with SMTP id 5a478bee46e88-2b7fdb6e72cmr2286658eec.14.1770098788531;
        Mon, 02 Feb 2026 22:06:28 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b8283def01sm417499eec.34.2026.02.02.22.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 22:06:28 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v5 00/10] arm64: dts: qcom: kaanapali: Add more features
Date: Mon, 02 Feb 2026 22:06:17 -0800
Message-Id: <20260202-knp-dts-misc-v5-0-02de82bf9901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFqQgWkC/23Q3U7DIBQH8FdpuJblQIF+xBjfw3hB4eCIa+mga
 zTL3l3oZuLUG5JDDr/z55xJwugxkb46k4irTz5MuZAPFTF7Pb0h9TbXhANXwLii79NM7ZLo6JO
 hUqBqlMAaO0Pykzmi8x8b9/Ka60EnpEPUk9kXpAClbe/TEuLnNnRlpfnmM3HvrzUFqpUxHQpps
 aufQ0q740kfTBjHXT5IGbOKHwZvfhkiG8AbXnNotJDwj3G5Zo94POUNLNcPkBFT0tsG+urxLmD
 EMSw4x3DjnXEwgLDAtPvDP5HvTZQbv/SVYlJrC04xBNPotmtZK3TdCWvaThrFgAFY4XKwyxeFO
 MZjogEAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770098787; l=2798;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=/erASaTkNZVAHgvgjcOcyjOInc9leuRak6jY/6XVndM=;
 b=kbvXOSYbH2wKmCqH27Rt6KGL8d5eJK5FgT7VRfe6LaIASCmPnzTGyYuKcDx1gqLz8lo4k442C
 nVDU5zu8opaDKTsNT2B/7C2ZPKomBUHI36FLHwlOZaRaN6osixc0z4w
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69819066 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=30QYRZTqTB-2Bo_0AHsA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: welimyX1Qa3W9g9iFsiTesKZ33GkI2Ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NyBTYWx0ZWRfX/bNiJli1dbQy
 nMQDRW6874xMNcl0YWd3B0nv5MKeyw9Ame+JSfMZ9rsQkSGlWVLvOuk0vKW01g4tHxw/TXyYyWU
 1v7sXnmJUJAtFyLoWx0VWWg1Fx4g/EcIIsz/LvAY/3LDRo/lz9p2kISFBF5ymFMSRllzBJP2K9t
 UJb6wi5tqY2uj4RA9o+KvdRcUVB2sVQ0vr57xg9rsSR5HnJm4YUSO3yoQDKaLlkOhqfGu4zGDyL
 YFbQxGhc2Jpup5Glwmgon+GG0L5uysVwhrjoY8yyH3w/pyeiYqWBvFOizJCmw8UOrY5jMuoGnoI
 fhQUHSoli8oRo0A0KZVdfW0VcH8ZR6LuNBDttZS4wiG9pJlyvS/5IRz14keQ8HS+HuJqwM68Ahr
 YzLaE80uZvrfESMBGYLcaYJflxQMHKegDPtdvYPHcWbg9BNsE6Ekh6+VK/IcshPt+vkhYT1eRQp
 6UvJvBPVovMIBm2yZSw==
X-Proofpoint-ORIG-GUID: welimyX1Qa3W9g9iFsiTesKZ33GkI2Ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-91591-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AD666D4F8B
X-Rspamd-Action: no action

- TSENS and thermal zones
- CoreSight nodes to enable trace paths such as TPDM->ETF and STM->ETF.
- QUPv3 serial engine
- ADSP and CDSP with fastrpc and smp2p
- Audio(enabled on MTP only)
- Multimedia clock including display/video/camera/gpu

dependency:
- adsp/cdsp binding: https://lore.kernel.org/all/20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com/ - reviewed 

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v5:
- fix audio node order and cambistmclkcc reg length
- add reviewed-by tag
- Link to v4: https://lore.kernel.org/r/20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com

Changes in v4:
- Add hot trip at 120C for thermal zones
- Drop smp2p-modem node
- Some codestyle fixup
- Link to v3: https://lore.kernel.org/r/20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com

Changes in v3:
- seperate patch in function
- pick remoteproc/audio/MM clk patch
- Link to v2: https://lore.kernel.org/r/20251225-knp-dts-misc-v2-0-a8a8a31fd528@oss.qualcomm.com

Changes in v2:
- picked latest coresight patch form: https://lore.kernel.org/all/20251205-add-coresight-nodes-for-kaanapali-v1-1-d3d2099b9b24@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com

---
Jie Gan (1):
      arm64: dts: qcom: kaanapali: add coresight nodes

Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: kaanapali: Add TSENS and thermal zones

Prasad Kumpatla (2):
      arm64: dts: qcom: kaanapali: Add support for audio
      arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)

Taniya Das (2):
      arm64: dts: qcom: kaanapali: Add support for MM clock controllers for Kaanapali
      arm64: defconfig: Enable Kaanapali clock controllers

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  240 ++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |   14 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 5119 ++++++++++++++++++++++++++++
 arch/arm64/configs/defconfig               |    4 +
 4 files changed, 5377 insertions(+)
---
base-commit: 615aad0f61e0c7a898184a394dc895c610100d4f
change-id: 20260126-knp-dts-misc-54e6764e3e9c
prerequisite-message-id: <20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com>
prerequisite-patch-id: afd581c1ad048b1b9d5cb13cc667a5efbdfd1bad
prerequisite-patch-id: 554f737dd82cedf873d73db34d735c95c28b9cd3

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


