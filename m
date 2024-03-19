Return-Path: <linux-arm-msm+bounces-14432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E287F4CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 01:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10E7A1C21515
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 00:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDB1ED0;
	Tue, 19 Mar 2024 00:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pOLzhnEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02829A29
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 00:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710809726; cv=none; b=LO9V1jSQGIUYO01LWk97sKIGvTpam7qUMFVP+ZoatEMGT68nIkrYK2c1+gt9ZmlVkINAma7Wc/QQ6C1ysjpCt19+B3cplPc9ECmWdDM619D92EUPYDGPoXOJYY4pWwKnJdJjxJXWRDXdhgIajK2uu23Hez83LzOCovNTBeVb4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710809726; c=relaxed/simple;
	bh=P3Zw3UnmHayy6IcD02MvkORw1tTePTVJ6DUJUMeG+7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UALVqZ7z1uxTr+DWc3W9V/o74zIvfoYt5frSp3fzxVLrBSGQG2GZiI78WiXQfRcRVWG59YQriD+Vcu2wgAZFsQpLXGtZ9VBqDc4U1fRVyEvhBw7gDNBMnKJeI16Vpp657XA/NzKFx7kYPrm1KfMSVdq7FbkkI5dI7ALc+sIa8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pOLzhnEM; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-60a068e26d8so57302677b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 17:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710809723; x=1711414523; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IJp2wlS1QcmyKoSILRJh4VbMcwABTvJV1wN+wh3MV9E=;
        b=pOLzhnEMntqpL1rvlSr2xeEQgHzRxLpKJk8DQygZN36GP9yk3PByckm6apcRnrM4By
         2+ArAp16V/uiN6ujkkBm34n3q1eHZzPFBqL73Xf/hhKbPw2Go17g8QVm/uCMd3YHSGoi
         Sf9CpwJyE2TSH0SKzbCclPO8bVUHIGnv85SN70jsOkauENWuhQrf288kZ36YaxIMsN4z
         ELIYoFpjjibcQdaIec69ijH79XgshDmLq8Y7lpJ0JSc++zVFyV5W9kGDztk2vgCu6u93
         9jTcK5bjrhN/Xri8K3zfArRpRTVYkdAxPoSuHyAAtu43f01ks6lJwZUQ5IeXLuu/4liU
         eFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710809723; x=1711414523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJp2wlS1QcmyKoSILRJh4VbMcwABTvJV1wN+wh3MV9E=;
        b=JzcARlVpF4sPqsBsb4uFJG/h2XRxpOS7ZviF752CF8vvL9/yu/3gj6zT+UtMGvQnUt
         S2q3LPjNHJRYH4CrQAo9ofOwOruEKGxSY0gfGuxoGggCKIz7S0qs52Y2mlrFd4jeL0Wo
         FR3Z9r0b/tXqK/6l7ny/mlsq0oXPPRW2hTkFV2+7wa+RDweghipLSgWYqnhgHOCpCV2a
         Y5Ef4iJuFXOPYLfSriRXqmAxhmtx7AocQSesx4dZcXQWoGa234L9fz5wFD0O/B7PGt25
         WrZ5JSwRU10lIN6nE5vAab501hrWJqTU7W/o1jcN1xd8ORrlnWeMt7zADu1rhvASDZlw
         ee0A==
X-Forwarded-Encrypted: i=1; AJvYcCXXJ3MmS9hPkxezCzpELTmla1o2QUtrPZ8brcxqZDQVYayQ3W4ZxdqIcQrAoelQzqyf6ryoqzlrGkdmu883edNwHKj3xtfA2aZBXUr0wg==
X-Gm-Message-State: AOJu0YxIkxjuDBJrBhtkHRaKqfyZOlEjw5kMNwbOysHWUtRB00poViOu
	pEWKdlLdimJ7tX/v3mG8wRlHkOyDveWO+R3g73OpXLmqclXF01b432TstyolI+UCt3ojx6hg6RM
	caJfnq1NYMwZTBcXHuaRjbic0B0TEYrvohtWjWA==
X-Google-Smtp-Source: AGHT+IEGKYwv10lcfsSdgNSEMTidawwMjd39KQKkAtnp/4ZbSUUFgDbTKVLqQgyVWylbNRxZHqjPhJycsO3zJfAmsks=
X-Received: by 2002:a0d:fd87:0:b0:609:e4b4:c2fb with SMTP id
 n129-20020a0dfd87000000b00609e4b4c2fbmr12750368ywf.27.1710809723036; Mon, 18
 Mar 2024 17:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid> <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
In-Reply-To: <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 02:55:11 +0200
Message-ID: <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
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

On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> +bjorn, johan as fyi for sc8280xp
>
> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> > Before the introduction of the wait_hpd_asserted() callback in commit
> > 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> > drm_dp_aux") the API between panel drivers and DP AUX bus drivers was
> > that it was up to the AUX bus driver to wait for HPD in the transfer()
> > function.
> >
> > Now wait_hpd_asserted() has been added. The two panel drivers that are
> > DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: Take
> > advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> > 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> > wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> > wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> > ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There is
> > no longer any reason for long wait in the AUX transfer() function.
> > Remove it.
> >
> > NOTE: the wait_hpd_asserted() is listed as "optional". That means it's
> > optional for the DP AUX bus to implement. In the case of the MSM DP
> > driver we implement it so we can assume it will be called.
> >
>
> How do we enforce that for any new edp panels to be used with MSM, the
> panels should atleast invoke wait_hpd_asserted()?
>
> I agree that since MSM implements it, even though its listed as
> optional, we can drop this additional wait. So nothing wrong with this
> patch for current users including sc8280xp, sc7280 and sc7180.
>
> But, does there need to be some documentation that the edp panels not
> using the panel-edp framework should still invoke wait_hpd_asserted()?
>
> Since its marked as optional, what happens if the edp panel driver,
> skips calling wait_hpd_asserted()?

It is optional for the DP AUX implementations, not for the panel to be called.

>
> Now, since the wait from MSM is removed, it has a potential to fail.
>
> > ALSO NOTE: the wait wasn't actually _hurting_ anything and wasn't even
> > causing long timeouts, but it's still nice to get rid of unneeded
> > code. Specificaly it's not truly needed because to handle other DP
> > drivers that can't power on as quickly (specifically parade-ps8640) we
> > already avoid DP AUX transfers for eDP panels that aren't powered
> > on. See commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX transfers when
> > eDP panels are not powered").
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > (no changes since v1)
> >
> >   drivers/gpu/drm/msm/dp/dp_aux.c | 17 -----------------
> >   1 file changed, 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > index 75c51f3ee106..ecefd1922d6d 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -313,23 +313,6 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >               goto exit;
> >       }
> >
> > -     /*
> > -      * For eDP it's important to give a reasonably long wait here for HPD
> > -      * to be asserted. This is because the panel driver may have _just_
> > -      * turned on the panel and then tried to do an AUX transfer. The panel
> > -      * driver has no way of knowing when the panel is ready, so it's up
> > -      * to us to wait. For DP we never get into this situation so let's
> > -      * avoid ever doing the extra long wait for DP.
> > -      */
> > -     if (aux->is_edp) {
> > -             ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog,
> > -                                                             500000);
> > -             if (ret) {
> > -                     DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> > -                     goto exit;
> > -             }
> > -     }
> > -
> >       dp_aux_update_offset_and_segment(aux, msg);
> >       dp_aux_transfer_helper(aux, msg, true);
> >



-- 
With best wishes
Dmitry

