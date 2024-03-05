Return-Path: <linux-arm-msm+bounces-13308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B08711B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 01:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5175CB22019
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 00:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D5A2563;
	Tue,  5 Mar 2024 00:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGQT53mP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13808ECF
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Mar 2024 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709598495; cv=none; b=Al7xj35mFw5WpjZI8mRxTlRQRlzAzv+uosbTuZRZgBoMlrX3JEykjSpUdekj+IbGogm0GGjfc09sbzUbr6JspOrjJZqW1mYufor5yj3fotnVAByvzndqp74FD8PvfeqLGGnM5VuaGbz7KPW6gOeloQQ9aCK/kCWPyH3YTnQPKIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709598495; c=relaxed/simple;
	bh=8Cokf3nYD8swIHp4wEIbRUe8qqDJK1JRVRTIDl9Z6LI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dGV3hiWWHXHmG7Cmi2pDYSmcxKttaPKaWcNNSGwXKQmBbWW9352czsmVxq+rrFXk8IT1BAyU83yWYMtBlw6PeAVKWLgZ4gG916B1muBIardDRh2fyyWEI3jwE6vmCj6rsNttpoBoqujcnCyDyyvYrRlqoumuoySjXVymrKbjVKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGQT53mP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5133d276cbaso3593618e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 16:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709598492; x=1710203292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr6wCNfPCWT62O+BkzsYtFI7aI+vAwjbi8UvrqmJnMk=;
        b=EGQT53mPaHx499H6GK9f6gADAIDQ2JWLzqTWowO7NEI7zc5sT3ReIegDn9jIMKT9xv
         qVsxqP5tQopgzs2gBMJ2kuDh7n/oxkArvPFAy9x7sj9eSDhVGUE7NlhkI+ckuOxBL1kS
         QHWK/RAvvi6X/3WarMpXzY8yZcUOrfV7gb3CNl6Xqy+g0EpBuvUaYUiAYIsUUAypUk27
         B8YJfnTOL2Sf29cZAgCS943VWtkfOZAfevCVl1sEorYruDChX9seRs5SwWa08zK1eckv
         4K1GAN2EasIOnVrpZCF7PBSTFrXlXJD7fyM4QSotTStOjdgx+NzEyaga6cL9CQicJfPS
         4p0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709598492; x=1710203292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xr6wCNfPCWT62O+BkzsYtFI7aI+vAwjbi8UvrqmJnMk=;
        b=HfLuIT4qAu09e2vW5IaR6NjGw7wECoS2yoDEb/2nb4sA6L4CVP704+XqnhcFncicgY
         BksauxsOoksP1l5WkFOtPZDg8vIsufsyfLV9OWoX5wNhu+g+GiVIelM7ERTY2rsv5uGD
         PdMUfDQLToUj4wiU1/JCDLHCWCrqzUHH+YJrPZT2IcwSjpofk3dN8rloLtTxU8Dz/x44
         Gif2PiBMZ41haHvKqP+oByy5ifPTXke87TVbrLJOonpqc9OrXQzOnahRuBpMOk8fk/z6
         REPOhCQmGSS6RFwnNfzJap/UXfE221xhjpztnoy5B6ZzK59x0n/0XqZdKVUHY+JproP1
         mB5Q==
X-Gm-Message-State: AOJu0YyG+UuRvLMwaheEUV5Gij4YsN/sbfJtJcXdbfQBy8hKer5YqNOI
	rPPOwz8sfP9CeYjV7EKSg0fP7d1DaM8/9E24ORqspHQPvVORpzin3RdZc9EONdw=
X-Google-Smtp-Source: AGHT+IEpVKRUi1hJu8a/8XKiX0WCgdeworthxvQWON2xS5SR2ABish/KNB9qVAXfHDN+7CkXvRAV7w==
X-Received: by 2002:a05:6512:1243:b0:513:23da:9766 with SMTP id fb3-20020a056512124300b0051323da9766mr231986lfb.55.1709598491832;
        Mon, 04 Mar 2024 16:28:11 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s15-20020ac2464f000000b005133d11b261sm1149416lfo.92.2024.03.04.16.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 16:28:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Paloma Arellano <quic_parellan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	seanpaul@chromium.org,
	swboyd@chromium.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	quic_khsieh@quicinc.com,
	marijn.suijten@somainline.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH v5 00/19] Add support for CDM over DP
Date: Tue,  5 Mar 2024 02:28:09 +0200
Message-Id: <170959846405.1203069.15666159691656225354.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 Feb 2024 11:39:45 -0800, Paloma Arellano wrote:
> The Chroma Down Sampling (CDM) block is a hardware component in the DPU
> pipeline that includes a CSC block capable of converting RGB input from
> the DPU to YUV data.
> 
> This block can be used with either HDMI, DP, or writeback interfaces.
> This series adds support for the CDM block to be used with DP in
> YUV420 mode format.
> 
> [...]

Applied, thanks!

[01/19] drm/msm/dpu: allow certain formats for CDM for DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/32b6ff95b912
[02/19] drm/msm/dpu: add division of drm_display_mode's hskew parameter
        https://gitlab.freedesktop.org/lumag/msm/-/commit/551ee0f21099
[03/19] drm/msm/dpu: pass mode dimensions instead of fb size in CDM setup
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d6e547c091d8
[04/19] drm/msm/dpu: allow dpu_encoder_helper_phys_setup_cdm to work for DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7cde7ce5be3e
[05/19] drm/msm/dpu: move dpu_encoder_helper_phys_setup_cdm to dpu_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0ab07bb96826
[06/19] drm/msm/dp: rename wide_bus_en to wide_bus_supported
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed77f333bb0
[07/19] drm/msm/dp: store mode YUV420 information to be used by rest of DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b30d1cbd4fb
[08/19] drm/msm/dp: check if VSC SDP is supported in DP programming
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ab2f8603e22e
[09/19] drm/msm/dpu: move widebus logic to its own API
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1cfc64a6ea55
[10/19] drm/msm/dp: program config ctrl for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/683d374582e3
[11/19] drm/msm/dp: change clock related programming for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6db6e5606576
[12/19] drm/msm/dp: move parity calculation to dp_utils
        https://gitlab.freedesktop.org/lumag/msm/-/commit/09b27a482a18
[13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/55fb8ffc1802
[14/19] drm/msm/dpu: add support of new peripheral flush mechanism
        https://gitlab.freedesktop.org/lumag/msm/-/commit/64f7b81f0358
[15/19] drm/msm/dp: enable SDP and SDE periph flush update
        https://gitlab.freedesktop.org/lumag/msm/-/commit/21497a463347
[16/19] drm/msm/dpu: modify encoder programming for CDM over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b40c8377d792
[17/19] drm/msm/dpu: modify timing engine programming for YUV420 over DP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/57d6ca4c1917
[18/19] drm/msm/dpu: reserve CDM blocks for DP if mode is YUV420
        https://gitlab.freedesktop.org/lumag/msm/-/commit/984809d85007
[19/19] drm/msm/dp: allow YUV420 mode for DP connector when CDM available
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ee2fcc0f514b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

