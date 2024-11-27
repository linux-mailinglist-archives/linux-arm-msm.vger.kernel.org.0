Return-Path: <linux-arm-msm+bounces-39334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A29DA99A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 15:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C148165835
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691AC1FCFDD;
	Wed, 27 Nov 2024 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECI5gxRP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013A1FDE04
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732716294; cv=none; b=Kc0nna1BlgUWpivJOPFguMk/2hHKBRr4nZByCCzp4SOXZn+i51TetKDDtsZ2uTBCO3GiYWrxgVg1eL7If5mKupX+wZgCtH6Hm7t5dEinHIvpJhHi83KYOURcInVcoqyfTxzpx4VqW1swfJd28N0ANHdiqd6+1MWuMnix4cyKzQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732716294; c=relaxed/simple;
	bh=QXlCwnR73sOvgJbeSLPKA0J+vuLe1Chwk+otkmp9zJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7nx9xGI2wPZlIGKPqehD/kruc0fcAfHVMxz6p4GgQavXo+dkV8Zg0qVdDOQHTHSF5UNnCk6Zkvc0CqhwKiZ+7rqH6MZgfdAQUb0J8u9A6M10ys9lCIA95kiwAOwgx74UhzxaBJNQ5xUlsPXL3jrw4OuB4d7nqp2v+nq7/4wZWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECI5gxRP; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd8b7796dso5535760e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732716291; x=1733321091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72/s2aAz5EY0mwh8LitCCx1LbBniPW9ZXzF/7Krgc0A=;
        b=ECI5gxRPpwXxGjLyLQweNvqZDb5m2lB2ea877nbSZ5N1euvpdKzFDbO8GAGMQd6hQu
         BcYGKD8pDM2NBy+H+zQDv+h1r21oV3JJ9fr8dWeQ/icocg+SGsvjv8R+PYMXwISpfTot
         z/A0pQ3mj9nxQYk+RBlsx5iFqUEYYq0oIOaxM2jCQgHo1IbLK849x1pISAN0s61qtgpf
         nz501oZ5FBjzAmt+oCWy/P+rjn4HJwvwLjiDETvj2CglfLCnPxeQ2TJ5Tu+treInUJPx
         moje7xs4++xYIiL8Gu9Jp+/0CC7v6MmdgoLiGt8/jVsip9fQx8hXvAh7L/HzpCyUn8Sf
         QzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732716291; x=1733321091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72/s2aAz5EY0mwh8LitCCx1LbBniPW9ZXzF/7Krgc0A=;
        b=K7Em9Pr1hsTyV5m9Og/DJOwHq9gczFgHQdxkbwvSPJAGY+YlqPKJmu2/8ZZUzofb0t
         A6GWCxoyVVvoIt+4zKt5H7GX1VX7E6txAm4O0fbh3nHb3YCuPrI6O9tcOZBf4HdiCWT4
         ngwyRUd0jJVn16g3E9iokmzHjvIJW2YhSA6MmX7IgFCTBzIqOmo7SOgOzXW86eiU1R4s
         bMZDDw6wzGyDjUPe4DW8BtezaWljafwH6gvqO816HxH0FJU5c90PzvNTw5r7leNUuMO8
         CtaJPzUdT+I6l7t6hGJ6L+SWKk1X5vmSLXJx/8bZHcUp2jmllrdKXofpLhGaQvuQw/Fo
         m/4w==
X-Forwarded-Encrypted: i=1; AJvYcCV53QuV7t6UJ2+4i7hM5LRkRK0Wy8P82QilD3KzMZit50NQZSLcE79I+WRR1V9MRP/azIArS6lwTgXbifAp@vger.kernel.org
X-Gm-Message-State: AOJu0Yytf85hhl2jqkmnm+CBZHSMbXjoQxD2B70ANdP6DyGWz19VgpB0
	UKw4/3lYWWEzDqPl/0UbCCySkJ+izYIMAJBSSMaGib1ouWG+PacqUzlxsW2jEbc=
X-Gm-Gg: ASbGncs/pCriBaABPuzrOfdNJJDKKnrUt8CCykS1P2FRgtpuMGS+OUOzbG/EyQGKKRM
	6zneH8X5pRHvJ1SPl1jCtI74FWSyvc8sHHbPrenozB+fkXaSTF9o3+1Nkyc3Bbf8I1rcNs0AMjZ
	00SzBeswTYtMpi6vEypWX7BtJyZhHkudQvepSiKyzP7a34j/vOb5dRL/ieG3mk/uwweczW9P7TO
	pwZC5wCYQgX4AV82UEJy2grRHOzO4PNy/WS8ixtT0hBUvUWvnQnpYzJAg==
X-Google-Smtp-Source: AGHT+IGF/QHYDm0CT+wA1NuP7NJ4YCS3p/mH8/g7Cx82llyqYFv5ATWtb43Nzi/a5RuKJ1xyN20SLQ==
X-Received: by 2002:a05:6512:32c9:b0:53d:e3a6:ae82 with SMTP id 2adb3069b0e04-53df00ccf7dmr1632023e87.14.1732716289138;
        Wed, 27 Nov 2024 06:04:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd44cb7c5sm2157291e87.122.2024.11.27.06.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 06:04:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Nov 2024 16:04:33 +0200
Subject: [PATCH v3 2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-msm-mdss-ubwc-v3-2-9782a7c2b023@linaro.org>
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
In-Reply-To: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2727;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QXlCwnR73sOvgJbeSLPKA0J+vuLe1Chwk+otkmp9zJM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnRybyC9Wz4xuhmvfGaHaKJ7PiP1FzhN+t5Et36
 EVrWeYMjQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0cm8gAKCRCLPIo+Aiko
 1dpZCACZ7g/CCQJyt4U5vHY+J2co9NFbwn6zfIj5RmiF/WDoZk6OzjGboFKXiHWKrNo0flIns68
 cehetRi55IUJO47IYj4eO3vMc4Wwt2rcaJYGMbIUatj7YxlZRpq+lDZhOjalHsrCN/2QINiDMgJ
 72IInEH1jK2eH+f6KJKmJd3fZJiaUnUMvvJh95nqQbMYlYRIRZ0EgpEaGT8WTYCQ/dUv29HhfSp
 ng/5PwLWdp9Yj3WLdFgB83ErB9x5Rjg38QNgFQ8g/mlQXCaLi7RIWCAzb7WrJEtu+7w1Jun45k2
 rqh3PiQOnGna9wr5LalvzgOmczJWNDKjYRHhMp7qS6bElAxn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow other msm_mdss_setup_ubwc_dec_nn functions and use individual
bits instead of just specifying the value to be programmed to the
UBWC_STATIC register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/msm_mdss.h |  1 -
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bb176178855cbe14386481d90bf70aa82be4d522..87ada64133924d712810c644a5ff660a082c2abd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,8 +166,16 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
-	writel_relaxed(data->ubwc_static, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
@@ -587,7 +595,8 @@ static const struct msm_mdss_data sa8775p_data = {
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_static = 0x1e,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
@@ -638,7 +647,7 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 0x1e,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
 	.reg_bus_bw = 76800,
 };
@@ -661,7 +670,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
-	.ubwc_static = 0x11f,
+	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 737ea6c39271ca85ab82b72914acb9781a7a2cb3..1714bb41b838c33f3da19d93c5c1f5c53cfbdbab 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -11,7 +11,6 @@ struct msm_mdss_data {
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
-	u32 ubwc_static;
 	u32 highest_bank_bit;
 	bool ubwc_bank_spread;
 	u32 macrotile_mode;

-- 
2.39.5


