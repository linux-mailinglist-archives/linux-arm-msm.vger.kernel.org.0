Return-Path: <linux-arm-msm+bounces-10339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 382CF84F84C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 16:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC5D1C236E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 15:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3105B6EB5A;
	Fri,  9 Feb 2024 15:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HVcbMb1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601BB6A018
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707491666; cv=none; b=jrLZ5cdsUOF1aWlzqO5K7k/tkmX7BpbErOOrb176AAVauFld/9IL1u6+jfVsNfxuDng0tLutPH2mRP4BTYIiPfIfauDV/E6oYdfTBUQ3N6QaVj/Ze89NYyrSO8ld5xKlMBNNfp7lG/HTlbThos4xAJ1QZLdu83+iuBfGBWS5X2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707491666; c=relaxed/simple;
	bh=RYhCME+7iVjYelcpTNzvPbov152f+rjOM+U60A6Yk8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/18IMUa5cPK8OwqDgW/LPUNtUbDcTEDuN3nfRpJqjgCLi78Ji/uLuAdaOTg6+sI9WnnjnAbPpPymy8eDuI2tQjWmW7L2vvnw5YGUP3WQEBMIqANYkA0NDCGHQLcYjKHzzENyaV9eUlek4cNPpss/zcn2vEZLhZLh788ys5dblw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HVcbMb1l; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55790581457so1732796a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 07:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707491663; x=1708096463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YL2IJfHkdntdjIp9PYI1/IffOpvqAPpkYMNUKb07Z4U=;
        b=HVcbMb1lwUOaZ6kWqCcTunQ1FDBeOTsY6nH+LmMDzdMA0R73FTPSuuCkDfNKtOe2km
         AKxsN59x8t7+oWN9kFfLj9aY/BTHQgGZiXkjwbaDOOKWNtOC920TX6Wtd44c4BkKTKzA
         cHStzoag7PropSWsz/4PUQ9gIJ3pRH8ApxS6w9FzuqRf/UwJhq8uP5vEBNcVaW1yWuf9
         gEhzupRnQkjoxv3wsm2BJPw0wxPNUGNbllHcxY0qeYP2wUH2WNfU6kyVeC5fpyrefbVL
         1PhCNGmeUM+bBs1KSBPHLY9SNKyyUKCRXhfxUm4pTPFfBcrWw6mWtu6tmAJT0N+lyyBG
         XTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707491663; x=1708096463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YL2IJfHkdntdjIp9PYI1/IffOpvqAPpkYMNUKb07Z4U=;
        b=bMNXXwk0pkXB0EkvkxFgVZtR+h8vTLjwBXOTiwHDciNQ1xUMcvq5XlhhkiiiOOft3S
         6d4ez7ufOw7RPfB4KmewlxfUF0iFfjHSMZfnFwPeFcEZ2+jAbErXEOj+lwCJAwIK2kk4
         4JESpp/S9E81qrrphHS3/nmzZ1afnLl0wNOlIk3DcAIRTslUGG5IzdEp1msmJZ7y9vzP
         U3HXekaQcnIbTNX7Z/VsIT9krS3ZiK6/lptbulDKzfNZ9298R3czgn/vqnfLuRPTIHmY
         zNrPuBxmcuLpfO5IR9rUiKs2QNGSlKQe8aTt6Mh6vQJfvfL5DV5D/8XHnF9EvQDSBS0h
         GxIA==
X-Gm-Message-State: AOJu0Yx3g5yPHaTTkfFRagntHt6e6fve67dVAdqCrDaJSKfXsYOWNY4W
	vmASpVgT6Oy5+XTuQaswVy9sRKlMhbLLqoTrMsaXzcRdzlPtw3aoXz0I5zz/IUo=
