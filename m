Return-Path: <linux-arm-msm+bounces-81873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04462C5D6B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A241B3604F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9923F322DC2;
	Fri, 14 Nov 2025 13:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itzldL/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fi7Tm5oH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB73203BB
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127513; cv=none; b=VhaQlJG4kXvJVBS8fOJVXEADZC6VeynZ8J1WFvjT168W+Z287mHjwshjx1YyUcJ5+tWZb+zmG44jyKFGyfn0FhlSUk4Tb+41pRXVvtU12N4jAt2cv7/GGaW+ZzndqQPLUQ9e7hx3Iu1ezDrheGgV3Y3GYFNsGW5eSAomtiZsjhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127513; c=relaxed/simple;
	bh=PIO0LsUia40MfW4oZbbJfpOLKZecFNv6xRBZvdDtBt4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fDLp4n9D7k3qcB+z3XbUFrnKtIlJX/ZfwkN3CSuNn0DHqcThpGD/EV+gqKeRWgwpqT/yDVlkZ1IyuXCrKTK0GsxSFu4XGWMTp7YhXHHFHXxwNlv8j/ne86d5Va8GCNen1u+BnVM5+ooKK5O12DN9VKqoUATfmZw6QlqEUQDFTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itzldL/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fi7Tm5oH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8iOeW1426033
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=w8lX1LihANo
	E0mdMtITfubDrEdVWLr/C7I3u2S1mFI4=; b=itzldL/l2Re/ER5GRI3H4QNhwfN
	wuVR6fctLDK+OjKMc0iGfHtq9VoBO7rVAAUZXDZFndVnIZtLEGF7MSJPvJuawnhm
	mwWWHEmn7OpTP30Q2vZNOuT3XwE/dG+WG/JRf3rfkIymdazeHIltHOXavPXPUFim
	C/phuAEmeCkXvjsyJ5170TiMmVBYSJOjQVtgm5vC0JXvUWDCK1nfJ9XYgK7wAbvO
	l6CPEH1PcQ2SQ9oInBOuFQKr0T1lbhd1RnCYYGLdJT5eipMzAn9UlKaIgGhJH1QT
	K5PoPl1FLhLSfBWU7Kk+NUwWcVJ+8YknClFECiIfa56ZYNS2LnU5HYPGRbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g29ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6e701d26so53771251cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127509; x=1763732309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8lX1LihANoE0mdMtITfubDrEdVWLr/C7I3u2S1mFI4=;
        b=Fi7Tm5oHhY50fMuJLZ2Y0EO+SIOHIifqZ9tsz29B2G5/15f2TBGQ23f21XdlemB5gS
         e9wIH/0jJq2ZfVu6QhFIc1MdgMjUuChqKFLAgHNewaw55rwgS48vtOfyUReEdJC693JH
         qULJpXLBIY4b7/YMyKqCNxgRsJADCY0lagX5izjnWgfxRZ8CU4KneUyFXUa1WCjSIo4P
         APpRz24eoGq5eAY5eK3LooFX1E+kfdyWGg5Jba/v0It2NDsxayQmYTsm3Vwi14i1e3la
         ImSRuDIgQTm6rqeMKriMjv+3qdY6pKI/JIbNJ/q6sCW/LBk8AQOjmCeOWxp8HpIzfjwN
         Mukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127509; x=1763732309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8lX1LihANoE0mdMtITfubDrEdVWLr/C7I3u2S1mFI4=;
        b=DKBepCGQhRnHRzJXvPvUiZzmjd3qm5GXazogBJuoUoWRQMyKfXBxQQWQRpkOmHTEa9
         lQWlrR0k7mr5Q1ePp09XestAQ89emE5FiTVsLk5jeB8LaMk0mC4sp6CEplJXk73AGxQ7
         dacENT8Nnj3zWvTnhvspe00qPpXGGAq+y4wSrpFriXmezJR4XQNDMvWiVNsGRV7yVy6b
         uoCX4Q7DmTwkjxgqRpEyPahoT3f5xWYX4666QtuZSkT4WEL7B0T3b2aaeG5idG89XWGq
         d8ijtvsAs6DI+MnzcvlTd88dGZaLKcoKsRhwaGoUG3r41Ih7atWsyf3o4GiLPL4M7gcj
         UcMg==
