Return-Path: <linux-arm-msm+bounces-75274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B20BA2CF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56DF61C01411
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC02877E2;
	Fri, 26 Sep 2025 07:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow/MCiVg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FD8272803
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872072; cv=none; b=JS9b5TUo1KJjlirMMyZ/yuj/VJftOVeBmfJo1PMOFjjRQyy2utrx9TRrtJUQQxPpsXE9yCpJN3gcAzUZUGZm+MwNrvGm7GTKn0rvPuG9Iault+gVJb6ePBK3g0+87hXiQ54S5Ac8REEyn2f/T2xOd/5nPi+eWPVqmDL5+UYJ1tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872072; c=relaxed/simple;
	bh=QzHnA+jkGy7T2Hm/P9Pqt9a+k9vu3Zl/A+nJT8khFXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FsLISkaZq0EhAHecuenc1OzvvICPODH2Y1Ge+5z9/AahcegIS73nVVUniGs5LFJT31S2xFxGhjzwBY/VMx67HU1FGSXib27dxuacKaoTasEcqD02XTNLv46Omaf9CJbJiXiTxdN2iQtdiL6EWJXtX142VDvlF1CbmHkzIP/WHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow/MCiVg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q72Tug022790
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8g6eofdv0Dp
	+krIbYAADlccRDNujtYVAcBwP9CO6szY=; b=Ow/MCiVgiN04KoTga4tYUM+oCCd
	iRAZe1QKM6Hg88NjDG3fzGQ6YjRnA5beDHObfq8RU1ufOJZmxyoL5A46rtTbivpg
	Nv2Iv/Joym/UurA6Z5thnzq4uX7fmta6w+ObY/y9bnmlNptdPvPFW81m0uK/3vD5
	oY35rmZA9abhVd7vHy8JdQ1eh/gmgNUUCgrNESC6rdsNivn5ewly8aN+2sTlP1AR
	j+JY5t5Zys7s0Qxuq4YdhmgB0TRyOKpVl5wlOL80YLCL/y/uqCG0in4UXr4G0fw+
	kTG58BMJSgevARuH1HS+u9sQpZhVG9N4rBx4ebyW5hT5Rfyrz6M6Aa8sWIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qswyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 07:34:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d905ce4749so37530571cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 00:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758872068; x=1759476868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8g6eofdv0Dp+krIbYAADlccRDNujtYVAcBwP9CO6szY=;
        b=PfCj/3PTmUnBIOWTezmws6IjOktFjm3KaemFjqE+CWx76f8AhR4gvakO1G59GF4TB+
         WmD8AoL8An3Qz9JY1MfGXoUSiOQ4tpmjfav/oQZOxyqrQdJqqJ8lNdGOkeYX02yD3HwF
         AcIgJj9TcSIC8T9EkmW/iMPGPyTVXKEwhxosFBYX4cptV9m7KF6bn0EM7SLOXI7P/GSt
         XmdFoW8IVA+pkf+hM8oyfreoZ36gH7v8/5HdwQLksUVXuhZAst9IEdXuE9KVXg2KVDeg
         dHQxktjpv55Bk70sgQUhqF+BlIa1PVfAsbY2+lh8y8sGLKPYYfV1lSLgpDsGxqqqlKQs
         6iYQ==
X-Gm-Message-State: AOJu0Ywz61gUovCgMUdlAU1OTvuQYLnkLA7AAQZaFPQczhaRMrlM3puR
	th7hAnT3FJgkqPO0HWQ33hJosWCmsqGHi0JYm1P+QFeCagQuOLPL7M+hHAo1VTuW6Y6kQy+XJF2
	dnv78VCe1fqkhUhEFYplbbLmXDNVryLVDj8Yy+r+RkOv3uSJtBbULsJfiCHjyy+sTEXFZ
