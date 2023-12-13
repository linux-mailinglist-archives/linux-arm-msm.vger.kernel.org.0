Return-Path: <linux-arm-msm+bounces-4488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8CA8106BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CE31F21472
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D032ECA;
	Wed, 13 Dec 2023 00:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnm+Mgi7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296D592
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:41 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso8404825e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427859; x=1703032659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kQL2rxxtU6ZqGF3kkJ7FtuWnnVIqW0dOtdXf68LvUo=;
        b=nnm+Mgi7KDyS4HpIcHQzcJdW8nHH1W+ltwbVxR+mxLhyNa8ygeFkR/ZoHfYs+AWDJa
         lltfe8ZJ58V3EDQaqqGWKA/XMbmhsiZyIMd/OY2Y/fHcWaqnb2BxErXbdUeF8Kp7SB2z
         FN6od27p0MkV8tNRx8LF/lgALxBgRFij9/VVj1mF0pihW5OCgz4wn8zXjIGWdz8jGCeG
         XL9E3SnoTSPhVJYlT8Gh++ROpp3heC/kF9sr4pozQl3mJGQw3e10bNg+OTm+UbRppc3/
         a4qMLwjKv6McowkVNBYaAMne+BZVhaOeRXF1PcrKaIgRh4Sg7aH5FkRdHe5uRpIT4Z6+
         lmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427859; x=1703032659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kQL2rxxtU6ZqGF3kkJ7FtuWnnVIqW0dOtdXf68LvUo=;
        b=acG0CwP8Hw0v57z+WPj0EkYppWNxjYZZF0sGb9VuGoJ5ZiKIbN9MTAl4KnaRY55LDC
         pLP4lzGgxl1CUlcLP3vVTc9aRE7kwB9IjcR+fos+aivlXK7f6pCNmAE506z3e2VUavLE
         hz7b0YxHwjaTLwEmmudU8FStGsL+wiuKJet9qxCnfia7VN/H4czD2TEEuHC0xZ1OnBQD
         N0a5QttQK/JPqqwIUf9ADTmqOzwmvHuauGFDrSY/N5iiBFHsR2Fv2LkkVbkKMtfIBPl4
         GDUPQKqjibF3EHgh0iFrTaVGjigDl+hfmzTYLYLbiPpxaHxRaIFhkdr/UZy4DShK29HW
         vCNA==
X-Gm-Message-State: AOJu0Ywg15rKWIQdEEmrcZq8JQcwGEQJ3vUbOid19mim/0+ls1BuTRs6
	bjjQhTADHFiPnGvfcDqZel9/oQ==
X-Google-Smtp-Source: AGHT+IGXPoA41I0BeZ+J6HEbmKKD0z5ZIW1yCJgAG2OvV1WTkG8SWE/38T/y7FpHusfK3EzYJTbQWQ==
X-Received: by 2002:ac2:5629:0:b0:50b:e8d5:b0c5 with SMTP id b9-20020ac25629000000b0050be8d5b0c5mr3123443lff.56.1702427859254;
        Tue, 12 Dec 2023 16:37:39 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	seanpaul@chromium.org,
	daniel@ffwll.ch,
	quic_jesszhan@quicinc.com,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 00/15] Add CDM support for MSM writeback
Date: Wed, 13 Dec 2023 02:37:32 +0200
Message-Id: <170242755503.12964.7542283136658448015.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
References: <20231212205254.12422-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 12 Dec 2023 12:52:38 -0800, Abhinav Kumar wrote:
> Chroma Down Sampling (CDM) block is a hardware block in the DPU pipeline
> which among other things has a CSC block that can convert RGB input
> from the DPU to YUV data.
> 
> This block can be used with either HDMI, DP or writeback interface.
> 
> In this series, lets first add the support for CDM block to be used
> with writeback and then follow-up with support for other interfaces such
> as DP.
> 
> [...]

Applied, thanks!

[01/15] drm/msm/dpu: add formats check for writeback encoder
        https://gitlab.freedesktop.org/lumag/msm/-/commit/100a72bdb03f
[02/15] drm/msm/dpu: rename dpu_encoder_phys_wb_setup_cdp to match its functionality
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e1e59787d7c8
[03/15] drm/msm/dpu: fix writeback programming for YUV cases
        https://gitlab.freedesktop.org/lumag/msm/-/commit/545979247e5d
[04/15] drm/msm/dpu: move csc matrices to dpu_hw_util
        https://gitlab.freedesktop.org/lumag/msm/-/commit/636d1d4dfb24
[05/15] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f8bc2bc3a673
[06/15] drm/msm/dpu: add cdm blocks to sm8250 dpu_hw_catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9b61ea803a9a
[07/15] drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block
        https://gitlab.freedesktop.org/lumag/msm/-/commit/faa729ee2e48
[08/15] drm/msm/dpu: add cdm blocks to RM
        https://gitlab.freedesktop.org/lumag/msm/-/commit/059bffe7a88d
[09/15] drm/msm/dpu: add support to allocate CDM from RM
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a324c046bb7d
[10/15] drm/msm/dpu: add CDM related logic to dpu_hw_ctl layer
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d7a329684b77
[11/15] drm/msm/dpu: add an API to setup the CDM block for writeback
        https://gitlab.freedesktop.org/lumag/msm/-/commit/055376f936e8
[12/15] drm/msm/dpu: plug-in the cdm related bits to writeback setup
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1364a52a9a77
[13/15] drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8142ee18e902
[14/15] drm/msm/dpu: introduce separate wb2_format arrays for rgb and yuv
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a074ca909811
[15/15] drm/msm/dpu: add cdm blocks to dpu snapshot
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c86495429c4a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

