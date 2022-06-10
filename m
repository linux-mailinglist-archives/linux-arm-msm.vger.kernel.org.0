Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1724546E9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 22:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349954AbiFJUqi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 16:46:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347415AbiFJUqh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 16:46:37 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C9338BDA
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:46:36 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id l81so611620oif.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=WXP/dnK0YDlK5/E1i9cz7pX4wz3nrSJNyTUfLHkhr9I=;
        b=ZJj1KqgR1rdW1l/uVn+xdn9Uy5h5YJC3oGspYfLYmJCRSQeLZEWnQpZdwnMnSyrtoo
         8GPARFoFuqYRU69ZPicw7P8yJiycawGkEBlmAzh5nxQCxcta+6eTUuJCHwqUjjHaLALT
         6bZi2BmlRX6cZTvVBfVuh1+9L384gU+pRXglw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=WXP/dnK0YDlK5/E1i9cz7pX4wz3nrSJNyTUfLHkhr9I=;
        b=PVKBE/BKk/z85CKGHoA2Im1XjAurVOfdZY8TRHQKwPkYD0b0FPECAvl/AS4VfcK1w0
         5nKO958vMT6bkwU1BZ6MDIXbpeCFUCz9zgXDCqnLJS2A9SIMd3ND1GUDgFUa/JxN4oOI
         zXHLh8umwu1Ox0GmRRUNHcpyEQNRxOfJtUyOHjn6fh0AnMfbVtlc6RsRA7Enffr9RuXe
         Pl7lbBHICGPzZlB1eNx8YcodXrNOd2bkkGizhO+6yK9vVOX4Ldf9eBs8ZrvjX1x72t7u
         qXAHJw8vVRxP2mujhaCe+TPSHKFwxClyTZz5pqUpscsdBSD+EfUm+jyBCB5xrQMV+pZK
         KROg==
X-Gm-Message-State: AOAM530h/9yAyDFSryxhOLaD5AqbOLdU4H8oBst1OjRDzyMBfHXwdpCB
        yyD2UhXzDLu6AKNP0+3Pfr1I35JYc1hQ7+BFcCNWmA==
X-Google-Smtp-Source: ABdhPJz6T8iyP5MXE+PWGWDiJ+4fCVtVAbI+1HHpHDGwLRZ4/RlvOsKQRvifEGJuMz7pt9TYFPJ0sL5BhGArjtPw9lY=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr891625oib.63.1654893995898; Fri, 10 Jun
 2022 13:46:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:46:35 -0700
MIME-Version: 1.0
In-Reply-To: <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org> <20220609122350.3157529-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 10 Jun 2022 13:46:35 -0700
Message-ID: <CAE-0n51vKmQ683TTnYm8VxSquqYqL2_3=Ku750r--0GV4JcW8Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] drm/msm/hdmi: drop unused GPIO support
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-09 05:23:42)
> The HDMI driver has code to configure extra GPIOs, which predates
> pinctrl support. Nowadays all platforms should use pinctrl instead.
> Neither of upstreamed Qualcomm platforms uses these properties, so it's
> safe to drop them.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

One question

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7267167d5ef1..6d79f1b910a5 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -233,6 +233,20 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
>                 hdmi->pwr_clks[i] = clk;
>         }
>
> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
> +       /* This will catch e.g. -EPROBE_DEFER */
> +       if (IS_ERR(hdmi->hpd_gpiod)) {
> +               ret = PTR_ERR(hdmi->hpd_gpiod);
> +               DRM_DEV_ERROR(&pdev->dev, "failed to get hpd gpio: (%d)\n", ret);

Did you want to print an error with eprobe defer in it?

> +               goto fail;
> +       }
> +
> +       if (!hdmi->hpd_gpiod)
> +               DBG("failed to get HPD gpio");
> +
> +       if (hdmi->hpd_gpiod)
> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
> +
>         pm_runtime_enable(&pdev->dev);
>
>         hdmi->workq = alloc_ordered_workqueue("msm_hdmi", 0);
