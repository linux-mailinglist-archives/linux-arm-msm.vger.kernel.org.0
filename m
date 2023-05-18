Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46252707EFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 13:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjERLOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 07:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbjERLOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 07:14:19 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CD5BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 04:14:17 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3063afa2372so1817718f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 04:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684408455; x=1687000455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xHOBxalE1e/537sbv6IwDm7KN7soNMg/ORaL113xwuA=;
        b=wmMjkHUMu70UpxU+bZpEWltBosU11MS71pmdYI73ZPyK/M5dOi+wQislBXNJ5n0gju
         5Dc4doDZtU3br8D2Evu5/tCFcN9ledwdMFoQkqwLn5EC6vXnks4LV2DZ8DUeVCnXRECC
         fSzPWnHm5Ray1apP6dIfueLWdr3jo2sQxnYLbFg3ut1ncra129ZZanGUrU1wFiVp+vVH
         tNNqtyHT5z2ySLCgxroIFIbs2GS3KNZe14S5hZ1Mnhf/rmdrPsG7q9zlINpd5dWydV6W
         AM6SZn+lL0P9J2de7tU9MwTo1FNy6WOz9TZgbq+shIeIFUax4T3dTEln0U2H/PgGp7PR
         P3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684408455; x=1687000455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHOBxalE1e/537sbv6IwDm7KN7soNMg/ORaL113xwuA=;
        b=fcFrqK7J22z6Qe0uTVNIAH7PS20tTFfcBNAH0dVhGuuH84ef4VpA1FscezhAj1Qu2M
         6Mvzb/F5qL8g23z1RwBLIpcW7WDk7DKz5kWw7MfHZjebbz1E+VWkSh3TVeIRWbv+tUe1
         Vj3lEFOL6QRQ8KUXB4Z89IF3FniDlk3E8MuP6OE0/B+dnQAuSzsdJ6hXn6cRXqD4t+90
         sdYdP5dYup9YRHlvQpFX1V+msnUNJgoOKWA9HhhKGoa0T/0bTdua8HilRppeEwKWt4KL
         pkuQUxT2JFw7fYsORW5h8EwOUtGzuOqXqlFGVeghhUURUisQ7cy9BPULoHxKEe0G/P62
         DKhQ==
X-Gm-Message-State: AC+VfDxzM4RNeaDF7NHVweIMq7LhS87auVCfCzdP6LUlxAkQvny/3bru
        g0UtWhn6UHrjw9eT2qt+YsqP6t3hrlZ/Hlpz9t64Cg==
X-Google-Smtp-Source: ACHHUZ7cUQyXn53VkV1XCKcibqrUF0XPZ3SAbqlKk/hiCWPVchdeg2dw8VBSMBdWWb49Wzi0JqYjmwdFrWT9Z620ssw=
X-Received: by 2002:adf:fd0d:0:b0:307:94fb:3a44 with SMTP id
 e13-20020adffd0d000000b0030794fb3a44mr1416865wrr.52.1684408455616; Thu, 18
 May 2023 04:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230518-bamclk-dt-v1-1-82f738c897d9@gerhold.net>
In-Reply-To: <20230518-bamclk-dt-v1-1-82f738c897d9@gerhold.net>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Thu, 18 May 2023 16:43:57 +0530
Message-ID: <CAH=2Ntya7bqHVri_F8BOUJ6kJxtG2_usV08do+=OgkaoVJvxBQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: make channels/EEs optional in
 DT with clock
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On Thu, 18 May 2023 at 14:56, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> If we have a BAM clock in the DT we are able to turn on the BAM
> controller while probing, so there is no need to read "num-channels"
> and "qcom,num-ees" from the DT. It can be read more accurately directly
> from the identification registers of the BAM.
>
> This simplifies setting up typical controlled-remotely BAM DMAs in the
> DT that can be turned on via a clock (e.g. the BLSP DMA).

Can you please list which qcom board(s) you tested this patch on?

Thanks,
Bhupesh

> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/dma/qcom/bam_dma.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index 1e47d27e1f81..4c3eb972039d 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -1272,7 +1272,15 @@ static int bam_dma_probe(struct platform_device *pdev)
>         bdev->powered_remotely = of_property_read_bool(pdev->dev.of_node,
>                                                 "qcom,powered-remotely");
>
> -       if (bdev->controlled_remotely || bdev->powered_remotely) {
> +       if (bdev->controlled_remotely || bdev->powered_remotely)
> +               bdev->bamclk = devm_clk_get_optional(bdev->dev, "bam_clk");
> +       else
> +               bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> +
> +       if (IS_ERR(bdev->bamclk))
> +               return PTR_ERR(bdev->bamclk);
> +
> +       if (!bdev->bamclk) {
>                 ret = of_property_read_u32(pdev->dev.of_node, "num-channels",
>                                            &bdev->num_channels);
>                 if (ret)
> @@ -1284,14 +1292,6 @@ static int bam_dma_probe(struct platform_device *pdev)
>                         dev_err(bdev->dev, "num-ees unspecified in dt\n");
>         }
>
> -       if (bdev->controlled_remotely || bdev->powered_remotely)
> -               bdev->bamclk = devm_clk_get_optional(bdev->dev, "bam_clk");
> -       else
> -               bdev->bamclk = devm_clk_get(bdev->dev, "bam_clk");
> -
> -       if (IS_ERR(bdev->bamclk))
> -               return PTR_ERR(bdev->bamclk);
> -
>         ret = clk_prepare_enable(bdev->bamclk);
>         if (ret) {
>                 dev_err(bdev->dev, "failed to prepare/enable clock\n");
>
> ---
> base-commit: 1c677f238f92ba0a329b7c13220f38b396872806
> change-id: 20230518-bamclk-dt-d44bae47b337
>
> Best regards,
> --
> Stephan Gerhold <stephan@gerhold.net>
>
