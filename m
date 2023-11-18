Return-Path: <linux-arm-msm+bounces-1053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2537EFF66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 13:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCD95B20AA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 12:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F57D11723;
	Sat, 18 Nov 2023 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="es1AM+Lr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5ACED65
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Nov 2023 04:11:41 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c5210a1515so37831091fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Nov 2023 04:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700309500; x=1700914300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X26+8wItEuS2j+BVlRHOHS9xadXwL+/+KykUmMySayM=;
        b=es1AM+Lr8lsvx7R3ir8M4EnRWiUMmYdHPzq5WwyvJbsaI1QMgzWjUAeeVSgPiWavRO
         +Xx8NwXYM4Exnev42GZgZ6g4htWMrjJhBnLd/5eMKre0OcLLmpfywwvjlY5A3PbzJlDS
         KXeTrCSkI0P3o+lJD6sV2XaODamkdGXdmXX9nEM9LACYYhKf6zd9ZvVtmX/ZAZauxztp
         fbdrnOZHd2OvdJ2LqFHapoGBR/zciETi5c/QVNqsYVaHVU/Lu8jw2AFEu8LwBldi1K+A
         +gC2T1WuBk6tvcb6wrAHoxiKSj2uA6QCqzFBFCWPR1h0d84Z3UxP7EdrqHZEz9LvByEd
         3b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700309500; x=1700914300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X26+8wItEuS2j+BVlRHOHS9xadXwL+/+KykUmMySayM=;
        b=Ow6ha+GQfdchHzJbdCx0YPrhRq3vo5HsKg71P+Fta5HJ0h+0Nc7ajBHjCbHg/+PuCC
         06z8v+l1nknSRSaX3NsGdZ3A7hPtShGpPS4QD42lcot7K7EeBZj1DJyglWej7g/5bwFQ
         +0u2Ki08qNh5zqDUirMXLC6oCJd/QpXjqQbpLlJ8MKuqJn2EAtBz3Q/WtFk5CxmoniJP
         8Y68hDETsUYP4A9ZEhwoqo4Sdgu2gQwZqzLyEJsIR3CznsjEiN1vKFGcKurEiIwxSHtd
         Yro4+5Kam3NOyYJxOwjwYLIY5lCE+AIENDZsrCvXz9uXsaBtDkhNTHtfaoMW8aE7/pqh
         7FVQ==
X-Gm-Message-State: AOJu0YyqaPgHxPqR9BdyvZ3xANwP1GUovG3+euejkH1Z6QWcPetPk1A3
	3qxDuyA2qUs0LseQ6zQEMcJVnQ==
X-Google-Smtp-Source: AGHT+IGLxvdwaLZ1yldy4WcW9PMAbFmxHPdv6Cm6C28zixboGn42mU9hmlXIPyKPDkvuLAvK1UB2Aw==
X-Received: by 2002:a2e:8042:0:b0:2c6:ef8d:b49d with SMTP id p2-20020a2e8042000000b002c6ef8db49dmr2054322ljg.24.1700309499891;
        Sat, 18 Nov 2023 04:11:39 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c3b9200b00407efbc4361sm10955775wms.9.2023.11.18.04.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 04:11:39 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 18 Nov 2023 12:11:35 +0000
Subject: [PATCH v5 1/7] media: qcom: camss: Flag which VFEs require a
 power-domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231118-b4-camss-named-power-domains-v5-1-55eb0f35a30a@linaro.org>
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
In-Reply-To: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

At the moment we have some complex code for determining if a VFE requires a
power-domain attachment. Particularly discordant in this scheme is the
subtle reliance on VFE and VFE Lite declaration ordering in our resources.

VFE id is used to determine if a VFE is lite or not and consequently if a
VFE requires power-domain attachment. VFE Lite though is not a correct
delineation between power-domain and non power-domain state since early
SoCs have neither VFE Lite nor power-domains attached to VFEs.

Introduce has_pd to the VFE resource structure to allow the CAMSS code to
understand if it needs to try to attach a power-domain for a given VFE.

As a side-effect from this we no longer need to care about VFE Lite or
non-Lite or the id number associated with either and which order the
VFE/VFE Lite was declared in.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++++++
 drivers/media/platform/qcom/camss/camss.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8e78dd8d5961e..ed01a3ac7a38e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -278,6 +278,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_7
 	},
 
@@ -298,6 +299,7 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_7
 	}
 };
@@ -468,6 +470,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_8
 	},
 
@@ -491,6 +494,7 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_4_8
 	}
 };
@@ -658,6 +662,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 4,
+		.has_pd = true,
 		.ops = &vfe_ops_170
 	},
 
@@ -680,6 +685,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 4,
+		.has_pd = true,
 		.ops = &vfe_ops_170
 	},
 
@@ -840,6 +846,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_480
 	},
 	/* VFE1 */
@@ -860,6 +867,7 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.line_num = 3,
+		.has_pd = true,
 		.ops = &vfe_ops_480
 	},
 	/* VFE2 (lite) */
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8acad7321c09d..b854cff1774d4 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -49,6 +49,7 @@ struct camss_subdev_resources {
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
 	u8 line_num;
+	bool has_pd;
 	const void *ops;
 };
 

-- 
2.42.0


