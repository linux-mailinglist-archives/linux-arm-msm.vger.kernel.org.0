Return-Path: <linux-arm-msm+bounces-10554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C19B48507EA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 07:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB3571C214EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 06:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21AB23BE;
	Sun, 11 Feb 2024 06:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wTyS9Rgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60FF171A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707632146; cv=none; b=rgjkRYu5BM16xdXctwxmDzMFsmpBNawkKIw8DHVk+ay/B7aaI1NP4abhWnqvoGmzpXj8jM1HAPo7roLULMRnkGHdKR4k1ph+96AX65K7khD5pSEAoIyQLZ7A4/mvo6f/0gDVhXFmuqo/sVqya+7O0w7HoS0lCO5y1yIFDiO7le8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707632146; c=relaxed/simple;
	bh=D5f0o/64CrQmu0qw/KgXLcsvgz62KoMjaJb9cCxaK1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHsXdHhQXs/7ySVceM3B7Q9eBSRC5TdDeepN2aeGUf5o9K3pQv41AZ0jW2xB1WyGzyO5/IlH+EpokuQDD6v0ByoXbKbx6AiIO4WIt72jfxo+7EinTNbX+umjHHviVg/scTUCTXjI9/e8bTfVZNM2B/hYRb9hLYaTGwVhJ0m2XQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wTyS9Rgj; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso2211292276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 22:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707632142; x=1708236942; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=trk0dkputcQ407fqLqvyMZsSbdzpr/uv3VO7AAyaZ88=;
        b=wTyS9Rgj7ZZjAGLtfPgiZsTVJkAPmPPsqFLgxdr1d+153koeJXMDFIb6h7EFR6DdSL
         3GmRPLkIP0Q4q7u4+fGJHTClfQcEfOegaZJbQoMmiktJsFXx84VQTKIr3Wxkx9oQeQlg
         +009k0XLlGk0kVIw0Zj497siRZL/rfBM8qDVmz7VHDGPG3VaKhyYTGOLSId3B5QUK/ok
         83wHxvHo6ewclirCGdU3Fzv/rfdXqnuWAldudOP3Cah+pjd+pGmnRBysMGTpNdUB0VaA
         DRhaEjJEV9u393zTcS8uO4+5fZLZ7C96LomQ2KhsI980L+MaiwDFMpvZGAQ7pQ/NoY3d
         W77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707632142; x=1708236942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trk0dkputcQ407fqLqvyMZsSbdzpr/uv3VO7AAyaZ88=;
        b=pARFRlATaWz2eSz40ygfcCN0bzOJTnS8R9kCyaD7mWovTH2aLfe1a7ecjRj5Leah3i
         UBJ0Ik7iawSRLTdOXyTQvBMkAfnjQcdquCRA+8f473fjuUU3f6Rj1cieqsTP6DFSKTsc
         nXy68PzLvNXqZVFDuULgNlq1S9cLyVvGxpXuNg+nkpC7ZEB/7m3DayljN+yd3fSEy/Cl
         Jy3qNvL0qQJc5LYBx9rMiibV+LP5hzl/wCgb4/W6g4dE5W/FWpSmxor5UCndeaA6uf9z
         zO+pxex/Jgb1sdj3oAI/pdZuoI1sum9uS76PPPdEf6/q3/YsGxvBDoTZBlDHfXWz5rJ4
         1S/g==
X-Forwarded-Encrypted: i=1; AJvYcCULVAfjJkp7L6bIu/a0RYJkgpFpqXQc/o2kKhTjOkuqDUdRdw+vaknXssujahqEYeSu6MViZsbYGAGoRKCrnd7Ydjm5uclCXqZhCFO1pg==
X-Gm-Message-State: AOJu0YwWX/PzsrFfXkeF25W5LsWBW5PE73QjtDNRMzgon0QGtgPjyS7F
	ZTuGtHbtreJbr7VoinQRC+tNM36UQy/eJzNOM1E2q9nAEsk9up7KJ3Y9I5u+ByMFQxocTCPO5aa
	49m0SstREdZn7s9cBL1U1atgptmHvsisAcuJNoQ==
X-Google-Smtp-Source: AGHT+IEh0UmJTYu0DCUGecrs4dysYDET4hFznvF9X1J/6uldo3hjxrpVHwEqlkPNhr1uryxrJjpumO3UOreBEWQDHa8=
X-Received: by 2002:a5b:c0b:0:b0:dc6:ae0f:503b with SMTP id
 f11-20020a5b0c0b000000b00dc6ae0f503bmr2582622ybq.24.1707632142600; Sat, 10
 Feb 2024 22:15:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com> <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
 <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com> <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
 <2ca5624e-1cf4-9712-f8d8-6a609d95cad2@quicinc.com>
In-Reply-To: <2ca5624e-1cf4-9712-f8d8-6a609d95cad2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 08:15:31 +0200
Message-ID: <CAA8EJpo2UBX_N6FA2oQkkvE2AgQCfc0iETDLK1-MN87410NE_w@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush update
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Feb 2024 at 06:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 2:11 PM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 23:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
> >>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>>>
> >>>> DP controller can be setup to operate in either SDP update flush mode or
> >>>> peripheral flush mode based on the DP controller hardware version.
> >>>>
> >>>> Starting in DP v1.2, the hardware documents require the use of
> >>>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
> >>>>
> >>>> In-line with this guidance, lets program the DP controller to use
> >>>> peripheral flush mode starting DP v1.2
> >>>>
> >>>> Changes in v2:
> >>>>           - Use the original dp_catalog_hw_revision() function to
> >>>>             correctly check the DP HW version
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
> >>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
> >>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> >>>>    4 files changed, 21 insertions(+)
> >>>>
> >>
> >> <Snip>
> >>
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> index 2983756c125cd..6ac66532b47a4 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >>>> @@ -102,6 +102,8 @@
> >>>>    #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
> >>>>    #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
> >>>>    #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> >>>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> >>>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
> >>>
> >>> Just one bit here, please.
> >>>
> >>
> >> hmm .... so the periph flush bits are 24:23 and we need a value of 3 to
> >> select peripheral flush which translates to 0x01800000.
> >>
> >> How do you suggest to break this up?
> >
> > Then FIELD_PREP(something_mask, 3). Otherwise it is too easy to
> > consider it to be DP_MAINLINK_FLUSH_MODE_UPDATE_SDP | BIT(24)
> >
>
> Sure, FIELD_PREP() works. I was confused when you said one bit :)

I was also confused, as I wrote, thus I thought that there are one-bit
values in this reg.

>
> >>
> >>>>    #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
> >>>>
> >>>>    #define REG_DP_STATE_CTRL                      (0x00000004)
> >>>> --
> >>>> 2.39.2
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

