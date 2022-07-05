Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3AB56740C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 18:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbiGEQT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 12:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiGEQT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 12:19:26 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0201D0C6
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 09:19:25 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y8so10192076eda.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYZi8rRbHn8tW6ukNBHgDr7LhwZ5zS5lnEhO2Ak2igg=;
        b=QdHnGJG9DT6rEloPFwd7YvkIKVolkTouLjq7lM8+wlzBwMERfD6toyZW0AOVQ9kJ6y
         A6k3Tp1xU+pX4IW/wcYcCWYsS8wLqb1HR3gD3CIm7wv2c6PxUokCiMrBLo8PLilvsdzk
         jyYwJ6OpM/61mtYOvZTLCdPJULcv98E670xeA+W3ZgiiGt4ZfMmJKooScLo4v3HCFtDk
         9ATpc+IgFXU8mIGzi3XyAyUiXCPREbw/Dhjc1v9hDh873301doPIx2K5A+1q9VSVYk+G
         2i28wkXV7j7jVi4MiBbv57h/Yt040xIP93Ij/WjDvsobOIJT9aWjYt7EzoHgSo/mQXzn
         3obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYZi8rRbHn8tW6ukNBHgDr7LhwZ5zS5lnEhO2Ak2igg=;
        b=CY0rafGqliRbrfTghH5QFfnLhcuis7N7b0yPorrX+AvFgncLTP+Piot4gJjHYqfIuY
         MNON8LMGbYSJKaku8taz1lkeNzGhrd+YB8qpZbPx8Yd6FbrcuRDa6y0RKiS4FvE3ShWZ
         avEuu8e7/6d4F17o/OcO9rBtZSWY07xvWsvgvHRYo6B829iCzs40/uhZkoFVy8teJSYg
         CHnqFYwperAwbSnRLd0g11xedUMJOZW9clCodE7zNFPuDMiPCZZwjBBf63TZABw/ZF1e
         cWBXzQqfvsr3SUyvGkfGWK4P3vPnEnFpffOFwmrSv5/cw/FsxDOwcx9ki48gaYjU98X/
         mwhQ==
X-Gm-Message-State: AJIora+nlE8ayV4yA20lR5C6il4m3YfZIzMdxHcGP9hAZcy0JEkXwWxT
        DftG7zijWOChRBCC6CDBIR85YC6TybDxmYUP97Vthg==
X-Google-Smtp-Source: AGRyM1uB27HRZg8W8xYPv7TCcAhKGqKs//KSawcHJS04Mu1OQie7j0MwhR7ZT74oMo0NdgDgHW3BxQMkqVF5lv2at3c=
X-Received: by 2002:aa7:cdc2:0:b0:43a:7255:5274 with SMTP id
 h2-20020aa7cdc2000000b0043a72555274mr8914387edw.159.1657037963909; Tue, 05
 Jul 2022 09:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20220704220814.629130-1-vladimir.zapolskiy@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 5 Jul 2022 18:19:12 +0200
Message-ID: <CAG3jFyvXt1AdJLBU55phM1matF3VRdu8re1tFkJdgtEFrPbVuw@mail.gmail.com>
Subject: Re: [PATCH v2] media: camss: Do not attach an already attached power
 domain on MSM8916 platform
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 5 Jul 2022 at 00:08, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The change to dynamically allocated power domains neglected a case of
> CAMSS on MSM8916 platform, where a single VFE power domain is neither
> attached, linked or managed in runtime in any way explicitly.
>
> This is a special case and it shall be kept as is, because the power
> domain management is done outside of the driver, and it's very different
> in comparison to all other platforms supported by CAMSS.
>
> Fixes: 6b1814e26989 ("media: camss: Allocate power domain resources dynamically")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v1 to v2:
> * corrected the fixed commit id, which is found on media/master
>
>  drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 932968e5f1e5..7a929f19e79b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1465,6 +1465,14 @@ static int camss_configure_pd(struct camss *camss)
>                 return camss->genpd_num;
>         }
>
> +       /*
> +        * If a platform device has just one power domain, then it is attached
> +        * at platform_probe() level, thus there shall be no need and even no
> +        * option to attach it again, this is the case for CAMSS on MSM8916.
> +        */
> +       if (camss->genpd_num == 1)
> +               return 0;
> +
>         camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
>                                           sizeof(*camss->genpd), GFP_KERNEL);
>         if (!camss->genpd)
> @@ -1698,6 +1706,9 @@ void camss_delete(struct camss *camss)
>
>         pm_runtime_disable(camss->dev);
>
> +       if (camss->genpd_num == 1)
> +               return;
> +
>         for (i = 0; i < camss->genpd_num; i++) {
>                 device_link_del(camss->genpd_link[i]);
>                 dev_pm_domain_detach(camss->genpd[i], true);
> --
> 2.33.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
