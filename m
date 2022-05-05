Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5086B51C72E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 20:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384194AbiEESZg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 14:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385037AbiEESY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 14:24:56 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A3260A84
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 11:18:26 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-ed9a75c453so4989598fac.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 11:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=1jpEHyGirjaqNUVRP1nz/MiyeczcMtRZCBgdvFueFbg=;
        b=dNocJH2pm51w2sdCBeubcHoBirqMpP4BeW10hHVrgouUJomu19MuSgDP10MAcJT1nj
         mBhKXkC5eceOPxd/JNxBGm0skq56M6pzHm1+7vMA6y1XdjmY/oQybSc78dHVxPuR11wK
         kQeBG67nLfix9PfNYpH8hazatCrGvl2JUyXw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=1jpEHyGirjaqNUVRP1nz/MiyeczcMtRZCBgdvFueFbg=;
        b=iO35FXiJqb7JEv0by/vCWncuMtou/I4FEbTQw8yGQHDNPZDB8J1faTnsP9CZPV2mw/
         oDWCBnQlS1ZxJSnQbF6RF23Nt1QY1KNm/01FiUAbrFolJn0cH4MqeGhSwLTV4VmDvHvw
         j6p0e5sSd8omp+BaZ5btpOtuIDRhON1Kccv0jd10DjiqFT+m37w5gmXHk7CzEbuVUrzv
         1xkceKQL2luDOGZTs2Xga6HFUF8zBxAQqch6ixBKvnJvcfuxHAwSrW0wDrD5xATcmupf
         Bmu8a+7J6usi19j7BYMJuZK7g4M3Oah7bnf4O977yy7ewn2eRFj8mPHh5ClZ4X+LMhR5
         X94w==
X-Gm-Message-State: AOAM530QUQOtYZO56ejsBTnYOw+zX5n1GHGBmCmjNnE/FUroqDRVq+nI
        bWHiRknNka26uOz0oV8Cei/DdPEjyfdlcjQoa4I9zA==
X-Google-Smtp-Source: ABdhPJzMp5CHlTo8w5ux98tGyd6+gy+uiMp3v8K0Hb9IdRobOQWLGqnf7677jht+CONLIgkUYNLz7u6VoaG/olKYp+g=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr2956854oao.63.1651774695213; Thu, 05
 May 2022 11:18:15 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 May 2022 14:18:14 -0400
MIME-Version: 1.0
In-Reply-To: <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
References: <20220425210643.2420919-1-dianders@chromium.org>
 <20220425140619.1.Ibfde5a26a7182c4b478d570c23d2649823ac2cce@changeid>
 <CAE-0n51eZpAKprRQ0HqjLciF_BVQHBDN8SMFNVmmOd=B9UBEzg@mail.gmail.com>
 <CAD=FV=WmVK3wTQf_EAxSi0WPXedSFGCsKdyqRnHsskmMYTHDQA@mail.gmail.com> <MW4PR02MB718610FAA14F966ADE1B1585E1C29@MW4PR02MB7186.namprd02.prod.outlook.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 5 May 2022 14:18:14 -0400
Message-ID: <CAE-0n51Q=cGwrMec3JEQENqWHV3pAUjLPT6RwZLA5xV080sgxQ@mail.gmail.com>
Subject: RE: [PATCH 1/2] dt-bindings: msm/dp: List supplies in the bindings
To:     Doug Anderson <dianders@chromium.org>,
        Sankeerth Billakanti <sbillaka@qti.qualcomm.com>
Cc:     "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2022-05-05 11:02:36)
> >>
> >> Quoting Douglas Anderson (2022-04-25 14:06:42)
> >>
> >> Having 'a' in 'vdda' typically means 'analog' for 'analog' circuits,
> >> so I'd expect this to only matter for the phy that contains the analog
> >> circuitry. It would be great to remove the regulator code from
> >> drivers/gpu/drm/msm/dp/dp_power.c and move the regulator_set_load()
> >> call to the phy driver if possible. Hopefully qcom folks can help
> >> clarify here.
> >
> >Interesting. Oddly enough, the sc7280 datasheet doesn't list the "_A".
> >It calls these "VDD_VREF_0P9" and "VDD_VREF_1P2". However, on the
> >schematic in front of me someone labeled these pins on the sc7280 with the
> >"A". ...and the driver looks for a supply with the "a". :-/
> >
> >It would be good to get clarification from someone with better information.
> >
> >-Doug
>
> Our internal power grid documents list the regulators as VDD_A_*_1P2 and VDD_A_*_0P9
> for all the platforms.

Do your internal power grid documents indicate what these supplies are
powering? The question is if these supplies power any of the logic
inside the eDP controller or if they only supply power to the analog
circuits in the eDP phy. If it's the eDP phy only then the regulator
usage in the eDP driver should be removed. I would suspect this is the
case because the controller is probably all digital logic and runs at
the typical 1.8V that the rest of the SoC uses. Similarly, these are
voltage references which sound like a PLL reference voltage.

Please clarify this further.

>
> So, as a practice, we put the same name in the DT files. Hence,
>
> Reviewed-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
