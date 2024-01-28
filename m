Return-Path: <linux-arm-msm+bounces-8679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882F083F41B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9F941C20F2E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A46DDA0;
	Sun, 28 Jan 2024 05:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jr5UtlA2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242ABDDA1
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420168; cv=none; b=oq0M8oqh/nOCu+n/GOgltKlNtMmlUfB9FUZkfs90TZfiCOSvm/iaMDGrjtyJ/xgZSlu8vKv8INifL6xxNO09hsnRibQKfOzwIjQVqzWhCCYz1OXD1c7OtxLlqvZ4QPZ21qHs3Imxoktr54beK/fiLar6HP41BmzEPAuSjWX9DRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420168; c=relaxed/simple;
	bh=2d2YKBfSkcHsyVVx5SD9YiHwf5vWzA1md/BkP5jaE1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDz96Rh5d9Do3k6sI4hrUrdaoCgRDagW88SkBDSRVPmVXc9Bt3HFH8eztMmHbQx39Bf6dG6l1VRAEDauuIYWrvojMYiCy8lyH/25TdOzURJ0VkbO6YgVl/RVpUpt6+n3IdgEqt1FCTmPzNW9+1N03/XzSmb+POegfl7et7ZJSuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jr5UtlA2; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-602ab446cd8so16987387b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 21:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706420164; x=1707024964; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eb27nl58LSSIP3Iqh05TC9E1Wsp3/3yzR9D7Ha5jIfc=;
        b=jr5UtlA29qqmUpc2dY/PXfQCbcJ3tFYJzuUamwuZ4xYNQhv9ImiEZ2dObQ0e5mIbDB
         q21OsETq/dxsrC3eNsaqcezpTcxAIsTMz/cR0qy1mSYC9TvZNW8S76xYu2qwpFdaax19
         KiSoWJd9NLEqo8NEU34Xr9WWXoM2bBcLEuMUd/rYdyxRLdB8qa9XSYcxn+CN8Oj5qdtf
         eU/V4S6JykBOaTGPVIzse3fo8AEGVP/ny5mICrzY96eu2rHDnrBZjIZ8nFXuZqi16nQh
         0UPco3TPEN5lVPJyt0CRlvLfWmj1jT4NyJL6J+HIBNE/YpAK9i5Sg83X5qZOYeEEYPHB
         51Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706420164; x=1707024964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb27nl58LSSIP3Iqh05TC9E1Wsp3/3yzR9D7Ha5jIfc=;
        b=T3fJlsyVLgsdmOpfKk7edeXVVCPT1MpZ9wDHiBWsbVJw9qjos2uzZ7RarvtN3AlNAC
         F3X9HllkwOMtbadb0GKoeaFmx5aUtrvijmD66tqAXec08ktvkl0Ii97xzIVwb1YmkSG4
         0Au1QsfscbgvvM9aU0jOwVxvPdkzyrfcQ7wcyEXPvynV4VYCNJpi4cAT/1wuxQj+PB34
         y/l6z519iVUd722+TSR2A46PgSu2apvEvweqNNKJUxnqN+rIFXY2bOCXwfyoKDXOuF5c
         83TpMJasL+C7XVw88bFIi8RC9Oyi+D8koQERF2KB2ld3gCjD3axjXJechAot0LtfqQjt
         cr7Q==
X-Gm-Message-State: AOJu0YxhifKvp4Vtd4Kaqa2nkYIsHIDXkWQlp5R0cQ8Ze21X0/XjbQYp
	xiUqhI3uY1Wo7Mm2z7i4qiwX4/cvzNn5fB22XOzthl3bKLO0PprQIFQlRjydsCWEF9fdLVKRToZ
	qelSRHprhsQg/o8D7vu3sdOF9PHUKuF1I8ERXUA==
