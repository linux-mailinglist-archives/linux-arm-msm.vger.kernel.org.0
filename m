Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B250752C4BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 22:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242781AbiERUv7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 16:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242783AbiERUv6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 16:51:58 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2596AA6B
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 13:51:57 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f17f1acffeso4307700fac.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EkJ7c6TDFhhKRa+OTrT6l5LgL8a5FN7wmT5Y/mVgOBY=;
        b=Mz/2VNmF/Qm8XBKO6jjH1wqNziZBqj3x/FvlMJSGBhS8qVox7pMhMTd1dQTEc7+Ko4
         UC0w0+n72k87GmLubXCiTT29p5zwoYExdtWWSM1UBnvP/F7TG1YnWvF3Nejy5yHG7Yw2
         LA4Aqe/62+afm1veBCNg10hLbltcuXqnLE3Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EkJ7c6TDFhhKRa+OTrT6l5LgL8a5FN7wmT5Y/mVgOBY=;
        b=SmGzT/YBfe6aldNpGPHEraGnQKPrTttMw7h2qs/Decc4SXS0Wa8NhgSMzZb12EAqec
         k05npQ3803Yjz1a9ImW8ZljhyBACyySJPpz8Ca+aGu90msUXxVVKmba5I7y4iNweDn6O
         XCPYPshkoNwjdvAyy1mnX+Cy6O8pNDDJwTwZxKIU7c9opTzCEO/DhVif9WUj//bfbeFD
         42O2DhJDOjxB2+mT3C7adG+1D9gFfXk+pU+UvGFOorEo2welu2W9WhJ+X/qlC0mwJWmf
         FuEDkVR0tpAgLoRcv2QQBrrczTxwMxJ9GThEyrBce9p7yeDEk8ixKI4zS0zorlbeHzw7
         WIGw==
X-Gm-Message-State: AOAM5332W1imtJUCrFtfQJofswC4WQQWBmpcSFZreGsCjVXVU0xnBxyf
        8zRKraCUeveiEqJ5pHIX1MfEEem8bUKu991my/BYYw==
X-Google-Smtp-Source: ABdhPJzgJw3GN2UAR/UMlvVpHQSaAwYbNIOCn2Obfjno00YjCblW9KW9QVE/gAlCwH22JwjiaD+tCtmZTlvXU0isFu0=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr739706oap.193.1652907116977; Wed, 18
 May 2022 13:51:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 May 2022 13:51:55 -0700
MIME-Version: 1.0
In-Reply-To: <1652905444-10130-2-git-send-email-quic_khsieh@quicinc.com>
References: <1652905444-10130-1-git-send-email-quic_khsieh@quicinc.com> <1652905444-10130-2-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 18 May 2022 13:51:55 -0700
Message-ID: <CAE-0n533Rf55ypeCY=A4dpxzdviUO3G9NFS41nceds6ZVFt-BQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] phy/qualcomm: add regulator_set_load to edp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Should subject be "phy: qcom:" prefix?

Quoting Kuogee Hsieh (2022-05-18 13:24:02)
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Changes in v3:
> -- no regulator_set_load before disable regulator
> -- no supply name string change at probe
> -- split into two patches

These don't go here because this isn't a drm patch.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..00b6726 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* 1.2 V */
> +       edp->enable_load[1] = 36000;    /* 1.2 V */

What does the comment mean? This is the load for 1.2V supply? Can we
have that sort of comment instead of "1.2 V"?

>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
