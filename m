Return-Path: <linux-arm-msm+bounces-100189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJhKKyz4xWkjEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:23:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D8C33EC6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 04:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 69B1B30BE692
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 03:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B3C36D4EA;
	Fri, 27 Mar 2026 03:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzmlyuEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5Xa6Rty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C79369967
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581650; cv=none; b=dl3eqMTl2gi9R+f8EQ0PmkzLUXGG52GZbf/DoBCyrU4dm3LlVG3PpImFnwIhMeaq7zA9aYzzI61Bp/3Xv+EPEQurTlEB2hd0+XBzSyxY8HqZefYV9y9+NL4NiUtWPoutuPC5wL3FX+JiB71k5iPrXGzqgbI+dsO24Xds+gX679o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581650; c=relaxed/simple;
	bh=0hDwDa0muC7+F5H7+OLySCMR7kBL9kPfSS38DbXtQZw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FrFjQmXnLLGjSSN+s6sJXfOWHIQgLTljdjfKb6PNbN9Nxi1O9+CA4Uz6yP2CsPpWyQCfZ81WG644phFbQ+UsafrfLUOR+bZnDzOi/9GhLB/nmJ6/o9WsCkjRwfxQdPysskEjcWfkDTNZVOLJtsfFanhSgl0rDvQrelnOBJWzn98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzmlyuEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5Xa6Rty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0EdPq334237
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3ei+KjH0NI9RIPv6VzP14r
	QbSQ11RRu2+cMTivoU2Qo=; b=CzmlyuEuBupQ0m7qtgGQawtlgW0rBy8I4IM7f7
	++9lTr7FJ8LJPyKyGPwwYXYOknN7e190sVQU9AQ+KkOUUtRUyc6QuJe5LYqd4iG/
	ISpMeNyomvP58zhQ5Q1nuwpkLyd+WrsaUz/s3YkoRo1Vw3qi8ufrRu96YYf88OF6
	k1ZwxB118Y/KRc2jn9QeE9FdihQiLGXHYP0F0ljNzlMMo3geh3Tfo6hmNfckqa3a
	+ia6i7mGpOdU+VQBIf6MPfOmJm+ikQXb2uIOeH4yOCLp3u4xHrfYxDpLP7m8zx3R
	dz3wO7YFy7D845/C1LBiYnCunMFUrodqc8ItuGldHtI7gSWQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yubjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:20:46 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-126e8ee6227so1769040c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 20:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774581646; x=1775186446; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ei+KjH0NI9RIPv6VzP14rQbSQ11RRu2+cMTivoU2Qo=;
        b=E5Xa6RtyRrp7yN0ff2tojh7mhhg5YjMzMynqP/0isCOjpBfwSJS5zL5Caxr1NQ9Dky
         c2DEVVU79fEen4GOKf4Gxdl3/QMEAdi7WnJoZqXStg0mLSFmHdPKuGyqNtDTCTSGmXvJ
         5AMFuQCQ+cwcbIACKlKUuvZecZrBvWNyfn9AVJCBWapcc11+Htf08TKh/ROwD+zQgq+A
         iTNRLt8imKX9YFenPg3RMTnImrfCeRa/ISvqNON7oavDzVn9Lu3D/EVkSvq0Kf+qT+Wu
         8yw81+nUGzTOd2/LYMDpzcO2H0vPnUGUuehI0XDb62SCXCk1IP24Nx2uggcXRWRUmbJN
         w1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774581646; x=1775186446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ei+KjH0NI9RIPv6VzP14rQbSQ11RRu2+cMTivoU2Qo=;
        b=FZSaf4tHgifZbxKSkfXnycMeoG0Pl7SYz8DY1/3hBEMbZ7aTgOZXc64WeAqiXbs3hF
         uQp1D6W7OLZkOH52Y4eD03WY9vAw/d5xKdY+qluhRD8HTWArc239d8/J+NQ2V/NcUstS
         hMoifGIQBzO0jeHdCfJu4KpgfQM4T/lLs1nS/w98kqR9kMFcB4sREfI9D3YuVgf4P5Ga
         Tkv9/2vbO0mdNW6yys1Bw/Q2DSXa7YodGi1Vw1cA9sp1ddUmHBpx/AMc+Nmg7xgMlNLx
         8Z0NoyNN4gNus7CkJySDEtN4jm5/yZfWDR9ivMjQrY5OOTky5Jnq9NRRXvSUP2gt04th
         ZjCg==
X-Forwarded-Encrypted: i=1; AJvYcCVfn9vex7bg5a1SFsRy5ab5CzVFoj4RQmhUPnTMFVkJeTvHp1bfb4ZuGTW9HWA/7DTwnrvLjrhT2qPFrMJt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3N5gvC//TcdrYADOrx6g0KAZZ6+MXViD/Ly7EMFgGzCPeJ2TY
	O4Fau4qBVI9WoIkMaFpfe6dex5PQWtArVJpRACFfvY3cHheYTKgf/1I2qcUf5SZNkYGTSJbgJz4
	529baT+7lSIbgExloC22xiXBQFsjNocKW1crv5HF/CIVm0kLhhIlA+aV9jNXhpqzy8hYy
