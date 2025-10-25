Return-Path: <linux-arm-msm+bounces-78774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C540CC08791
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 02:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3B154F2138
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 00:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF9B21FF2E;
	Sat, 25 Oct 2025 00:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5WuUVCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3663C21CA02
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761353289; cv=none; b=IMhC9bHAHQQmegw7AAq1j8OKL8IiCIxRKyTIE7t3WZWEuK0rpwNN982OilGu7byA1IG3roMA1uzO0pHX67/579nUEPsC/C0SxNFVN8UmS4epMTq87IQpcLOw/uOMAMkp+VBu9fMJCqYyMYPURpDZWmFgCXOli+7O8dzXc0xzO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761353289; c=relaxed/simple;
	bh=jDjMFmVfUDvw4337eIePkyn6RwxTmXHsTxuRAlWWnH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQyFh000wY1QM0AIfnUUvwmcBqxR64NuCGN2u0hhkfz3E6Dc2gOKbL17ONE98nHhRpIs0thV1VHGjZC7JCbEHIiKFJM3YLR9n8B6HnLFG5UaCLLKfTLT0EfhaGpdNBVo0fBZMlC94WZEyRWMGdkl8Wg/ud+xrnjn1gac1E9SLdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5WuUVCR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P0lq1d006725
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Cvg3f2vcTWyvFoYptsB1kBkaF7U0YSfvjmuB16HFzM=; b=B5WuUVCRQaKApCAo
	zDWt3A/cupH0bjFVVzRzjm9G+ZHHqS/8AJZm3RDJApASLF8ZEKQOdg5uawDHHiLE
	7+WpjFCSzw0LzJMGlYxlnDfDDtBzSD7gfypO391cRQ8OKl5Hfxqcgxrj01YvJ1GT
	P2/p3ne9HT+Zh1xZbKL7iHepg+KDPYn7cz3PGQg+cN8K/OStP80Z5RDvfbwzlggD
	B3zX6/1+8QEP1k5mIKyXvyupeHG8BgJtKW8YvXXF6j4Qd35GkxjhLlfjkrc2UV34
	nWrvlv4A6oPK4P5U86aud/TzMm0PVuq5OlXvalPaFII5Op9fh+x8OIHtKKoQwhHu
	uWgA+A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0kwn0164-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Oct 2025 00:48:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bcb779733so2344053a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 17:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761353286; x=1761958086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Cvg3f2vcTWyvFoYptsB1kBkaF7U0YSfvjmuB16HFzM=;
        b=nAVH3C+/MRsndOLJifJ+AusSlNb85R+PZJ+aMT74GmAtnBE1psTFk4YygTphNtiFIZ
         S/zFkqCzOqZ4cjjTZnlDgmeh7cctXn/uxpb6hCMoQnRXWbdaESDEIJ4CRk3tqeIGWWFC
         luOBHLyk58sMa3toNePLpr0Tt1f46wgZZk7dpNTsYa4FHl/QNN01ZBtWrL1fEWxv+VTo
         B1f5bY1pQnot9W2SQwIF0GnKvw9hFhLA/rXBoj1wWCjISnfJ1OzR8EDIScC3lfkkFjIL
         JtTXIAffAI5zz1FkTwDAOAH2uy+wMjwKCa/YvYh0+E2DAp/wstQiqq01d1ZcHA6JsGfo
         6USg==
X-Gm-Message-State: AOJu0Yw+vnKn0sibzP6eg8/vTyH4es/BeGeS+RrvpwYOPkO50HbHV/Sy
	UrEuB3ZAskJeM72kTEyWb5risDiWbKKkYr3fPrnr2uoIyEFZVUS4ikoNhn586gW1Ly2qBVH3sb8
	E3NCK93u63g8nDsjA7PeHr/hX6unLkBLi7cnN4UOI8FquRK77fhZJR744qEhUNj0JgnTZ
