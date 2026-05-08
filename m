Return-Path: <linux-arm-msm+bounces-106667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDoyNN3L/Wk9jQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:41:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 074764F5DF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 13:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10843300D840
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 11:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976DE3D88FC;
	Fri,  8 May 2026 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTcx7Tpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIseGZXB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC737AA9A
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 11:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240462; cv=none; b=Ss+cPkv7ri43cF/Ta5q0NxTJ24RBVgezTF2za3d74eszLaIQs9MSd8J8KAyiK4HG1yHjKwtV/3oSaggzgPu1gpL6JkaIXjVeVKFZMmM5VZBQIyUq5/xdb90f3Afoxq+UByYuQEevYIQ5OZGly/YAst3TiS451ooPPVhzu0a4HtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240462; c=relaxed/simple;
	bh=fRzq/bQJI2C5j5nUIqvt6eWcoRIMc2Yy8sViifhUlIE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SEPShvgq7zmEPzkPWt0aV8KCLP6SfBo/WFH2uLAh6iZrFtYWD7K6hH7DmWHL14IAS1Av8+vRvykBuDj83yhkp8m877G1QYc8g4T981DTHHYIt+Z5hAktz8z0AUBHBlmtnphrLM9lpYbVblO97DBu+/fvfEceeEZS2dDGtwH+sOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTcx7Tpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIseGZXB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6487mZwq2384376
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 11:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4dL9MbqmO5NoZOGWEnRN0v
	Ti6HOFxJp7JBK/cQnJ5/4=; b=gTcx7TpjQU0Idrtt+MQK5Er7+hvG8rlLcsN5Wk
	sWlfLLS5t4HkzTzj9Kb9H7a1gbmz2ZLj47mwmjazDl7+TDlA5NXKe5Ety77P9MiA
	Uv4t4WMinPlKeVAZ6AqrWnQ3xNG1z2bwF7+/eO8veO4lZpDISsOC9BVGuBw0q8w7
	2zD4AGUoCg5bJfHYkwKjtRJ6ql2HIJK4qvy/NL5W/7KqSYkfEwmoJHY/PJXN6Kzc
	tb3n7oPmTkSxjU4hpezryw7RyQ8lSFAf4KqKUv30btG/eEcN3IbR2sEBWrPAbArF
	5GrSHy1SvkfNOg4gJs3yxKKWzRfXBPcnKl/Ol9ekaqsmL8+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukwf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 11:41:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d5d03ae893so320075185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240459; x=1778845259; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=;
        b=GIseGZXBANbz+zQmwKL792iC55ZAclUdCCfNVqOpYix7dmgyEMDX378WiTVr6BqZsV
         d1EfNOtvvzbdwnI0yZwkj7eq2skxiV4ye3IrpMmKfy4K5wowesFCYhchz8F/QdTp/ot+
         gbi3NYi96eB9cv/ReEqgxTGAutOYh253fF2b621n3WFmGfYUgUhtbumER86Akz/rAZMc
         fusy3LfLCrh//1X307HDvmvPg06bnqfODNyCLqwGIlfVYisRqkc2Yrqcy8mZ9qxFCszZ
         a0MTsRdkylcoNtbIbYJawolwklLzx1cLMwchsVE1WzfClkv7MRL1y5lf+D0ZKOv2TlKg
         1EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240459; x=1778845259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dL9MbqmO5NoZOGWEnRN0vTi6HOFxJp7JBK/cQnJ5/4=;
        b=mJep8d1A33QdIZpu3KEG2/Dwv3UpKTpBO71uDVjbMGTo5E2vVn5slytwG4ePb2GsqA
         JMTPAJp/YZyO1YsokuI+qzPl2+HwBEXwn1SPDVvExataZtKWFI/orSRlLl/Ku2mNYkLW
         iDMSpJIfL6uoV1FSJrIp4jWc64haECoHsfgOOzd8sTO1EEYkpIx1mBIgSJiQw6AW1J54
         g/lzu4VHnIMN6uIJkwBBnr82P9KxqVuDFUec9HlVOCYNtCOpjMXvtyOXYZSNaIjZ7ua0
         d48hAMJhtDS2pHaRE1KVe5mwxBqAfmqKlv3UzxGa0tXZhISK9uU6h5sm/jzJjQHbUIMt
         EGhw==
