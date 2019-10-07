Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72746CEE5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 23:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbfJGVV3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 17:21:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35632 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728753AbfJGVV2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 17:21:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id w6so10316564lfl.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2019 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5VLA+DypLeafYgMw73YxMrbPmQsxALingE4Zwjp+3ro=;
        b=AWhFRV0UXf0UR44y+lps7DWiRDgcwTAKSPuFnQuRcaRad76GF2KfIOGkxzP0TbPSFN
         Slzj7O4yTkaekbF+DQG8a7x9UcPNvTsVlvXCvxLxKORld/I0xD2pNfPkT9lUG8BfX3+z
         ra21vWXRFvFnLWfftuIS9k4vqQbXMx5UVJm4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VLA+DypLeafYgMw73YxMrbPmQsxALingE4Zwjp+3ro=;
        b=E021D0CSMXTn9iblAByu5V7A3VEGtbwnaq9E6lQ08ifJr8QMqe78PvdcYjcSz8/I11
         kvr4n3PVpgAyqMevZ3wpuIiV70irGvTzFqVTvue0y/LmamL1Iql9b5RS7TQsDI2OU7MF
         S87HC45ZrbWemWd/f3ix5mHV8n8z2W/NLzZvwMiROSNa3seRPMKklINeZIfoWV1c1Uby
         oOuAE/G09NM8cQH0rsSGBzGSP3LdmOGcN9QhMumdqU80igP//Ki2DXbatPoCo51PGwOJ
         7LWNloWuyZms0dQ1qcvtVBYHquWcUAROFvAgA6sxnZtd202wMNUnxkdf3xU4TNt8+uwR
         vdoQ==
X-Gm-Message-State: APjAAAVNnFfEEUhyaNnf5WZpUt/MCQBfxYNqaYW5RjJ7p2+6XbEK59Fg
        +onfVb2ons6Ra3x1lFIEyru09Pf+T4U=
X-Google-Smtp-Source: APXvYqz+rPvyObPwATfq+yPKYlTh8Cct3nVTNcLTy1Vd0gkLMLgKRwMSF0ofRnZs2Uq9XvY9k+sPuQ==
X-Received: by 2002:ac2:5dfa:: with SMTP id z26mr18183859lfq.145.1570483285051;
        Mon, 07 Oct 2019 14:21:25 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id r75sm2934554lff.7.2019.10.07.14.21.23
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 14:21:24 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id y23so15244105lje.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2019 14:21:23 -0700 (PDT)
X-Received: by 2002:a2e:878b:: with SMTP id n11mr18063490lji.13.1570483283303;
 Mon, 07 Oct 2019 14:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191004233132.194336-1-swboyd@chromium.org>
In-Reply-To: <20191004233132.194336-1-swboyd@chromium.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 7 Oct 2019 14:20:47 -0700
X-Gmail-Original-Message-ID: <CAE=gft4Rp_GmoVc1iRFH3tiu_taC=i72_Y+xXzk6eU6J80YhQw@mail.gmail.com>
Message-ID: <CAE=gft4Rp_GmoVc1iRFH3tiu_taC=i72_Y+xXzk6eU6J80YhQw@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc: Name regmaps to avoid collisions
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 4, 2019 at 4:31 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> We'll end up with debugfs collisions if we don't give names to the
> regmaps created inside this driver. Copy the template config over into
> this function and give the regmap the same name as the resource name.
>
> Fixes: 7f9c136216c7 ("soc: qcom: Add broadcast base for Last Level Cache Controller (LLCC)")
> Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
> Cc: Evan Green <evgreen@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/llcc-slice.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slice.c
> index 9090ea12eaf3..aa342938c403 100644
> --- a/drivers/soc/qcom/llcc-slice.c
> +++ b/drivers/soc/qcom/llcc-slice.c
> @@ -48,13 +48,6 @@
>
>  static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
>
> -static const struct regmap_config llcc_regmap_config = {
> -       .reg_bits = 32,
> -       .reg_stride = 4,
> -       .val_bits = 32,
> -       .fast_io = true,
> -};
> -
>  /**
>   * llcc_slice_getd - get llcc slice descriptor
>   * @uid: usecase_id for the client
> @@ -314,6 +307,12 @@ static struct regmap *qcom_llcc_init_mmio(struct platform_device *pdev,
>  {
>         struct resource *res;
>         void __iomem *base;
> +       static struct regmap_config llcc_regmap_config = {
> +               .reg_bits = 32,
> +               .reg_stride = 4,
> +               .val_bits = 32,
> +               .fast_io = true,
> +       };

Why did you move this to be a static local? I think it works, but it
makes it look like this is a local variable that's possibly used out
of scope. Maybe leave it as a global?
