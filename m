Return-Path: <linux-arm-msm+bounces-12149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E2985F4ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 10:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F98289A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 09:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E9938FA0;
	Thu, 22 Feb 2024 09:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwJMM1Kg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C337138380
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708595200; cv=none; b=KPZGO6AyG+963miqh8caTgC8F4LqFzqCi8O85GRvyU3artWOwf1Gh8XdyN2E6Ip7zuX7OFGGWwij8xLvT1zBAoidaQKrNYVn+kSFGoapDNd8EVF2PEYuGx7MB3kFumCZCp6zfymSsPrFVXy54BSI30bewtgwVJMeNW2BiKk2l94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708595200; c=relaxed/simple;
	bh=bPCV+xnb1Qk+NcS73lqI21dN52imcgJotWmT68p5gz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNbge5Ihg1b2Uv0VLuzAu8ONkin7bnTu4VGFLxO/5H8+W5m6dzTCUMzVYCrB7iK6NrksurN9ump+IYt48YSZYNDN1aZqqgViXhI41z6Rtwsydbic8icafUpK8A8qV+MzNDuS2mIWhq7iggfyWwUf+5Abv+h0XEzrmkgn4XIiRHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwJMM1Kg; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcdb210cb6aso8491438276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708595198; x=1709199998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrHiV4SbPrNlHGeovFDnwlGAOJlYDpe2wRYcFnz5Qkw=;
        b=pwJMM1Kg351ZaCBT3YrECkJG+hyPYFBHZHDTOpW6+w8TdKKaKoWjQXhgfiQAeqVDtS
         J9vb+bRFaFVPElzAL1rQLjzX6xe6RDsI+UL7EembEkspgS2BZPiKGiSIQviPw/OE2/oZ
         sMJvAYsziXeWepafAgDrugdocNvpbIDQtjixX3rPIR57M76JBg7bfvkvuuUWOymhzP9F
         5pZh2ZlQK53um/05k3+gCqRyCrNlWnSmu70T4Hy8+pxAQCrP6sKDfIoos/+JH5P530Im
         Q0DbOAa13WqEIid/ylG6BjizZGAVEVsb2DzavmRoG4eWzm1BJlPWZ9LipQqmUK6m/WD1
         UOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708595198; x=1709199998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrHiV4SbPrNlHGeovFDnwlGAOJlYDpe2wRYcFnz5Qkw=;
        b=jd165wl8HLqXIXlf3f7oSAAdaFDnkEyeQb3k2Q5lIXLRpe0AXA0TLElPdy05BrzH9S
         XVQ555tp4+hEHOHBpGoye7Yso1Tl8RFLAHpHYmMYGIl2Hm9DcZBiEW9+f672A3tuuMRb
         ntw3rCGAbjocyty/Mx4FA+imbAQl40XQEXRPgE0KNK5KKmj4o9pqJA4TUqVHFdVgc3re
         wF6GofMLlG3sjVCHWbXTlyY3q7YR19VS0Shrf+R5si/5VOSZ2t9spWin91zKZhUdbRL6
         3P815X97cMi9aKVcRccE99BYzINgnO8KiA9dchLFtm7DlAWdj0CH4EcxBKvoa8I5uBjW
         tl+w==
X-Forwarded-Encrypted: i=1; AJvYcCUW7RSOxsOsHLjp3Q3j3S4ExfXChNbYotSOycWq3FfXRZLtiP62gMqpw5cikko+47a0EMyQA+FiWZc6oTVxgYPjk4pc5f86XzY0Ya9MGQ==
X-Gm-Message-State: AOJu0YxFnIWl0OaBrOqiKBQ9GLEdBVz3N2uGoq0tp8nN09Qte/cb9iYF
	coFbaevWTEIH2gBoIeB8HPSPLsCszHRCe9DZsKA6z7mrNT+nvbV6KvWZMafM4pRc1/hlcfbw9qY
	k0M7DwucKj5UYEbyoBS22bK1X6WJFxdhPrvlajA==
X-Google-Smtp-Source: AGHT+IGEyFWMc/Bnv5N7cDt95kU2F8T66cMEz+jPU0sJPw/x3JWrXvmnu3gbf07WKBKu3lfbVlW8M9QwMg8fyGR6PUA=
X-Received: by 2002:a25:c805:0:b0:dcc:8114:5a54 with SMTP id
 y5-20020a25c805000000b00dcc81145a54mr1737712ybf.43.1708595197808; Thu, 22 Feb
 2024 01:46:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org> <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
In-Reply-To: <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 11:46:26 +0200
Message-ID: <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, Douglas Anderson <dianders@chromium.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >>>>
> >>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
> >>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
> >>>>
> >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> >>>> fix this.
> >>>
> >>> I think we might want to keep this disabled for ChromeOS devices. Doug?
> >>
> >> ChromeOS devices don't get a special SoC
> >
> > But they have the sc7280-chrome-common.dtsi, which might contain a
> > corresponding /delete-node/ .
>
> What does that change? The clock rates are bound to the
> SoC and the effective values are limited by link-frequencies
> or the panel driver.

Preventing the DPU from overheating? Or spending too much power?

-- 
With best wishes
Dmitry