X-Gm-Message-State: AOJu0YwozS/hVxnNVqJdC3HV6y9bE0SALeo/oqVyiZfSUI29Lj7DRr4M
	0h9UdjS+wjiuAm6O2Ypl0WsCvWe3FxsrkkKflGdX75Db6HJuHJin6v2Lj4g/PMK7Sz9g6iZeP0q
	OTRracIH+L6u9ak9xTVFhIKGB+Ey5fQv8c4eNqtLOrpvRgu6txc0feKQciLoh5OX3BfIW
X-Gm-Gg: AeBDiev0269AXzkc0SAv7qTtoZnhJusPbse67ez5iTcwijUCxlw5Wizt0Rhq38pTpvz
	VGH2yuU1t3GGsgo7EItptuAsEiLywO2UTBuM+j9lNxtg5pDROnMvPPwAS0ga0snt/ti3FZSNwJX
	cqu+pi9h1WHNIyQb65E0Cb7Djgcrg+ZMK4eA1BsZdgFTY9A6Rlt+EyVPA91S+TuehxCDfPnnR9E
	D3f7yBvvogLwAKGlA42fLw4azlEzX14e8Z22khB6sy4Nwnxvm4xgcAXlL9YbOUOerpOs3RWyZcJ
	tuhtxJC4eKwqTOG+hFwx4Ow/kpPqWlVdm/nNhYviDJfm2LvMiDKLMjlT1M9cbvwQYD9QGOsWHM3
	k1J47cWatHtxVq8ufNy3eklU3W2QXdo5I5+F8mTl6zGcs5Jtg/7VzWIpHQ3gGMl7lUfubEPHmxQ
	qGjofvBWw2qf7Rje/i8Rq5txI=
X-Received: by 2002:a05:620a:4493:b0:8c7:ad9:d0a2 with SMTP id af79cd13be357-904d4b5c91fmr1821327585a.22.1778240459407;
        Fri, 08 May 2026 04:40:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:8c7:ad9:d0a2 with SMTP id af79cd13be357-904d4b5c91fmr1821322485a.22.1778240458927;
        Fri, 08 May 2026 04:40:58 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:40:58 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add Hamoa Evk IMX577 camera sensor support
Date: Fri, 08 May 2026 19:39:56 +0800
Message-Id: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIzL/WkC/22PQW6DMBBFr4K8zkSOsYGwyj2qqJrY42K1YGKDk
 yji7jGkUjfdfOmNRu/PPFmk4CiytniyQMlF54cMYlcw3eHwReBMZia4qLgQNXTYe/yk9A1CKmX
 QytI0Fcv7YyDr7pvr4/zmQNc5K6f38M+YC1af4hWMc7ghJGfIaw0a+5yWLJdlLWqSuk1qlV8wE
 mjf925qi4HuE/waarZ2dS5OPjy2N9JhK/vn4nQADmVlm6NCIU1jTz7G/XXGn9W8z8HOy7K8ANR
 TYhUVAQAA
