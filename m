Return-Path: <linux-arm-msm+bounces-31049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0F96E86E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 05:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6D51C21783
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 03:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7E22F855;
	Fri,  6 Sep 2024 03:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4kw9+H4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F262E822
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Sep 2024 03:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725594736; cv=none; b=uHYeHWl38xZpOSFPU1Uvrjt97p7+gsd1Kv2iuHpA4YeXZUtBgiMrQFa2C8w15g9XRJ5UCwBLLwcB6q4lSSovI0K8wDAHEdGL6Lg5SsgpeNqKROE5yTSjJ2gYBe8mYcxe6HyrkAloBJltsvW5GsmNv7D3ZZaP3fCl1iti+TcZ3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725594736; c=relaxed/simple;
	bh=w74Sil1Hza/L2EJKOCLxnglWbDMuX3ZxVLqw//w+2bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHQjOSkrvz0m1ov8NYutrwWS515b71clu0uJg4xQAc9Yt2hTV0QiORR6MKVMQSbsRHbNbXRgAfKQ708K+N/I5244mtsmxia5ugdyj/ZAD6MJRavxvmGTLFV8421wTH7xA5yszt1KzhYmm7VK5uAc4KKEyM4I70467uIZyxKmd+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4kw9+H4; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6d47d860fc4so12791207b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 20:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725594734; x=1726199534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1RCQi0PIE56EUCdYz3+gRkrVIWfG7yP7PnLRZb+nwgs=;
        b=r4kw9+H4kSYpFl4+cdCESNuTKWXo+mZFtKj2pwJc0kabkd7PT++FN1lcXUs8Bka+kN
         CvwLWoBlC7TLf7D0mlkZuOl9bZaP7dN2/KooUcfQkDGtw93/spiexzDrnXyXL5IPj3Xc
         NfzmjoSyjLuc4TYbfOuNkIzm48TKMgYrFhwWj8dddJrPECQ7u6NHeSNuC6JwddliDfto
         c0FRpknsYNiyELFehETHsnAN2t9vV06BKqE2TEI/pTbRhp1UNzr0Eq4yAfya0g6uBsbJ
         Hlx/r6lV9FFAdwBTafgSS9Sy5mR26qxXboUUK0bdHufIOCWrjdyUUcEhFas9Ni2VjPEz
         xfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725594734; x=1726199534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RCQi0PIE56EUCdYz3+gRkrVIWfG7yP7PnLRZb+nwgs=;
        b=QBpIxyHxjkZNNYRqe9jQQN+oeEbyueSNuBSeK9j7zSq5AIp6rCrtR0+XSKvbOOq+KN
         7BJzoWMDT7xy2p+w5vLXKS8BAIX/04SaMmC5d5ufODLz8cXS54Ww08O3JWZROZf1DX67
         FEUK7jDXnovOBTyYONtbZdLsSOrQhdRW3Ios6TbZElNcmIBT3C5Z04F8sqyR5o7+FFEO
         bsjWoAwtg+AKA2/bmXhP+/SLFQIGKMjKeuQKe6cVZuXnbY460gzA71Ku/sI1Dr14xB5J
         UnWKx5Kow4dALSIUmH9VfjnwFhC7nnemVOuvyT94lu7htlcZDLg4Tk2tqwAxrX3dZv4z
         YPYw==
X-Forwarded-Encrypted: i=1; AJvYcCUKn7Zvp79P8S+lBdOZ+BhVtse4dqJkEucnlshbrDfwgtdx/EniYuM0nTUAAPoEtJCHED1MlJ+j52g5JPPC@vger.kernel.org
X-Gm-Message-State: AOJu0YwlseFjzcmtlMes62g29O1oLD14uwo3/I8BidrT9d9yQNKuo1/B
	BZlSi76Oo81ZwtQ22ENauoPt+6Vg8GA8ZZzNzMol3WtLKQ5dZgPWwrmm02X7xji/RULtHROs/cr
	DG6QkNXCmcdHVvP+FNX5g3LkgJaVI+iQOsvHQYDwe48D+6w9U
X-Google-Smtp-Source: AGHT+IHHkjj6ex/6bj+w+QkI2FJSutXeFRzTpu2oHxz5DqhCjDCgGAhRDDIxCGWDRZiI+9qUzFbuhu4ZF8Z4+jpdXQM=
X-Received: by 2002:a05:690c:6689:b0:618:2381:2404 with SMTP id
 00721157ae682-6db452d8321mr15826547b3.44.1725594733952; Thu, 05 Sep 2024
 20:52:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906031345.1052241-1-ruanjinjie@huawei.com>
 <20240906031345.1052241-3-ruanjinjie@huawei.com> <hnos3f34ejabyw2yxtpxifskhklunvnufgsuilghjeuzipqkxi@udw5xfeum37a>
 <050a6434-00f9-4bba-a122-52c3a23fcf70@huawei.com> <CAA8EJpod2OzNEoquSGuJXLUx8-r+J0_YjPzv5pFDFHum9siisQ@mail.gmail.com>
 <3d48b7c3-6dba-b113-9207-f3daa874253e@huawei.com> <CAA8EJppbuMGjo3PHBnmHF5yXFOBUon50ZSKKzWFqGs3qgFmR3g@mail.gmail.com>
 <a314d448-abb7-1a9c-5c45-7fce9aa69362@huawei.com>
