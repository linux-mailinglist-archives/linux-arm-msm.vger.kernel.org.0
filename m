Return-Path: <linux-arm-msm+bounces-42133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF19F18AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF19E188EBA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A526A1EF08E;
	Fri, 13 Dec 2024 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6QvBzq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97A1E883E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128096; cv=none; b=MJlZc6H22t4ya8liu+04VM0Rv+lJMI3RM+/SqOkzWQGEAkUKmlBzwhxqdyyuzZmr4nVsDvPJEzp1SVrOg8YoBsdDuOvzoW/okZbBgpdyGdljAvs9MUR5wj+rS1hRmpc49I2ca3nzqZUHZyOLqNmoQ7whqcAPfpQa2PTViqDhBs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128096; c=relaxed/simple;
	bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dh0BxWrfFS3w3INwckVFIwwOPuU0FQn2VEqOFWXd8NamoXqAuVO6I2g02SepF/Zpv07dn3iZIFhYD8S/pr9QrdBxElfLooOgUWnVLRj3otuiLolq5UJsy2Yb0NfNKF6MWq+wIuWbHkAUrhr90PJ+Jfq0+I9lSB9fy+bleyOaFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6QvBzq9; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so23514751fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734128093; x=1734732893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJtZSquB3HDfURhgGFlz2CXT1G3f+2UMa/dHSyFOoPY=;
        b=q6QvBzq9KMq/0PIcKkMDN2jALScm2o87qfRdeoL6HJ6XzoBuE+VwAIBCaUzEfgGrI+
         LyKWEmYfLcTb3EfQJtq7wwlXjj/Loes+3fIILuS89Z9EC08EV4qyyYSb0SW8pq1YwYsu
         dO49RgS8MA2crSKk8i9udqABTw62Z1ex1o0Ir6TpNMVMdyxEutOhYuUtOAkiUmcNiKLL
         YQnyzNLvMEkjs9jQu15OEW0jpiA9IbanwbWbcAxww2ffblSLiy6VKAv1dRg1QVaJiztp
         X+/9gDZmRVWgybcq0DW3MLZLf0IATFzETMjdDoBTVTOFF3DzVrkQOHsqbKTDXgG6BPmn
         DROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734128093; x=1734732893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJtZSquB3HDfURhgGFlz2CXT1G3f+2UMa/dHSyFOoPY=;
        b=som2vQ64oIHkFGLcgXfeBzvdALJXGuhzcmoOo+1d4l4d2dKIUTLUxyAV8iajdixlTK
         20YXnpCBOdkGUYCw/t8p93F66wRjqEJzVthdjZ6yQTyIuxmbEw6M7VXqOnMYS4IdUTPL
         VJjsojXrdxUSfUkwv0Rfy/7ZyPN7Nm7+MPFbO0aElojGpIZvVXK6CB6DijWfg0wi/AWO
         +RXQp75N5VAbXKNJ8eXthW0EUAuXgmSz0RcLb5+DyKG+OcRgxFxfhFnha1d7CB1GaMFm
         WSaKzT35+FyV8Rgar1WpvSV58Za7Vg0oCtoCe9ePUI332LmnB+6eUUo1BDyzNrb9EuyO
         1AFQ==
X-Gm-Message-State: AOJu0YxqCm8ERDm5Kg0JycvHJ9hEzcdMQjODSolds5LwNy6lwwEWy5iN
	BmLPn987BUvniEV/RejYhgWnsMezFNGQCtUIpYF/ZFCHCfcx0xQbePvzNQLqR3w=
X-Gm-Gg: ASbGncsd/LOPf4FFf9dHZtzqJmjzhGpw3voO6CR8poCQhffTEC5JFI+VqwPhvabFCF0
	yiHIdbDUaVfG1rEwB5vTPpUE9W6z81G2B5As86OzRMCUKtajRaNqtKf7dRMKUNgBweWIw95Unxz
	NHSjx49Sc9Sco7xsrtziumI+08Vajb+5y5DqUQ8iljekLPeaQN3OHwSjJ2Pa3c/F3Z593w7vaGU
	cLXb2V/J8GbaM3iUi/AYv7Bwd4NmPed3y615pvCvJhaEzvv82fh0ew3l9suZTnc
X-Google-Smtp-Source: AGHT+IGF47gos/KbiTRq1zUJvgHRDw8jwxMTDLYzMLQc/JkhDscH+dB7KQj3SsT7nqTQ9hGXODrHEw==
X-Received: by 2002:a2e:9e4c:0:b0:300:322e:6a with SMTP id 38308e7fff4ca-3025456006bmr12271731fa.23.1734128093003;
        Fri, 13 Dec 2024 14:14:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 14:14:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:23 +0200
Subject: [PATCH 07/35] drm/msm/dpu: inline _setup_dspp_ops()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-7-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHE44BVGOKLQjlDQFY3advOwvZSm2J1OY1AG
 XfXgAAhpt+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1aB7B/sH1wn/y7qCaV6CgPzDrhgCQVXvSEKI+LBsjMOQYP75lbHYEr5Xf02HQQT2TTUbDIdlcss
 vbOsD+bmAYfX4pZyK6AwVZBDs2k4dwqEfCrLI9jeYK7qUi0jdmqe147Y+Dm3Gy2kncoK8+9G/Yk
 LFfWe/jMiGbDPZ7XO5NV/nlkCjyzdo2onOe5xNoeRZEeqSZJf1K5oF1RrcI4GUdGuKJLIHq9pfu
 l9xURiyRwvJh/avQhfKCd7uuEr2gBtKv8yJ0mFqe1GhtQhMGGFSeML5LZPEKhpGnPrMjjsbPf9k
 sB12UeoRn967bJoMGYGzj3XCLkKw9uj7wXC37YgWfuPMZDGU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5


