Return-Path: <linux-arm-msm+bounces-16361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC555897B68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Apr 2024 00:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276E81C21221
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 22:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F98156895;
	Wed,  3 Apr 2024 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RN97NbKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698A155A46
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 22:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712181905; cv=none; b=rmfYyM0Vg5dmf20Yv7TA/v83jzQyRfMB9T3J8b2DM/w7W/H29wHn9rW/HtbPxuhhwXfhndcNexBwXREBoliYNs+PwbR76zeDBJqwOKyvcperYpsuUlK3fHDnuTkCvihOIzsI6wKsAjRGiwPgfMjuqrQGzS1qghw3ncgLvfRcd4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712181905; c=relaxed/simple;
	bh=wMV6DGmC8+TexjV5H4CBihBSEOZEkPeyx4+1TZ0zHaI=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdqdMxUD0YA7cV/FCxX0oLxFR5Vde8o+RnDcVHWnUVPd43a6qYrHQ3rCv7vGcql6JYo4xlz1CQlrmNxanHteCRqnv/lboLxQQ3ZtHSnuOXReTziv+GsX1EKiJMwXobhU4zCc1tBGK1744S0022SxgL8lG37uDp0t7wRDcpNENUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RN97NbKY; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516a01c8490so1346273e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 15:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712181901; x=1712786701; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMV6DGmC8+TexjV5H4CBihBSEOZEkPeyx4+1TZ0zHaI=;
        b=RN97NbKYBBm+/ifV/h3jg0DbB1kq0Ae8UAWCXk8pB65CuWAncf6u33UFllF3VqVwUl
         BrWc4cyKDbHIrmzmehl7pa65kHzyT6/Vl+qaLL6i4SqJrn9RBACqg2x5thbyoFvcZNhb
         MeeupNrSetWKmKSexy6ncQAgZGWvxla0RnRs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712181901; x=1712786701;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMV6DGmC8+TexjV5H4CBihBSEOZEkPeyx4+1TZ0zHaI=;
        b=J+bmrvnQx+ULxkW18P55r1MzsQMPL7+2gqqIjF6q8xvfvlBbV+24ezSMu5Wtui55b1
         LcIz+8qs2i2IZqiBkWlCFgwwHUKy36WJf8FkuiCZbZgeeRXXZvo+BlGSmN0aOwHwi6JK
         rqrr1PpWHhgm2+lFL8t5q76Vh00u3bnlNxwFukYaSH1XiK2qrkUThBTCk5G/Iv0y2Yes
         9l9it3MX5ibAQYKIb2p8dABJpaYdssvlwFAlk/dkFJSQPWWJoABGz96i2F7kHvqIPbHT
         kiwjQ6/vo+arVgqblS7uwFKILWMxpEVDNI7wuw+Tdp4Nwew6t+frrYRce51jI2tkgqYW
         tZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCVmuwqKmz7HSNE/g0sjia3TuMhHltWV+7AGXVYT1nLD4y1Vg8hXmfhnW5YlmuS08v1qtnUugqZNomeQAcLoqwQ6xWcclr9WZcXYI4YB7A==
X-Gm-Message-State: AOJu0YwN84E5MK+uro2XSi7KS4Vt62kID9ursoM7X88CfsRYH6YCNut4
	g4qu8jNPxJbux1X43lmkFVNVyY5odk/nQbnosoB1DuWBfOVmwT1xt+hQoYorhfRMk47OaDm2PEI
	ACWXYzaOwWCqHSb5cOj3irHEj9OearBlLrvC3
X-Google-Smtp-Source: AGHT+IGlGz6NwwFId6Uph2fl3g1kjsfJMQ9PNfKcdq6jZYYy7ZRg9sXlAEjcuxlOjhWg+5krSZlkS2bEyqTjCzrx7JQ=
X-Received: by 2002:ac2:4253:0:b0:513:df5f:38cd with SMTP id
 m19-20020ac24253000000b00513df5f38cdmr1409240lfl.4.1712181901096; Wed, 03 Apr
 2024 15:05:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Apr 2024 18:05:00 -0400
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <01ce1142-04ac-5978-9d5a-88f94b920055@quicinc.com>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
 <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com> <CAE-0n50qT2mHOGiU89NAmHdADQAAgs3aMP1RFOTTV8oCUbZKgw@mail.gmail.com>
 <01ce1142-04ac-5978-9d5a-88f94b920055@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Apr 2024 18:05:00 -0400
Message-ID: <CAE-0n53MEQHAXsfoCrJdtu5vSTxbjgak-dLFsmLfboPQAawSzQ@mail.gmail.com>
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	abel.vesa@linaro.org, agross@kernel.org, airlied@gmail.com, 
	andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
	dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
	marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Abhinav Kumar (2024-04-03 14:28:52)
>
>
> On 4/3/2024 1:04 PM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2024-04-03 12:58:50)
> >>
> >>
> >> On 4/3/2024 12:51 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2024-03-29 12:50:35)
> >>>> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> >>>> return value of cfg->configure_dp_phy(). This patch propagate
> >>>> return value of cfg->configure_dp_phy() all the way back to caller.
> >>>
> >>> Is this found via code inspection or because the phy is failing to power
> >>> on sometimes? I ask because I'm looking at a DP bug on Trogdor with
> >>> chromeos' v6.6 based kernel and wondering if this is related.
> >>>
> >>
> >> No, we actually hit an issue. This issue was originally reported as a
> >> link training issue while bringing up DP on x1e80100.
> >>
> >> While debugging that we noticed that we should not have even proceeded
> >> to link training because the PLL was not getting locked and it was
> >> failing silently since there are no other error prints (and hence the
> >> second part of the patch to improve the error logs), and we do not
> >> return any error code from this driver, we could not catch the PLL
> >> unlocked issue.
> >
> > Did link training succeed in that case and the screen was black? Also,
> > did you figure out why the PLL failed to lock? I sometimes see reports
> > now with an "Unexpected interrupt:" message from the DP driver and the
> > interrupt is the PLL unlocked one (DP_INTR_PLL_UNLOCKED).
> >
>
> No the link training had failed.
>
> Yes, root-cause was that the PLL registers were misconfigured in the
> x1e80100 DP PHY for HBR2. Once we programmed the correct values it
> worked. This was specific to x1e80100.

Ah ok, so that's what the x1e80100 patch is about.

>
> Yes, Doug mentioned this to me on IRC that this issue is still there.
> Surprising because I thought we had pushed
> https://patchwork.freedesktop.org/patch/551847/ long ago and it was
> fixed. It certainly did that time when I had tested this.

I see it on v6.6 and it is also on v5.15.y (stable kernel) so that has
been picked back. Somehow the aux interrupt is still happening though
when the PLL isn't locked. Maybe that interrupt bit should be masked in
most cases and only unmasked when something in the driver is going to
care about it.

