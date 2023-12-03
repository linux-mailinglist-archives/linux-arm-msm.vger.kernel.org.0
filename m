Return-Path: <linux-arm-msm+bounces-3125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D0F8022EB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5975C1C208C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDF8DDAA;
	Sun,  3 Dec 2023 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z06945sL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11858E3
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:46 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bb8ff22e6so4838809e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602804; x=1702207604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CutiCj2Gbdjhjf4p8E3J7URGYQoAelVBh1hnzF3CKz4=;
        b=z06945sL4gM/Sis/mwXFMvEiQCiDbESsOuo6QYcugBV/RcupOufq9mpuxGgXusfoCe
         Gb4trAdPFc/UhA0FBGRQBph4lEqlPdFGk8D0tNhVzrevDkkB8eUiouyuW6XfMz0t/76m
         hCRhoQ5yU6AM7bZxbzBBN/Njm0dusbbdSLWN1S8qHLVe9FX7o2qANkXZhHv0xZ94yu8n
         Un5FU+JGldiMQu82+oJA+Ove7sK+GPcyFN649nWS+Q2EmEcwyVvzuUkVpQV41Lo6v6rm
         ke5VQeupy7h6G6ByMAF6IP9L0mLsw/U1b4HYqDH2EK9c7s9yATPPqRMijHNiKtvXFPKj
         jHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602804; x=1702207604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CutiCj2Gbdjhjf4p8E3J7URGYQoAelVBh1hnzF3CKz4=;
        b=DNY5zb1gHQNUGh6kp4U99Urc0GAxyQy+40GyRLdlrvCKI4ofxNbtxDqDj9XEYi0grk
         pb/dX5/oN1/jdj3NGCFdE1Z3wnQNvQXR0hWSGY7PuldJr5wXHxVLXCjbcotmcPosEOC3
         Ki6XubyaxPjZwv0JqxAS/qK4Fk7J6ROhrTHt9jXLXGlZq0M4x48yL1RZoJLsqfmQXMeJ
         +40UMkTERqItOZXQ+N+vCyogQSI5EW7t4xZHLqi+HbiODk6QkvL4c7pfp1t+PVNYDOHR
         4T3lhb3nmptJ+gqp00AIn9rEBTckNRjNBD6uT5iQJQzigpsk4XibkLsUnVDa9lwgidY6
         H5uw==
X-Gm-Message-State: AOJu0Yz+feF6rClPJDUk6fq6ygemD5KD74VhTyTibYUdWU2pQGQdMzp6
	2j0QwML2pRX2JYBVu5d7rN5wug==
X-Google-Smtp-Source: AGHT+IELMw8begnWYh1JEtImLoAtELXxBFAf/X/9fgbdLPplqzXs4SKOzVzWMZ7fy3T1VGTk+k7SVg==
X-Received: by 2002:a05:6512:3189:b0:50b:e6e0:cae9 with SMTP id i9-20020a056512318900b0050be6e0cae9mr1168768lfe.26.1701602804382;
        Sun, 03 Dec 2023 03:26:44 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org,
	dianders@chromium.org,
	vkoul@kernel.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	quic_sbillaka@quicinc.com,
	marijn.suijten@somainline.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/7] incorporate pm runtime framework and eDP clean up
Date: Sun,  3 Dec 2023 14:26:29 +0300
Message-Id: <170160265539.1305159.10276635989020703494.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
References: <1701472789-25951-1-git-send-email-quic_khsieh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Dec 2023 15:19:42 -0800, Kuogee Hsieh wrote:
> The purpose of this patch series is to incorporate pm runtime framework
> into MSM eDP/DP driver so that eDP panel can be detected by DRM eDP panel
> driver during system probe time. During incorporating procedure, original
> customized pm realted fucntions, such as dp_pm_prepare(), dp_pm_suspend(),
> dp_pm_resume() and dp_pm_prepare(), are removed and replaced with functions
> provided by pm runtiem framework such as pm_runtime_force_suspend() and
> pm_runtime_force_resume(). In addition, both eDP aux-bus and irq handler
> are bound at system probe time too.
> 
> [...]

Applied, thanks!

[1/7] drm/msm/dp: tie dp_display_irq_handler() with dp driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/82c2a5751227
[2/7] drm/msm/dp: rename is_connected with link_ready
      https://gitlab.freedesktop.org/lumag/msm/-/commit/aa1131204e58
[3/7] drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e467e0bde881
[4/7] drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9179fd9596a4
[5/7] drm/msm/dp: incorporate pm_runtime framework into DP driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5814b8bf086a
[6/7] drm/msm/dp: delete EV_HPD_INIT_SETUP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2b3aabc9caa2
[7/7] drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e2969ee30252

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

