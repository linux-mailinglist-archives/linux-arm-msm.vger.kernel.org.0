Return-Path: <linux-arm-msm+bounces-22387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E83F904E2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F5D1F27523
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFA716C875;
	Wed, 12 Jun 2024 08:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wMFmiVIB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA5F18E02
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718181076; cv=none; b=oYv7eaZmXiL4xit6mGyeWlRMvHDnWd+5cObH+x+Mi1tA17lSHlTfVUqtEVIExNJAxvGL7y07VOc0piPOaPPmx5bKhej3lWWiy0OEMymJtynU0hfkFDqudlJ7cUIZNtlmmuVd2iLm74jjnLk6x7osXI/phdgzTIal7EDkFzicRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718181076; c=relaxed/simple;
	bh=/V7B8lXPBLD7ihkJBxr0bE2ZWrLoc2cPQlARYg71IXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjnqsm7JcxgzWY4s6ttn3l1pO2ulVf8zSzbDB+gFYCEHvjzO/euCSRFLciQDeiX02WMtY29Hq9XApH7UJkNyO2xxZL35hRh3EHdKz4a3zOzZjFSoG8i956H+oN2ocx9C6kxVwALeOLNSjQj/2X+YAgAh1mdxxvEc1t/W9XSOMWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wMFmiVIB; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfb12fe6f96so3718664276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718181073; x=1718785873; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AK4TGqSjjB40y8fmZJ44IyeI64N3R1XfTvfluZXkmSM=;
        b=wMFmiVIBXFYBu93vt+C0ffKbxz97tus0r8UzuiOpq8guo1LtVHKRw/NE2GPrFEUkUT
         aj2/zWKM2JpUOTTuG60rIDMl6k8D6fKHGhEdNvpKA4ebcEYb1lkA+Wfb1etvW7zNRVgj
         DhAnpQ1gaGUXvMcIh/nSlM7SWpfZeyNTxcjp7d308+N07Ni1oFPyJxdveU2XFkF5BDp9
         0Uk2n4UduEYle11LB5g3497EUyodZKmjwJjyOXWyz4kotzFrRQEe9l+Id2LO6UB9XF4/
         4FttiSzFuTNUgoQt0cYb6vJQgUOzWYEoAxRuzo8vz8KPAaJa4CgsupWQv93O0RlnS/Lv
         fsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718181073; x=1718785873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AK4TGqSjjB40y8fmZJ44IyeI64N3R1XfTvfluZXkmSM=;
        b=EGc2LGPg61aH6dBwBbAhfdrM43afSTaxB6mcrgqOYMhkJHtQf1X0DFOTli5MgZ+daD
         n6/00m6JFGRHCZwv6irVj/EB3ZNtvf1l1nYe3XMCV5OerVV1Sk4qpKELx3+jDWuqw7Lq
         5VHuKIGFdK2WWCYKG5ZtJ09OvCiBLNfrxvrahc/ZbgvhrAiai/njOF64RTFQWkxNMFh6
         5J8pB44fB08pCL2F1MGwoEAbnRAosfWPth6jwokoLjzWIR/c8fIGShTRrHO36Nzqx7/v
         E1+zHHoaXt3abtuXH19r5ETpEkb9iEYcspVoBT5AZDgD9FCGGDDQCRsuYytXYcb79dKT
         K2Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXwgGSQMcwxt72//V6lIEFSbJjJFi2lYVqNA9ysy3d+cFWEOQSkV+RbNLJWpStr78wXdzt9GtstD3v/KP5wcB1UFgU2YIfF6JO4QzsAYA==
X-Gm-Message-State: AOJu0Ywmo9iQo3J40w6pAyEzSjy4Bs+bp/uWuksmoUwxRS4YQPYSCPLM
	TdGf1c4fyWYBTCVuLYTgIsWf5ltGx1AbvZ+R18n1z4zY/n0eXVKoB8yY3TBlSfnT9R2L5OehcsL
	VfDZHthTV1L3ywl6hmydCLvkCDnUdpy0q5bD49g==
X-Google-Smtp-Source: AGHT+IFdVgVihf4MmaN1XEn9h9Ixbp9+ZsNMJGGhiEpC13jkv5QfaF4bLHL7sZmWC4CawHllZ8xWU5fU04nZMosDPgU=
X-Received: by 2002:a25:ad60:0:b0:dfb:9e6:5894 with SMTP id
 3f1490d57ef6-dfe68920559mr1030557276.43.1718181072766; Wed, 12 Jun 2024
 01:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
 <20240522-fd-hdmi-hpd-v2-4-c30bdb7c5c7e@linaro.org> <6f51224a-a7cd-4774-827a-967a4f4b38ee@quicinc.com>
In-Reply-To: <6f51224a-a7cd-4774-827a-967a4f4b38ee@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 11:31:01 +0300
Message-ID: <CAA8EJpr6v6vToYGc0MBU=SXHEoFOhLTLgs2QAS4JD_c23+8hDg@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] drm/msm/hdmi: set infoframes on all pre_enable calls
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Jun 2024 at 03:04, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 5/22/2024 3:50 AM, Dmitry Baryshkov wrote:
> > In consequent modeset calls, the atomic_pre_enable() will be called
> > several times without calling atomic_post_disable() inbetween. Thus
>
> Hi Dmitry,
>
> Just wondering, where are you seeing multiple pre_enable() calls without
> a post_disable() happening?

I think that was with me hacking around, so the commit is indeed incorrect.

>
> IIRC, the msm commit_tail always calls commit_modeset_disables() before
> the commit_modeset_enables(). Also, doesn't the pre_enable() and
> post_disable() only happen once for bringing up/down the bridge?

I don't know if you mean it, but they are called each time the output
gets disabled and then enabled again, e.g. during modeswitch.

Last, but not least, I'm planning to land the HDMI rework ([1]) once
the drm-misc-next is merged into msm-next ([2]). This makes this
commit obsolete.

[1] https://lore.kernel.org/dri-devel/20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org/
[2] https://gitlab.freedesktop.org/drm/msm/-/merge_requests/118


>
> Thanks,
>
> Jessica Zhang
>
> > iframes will not be updated for the next mode. Fix this by setting the
> > iframe outside of the !power_on check.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 3c6121c57b01..fb99328107dd 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -133,10 +133,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> >               msm_hdmi_phy_resource_enable(phy);
> >               msm_hdmi_power_on(bridge);
> >               hdmi->power_on = true;
> > -             if (hdmi->hdmi_mode) {
> > -                     msm_hdmi_config_avi_infoframe(hdmi);
> > -                     msm_hdmi_audio_update(hdmi);
> > -             }
> > +     }
> > +
> > +     if (hdmi->hdmi_mode) {
> > +             msm_hdmi_config_avi_infoframe(hdmi);
> > +             msm_hdmi_audio_update(hdmi);
> >       }
> >
> >       msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> >
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry

