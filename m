Return-Path: <linux-arm-msm+bounces-71701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C111B4114D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 02:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FE94881C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24609153BD9;
	Wed,  3 Sep 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSJ75jDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEE18A6A5
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 00:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756858988; cv=none; b=dT/Ty8vqwRaR7AVIslKSPyNagrdQGkYZ87vesWC3/FOaHOmyDatK5dqbW33CEjkV0H+hVw09biaV0+X0RMh2yfO0/F5rMDiibt6XfzTOi/UfTWdqqHxW8O87yMkoaOkN1/qi5X/UmfercvyYIQB09GxQ4nDgPI0g3jsc5Q3n/24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756858988; c=relaxed/simple;
	bh=MrqujfyIeXhqk5oCeyv1Cv2fDbkVstu2LZMPVN62TY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDXszWB0NRTLHUNpFTxmUvFZ0GSP+9Vvld6s6CG0w7ujsFRXgtrrqcmEvSdaa0D2/skUrWJO2aMZO42kFlkj8k9G+pFgAG9nX5SoQAB1RQC3l+aJlzeWTGp2tdpPZPWX2OY3FcFvPXtMfWJBMUCEciTgqKyhLHGu9ZzA12KKjYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSJ75jDS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5607b6de4b8so239531e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 17:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756858984; x=1757463784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2fFRcX7qFBHFTu74PAu9P5/ewS65NCYhDHH50BUCrk=;
        b=hSJ75jDSZstGh/yDaJ27N8v4Cl+MDxe1+k1ME/XItanZ+cCdBFp2lJ3EuwIlZGATm/
         ISWRd6Tildqbj48Q4fKStgY33QmcDq0FmRnuOJoHbuFuPSLL72Ccs4yKxhU2rQHAZmPz
         yHwUffZ6mPUtZ9+NreFFtR9R0Wk8ib/tVR5bzMQrUDWAK85fdF3gfFvV8x2fq01zqz0F
         OMaGqAzxcNWtXOxqCRo5KC1fJ3XBq8kP/zZYbLkgBP7JkefpR0p17dnKg3hXeH4vTLT3
         CU2essZ60anJtsubJQ6+K2iIKpJrt6gFlvUp5kpPe1fTwT2872daXT7bqJki5BS7XMnx
         Tg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858984; x=1757463784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2fFRcX7qFBHFTu74PAu9P5/ewS65NCYhDHH50BUCrk=;
        b=wfm0Gy9SpD7x8Etk/3U+comyVE6c6AVxMvmrrPM2SC+Gfq3JyCPghuJVPQh0H9aLRp
         IwWMs+bLHhSl89kKXwHQ59PrVeY/IUEl5QrCWKWKzM3YbdeZ13KG1UkmtaG4LlZLrYAH
         ql2wq4NUzhK/N8s/yMhlwez0vLFv/rebW+uuC9Wz7DUObLx/0kDszGxtPLRuJaT1eLi/
         TZP32+//zzAKbjf7FhQdUomQwLZlQuwAMvTZBqIPrMVdIyQiu4gmwBJD+XNsCTyyXLfc
         bd832f0hGP6QaHBjDrkyBsgXeV7DA/zMIKOe3BfjcvkjKb6G4KqfGxT6tBnltwKN+LEB
         gSYw==
X-Forwarded-Encrypted: i=1; AJvYcCWCzvL9puNBRniCaAj1TMUAMzxjiMU6U5IbsKGztu4NBDiqnPwOq98/Sai1fePSwqU5ExtDkDgl1nC82wVu@vger.kernel.org
X-Gm-Message-State: AOJu0YzSc+W5eKGmvWSvT8Y67u4eB9C/jJthHIGnEXD23NMem40kmmCP
	RA9JkgZa+4yRGLfcnhnS9uv9kQ4txJ8vtjl7EMTaomrvRe2j1WPp7+Q1auBOmcDvCY4=
X-Gm-Gg: ASbGncvHpMXqQ4aoq4MA1BrMDe6xYcLpY3RUn6oyvUvb8/yQ9HrZQW596idFXil1O4h
	LditUHyrObw85PsJqIlbq0ChVyjDfAtafLclTVwQXx09mXarAF1F5ygLdmWoY9LvH0F1ftnMCdq
	DpjY+TjGqzZ9Wow2O5t4qO3gILLjsuzc0eTH0+59XW6kOVA+u0ggHgzIRnRM+r76vt7vqyva7vd
	OEDk3YHJIN/xaj6bl4ZzDDQSL/bjKKnX52IxDIZsCetd5TvP9TS8VYH9+Brq1UEIYpB38F445fd
	Fh5Bl24kxyfIDyJU3y+WGKx2iCmD3MxAph2nESeyPxSHIy5/qJ9/xQ5FRqSjepWV4rXc1b8HDmf
	NnOr/Bcb+7LDJ519pPyRT0V3YWfp3/2hqeDx9lw0kQOjukOH1Oqb2YcSBf4l0bODIFNvtO+vk0V
	+3pgwZ/w==
X-Google-Smtp-Source: AGHT+IFUBV51tAxNdpwtLPbgQZBv2eJjDNVnvZn0MG+EzVmpy3X+Bq0V3/UAGc3fHv9w9WLjO5H2CQ==
X-Received: by 2002:a05:6512:ad3:b0:55f:45dd:6f18 with SMTP id 2adb3069b0e04-55f6b22e981mr2348374e87.9.1756858984201;
        Tue, 02 Sep 2025 17:23:04 -0700 (PDT)
Received: from thyme.local (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfaae4sm129649e87.99.2025.09.02.17.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 17:23:02 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/5] media: qcom: camss: unconditionally set async notifier of subdevices
Date: Wed,  3 Sep 2025 03:22:52 +0300
Message-ID: <20250903002255.346026-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For sake of simplicity it makes sense to register all CAMSS subdevices
from its async notifier, this will cover all possible use cases, even
if there is no connected sensors to the CAMSS ISP.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index aa0f6e2e3d28..898d90410551 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct camss *camss;
-	int num_subdevs;
 	int ret;
 
 	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
@@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-	num_subdevs = camss_of_parse_ports(camss);
-	if (num_subdevs < 0) {
-		ret = num_subdevs;
+	ret = camss_of_parse_ports(camss);
+	if (ret < 0)
 		goto err_v4l2_device_unregister;
-	}
 
 	ret = camss_register_entities(camss);
 	if (ret < 0)
@@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_register_subdevs;
 	}
 
-	if (num_subdevs) {
-		camss->notifier.ops = &camss_subdev_notifier_ops;
-
-		ret = v4l2_async_nf_register(&camss->notifier);
-		if (ret) {
-			dev_err(dev,
-				"Failed to register async subdev nodes: %d\n",
-				ret);
-			goto err_media_device_unregister;
-		}
-	} else {
-		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
-		if (ret < 0) {
-			dev_err(dev, "Failed to register subdev nodes: %d\n",
-				ret);
-			goto err_media_device_unregister;
-		}
+	camss->notifier.ops = &camss_subdev_notifier_ops;
+	ret = v4l2_async_nf_register(&camss->notifier);
+	if (ret) {
+		dev_err(dev,
+			"Failed to register async subdev nodes: %d\n", ret);
+		goto err_media_device_unregister;
 	}
 
 	return 0;
-- 
2.49.0


