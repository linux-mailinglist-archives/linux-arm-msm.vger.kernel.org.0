Return-Path: <linux-arm-msm+bounces-63669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF880AF8B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366E45A5311
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434162FD595;
	Fri,  4 Jul 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iLV8yT5q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7982FD59F
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616952; cv=none; b=W/++Cxy6v543D1slgdQgO64yfwKdXG9LT028Hp5ULU2shCA3B2zZL8juecK/tguRJHPyxuegm+m0mxNPCsiWn52Tgw+s1JOmffCpbHZWwHfB9XSBHcRB6YuKFvDNSLWq7AiMm6n4AT48MWOdDOhYW+xfqepTvl8sCP55kPTYIHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616952; c=relaxed/simple;
	bh=h/8FPdShUxBnyuQhvITfLr1y2fX5Z1y5nBq5BvfsLf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ccwQKZc8XebLe4Lv2hiLDz1g+/752PMbwYNBFzqPJmVDa3s1BjJaa0d/5NBPQuZwOvBHpV3jRjAopo3JImnEezCpJ2fyAV8moHQDwtU6KP+MuWfTsGi2AHIXyn9nUVt8M+9Vo9nJ7y8WYbCZ0WqjoVsrsSFLzCqFlmhYc0qnwJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iLV8yT5q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5640GO5M014069
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 08:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XMfhAIPniYR
	1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=; b=iLV8yT5qyL9LSGrBxENa52+xcHd
	EJMw09SsyIFSh0dm6yEAyFseyhi/PnJJTx0B6NarAUMxTs4xlsRUyD4MxjVQXyU2
	YBo8fZTA4gXF42UZBKRQa4hvOfw3t0WTxsRRbRH46W/8lEWjTxO5J4yn/h2ggMkg
	nX2SKYMggPTXBpMxqYw5cNliKC5xlHoI4UkmoiNftconQJmguE9hb7fYYELRfgTZ
	pYmOb9UosN+bZULFepU69GowdzkiKKWMzZEFeXWO3WT9ZpW2vmFWtzQsPi+ZMIid
	jpBJKTf+jcL4UJv6zTOBj8yFKrOI6oEUfmOWSWwAq1O+KxQPNcnGaLAvmvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw38hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:15:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d444d21b24so98859985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 01:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616948; x=1752221748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfhAIPniYR1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=;
        b=osNaZurpVawwCbuXkva8IkV0ACC1BJsH+7E7LKW6bPOVhs0ipvEQ6V1gpkRT5eq+aQ
         1Ok/dPg+aXtDrbXxPUllTBrZQRUma4QRqh48Q7azxsKkQTPAuFXQwASxBVHmRuuflVyT
         r+r1O8pPkrhlQDT7n+LGjCr6yRcvbjP8ZE3AITzusWYb0dIc87kzFeDJoXUy3ow5TxSE
         ihTBps5R329QiO3/Dz2owFOP4sdh8Q3lctu78Qza4/SB6ocSr+JcJwY8Z9UNVwYTFwPe
         MFtSX6148cmcLH1aNqnFg9sQHJh92ozDgidEuHqKbKf780WMCKdhM6VDwAGBotUAhOad
         2UuQ==
X-Gm-Message-State: AOJu0YxdC2ODgbsCHXssIoHKqWjqYUhRrH63QTLMsO/5xc7g0MGpGxl5
	tNVBD2xDigjLm9Mo10Bp4C3ag+aiV8lbISMkz+B2Ca2KbGTPAPPSGYlguR/qRQxqWKpmMRCbFek
	sU/MOTprDt0SosMUtWUc9UBCWwNG5kIHmYvA2tBO5vubdFxkX4/3Er756RQ/exufBJ4Rv
X-Gm-Gg: ASbGncuGyD5zP/m5ILUuqqXNRHhAyVbzwg9Ln5bt6qSva7ZqJC1X1SfzELZK89n5e/M
	rQhpYVyGebCbmNLFfQ5C5UfEZUyRhrvug9tx+ijXGXScihVlVGNTi6BLjla7V7ln2vwk/+Ioy6I
	3TuKkfNLkllZVElo4FijMaFSIgklVibruXCTyI2lXXi99x8SAVwDZTUcPAHlmYZdGS88SxdAGW3
	l8ROO9le1uu/e9cjraZAG7Nt8zeDmEAMzvyJwCD3ms7pH/kCyQ69CSEUltlMMMALEhUCd4sV/Fi
	H2idHDZI8eivl1XSIXhFu4bxebfEYLEeA4MiPTrui5j1F72D0oattFS47w==
X-Received: by 2002:a05:620a:f02:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d5ddb7bc39mr170750385a.28.1751616947697;
        Fri, 04 Jul 2025 01:15:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvjH7u2gPUyRmlBtvHydQOMJaC1U0SBdfYiytn0vSDFWas8pXrT2rfMU7zoc2YL1jncXRARA==
X-Received: by 2002:a05:620a:f02:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7d5ddb7bc39mr170747785a.28.1751616947223;
        Fri, 04 Jul 2025 01:15:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e0ed:c3b0:c674:7c4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989fcesm47991835e9.16.2025.07.04.01.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:15:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
Date: Fri,  4 Jul 2025 10:15:34 +0200
Message-Id: <20250704081537.1716613-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
References: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XzAWdCilOeoQLBWhM1zOt_woxOyFFdu_
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68678db5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=j5mQdKQlijobKnpfenYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XzAWdCilOeoQLBWhM1zOt_woxOyFFdu_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfX1FSXUE+6EIqJ
 zteZ1nrdIzvgItja3UiefQxEXhRLQF6/NI6NYNNDR+9Iwn/b9pATp9XuSIG4PAp5D8w1y1wOZAG
 XzvjZ+HlWqWWbeRG3GU9UDKXcvjYN//mFMVlBpISmkIxP5+0UA2a0QvDdXSgHYfBPlB8dRlPqMy
 6FyTw4zujeEARubFyz6NqsjZK7a0Ij5B5qP2Gc7TWKGopmq7Zo9B3WGD0LegSX9Q19z/Q0xhbDR
 b3AM2r07VmNvG+gLNgH7yvG3166YU91XNT5yXCxpCR216Yrw9qGy4iVTi5eOqvu2vnQ5N6hKy7x
 N7wp/vDfDTEV0KTTzcJwxYEN3spNAQjpPlt6xV3MDOix6xrlLK3FdM3ZxyEn+HlVMRND8vzgNnU
 osTwJcg3tguEC2uzcrqsgho5fjctpoa3BjQxc1V1VNSHopOHULusDdC3pDTy+Qgf2L+Ir96i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040064

This is the CSI PHY version found in QCS2290/QCM2290 SoCs.
The table is extracted from downstream camera driver.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 89 +++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 2 files changed, 90 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index f732a76de93e..91cd697083ff 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -319,6 +319,90 @@ csiphy_lane_regs lane_regs_sm8250[] = {
 	{0x0884, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* 14nm 2PH v 2.0.1 2p5Gbps 4 lane DPHY mode */
+static const struct
+csiphy_lane_regs lane_regs_qcm2290[] = {
+	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0004, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0020, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0730, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0xc0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0720, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070c, 0xff, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0230, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0220, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020c, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0430, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0420, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x0630, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062c, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x04, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063c, 0xb8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061c, 0x0a, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0xd7, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0620, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x04, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0xff, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x50, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x3f, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 2.1.2 2PH DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_sm8550[] = {
@@ -744,6 +828,7 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -829,6 +914,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sdm845[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
+	case CAMSS_2290:
+		regs->lane_regs = &lane_regs_qcm2290[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		break;
 	case CAMSS_7280:
 	case CAMSS_8250:
 		regs->lane_regs = &lane_regs_sm8250[0];
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 63c0afee154a..377707d91ff2 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -78,6 +78,7 @@ enum pm_domain {
 
 enum camss_version {
 	CAMSS_660,
+	CAMSS_2290,
 	CAMSS_7280,
 	CAMSS_8x16,
 	CAMSS_8x53,
-- 
2.34.1