X-Change-ID: 20260227-hamoa_evk-2455daf43d86
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2824;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=fRzq/bQJI2C5j5nUIqvt6eWcoRIMc2Yy8sViifhUlIE=;
 b=pm1iTN0cRuDGr++C9tkC79mDzIlvW2vPQrXX2yoIZuHLs5D9nStYfMk6lqzLZmFYv5peqDPLA
 /mfxkjq4KlbCK68I6wQ7mQp3lrECU6TeeSQrWgamAg4AS+srYfRp6aT
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 4AprbC1LGAiPMg6UXN1uJBIfoqPTkhaD
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdcbcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2_56qyuii6Uzx6krxeEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfX0EFyrKj7HCwc
 n7gkEVyJfhe2NnbxTl1AXSk/O7OgyJYh/LT6vQ9GtOuWn89gcKiKTXD5Xxv067LoW1Ua3aAv0aU
 pCvLy/wzuHReJYXL4HE9sCHUQ/ym9IYLS0sgFfkzmYZs9VTtYoNLf7QSNJ5/IlZTEnnnFYrj/hT
 n9QgWW/7aTn0U/s8MxWis5cu0682mBEAZH2mn/DgoCQynq/SRIAWZvQ5j2fqTFLAkeA81JGltOE
 CsDM3jCZEKagR8DcLE24VaBeayn3BYqMR2ZVVitFOBh0o5YuntIlNl24JIchY59Z/ZwbrPVmj/1
 PJy98xlbGwttebKGu+r4dPOBL+i+kylJFhQ9x8pxppIOetrExjCsK19sI/SVspbSJeaw4PsjI4v
 PKeAo/RQ5+vjypL9/2Hu/H4sYpSb4F3vluDCrI0h6tbR2joTJ5cl6G6LvGKIkZ5shliUbc307xa
 0DUm7krA6Y9zXY+s6wQ==
X-Proofpoint-GUID: 4AprbC1LGAiPMg6UXN1uJBIfoqPTkhaD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080120
X-Rspamd-Queue-Id: 074764F5DF7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106667-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hamoa EVK is  based on the Qualcomm X1e80100 SoC.
It lacks a camera sensor in its default configuration.
This series enables the IMX577 sensor via CSIPHY1 through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

Dependencies: https://lore.kernel.org/all/20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com/

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v2:
- Drop src clk.
- Fix typo. -- Konrad
- Port the code offor Bryan's IOMMU, CCI, and CAMSS.
- Add mclk define.
- Use the unrefactored csiphy.
- Link to v1: https://lore.kernel.org/r/20260227-hamoa_evk-v1-0-36f895a24d8f@oss.qualcomm.com

---
Bryan O'Donoghue (3):
      dt-bindings: media: qcom,x1e80100-camss: Describe iommu entries
      arm64: dts: qcom: x1e80100: Add CCI definitions
      Add dtsi to describe the xe180100 CAMSS block

Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-som: Add pm8010 L4M regulator

Wenmeng Liu (3):
      dt-bindings: media: qcom: x1e80100-camss: drop src clock
      arm64: dts: qcom: hamoa: Add camera MCLK pinctrl
      arm64: dts: qcom: hamoa-iot-evk-camera-imx577: Add DT overlay

 .../bindings/media/qcom,x1e80100-camss.yaml        |  31 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/hamoa-iot-evk-camera-imx577.dtso |  74 +++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   7 +
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  15 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 368 +++++++++++++++++++++
 6 files changed, 489 insertions(+), 11 deletions(-)
---
base-commit: b25f15a8600145233c948b40cab6d7d57bac3076
change-id: 20260227-hamoa_evk-2455daf43d86
prerequisite-change-id: 20260506-purwa-videocc-camcc-fef043727e4c:v5
prerequisite-patch-id: 61bdb45446193b72dd8a4b093e4ab2f78db2f066
prerequisite-patch-id: b5be9dcbb612a14108f890b2782860847edfcbe4
prerequisite-patch-id: a03b10745ba5c628d09fc5278aef832864e31823
prerequisite-patch-id: 026db5dd71d5b0472225ba72c8ba2781334143a9
prerequisite-patch-id: fecc5a4a13c8e1c35ddd2f35e7469a327ead3b82
prerequisite-patch-id: 24424189b11acee204622997908d85a0efbb2503

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>


