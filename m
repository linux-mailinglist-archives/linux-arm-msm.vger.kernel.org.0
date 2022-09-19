Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCAD5BCCFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 15:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiISNXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 09:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiISNW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 09:22:56 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06422B60A
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 06:22:55 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id l65so28058169pfl.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rB2efXodZAeYQuXLadLjMv2cW1RkQIyx3Ihg+D/gw2c=;
        b=ET0WcksjYR3a5lAHYU8+chKDBmAmJUMY/Uu3b21tpvzYK0jUQWxMHtwZHRmkwUvHKB
         Lw7wMkYLcE8Nti9KSDCttDqOOINaGyZVjXporEHIGgyetB0FX0KMOGFMwWzSKIEk0KR8
         pjTTy+PrMFDI6zLRdSAfgkC/Sx6UGa5Ie/XTt4rJ8pHSu955+XXaMqjIsjvuZzbD7yoV
         BISYEg/W7/O+MS9Ize574hxM8RMy8Duwk+l0eQnGdz0S8PB2WVajd7a0jeEmXiB4yfzX
         Q8k3YdX2qqW4PNRjMRTFwOgzHzinvWa1+8g+TAYNZUlmLYGE5ptFCNf6Xwsf7vIOnWRq
         Bqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rB2efXodZAeYQuXLadLjMv2cW1RkQIyx3Ihg+D/gw2c=;
        b=Vey4j/AUd26gzSoiAeWI91dLxqccRGcmBsZXExF8odyo3cEvLDhK15VD3pP/8xdQkH
         R6ob83i5s3igZIa2sgWOsf0i8qJQxig+0/t7q26nf12u6n+FEPQ24362eOPPuar+Zql9
         JU4irOjCQHBDKo/a2YalsQAz7+RZCTmWUsEq2dV4AfWre0tfd+ipwNPgH1fxLy77JMu8
         6sa1TAiifyOfsaJUr61VbwU22r6hHxkIz9NkYL1p54hSV9vWYDp/LFiifpudyPOOsuWz
         gEW24YnMgoL0J2LCUbebH5HAt8XZ8WY57WEqb8Qq5F9jwYKazXduuBpLwLdfS3VskqRG
         aEIw==
X-Gm-Message-State: ACrzQf3aSvNvKlAXhc+4DcTVIeELReWQU47sSN4M6EZWm2GcBsbY8YHk
        tbjFPPs6NLi1AP2YnfcENuxpsfH0llmFT7fn5E3hnw==
X-Google-Smtp-Source: AMsMyM7qX8JaivH+pU9JLjukCe0RRS9uuMlO5zhLeRj22V7Arc9eQv7VeHLlk1eIIGd7/vgHW1i6xYshGo7yqPUtWKo=
X-Received: by 2002:a05:6a00:acc:b0:530:e79e:fc27 with SMTP id
 c12-20020a056a000acc00b00530e79efc27mr18886647pfl.61.1663593775199; Mon, 19
 Sep 2022 06:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220916144329.243368-1-fabio.porcedda@gmail.com> <20220916144329.243368-3-fabio.porcedda@gmail.com>
In-Reply-To: <20220916144329.243368-3-fabio.porcedda@gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 19 Sep 2022 15:22:18 +0200
Message-ID: <CAMZdPi8gGrbkKnDR+WLadF92shJbwH-ksQY+dbpgfZ21iAp9ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Add a secondary AT port
 to Telit FN990
To:     Fabio Porcedda <fabio.porcedda@gmail.com>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, mani@kernel.org, ryazanov.s.a@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, dnlplm@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Sept 2022 at 16:43, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
>
> Add a secondary AT port using one of OEM reserved channel.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 51e2b901bae0..caa4ce28cf9e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -507,6 +507,8 @@ static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
>         MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>         MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>         MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(92, "DUN2", 32, 1),
> +       MHI_CHANNEL_CONFIG_DL(93, "DUN2", 32, 1),
>         MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>         MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> --
> 2.37.3
>
