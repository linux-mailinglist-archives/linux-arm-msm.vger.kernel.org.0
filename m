Return-Path: <linux-arm-msm+bounces-36574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DB9B7ED0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18162282A37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1D61A705C;
	Thu, 31 Oct 2024 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbcAeWO5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74DE1AFB31
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389460; cv=none; b=bsX4LZb9bOB+7S2yQAidZucVU0yhRk1v69uwlapsbBveWuB2P54pJljsrhGd0fc/gHQ1AYlk+NUyG9r98C3v9cm9+hyj5XVHD4hhonSNlB+URDTInuf6kpzdRQpLh64iPOeCfIKP2GxUgeeec0Fd+cjnJMI9RQP6suJ7qlt0sEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389460; c=relaxed/simple;
	bh=8KbwkqqmAA2pftuYjQTvNKIu03ZVLX7cGW+thUOVIKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TwiygUH7hYbKtqBkETGCFriHXhl0TTop6/YxUP/7uXmyAenEZI4PlVL9F7SxNiID7koeVq3YG9umGwwfZb4xUMUp/w0hK95HVa6gogH4qB7+HcjG83V4GDsAcD4/aazDGi0g8VsjDMJ4WoJlrHTpGIJnVGtnPVN7FOA9MSG5w7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbcAeWO5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea5f68e17aso5263817b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730389457; x=1730994257; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WkbJktFWhQ17ZPncxvn3FN6iDF+dModwKTnXQceOjrk=;
        b=FbcAeWO50PJDG1JAohPi8peSk4pyfvQqToVmo2h17ZF4r7ZoaSFjR9z64SLTEoNcNy
         W4MscrUeEJX455zlzdykRd9uxZgt+I13PYuHLN00SyDptHLB7UOlLSwu7ZloeDPW/MNH
         EE3xQN9CdlscloXZ6gNo56l0xoP6Va4PxEfP+PH1OIm42kokJhLHWz2BYhWKzZIHOwNo
         3CjzPBx1itqLujJx0t45hOdx+vFadQIsI/CS25xMvj8JGqw43lrZh5/KHXuwgsFwHH1G
         Mvc3SLOjuGaIBaVOxTjn8z/Z8hbC7dtvIw4bmN899H6bV6gzJyJz/UQVCZtdZ/IizjVK
         rHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730389457; x=1730994257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkbJktFWhQ17ZPncxvn3FN6iDF+dModwKTnXQceOjrk=;
        b=hPMWQ8n3GaMU6iati1mZlDMpHGAKIymkph9HzCYqooLq/211dH0xNYpXzBfXTAqYgH
         vOSQxZgYH0sZbk0iKb6a7QncutSuoDUZwcyJRdqgO/ZmKa+CUWyv5nV0DyMacbox/3XK
         Dc0Ta8IK7aHPzj96FNY61QnpJBb7XOuX0UP0kgeiQvioMJJsU6Pr7LIFCcbT6Q7ChdWk
         XEs6ezrXuRbLkfdxHSAo82LpF/SJGqjbSyzmaXP9cXwuRvkW845TxsLb+EDsyXjgP9Rh
         FTKJ/tXvtoOpBsHPr8mKp4S4W8Q3wssEXaUsQ4FEzEFryaZBBoy/FmSQCsPcZSb1v88E
         uM6w==
X-Forwarded-Encrypted: i=1; AJvYcCWr8EWLiPT54WvIYM8dkCUBciHCfWfy5ixAxPswn+vgESB7Di3Ul4amNdvDlVdw87lNE6ncCP1Lg7TbavfX@vger.kernel.org
X-Gm-Message-State: AOJu0YxAKm2qPFjjFo2P3lrLNSj/jfNH9P4JYxXW3EynONJadKRnNXZa
	TOe0UWUupgFPOt9/Y6wT9Acv53bEaB2Coo6w+dimiak06NXUJeLghyf0o6l/XXDGlXxRvXFfGHE
	sn2gydMw49qxObcpKInEQGq8FV8AvSWdtzwiQnbj2BoIzmkipAdg=