X-Gm-Gg: ASbGncutplVWwFBryy3BO4mDpAasHrFh57VoCAfBupeBA49TOY/jD3VUe+8CH7o0iI/
	jjtLVEsVur7ZNtnq3fKFNGQLYFokrqjvH+RgZ+ONxISFKOuEZ0Z79wpXGAnWUSnswZkzhP217Be
	fEAICSJQCiWtElSpY7HEL7kMoMwAUlEe3YR4XnFDPNI5V+Mef7oJ73MayQO2Vhhx/FaSZSNztXH
	CFd/tbFrF6B3BTY525aBs+ncwWZM9xs4pTkCNVKD1HKSgfJ/j1AjT8DjoxS9PTvKstBv+HCqIQX
	XXPxYag8L2ROpAQ+1xtuY4u/EK6BTlSa2wP1Rb7Eqjcoo1YbBkHEnPREPyKfnErzopb7QkTNDAF
	4ugzk4K2T0EpdF06tgPL3ul8sqm00
X-Received: by 2002:ac8:5741:0:b0:4d1:b3c6:83f8 with SMTP id d75a77b69052e-4da4bfbbcc5mr78322831cf.59.1758872068285;
        Fri, 26 Sep 2025 00:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg+iEUU+FfcxqH3JfO86nibzpft35RkBMciIbzfqmknwwxIx7udaPazf3tnGccaB3WDFEnrA==
X-Received: by 2002:ac8:5741:0:b0:4d1:b3c6:83f8 with SMTP id d75a77b69052e-4da4bfbbcc5mr78322501cf.59.1758872067721;
        Fri, 26 Sep 2025 00:34:27 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:5de9:cd6:92fe:bfb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fd0a54sm320481666b.86.2025.09.26.00.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:34:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, mchehab@kernel.org, conor+dt@kernel.org,
        robh@kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 1/3] media: i2c: ov9282: Fix reset-gpio logical state
Date: Fri, 26 Sep 2025 09:34:19 +0200
Message-Id: <20250926073421.17408-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
References: <20250926073421.17408-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QtW-mVZOO4VOG1r_IQJFzW0RKntzNyCJ
X-Proofpoint-ORIG-GUID: QtW-mVZOO4VOG1r_IQJFzW0RKntzNyCJ
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d64205 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=S5KZz0PuJSRxqgQEqnYA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXyjmTCU7F8uLW
 whRtqdpriCWqMJzckEeUL1RHPS3hyMSpR4v3gpQqHaTox1/d2VP6Ny0+XZ83wSrfGLCBHVDDpJT
 Mj2KW807AE/iNPnZwlxnKxFUkuMmrZ+5TOk/RTthtKfZ8J4f4RqfCB93vPQ5RfpELjbChzRxUnB
 U7h3Fw6YlrMudUrrT0lRsp3AM1piAD6JBYr293BnTBs90PTCheAo8/c5TVq7DyOPNQqr/EZEJF3
 CJhpuiI6UcT4gEFTHUS2V1ucs44WZz0jwK0c0FWNSVfHp5BOKpmEp5b4uY10lMXU1mQHfS2RC/a
 S3XLKVA9PXDeqf9CkBb6dge2O379wiVDkPNOav3W3dTOmnOxjOi4T8a0Hn1W9xtML3AUV9XR5AX
 /o0BsRodWAa93zrbgsA0DW+xKNXFMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Ensure reset state is low in the power-on state and high in the
power-off state (assert reset). Note that the polarity is abstracted
by the GPIO subsystem, so the logic level reflects the intended reset
behavior.

This breaks backward compatibility for any downstream dts using the
wrong polarity.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/i2c/ov9282.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index c882a021cf18..fb6fcba503c8 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -1127,7 +1127,7 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 
 	/* Request optional reset pin */
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov9282->reset_gpio)) {
 		dev_err(ov9282->dev, "failed to get reset gpio %ld",
 			PTR_ERR(ov9282->reset_gpio));
@@ -1238,7 +1238,7 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
 
 	ret = clk_prepare_enable(ov9282->inclk);
 	if (ret) {
@@ -1261,7 +1261,7 @@ static int ov9282_power_on(struct device *dev)
 error_clk:
 	clk_disable_unprepare(ov9282->inclk);
 error_reset:
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
 
 	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
 
@@ -1279,7 +1279,7 @@ static int ov9282_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
 
 	clk_disable_unprepare(ov9282->inclk);
 
-- 
2.34.1


