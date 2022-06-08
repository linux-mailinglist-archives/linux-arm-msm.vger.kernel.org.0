Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F135F543E0F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 22:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbiFHU7p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 16:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbiFHU7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 16:59:44 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A28840A3C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 13:59:42 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id p129so24968168oig.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=FcmDs4vqa+TasYfpZVJLUBpBUyUSt1C9HSlbOciM/mM=;
        b=YOMVdz3SS4pfTUc9aTrCX3WuwDW/bMFrATGKllus5yfo9SvZzofwCdlpHpiVN2Gns1
         d5AZNsNbRhYDQS0Desv3WuqN0QQ7dyGM9dNZLwc9yMWJqwcHPW4heAwNTOStgVTvxTZY
         UfX9r8aXugrnDZJlQ4ycpUXv10eFgNnA5EuHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=FcmDs4vqa+TasYfpZVJLUBpBUyUSt1C9HSlbOciM/mM=;
        b=xkl/C+5dax5pR4aaytpIACzF4cKKzLC2/KFSdxP7rIBhr3BeVFh4olxc6NhGu1hQ9P
         cwzuLIztqWloLmlPVvLGrYsklojp8E4A3D1e0u9oDwuNGyUn3ltSRI7ubfOpTdGtLM5n
         iUh+9FSveJQ4zj5RtHgBmCLRBfIBgpHhicg/73zs2bO7MMmV6N0/eKHkZJSp89HH3VIy
         XiF77DyE7C3YRRzClC6u4tXvE84d0l8yyq5oXyvtoqANqYe0vH/gQg2Jl4rTlQlAWhYL
         tA9SoxTznYzvPGjAXPzFkk2SjzF1MJczv4h20E7azsGqCOItMzwMEmr7npjxZBqpq1cm
         n3Rw==
X-Gm-Message-State: AOAM5337Ul9pzSUW929Ct3evD5f/8AZkJztiIoaD3UCNy/VTuibrzgod
        ylg3C482cvTHZduUcx2gxKxG5vxbYWrh3AhkdhKJiQ==
X-Google-Smtp-Source: ABdhPJxnlj9sN3+K7oKRZ4gWu7RbfsNuNQkj4EkKq1yNdOgmwVZ5t/rmtKGAs68dcNiueV47wbdHzEDCVycwsnvzh9U=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3564449oib.63.1654721981740; Wed, 08
 Jun 2022 13:59:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:59:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 13:59:41 -0700
Message-ID: <CAE-0n53z_nWsgVVn-4LbsP1GuzTgCa+DDDDE0y8k3+s-t=eSBA@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] drm/msm/hdmi: drop unused GPIO support
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:17)
> @@ -543,41 +529,16 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
>         hdmi_cfg->mmio_name     = "core_physical";
>         hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
>
> -       for (i = 0; i < HDMI_MAX_NUM_GPIO; i++) {
[...]
> -               if (gpiod)
> -                       gpiod_set_consumer_name(gpiod, msm_hdmi_gpio_pdata[i].label);
> -               hdmi_cfg->gpios[i].output = msm_hdmi_gpio_pdata[i].output;
> -               hdmi_cfg->gpios[i].value = msm_hdmi_gpio_pdata[i].value;
> -       }
> +       hdmi->hpd_gpiod = devm_gpiod_get_optional(dev, "hpd", GPIOD_IN);
> +       /* This will catch e.g. -PROBE_DEFER */

EPROBE_DEFER?

> +       if (IS_ERR(hdmi->hpd_gpiod))
> +               return PTR_ERR(hdmi->hpd_gpiod);
> +
> +       if (!hdmi->hpd_gpiod)
> +               DBG("failed to get HPD gpio");

Does DBG() add newlines?

> +
> +       if (hdmi->hpd_gpiod)
> +               gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
>
>         dev->platform_data = hdmi_cfg;
>
