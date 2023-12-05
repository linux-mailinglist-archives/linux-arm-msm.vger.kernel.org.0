Return-Path: <linux-arm-msm+bounces-3385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB08044F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3742814BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D020CA7E;
	Tue,  5 Dec 2023 02:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t2c10Jm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0970C109
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 18:34:10 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bf69afa99so2201201e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701743648; x=1702348448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO6nkg54Ej/DMmVgWcwfv8nG+4F5atkWpwzna13KQTU=;
        b=t2c10Jm7f3k+J+ZzQBSUbbMdn7YgFTp49LCJCX52v721lakdYojECxJ5reGed5ZUBd
         tj+ygbV94/vLTzH5tMWv1BWWXoRZifFmbZPAvmT7gxVsCYT3aMcrGYFmzQWKoWuR17+2
         VcM7E89Q2yW9+pWylkFangJfRX1k5+MqL7GF37seOLaPGp+GTipajOYOHqNCv6nT8baw
         y9Ezlhy9Cakh0GfZZ8Ja/zUwQJaKi6vxa9d0C42U0o7pIkCmdeROIEorhrn/BiQuQJTz
         OQn3ZLqxv3krwA7kClPToCbQ+Jqh+CDV/aaZVs1P9Phb2llmCZ5jg05DWUJU1MvlNaRA
         lzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701743648; x=1702348448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AO6nkg54Ej/DMmVgWcwfv8nG+4F5atkWpwzna13KQTU=;
        b=TDCJ6dY6AeBvwAvws0FnLkP75Sh9GFUNZrOORoK0jUaw3PsaR1TA1cSQv6Od9yssFR
         TeQErDuaOHD5a6/dmZNOZAyfFugHt9GzL8GFYcdGmrpnZWs6J0Q/9qAov+GJQDtcR87Z
         FPVVaqqyyuEMUYxcWBpIBf/WmmNyD9onfFeqvds9nBy4P1OAsJj3lE5M2sLNQZ613OhQ
         cnfmZkwf7y+LQPS4nE7vsy+17rl1bblZYvDlhloT6NNa8cj45OzddpX9zBFGqb4tdYDK
         t02eqtjqL5gJrGv69mZPkVpAmQySw8JckF35CSyIVnOFEz15jflIBKdy8mMiaN9LYW2h
         CilA==
X-Gm-Message-State: AOJu0YzxKgo4/1FZA7j9cnZAFaII8LTEzA2ADGyyO3Hp093i+Ed6+xaI
	6XjXtgIEvd58taUi6teVqPN5CA==
X-Google-Smtp-Source: AGHT+IHXqs6nCI5D1xPBsmc1ahRdMJg9G0hOTFi6khoWVdQBV85832EfGuhCOJhj1141+jxxyaBWaA==
X-Received: by 2002:a05:6512:ac6:b0:50b:fce6:1998 with SMTP id n6-20020a0565120ac600b0050bfce61998mr1140519lfu.83.1701743648407;
        Mon, 04 Dec 2023 18:34:08 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:34:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7 00/10] drm/msm/dpu: simplify DPU sub-blocks info
Date: Tue,  5 Dec 2023 05:34:04 +0300
Message-Id: <170174354266.1582017.5924036306070016370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
References: <20231201234234.2065610-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 02 Dec 2023 01:40:24 +0200, Dmitry Baryshkov wrote:
> The handling code also usually knows, which sub-block it is now looking
> at. Drop unused 'id' field and arguments and merge some of sub-block
> declarations.
> 
> While we are at it, also fix all VIG subblocks to contain correct scaler
> block version and drop the becoming unused QSEED-related feature bits.
> 
> [...]

Applied, thanks!

[01/10] drm/msm/dpu: populate SSPP scaler block version
        https://gitlab.freedesktop.org/lumag/msm/-/commit/46b1f1b839ca
[02/10] drm/msm/dpu: Drop unused get_scaler_ver callback from SSPP
        https://gitlab.freedesktop.org/lumag/msm/-/commit/07b852c91cbe
[03/10] drm/msm/dpu: Drop unused qseed_type from catalog dpu_caps
        https://gitlab.freedesktop.org/lumag/msm/-/commit/88fc981f8ef2
[04/10] drm/msm/dpu: drop the `id' field from DPU_HW_SUBBLK_INFO
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6876059d7edf
[05/10] drm/msm/dpu: drop the `smart_dma_priority' field from struct dpu_sspp_sub_blks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/01fc6c012fad
[06/10] drm/msm/dpu: deduplicate some (most) of SSPP sub-blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0fd205412e1e
[07/10] drm/msm/dpu: drop DPU_HW_SUBBLK_INFO macro
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aa83fa5bf6c7
[08/10] drm/msm/dpu: rewrite scaler and CSC presense checks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2b98aa1d6558
[09/10] drm/msm/dpu: merge DPU_SSPP_SCALER_QSEED3, QSEED3LITE, QSEED4
        https://gitlab.freedesktop.org/lumag/msm/-/commit/193838acc111
[10/10] drm/msm/gpu: drop duplicating VIG feature masks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/223fb06fbc26

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

