Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48AA1771C22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Aug 2023 10:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjHGIRb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Aug 2023 04:17:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjHGIRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Aug 2023 04:17:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B25170A;
        Mon,  7 Aug 2023 01:17:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D725261630;
        Mon,  7 Aug 2023 08:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B62C433C8;
        Mon,  7 Aug 2023 08:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691396249;
        bh=32RJaUXj2/HJRQtblPM6k2oeKfZF39yPw0P0aMzAYXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iT5OKUMwlCJ4CCjZqGu84tZcrCdI/0E808Lxxgrw5JmYEp3N5dZRI1nqqwBnyFyWQ
         TOgjeM8hHWrwokdGgVUZcPRtK9Y9jocBsPDBhTv3QFM26EX2lJ78J/U3U3sTHl4wA+
         GHX+LWaD9Lwo4XenoR7Eolj8FQ2uZO/uhhgTxaovlFaiVIgVEEQHIUaMeYXiA3phQL
         DokdH43PaZCNchHzZmn0pygxh4VlxgM6C4UxUz+CtFBqiJnAf7YZmZjnr4HbCA1Wbl
         dW3U4tsy/paYQ7zMHngtqLgxo8YpJxxqgDml5guJTOqmjaaSVIEZLgu1NwCtSiaUeo
         jWCw8ccjAitJg==
Date:   Mon, 7 Aug 2023 10:17:25 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     "Liao, Chang" <liaochang1@huawei.com>
Cc:     florian.fainelli@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 8/9] i2c: imx-lpi2c: Use dev_err_probe in probe function
Message-ID: <20230807081725.fmjvdp3gxjs2ijee@intel.intel>
References: <20230802095737.3957587-1-liaochang1@huawei.com>
 <20230802095737.3957587-9-liaochang1@huawei.com>
 <20230804221644.cqmoin6u22mxvouk@intel.intel>
 <758b882e-31a5-1f73-7fd2-945a8a2e9558@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <758b882e-31a5-1f73-7fd2-945a8a2e9558@huawei.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 07, 2023 at 10:13:30AM +0800, Liao, Chang wrote:
> Hi, Andi
> 
> 在 2023/8/5 6:16, Andi Shyti 写道:
> > On Wed, Aug 02, 2023 at 05:57:36PM +0800, Liao Chang wrote:
> >> Use the dev_err_probe function instead of dev_err in the probe function
> >> so that the printed messge includes the return value and also handles
> >> -EPROBE_DEFER nicely.
> >>
> >> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> >> ---
> >>  drivers/i2c/busses/i2c-imx-lpi2c.c | 12 ++++--------
> >>  1 file changed, 4 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
> >> index c3287c887c6f..bfa788b3775b 100644
> >> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> >> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> >> @@ -569,10 +569,8 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
> >>  		sizeof(lpi2c_imx->adapter.name));
> >>  
> >>  	ret = devm_clk_bulk_get_all(&pdev->dev, &lpi2c_imx->clks);
> >> -	if (ret < 0) {
> >> -		dev_err(&pdev->dev, "can't get I2C peripheral clock, ret=%d\n", ret);
> >> -		return ret;
> >> -	}
> >> +	if (ret < 0)
> >> +		return dev_err_probe(&pdev->dev, ret, "can't get I2C peripheral clock\n");
> > 
> > you cut on this because the line was going over 100 characters? :)
> > 
> > In theory you shouldn't change the print message when doing such
> > changes and you can still split it as:
> > 
> > 		return dev_err_probe(&pdev->dev, ret,
> > 				     "can't get I2C peripheral clock, ret=%d\n",
> > 				     ret);
> > 
> > and you're even within the 80 characters.
> 
> Since dev_err_probe always print the second parameter that happens to be the return value,
> I remove the "ret=%d" from the original message to avoid a redundant error message.
> 
> So is it better to keep the original message unchanged, even though dev_err_probe also prints
> the return error value? Or is it better to make this change so that all error messages printed
> in the probe function include the return value in a consistent style?

yes, you are right! Then please ignore this comment, but...

> >   	ret = devm_request_irq(&pdev->dev, irq, lpi2c_imx_isr, 0,
> >   		pdev->name, lpi2c_imx);
> > - 	if (ret) {
> > - 		dev_err(&pdev->dev, "can't claim irq %d\n", irq);
> > - 		return ret;
> > - 	}
> > + 	if (ret)
> > + 		return dev_err_probe(&pdev->dev, ret, "can't claim irq %d\n", irq);

please make it coherent to this second part, as well, where the
error number is printed.

Thank you,
Andi