X-Forwarded-Encrypted: i=1; AJvYcCVs32o1y4mQd7pdfz0lPb9VstrFDCk0m+4rJadFQwNTAqvlbyBZ2ljhvot1L0Ol9jAvqVshlGA2XG53IXOp@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTCMEBiIAXCVf52vvwynrX2flxH4n+niycbAgBWI79y65SH74
	ceekXCq/q+FIasTWoemLOh4ZdpL55y8D6p07LgXehoEHBoIYlfABGTxmw5HvGL4vi8laEg3/2pV
	APWL6G03mecWIT0Ul6uHDJAeSnBWyyCH2UNdepwF1Px8dbx2WvuZDgPPn4QhwPglUC+lLR6erJN
	tNftM=
X-Gm-Gg: ASbGnctDa9NMOY+0DllcHJvGV4+mIcIvp+6zP3TJz4Oo3YyWTVj51zafHoPWZ0ZWSpb
	kRHK31hBACnVGDm+C0+pvcQIxizYBblX2G+GULD+v/pwGpGHl/D6ppGZ1Kir4g9RqRUpaM5qB5z
	nZYJzlx19Dhh7LMuQoIPN6KsmI2INRH5ny6ZENpclOH4McghJuU+LkaH3DxuwAeVC7GMM7u1JIp
	C19AOvySJZrVZN7/d+ZdAxFzMAWShXXBjs6IE466e7BJzSHEjb1j9G2WWSVOEBiSWbkrlaOlaqb
	mET0SviQ6fdD0kY8BUbhPqmUHLaJIq6tlhA9PrqPB02+5V+6/tvZ0FO0ZuDylas/OwZVDWkE6JR
	t3QPEq+4khJ8evN4QUvT1CSN3G/ylbQoDv3H/PLTIdJkJaq0SszbTp/YgmK+YxaZKpA==
X-Received: by 2002:a05:622a:1a93:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4edf20a3e15mr42136171cf.24.1763127509388;
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIFgCKtDigDyC8bQ7srqTSIhCpEdfQqVrQXwgabbO1yWpR3znyUto0mwnpga4CcCKP07i5sw==
X-Received: by 2002:a05:622a:1a93:b0:4ed:3e3e:a287 with SMTP id d75a77b69052e-4edf20a3e15mr42135671cf.24.1763127508852;
        Fri, 14 Nov 2025 05:38:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:28 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 1/4] media: i2c: ov9282: Fix reset-gpio logical state
Date: Fri, 14 Nov 2025 14:38:19 +0100
Message-Id: <20251114133822.434171-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L+AQguT8 c=1 sm=1 tr=0 ts=691730d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=psbRAKA4zCjcBXW6UngA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfX7ECh1C7bl3D8
 W4fvHJf6GJyARVDw3A46FworFrBON7tjJ0cYN0+JsDFTIHvpeSkOoGcUlRP58Ybxjf/PD4qQ22h
 QBWFthoklqExQudy3GlOVraAvt5vYzE8gZlYnXxN7T+vEHXN+H6R+QbMHUocN8QM90r3HCDlKhJ
 jxsr17w+Gei83JugA2yUVFT0eZ5HrwX2cKOdmCuhBh428HPiG7eRZCWjTnNWi3s81Qql6AwUHN4
 wxmZA50qzDOuU/6/1pCJ1C6vBycZAzj6ZHqSmvyN26BQFxESP6ZLMudsE769ilOUmuzjsUvgBjY
 S9c/i4MSX2FRhL9+x2cWy1LmShc2lvwOVywZnGeaLDl6A8PxanAumERsq8G5D3dDj1lRqD3B4/c
 JC6TZZDIsqk4GP3nfsO+bUOKBL9FgQ==
