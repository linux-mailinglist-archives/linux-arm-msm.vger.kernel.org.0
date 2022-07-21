Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8852657D049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 17:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbiGUPvE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 11:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbiGUPtU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 11:49:20 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C89EB70
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:49:19 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ss3so3811476ejc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SxxITHDTb1HH7twfNVc7G9AAeqX8EqngAkO5R6iw9Js=;
        b=nR88LRJ9k88qnqomsQbC4z8uoRy9fr9i9anwrJpCsWfLVtmxOhvAcI824wYLC8zXE8
         RjsTDc1tVbPt92E7Ye/VEY0Y/MbN+CHAQCQXQk7Yt50W/Vf3C7QBWWD+vy10BkIU2CA5
         ydR0CWMAHPOsDGdAmI3Rrm77mVcFoDqSxdL1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SxxITHDTb1HH7twfNVc7G9AAeqX8EqngAkO5R6iw9Js=;
        b=vXQRSikOfQ105d/cy8y1/AahnDsdSp3osZlv87wfDcDI6j4aIXscA3LhBTInnOzGvw
         wpYlXhxQa6rTp3SHL53l63Qn2flYSuq8Wt1RIfaGhOLL3EAbUNXJYilPFNszsrLVQ2fN
         4dTZvPfQP9JWToWBFVLhZfbKncfAxkesaT/IpyzOPiEg0w3QNuO33ESvTBnfQ10PrGyR
         KEIaKrZpq216Q5HrWetRfLw7VpiznberzbbBEv1ZrbzRcOZawuIkoEboTCbaLlSeMCop
         ohDXGxNBPtkePk6NuuQjwGNHsm7tYFdpP5jC26c1T8+TOVgPzeX2IJA43FDcRUBD1ol7
         ZLBA==
X-Gm-Message-State: AJIora+h7WM+mr1bP2o84h+ZKkEOBv67lOvONV/4O4NJaeyZRPaGsD9P
        jJHYVx7MtQckvUL+0EeBA+2OasGELtxe11KxoAw=
X-Google-Smtp-Source: AGRyM1tlOx4DDgW+ExzyPXeRI3gA4lSie7GwI5aodBe595W1g0OUTuae5uDB5dC4CdjUnU4n51aDiA==
X-Received: by 2002:a17:907:3da0:b0:72b:47df:c1d7 with SMTP id he32-20020a1709073da000b0072b47dfc1d7mr41186221ejc.214.1658418557267;
        Thu, 21 Jul 2022 08:49:17 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id p20-20020a05640210d400b0043b92f805eesm1173859edu.70.2022.07.21.08.49.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:49:16 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id j22so3903403ejs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 08:49:16 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35607698wrr.617.1658418241950; Thu, 21
 Jul 2022 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com> <YtlrV5R+JMxb7Dlu@sirena.org.uk>
In-Reply-To: <YtlrV5R+JMxb7Dlu@sirena.org.uk>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Jul 2022 08:43:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
Message-ID: <CAD=FV=XDOxy1R5ipD0errwi6GOFz-X6G3_WE34LGLqmWE6_iyw@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To:     Mark Brown <broonie@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 21, 2022 at 8:06 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 21, 2022 at 07:49:55AM -0700, Doug Anderson wrote:
>
> > Every single LDO on Qualcomm's PMICs seems to be able to be set in
> > "high power mode" and "low power mode", but I think the majority of
> > clients only really care about two things: on and in high power mode
> > vs. off. I think the amount of stuff peripherals can do in low power
> > mode is super limited, so you have to be _really_ sure that the
> > peripheral won't draw too much current without you having a chance to
> > reconfigure the regulator.
>
> *Generally* a low power mode would be mainly useful for low power
> retention type states, not active use.

Right. Certainly the case I've seen where it is most useful is in S3
where we need to keep a device powered just enough to detect a wakeup,
but it can definitely also be useful for mostly idle devices that we
need to keep powered to retain memory so they can start up again
quickly.

I guess I'd put it this way, though: how many drivers in Linux today
have _two_ calls to regulator_set_load(): one for the "active" state
and one for the retention state. Looks like UFS maybe. Any others? For
most devices the pattern is:

* get all of our regulators.
* for each regulator, set the load to something that will trigger HPM
when we're using the regulator.
* turn regulators on when we need power and off when we don't.

All the extra scaffolding and tables to pass something to
regulator_set_load() is just a lot of noise to add for drivers that
don't have any concept of "retention" mode and don't need it.

-Doug
