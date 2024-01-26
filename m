Return-Path: <linux-arm-msm+bounces-8463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F7383E140
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B6D31C21845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C247220326;
	Fri, 26 Jan 2024 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xEYCbb02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C520B27
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293591; cv=none; b=qAU0EBEQVFzbKeiMd0GZrkVthAQhYxKg1rS4W59NtAySALiCUZ8cm1vkxmKZdiNlFyB30ImcbjzF9TBReS0i7w36RwGq0PyTher2+TO1RfYeTombsDIWh0dJig/tEmx72pPahT557b1PmA/t0JrQP1ZO5u+QHkQp9MOWdgY+hqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293591; c=relaxed/simple;
	bh=mPuJ0sdVtb49CzPgC03wOi5IYVOAPxO/LgrDoWoA7+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auhPmMeu6lQYe6Sc6UIOPUPNzNlEmsTHpwItP6xN1/vfJxWZY169GF10u+Xyu26gs3OQvZnW+KqYE8T0xHJEeeXWHFX6TbA8bI+fXChTDXxu6Dy2y8MmyxjAj8BVXyzbb4nZlJliaJbidBWeFmovIo2uwuLaoS90Zzc/Dwe2N38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xEYCbb02; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf4696b90fso6662301fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293588; x=1706898388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
        b=xEYCbb02mTwA9uLKsfb7GFqmwkdHDO7V/L9G8Jk4tV2pGzCQdIX3fGnV1LqGb/YvGE
         /+V+qLifXPh2jUwVdJhFDb4u2+5qOJFFofv4v9D3DtrrZQ9AZELxH3syHkN27KcVwwR5
         U/Km0V41JiQKvKfODynZIoePCyNajtg/P7Hlo1jLpnBAJagJOWhkw3T2kMI5tx/HZ5zm
         Xn7B5xjHm9//AnnGZrPFlW2vacNWPr4IDwMrxoDe43XrP+DHcqU/lUXvdfH+qk2ioVHP
         i1VqzOZbOPxrU0nTfPlLq2xrDATnJgP6wBQC/8K8ZzSbnSHh3QEAOXDi4aIyZBrqTRIq
         5yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293588; x=1706898388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
        b=NChBbe7il89fPOeEUWKB0ETWeVvAqOcBcbc1UCqFGgL8CzJMsn6UOk31nIsU8IQJzr
         1MiqX08HMRl3N1nSAA7ej2PM9SlCxFKbipgefW84A8Z09mtz8tMxF9k7F0EGy2mbKy5x
         ERp70YXWhTVWNoJXusPQ4oehVrbftVXibSfJvj7LzAfb4StaBU+I5s5zDkNiXhJtKeLm
         E4i4yVYE8MUajlxERdauGq53wtcDn5HPm7K7xLQTK9oweYHA5tMDm7kuN1GQafHbVUGm
         EAaW11NZOqIQyk/Hv8rpdFbMkttUhfmDG7PfMaWJ8O/R66W/HqwUqsNcTtra3uenoavg
         gUKw==
X-Gm-Message-State: AOJu0YznsTxZMZERwAcx/iSPpInMOPO5laXgZCgoqFh9nTxX/CXQxWYS
	CZnmhtE0CV+VOuaTB6QNChzHonWgzI0WlrrqSipg6ZEi1xtPz2lMomLqc6zPApE=
X-Google-Smtp-Source: AGHT+IFiRKKpC1MmWIOnmeVOU5vtrhmk3jEYF1uhWYyx+KxUzzr21U3Wn8emuBWR1ul2mE+Khq00Vg==
X-Received: by 2002:a05:651c:8c:b0:2cc:6928:ee59 with SMTP id 12-20020a05651c008c00b002cc6928ee59mr124763ljq.74.1706293587940;
        Fri, 26 Jan 2024 10:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:21 +0200
Subject: [PATCH RESEND v3 02/15] drm/msm/dp: drop unused fields from
 dp_power_private
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-2-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=mPuJ0sdVtb49CzPgC03wOi5IYVOAPxO/LgrDoWoA7+M=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+rmn/5PvPfVfjOeuI1p7jcvFa+LkR/j2pj777UEZHw73
 3Hi3hS1TkYjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBM5BYb+xeeyqxS4R97TFY9
 aJ6ldumqBV9IZ4uk/TK9eFu+K12lcaYMr/+6rm3NS9B3lVY4PSFx1zPV405TjpR9532oY9i14n6
 y6V2v91e/7dznbrNc5cijwgctVe9rZf/P+C/md/nkHAUHT03VwB71e0szZexvHjL2C24OkDQT1V
 RiyPk0N6tzWn+U03qZ0oSfDFELuDmmpIsInfO3WDOjh/XzBK6rH5pkw1tuXXuoJLWN5Y6ioeeWG
 bz+s30WyOUyLLi3/f1EAQW1qCVP9TS4LJxCM1bcups7u13mjWOhwrYz61/2WPU2NTz5z3uq0Ukk
 MOzSJNW4ExbHuG+fMa/o+tz2cV1w23YzruUldY+knXoA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop unused and obsolete fields from struct dp_power_private.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };

-- 
2.39.2


