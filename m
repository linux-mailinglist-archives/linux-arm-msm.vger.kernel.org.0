Return-Path: <linux-arm-msm+bounces-10100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6284CC8D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 15:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 441E5289245
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 14:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8003B7CF01;
	Wed,  7 Feb 2024 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xw4M+GPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DAA7C088
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707315795; cv=none; b=oB7y7KHrZoJam0FBDSnt4hqb8kIfzAC7WUiE7nSnCr0HpXDQ+HvXA8Y6vH3hVJHgP4WwC/SuA7y5Kfp6xBtdORNW+YZfnOwGqREG8Cu/1lyoOQHcpOIWc3rya2UKtqBg2JY9ExC780KJQVo1neWdb/kRq+oiwpPmujAwnCRxqHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707315795; c=relaxed/simple;
	bh=KXPT3RQ7xZ9UjxNutcXeQY6ebKT0USSo83lOU/JwX8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvUZB+/zD+AqbK9MvWrzOP1tJnMvtIHxI03TFsK1xeWXNXDVDjWfxaFdssWnLL8lZh3OZFsFIhXxQnEjxW/PNquK/CVg7VyHAgN0OW2bhbc8OU0ydE9kVYXotay+ABFuWNdkQ9u0CChQistEsj8Tj5P5Ua8Et3P5y5o0+U6zuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xw4M+GPc; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60498c31743so4431397b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 06:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707315791; x=1707920591; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NN/ggxE6zp/Y1IoNQERPdWJUv6afgR+QSAVhmKfAOOw=;
        b=Xw4M+GPcFQ7KSJFbGT18Arda46M+GEQTC3aNB/7UheSVQrh32u+Xq3QWjrarGbzbjZ
         QiwvI9SM2eLPvlUYC/MsAd2iVksG0rJQkRRy6ysFND33HS0RJCPttsAoxb+561FokQLP
         r+4d6H8oUxkL5jHFClrr2czd6cyiSP/nIHcgDjZZPfOVmXcxwUQcP62DppmGt92whYAb
         LKpUxRXt3iUDm9UZbaoCrtvW6B0AHUnFqXn8/yEyRnwzzOB3mssjQjH0JFXl1KuTTWVu
         jTWGodvYFyRnw2XmaKhKBp8715ER3lNOIlBzzxgbXbB8a5NgGmc9nKFIV4ROVxhuQVX8
         ZC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707315791; x=1707920591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN/ggxE6zp/Y1IoNQERPdWJUv6afgR+QSAVhmKfAOOw=;
        b=bnbVXRGS77YafVgIKfhkfKCxubUtwoU0WFBTkEhvA7cOcNhagWV5VAaxQwoa5KkJkr
         B2l0tcKOYg6GH8M/qNlRgiNyPorrQgQRdoEk1hMen3QcJN57FXxVp0Sm3NvCXOAJSNo3
         zjxlOpZDlAGhk4hISRv8njqXZ9+Kv9WQkY7GU8AWgEd9EGweB0iQTOuHsAKlFiKop3U9
         5gfhI0lWkbGwyjSvUSieF42+nhrrPtes6yYZQLY0FLtD6jppdy2i3+J9dTkF3IHIOiWP
         h7t3MDmMNV2eY3k+otGTk5ug5xcQMtlLsKc9d1TnWgv+STn7BWMC+IPUb7sw4uHfAGCx
         KtZg==
X-Gm-Message-State: AOJu0Yy6VCo9AHTbE5XAml4ZBJKI75RxAxCn8kJ+fJqgKvyOQRI3oRsi
	VpVGgHjl4qYJUApCHawphCV6df4weAOEur5ifApyDmw2PKKRlyvGqXnuJ7BcZw29aR0kIaOEE5D
	dBcbzIAgjMipFPn1R9fzYwELJ5uTxPXXf97F9PA==
X-Google-Smtp-Source: AGHT+IEsEJHF3eE74QW4d9YvkhCZ3ENkFCjw3eZ4LAzUtI+jLHojONNq4/nJ0gGQ3kI/P9NFLLSds3yeJ1sOEIAlb5s=
X-Received: by 2002:a81:e345:0:b0:604:4597:b904 with SMTP id
 w5-20020a81e345000000b006044597b904mr4948767ywl.31.1707315791482; Wed, 07 Feb
 2024 06:23:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
 <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
 <CAA8EJpqsJmv36=o1aTjVH6eMHXMg8BHNpiDvs+Q8YB23ezVGtQ@mail.gmail.com>
 <ZcMvFtAwQQjAZhk6@linaro.org> <CAA8EJprqWLX7_yWZzKp3FAKFGkSkk041f9hj1uXuRBrbH5APyQ@mail.gmail.com>
 <ZcNIddeG6VHxBEOQ@linaro.org> <CAA8EJpo-16u34Yc6MLmHSqFrQ0VrZAq6TwGeVc5WFwMmhruqoA@mail.gmail.com>
 <b4018932-2fcb-4a15-9ec4-e29e5761d3e0@collabora.com>