X-Google-Smtp-Source: AGHT+IGjmqvpPX1+bGFGcSxEoEH+wnbP2rdjGZXV5omtO6akLQEwaojlUw/funiMKKjk1H8UlB7i4QA7KdZjNAhvlgE=
X-Received: by 2002:a05:690c:d81:b0:6e3:430c:b120 with SMTP id
 00721157ae682-6e9d88cecf3mr189401227b3.5.1730389457603; Thu, 31 Oct 2024
 08:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
 <20241025-dpu-virtual-wide-v6-7-0310fd519765@linaro.org> <e0f84f35-6d98-45c3-857c-c273820fab69@quicinc.com>
 <xxxedwb2t6xhfzmhpom6dirs2ur2qvmruimdxgvdkh7gmey5tr@qotm7xvbsg5a>
 <14531af0-29c3-40eb-bf52-8202ba155d0b@quicinc.com> <CAA8EJppCppQ_jJu4o62prW-Yp2E3WBfqdYgdJs-KB8kgghj0fg@mail.gmail.com>
In-Reply-To: <CAA8EJppCppQ_jJu4o62prW-Yp2E3WBfqdYgdJs-KB8kgghj0fg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:17:33 +0200
Message-ID: <CAA8EJpr_8LkP8wnR8n0wSeFHOWdG9osg+XZu_vCDkv5Y6y0gXA@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] drm/msm/dpu: add support for virtual planes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 31 Oct 2024 at 17:11, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi Abhinav,
>
> On Wed, 30 Oct 2024 at 21:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > On 10/30/2024 3:48 AM, Dmitry Baryshkov wrote:
> > > On Tue, Oct 29, 2024 at 02:30:12PM -0700, Abhinav Kumar wrote:
> > >> On 10/24/2024 5:20 PM, Dmitry Baryshkov wrote:
> > >>> +           if (reqs->yuv && !hw_sspp->cap->sblk->csc_blk.len)
> > >>> +                   continue;
> > >>
> > >> same here
> > >>> +
> > >>> +           if (reqs->rot90 && !(hw_sspp->cap->features & DPU_SSPP_INLINE_ROTATION))
> > >>> +                   continue;
> > >>> +
> > >>> +           global_state->sspp_to_crtc_id[i] = crtc_id;
> > >>> +
> > >>> +           return rm->hw_sspp[i];
> > >>> +   }
> > >>> +
> > >>> +   return NULL;
> > >>> +}
> > >>> +struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
> > >>> +                                   struct dpu_global_state *global_state,
> > >>> +                                   struct drm_crtc *crtc,
> > >>> +                                   struct dpu_rm_sspp_requirements *reqs)
> > >>> +{
> > >>> +   struct dpu_hw_sspp *hw_sspp = NULL;
> > >>> +
> > >>> +   if (!reqs->scale && !reqs->yuv)
> > >>> +           hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_DMA);
> > >>> +   if (!hw_sspp && reqs->scale)
> > >>> +           hw_sspp = dpu_rm_try_sspp(rm, global_state, crtc, reqs, SSPP_TYPE_RGB);
> > >>
> > >> I dont recollect whether RGB SSPPs supported scaling, if you have any source
> > >> or link for this, that would help me for sure.
> > >
> > > I have to dig further into the old fbdev driver. It looks like
> > > mdss_mdp_qseed2_setup() is getting called for all plane types on the
> > > corresponding hardware, but then it rejects scaling only for DMA and
> > > CURSOR planes, which means that RGB planes should get the scaler setup.
> > >
> > > For now this is from the SDE driver from 4.4:
> > >
> > >   * @SDE_SSPP_SCALER_RGB,     RGB Scaler, supported by RGB pipes
> > >
> > >> But even otherwise, I dont see any chipset in the catalog setting this SSPP
> > >> type, so do we need to add this case?
> > >
> > > Yes, we do. MSM8996 / MSM8937 / MSM8917 / MSM8953 use RGB planes.
> > >
> >
> > Yes those chipsets do have RGB SSPP. My question was whether they have
> > migrated to dpu and thats why I wanted to know whether we want to
> > include RGB SSPP handling.
> >
> > I do not even see them in msm_mdp5_dpu_migration.
>
> Ugh, it's a bug then, I'll push a fix.

Ok, this is very surprising:

static const char *const msm_mdp5_dpu_migration[] = {
        "qcom,msm8917-mdp5",
        "qcom,msm8937-mdp5",
        "qcom,msm8953-mdp5",
        "qcom,msm8996-mdp5",
        "qcom,sdm630-mdp5",
        "qcom,sdm660-mdp5",
        NULL,
};



-- 
With best wishes
Dmitry

