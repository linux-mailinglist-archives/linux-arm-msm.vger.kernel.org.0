Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA5F50B572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 12:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446696AbiDVKpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 06:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446813AbiDVKpV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 06:45:21 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0714325DF
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:42:23 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2ef5380669cso80926747b3.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sP8JvrZInBak3AnrSA3yrnJGI9uRamz0KMh5AUQsofQ=;
        b=mxaV6FRRNknnsY7+E9ykC3IUZCerphaQNqbeakR5XX75pUdnHgcJJUsRJ3aXY80yJ9
         HktNrl7JztZV1ZWvWCc1if3I9Ost6qcIY13XFooCfXXscYXOh122ddiLA9zXubk6clOK
         Pmlpju9qsubHxSspDtaLqWbNUAVKqYnqX0P0h9eEiLyxBKvOeIEL9txSEe6wKokO3Xcx
         ZseIJJFtqjjxN4me2HSBYwtgVXmW4BszQiTWFy6eb9aoZFhLzZZCnUWrVso2JZ4LixRr
         ujKw/Jfyw6S0id3WlCZ+Fxy1DYCS/YjBsPgfaS7+Js25+QrYAZem9tlZZ8MtG7MuhcPM
         fEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sP8JvrZInBak3AnrSA3yrnJGI9uRamz0KMh5AUQsofQ=;
        b=xYvuZMJzXEAW4QYj+HskiJ7d5ofOjaAZ+L3tb19BLNu1GhErlOBbPhZHqAxGXd/Krd
         MB12KJGr15+fdEPXUo21OpcBBHTc6SujWBVWnzUUKG/L0tgnzpCGgC5qdb+dhH5QsfOo
         08nSVJL1USM3ptcKgReIR/xFKYeNk19A6ErDxb+zPFK5WcvktldSZ1iKSl6azOxKCi5U
         Gv0ps/7/avwagCtuQcxEas7Ivx54H+uIfIlLM9QqphxJ9XVVowzTrrO3hbGiQ06LuXZn
         nmpB6+8Cof+oohfkASY69E1IrsDxvsKNM6ME2eb2eJLVkqSn4a1N/fXgNP7UuOla8012
         OPCw==
X-Gm-Message-State: AOAM532XjtvUdKp+veGcW21p28+/sl6wRSxoJvtGxkb0EVhM9NWIKTTU
        tnP4N+LzIM3vF6LbPvAYB8jIhbxQzjVcCWKJkl5vIg==
X-Google-Smtp-Source: ABdhPJz2tiFNiuWE0RHaKofgV7Ha+x3z1t8YOpPiDzl8uQ8X2u6bN2PirRLEPFpKZHLnbUVDQq7E3Ml0rr2qadl/3mE=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr3926695ywa.101.1650624142869; Fri, 22
 Apr 2022 03:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220422085211.2776419-1-lv.ruyi@zte.com.cn>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 22 Apr 2022 13:42:12 +0300
Message-ID: <CAA8EJpoAeCp-=k2o+C4E4jHBAv7f3eKrV5FZiYjVZ8hcRGYLVA@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix error check return value of irq_of_parse_and_map()
To:     cgel.zte@gmail.com
Cc:     robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com,
        airlied@linux.ie, daniel@ffwll.ch, swboyd@chromium.org,
        quic_mkrishn@quicinc.com, angelogioacchino.delregno@collabora.com,
        vulab@iscas.ac.cn, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
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

On Fri, 22 Apr 2022 at 11:52, <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3b92372e7bdf..1fb1ed9e95d9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -570,7 +570,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>         }
>
>         irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> -       if (irq < 0) {
> +       if (!irq) {
>                 ret = irq;
>                 DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
>                 goto fail;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