In-Reply-To: <a314d448-abb7-1a9c-5c45-7fce9aa69362@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 6 Sep 2024 06:52:02 +0300
Message-ID: <CAA8EJprUPLfzwfJCgeWJ_G4QYKmG=Y304hmFxBZJOhMWxt18dQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spi: spi-geni-qcom: Fix missing undo runtime PM
 changes at driver exit time
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: broonie@kernel.org, vkoul@kernel.org, akashast@codeaurora.org, 
	dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-spi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sept 2024 at 06:51, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
>
>
> On 2024/9/6 11:43, Dmitry Baryshkov wrote:
> > On Fri, 6 Sept 2024 at 06:41, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>
> >>
> >>
> >> On 2024/9/6 11:36, Dmitry Baryshkov wrote:
> >>> On Fri, 6 Sept 2024 at 06:31, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2024/9/6 11:15, Dmitry Baryshkov wrote:
> >>>>> On Fri, Sep 06, 2024 at 11:13:45AM GMT, Jinjie Ruan wrote:
> >>>>>> It's important to undo pm_runtime_use_autosuspend() with
> >>>>>> pm_runtime_dont_use_autosuspend() at driver exit time unless driver
> >>>>>> initially enabled pm_runtime with devm_pm_runtime_enable()
> >>>>>> (which handles it for you).
> >>>>>>
> >>>>>> Hence, call pm_runtime_dont_use_autosuspend() at driver exit time
> >>>>>> to fix it.
> >>>>>>
> >>>>>> Fixes: cfdab2cd85ec ("spi: spi-geni-qcom: Set an autosuspend delay of 250 ms")
> >>>>>> ---
> >>>>>> v2:
> >>>>>> - Fix it directly instead of use devm_pm_runtime_enable().
> >>>>>
> >>>>> Why?
> >>>>
> >>>> The devm* sequence will have some problem, which will not consistent
> >>>> with the former.
> >>>>
> >>>> Link:
> >>>> https://lore.kernel.org/all/CAD=FV=VyDk-e2KNiuiBcACFAdrQmihOH6X6BSpGB+T1MsgsiKw@mail.gmail.com/
> >>>
> >>> That comment was for devm_request_irq(), not devm_pm_runtime_enable().
> >>
> >>
> >> In the very least, ** parch #2 needs to come before this one and that
> >> would help, but it won't fix everything **. Specifically in order to
> >> keep the order proper you'll need to use devm_add_action_or_reset() to
> >> "devm-ize" the freeing of the DMA channels.
> >
> > This is patch #2. so I don't understand your comment. Moreover you
> > don't have to use devm for each and every possible item. However I
> > think it makes sense for pm_runtime in this case.
>
> You are right, only use devm_pm_runtime_enable() here, there is no
> change for the resource release sequence, but I have a cleanup patch
> ready to replace all these with devm*, which depends on the 2 fix patch.

You can use the devm_pm_runtime_enable() here and land the rest of the
cleanups afterwards.

>
> >
> >>
> >>
> >>>
> >>>>
> >>>>>
> >>>>>> ---
> >>>>>>  drivers/spi/spi-geni-qcom.c | 2 ++
> >>>>>>  1 file changed, 2 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> >>>>>> index fc2819effe2d..38857edbc785 100644
> >>>>>> --- a/drivers/spi/spi-geni-qcom.c
> >>>>>> +++ b/drivers/spi/spi-geni-qcom.c
> >>>>>> @@ -1158,6 +1158,7 @@ static int spi_geni_probe(struct platform_device *pdev)
> >>>>>>  spi_geni_release_dma:
> >>>>>>      spi_geni_release_dma_chan(mas);
> >>>>>>  spi_geni_probe_runtime_disable:
> >>>>>> +    pm_runtime_dont_use_autosuspend(dev);
> >>>>>>      pm_runtime_disable(dev);
> >>>>>>      return ret;
> >>>>>>  }
> >>>>>> @@ -1174,6 +1175,7 @@ static void spi_geni_remove(struct platform_device *pdev)
> >>>>>>
> >>>>>>      spi_geni_release_dma_chan(mas);
> >>>>>>
> >>>>>> +    pm_runtime_dont_use_autosuspend(&pdev->dev);
> >>>>>>      pm_runtime_disable(&pdev->dev);
> >>>>>>  }
> >>>>>>
> >>>>>> --
> >>>>>> 2.34.1
> >>>>>>
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

