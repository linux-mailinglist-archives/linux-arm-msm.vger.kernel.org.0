Return-Path: <linux-arm-msm+bounces-6677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8B2827820
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 20:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FB3D1F23733
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 19:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F3154F8B;
	Mon,  8 Jan 2024 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ihxtPQbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C2054F8D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 19:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dbed4b03b48so1258906276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 11:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704740882; x=1705345682; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SM3aC6olapTfRcKgxOoQ7CTMu8MLMwnZq6KcPmvWqC0=;
        b=ihxtPQblgyUl5mkpU2abXMU++S4ZvzmCIzJiOeEjsGkqvDL2VcESp9opbwgrdka/9c
         b4GKTAC5wpLlLobu51JlaaREIK6YeOyHGGE5ugMrHOYpGv4tNxMSLjxTjrciQC0lpVXG
         PAfYWFuMXh6YK4ZdD49b4ANrtj0ASOnlRRfOeVDOGf1EK2Qg+4VypFkXqmmrw8MmQiCG
         G3JvEPbO9AXKl2fzTCj7qyJgdLYqOuWW8uT2cCahauv0Z4UAPtRvmneoi2x5G37Gm1cX
         /TqjqfFNpOuITp6tXs046JAqMHcQNl4WhwmVDSbpjiovA+VegVQbqwf8lXQXqcd6BT3Y
         D4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704740882; x=1705345682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SM3aC6olapTfRcKgxOoQ7CTMu8MLMwnZq6KcPmvWqC0=;
        b=uVl5lwIY4ACRFMn2KH31I/xxXBgBWCp5JxP/sSfuz/iQgZ1hjl8p2HKAqPNqcWpyK/
         R4pY0F/POKIeKPlwHSpWx8wxnoGO6FRM11hO77M3+ZQmcIKDWcJTXXoOJuWt8rKEzLqt
         1PAjZqMhmjCHuzs6C3zTNlFRwmrvdfhsDhCSZmH+vBAudV/qafqBtvqGZA4VtA8ZEv3k
         /yF9rra8/oZIHcRddPL7fBbjktuR9iHSgRT2+FcAqGV81lB8f0es08KaC1ky2cHSHNfC
         KbT6vGzMmrkC1YOfpNpYcyKV4+zh9baZsRrxpGrU8C0HHiDPcotKK8GFBrsCTYNYnntv
         EeOA==
X-Gm-Message-State: AOJu0Yw5PdGAEESWwaDPllRiYd8Oti5cI77wOfZwcsT6jFKSkmJsPICG
	mBNzQ1QW/InZ15E28uLynTZRneHVniodR054QzOqqj5sbx3ueg==
X-Google-Smtp-Source: AGHT+IFUDrKtN6+cLggfKBa01OY/UJnyibyg/gt78qguBxgUpnHsr3JF10cBom9sAGfl7XW03Vr81pUVakoZkhwEwFk=
X-Received: by 2002:a25:ce10:0:b0:dbd:d4ea:7b7 with SMTP id
 x16-20020a25ce10000000b00dbdd4ea07b7mr1916063ybe.60.1704740882574; Mon, 08
 Jan 2024 11:08:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-3-3d2750378063@linaro.org> <c8d6769b-eb28-337c-fa55-4dae86611da5@quicinc.com>
 <CAA8EJpoF3uKobGzjHbLMKYvcQbdqYzur7Mn1cNDPyc+wiiZ+SQ@mail.gmail.com> <9807bb4a-98d9-8f4b-b24d-0134f42f6cd3@quicinc.com>
In-Reply-To: <9807bb4a-98d9-8f4b-b24d-0134f42f6cd3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Jan 2024 21:07:51 +0200
Message-ID: <CAA8EJpqmkzOaewrW8tqSV5wz+0zovZx-kpMdVWp_nW_g1KrRzA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
To: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jan 2024 at 19:57, Carl Vanderlip <quic_carlv@quicinc.com> wrote:
>
>
>
> On 1/5/2024 4:38 PM, Dmitry Baryshkov wrote:
> > On Sat, 6 Jan 2024 at 02:04, Carl Vanderlip <quic_carlv@quicinc.com> wrote:
> >>
> >>
> >> On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> >>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> >>> index 50b65ffc24b1..ef57586fbeca 100644
> >>> --- a/drivers/gpu/drm/msm/msm_drv.c
> >>> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >>> @@ -969,6 +969,37 @@ static int add_components_mdp(struct device *master_dev,
> >>>        return 0;
> >>>    }
> >>>
> >>> +#if !IS_REACHABLE(CONFIG_DRM_MSM_MDP5) || !IS_REACHABLE(CONFIG_DRM_MSM_DPU)
> >>> +bool msm_disp_drv_should_bind(struct device *dev, bool mdp5_driver)
> >>> +{
> >>> +     /* If just a single driver is enabled, use it no matter what */
> >>> +     return true;
> >>> +}
> >>
> >> This will cause both MDP/DPU probes to return -ENODEV, rather than
> >> select the enabled one.
> >
> > No. The code (e.g. for DPU) is:
> >
> >         if (!msm_disp_drv_should_bind(&pdev->dev, true))
> >                  return -ENODEV;
> >
> > So the driver returns -ENODEV if msm_disp_drv_should_bind() returns
> > false. Which is logical from the function name point of view.
> >
>
> but msm_disp_drv_should_bind() is returning true in the #if !REACHABLE()
> case?
>
> at minimum the comment is incorrect since returning true causes the
> driver to NOT be used.

No. Returning _false_ causes the driver to not be used.

-- 
With best wishes
Dmitry

