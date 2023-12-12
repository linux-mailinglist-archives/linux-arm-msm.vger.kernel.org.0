Return-Path: <linux-arm-msm+bounces-4337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE8580E4C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 239461F2287E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC8A1642B;
	Tue, 12 Dec 2023 07:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZpcYCXpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2698EA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:22:30 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-db979bbae81so4021050276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702365749; x=1702970549; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ChpZ3DTwNnea6UJpvxUIWDuGDG5RPxpXSi/vdcH9wOY=;
        b=ZpcYCXpgaS0nLQFxj/3wp6tAftsFVd0CEzfOPnlaR/GrEqnIPtBsJec2JoqMsk44ep
         oosVvQXEQRVOE/ykM8EkFwXRq226cCCc3pQjoUQN8VllJWMMhL1Q47Y+qauUqeJDCeKY
         /ekJ83lOPjkG6NuBOUGLUOhXEZUtenkmEVxMOV1gUgYGcl0d9ZzuJnZS4BJr3uueFGRB
         BKgeJ7jFX6yF7worWF9po6s3NHDLIKqmnSn7lAg7likcYicw4X83zmU/Y+3ASAAgPptX
         L0HuU5V9tUv/t89lsh53Uj1ZWL63CJU4pz2zO2Y6lAQjgjSTpPSamD7o8AMEl4+A1VtC
         MX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702365749; x=1702970549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChpZ3DTwNnea6UJpvxUIWDuGDG5RPxpXSi/vdcH9wOY=;
        b=wWbi2SWm2N4zeou41O/rz/97rpNffqwhD+zo0wGbgvutoefokq98uWFOIIP2ZeqQFf
         nWQ0cYzgaG+3dEWxPbVAK5OyjlUrIMIYjLy/g52j8FiqvP4j+c6IC92DiJiCNZyBC0YO
         7DMrMeRGtXfsNRvDf0RDak4gG/ZA7sGI4OgPabgb9irKUvjJ60R6L+Xv0Ck9R4pZ0Ic/
         fKtYkmoCLe/bEUt6gQ3Q8TryQJZKVgqqYFKSkiLJDVspQ/g9wOcrYQdsop0e3kFg4Cc+
         NImOtHITAv5JI+7H2nh6AYR1ski1os9OQm9Fagt6rqBX5BVA4qAVaMYlN2naY5cV+PsA
         Ii0w==
X-Gm-Message-State: AOJu0YxIb9vkdE10kpJ1nLXtH0AdU64Wz2O1g+iVxWFATqDZq/oBnm3D
	4qeuCr/t36xdPjbMk0md8emU06tz0Mww/gTo8MKqmw==
X-Google-Smtp-Source: AGHT+IFPR8fd+a0ocBEqptE2Dwxw2OhgvjQgzcLmo5cYSUTDyVSX6swyFuxqgUbNPyfiI+F4JCcixtPa397/UgVjePs=
X-Received: by 2002:a25:2653:0:b0:db9:8bcd:a071 with SMTP id
 m80-20020a252653000000b00db98bcda071mr2411598ybm.28.1702365749111; Mon, 11
 Dec 2023 23:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com> <20231212002245.23715-15-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-15-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:22:18 +0200
Message-ID: <CAA8EJpp72_Qy5Lh+bq4Zi8_DRyhCf48gdGRz2fiZvb4y7qb4SQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] drm/msm/dpu: introduce separate wb2_format
 arrays for rgb and yuv
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Lets rename the existing wb2_formats array wb2_formats_rgb to indicate
> that it has only RGB formats and can be used on any chipset having a WB
> block.
>
> Introduce a new wb2_formats_rgb_yuv array to the catalog to
> indicate support for YUV formats to writeback in addition to RGB.
>
> Chipsets which have support for CDM block will use the newly added
> wb2_formats_rgb_yuv array.
>
> changes in v3:
>         - change type of wb2_formats_rgb/wb2_formats_rgb_yuv to u32
>           to fix checkpatch warnings
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../msm/disp/dpu1/catalog/dpu_10_0_sm8650.h   |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  4 +-
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  4 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 37 ++++++++++++++++++-
>  6 files changed, 46 insertions(+), 11 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

