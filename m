Return-Path: <linux-arm-msm+bounces-14586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A3880370
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 18:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4D91C20BD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883743A1BB;
	Tue, 19 Mar 2024 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LJUx9fug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022C3A1A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 17:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710869260; cv=none; b=j5hkCiKMQTUKFVJub7GvNli9SGkO/R11Q0F4D8JpzfAvoSjXwFukFqYZ0HbRzsixxVei/xMPx6fPtd9syfzlMRwBoVOtgyyvcKoiXqE1HSJzv6VnMwwLznzdqnwSzlXM7nIbKI3JxjopxCoVkiDQsvrb5pqFFVvPLN5s+Fnnt6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710869260; c=relaxed/simple;
	bh=6W1qCWnz+7Z3YETqKXCygOfNK9YBMFA6YOC7DWIPqLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8A4QGZskAtN1q46ZdFJcLWKGkg1nmcmkreEz/hVCRDPiI2mnJ759w6nzE1gBEitmtK0Tpaoj27HseeviPVsqo9BuWI7mrZEXRwZSosl9BicORcshI+cSfmXUh8JfRt/WZKyHuP8dTrU2H2DimA2b2VEBPVxGCC/TNx9VLrhmRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LJUx9fug; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-609ed7ca444so54663387b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710869257; x=1711474057; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m3LUxRWYnP2OsrqcQiSZ4h3vPEbmfkyWm4/8PP80DFo=;
        b=LJUx9fugAG8ZdURQOqDNnOVESUII9+gBD/r2O9H+LDMsQHWNWHE/1IGb3xMWE74XGs
         rEOwl7BxZRY/GXe7TSRXVw+sY1M2EHlCDA6Ic/UaVWTW95Xr8iHMkyhYKt/fP+ufjkCK
         6WnTIZajjc+xshX5kfKLDsdEL4IEGJub0DLn3rdhlp8YNocClG/AbAvk2KYwVm8wgUX3
         u2Br84V54aAFUMLrSEjNzSG7G2EBsP7DBP7K9EKou3rmUk/lET0ojFYg2tBaye17fAwg
         Tj/rnf2Rhr+2gE4Cat7MYr5govgo9nsi6936c1gPGK6yToPeYJ3O47pyNvGXVkxB3pFV
         H3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710869257; x=1711474057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3LUxRWYnP2OsrqcQiSZ4h3vPEbmfkyWm4/8PP80DFo=;
        b=F5aQe0fDFo3aWT3SfrBGPTiZRMhvhrRDGZ0THbNFOuol94bcLQOOMIqx7zmWhc5Mhg
         EIuN96lXInEfWw258Flfnti1PWS6+zEzyD3EN1PeBF2Ha/53t/jFjKhAitYyY7AOhpQC
         RNipee+lFqb2Ts+2tJOKLcn8mWFeIoXNZ08UrtHQbWKPIVnA4xMya74zDmE1n+58LBQq
         c8G/ezOpAwepvQwXc+LTRGCdrhv6pQa4xbFfa/YrIGOVXC7Z2CtEwZOhAmSBqjTMm7zH
         AoS7o9ewAdR0Xwf+GGDevhTCeLNx6xo9arexZFySrqD1w4fVD4zxyK+lZZxyNX8m522I
         ZmEg==
X-Forwarded-Encrypted: i=1; AJvYcCVCSHO/itMYSbEkG2Og/jJLhNriXLL6cIQiEaDUjV+P0cs1wjHXhdr0GH+s15jTD+VGY/zF708zyXxIYFvzNQ7NEyw6vhirTT/sg1Yx3w==
X-Gm-Message-State: AOJu0YzsrLOWPzyVNWwyLEF2Fj+uTD5lq/hR5hBa/+ut4/6jX4lNxGEo
	G4odDrmA0nOjc8jVCeo06Es2gYYFnbNHmW3chXDiZ//BIrD0/KrlsSxYcHBuJO2dV3lpQg4l0ZV
	graj8Ku8mH9mIykUyU2MrffzCw8YajQmAxWPSxQ==
