Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4513757CE1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 16:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbiGUOuP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 10:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGUOuO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 10:50:14 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7730913CE7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 07:50:13 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t3so2518992edd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pcZOB/ApWbNF0eW5n1wK25WOXQGFTiPvR0q+4tEoNh8=;
        b=G3YMfG/1UshoRnypsy2wF1GATgIebl3pHBLTFzdgoM2X/Uoe71KwDZ1NlkC9aKIHRD
         gssmJqeb6tLPv4PMRn5MOMSkjkFFVPDspiiT/qVNq/GgwUIgVP5mj+QOrgopShFwil+N
         KmGbGJFviFlxnH+lFltHw5UGi4GByFZDZxLjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pcZOB/ApWbNF0eW5n1wK25WOXQGFTiPvR0q+4tEoNh8=;
        b=Gt6Yi/Wr/CTobgsz2Sh+PGWE58Hv+g090vwkzl2rgQgClqhdYSlQol8zxvikbZx16+
         Yq43m49pTJA1lLbIHo4s21R5sNCWBUOkXRQbCW8aDsUdDTFkSCTsy6Sva/jhBRaPrcQb
         miux3CNksL/h4MjlLys+8seNfdSa0IIA0OyX4OISZF4VWDr5wu2prUED7cU6AZOqqpI+
         MwACBgMgHKWHdjYub6q3mZM6QLmpoFgQYpIMxmuC5LgP9bmVVwF5uI7cRdO3q9mjEXH7
         6zOyrdR47cHjspb2/ztQOJQGfjvaiRa8PHs8irt+246p9yL7A3kRxN7fHtjKhCROVHCA
         DySA==
X-Gm-Message-State: AJIora+E332Hdrk70hEsLJzqOb2J4O/BBVSkHcClfrmAZcD+kTpmAyTg
        2Vylcfk8XYRpVwmwfY/CzV0cI4p6cLTXFXNP5Co=
X-Google-Smtp-Source: AGRyM1uK8g/R/g1+AqvaGoW3u7WMY1cgyxfS3tJ/z8R6I0TqI1hroWLNSVmyhMyuredtB3KGfzR2sQ==
X-Received: by 2002:a05:6402:2b88:b0:43a:6c58:6c64 with SMTP id fj8-20020a0564022b8800b0043a6c586c64mr58893100edb.348.1658415011984;
        Thu, 21 Jul 2022 07:50:11 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id lm6-20020a170906980600b00722e8f4b459sm931699ejb.93.2022.07.21.07.50.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 07:50:11 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id d8so2626324wrp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 07:50:10 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr34236872wrf.659.1658415009781; Thu, 21
 Jul 2022 07:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
In-Reply-To: <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 21 Jul 2022 07:49:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
Message-ID: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
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

On Thu, Jul 21, 2022 at 6:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > where the DP PHY regulators are shared with other PHYs whose drivers do
> > not request a load.
>
> I'm trying to understand, why does this series cause the regression.
> Previously it would be the DP controller voting on the regulators
> load, now it has been moved to the DP/eDP PHYs.

I think in the past not many device trees actually hooked up the
regulators to the DP/eDP but did hook up the regulators to the PHYs?
That means they didn't used to get a regulator_set_load() on them and
now they do?

It should also be noted that we're now setting the load for a bunch of
USB PHYs that we didn't used to set a load on...


> > It seems quite likely that changes like this one affects other systems
> > too, and the effects may be hard to debug. So a more general solution
> > than playing whack-a-mole using DT would be good to have.
>
> I think enabling a regulator which supports set_load() and without
> load being set should cause a warning, at least with
> CONFIG_REGULATOR_DEBUG. WDYT?

I'm not a total fan. I'd love to see evidence to the contrary, but I'm
a believer that the amount of extra cruft involved with all these
regulator_set_load() calls is overkill for most cases. All the extra
code / per-SoC tables added to drivers isn't ideal.

Every single LDO on Qualcomm's PMICs seems to be able to be set in
"high power mode" and "low power mode", but I think the majority of
clients only really care about two things: on and in high power mode
vs. off. I think the amount of stuff peripherals can do in low power
mode is super limited, so you have to be _really_ sure that the
peripheral won't draw too much current without you having a chance to
reconfigure the regulator.

Of course, if the load could be easily specified in the device tree
and we could get rid of all the cruft in the drivers then maybe that
would be OK.

-Doug