X-Gm-Gg: ASbGncvllReiSs88YmBZ5aDdAjxMQU7ol9rgkQOH+8wyRjhuLAMwHH3KtH6v9VGPhTF
	tb+wjEPRCBY+37x9RcTWj/4U0dswr6PdvUD8NqjZo72VE7U2e/GdS84svYoJpeSA1WJt4BV1bRE
	s8i5lKjPutSz+U1gBZBoDD5yq/+7HuBDhFhgFTgbItS+fsF961Ilr54ql8U3egKM1PsBjjCdZVn
	dMHcsUh3lfRPQrC/ESgSassL/rXdT3Src9cDUKozPxwucBMXbVAY6xAWM5ZdhiKMCb3H5ojxzWV
	k4YoUTX6mxnP6/AmyVjSjUo39/bTAY94Ln9f30/wutXQDeiAF6pQLnKOUFfhecjnHQSnU1oF8WM
	WGGBFEBuXK/mAJJLTi4gV7vbGHxeyTPuYNOzFYYFVs6uNboMTLRs=
X-Received: by 2002:a17:90b:2411:b0:33e:2d0f:4791 with SMTP id 98e67ed59e1d1-33e2d0f588cmr10040489a91.13.1761353285709;
        Fri, 24 Oct 2025 17:48:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOOLiiW+hINTlO+qwzsPKjtk8LlBIRfcfLCG6jDPzsh1hx2ZaCLo5G36I6nYAwHf9f0snLpg==
X-Received: by 2002:a17:90b:2411:b0:33e:2d0f:4791 with SMTP id 98e67ed59e1d1-33e2d0f588cmr10040474a91.13.1761353285222;
        Fri, 24 Oct 2025 17:48:05 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed3eca8dsm167352a91.0.2025.10.24.17.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:48:04 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 17:47:46 -0700
Subject: [PATCH v6 8/8] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2
 repeater support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-glymur_usb-v6-8-471fa39ff857@oss.qualcomm.com>
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
In-Reply-To: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=MJ1tWcZl c=1 sm=1 tr=0 ts=68fc1e47 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: T--MJHHC1aH-YZDCzJdwvG5cdKi4CjcH
X-Proofpoint-ORIG-GUID: T--MJHHC1aH-YZDCzJdwvG5cdKi4CjcH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAwMSBTYWx0ZWRfXxHmTs/l5Td+O
 dZe1zCgq9oWiRFllKz2tuo+GiyUMVffft8Y9VXK3fE7FppDcErtd7D9Ts2nBIGSYK96fbmDFr2U
 OXJ/xjfTXKD6qZfYy6hPUs7h4axqIXGUkAS95iAb3vj1X5kP6G2k4Qxs/59YgWuusZGS+ZPxajw
 nA10pDpEeoWc0JExZvRpksSCejo28IfFWKFnPn93X/2XaRcHjPPDNw5NKrZtRYeQlKvN8tOMMh2
 +/AzuzmcGidM8I5W6grLM2utmhRa+9UfmVcfgZ/nDmsqawQqKMb+Z0XkgAb0YY7iL3FzSbktHkD
 l4CZb6N0nSrValpCXWYcpw7Uh7eqTbQN7rI0jzMMRJjFHGug71BQ4LgrGAecu+wFEft+5pYd3M7
 3BXS3ZmHC+WkpcpVHyPphHVWhj3boA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510250001

Introduce support for the SMB2370 based eUSB2 repeater.  Configure the
proper repeater tuning settings, as if this is not done correctly, it
can lead to instability on the USB2 link, which leads to USB2
enumeration failures, or random disconnects.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 651a12b59bc8..441996480a67 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -75,6 +75,13 @@ static const struct eusb2_repeater_init_tbl_reg smb2360_init_tbl[] = {
 	{ EUSB2_TUNE_USB2_PREEM, 0x2 },
 };
 
+static const struct eusb2_repeater_init_tbl_reg smb2370_init_tbl[] = {
+	{ EUSB2_TUNE_IUSB2, 0x4 },
+	{ EUSB2_TUNE_SQUELCH_U, 0x3 },
+	{ EUSB2_TUNE_USB2_SLEW, 0x7 },
+	{ EUSB2_TUNE_USB2_PREEM, 0x0 },
+};
+
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.init_tbl	= pm8550b_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(pm8550b_init_tbl),
@@ -97,6 +104,13 @@ static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg smb2370_eusb2_cfg = {
+	.init_tbl	= smb2370_init_tbl,
+	.init_tbl_num	= ARRAY_SIZE(smb2370_init_tbl),
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -278,6 +292,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,smb2360-eusb2-repeater",
 		.data = &smb2360_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,smb2370-eusb2-repeater",
+		.data = &smb2370_eusb2_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);

-- 
2.34.1


