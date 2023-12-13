Return-Path: <linux-arm-msm+bounces-4486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F08106B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 01:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7429C1F21D62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 00:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F71439F;
	Wed, 13 Dec 2023 00:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OBEQkK8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8BD0B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50bf1e32571so7428673e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702427857; x=1703032657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSCgKJVh7Aq6raN1kOP54ZRfx8NzvoUiUSv9wHSRjAY=;
        b=OBEQkK8q5O++ptSqr/VPPuK3IHpvLR33p0NtZCBPsL5MIq2hrTB7Lz3VAzrZJVVEsy
         15Lka98q/kmNM5nHfhizE4ly0KZOippi1xkz6MUOFsk4l/vUIu4oV558Xyj/36lMjfKz
         p9Ie3ab5VflaEU3yGhFKaUmuVgkNnHPDjKw6sZJ+urR4jfC3Ohzv4jRrstQtFvUzfn+4
         OcVRJzWbxtc48lpPG9k4jCGy4HypNEcIafgpcK8BoXPpXWrM3+s1KoZRwz9DZJjGtxE9
         ITEOIM63u65i6mj5ZiMk8ZC76O5JQqsJ1tAblDzOQ8kGe6ni7lhvb8DAavfw+wSXJs3w
         NhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702427857; x=1703032657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSCgKJVh7Aq6raN1kOP54ZRfx8NzvoUiUSv9wHSRjAY=;
        b=goBLUs+rFZ9Jp98HJ/FV6viQlze1xmyCCBNwVtKk1Tl2TkS0JIDT0HhzjP1L92Jo3T
         j2OjKkdbURtmAFWaDMhOsg9iUH9uWYl3Kx8wWdjpV4ZPgVN83ebATp44tbQS9Rsa1vNh
         miOl6LCPecc8ykpdB5kEy46XMauhRZT+RHUqe4hR9L4p5+Gbsl0EVRs4nJL4WSM7YCNY
         3aguHu2bl6aKFIglqg44Tv2LzDyyiwFsZpCcDTIX45yyywK+XgqlQPVjNZ4J2m0Ud1Nk
         eWowy3/crOQUM0UDtIJTt+SsU4Mxc38kpN7U7SWMWr3uoDt6BGMfiHML4FpU53kuG8+E
         +o8w==
X-Gm-Message-State: AOJu0YwsaRYzW4AhEmiPDQX8QwNEb5/0sQ55to3LhrteUaQCKgZub2zt
	usonSSr5lQOFlDL/xjiJ767NWw==
X-Google-Smtp-Source: AGHT+IF73nfm56nkB2mm650VJtqU71JG3ISCUoo3YLH1Caud8GmPxaBSrn51FVw0yj8hkxHfHPfmhA==
X-Received: by 2002:ac2:499d:0:b0:50b:d990:39b5 with SMTP id f29-20020ac2499d000000b0050bd99039b5mr3112617lfl.11.1702427857210;
        Tue, 12 Dec 2023 16:37:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:37:36 -0800 (PST)
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
Subject: Re: [PATCH RESEND v2 0/3] drm: introduce per-encoder debugfs directory
Date: Wed, 13 Dec 2023 02:37:30 +0200
Message-Id: <170242755507.12964.9347100992434762477.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Applied, thanks!

[3/3] drm/msm/dpu: move encoder status to standard encoder debugfs dir
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62d35629da80

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

