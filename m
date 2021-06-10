Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185A63A260D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 10:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhFJIEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 04:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbhFJIDo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 04:03:44 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2093C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 01:01:48 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id p13so970074pfw.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rOfALqjQNiAWGtRPyS0+6/qEh4LbM6sjr0qxCHaJ3gc=;
        b=rsEedmg/sCL8oEEaxJxzemuVNHxDAYaWPAzTblr5IA1EFmp26f5baD8X3XD824IWRx
         ahxJXhYTf+yWZvbqTQca5jXj0khOCs3/kQx+0xLsJLwD/NRyslv4i2d2Qa/xYME4loB+
         Y/hT6LrO4nNqwbwKYR57VGbHf4X4U8QDY5BJZMNakyik0BTAFGrEmihHF8fyEMU4Qa3Q
         CVJfzWqf+OAup3buYLP7BwGboiegcm2dW+npVAGIO8WBYF5VkwRZ8utIUXnilorOIjxk
         labneXbFV57kmt0OUjAPTIxPUcDWaQGjTO5ANt1DWMKzD5FeT03C2dLjaDmav6206A1l
         RcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rOfALqjQNiAWGtRPyS0+6/qEh4LbM6sjr0qxCHaJ3gc=;
        b=ms4dt4Ykr0dPjNUl3aysfCvooNf95gvIsG055Fi3Uk+R34czbbKW7L4rXWcU/EtSjr
         zOzQL6F1WFiJ7TkzS6LftZ2kidFF7Oq9UknsbC35Y7UhqghM6g/nIiVURwOg4QG7UhEW
         y9/gHUBaAsVkU0AS8+ESItRQYrQ31XF7AuNl2HkSHgDTYtvohnqVUCBrsyT3P6gfqlD4
         aPYZLHA0i8p7JUANhEuYs0HwgzWgkdhij/7GqKO9eAFP1nE9krUus+s0Q5mCNvQRR+Vp
         Z4AP5yuxHNkSFM4U/wvChR+qQJrwIvb9348r2xyxD3ujLyNnQBN4BWM26FLtq2woqaAk
         DwFg==
X-Gm-Message-State: AOAM530P6drhwDQYa3FTDG+zU+kbtpJecoLllwAmpNvzwFVL6utvkQIL
        VGqa7BX5Q35KzD4/ywK8wjy+l2wxSKcffs3nauOAegQQLznJvw==
X-Google-Smtp-Source: ABdhPJyjrxMZq7DoCTmbmF316InNlankKIqt3cklieGt8rsn+JaGs+a3lI2Q30o+LjNNe4E5dvUO5y3J6xE9FA/C9TE=
X-Received: by 2002:a05:6a00:88a:b029:261:6d37:dac6 with SMTP id
 q10-20020a056a00088ab02902616d37dac6mr1839719pfj.18.1623312108356; Thu, 10
 Jun 2021 01:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210608223513.23193-1-jonathan@marek.ca> <20210608223513.23193-10-jonathan@marek.ca>
In-Reply-To: <20210608223513.23193-10-jonathan@marek.ca>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 10 Jun 2021 10:01:38 +0200
Message-ID: <CAG3jFytKMSRvcmEwGn7E=CPD6MJETB1L=RRYAoNxhpNC4vm6-A@mail.gmail.com>
Subject: Re: [PATCH 09/17] media: camss: csid: allow csid to work without a regulator
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM CAMERA SUBSYSTEM DRIVER" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Jonathan,

On Wed, 9 Jun 2021 at 00:37, Jonathan Marek <jonathan@marek.ca> wrote:
>
> At least for titan HW, CSID don't have an associated regulator. This change
> is necessary to be able to model this in the CSID resources.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index cc11fbfdae132..528674dea06ca 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -162,7 +162,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                         return ret;
>                 }
>
> -               ret = regulator_enable(csid->vdda);
> +               ret = csid->vdda ? regulator_enable(csid->vdda) : 0;
>                 if (ret < 0) {
>                         pm_runtime_put_sync(dev);
>                         return ret;
> @@ -170,14 +170,16 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>
>                 ret = csid_set_clock_rates(csid);
>                 if (ret < 0) {
> -                       regulator_disable(csid->vdda);
> +                       if (csid->vdda)
> +                               regulator_disable(csid->vdda);
>                         pm_runtime_put_sync(dev);
>                         return ret;
>                 }
>
>                 ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
>                 if (ret < 0) {
> -                       regulator_disable(csid->vdda);
> +                       if (csid->vdda)
> +                               regulator_disable(csid->vdda);
>                         pm_runtime_put_sync(dev);
>                         return ret;
>                 }
> @@ -188,7 +190,8 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>                 if (ret < 0) {
>                         disable_irq(csid->irq);
>                         camss_disable_clocks(csid->nclocks, csid->clock);
> -                       regulator_disable(csid->vdda);
> +                       if (csid->vdda)
> +                               regulator_disable(csid->vdda);
>                         pm_runtime_put_sync(dev);
>                         return ret;
>                 }
> @@ -197,7 +200,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
>         } else {
>                 disable_irq(csid->irq);
>                 camss_disable_clocks(csid->nclocks, csid->clock);
> -               ret = regulator_disable(csid->vdda);
> +               ret = csid->vdda ? regulator_disable(csid->vdda) : 0;
>                 pm_runtime_put_sync(dev);
>         }
>
> @@ -634,7 +637,9 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
>
>         /* Regulator */
>
> -       csid->vdda = devm_regulator_get(dev, res->regulator[0]);
> +       csid->vdda = NULL;
> +       if (res->regulator[0])
> +               csid->vdda = devm_regulator_get(dev, res->regulator[0]);
>         if (IS_ERR(csid->vdda)) {
>                 dev_err(dev, "could not get regulator\n");
>                 return PTR_ERR(csid->vdda);
> --
> 2.26.1
>

This patch does not seem to apply on upstream-media/master.
