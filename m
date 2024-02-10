Return-Path: <linux-arm-msm+bounces-10548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB75B8506D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 23:11:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81597283ED2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Feb 2024 22:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C3675F84E;
	Sat, 10 Feb 2024 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kS+chyOy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BFD5F56E
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 22:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707603075; cv=none; b=YFJernu2eRhUbLYzhvfKQLoCOR0w8ILlScC/yznWpY2Uso2UYyWw8GiDBGm534fn0/pTueh+bnN5d1FwnHgKjcH6VeKkhK9bzwQ0umZS+ZPUowfOIHw94LTvYxnFiA9l3uZo/B5Rs38DlD7c66CUVRvH/UqlEe6J/SoAoZEWb74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707603075; c=relaxed/simple;
	bh=G9S5Yu42kiIcNW/BxRd7pGzzmGAL6HBia5W4hLPCgG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pylYaTLg7sFoukvLec9dyTAzEuiopg5enwsd9u5FjIlzZpv2cX0f2FiVh/IXDSzttF1D0EUpz8gAPTZFCYxrxzCTwYWX5KPhJZGgEEycsrcJAN+gnikjWdmpl4fNWyFhNOf+WVWDFeN03ArAbgEWwBwdWss6E4smJZk1t98KBpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kS+chyOy; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc74aac68a1so2130012276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Feb 2024 14:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707603072; x=1708207872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mN13Q1Ynkr1FhSTP7Ls2xJzRC/VEPpSD7Oksrz5dEso=;
        b=kS+chyOyUiwrCPgsT9Wgw9+RscvC0W4VInN4uI/K9mfcV83/U7I+Dt5qUW/6Bckpgf
         z1xC9GnjLFZsO+/UF3KsfyUR75eVShmO5Gx6HdDnss7VgxtR6/usGBdQMs3XAlSySmew
         pxy79FJEJ+8whDoLeFWX5mbmvE/Q5jvc1bmqpS1sXVBCZPxtD1ZxYIWwgTDySLFGpbP1
         wDWXz5EuKt/9pCphy6A3TLkFa/3P0gcKuRp1k/J7V6Z7YeN1OlLPAIl5REehkaaiU4b3
         JuLFGc/quPWoH7L7/NdwIFAIiHKt2F5g5wg9exkPVFIfRI8wkHZ0eN5zmoehCJf+U388
         ofwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707603072; x=1708207872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mN13Q1Ynkr1FhSTP7Ls2xJzRC/VEPpSD7Oksrz5dEso=;
        b=AFFcMK6vrsqm5V+7mxnc2ek1/RDKHTlZzcm9KDshu4ViQOmeWrxDPvgYomlEH1neNs
         C/ZAfmSvU8/FeyhfpNq0moFdYJVd1BAxGg//dzK+sTbC6+qFaD1M6m3+gi6/I0XW7At1
         6sYRB8dzCtlY/RJ/Lt4/iT5lDlCsjyZycwMEZjbZjAvyGK8gnrVTFJpAEIR8FToDQ4qh
         +soM7baDIoyp639+4ZlGD32qmsTNu61bv8RkMjUctUAn48Mnau3JIxirTD8lVZl8KOMf
         XCvJwQMIoXsf7JTiaWfrkD2F28Z+Qu7li9h1XYyJx6EPML8Ox0zTVzsTmrbvmPuguJn8
         aRqA==
X-Gm-Message-State: AOJu0Yxd1eAnuOeq+RAY9eb4b8OOy2+1rUk2RzKQ5PXhvytn7CqsNfvy
	i+lP+hTUTHwYsJyGH7CRg0U/IIp1xhwRauUp1QA6VcKrWXaosOlWQe1kXFPIf2/4WFmwV/IPc/r
	4649RLFyamzSm5xqFcUtjPM0Am355SFFqQV6yHA==
X-Google-Smtp-Source: AGHT+IHpK2Die0vgYTHSzxz8drNRMnn9+1bNzTrtYbLf0eiIdBlfuR9Q4GvrAghAnOa8AfmGg+NWSmQUoApZZPk0dbE=
X-Received: by 2002:a25:ef4b:0:b0:dc2:1f56:11e4 with SMTP id
 w11-20020a25ef4b000000b00dc21f5611e4mr2582230ybm.24.1707603072311; Sat, 10
 Feb 2024 14:11:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com> <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
 <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
In-Reply-To: <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 11 Feb 2024 00:11:01 +0200
Message-ID: <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush update
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Feb 2024 at 23:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> DP controller can be setup to operate in either SDP update flush mode or
> >> peripheral flush mode based on the DP controller hardware version.
> >>
> >> Starting in DP v1.2, the hardware documents require the use of
> >> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
> >>
> >> In-line with this guidance, lets program the DP controller to use
> >> peripheral flush mode starting DP v1.2
> >>
> >> Changes in v2:
> >>          - Use the original dp_catalog_hw_revision() function to
> >>            correctly check the DP HW version
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
> >>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> >>   4 files changed, 21 insertions(+)
> >>
>
> <Snip>
>
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> >> index 2983756c125cd..6ac66532b47a4 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> >> @@ -102,6 +102,8 @@
> >>   #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
> >>   #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
> >>   #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> >> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
> >> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
> >
> > Just one bit here, please.
> >
>
> hmm .... so the periph flush bits are 24:23 and we need a value of 3 to
> select peripheral flush which translates to 0x01800000.
>
> How do you suggest to break this up?

Then FIELD_PREP(something_mask, 3). Otherwise it is too easy to
consider it to be DP_MAINLINK_FLUSH_MODE_UPDATE_SDP | BIT(24)

>
> >>   #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
> >>
> >>   #define REG_DP_STATE_CTRL                      (0x00000004)
> >> --
> >> 2.39.2
> >>
> >
> >



-- 
With best wishes
Dmitry

