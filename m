Return-Path: <linux-arm-msm+bounces-3360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B3D803E70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 20:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B887EB20A09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 19:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E934631595;
	Mon,  4 Dec 2023 19:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpEYJ7qu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC48B6
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 11:34:20 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so1472925e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 11:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701718459; x=1702323259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR9FOP7osfeybp7nocEf0/oeWGeApIfG0zb/HJjjao0=;
        b=QpEYJ7qu/uygyDyjKwJj31qe6URz9qJRjj+Eb8qDq+7whCuXNK5dQUipodU8L2j0HB
         ycP0+ZGd4A46U3jGQt2rUnuaCDwd6/8yz2ZPCGgV2xPPYQQyDyYrwBkC92C5fngQGvBb
         KjF9Mpo7qkI/QFV1YZTbhIGs0y8N71OxcelNJvfr7F+dpKE8MPcrk+c1//oEtUPf5lmM
         xeGCch3XumChS1ACbF0ZZ2kQXksOH0l9Q87h6pQuv2TpjAd1NnAp8C/VtRoF1ZZ9de2Z
         n3xb5EOVJMBCOOu6SwKpHl7sz5J4DfMjK2P5Wgq1quKu5niagVR+EajUPjF9o5+fSV0U
         l8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701718459; x=1702323259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eR9FOP7osfeybp7nocEf0/oeWGeApIfG0zb/HJjjao0=;
        b=QY7XF6XikBen+aQWSI+bGWtUnLA10ThtBnapdpaCTxxLUhj7K1wyczr2GKN3ektVbI
         S7X+7WfPQNzYfTkXEKVu7FQhKLc3JOe+4fRyRpuYC1kY6/wOVFTfNBf99SWf42Ixnr+o
         nwDricBh/VXnCY8P99GvZvKg5dCMRFElxysVeg1sNFowEVZ8gHDGR1E9wo2UAHjTVVuW
         wJXywq7cK+pddlI9tbVNs25lc4fD6l7n9IkqazMUDgKIaag08ugrQhJMoCAZcaWLX0ps
         M4GjHt90l3bQqKwkpYheGTuhjryry1yl9awIeSf5Piu+sk5Gzwl2qWSvMAvwWG5XG7IZ
         DblQ==
X-Gm-Message-State: AOJu0YzhQO0mt1TdAXIhfFSj+X2WZhG0RySKYktebxzHvyvdj4pHkdCO
	VHhiNG2sN+JYZU+WVrwqw4ug4g==
X-Google-Smtp-Source: AGHT+IHOmXl4JU0d0Bxq4l5fPTOsy3vUVBtyOQtd7qdMhfNrKvXx/vrAWXI5B2yerw2W4IfVhw+6EQ==
X-Received: by 2002:a05:6512:2803:b0:50b:f913:c338 with SMTP id cf3-20020a056512280300b0050bf913c338mr1436639lfb.16.1701718458839;
        Mon, 04 Dec 2023 11:34:18 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id j15-20020a056512344f00b0050be956ade1sm777798lfr.278.2023.12.04.11.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 11:34:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Subject: Re: [PATCH 0/7] drm: revert solid fill support
Date: Mon,  4 Dec 2023 21:34:16 +0200
Message-ID: <170171844607.100324.5132284596400452217.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 04 Dec 2023 15:13:47 +0200, Dmitry Baryshkov wrote:
> Altough the Solid Fill planes patchset got all reviews and
> acknowledgements, it doesn't fulfill requirements for the new uABI.
> Merging it was a fault of mine.
> 
> It has neither corresponding open-source userspace implementation nor
> the IGT tests coverage. Revert this patchset until userspace obligations
> are fulfilled.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] Revert "drm/atomic: Loosen FB atomic checks"
      commit: 1c0a80f160965c88f16e73ff69015db2f044c486
[2/7] Revert "drm/atomic: Move framebuffer checks to helper"
      commit: b881ba8faa5c7689eb1cb487ad891c46dbbed0e8
[3/7] Revert "drm/atomic: Add solid fill data to plane state dump"
      commit: a513f095b941e9e96196f04f11f253d763310c08
[4/7] Revert "drm/atomic: Add pixel source to plane state dump"
      commit: fe28421d4fedb90cadcef4932be0e8364f79283d
[5/7] Revert "drm: Add solid fill pixel source"
      commit: 5fb1ad3f5725c5c4d1a0c24ba4f82f239dc6878d
[6/7] Revert "drm: Introduce solid fill DRM plane property"
      commit: e5fba1ada1c1d676438138d815acd8f427a1eaf0
[7/7] Revert "drm: Introduce pixel_source DRM plane property"
      commit: 90422201f8f2b4e26ab7bd43b92786a11c1ffebf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

