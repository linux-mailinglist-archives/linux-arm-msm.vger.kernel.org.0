Return-Path: <linux-arm-msm+bounces-8356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBE583D02B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96EA3B2905C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A48125BC;
	Thu, 25 Jan 2024 23:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gWdpHtEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67D125BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223760; cv=none; b=Y9fbq7oyoApakxMODhXc+Js1TKelkyRhP51y30TiFcDUynvVUOiz88sK1aLFMU9KJwjzF6OZ+Ax267dm7plMpFERx5VwleAYShOmPu7OEiUSHjTfK7gndhL28riQwe+CDl77Zu89v6jXyOTLBijltjeVnv4erKr3UWzLlWiU/Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223760; c=relaxed/simple;
	bh=mPuJ0sdVtb49CzPgC03wOi5IYVOAPxO/LgrDoWoA7+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdOD1HCF+Q1sYVrHwVBCg91t1j2/ov2EtPY7AG1Wpg2orBy6XgX2zYrOQ1DGw8FoNz/KdupbAkq607uGflYHG/4SICA+J1IBUaY+FyOYOphj0wuG/WHl44DVJWlEZkkZfxa+1zqE3s7YXF0u1KKJxZ3CEfGrfM29SdPN8DmI+WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gWdpHtEz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51022133a84so817328e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223756; x=1706828556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
        b=gWdpHtEzndZFlUsE5oeD94KYmQpJLB1T+5smsR1kGokpz98VY3Bye1lqIzIhgazrd3
         WLpQ05melVGqygW6/+7aaCzZ/DQvBQ0zndn+NLWO3WBu6EXofwteJuHzDDxeA+GPtYs/
         1vxcaGIT0CWp5tJWoeKlvISC/1qxq4H4bwlKk2+fw2LCJTdvAVcZy1IAbha4klZB0Qvp
         URAtyykO8pQXrZks4NOkwgUibIhaOQFDAmJ0YicNrzuO4EMgpFVKazMcGM2NZzKn2Ot7
         LdsJIc1T4RXAEP9CQuKxfruusRnkwPSs6HIxumAnbzQ7bJSHUsFn38UTcAC2rf9YgDh3
         J04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223756; x=1706828556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0o+ygDvKgdzg84z/yGD97dQg8nwAd++RNbp4iSd1H4=;
        b=GiB8X5NRzAkoTjYQCH3lcrVTwLnoeEDd4neynIvnIbgY+88xxA+X6mIe463Zf9iKV/
         MJoCR8WJJuJAQPsSOK9Wd8vF/0Oxk2ujwvVhIoFa15ff+/hcuc2Sh4rUHfqpU7R/PW9R
         ZIyvjaWXoooZaA+ot84g9/WkyMs8dvenI9JzCMbgRJ1S1qoJs/EyHZgvKU5QY/UEGwwc
         K6IHNe7KYPNUE4qT7GJ3MCmdDgNPxyHrxKo+uBZumIrKfg8QhfaDCBHL97MeRib9qvDE
         gcKj22MYDpwgkD0f15YSst56Yno/BCDArYCDe6Yz6X/P51TlYm52jR9lBoPKZQE8LC5v
         ugAg==
X-Gm-Message-State: AOJu0Yx5SSeSFWGad34Fpxa3pu+z1i7GAeDb1Gjt1L+h3q1n5QfKa9Id
	JR14J6xxpIMWI5cuYgnEGjy3oucChxR8UprjA9HcA2+fEuZ1AopSzkd37CeFxtQsIxqJnPRri0a
	g
X-Google-Smtp-Source: AGHT+IEuKmhBr7IQo/zONLid7ms8H0qa0G0dcB7qK4RFRuOeXXZWP6ac2gg12ffU5Lm3+olFvIF6BA==
X-Received: by 2002:a2e:9b1a:0:b0:2cf:1920:97 with SMTP id u26-20020a2e9b1a000000b002cf19200097mr344865lji.12.1706223756527;
        Thu, 25 Jan 2024 15:02:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:31 +0200
Subject: [PATCH v3 02/15] drm/msm/dp: drop unused fields from
 dp_power_private
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-2-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiGNAr46NZ1w3CBIbbh0cMys0MRlrs8ZNB9P
 X47yQghQx+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohgAKCRCLPIo+Aiko
 1eIhCACS3P/e/pspDDThYqBfabbu16Uv2umGS2kEE4M+SDXkVivOv2L4UIctr44vgx4crIZl3vG
 fNKhKsxM2WgzAvpeu0YgH2GjWOQ7uwjdZUfQprbKf5vrtdUcT6tz+PiQ9Vzg4sbbptZfpYPIcW6
 5WDdcn9IeBdakzfAxCOa0DNd6LiyfH/z7J8vhhksuVCtsXIjXdkmEEuSleiUtv1es1NKsaWRDe9
 hsG7K0ap5JdTQ27Zu8ab1Y8znqr6+uIqw1JDi1FMVrHWw8OO/FSE2gku1vYMDCfiWceGVWDjlcj
 vUmlmssgG+7PjfFh1vMbQ0WvIzA3o47fEU86H4XfhD3ZjjsK
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


