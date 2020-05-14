Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8036B1D2E42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 13:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgENL14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 07:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgENL14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 07:27:56 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0900AC061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:27:56 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id t3so2061592otp.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 04:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wxAs+mvRFMkQC0sck5MS5WhqTOyvJuovj78EsreUtvE=;
        b=FDvaNrZJJwmbPiapmx88pMKzanvUHC7BTHIvMPe6B5SRaYMqaQWdQVHWUzKT+CHWUO
         IPI6jehEtsu0MvskmpriRki1/VVhuWa2lsxgeLpPE7ZS8EWWrQif51SMiqmU1yHqtGJM
         6bRy5vuz/HsIlMA7dBfSMddHzP681WpZ3lOPsOAzBtSVfjWxRh+ijCUQwrlwc4KkTRYX
         jD2GmDreLZ9kOPcjPIeoO58EFtYAxQQcULnBjInpLJv/yor8X2t278Rdl8YDRBz5nLdX
         S2xUG1+EBMvAZsS/mbUm6DSjxNvARM92lDxzTsBdL2WqA5oI2dzXTWMEpCHuE6qJYR1r
         9BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wxAs+mvRFMkQC0sck5MS5WhqTOyvJuovj78EsreUtvE=;
        b=lNVUNd9b2k2FIYwI+zpUsAFn157xtEEj8Ldhzqtgm2h6muPY5hLY/RZ48hmz5i7tPP
         SV1BHXvzyCLFuHFqgItCEf/8dplpjPcOHdXXD8YlCLc7YDacZtn1du2qjRNK7V8z91Xc
         S7MvwDndX5TQGR2t9J80IKC1V6zY1NMMw6PcuheoRvNe1wXZk3WBnJ1HWBNjfDS5kT6m
         UOcSK24nwg+Jc88eXkbW2xy51DHa/HjHRkoS7OgwNRpIMwfcaT5G2HYqBXKaoFdzGMwE
         iIeUSwg9/Tou7NZjkNQtoCzuFXnviYAFbMMkvV6hk9FEKKv8tkbQjsfamzOe/tYfuLuh
         1vXA==
X-Gm-Message-State: AOAM531lQ25sGSBPE/AuqlfmbrixGgjnLt68Z1UG+nQkZOmOLZCq//4/
        Jfk4C/5m/XL43XzSmTubJeoKo0qf7tsWYET8B5AKvw==
X-Google-Smtp-Source: ABdhPJwpNNt1Jw4j4qQX1GS4dly/n8TtoBFGmz3on2XvNgxroZ43lfjyKd0ko9cuFU1Ms4pbt3IhJepoCBIn1LeudGU=
X-Received: by 2002:a9d:e93:: with SMTP id 19mr3159324otj.371.1589455675094;
 Thu, 14 May 2020 04:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-4-sumit.semwal@linaro.org> <20200511103937.GC8216@sirena.org.uk>
In-Reply-To: <20200511103937.GC8216@sirena.org.uk>
From:   Sumit Semwal <sumit.semwal@linaro.org>
Date:   Thu, 14 May 2020 16:57:43 +0530
Message-ID: <CAO_48GFGpHeu_xb9XT9CFMOSUOJgRrb-z_KZ3-r3X78s-2ddjw@mail.gmail.com>
Subject: Re: [v2 3/4] regulator: qcom: Add labibb driver
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Mark,

Thank you for your review comments!
On Mon, 11 May 2020 at 16:09, Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, May 09, 2020 at 02:11:59AM +0530, Sumit Semwal wrote:
>
> > +     ret = regmap_bulk_read(reg->regmap, reg->base +
> > +                            REG_LABIBB_STATUS1, &val, 1);
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "Read register failed ret = %d\n", ret);
> > +             return ret;
> > +     }
>
> Why a bulk read of a single register?
Right, will change.
>
> > +static int _check_enabled_with_retries(struct regulator_dev *rdev,
> > +                     int retries, int enabled)
> > +{
>
> This is not retrying, this is polling to see if the regulator actually
> enabled.
Yes, will update accordingly.

>
> > +static int qcom_labibb_regulator_enable(struct regulator_dev *rdev)
> > +{
>
> > +     ret = _check_enabled_with_retries(rdev, retries, 1);
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "retries exhausted: enable %s regulator\n",
> > +                     reg->desc.name);
> > +             return ret;
> > +     }
>
> If this is useful factor it out into a helper or the core, other devices
> also have status bits saying if the regulator is enabled.  It looks like
> this may be mainly trying to open code something like enable_time, with
> possibly some issues where the time taken to enable varies a lot.
>
Makes sense; I am not terribly familiar with the regulator core and
helpers, so let me look and refactor accordingly.

> > +     if (ret)
> > +             return 0;
> > +
> > +
> > +     dev_err(reg->dev, "Can't enable %s\n", reg->desc.name);
> > +     return -EINVAL;
>
> Return the actual error code (the logic here is quite convoluted).
Will try to simplify.
>
> > +     ret = regulator_disable_regmap(rdev);
> > +
> > +     if (ret < 0) {
>
> You have lots of blank lines between operations and checking their
> return codes?
>
will correct that.
> > +     ret = _check_enabled_with_retries(rdev, retries, 0);
> > +     if (ret < 0) {
> > +             dev_err(reg->dev, "retries exhausted: disable %s regulator\n",
> > +                     reg->desc.name);
> > +             return ret;
> > +     }
>
> Similarly to the enable path, but is this one about off_on_delay rather
> than enable_time?
Got it. Let me look deeper.
>
> > +     if (reg_data->type == QCOM_LAB_TYPE) {
> > +             reg = &labibb->lab;
> > +             reg->desc.enable_mask = LAB_ENABLE_CTL_MASK;
> > +     } else {
> > +             reg = &labibb->ibb;
> > +             reg->desc.enable_mask = IBB_ENABLE_CTL_MASK;
> > +     }
>
> Write a switch statement so this is extensible.
I can change over to switch, though in the current set of downstream
code I've seen, it doesn't look that it would get extended. But I
guess there isn't any harm in moving over to switch. Will do.

Best,
Sumit.
