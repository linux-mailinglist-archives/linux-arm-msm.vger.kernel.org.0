Return-Path: <linux-arm-msm+bounces-4335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D270D80E4BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EEBA283570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A09B15AFC;
	Tue, 12 Dec 2023 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIwda+ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A88FCAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:17:43 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5d6b9143782so47545537b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702365463; x=1702970263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TVT/VN6qzSaiQZWjp2ufbT3HoEBo3Ldac4YHEG+4eFk=;
        b=SIwda+ikgYySKEMWaBiDBZm6yI8lS+G1P0fwd1IdHoJmYGDWhe4CrgI6xTseJ9rwEJ
         H8BSf5bvxcudWCGRTrWEmddzsOxQCr7uy8shMhmtnt1g+I0Y5feBIS2b9JKtQfy2bwcR
         E8rledbAkHuWA2y294lVKUJlrib2m+ZnhZ0A0FoSAydRM/RJcGlBiWoJdFm+5lKFTUpo
         a91T7464EQl8zWOv3r3JcE3w61Lx24BFsQo97K9GOGGaMwUlen2mVTkldIANapWV1O0g
         ubbOq7oZTPLCBjaJ8kop5rnH+UZ3TabvFsGp601zXTU7J/hoUwkwZez4d+NpxQeApkpY
         pzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702365463; x=1702970263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVT/VN6qzSaiQZWjp2ufbT3HoEBo3Ldac4YHEG+4eFk=;
        b=j0CxXVjMU5Mt3zoYnIm81Cti1idRZbnw+5OO1EU88evGlnJbwZze1AJBGDLHJlfRcG
         /+6Eyq11NKjJeUCjjyS37dDE32W9kv5YzktNj+GjjYMlFbUs2s9NbVilipTE3ZtKZkv3
         sJ/LyjOEqHhDfy5nxqdjqd6WuzhVE4tBYScLX1zWzaZja6HPKUxnUcVptj/tSDC+1/5u
         //0uBxQy7hzWVvDQQBfiFGO0gPfZSqhbo7LTAIPF36ku42K04SoOtUNW+ZX7CP55mSso
         qyKXZ1pbTTbKpd6smCsJPXdBneT6PCSxVh8WsWIgBu8DIghP7ifnZPE+OHUGBNHb9Cky
         CL6Q==
X-Gm-Message-State: AOJu0YxInS4VjlyVwDQjnKRKd1rbCwRjPmzlBLTQ9ZSTzoB1hchRMDL2
	2cE/FtS3RKImAeeJ9y6AzGBuEFLPXjQ7ml6i9h0gNg==
X-Google-Smtp-Source: AGHT+IGdY+48fFdjXN2QvKpKjOQibG0qDG90jwUmBOaZ1dBjjCo4WU08VY6Au/aVmWsNr2/iTZ+jXH8kXiKlsPNtwjc=
X-Received: by 2002:a81:5fc5:0:b0:5de:a315:b72c with SMTP id
 t188-20020a815fc5000000b005dea315b72cmr4968084ywb.95.1702365462403; Mon, 11
 Dec 2023 23:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com> <20231212002245.23715-12-quic_abhinavk@quicinc.com>
In-Reply-To: <20231212002245.23715-12-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:17:31 +0200
Message-ID: <CAA8EJpqOFMoWd8OEBMVoJVe619+HVjq2w+uwTJG25PT7mrJ2jQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] drm/msm/dpu: add an API to setup the CDM block
 for writeback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Dec 2023 at 02:23, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add an API dpu_encoder_helper_phys_setup_cdm() which can be used by
> the writeback encoder to setup the CDM block.
>
> Currently, this is defined and used within the writeback's physical
> encoder layer however, the function can be modified to be used to setup
> the CDM block even for non-writeback interfaces.
>
> Until those modifications are planned and made, keep it local to
> writeback.
>
> changes in v3:
>         - call bind_pingpong_blk() directly as disable() is dropped
>         - add dpu_csc10_rgb2yuv_601l to dpu_hw_util.h and use it
>         - fix kbot error on the function doc
>         - document that dpu_encoder_helper_phys_setup_cdm() doesn't handle
>           DPU_CHROMA_H1V2
>
> changes in v2:
>         - add the RGB2YUV CSC matrix to dpu util as needed by CDM
>         - use dpu_hw_get_csc_cfg() to get and program CSC
>         - drop usage of setup_csc_data() and setup_cdwn() cdm ops
>           as they both have been merged into enable()
>         - drop reduntant hw_cdm and hw_pp checks
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312102149.qmbCdsg2-lkp@intel.com/
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  6 ++
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 93 ++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 14 +++
>  3 files changed, 112 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


--
With best wishes
Dmitry

