Return-Path: <linux-arm-msm+bounces-31300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA79718AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:52:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31238284B0F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5811B78F7;
	Mon,  9 Sep 2024 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZXBrXwPT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D41B5EB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725882683; cv=none; b=JvVbEgvbrPaQAkwQQhmyU4yxn21+TORGvYOk5wF3WggP8JFofPmGYOR9dQsvnt08ZHhGvgmZ/h52sM+7D/mJ680LVdlvgCowSYFSWq2bA9tZeU52zYJKB68cbUEwIfg2hwiYyWfahlA6CSZbnZaYH0XVSDvTvHqYkrFGyWBU1Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725882683; c=relaxed/simple;
	bh=BbWjoQ45d+g8AqhbdV0mu/mdMLVinfQ53fl8AVSz1Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohReC7QlSmNXvRjy9TTsFhbq5tD6fGT6sRq0fGCd81cRPYw+TitGACSNJR3AGsAlVUfxcAvmiR0XrJj4vtrErNhWGBaNPMwGjI6pclNGATMZ/x3yWEkDWDyAuBuK5aZPiPOmnQzFRUPFxyj7l8JodLvXIup24W1D3cBy3WpODgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZXBrXwPT; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6d7073a39dcso46408117b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725882680; x=1726487480; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2DW9+4+5dkfE7I6UYkBdI6PKZkJx34MPOXwo0S6pwi4=;
        b=ZXBrXwPTcTDP2CwflXldP/MtoXpUZLNF4twAtf2ZQC9GXjLdFf7VGclL8iCtO7wJ5Z
         GOrnQTYLL7wgcQnkKYvCFWER/dJTjOzW/ARn4idKZTmNk1MlmMxDJIB0Lyx7kCHwfwfS
         QK6uZstiCoq19FLx6vcYLXMCBj5ub8TohHXHFwzevr5t1Pb1txuYnBTWNIjo+kTmvLby
         o2My44kHiYtWVbjjw8P6nsJkdv7Ok3BXPPhX/D+cSW9atKeBELzmQyZjzCseaTnJ0EGh
         6a279C/f+0MOITPQpf36v1XJ9qTSpP8MyhkolqAqizhBV73MDnoXUXpAjr8NQN2kqWa9
         PHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882680; x=1726487480;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DW9+4+5dkfE7I6UYkBdI6PKZkJx34MPOXwo0S6pwi4=;
        b=YJ19cSrhCqk2BU3ZC5d99Rb+O32VhYT1UEmUG7b2Ay/wZSZJb8LNlgd/EGeL0+u2AW
         gu1/9W3lXDPUvEKqKuoxr8WEFRR+r2g8s8eoZOGc6ylsRm39Y/DvBcAxOysleHJWdSea
         0McObs9yhFNOUpKSw9ZMsXY/L/X15ATvs5vClo67hhfab2WewoMjL96pdq/XKR6FOmL8
         nTngQn2a0mUpE8M20Ql+Ps8LNpq3Hoffc7jIdZbS9M4dyZG4mprQiA8+x8cBRu/cY3f3
         EIY2kUxXIEaZYtGrwWrsv9FVAZiM15snjYoIgvul7s+ZQOcD1QXR+sdVnTXCuAZaE91H
         /Ibw==
X-Forwarded-Encrypted: i=1; AJvYcCWKm5zeOdwwAWSs7Joh4zX0m3RoV/wupK750tYUs88qnk3305FTpWhoy+b9mR+fjsGiRP4F5j9KIZE4e8w4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFdt8lUy0ByOQ87IEWrE4s4qyzFWE8ztUnDMhGI2IlKHLV+PCR
	80whzF4Vm2Y2Y8HvuXKT62q63YhgAXPYT94w1cezVsL/ADSln0Urj0DMReLeCzAej61XOShYkAq
	4AremxvjggT5Y5iU+8m/ubmqWMTtcvn2xVpspVq56UIeSkleh
X-Google-Smtp-Source: AGHT+IEMTaW+rWSxBziYnJcShG+IJ94pyw+lUFZaTrGyjB3BTvwxhatfwf6+foBYAXccdSu//5Pp4I9bSN82zQLDkXE=
X-Received: by 2002:a05:690c:3384:b0:6d5:6718:e5d2 with SMTP id
 00721157ae682-6db25f48dc7mr130087127b3.3.1725882680477; Mon, 09 Sep 2024
 04:51:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240909073141.951494-1-ruanjinjie@huawei.com>
 <20240909073141.951494-4-ruanjinjie@huawei.com> <45m7oruivszoiesijmdr66oeatvr3ff6ores4lx4kbus2ti552@5sobv4hk7laa>
 <5487bcb2-7792-e3b3-5972-d224df61b9da@huawei.com>
In-Reply-To: <5487bcb2-7792-e3b3-5972-d224df61b9da@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 14:51:09 +0300
Message-ID: <CAA8EJpp2H4uGieVXj8varne2H3sAJhponApj0-baM1rcaOTCBA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] spi: geni-qcom: Use devm functions to simplify code
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, akashast@codeaurora.org, dianders@chromium.org, 
	vkoul@kernel.org, linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Sept 2024 at 14:46, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/9/9 17:49, Dmitry Baryshkov wrote:
> > On Mon, Sep 09, 2024 at 03:31:41PM GMT, Jinjie Ruan wrote:
> >> Use devm_pm_runtime_enable(), devm_request_irq() and
> >> devm_spi_register_controller() to simplify code.
> >>
> >> And also register a callback spi_geni_release_dma_chan() with
> >> devm_add_action_or_reset(), to release dma channel in both error
> >> and device detach path, which can make sure the release sequence is
> >> consistent with the original one.
> >>
> >> 1. Unregister spi controller.
> >> 2. Free the IRQ.
> >> 3. Free DMA chans
> >> 4. Disable runtime PM.
> >>
> >> So the remove function can also be removed.
> >>
> >> Suggested-by: Doug Anderson <dianders@chromium.org>
> >> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> >> ---
> >> v3:
> >> - Land the rest of the cleanups afterwards.
> >> ---
> >>  drivers/spi/spi-geni-qcom.c | 37 +++++++++++++------------------------
> >>  1 file changed, 13 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> >> index 6f4057330444..8b0039d14605 100644
> >> --- a/drivers/spi/spi-geni-qcom.c
> >> +++ b/drivers/spi/spi-geni-qcom.c
> >> @@ -632,8 +632,10 @@ static int spi_geni_grab_gpi_chan(struct spi_geni_master *mas)
> >>      return ret;
> >>  }
> >>
> >> -static void spi_geni_release_dma_chan(struct spi_geni_master *mas)
> >> +static void spi_geni_release_dma_chan(void *data)
> >>  {
> >> +    struct spi_geni_master *mas = data;
> >> +
> >>      if (mas->rx) {
> >>              dma_release_channel(mas->rx);
> >>              mas->rx = NULL;
> >> @@ -1132,6 +1134,12 @@ static int spi_geni_probe(struct platform_device *pdev)
> >>      if (ret)
> >>              return ret;
> >>
> >> +    ret = devm_add_action_or_reset(dev, spi_geni_release_dma_chan, spi);
> >
> > This should be mas, not spi.
> >
> > Doesn't looks like this was tested. Please correct me if I'm wrong.
>
> Yes, you are right, the data should be struct spi_geni_master, which is
> mas. Sorry, only compile passed.

Please perform a runtime test or mention it in the cover letter that
it was only compile-tested.



-- 
With best wishes
Dmitry

