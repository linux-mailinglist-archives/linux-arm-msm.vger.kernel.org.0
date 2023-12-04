Return-Path: <linux-arm-msm+bounces-3296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7D803631
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27FE51C20AA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF34925762;
	Mon,  4 Dec 2023 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ppjPukIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D671A9
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 06:16:39 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ca0288ebc5so12728741fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 06:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701699396; x=1702304196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6YMpMOZZj4+cuOxRYdI7nrhzUfHZl6j32N3A+bPyU8=;
        b=ppjPukIsy2D9jA7NMdYHS/I5CwKcNHZpS+lYFy9yzGnO/WAVAfUEtv61gaBF+xiXVw
         qGtBhA1Sm6lEE2WCxcl/vicxaKIJ7+/INAnLrpPqn+rfm+5cDtEQtC/g+CrzcIFYIiL/
         qoPGEfZWBY8f4dnpWWVH/a9ZfKfQRAZORRs5CTKH0lZ00mXcDBnApsXcTetZ3OAp4udL
         IKYrrZ08JaQm8vGL/dMF4tHgYapmDEN32NOlwfkYs7c3MsvjB9rIsWrUhRRcdfS5roTc
         LGADAnoUKUA2RF7g3agGTeaUlh77WF8jwY3IEZ5DV/+WvwxiZbU3WGXWLxOEKZpQDxdJ
         SOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699396; x=1702304196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6YMpMOZZj4+cuOxRYdI7nrhzUfHZl6j32N3A+bPyU8=;
        b=pSeH2s6IpC6n3U7+GwbST77DCjnki5Mf4cSoz7UwvO9Y8RvP3kT7AcDge/HwYxGIq7
         /22X5hmlO2viCQwibiCYBR3yUkeln9x5s2S1z9iybI2/z5trQBQ3TsgG0iD1TqmMXSWN
         I1tLdMjuJeS63sMXLm2uofnFWLh7TiRrizBG2PDtkRN1FGnc7tBxQ02YphgET6TQ6mUi
         04zc/fz9Bze0MukFo5E8RkZhlBgmxUR9D6IWS8pSuLRYrnOTf2T45i/iGFNFatlUdv4H
         gbAlLuq2D73AAOfaleIh7LoMCzBY5VmZacZfZKuXXzIwpigwkJhScuUQufHnTrwwZzn7
         eWHA==
X-Gm-Message-State: AOJu0YxMHwc/h4H6IvHylx3ffLC0BGUHMp9tdTOzjffjfSLBJ37K5+ur
	gC6pk8+zj33Q1zpPjO9E0k8bSg==
X-Google-Smtp-Source: AGHT+IHxlvjohMUpKehKwnggj+Lz3P6QMDf6Qpur+3rLugPmZ4qsdPayS5BHoKR4TzBjRie6bNxfgg==
X-Received: by 2002:a2e:7c0a:0:b0:2c9:f564:b414 with SMTP id x10-20020a2e7c0a000000b002c9f564b414mr1344885ljc.24.1701699396667;
        Mon, 04 Dec 2023 06:16:36 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 06:16:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v2 0/3] drm: introduce per-encoder debugfs directory
Date: Mon,  4 Dec 2023 16:16:31 +0200
Message-ID: <170169936702.76859.7909470270335421365.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 03 Dec 2023 14:53:12 +0300, Dmitry Baryshkov wrote:
> Resending, patch 1 needs review from DRM core maintainers, but it got no
> attention since October.
> 
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
> file (which contains per-encoder data) and MSM custom encoder status to
> this new debugfs directory.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/encoder: register per-encoder debugfs dir
      commit: caf525ed45b4960b450cbd4e811d9b247bc2586c
[2/3] drm/bridge: migrate bridge_chains to per-encoder file
      commit: d0b3c318e04cc6c4e2a3c30ee0f6f619aa8d0db5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

