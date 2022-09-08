Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B14555B290C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 00:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiIHWK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 18:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiIHWK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 18:10:28 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B82EBB02B
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 15:10:26 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-345528ceb87so124555897b3.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 15:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/WcHqdHM8dnvu0KhL8XnDPtvYcltW68n+l5+9CRl2js=;
        b=SkIfqdYOLK8R9nL8tGEdusHKauZ2yGxXEslcHgQHtVciNUS/jVWDcjmB3+hBBisgPv
         4jvuzOhivKBk3kAn0wjyfdxZSzCHSZeRzRhXhofW31wAiQSccBgCDeVSqueT1dPMcvLm
         /lcAaPhRKLufjVrLKefaGBQgHfVB5wVT4O1F6jDr2iQGdsC/or9SuLb9CRCPEaM0mIc4
         rQTYfUi+Rg84zYOLbnUVLBzrUH9JhzhVCnVbwJVv05IhTOYk3i5o7aEc0HhyIYLQXcMZ
         /RVQzgqwRNHvX13ec/twUcuqr5rlf6g0JwndelKboKm7502axGrsALyVS/71C1ZObF9a
         uBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/WcHqdHM8dnvu0KhL8XnDPtvYcltW68n+l5+9CRl2js=;
        b=rx46IMAgp7aj9YVC92NGBAC4u+ehdsXEwGHiJx/nuYYR1As3on0IeIxj1Gn6TKNu9o
         ibFmPADoZY0U06ePjnWjrdm9D2XWxJPmizV47MqUwGSleg6FjVLYmqjgm7Km1S0raiOi
         hLozJJXkwvBFNYYI1xoBRBZFVIiTVkgDGtncYgNegtXteikKGwra5jIYJE6J9bN/LWGk
         ireg294WYxhC6k4cSHs7iWQPVPjU5NXURfuDeABS+KyJHM9nfMl/XO9iVulsfT0ilimJ
         PvCOWEU/FmEaZekRDx3fuyUELiS5XkQT5gwIRaTmxj7L/WDDsykko8HGubutxkKKwWbD
         uISw==
X-Gm-Message-State: ACgBeo0vzV7vIi3mAEtlgaA01khbXvOXlTo5rtv9F5cRPcd3sZRWhVMX
        aU6PliTZtMAhwMEYgqP1/22NKj5/NTTrV8f3iavuAw==
X-Google-Smtp-Source: AA6agR5+rTf9bfwfCt1fLupQFbPAbT6x+K2axID1pNI1aeS85ZPgfrTrkdqMwZuK2rOYbirjnMN4yqPTxMJw3wGhabM=
X-Received: by 2002:a0d:ffc5:0:b0:341:6cc1:c589 with SMTP id
 p188-20020a0dffc5000000b003416cc1c589mr9842018ywf.418.1662675025716; Thu, 08
 Sep 2022 15:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <1662671917-17194-1-git-send-email-quic_khsieh@quicinc.com> <1662671917-17194-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1662671917-17194-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Sep 2022 01:10:14 +0300
Message-ID: <CAA8EJpoEPD7pvLcCOnH-r-J=zVxm5C=ZOvMYLBqfwv4ufSWmDA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/msm/dp: retry 3 times if set sink to D0 poweer
 state failed
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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

On Fri, 9 Sept 2022 at 00:18, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Bring sink out of D3 (power down) mode into D0 (normal operation) mode
> by setting DP_SET_POWER_D0 bit to DP_SET_POWER dpcd register. This
> patch will retry 3 times if written to DP_SET_POWER register failed.
>
> Changes in v4:
> -- split into two patches
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36f0af0..7b5ecf5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -49,23 +49,26 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>                                         struct dp_link_info *link)
>  {
>         u8 value;
> -       int err;
> +       ssize_t len;
> +       int i;
>
>         if (link->revision < 0x11)
>                 return 0;
>
> -       err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> -       if (err < 0)
> -               return err;
> +       len = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
> +       if (len < 0)
> +               return len;

This is a separate patch.

>
>         value &= ~DP_SET_POWER_MASK;
>         value |= DP_SET_POWER_D0;
>
> -       err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -       if (err < 0)
> -               return err;
> -
> -       usleep_range(1000, 2000);
> +       /* retry for 1ms to give the sink time to wake up */
> +       for (i = 0; i < 3; i++) {
> +               len = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> +               usleep_range(1000, 2000);
> +               if (len == 1)
> +                       break;
> +       }
>
>         return 0;
>  }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
