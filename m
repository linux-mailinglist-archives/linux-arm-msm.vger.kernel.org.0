Return-Path: <linux-arm-msm+bounces-74881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12151B9D2FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E7F07B8A93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F2D2EACF1;
	Thu, 25 Sep 2025 02:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OCaEVAPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DAD2EA171
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767353; cv=none; b=symAinL32NJh9yX7hn9cEFhG4TpVwkBKS3wrGC2sSyX94xyPVTY5v1hzDmspRlKK5ppg9r26MQ/ja8PA8I7MeBndmHASMiQKFFEEhximi1Oewn/BG8Bf8/RQ/NpJS9U5Nl+CCxhrI/wo3jGe2P0osTrwXyC13YHcnYH0ppKk7zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767353; c=relaxed/simple;
	bh=KRfbO68RqNXGYUxEscJ9pAB4g2zVH9KTs2sCuSCOkhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=If4H1QtjbUvyAoMrFP8o5ardxV9LZiABR8lxPFm2cFYc6nXyOuHiSyjSt0VkpLSoLlA66llByL41vLLO7xym4ADjGErNsuR6BAYQBe3J1dZCq0lfwWSdUWqPJ/bmVxBjXMfjkmfTylMSAHObloDTkKO/+Oh/cSqdTUFU7g7bHHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OCaEVAPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0vIRT019952
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NVYsIQDhA8R
	ySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=; b=OCaEVAPvjxbkklv9I1axjPJpqwY
	ntg5/hTbvGbrGrrgMTERYh1AwxwWOjdIIG9XYAapcHT+TZsvEpr8cbgRu7bSsf/r
	LCbvSfAfZ0cKUyO42gkdOirH1ppfbnH0POCE6oUL65JGEn1vDNy0O7uD5h/zeLTw
	yPYLroGiKlxamAWZ8Ifvsl81/XaBQTzUHFBiF9fCWZ04RTn8IIkcY6v6iigZwjuV
	VfteZF6PqT80rX2VALY6574YKTmX7ftyu3OHzXbL4w+pulc9Xw1TAvCEF3gFTpIr
	VHqzZNu1whzZ2giqQcMcZrPTWfYOkrCBFumugIGz+g+mbcbjoL3fjnVuG2w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdynh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3307af9b595so436342a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767349; x=1759372149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVYsIQDhA8RySLuD9P7ecPi4IEalfEg3vxqe/TJrcfQ=;
        b=fIMcHCjjigJAbUv9lG7mkHlLbgeMsXm9SNzHpMWHYeptsveEh8svs0wfvPWaqpNbNJ
         0DGLUgsqKysHB4x5KKH00zNJ3oyHHQo0s3vyb8G7yyVVZdEVrCt3c/tyZjZj/ThNMz5O
         QLxJ5z8Ys9UWKvvefUj1k6NDvpAyw9m4Tr+BkcHTWtjtCLobuiMcQq+JcentGoy4hAxY
         m1+LKHEw7BUKPJ2tOBRV09TjGbluZ58bBV4O1OnoiMC+UcW3cjxjTu9fEWsuBGcpmKFe
         O53ipigpEFHNJ++NIaIW8C3J0bcsdNG+Lcd7vUvaFvdmetVfiAmy61C+BON1qxSH9CC3
         vUfw==
X-Gm-Message-State: AOJu0YyTjKYu+Woq04w90s40Ny8NkUmFS5SC6yxm5Xm3qCLrBk1wUswW
	JSm4CSzUkX+J8+IxvBF/vWDTIoBDfIR5WXNyZXVAzC2LMXPGDQkRxzeMxf84ISWPeqk19ALpR5m
	izc+GmH7P/qetNLvlbRtYcuWqzLhACnBn+2MXDgdfgggmABkS07vA58oxSc7kkYYpGC2y
X-Gm-Gg: ASbGncs4sRDnGvJMoG60wfGsvTy9KWIiVkKYE8QldEfVt6uZZVB4YNrzCy9fqYiAyD1
	YWHtEiy72SgWWtRrXqpyaKLPoy9WMJJSLoLk8KnPNjRSiK26CSNdF5DNH6kVr5DYgPWw586GC7O
	VtGVkCFZs98A3U4eKAFWVH8BfZy0wvNK68EqF5zUA9batSYGd7Oo587tPcXjXzPT2yw4EVKza7m
	Q7KmK5AzEFabQhS5hxLxaH2ZUlifXETDyDHRiBbETNfDFyn/ABTWGjcxCLmITwMUz1h5A41EFpQ
	Qx72IW4kVU7n8kIxC/qFoXJtE4Mk5ykn1/9S1b4tBI9r4qpJnwsA+hUnJbalTme9Ov+T2TaYlzI
	osR+3zs7dBZ3myszA
X-Received: by 2002:a17:90b:4f47:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-3342a242c87mr1559897a91.7.1758767349153;
        Wed, 24 Sep 2025 19:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECLCA3QwbkNEpn1Y33npnCoVwb/JYm/tQthSgy9u+tUbbw0LDLNGOOwLt4aOYfh2ilmfQULA==
X-Received: by 2002:a17:90b:4f47:b0:32e:9daa:7347 with SMTP id 98e67ed59e1d1-3342a242c87mr1559869a91.7.1758767348709;
        Wed, 24 Sep 2025 19:29:08 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 10/10] phy: qualcomm: eusb2-repeater: Add SMB2370 eUSB2 repeater support
Date: Wed, 24 Sep 2025 19:28:50 -0700
Message-Id: <20250925022850.4133013-11-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f_UvZiX8pCK69GcZSMu_6h-_9M8_3-qS
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4a8f6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Zq12RZiOzp0PcbRnEbUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: f_UvZiX8pCK69GcZSMu_6h-_9M8_3-qS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX+aWb3KFLcCYJ
 RLZLpsnzB+1bJtdTGrdprc3zTznCQt1hJlkqTVoKik7buq14+/rhYmuWSLzcrcedTIylkBrV7w3
 oW2EZoCB3TTvlLrUC+Ox3sdPsCDgRcCy2PPsLuCr97H2M04r4A6/uxSt2BAwPv0PqiQzGKZxyEQ
 gKedjf/TphUVpdD67UVFsgi26cXTdwfUq8fAADteG9Xzy9wkVZWT5csxKjetNXNbzqRy+B8LLMa
 BKrJ1jbzmthKgFizvRd1sF3ivxz/2TqlM07rD9APcEWLhYlNlgSnpoDGvMVbp4cbCTvA9oJL146
 3W6kgZbAGWjGOkVEdrPHgXkaUcs3vOB+vPuzZbWTJEaSIyQC8wtrPb6BKq5bD+oeFxSsLYbPoRC
 qFAsxCdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

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

