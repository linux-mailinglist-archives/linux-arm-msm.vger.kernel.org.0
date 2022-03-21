Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5464E252D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 12:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243316AbiCULYN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 07:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346720AbiCULYM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 07:24:12 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42B28BF21
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 04:22:47 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id m67so27409843ybm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=59/+29AfugXrFjzNAA/AleHnJFc3FQCIzeHJaozhbYs=;
        b=m8XwpHjKU/W+0aeE0aPhwzwKwy85wfRo4sPTe4jYG6ugw9k55IP7wQxyjtUlrsYH6L
         vFwf5X7rYpPMGoZFzSGwYJXPJUhhU4vS3KxGFE7zo6tMzsRA0EDCmqOJ38RjXh4aZTQi
         B6Cxjhpbq0VX/zpyHtpaFWgO6Sb/XqE970Af3s89fgoDUWPk9HvLdPDyKwn3SBEkMOrd
         5A0fFiNLHfesAR1aGGivG9Z8mI5iYsgSF/z6NoXTm1gsSQ5Nszw1za0F3pfafe21R8tA
         VUU2+JfQYqGDFCwJZe+ClHoqpUO/YzBcw3+pl0UxJO3btWaKLVma4kA4NAyWFtk/9qnM
         DxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=59/+29AfugXrFjzNAA/AleHnJFc3FQCIzeHJaozhbYs=;
        b=VLXIIfyyxPQM/5zJ+UDvdB1d4RYVFl4fzWXtgCknPCfLJ34DBDQHsaBwfeccNdZnnC
         gv4Mpttq2QhX9p+rn5rOIOpfMS0O8ISwDa1PnY+/2ESy1w+TvYj7JU8N3TDNng7X1cFO
         rnC7Ig6aJm0GieFNyCde1pQZgxeK6dbmTJg2jgCsA7WlJtrvX2p8U3+IJJlxJtQuXxS7
         X9j9J8FsSK6O5NKj/crvJg7GZ97XCUZOEzvih3ddIKBJA+8Z6aaIedQj81/pdb0056sD
         Yx2+tSV9j+J2ixk56aaL8WBKSwawSoojsZWoqugdpyr8y1436c08oml4X2MT9tkdk8n7
         eBUQ==
X-Gm-Message-State: AOAM533C3T3ZYDCIrqQNN728+iw9dTE6d2qqmYIh6CjkGXSR5//m0zgN
        zdwXb6L7TFvzImOmr92Cqn4GJhoB6IH/O2UaBiDYfA==
X-Google-Smtp-Source: ABdhPJzWhuELzmeHPG56Ha7BZy3OBGHZOV0q502yNMMRvCHzJ3G4EqBNQBJ2L5I4VLWlR1XUtgBEqVKLi8rTJQxjiwA=
X-Received: by 2002:a5b:848:0:b0:633:716f:1fb0 with SMTP id
 v8-20020a5b0848000000b00633716f1fb0mr19901896ybq.522.1647861766807; Mon, 21
 Mar 2022 04:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220320110616.18355-1-krzk@kernel.org>
In-Reply-To: <20220320110616.18355-1-krzk@kernel.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 21 Mar 2022 16:52:10 +0530
Message-ID: <CAMi1Hd0T6bBdOCe4o_-RSaHdmG3oT9KtqDpHOiQpGQxmoBVa0w@mail.gmail.com>
Subject: Re: [RFT] ufs: qcom: drop custom Android boot parameters
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
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

On Sun, 20 Mar 2022 at 16:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The QCOM UFS driver requires an androidboot.bootdevice command line
> argument matching the UFS device name.  If the name is different, it
> refuses to probe.  Thise androidboot.bootdevice is provided by
> stock/vendor (from an Android-based device) bootloader.
>
> This does not make sense from Linux point of view.  Driver should be
> able to boot regardless of bootloader.  Driver should not depend on some
> Android custom environment data.
>

No obvious regression on QCOM devboards DB845c (sdm845) and RB5
(sm8250), and Xiaomi Pocophone F1 (sdm845) running AOSP.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Cc: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> ---
>
> Not tested, please kindly provide tests.
>
> See also:
> https://lore.kernel.org/linux-devicetree/f61abc2b-3ce8-7b1f-3d28-8a4a03ec58eb@kernel.org/T/#u
> ---
>  drivers/scsi/ufs/ufs-qcom.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 0d2e950d0865..586c0e567ff9 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -957,18 +957,6 @@ static const struct reset_control_ops ufs_qcom_reset_ops = {
>         .deassert = ufs_qcom_reset_deassert,
>  };
>
> -#define        ANDROID_BOOT_DEV_MAX    30
> -static char android_boot_dev[ANDROID_BOOT_DEV_MAX];
> -
> -#ifndef MODULE
> -static int __init get_android_boot_dev(char *str)
> -{
> -       strlcpy(android_boot_dev, str, ANDROID_BOOT_DEV_MAX);
> -       return 1;
> -}
> -__setup("androidboot.bootdevice=", get_android_boot_dev);
> -#endif
> -
>  /**
>   * ufs_qcom_init - bind phy with controller
>   * @hba: host controller instance
> @@ -988,9 +976,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>         struct resource *res;
>         struct ufs_clk_info *clki;
>
> -       if (strlen(android_boot_dev) && strcmp(android_boot_dev, dev_name(dev)))
> -               return -ENODEV;
> -
>         host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
>         if (!host) {
>                 err = -ENOMEM;
> --
> 2.32.0
>
