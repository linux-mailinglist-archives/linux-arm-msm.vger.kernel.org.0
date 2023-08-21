Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4DC9783619
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 01:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbjHUXIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 19:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjHUXIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 19:08:43 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB9C130
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 16:08:42 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-c5ffb6cda23so3952507276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 16:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692659321; x=1693264121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KVFos1zKhpGyvr7mNgjAGyFaua6+jrz38A7r/8goRpk=;
        b=aH4cKQboAlXJMgNHq8TsDZFsjvx3Prqjhn/T67tZoI081cIusVlzMv7l2Cz9TrqBQn
         lF0ret7V+TX/9yGmtZdZyeIhPA/Lyq8u+7mmVmnsAuUrTNArq0P0Dcgku2CNI4K+65yd
         1nQjgE41lZT/oa5LWZC7kRq6+XeRBmyTOpI6951UvNys3QA/MuYogMIdZ2zc2Ij5yZ7N
         p/fZ1dbhrDgtQmaJG1b4uDMWCsMXMHpejdalPRdy8arL7Dfb7QAZx7Fiht2o+3/HgVkx
         yfWsROCBu6E2ppxtIxEtH9Kwqe7/h3hLX4LmJ0AV7SxwqWwFaW4kDbXo8GUzIgO01eXo
         qQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692659321; x=1693264121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVFos1zKhpGyvr7mNgjAGyFaua6+jrz38A7r/8goRpk=;
        b=BO2T4j05b5+rFZ2WVFX6dZq94ctPRluY04Ud6LPU6If5OJ9F6cl7rTRtNOv8iUdrm3
         stREB1Z+8bsSnae9mO3TD0WNtr7fhuK7Kts27OHGPvKlvTanSZkE4juE68+iMvZSXzNk
         LjFreYK3IVA1okf/gTXDDCCALXIChZrPV7MncgqtPkgUuRgVMLNXk9Mwke+4UW+M7cE/
         2HZLUL8rWKjvqHVMAKNjXqdci4vepCE8kHE02uFgHfk37tDA0Ap00y8DivyHjKWIpN4A
         UR1rtuFUhFKPx9irWlZG7Xpajbp6IlwrmCH5sn4G/6PSRndH4KvXNhtaH7QbOiJ3GU8B
         pzKA==
X-Gm-Message-State: AOJu0YxTpQ0k0RyCQXZU103mBzqyuj324fETR672wg32c82eLhNjAsMU
        mFmyWo0ftvg9vqIMPhS6HFS9d1vAPNs8QTQy6FGYjg==
X-Google-Smtp-Source: AGHT+IEqSKPaIKLJFwa7oPxfI3dlhhDDatR/k57t+eVMFLpLIhwZRGl5FVmu96YSOZH3lHdZWtQYRAdxPT3bm+k47lc=
X-Received: by 2002:a25:ef4c:0:b0:d1f:6886:854a with SMTP id
 w12-20020a25ef4c000000b00d1f6886854amr7867170ybm.9.1692659321493; Mon, 21 Aug
 2023 16:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230728013148.1720978-1-liaochang1@huawei.com>
 <20230728013148.1720978-6-liaochang1@huawei.com> <e87b35f9-f585-4a3f-bd31-9ebeba52f66b@linaro.org>
 <c23be2ce-052d-4320-220e-ed471769b09b@oracle.com>
In-Reply-To: <c23be2ce-052d-4320-220e-ed471769b09b@oracle.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 22 Aug 2023 02:08:30 +0300
Message-ID: <CAA8EJprTOjbOy7N5+8NiJaNNhK+_btdUUFcpHKPkMuCZj5umMA@mail.gmail.com>
Subject: Re: [PATCH 5/9] i2c: qcom-cci: Use dev_err_probe in probe function
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     Liao Chang <liaochang1@huawei.com>, andi.shyti@kernel.org,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        yangyicong@hisilicon.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kblaiech@nvidia.com,
        asmaa@nvidia.com, loic.poulain@linaro.org, rfoss@kernel.org,
        ardb@kernel.org, gcherian@marvell.com, linux-i2c@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Vegard Nossum <vegard.nossum@oracle.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 21 Aug 2023 at 23:39, Harshit Mogalapalli
<harshit.m.mogalapalli@oracle.com> wrote:
>
> Hi,
>
> On 18/08/23 4:36 pm, Dmitry Baryshkov wrote:
> > On 28/07/2023 04:31, Liao Chang wrote:
> >> Use the dev_err_probe function instead of dev_err in the probe function
> >> so that the printed messge includes the return value and also handles
> >> -EPROBE_DEFER nicely.
> >>
> >> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> >> ---
> >>   drivers/i2c/busses/i2c-qcom-cci.c | 6 ++----
> >>   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >>
> >> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c
> >> b/drivers/i2c/busses/i2c-qcom-cci.c
> >> index 622dc14add9d..cf13abec05f1 100644
> >> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> >> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> >> @@ -588,10 +588,8 @@ static int cci_probe(struct platform_device *pdev)
> >>       /* Clocks */
> >>       ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> >> -    if (ret < 1) {
> >> -        dev_err(dev, "failed to get clocks %d\n", ret);
> >> -        return ret;
> >> -    }
> >> +    if (ret < 1)
> >> +        return dev_err_probe(dev, ret, "failed to get clocks\n");
>
> Description:
> -----------
>   * devm_clk_bulk_get_all - managed get multiple clk consumers
>   * @dev: device for clock "consumer"
>   * @clks: pointer to the clk_bulk_data table of consumer
>   *
>   * Returns a positive value for the number of clocks obtained while the
>   * clock references are stored in the clk_bulk_data table in @clks field.
>   * Returns 0 if there're none and a negative value if something failed.
> -----------
>
> When ret = 0;
>
> "zero" is passed to dev_err_probe and we are returning success(zero)
> from probe function.
>
> Based on other instances of devm_clk_bulk_get_all() API, can we fix it
> by changing condition like this?
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c
> b/drivers/i2c/busses/i2c-qcom-cci.c
> index cf13abec05f1..cea6f70d2b8d 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -588,7 +588,7 @@ static int cci_probe(struct platform_device *pdev)
>          /* Clocks */
>
>          ret = devm_clk_bulk_get_all(dev, &cci->clocks);
> -       if (ret < 1)
> +       if (ret < 0)
>                  return dev_err_probe(dev, ret, "failed to get clocks\n");

Only if it succeeded with something like:

if (!ret)
    return dev_err_probe(dev, -EINVAL, "Not enough clocks in DT\n");

But it is a separate topic and should be a part of the separate patch.

>          cci->nclocks = ret;
>
>
> Thanks,
> Harshit
>
> >>       cci->nclocks = ret;
> >>       /* Retrieve CCI clock rate */
> >



-- 
With best wishes
Dmitry