X-Gm-Gg: ATEYQzwuaDrVd/C/ul2z81lssN/JySJGKoDKHgvwo9ZNTG6xhQ0a3pVdog+ZPy/4Gjg
	Vi2itXWrEQGYGojZQJkzy2BGO+h9D+YkcPLquTbPwtni7N3mqSyxYMR/GIT0HPcueKevOjo/b8Y
	L4YS2u8kEzuB2qMdJ10RFoECVX/hCE2tJKoAv21Kbuwd+57Fjks0VBGOSMW3Y0d7XbSdGZ5B73Y
	sDuaxk7zcbY2Xt3eAjRhaUwJfGwde44Kq546EjFERy0XF5CkOwm8YuckTEnpclgudxsYMyBEAZe
	j6ACFOPZvifb3yHKbonSAam+eowyyxlRknLTt8nIsup2HZi5HyLlHafhHARt1zI9DpGJanhVk2T
	JlrwKb6tsxQmYXQgNH+PA0kUp2THKQKxqyt/+zm2DY3jDb+RghGmpTbvZkX29vFzSMm/A83vW
X-Received: by 2002:a05:7022:2387:b0:12a:6a64:81d9 with SMTP id a92af1059eb24-12ab287d6d8mr496361c88.13.1774581645834;
        Thu, 26 Mar 2026 20:20:45 -0700 (PDT)
X-Received: by 2002:a05:7022:2387:b0:12a:6a64:81d9 with SMTP id a92af1059eb24-12ab287d6d8mr496345c88.13.1774581645271;
        Thu, 26 Mar 2026 20:20:45 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edde435sm4361337eec.25.2026.03.26.20.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 20:20:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] arm64: dts: qcom: kaanapali: Add SoCCP
Date: Thu, 26 Mar 2026 20:20:27 -0700
Message-Id: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHz3xWkC/02O26rCMBBFf6XMs5FJ0yZpkcP5j4MPSTpq0N4yV
 Q6I/268gS8Da9iz11yBKUViaIsrJLpEjuOQQa4KCAc37EnELjOUWGpUpRbHYRI8hjCJbhFWoik
 7qbz2FvLJlGgX/591f9vM3jEJn9wQDo+SXFC/Y4nmc5Ytryz0xOyesrbYvFwSv1yXSqBA18ja1
 IRk6HdkXs9ndwpj36/z+IGP77GJS1to7V1lsTE2kGqQtJJkDXpToVMValKU/0YJ29vtDsWb7BM
 IAQAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774581644; l=1668;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=0hDwDa0muC7+F5H7+OLySCMR7kBL9kPfSS38DbXtQZw=;
 b=HyrowZm4NibMKaLD7BhLF3RDWp6FrWc9QkbPwrQ0i2c4BzVpXUJhS948myiMBE6tRqItWyMV8
 WAbuE04SY9LA+R2Z4cOMl6DvgpYL/Ojs7shasuJWu5v+DxrCBd6sUtd
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5f78e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gDCzmgwdFpW75tfrGPoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 9tKpK4ohZzLh-ZwYCvPTteKMuEESuayc
X-Proofpoint-GUID: 9tKpK4ohZzLh-ZwYCvPTteKMuEESuayc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyNCBTYWx0ZWRfXyIX5i7ZpRMbx
 sNlaMizJ8ryWJcfEb3FM9r1WyExb72xSQlng5/wO31crL2/o5wMHzS4kQBAxgB6ILxFDY1mR2qt
 Bb6kDrpaQgbUvKX4mE5B2FdshzX6apAtT4n38W7xHUU+og+gN2Un2F6vsG7x1zdNDwieIbhSoiM
 46QCIt+CypEpdLyOHd8kbQPIt1yjwwtX6E8E5q+rW9tHo4eWAvBxqq68W4q1UokqtcAlDfiLRft
 Xe8PCwcopKPAUXDN+aLYPiXg2/W6VMJn0Oxpib7ApLiJmVUofvzKVWyUaSDpX5+NFgKr1bAOEFH
 pJQjO6rTiw5H36UxNyL6Kjv0kS8GGPrR/quBFiBUP0RikpahO8Xk6/rnPBNnsEivtFesbumHOAB
 ZIi9abVv8yNCKhp70Rssy91f5i+WxgMvQD/W32cpxwnqzTDCl6icrkPlVgLucsx+QBNukWLUUS9
 dFLpa9uMt+/7UGDECBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270024
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-100189-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3D8C33EC6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree support for SoCCP on Kaanapali platform. The SoC Control
Processor (SoCCP) is small RISC-V MCU that controls USB Type-C, battery
charging and various other functions on Qualcomm SoCs. On Kaanapali,
SoCCP is brought up by bootloader, so the status is set "okay" in the
dtsi patch.

dependency: https://lore.kernel.org/all/20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com/
This series is not ready for apply as the driver above is in discussion.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (3):
      arm64: dts: qcom: kaanapali: Add SoCCP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
      arm64: dts: qcom: kaanapali-mtp: Add SoCCP node

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts |  5 +++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi    | 72 ++++++++++++++++++++++++++++++
 3 files changed, 82 insertions(+)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260326-knp-soccp-dt-81072d13b6b8
prerequisite-message-id: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
prerequisite-patch-id: aaeb6c626609d672f3e61ef18b67961df38df48b
prerequisite-patch-id: 2a977d1876fdee9c930ac5f3ff7ff6f421b025e9
prerequisite-patch-id: d81fa4b09d7c2bcb22105fb24a79ab230081c859
prerequisite-patch-id: 0ec17b780f2efde54dabeb3588c6206d5c61fd64
prerequisite-patch-id: c9d6929e04a192ff2197ae531643fd02420c4443
prerequisite-patch-id: b138f14598e1cbc8e0c9a3058ed227283d6c6b26
prerequisite-patch-id: 8459bcae98ac156f6576657fe9233badcd385218

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


