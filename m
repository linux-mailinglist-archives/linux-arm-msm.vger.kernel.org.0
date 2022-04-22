Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E452D50B569
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 12:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446815AbiDVKoe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 06:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446805AbiDVKoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 06:44:23 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E792B273D
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:41:26 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id f17so13711820ybj.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BB+z/sNpdoQmOp+aeDFGtzesrgj54ahnX85kbOB7QMg=;
        b=abNt8UJyo7oWu4YeugczIcw2HKnt573QtuCIX0kpROHHBTfDZ44GLVwSZbHXFcj6ok
         gtW7g3p/up4ectz36iG/SH6o5V/x/RKjenuuTvxPUt8ZzfiqxUXXgzQDg/tz8MKFNcYz
         ildOPGsN/S1GC5l6LWtEmSveqZrZkIT5Tyw2N5OL8fxmP/vannelo27VcTV/eTKh/mUW
         1+Hm9E6rUbWvwUJaqal6SMegDE135493vMaM0OQefuPmkxB0kMPhI3NtgWSfLemUqvna
         DMIOl1ND9xRdijwsZ/jQP5ysxHcGlkfQdhEQH4TXakrqAiUEA7nymqvQyWfDjWQPSIW6
         lZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BB+z/sNpdoQmOp+aeDFGtzesrgj54ahnX85kbOB7QMg=;
        b=t52xYBlSzQK29qtuLwYTzAzokNzql3SPvBr7TN0QsgikF1LBy0Zf7JX/7gMxLLlBCI
         oQuabgLMm2lJWI+Ggp8Jap39owguBZIhSfBUmN34OfCh/dWyzK1bj5dNQr0QzRJ7P/JL
         63bPWd/slWlbgRA+xprVWJl3Kh4hzYZ1nVpWpFj3LHW5xnXpVymqeIgiksh0YdHYeEBB
         3ScsW0/DP4uFG3lIkbpRU/RbIn/WS/W4bBJhnKO44PpBUSaJNoyLTR/Xtmvu88FuIh6C
         FyLNCxFENoyKJanKYvbinqu0kBpr1ur4v7v0JsBDi7eN0tdpfoGRwPF9MlPD2SxffbyN
         bIyQ==
X-Gm-Message-State: AOAM530CbAJuiDoEP2Q2Qhc88Tv+O/giox+VjYk7EySNXFj6HZWf8eY5
        tJ33lwD9iqT3qSfpSOt/JuvdkWmiaEslBz+vmIwamQ==
X-Google-Smtp-Source: ABdhPJywlbGi8Liw+QkSDej3Yl+pGh+CnUP5xw1RQTvw7UzpZloUGNHHQvZWxVNt0MvxBaCcf9gKq0bKcE3NMiK40DY=
X-Received: by 2002:a05:6902:1547:b0:641:fb0b:4830 with SMTP id
 r7-20020a056902154700b00641fb0b4830mr3946865ybu.175.1650624086191; Fri, 22
 Apr 2022 03:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220422032227.2991553-1-yangyingliang@huawei.com>
In-Reply-To: <20220422032227.2991553-1-yangyingliang@huawei.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 22 Apr 2022 13:41:15 +0300
Message-ID: <CAA8EJpq2dNaRgEqrKpKTTfAm1p=QRZd2z1ouguiA6wUoxA9QAA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: check return value after calling platform_get_resource_byname()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        robdclark@gmail.com, jilaiw@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Apr 2022 at 06:10, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> It will cause null-ptr-deref if platform_get_resource_byname() returns NULL,
> we need check the return value.
>
> Fixes: c6a57a50ad56 ("drm/msm/hdmi: add hdmi hdcp support (V3)")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index ec324352e862..07e2ad527af9 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -142,6 +142,10 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>         /* HDCP needs physical address of hdmi register */
>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
>                 config->mmio_name);
> +       if (!res) {
> +               ret = -EINVAL;
> +               goto fail;
> +       }
>         hdmi->mmio_phy_addr = res->start;
>
>         hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
