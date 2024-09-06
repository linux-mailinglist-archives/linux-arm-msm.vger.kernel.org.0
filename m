Return-Path: <linux-arm-msm+bounces-31047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8A96E85C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 05:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 604291C22A76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 03:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3B31CD31;
	Fri,  6 Sep 2024 03:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aemxBd4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B84594D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 03:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594200; cv=none; b=udkVVTFjcAF6lYn43QeL2JR2zfLxJO0ZFDb8mbQAvhB15nDSGshEwsB8ae6ZjhbaxzMYbDSBJi/MLbHE84axdeTYTJw6y4HlonlzPkA5Sv7/OEkfdqS/pm6NskCsZzRnAwRsNBL4RE8nR6oXk/ft0JUQG0k0TJXBU+jMp2PHrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594200; c=relaxed/simple;
	bh=Nrh/1FNwSNAFpDboOkKJkA3+PgcOX8eoc3nTIKshy8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKvarsKmeuZcme3k5HRM4zHbzFMa+HaMHoe71kG2GAJ/ABwCFMN6yIsebApm3bCKSBo7ci3e3j6OrI3cTrFQeaw2rrW/xn0rgrws2+Tm4yRuqcwpnC8GAsILUamxTQ73oc482VOn+aSZSpnhawIkr15raLaJnDNmvaDAdHvbNKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aemxBd4I; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso1146648a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 20:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725594198; x=1726198998; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=coRR6IgYTAFcd1KLiJxomjeuHeCEOBeca3nY95Gx+5g=;
        b=aemxBd4Id3o2VofdGDTrTu83Otr73DWm6M7WYTz0NIGfAgvXvhozDaHbQBsw0Lmx+K
         EP3/QwQNsJV1+fg5dInrZKoRndZJHY1uoPbQC8w5MIw9f5ne1yAPpV7fJ224r18ABkl5
         q7ZSoD+pt8kIFDV9FOhmh0/1x9ppTzYGcRJfornonw38npzbMLVPqHxOvkQfgowQeBKO
         FawJ9ckAVG9eJ3BGLxczqreE9SqMnUezpDOKQkb/GmQe6qJAaj5j7QGrKH8egMkDsEfG
         eOJNA0MOasxmSF0Cjyxs4xBmNdXc5+JIcQ7hH8cGeeJD2CRFQWadB/qlQ2JGPLie1t8n
         ev8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725594198; x=1726198998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=coRR6IgYTAFcd1KLiJxomjeuHeCEOBeca3nY95Gx+5g=;
        b=g2x7HRxCO3atHKcMEdfr9nzCwhb1guK6JfjHOcdVUJU+1J3NkKhMAIyTZwHG8erQqu
         LZ5D2WPE8uAII+dVTcvV8binH6hYnz8L/370mT/hG/NpRZS7+WeywqhXCdtlBHU/T4UX
         vtR7Zx0UynjKAKGOdHT6ooK5wx8QKrzi+dvPMQDtjEdT3EVifDop75JnSupEGTtiu5O2
         3CyPHzQWj8B8hWQ6/AE0PzXqZp9uD8T2aPRG89jQJL9fI6Yp3qIGy2XZCzHT68NsdOsH
         N091Bm6G6TU0WYYD0MO4DkJCKbargFEsi/RbvvMxpemqacf5mmMSi08ExxDXrKItMGvV
         PdUw==
X-Forwarded-Encrypted: i=1; AJvYcCVV9E76P91Uyb92fZVBJpeg3cZN+pIRyZAP8ouBnkCEl4hnoJMPBJ8+be/qvY0x58IDbvx2DkxSLMobaFB+@vger.kernel.org
X-Gm-Message-State: AOJu0YxQBWACGzDQl2gH98DWEne8+BD5X833axaPrBaKwAuwtAckdv5g
	sGMEt/6noJQWc5Vb33eVyjq9SOrw/81LV22lT5rCfKG6WJ05KVWMZgrOV9iBM0kcD2F7jX21bom
	IbGmW5qzaddJfsKRgIisvJsufVCQIhT4IYcx1cQ==
