Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75ABE5B1162
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 02:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbiIHAkZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 20:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiIHAkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 20:40:24 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211B53D599
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 17:40:23 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-127dca21a7dso13001765fac.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 17:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date;
        bh=62Ut1/c3cJ2eC3GmfWAKZ1TzeGNyZJ7+Cm7wnqN9r7M=;
        b=Up+BpYurfwNR/Mi7uvG+ka1mkw0pp8TamacP9nijLL3NDU4fhu2KFXifTCBM1suYQP
         Sh5kEprrgp6xpuvbdxrzlENdFQLdtFCUt7UA/EDtsyk1vDOWViWSDmFljUdpmlgK+Tv2
         yzt32u9QIZYga9+c8PO8uH2T1/B+mzYB1iM1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=62Ut1/c3cJ2eC3GmfWAKZ1TzeGNyZJ7+Cm7wnqN9r7M=;
        b=kP7hzlGHx49eZH0CrSstiONIB3lb37PqcDl2+Fc5xkdvpGiyBYL/TbNxhT08FgoSh7
         nTEzkonIgSW9s2eGvz0x5Y/UvED068Y+gPcq7aEsN9Km8Uq4+iKv+esdLpNeNH+ZT+0T
         TihNbOLb+wfm7z6W8KMHqGfBsnCXsweCpmODoyvXL7n3MQeQVpt1eHV2L4Zpd2ulTmL1
         qe6ZcaHJxUcuomvW3HSzv21Y4g2TdTzSWUQyYS0I+UExgcRWvAqjLcEZVicg+LPtFh6d
         upQQ6QO6THd+tnooa9pMb/qHQgl9X2zvNV+9FXQaN5fRDuW7wbTX1+AE59ORiaETUsyX
         a5WA==
X-Gm-Message-State: ACgBeo3LSV8fc1D4ahonozF6tbFAYlupufn/cBQ4s1kdkXMJr/A0tMDf
        AbBckKz/0Ajy/nPdsSsmM6QVYhMKSKRV8nZITHN4rQ==
X-Google-Smtp-Source: AA6agR49Hhxv2DcaNITucmAmy/tQYIg8aUvCl5UCyFM1LZ+moqmC48Zcb/V7yprqhvfySLxljb1oOxQjE35nV5d/XmA=
X-Received: by 2002:a05:6808:bca:b0:344:ef42:930f with SMTP id
 o10-20020a0568080bca00b00344ef42930fmr432433oik.0.1662597622442; Wed, 07 Sep
 2022 17:40:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:40:22 -0500
MIME-Version: 1.0
In-Reply-To: <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org> <20220901091527.1992208-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 7 Sep 2022 19:40:21 -0500
Message-ID: <CAE-0n52ak-GLKdc2QYV9y2PeQN8ZQej24JGSEFx5pqFd=ONjLw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm/msm/dp: switch to using platform_get_irq()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-09-01 02:15:26)
> There is little point in using irq_of_parse_and_map(). Switch to plain
> and usual platform_get_irq() for parsing the DP IRQ line.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3173e6962a78..40c7f91abec9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1243,8 +1243,8 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> -       dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> -       if (!dp->irq) {
> +       dp->irq = platform_get_irq(dp->pdev, 0);
> +       if (dp->irq < 0) {
>                 DRM_ERROR("failed to get irq\n");

Can drop the error as well because platform_get_irq() prints an error on
failure.
