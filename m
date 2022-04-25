Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5593D50EA80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 22:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241834AbiDYUbc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 16:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245393AbiDYUbS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 16:31:18 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B327312FEEA
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:27:06 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v65so13731926oig.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=J5gVHKISx3QJ+9rbfiKPE8jzZb4JPDy2bmFXYVfE7QI=;
        b=dHc3YQjaHxUWJqNY/sPAmimZ9RDs3lraMar8s5cKozkGHUkF3rxjnHmCn6Z3XZuWd3
         soVVIbBYqCNe/KWp8KrRERuFKQrw9kpCcHNJ7e25h3lR/3suBB6YxXizuwD4+NKVgJ6z
         aaiFNkWVLuoswGM9HV30j1ZfMMvP34dvqX3A0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=J5gVHKISx3QJ+9rbfiKPE8jzZb4JPDy2bmFXYVfE7QI=;
        b=NmOs7HSJZxT2ue5lhJvDw9L9NH7japPP6Tfnzf3w5+OROMqE9PkB8K3dJn5YIUXyJM
         tRp7WloHRx9redIjUUMDUvSrxxRVfCnQ5TrgbdhLmbmgYX+MwRJdJ7aGFO/bwkcKCXAX
         5TJCb8g3vRfUXYMyMkCAZ2u2awfXsx5gS5eEvLeR03bMx+0HH/XaE1xl+BQtlnDQLuKU
         zg959AgItGpTt7BbgVewbYS4p62qEtE6aNV5e6r9bqJrMSSP8KX+XeoghRssvGyCC9TT
         AvFg1rpp+hUBw8St8DEdiDL9ORu6Mr7PCL6d4MLIxvYmhf+jU0E5EuNCcpoJ6hClYUDu
         7mRw==
X-Gm-Message-State: AOAM532JDyVgSF+PTq5i+Oc7Lh4RrsrgUEeVmvwcZgorvSA+xfZJ6TE6
        ZwoaMNJvvfMi2Ka3Ucpc7SBDBiTZjDwDEBgsBL+VUw==
X-Google-Smtp-Source: ABdhPJweTLbXJH2p+7bcg8l/IAqcZqisAM9oKT2YLwXZj7bUL1azgz2HPsfUj1mwa18M+e2j95UlryAHcEs29q5FWOw=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5256884oiw.193.1650918425947; Mon, 25
 Apr 2022 13:27:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:27:05 -0700
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB7186AE3B9B573FB1C594DA35E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n52tKt3yywZFEKobet4t9xXA_GbTDcUqPPEj5A-KkDET3Q@mail.gmail.com> <MW4PR02MB7186AE3B9B573FB1C594DA35E1F89@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 25 Apr 2022 13:27:05 -0700
Message-ID: <CAE-0n53KXNdt64xLqFHBaj3z7ocV-b5fUxpxthkFw7-26EdB-A@mail.gmail.com>
Subject: RE: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        Aravind Venkateswaran <quic_aravindh@quicinc.com>,
        "steev@kali.org" <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (QUIC) (2022-04-24 19:55:29)
> >Quoting Sankeerth Billakanti (2022-04-22 02:11:04)
> >
> >>  int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog) diff
> >> --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >> b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 055681a..dea4de9 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1096,6 +1097,13 @@ static void dp_display_config_hpd(struct
> >dp_display_private *dp)
> >>         dp_display_host_init(dp);
> >>         dp_catalog_ctrl_hpd_config(dp->catalog);
> >>
> >> +       /* Enable plug and unplug interrupts only for external DisplayPort */
> >> +       if (!dp->dp_display.is_edp)
> >> +               dp_catalog_hpd_config_intr(dp->catalog,
> >> +                               DP_DP_HPD_PLUG_INT_MASK |
> >> +                               DP_DP_HPD_UNPLUG_INT_MASK,
> >> +                               true);
> >> +
> >
> >It seems like only the plug and unplug is enabled for DP here. Is replug
> >enabled for eDP when it shouldn't be?
> >
>
> By default, all the interrupts are masked. This function is not executed for eDP
> anymore because the host_init, phy_init and enable_irq are all done from
> modeset_init for eDP with aux_bus. So, none of the eDP hpd interrupts are
> enabled or unmasked before pre-enable.
>
> The replug interrupt is unmasked for DP and eDP from the dp_hpd_plug_handle()
> and masked from dp_hpd_unplug_handle().

Why is replug enabled for eDP?