X-Google-Smtp-Source: AGHT+IHirHQZ7pR8BGQ/5ZhsBCIs44cPOvTf+0zulojL7cSeRMY1zSrD1OShWWxzk2nxLI0kUfdWALR/K7oeCrxZF5I=
X-Received: by 2002:a81:6f05:0:b0:610:d431:9408 with SMTP id
 k5-20020a816f05000000b00610d4319408mr5599507ywc.42.1710869257519; Tue, 19 Mar
 2024 10:27:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com> <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
 <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
In-Reply-To: <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 19:27:25 +0200
Message-ID: <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 19:13, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/18/2024 5:55 PM, Dmitry Baryshkov wrote:
> > On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >> +bjorn, johan as fyi for sc8280xp
> >>
> >> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> >>> Before the introduction of the wait_hpd_asserted() callback in commit
> >>> 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> >>> drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
> >>> that it was up to the AUX bus driver to wait for HPD in the transfer()
> >>> function.
> >>>
> >>> Now wait_hpd_asserted() has been added. The two panel drivers that are
> >>> DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
> >>> advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> >>> 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> >>> wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> >>> wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> >>> ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
> >>> no longer any reason for long wait in the AUX transfer() function.
> >>> Remove it.
> >>>
> >>> NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
> >>> optional for the DP AUX bus to implement. In the case of the MSM DP
> >>> driver we implement it so we can assume it will be called.
> >>>
> >>
> >> How do we enforce that for any new edp panels to be used with MSM, the
> >> panels should atleast invoke wait_hpd_asserted()?
> >>
> >> I agree that since MSM implements it, even though its listed as
> >> optional, we can drop this additional wait. So nothing wrong with this
> >> patch for current users including sc8280xp, sc7280 and sc7180.
> >>
> >> But, does there need to be some documentation that the edp panels not
> >> using the panel-edp framework should still invoke wait_hpd_asserted()?
> >>
> >> Since its marked as optional, what happens if the edp panel driver,
> >> skips calling wait_hpd_asserted()?
> >
> > It is optional for the DP AUX implementations, not for the panel to be called.
> >
>
> Yes, I understood that part, but is there anything from the panel side
> which mandates calling wait_hpd_asserted()?
>
> Is this documented somewhere for all edp panels to do:
>
> if (aux->wait_hpd_asserted)
>         aux->wait_hpd_asserted(aux, wait_us);

That's obviously not true, e.g. if panel-edp.c handled HPD signal via
the GPIO pin.

But the documentation explicitly says that the host will be powered up
automatically, but the caller must ensure that the panel is powered
on. `It's up to the caller of this code to make sure that the panel is
powered on if getting an error back is not OK.'

>
> >>
> >> Now, since the wait from MSM is removed, it has a potential to fail.
> >>
> >>> ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
> >>> causing long timeouts, but it's still nice to get rid of unneeded
> >>> code. Specificaly it's not truly needed because to handle other DP
> >>> drivers that can't power on as quickly (specifically parade-ps8640) we
> >>> already avoid DP AUX transfers for eDP panels that aren't powered
> >>> on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
> >>> eDP panels are not powered").
> >>>
> >>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>> ---
> >>>
> >>> (no changes since v1)
> >>>
> >>>    drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
> >>>    1 file changed, 17 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>> index 75c51f3ee106..ecefd1922d6d 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>> @@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >>>                goto exit;
> >>>        }
> >>>
> >>> -     /*
> >>> -      * For eDP it's important to give a reasonably long wait here for HPD
> >>> -      * to be asserted. This is because the panel driver may have _just_
> >>> -      * turned on the panel and then tried to do an AUX transfer. The panel
> >>> -      * driver has no way of knowing when the panel is ready, so it's up
> >>> -      * to us to wait. For DP we never get into this situation so let's
> >>> -      * avoid ever doing the extra long wait for DP.
> >>> -      */
> >>> -     if (aux->is_edp) {
> >>> -             ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
> >>> -                                                             500000);
> >>> -             if (ret) {
> >>> -                     DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> >>> -                     goto exit;
> >>> -             }
> >>> -     }
> >>> -
> >>>        dp_aux_update_offset_and_segment(aux, msg);
> >>>        dp_aux_transfer_helper(aux, msg, true);
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