X-Google-Smtp-Source: AGHT+IFRnx3V8Lzh5GMxDQ/foYrd+zTVGfXFf11WO/GMjuFCE6jG49bIpV5DOcpyzhWSeA4HDREdEw==
X-Received: by 2002:a05:6402:3083:b0:561:55d1:370d with SMTP id de3-20020a056402308300b0056155d1370dmr212344edb.36.1707491662805;
        Fri, 09 Feb 2024 07:14:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdWmparoLbnMsHzLIEVr6Tg1bWuhKB0XjpXYQ21w93vf1+nynSS63ESpSPCxvFjDdVh28CVql3iOTnq0ih4AaOAR+VT7Lo1KbY4XKHZIrxFn3VzPJ3o+3fK1M47vxURvTtKezS6GGd2Wr3je8m1pKooeqt/Ltp1gFBVPKlkPjWvsciyPOm+zVcfvQF/USozA0SE/FUZrHKd5WDjSgibR3SW//XLppRO6YUTWPZn9L0dVTHILmrmPNBCr5TYeTwqxMfQWs0CBCxf1w3HwAN7E5hC0aMZxpUmmsJHZmc96Yjos4i/G75Lmp9AO82Qu0sbLzKVQDI5nqmAcx7jKL/PiAB3RJq0D/bak+2Rz+cfi82p2X4dBLSQzS7n44vINLijJLaYsmH9w==
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id k6-20020a05640212c600b0055ef56f4575sm860240edx.39.2024.02.09.07.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 07:14:22 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 09 Feb 2024 17:14:10 +0200
Subject: [PATCH 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for SMB2360
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240209-phy-qualcomm-eusb2-repeater-smb2360-v1-2-af2ca4d95a67@linaro.org>
References: <20240209-phy-qualcomm-eusb2-repeater-smb2360-v1-0-af2ca4d95a67@linaro.org>
In-Reply-To: <20240209-phy-qualcomm-eusb2-repeater-smb2360-v1-0-af2ca4d95a67@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=RYhCME+7iVjYelcpTNzvPbov152f+rjOM+U60A6Yk8o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlxkFKvd37nKXPlXZ+BGqyJesFi49ujExMfhLIo
 Ej3PV1DZz2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZcZBSgAKCRAbX0TJAJUV
 ViLOEACaWnWsPpm3ynGsiy0HJIrunVq1hVKVG0Eq/OMOGBxMZkoAbll56aLUGkBdxmq2xG8V5Vm
 gF1gwEPDAb8zLJVFUtNXWkDrB/Xuulg4POxIF2Oayv5O7F9F2rO+xgF1+bktr4v4b+4Mk1SP9ZQ
 uyVs5r0dpXD+bgj9bcE/NPp4KmHu8J69QLjcytVIpEN7e5FAJnL8f+FREgayTfdOiwY/JsZN5Y2
 j1KRe1gpcbu3B2SOrB7Nma+zWJ4DBlxX7LTUuMkm1SHLNBVZ4ECAdH9nFc2Irb38DSaV8t7Mrlg
 cIxv3EpT+31aK8bMg6nAWi+NZtSqhjbeupE4MV2PIWlA7R6PGSdZjhAVp3zjNO1QaCaVir4q06K
 kJUp6qWersCfFzyoj+y+anUDJCryll4ebqb4gQh4C+n5WihvG2lE7e0RmdEiw4a5zU9YeNYnxJi
 IIkqB+4H+Bqk4dgJzYAPD3eai0Rmk0hp2YloptNC4K8FpHMXQe1QVFMDetCGVBtILrmC86oWGkH
 UAvuQsSTsT/4PpTPMY9VPY1mwzxS8fUBzsv6dR8uE1ONRSRp2R5FWhDJevv83LPuPLWNyP0Yf5c
 8u5pZjfZBDk/oPOu5fK/5vGrc3Sdc6NDQx95QtWQB5EzZRmVY6kEqKbyz7C0mkqQX0L8Q77/ulz
 sY1t+vi9R5sS+Hw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The SMB2360 PMICs contain the same eUSB2 repeater as the PM8550B,
so add dedicated compatible for SMB82360.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index a43e20abb10d..68cc8e24f383 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -88,6 +88,12 @@ static const u32 pm8550b_init_tbl[NUM_TUNE_FIELDS] = {
 	[TUNE_USB2_PREEM] = 0x5,
 };
 
+static const u32 smb2360_init_tbl[NUM_TUNE_FIELDS] = {
+	[TUNE_IUSB2] = 0x5,
+	[TUNE_SQUELCH_U] = 0x3,
+	[TUNE_USB2_PREEM] = 0x2,
+};
+
 static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.init_tbl	= pm8550b_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(pm8550b_init_tbl),
@@ -95,6 +101,13 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
+	.init_tbl	= smb2360_init_tbl,
+	.init_tbl_num	= ARRAY_SIZE(smb2360_init_tbl),
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
 {
 	int num = rptr->cfg->num_vregs;
@@ -271,6 +284,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,pm8550b-eusb2-repeater",
 		.data = &pm8550b_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,smb2360-eusb2-repeater",
+		.data = &smb2360_eusb2_cfg,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);

-- 
2.34.1


