Return-Path: <linux-arm-msm+bounces-20070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B688C9D73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE340283E77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A3B5647B;
	Mon, 20 May 2024 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tojo2ZU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D25579F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716208404; cv=none; b=AgSvMLr08YDV3ZMESf47JX0aGA3tkyXbzsLOQl9R3CawFQRIkN8VPLASufDbs27lUagwNB0OfphINZkZoODuS0MYFozf2RljCQaLDx0BMkGeC0XPxwMx7MC92P1irMHPrsf29jmYcYe5m9mLubDEZ2obl5MDahsOm3PcEir+Yeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716208404; c=relaxed/simple;
	bh=jPAr9I1d71ZVqQYfQqvOSswv31/4CUL5uXtTYAcFx94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuxtyKr9hG6wfwctJEh5PD6lFQ8K7n+aVvfXMVg98U2EUDC0JNAqs7ueAOIvpeh7RB4Ilpl3qZblqloZCstxj0L00kwRAbGg0I7g0pytDac0im0RjF+MHF8eHktNKJbi3gCMGZmyqlSIOl2dZ5rDfZjbc+uTc7cQeMFONtVC3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tojo2ZU6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-62050e00cfdso20748877b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716208402; x=1716813202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovkEWaQCA7eBKIybUwU0MV7EJ/U35ld+RDcvKJwMYS0=;
        b=tojo2ZU6RZn7c/XhYkWI1paZIa9fxIQYptXlqJdRZuLCbtMKS9FLeOgcPF/ITmzRnh
         GwOvLpe77VhreZ0QBkBQacqpsxZwk/1pa/jB2Eh53A+gZ5DA0TtIG6wI2x3ynBu6GDsC
         DJs4t8AzGk+Y9LMaf2rWtunONDM3vkodMhEd+hmSkmPKMKITAoU0k75APyvc+EkMC/ll
         a8rl+basBw0QzpRNQIRi/yXWy4Vhx9Wuuf6OSDyEAMdK6wJt1eLjjvgcduC4xJYC2uYV
         uNuO6J0/cM53aeBjVZyHpn8sCzT+YQ2w52h8c/w2vKr76Pv3Sm85Kig1seNUXQvrQ6ka
         EyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716208402; x=1716813202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovkEWaQCA7eBKIybUwU0MV7EJ/U35ld+RDcvKJwMYS0=;
        b=hm1XQklJBdUrZ3CGe3SF1JdbAqd25b4ytWKC8DEn3aBHSSLhWQt/PpgRuvnI8xhXHj
         tKSCdf9N48wEIuucOz4iCeA62EE0ATti7ZN8fqi18uijJlVYWwPkCIEkdnzGEAbq4Zz7
         53vneIOdrAXsfaX8idvyZlDPxmOlzZy/OZeUZs/XO2PbckP+ihUjemCxPAAtjavlpq/+
         /DWy7UHyo/ENmnQMWd9c70chSSbha0QOCsKw0qhHp0aqF8Vqld/K3oYMbmAZhqrSbEoP
         1oXf50t0jh6K0xQPa2MbvMMJEV+lVFlEhnGONR2Ld72H+1Oawkg+3UVUmoHYOQEmxtmU
         aKIA==
X-Forwarded-Encrypted: i=1; AJvYcCUxTiejRv28ZsmfN9JkyZhSMmHOk9PGhQrjP4/HUR2fBOXsFysAaK0Q4Ijj5mBwYB/GZRkjVB9QnVyhLKNbuRebEawTGDWhoStZlOnGiA==
X-Gm-Message-State: AOJu0YwcTLnvtHn2cgWgowlCALkwPegPVwRW6Pdvc3YZ+zKk3ZrDl19L
	+NdGESkmUsm1wu7aVySYmEQGFPFZlA+W9AgsAfNu19PzXU/9PgsmpTd7owCOISrOISOgnqspgHr
	Oj38q15H0MWYxWHsnjHQzDy+B8p4BdloVJDNQlA==
X-Google-Smtp-Source: AGHT+IGs0xMhNjXBQwaD1yEBLjIanzDkrGthytqkRz05Fj5APi4G3kf/ZJJYkvM5bAuoB6pl+p9xmBERmiYfprGkWU8=
X-Received: by 2002:a25:ada8:0:b0:de6:17e7:ddd1 with SMTP id
 3f1490d57ef6-dee4f30c3f1mr26969452276.34.1716208401987; Mon, 20 May 2024
 05:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com> <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt> <871q5wu0u2.fsf@intel.com>
In-Reply-To: <871q5wu0u2.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:33:09 +0300
Message-ID: <CAA8EJprJg_yzembu2zb3=r8gGTEbq3fiYqpdNFQyBSGw+9+qcA@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 May 2024 at 15:25, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Sun, 19 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> >> Prefer the struct drm_edid based functions for reading the EDID and
> >> updating the connector.
> >>
> >> Simplify the flow by updating the EDID property when the EDID is read
> >> instead of at .get_modes.
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >
> > The patch looks good to me, I'd like to hear an opinion from Doug (added
> > to CC).
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Thanks!
>
> > What is the merge strategy for the series? Do you plan to pick up all
> > the patches to drm-misc or should we pick up individual patches into
> > driver trees?
>
> I think all of the patches here are connected in theme, but
> independent. Either way is fine by me.
>
> >
> >
> >>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Cc: Sean Paul <sean@poorly.run>
> >> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: freedreno@lists.freedesktop.org
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 11 +++----
> >>  drivers/gpu/drm/msm/dp/dp_panel.c   | 47 +++++++++--------------------
> >>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 +-
> >>  3 files changed, 20 insertions(+), 40 deletions(-)
> >
> > [skipped]
> >
> >> @@ -249,10 +228,12 @@ void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
> >>      panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >>
> >>      if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
> >> +            /* FIXME: get rid of drm_edid_raw() */
> >
> > The code here can get use of something like drm_edid_smth_checksum().
> > 'Something', because I could not come up with the word that would make
> > it clear that it is the declared checksum instead of the actual /
> > computed one.
>
> This is an annoying one, to be honest, and linked to the historical fact
> that we filter some EDID blocks that have an incorrect checksum.

It is a part of the DP test suite if I remember correctly.

>
> (Some blocks, yes. We don't filter all blocks, because there are some
> nasty docks out there that modify the CTA block but fail to update the
> checksum, and filtering the CTA blocks would render the display
> useless. So we accept CTA blocks with incorrect checksums. But reject
> others. Yay.)
>
> IMO the real fix would be to stop mucking with the EDID, and just expose
> it to userspace, warts and all. We could still ignore the EDID blocks
> with incorrect checksum while using it ourselves if we want to. And with
> that, we could just have a function that checks the last EDID block's
> checksum, and stop using this ->real_edid_checksum thing.
>
> Anyway, yes, we could add the function already.
>
> BR,
> Jani.
>
> >
> >> +            const struct edid *edid = drm_edid_raw(dp_panel->drm_edid);
> >>              u8 checksum;
> >>
> >> -            if (dp_panel->edid)
> >> -                    checksum = dp_panel_get_edid_checksum(dp_panel->edid);
> >> +            if (edid)
> >> +                    checksum = dp_panel_get_edid_checksum(edid);
> >>              else
> >>                      checksum = dp_panel->connector->real_edid_checksum;
> >>
>
> --
> Jani Nikula, Intel



-- 
With best wishes
Dmitry

