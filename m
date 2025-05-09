Return-Path: <linux-arm-msm+bounces-57347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C670AB0A1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9142C1BA41FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 05:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF1B26A0CC;
	Fri,  9 May 2025 05:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KihGE9Ei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4A26A0AD;
	Fri,  9 May 2025 05:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770260; cv=none; b=gvNSoT9wJkisYrinSen9LDkjSSxxaW+A02bvbj03R1PZFVLeoGq46WRHKB/MwDVFsEFIeg3ye83yM4kXCpEouv9JH3OnjYka3YZLSks6CcfvTGbeleLXXybDkGvfFi4YQDuTPOunorjt5TQxkl5gISDNsWF1dtGocoDhfUO2Z3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770260; c=relaxed/simple;
	bh=UDOFCVOwBhdT1r6n2Fb0PTu7go+YWk36fXUmc24Fgws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=W10Daqns9I7JmGfTp+AjEeCeu3V5RneWSefZ5YgkgTafsbjf2YuF7Q4YExavzNXj1TanVGCvpQVJKCRx00uCzJ2M7sH2iuuBe9T/4JXEoB8tW4FNLN4Cnz6ouyoLSz0l2b65F78rpRsheyZ1PS+4pNKKT9TqBWkJEPusKi1VdcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KihGE9Ei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492XApE024935;
	Fri, 9 May 2025 05:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VcY/aDv6P6njdECVaPvxwyKJiMWNEH94dORLgybS0ig=; b=KihGE9EiDW37Pegx
	6SwjWWcPuDiQ3LvmvWRKDCkEo5oZk6n600z13LrJ/gHYkS7qJZK0uq+SiF2f3xTb
	0qqmGDyMQ8a76U4O8IZFz88tqMBp8XR0r0jDHp9z3Z15KeUciPE/KqvgPk6gzwjK
	FkxZ+hl95/ExZcv2PTalJta6idqzAyUi8k63pW7cS77Cfvc2U9V6XeeChzCHs2Ju
	qa70GhiougWEXWUhuoDV/bUp584pf18ZeRWpnVjg6hdK4thAxUGWjfgWZF3+D3TY
	lWgO+6eXq5rQhOT5Xap3e6CUMRa5LSbPrvgHaA4LvEXIkS7Tl/A1e4IfSBeHV/ks
	78dcyQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp13krv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 05:57:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5495vYlF001871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 05:57:34 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 May 2025 22:57:29 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Fri, 9 May 2025 11:26:47 +0530
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250509-sc8180x-camcc-support-v3-1-409ca8bfd6b8@quicinc.com>
References: <20250509-sc8180x-camcc-support-v3-0-409ca8bfd6b8@quicinc.com>
In-Reply-To: <20250509-sc8180x-camcc-support-v3-0-409ca8bfd6b8@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Jagadeesh
 Kona" <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA1NSBTYWx0ZWRfX5GaA72OC3nRy
 2bKLJW8BWf8GbNrLIZzrvUQlPbRvElEWUgoxkAqUCEY4rGbvgoe98DGKv3wnMX8wTyZlNLRVm0O
 JalSEecVIoEdCspaHReYRKOAKYvqL9tcz4/yasp7O1E7U7ey394nXakubvC3POEromkCZ3LBufP
 mtpU0H8YdimD9Frergf2/R7pRCgCi6ohTUvtuOf3LPa49PS5pfjeg/PirRHY+MfMm++LhgX1nEB
 9v1aHc7GUrzQSLyiGON2wUR/3pc5jqe49VdrZg7oVNQhLjfk/q5YTZExcRoCrIXc4OIn+zG3hSz
 +4VKb0Pa8323SaGg3AdOGJj6+vcWL2Czk31j6ZKdA+J/tbmsmCPSaNkjHaAEkES4h7gcIpaEZm0
 tmQiUWz/VwnRIXJq8fiDQWCWWV9lZ22ao6q/JCatIXrFOFruTFFXGsqI4DX7+JdFWzFM1IFI
X-Proofpoint-GUID: _4PubCDNdudDS45kMU97UgCLZZX0Qjaq
X-Proofpoint-ORIG-GUID: _4PubCDNdudDS45kMU97UgCLZZX0Qjaq
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681d994f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=RnwmOxhnHiGVc7f_JFQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_02,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=714 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=1
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090055

The multi-media AHB clocks are needed to create HW dependency in
the multimedia CC dt blocks and avoid any issues. They were not
defined in the initial bindings. Add all the missing clock bindings
for gcc-sc8180x.

Cc: stable@vger.kernel.org
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 include/dt-bindings/clock/qcom,gcc-sc8180x.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc8180x.h b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
index e364006aa6eab8c1c9f8029a67087d09a73cee51..b9d8438a15ffbb73efe1a6e730ac7a532d2437ee 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc8180x.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc8180x.h
@@ -249,6 +249,16 @@
 #define GCC_UFS_MEM_CLKREF_EN					239
 #define GCC_UFS_CARD_CLKREF_EN					240
 #define GPLL9							241
+#define GCC_CAMERA_AHB_CLK					242
+#define GCC_CAMERA_XO_CLK					243
+#define GCC_CPUSS_DVM_BUS_CLK					244
+#define GCC_CPUSS_GNOC_CLK					245
+#define GCC_DISP_AHB_CLK					246
+#define GCC_DISP_XO_CLK						247
+#define GCC_GPU_CFG_AHB_CLK					248
+#define GCC_NPU_CFG_AHB_CLK					249
+#define GCC_VIDEO_AHB_CLK					250
+#define GCC_VIDEO_XO_CLK					251
 
 #define GCC_EMAC_BCR						0
 #define GCC_GPU_BCR						1

-- 
2.25.1