In-Reply-To: <b4018932-2fcb-4a15-9ec4-e29e5761d3e0@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 16:22:59 +0200
Message-ID: <CAA8EJpo5bb+AWJra26MoDPKE_vF+eBAJAGoxenkMtGWz2N5Tuw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] spmi: Add support for multi-master
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Feb 2024 at 14:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/24 12:45, Dmitry Baryshkov ha scritto:
> > On Wed, 7 Feb 2024 at 11:08, Abel Vesa <abel.vesa@linaro.org> wrote:
> >>
> >> On 24-02-07 09:23:09, Dmitry Baryshkov wrote:
> >>> On Wed, 7 Feb 2024 at 09:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >>>>
> >>>> On 24-02-07 01:55:39, Dmitry Baryshkov wrote:
> >>>>> On Wed, 7 Feb 2024 at 01:34, Abel Vesa <abel.vesa@linaro.org> wrote:
> >>>>>>
> >>>>>> Some newer SPMI controllers support multiple bus masters.
> >>>>>> Such a master can control multiple slave devices. The generic
> >>>>>> framework needs to be able to pass on the master id to the
> >>>>>> controller-specific driver. So do that. The framework will
> >>>>>> check if the devicetree child nodes are actually bus masters
> >>>>>> and will register the devices for each master. The legacy
> >>>>>> approach will still be supported for backwards compatibility.
> >>>>>
> >>>>> Please remind me, are those two actual bus musters driving a single
> >>>>> bus in parallel or two SPMI buses being handled by a single device? In
> >>>>> the latter case this implementation is incorrect. There should be
> >>>>> multiple spmi_controller instances, one for each bus. Allocate them in
> >>>>> a loop and set ctrl->dev.of_node after allocating.
> >>>>
> >>>> It's two SPMI buses (two sets of wires) handled by the same controller,
> >>>> HW-wise.
> >>>>
> >>>> If we register two spmi controllers with the kernel framework, it will
> >>>> be HW inaccurate, because there is just one controller which has
> >>>> multiple masters.
> >>>
> >>> struct spmi_controller is a controller for a single bus. Inside your
> >>> device you have two SPMI buses, each can be controlled by its own
> >>> struct spmi_controller. Just like devices that control multiple I2C,
> >>> SPI or USB busses register a separate instance of the bus controller.
> >>
> >> Well, this is what this patchset is trying to do in the generic part.
> >> The SPMI controller supports multiple buses (HW-wise) and therefore SW
> >> implementation shouldn't be tied to single bus requirement.
> >
> > So, after the off-line discussion:
> > - add new compatible string for sm8450+
> > - register two spmi controller instances
>
> Well, I don't know about the actual hardware that you're trying to implement
> but, in my opinion, the "idea" of this series does actually make sense.
>
> The SPMI specification says that SPMI supports up to 4 masters, and up to
> 16 slaves.

So, that is my main question: whether this supports multiple masters
on a same bus or multiple buses. From the SoC pins description I
assume the latter is the case.

>
> Just my two cents.
>
> Cheers,
> Angelo
>
> > - drop the master-id from the SPMI interface
> > - optionally: think about having a new separate driver for v7 SPMI.
> >
> >>
> >>>
> >>>>
> >>>> I'm not saying it might not work. But, to me, it looks more like a hack.
> >>>>
> >>>> Basically, we would be mapping HW bus masters to kernel controllers.
> >>>
> >>> Buses, not just masters.
> >>>
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>>>>> ---
> >>>>>>   drivers/spmi/spmi-mtk-pmif.c |  6 ++--
> >>>>>>   drivers/spmi/spmi-pmic-arb.c | 10 +++---
> >>>>>>   drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
> >>>>>>   include/linux/spmi.h         | 10 +++---
> >>>>>>   4 files changed, 67 insertions(+), 35 deletions(-)
> >>>>>
> >>>>> --
> >>>>> With best wishes
> >>>>> Dmitry
> >>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >
> >
> >
>
>


-- 
With best wishes
Dmitry