X-Google-Smtp-Source: AGHT+IEwo0pJM9DyAjs8fHbCytd1W+kElT7MH4NUs7dfhb8bLi8TYhWxVVt1bZC7M4yIlCkYReWK8xPOAsD+4cGtiYE=
X-Received: by 2002:a05:690c:3603:b0:602:ab47:5a00 with SMTP id
 ft3-20020a05690c360300b00602ab475a00mr2413202ywb.60.1706420163884; Sat, 27
 Jan 2024 21:36:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-11-quic_parellan@quicinc.com> <c06c4a5d-6042-4d0a-a0ca-6321792f1061@linaro.org>
 <c1133eaa-703b-21fb-8715-602e7932586e@quicinc.com>
In-Reply-To: <c1133eaa-703b-21fb-8715-602e7932586e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:35:53 +0200
Message-ID: <CAA8EJpoT2cLvSyuqnwYRVPETnsmV2B-KeWFU86QcDbe3zAnoWw@mail.gmail.com>
Subject: Re: [PATCH 10/17] drm/msm/dp: modify dp_catalog_hw_revision to show
 major and minor val
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 07:31, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 2:07 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Modify dp_catalog_hw_revision to make the major and minor version values
> >> known instead of outputting the entire hex value of the hardware version
> >> register in preparation of using it for VSC SDP programming.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 12 +++++++++---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>   2 files changed, 10 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index 5d84c089e520a..c025786170ba5 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -24,6 +24,9 @@
> >>   #define DP_INTERRUPT_STATUS_ACK_SHIFT    1
> >>   #define DP_INTERRUPT_STATUS_MASK_SHIFT    2
> >>   +#define DP_HW_VERSION_MAJOR(reg)    FIELD_GET(GENMASK(31, 28), reg)
> >> +#define DP_HW_VERSION_MINOR(reg)    FIELD_GET(GENMASK(27, 16), reg)
> >> +
> >>   #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
> >>     #define DP_INTERRUPT_STATUS1 \
> >> @@ -531,15 +534,18 @@ int
> >> dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
> >>    *
> >>    * @dp_catalog: DP catalog structure
> >>    *
> >> - * Return: DP controller hw revision
> >> + * Return: void
> >>    *
> >>    */
> >> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog)
> >> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16
> >> *major, u16 *minor)
> >>   {
> >>       const struct dp_catalog_private *catalog =
> >> container_of(dp_catalog,
> >>                   struct dp_catalog_private, dp_catalog);
> >> +    u32 reg_dp_hw_version;
> >>   -    return dp_read_ahb(catalog, REG_DP_HW_VERSION);
> >> +    reg_dp_hw_version = dp_read_ahb(catalog, REG_DP_HW_VERSION);
> >> +    *major = DP_HW_VERSION_MAJOR(reg_dp_hw_version);
> >> +    *minor = DP_HW_VERSION_MINOR(reg_dp_hw_version);
> >
> > After looking at the code, it might be easier to keep
> > dp_catalog_hw_revision as is, add define for hw revision 1.2 and
> > corepare to it directly.
> I thought having a  define value of the version would be harder to
> follow than what's here currently. Since having it compare to the
> version value looks a little difficult to read versus having an explicit
> major and minor value version to compare to. For example having (major
>  >= 1 && minor >= 2) versus having something like (hw_version >=
> DPU_HW_VERSION_1_2)

The problem is that major + minor are harder to follow and harder to
implement. You got them wrong, btw. For example 2.1 is greater or
equal than 1.2, but it doesn't pass your test. So, I think, a single
define is easier and less error prone.

> >
> >>   }
> >>     /**
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> index 563903605b3a7..94c377ef90c35 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >> @@ -170,7 +170,7 @@ void dp_catalog_ctrl_config_misc(struct
> >> dp_catalog *dp_catalog, u32 cc, u32 tb);
> >>   void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32
> >> rate,
> >>                   u32 stream_rate_khz, bool fixed_nvid, bool
> >> is_ycbcr_420);
> >>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog
> >> *dp_catalog, u32 pattern);
> >> -u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
> >> +void dp_catalog_hw_revision(const struct dp_catalog *dp_catalog, u16
> >> *major, u16 *minor);
> >>   void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
> >>   bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
> >>   void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool
> >> enable);
> >



-- 
With best wishes
Dmitry