X-Proofpoint-ORIG-GUID: XAFSpNVGul3qJgEKm4--YEvgV8VTFgfe
X-Proofpoint-GUID: XAFSpNVGul3qJgEKm4--YEvgV8VTFgfe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140109

Ensure reset state is low in the power-on state and high in the
power-off state (assert reset). Note that the polarity is abstracted
by the GPIO subsystem, so the logic level reflects the intended reset
behavior.

To maintain backward compatibility with DTS files that use an incorrect
flag, we implement a mechanism similar to:
  commit 738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/i2c/ov9282.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index a9f6176e9729..e79b326cdd94 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -160,6 +160,7 @@ struct ov9282_mode {
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
+ * @reset_gpio_val: Logical value to reset the sensor
  * @inclk: Sensor input clock
  * @supplies: Regulator supplies for the sensor
  * @ctrl_handler: V4L2 control handler
@@ -180,6 +181,7 @@ struct ov9282 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
+	unsigned int reset_gpio_val;
 	struct clk *inclk;
 	struct regulator_bulk_data supplies[OV9282_NUM_SUPPLIES];
 	struct v4l2_ctrl_handler ctrl_handler;
@@ -1127,13 +1129,29 @@ static int ov9282_parse_hw_config(struct ov9282 *ov9282)
 
 	/* Request optional reset pin */
 	ov9282->reset_gpio = devm_gpiod_get_optional(ov9282->dev, "reset",
-						     GPIOD_OUT_LOW);
+						     GPIOD_OUT_HIGH);
 	if (IS_ERR(ov9282->reset_gpio)) {
 		dev_err(ov9282->dev, "failed to get reset gpio %ld",
 			PTR_ERR(ov9282->reset_gpio));
 		return PTR_ERR(ov9282->reset_gpio);
 	}
 
+	/*
+	 * Backwards compatibility work-around.
+	 *
+	 * The reset GPIO is active-low, but the driver has always used the
+	 * gpiod API with inverted logic. As a result, the DTS had to
+	 * incorrectly mark the GPIO as active-high to compensate for this
+	 * behavior. Changing the flag in the driver now would break backward
+	 * compatibility with existing DTS configurations. To address this,
+	 * we add a simple value inversion so the driver works with both old
+	 * and new DTS.
+	 */
+	ov9282->reset_gpio_val = gpiod_is_active_low(ov9282->reset_gpio);
+	if (!ov9282->reset_gpio_val)
+		dev_warn(ov9282->dev, "Using ACTIVE_HIGH for reset GPIO. Your DTB might be outdated\n");
+	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
+
 	/* Get sensor input clock */
 	ov9282->inclk = devm_v4l2_sensor_clk_get(ov9282->dev, NULL);
 	if (IS_ERR(ov9282->inclk))
@@ -1237,7 +1255,7 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 1);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, !ov9282->reset_gpio_val);
 
 	ret = clk_prepare_enable(ov9282->inclk);
 	if (ret) {
@@ -1260,7 +1278,7 @@ static int ov9282_power_on(struct device *dev)
 error_clk:
 	clk_disable_unprepare(ov9282->inclk);
 error_reset:
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
 
 	regulator_bulk_disable(OV9282_NUM_SUPPLIES, ov9282->supplies);
 
@@ -1278,7 +1296,7 @@ static int ov9282_power_off(struct device *dev)
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov9282 *ov9282 = to_ov9282(sd);
 
-	gpiod_set_value_cansleep(ov9282->reset_gpio, 0);
+	gpiod_set_value_cansleep(ov9282->reset_gpio, ov9282->reset_gpio_val);
 
 	clk_disable_unprepare(ov9282->inclk);
 
-- 
2.34.1