X-Google-Smtp-Source: AGHT+IFgcvz+Q+Rmmjkwuc2hfoPGN9z7VKM0kCCOf1gyMpgYlDZCTYJt+4r9tQFDZUcE68WTnVz93T5DTyuShX8zc9g=
X-Received: by 2002:a05:6a21:1584:b0:1cf:1863:6467 with SMTP id
 adf61e73a8af0-1cf1d1b5cf3mr946918637.31.1725594198395; Thu, 05 Sep 2024
 20:43:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906031345.1052241-1-ruanjinjie@huawei.com>
 <20240906031345.1052241-3-ruanjinjie@huawei.com> <hnos3f34ejabyw2yxtpxifskhklunvnufgsuilghjeuzipqkxi@udw5xfeum37a>
 <050a6434-00f9-4bba-a122-52c3a23fcf70@huawei.com> <CAA8EJpod2OzNEoquSGuJXLUx8-r+J0_YjPzv5pFDFHum9siisQ@mail.gmail.com>
 <3d48b7c3-6dba-b113-9207-f3daa874253e@huawei.com>
In-Reply-To: <3d48b7c3-6dba-b113-9207-f3daa874253e@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 06:43:06 +0300
Message-ID: <CAA8EJppbuMGjo3PHBnmHF5yXFOBUon50ZSKKzWFqGs3qgFmR3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: spi-geni-qcom: Fix missing undo runtime PM
 changes at driver exit time
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, vkoul@kernel.org, akashast@codeaurora.org, 
	dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sept 2024 at 06:41, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/9/6 11:36, Dmitry Baryshkov wrote:
> > On Fri, 6 Sept 2024 at 06:31, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>
> >>
> >>
> >> On 2024/9/6 11:15, Dmitry Baryshkov wrote:
> >>> On Fri, Sep 06, 2024 at 11:13:45AM GMT, Jinjie Ruan wrote:
> >>>> It's important to undo pm_runtime_use_autosuspend() with
> >>>> pm_runtime_dont_use_autosuspend() at driver exit time unless driver
> >>>> initially enabled pm_runtime with devm_pm_runtime_enable()
> >>>> (which handles it for you).
> >>>>
> >>>> Hence, call pm_runtime_dont_use_autosuspend() at driver exit time
> >>>> to fix it.
> >>>>
> >>>> Fixes: cfdab2cd85ec ("spi: spi-geni-qcom: Set an autosuspend delay of 250 ms")
> >>>> ---
> >>>> v2:
> >>>> - Fix it directly instead of use devm_pm_runtime_enable().
> >>>
> >>> Why?
> >>
> >> The devm* sequence will have some problem, which will not consistent
> >> with the former.
> >>
> >> Link:
> >> https://lore.kernel.org/all/CAD=FV=VyDk-e2KNiuiBcACFAdrQmihOH6X6BSpGB+T1MsgsiKw@mail.gmail.com/
> >
> > That comment was for devm_request_irq(), not devm_pm_runtime_enable().
>
>
> In the very least, ** parch #2 needs to come before this one and that
> would help, but it won't fix everything **. Specifically in order to
> keep the order proper you'll need to use devm_add_action_or_reset() to
> "devm-ize" the freeing of the DMA channels.

This is patch #2. so I don't understand your comment. Moreover you
don't have to use devm for each and every possible item. However I
think it makes sense for pm_runtime in this case.

>
>
> >
> >>
> >>>
> >>>> ---
> >>>>  drivers/spi/spi-geni-qcom.c | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> >>>> index fc2819effe2d..38857edbc785 100644
> >>>> --- a/drivers/spi/spi-geni-qcom.c
> >>>> +++ b/drivers/spi/spi-geni-qcom.c
> >>>> @@ -1158,6 +1158,7 @@ static int spi_geni_probe(struct platform_device *pdev)
> >>>>  spi_geni_release_dma:
> >>>>      spi_geni_release_dma_chan(mas);
> >>>>  spi_geni_probe_runtime_disable:
> >>>> +    pm_runtime_dont_use_autosuspend(dev);
> >>>>      pm_runtime_disable(dev);
> >>>>      return ret;
> >>>>  }
> >>>> @@ -1174,6 +1175,7 @@ static void spi_geni_remove(struct platform_device *pdev)
> >>>>
> >>>>      spi_geni_release_dma_chan(mas);
> >>>>
> >>>> +    pm_runtime_dont_use_autosuspend(&pdev->dev);
> >>>>      pm_runtime_disable(&pdev->dev);
> >>>>  }
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

