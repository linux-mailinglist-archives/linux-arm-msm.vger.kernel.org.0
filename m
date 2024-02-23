Return-Path: <linux-arm-msm+bounces-12374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF1A861531
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 16:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05454286836
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 15:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5AD224D8;
	Fri, 23 Feb 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tL5Winiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5429060260
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708700848; cv=none; b=fKXEssqas4H6gFAhT6rxpYbg2vQ6oPtaPXQSaQccqy260uORDXAm0pGVTD2xiQZZvRii66wFkCr7yy1zIso846IireaswNvRKCutN6mEy2UjVQ3tq5Mlgcnb31MkhSecjOxZTvQw/jZdJvfJkjLOwtwYHgAgHeiqUTR5aqJ1C3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708700848; c=relaxed/simple;
	bh=NId8MgG3/SUMuIAbVWmEJCUH5j84rbDkiitN42p58MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeGFws8h2XsCSFhjsnHfR9yUUIj77mcZ/G1pefgzyynvLI9NFqYxDc0H6yALeTKcMyQf7DIaO080zkV/q+LtyhRAha1CEtoS7KvI4RoensvDAd6cpnWUls6XRxQz6LWX71mAkB4HLb4fNWE4YD9+/yW7O8kWzm1/EMlFj4SFps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tL5Winiv; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso989682276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 07:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708700846; x=1709305646; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A7N/x1XZZ13w/J9RvBvRRguBA+rtWAzOoF+dbMHjtzE=;
        b=tL5WinivURQifsKX2Qrj54bUzsMPHFHSfCwnuhC06fF78go07/iN237ceHrEHQWqFC
         nWAJKgOs/qCGTuHPLDuaW4wk3MgO+miF5MdD9Ok7zFAGcyxlpOsV6Nq9p1fg1ZQkUjjh
         EGAVN1WEZbLIT5fRXo2766xLNEVDMx30eIlV00yVJnlvNiktA9NXGC4JPZKEz7nRFCcr
         B7/4LEZ4IkjOQ06RaCtvDM8Dm6KUcjHWWl2fa6fcaXW9nHPOQh/v3V+7p2zi8hxc6wkG
         VM11Asq9asMEKFQ4/Qjr8glRboQGa1GqXH+yL1NgSWNFr/LNrGWHWcU9V3Ila0SDVXPt
         QVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708700846; x=1709305646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7N/x1XZZ13w/J9RvBvRRguBA+rtWAzOoF+dbMHjtzE=;
        b=wDFbapIpkVFpJ2h/mC/tJ5idncukjhr7OhpytoFGgzOEDoVfHAPA6yMpwybO2U137x
         0WEQB8hwMPOEDBeQCt2ht7K9YLgKg9dx3+4gPYCt9sgbFtmSwVHtOxUPdl4iNofS+Dwd
         nJJCvreaPQ4WhKvKg+7CIMUj0vwrAFbb0PBQ7h+MtjhI9a2Cam93ygL71QFQPzQitseB
         4bcbSz9rRLY//vaqKpoItjckiFumRyL2sjq98aUL6w4I8lu/Tphzst4fUSWpbcW46d78
         r7XcUwnBvO4ucxHVYPQM2kXTl9+nKGXuobw+8oL6ziWJkCXXqalr3qxOejYE9TMXHAzs
         wpvA==
X-Forwarded-Encrypted: i=1; AJvYcCW+H0rPCSIesQ7pLqCFGHBlC9zK7MAlfMoBcs887OIPmY/EDgP/yr9wqKm513pJwvUPlydDacsohmHUvi0rXcxabScJZwHobF/vo42z2w==
X-Gm-Message-State: AOJu0Yw/F1uudx03oy99NbNtbGgNl6RksC9SrT6lDnPCsQAte8KrPIrH
	kaTTavvpwnlJwcjbRIyND9P8Gt8fN5wfkzajLGXx+EBXjGiyiS2oNei2VNs0y7JXIgKDb9YW1KS
	f4vvdss2Y0lymoG13irhSYaJMTD2V9SwmcaAp+w==
X-Google-Smtp-Source: AGHT+IHVp3IoavGMPyTgcYZAB/4X0W31P+xAKxbr9Gb+QsxAn1gv0v6QzKKvAYqZ5A5+yYWrSQ0bJyPW0Vw0YbTeOKw=
X-Received: by 2002:a25:86d1:0:b0:dc6:e75d:d828 with SMTP id
 y17-20020a2586d1000000b00dc6e75dd828mr84838ybm.18.1708700846276; Fri, 23 Feb
 2024 07:07:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <170868613914.4029284.5549880672870201262.b4-ty@linaro.org>
 <3c4246b6-431a-442e-8ace-3b0d0e67743f@linaro.org> <ZdiU2z8rzo542_Ih@hovoldconsulting.com>
 <d4049823-ad24-4426-887b-9c66cdd96318@linaro.org> <ZdiqAPPTn9SvsjL8@hovoldconsulting.com>
 <77715ecd-ddb9-450c-98bf-4fcade0e81c0@linaro.org> <ZdixFo2EjUQDgeFh@hovoldconsulting.com>
 <b5401b19-09d9-4907-86d6-9aab9dc2970e@linaro.org>
In-Reply-To: <b5401b19-09d9-4907-86d6-9aab9dc2970e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 17:07:14 +0200
Message-ID: <CAA8EJppJL7ha8AQ7g+_b=0omcWRnTpjRc655V58FKoowUDRPeA@mail.gmail.com>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
To: neil.armstrong@linaro.org
Cc: Johan Hovold <johan@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 16:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 23/02/2024 15:52, Johan Hovold wrote:
> > On Fri, Feb 23, 2024 at 03:38:13PM +0100, Neil Armstrong wrote:
> >> On 23/02/2024 15:21, Johan Hovold wrote:
> >
> >>> But it is *not* standalone as I tried to explain above.
> >>>
> >>> So you have to drop it again as the later patches depend on it and
> >>> cannot be merged (through a different tree) without it.
> >>
> >> drm-misc branches cannot be rebased, it must be reverted, but it can still be applied
> >> on drm-misc-next and I'll send a revert patch for drm-misc-fixes if needed, not a big deal.
> >>
> >>> I thought you had all the acks you needed to take this through drm-misc,
> >>> but we can wait a bit more if necessary (and there's no rush to get the
> >>> first one in).
> >>
> >> If you want it to be in v6.9, it's too late since the last drm-misc-next PR has been sent
> >> yesterday (https://cgit.freedesktop.org/drm/drm-misc/tag/?h=drm-misc-next-2024-02-22)
> >>
> >> Please ping Thomas or Maxime, perhaps it's not too late since the drm-misc-next tree
> >> really closes on sunday.
> >
> > I don't want this in 6.9, this is needed for *6.8* as this fixes a DRM
> > regression in 6.8-rc1 that breaks the display on machines like the X13s.
> >
> > If you guys can't sort this out in time, then perhaps Bjorn can take
> > this through the Qualcomm tree instead (with DRM acks).
> >
> > But again, this is fixing a severe *regression* in 6.8-rc1. It can not
> > wait for 6.9.
>
> Right, I can't apply them right now, I send a patchset ack so it can be applied ASAP,

Applied and pushed patches 2-4. Patches 5 and 6 can go through the
phy/fixes. There is no need for them to go through drm-misc tree.

-- 
With best wishes
Dmitry

