Return-Path: <linux-arm-msm+bounces-63995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED658AFC5BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 494EA48032D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EB22BE7C8;
	Tue,  8 Jul 2025 08:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIv5yMl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640A2BDC0A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963558; cv=none; b=eTmMzmsOBss+9B5zCP3DjCudbnE3P3vUgkwLJPa0MyhuWPVP8HI1hge4MwsPI+Vqokyb8156lNaD0NO/2OhGNHFCpqe05jzFEH7IGKp+7rAIK6l+7sE77YO+P5ESGk+OTpEbwIB6VMCPV95rJ4dbvxCw1AECZOgeJ7lDwnSfdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963558; c=relaxed/simple;
	bh=h/8FPdShUxBnyuQhvITfLr1y2fX5Z1y5nBq5BvfsLf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hnwoe8EETaJCCpg5e4FXZ2HsGgvDu8N2BJIOjAPiHt7KyKTj3mo5sJUISFAbqQB0bfRPlHn31qqs8riEfqOoOOg9bF+dQVtAZZMMOu8jrQjLFyY37kczRxh3Ak4Dt3qyGWkOI63tNfZjrEtWEDeaGVKOpWXM/5XZDNJmVYCV2vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIv5yMl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5688DbG6018593
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 08:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XMfhAIPniYR
	1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=; b=QIv5yMl0MNH2r9D2JCFG337GNzP
	XzZxXiYFkn6Sp1gd/YM+De8C6phnrUB94IUqkOngOvj2I7ATvNSwos2k0OIcoi+E
	MdRG9ldyI1vPAAK/YEQQPc8bSKAHDFh2Bso1INbmfsSgNqH5InyB2x+4pFVcJIaU
	1I0c5/KhI8/h69qpFtzJVqnGT9b2pZpnBbrp/Y6GZuKRo8LYeUr1ihnmtCwxt43H
	kVuB3g/ci4y92CCG+m+ZYliYmkmM4W0Yn/yw36HxI2A9yNwOSUHuvORi3I53D5el
	BndR9xTGYBuPT+p+/ly+M1Y/5Nxmr61CfWXdtteBVNBPxhPyF+TTPTjm+1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkkpkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:32:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f64739so832103485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963553; x=1752568353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMfhAIPniYR1TcTJelU2tu6NImHbu10iJmHmG8d9+Tw=;
        b=h/U43PfQCb0iizIA23jrE8IIgo15m21iSlfLjd3hTz3gxM3jdXkfdhYWnPCf4/Tq83
         b+PTxVSWY34HK81JC0HvMBM/x2LcSQaTQLNvXkbDygrg1prgOjchycTWSNIbwuUqfR8b
         HYF3vtprNo+fn7LVeRqEsimaQ8heACmvg2RqLJRcXbZKT5/KFY0gPBxOVX0VgHuPg5ID
         kiZ6DNv/Akx8Ms1v85Z152B5WUZEopH8/Z/ggCN0qGJywJyLLK0ASIDL8CBg6ZM3y4xy
         /gDOOFCOmVUdJkeVQaLW4USWqDPi3fJcQaJItSm3xGG0pNduGaNMWM8pijxz5c6UFYCm
         X6Wg==
X-Gm-Message-State: AOJu0YxS4hJTEaBD0nLFtk4GwdeQn0r7pnQjsq7N2XokCes1EUiOJZoH
	atT1JsoCNh14UZ2ESjIKfLGBadJw0VhjmPB2eDSJPSOv1LxD1E/1xI4FkY8S/5cBq/o3ikQhd0H
	lMnT5XT5QCwvrkxA/svD4o4aK7yN6pm/qcobYrJb95a4puPgciW0K1R6W4BjazNNsPzg+
X-Gm-Gg: ASbGnctdJVNzsnVWDSOad5xn1vVDcYN1XEkKBNO/gEb5jYN0lY9MIWBGgB8aGQwrdUL
	gV6mZIyDoBLgT/09tmmrV5zUmN0p2yJaXZDwu1Dk51MCAB+ExWT3P1val4q1QJc0X7IVhEqTdeB
	B9aMCHfpI2C8h2HcHFA6Vr8t20yi9GX7Qm+rnauE8sPTvS+3qBXSD9ufU/7SfLGhH/eAn83QAYv
	oa3TQ9vDnaOqr6Oxsxi5utEKXQuGOQlAHTYwmDA+ZyWWAOG8MBJbKkfsqAh4qDILHlP7qYbtWBu
	TDfA1HGgtt9QsgzTk5kPQxcqa+m1Vdjpn/7noAKf0L5yBvGY7T1L/7uUIA==
X-Received: by 2002:a05:620a:1a23:b0:7d9:b536:f391 with SMTP id af79cd13be357-7d9b536f3ffmr509735385a.5.1751963553302;
        Tue, 08 Jul 2025 01:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHKfsDfNI599NehooYbL5P2zJiyDiLIm5loYe6yCuUqO1Qc39W4y+qQJDU3isrQH7ZHHlmgw==
X-Received: by 2002:a05:620a:1a23:b0:7d9:b536:f391 with SMTP id af79cd13be357-7d9b536f3ffmr509731385a.5.1751963552751;
        Tue, 08 Jul 2025 01:32:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 3/6] media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
Date: Tue,  8 Jul 2025 10:32:19 +0200
Message-Id: <20250708083222.1020-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LEm960do9W6iTrYJnWoG_mLvRNRLnYf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX+FywOjinjLSH
 OB5MajCleDn6GyRwXh1KdR3ge0HWIwfuQI1H1nhYMcNj6HSSovfaXB0kYviwx9jRok9Fa6i4X/0
 LQs64FIxlREuPzG7xeGPaUyAFOcT2zI92h8SEu88AbkGqaQs+WhYtOt4+s97kxGfDNHrVfHqyPO
 RFoCcQTlrBgKYqAV26RxXdx1t6SohUlJMnPCXyKwVOys80kvJmA/zvxGDKjAM6P/181qd+QkssL
 trYRTUtAl1X18/f4sovwI52phKLKHP3JfX8O0MdmY5wEMhtTPTq7g082B7LKWrnBYhelhP70EQO
 2hsMFDXBxhNd+CgFu9MsIumRDSemOTduKwZxFTTHkxUWFkPx+cLE/3SgraNnCGVTSD2BjMFmxYy
 NYFcGF6pQfIe/hZ8fZUWfC+fjjwY40/bq+hA/8GZXH8uigPfm/hJRC8N0b9ryOSclLjVvr6W
X-Proofpoint-GUID: LEm960do9W6iTrYJnWoG_mLvRNRLnYf8
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686cd7a2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=j5mQdKQlijobKnpfenYA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080068

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


