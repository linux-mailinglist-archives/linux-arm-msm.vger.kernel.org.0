Return-Path: <linux-arm-msm+bounces-3113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5D8022C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F045B20A0B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEFDB662;
	Sun,  3 Dec 2023 11:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ej3FuKBz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93C7E3
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:35 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bee606265so759286e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602794; x=1702207594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vrRnlK++TVk2VT6FeBO/PnYsSt3drwvKoWii9XeVnc=;
        b=Ej3FuKBzqHG3pr6gDw/2Hb0pdan9keHBtmz2/INI7UkHL/A1N+BkZS7Yqv0pqSrWPD
         QFUJC+RcbXOu4MbqUi5OhVp48MwwQEGF3bnGu2WYZbYUluQXlp9nSIbbR05kUz6WqFk6
         o+M/m0O0znQOFWJ9CdW5UNyR4x8wackCSnnX1Hv+EgfDm7vUHYkoClKhaBYChI3IdrKU
         /zwd6j/+yq2DQowgqULzkMu9XWnSLOAWfytLE5AO70ImaUjD+xi2N0uNGKSZwbJrfr/A
         CafjP/FJquaTmGaD/h/IlU27L+vUJp/sxvSdDiegSl34u/5ks2RS8lxN3Hzg49N9jPEp
         NdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602794; x=1702207594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vrRnlK++TVk2VT6FeBO/PnYsSt3drwvKoWii9XeVnc=;
        b=Q9wC9uSyaM3N2pqjZNRFaaBVQ6tJmIg5CvqyPvVTRc5+vuyiGxl7RmHEZ12WZ76KOJ
         lLMrA1lN1/iTlecqOcS5HTG6ALzVIcBiT6C1+lxrEn4+BkDEOyrIO8X2GXC9V0VKWLbV
         wfyOjgHJuFVUMu93oVXmD77+pWUTgcpM9Pd0YKCJcEFSgIbUytkxwTVgHjYzF6aOVnM0
         mvwKbxitbfm09gXuGQia1j9PlhevFhI3zL2VyC+/7Y/+37h3dAW7BUUThVuSbTbgW9SU
         07rk12BiB6t2n4kwrRF5xSffRacUsTYiEnOx77TJVDW1Hx9AbbEVvtl4X+wqq63Ay79N
         bXyg==
X-Gm-Message-State: AOJu0Yxa/Q+tiLrlCqrzT5Ci0Xqy7x1Az733NXk1i/Qo3CjHYzjGHSg3
	T+XhNXXUL+FGvIo7dXGHXIImlsNG2/fMhl8EnMY=
X-Google-Smtp-Source: AGHT+IF8VFE8yHqpdA0lL2rONweKN2YoaaNJYPbP1H/4L8xmGbnzoQjpJq+kMoolwog2wQ5Wm5dbeg==
X-Received: by 2002:a05:6512:6cb:b0:50b:e427:a530 with SMTP id u11-20020a05651206cb00b0050be427a530mr1343544lff.34.1701602793929;
        Sun, 03 Dec 2023 03:26:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:33 -0800 (PST)
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
Subject: Re: [PATCH 00/17] drm/msm/mdp[45]: use managed memory allocations
Date: Sun,  3 Dec 2023 14:26:18 +0300
Message-Id: <170160265545.1305159.2501271853192928734.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 08 Jul 2023 04:03:50 +0300, Dmitry Baryshkov wrote:
> Follow the DPU patchset ([1]) and use devm_ and drmm_ functions to
> allocate long-living data structures in mdp4 and mdp5 drivers.
> 
> [1] https://patchwork.freedesktop.org/series/120366/
> 
> Dmitry Baryshkov (17):
>   drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
>   drm/msm/mdp5: use devres-managed allocation for configuration data
>   drm/msm/mdp5: use devres-managed allocation for CTL manager data
>   drm/msm/mdp5: use devres-managed allocation for mixer data
>   drm/msm/mdp5: use devres-managed allocation for pipe data
>   drm/msm/mdp5: use devres-managed allocation for SMP data
>   drm/msm/mdp5: use devres-managed allocation for INTF data
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
>   drm/msm/mdp5: use drmm-managed allocation for mdp5_plane
>   drm/msm/mdp4: use bulk regulators API for LCDC encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
>   drm/msm/mdp4: use drmm-managed allocation for mdp4_plane
>   drm/msm: drop mdp_get_formats()
> 
> [...]

Applied, thanks!

[02/17] drm/msm/mdp5: use devres-managed allocation for configuration data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/062aeadeba1d
[03/17] drm/msm/mdp5: use devres-managed allocation for CTL manager data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4c1f4c1f1b43
[04/17] drm/msm/mdp5: use devres-managed allocation for mixer data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1ad175c2c884
[05/17] drm/msm/mdp5: use devres-managed allocation for pipe data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/323e9a18d6e1
[06/17] drm/msm/mdp5: use devres-managed allocation for SMP data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/531d5313d934
[07/17] drm/msm/mdp5: use devres-managed allocation for INTF data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6de8288bf668
[08/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6f235e3d6b18
[09/17] drm/msm/mdp5: use drmm-managed allocation for mdp5_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/669afee4a17e
[11/17] drm/msm/mdp4: use bulk regulators API for LCDC encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/54f1fbcb47d4
[12/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_crtc
        https://gitlab.freedesktop.org/lumag/msm/-/commit/783ad6e6312f
[13/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dsi_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e79571e8708b
[14/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_dtv_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/93d6e1b82b93
[15/17] drm/msm/mdp4: use drmm-managed allocation for mdp4_lcdc_encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2c24668cc068

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

