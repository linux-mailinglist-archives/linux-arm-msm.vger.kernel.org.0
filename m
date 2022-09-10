Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFDE5B466D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 14:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiIJMzJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 08:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIJMzI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 08:55:08 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5211525EBC
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 05:55:07 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3454b0b1b6dso48725627b3.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=H9+aEqiuPXTD/0BZaNY7OkRWAFHFJteXc5O3Y0RlriU=;
        b=mBHDGwsHzU8tUV9CsDzMvAXPhxljy4Z/pZKGE4kQymHkgT8ih+5G40SzDLbN0kydlr
         2tjDhbT4XnoRojq0JPdXDKumG2iQzpTlod5jENB0Cm9jPsLf+C8Pno1eaDHvK2vv0B94
         kEwzHuGm9EWHRfiL5Mi+LeccMdIBUaH3HdQCPcpJFiQLybFtiFFgow+Hb4LrlXukH5Jk
         6MQn8oaQF5MsKJZ/DHvGM+7k+ekMr/btC25EG+mB3XqY74ddKV4jEin1nU1so8g744At
         T1F+z15ipWU2Fji4Ho5ed+7xdgKVX6OvR6gIkUvrdVIsEDmRHc3wpW8aeTJmAwBVbZke
         a44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H9+aEqiuPXTD/0BZaNY7OkRWAFHFJteXc5O3Y0RlriU=;
        b=a3kSMYjPxLeJDjQunQkvsyLrSo6Xhl0oppiMrRB2wjDqauY9KUzAHchD3HORnbl8NP
         AMn46HJAWdFiPSs+2GgiNsE0AW64eq5g2j0pcciKZxZEKaihUKoRyuFpcwqlFb9aH9Ts
         5cte3t9ChVImQphVlgWdz5Ocf7bwB7JxkuClpo0GZSPKYWkTxLulE+JsF8nMFxesFotl
         FYCuSA/Mc2KmeGlgs6PwVLId/tpaZxT06L0s9d+ojNkvbCk39dLCp9qJSwy1VFoIev7v
         0Y1UiG5+HUr98ocDv6ISU25caETdalGro/MxnaawKVbBo30JCU7gNGtagSzjoxHrhajv
         xc+Q==
X-Gm-Message-State: ACgBeo3WuUBIywa4i/wCwO+PlDoDMThuD2XeLJu2tY+z6qTJozXz0Xg/
        gbHz2qTLnxUh+JNLE8SZidP0cGZH6g4wEoCTw2wFtQ==
X-Google-Smtp-Source: AA6agR5M01fLD1dnWRcihDf9ksYjlQdjkT0J9p3TdYpAK/1HdHOcbQhPoqH8kNrR1WJrJnAvY1r3ksR1w8AubJ+eWUI=
X-Received: by 2002:a0d:ffc5:0:b0:341:6cc1:c589 with SMTP id
 p188-20020a0dffc5000000b003416cc1c589mr15944568ywf.418.1662814506532; Sat, 10
 Sep 2022 05:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org> <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org> <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com> <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
In-Reply-To: <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 10 Sep 2022 15:54:55 +0300
Message-ID: <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
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

On Sat, 10 Sept 2022 at 11:45, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 10/09/2022 00:23, Rob Herring wrote:
> >>>>
> >>>> This should be ref to dsi-controller-main.yaml... or based on previous
> >>>> Rob's feedback you dropped it everywhere in children?
> >>>
> >>> I don't think I said. I thought about it some, as yes, we normally have
> >>> done as you suggested. The downside is with a ref we'll do the whole
> >>> validation of the child node twice (unless the referenced schema has a
> >>> 'select: false') whereas here only 'compatible' is validated twice. This
> >>> way also complicates checking for unevaluatedProperties/additionalProperties.
> >>>
> >>> So maybe better to keep with the 'normal' way and make this a ref.
> >>
> >> Well.. I tried using $ref in the previous iteration, but then I faced
> >> the fact that I can not use it. Using the $ref the node gets validated
> >> even if it is disabled, and we do not want to do this. The nodes are
> >> usually split in way that regulators are specified in the board DT file.
> >> Thus disabled dsi/dsi-phy nodes do not get all the required regulators.
> >> And dt-validate happily dumps tons of warnings for disabled nodes. Thus
> >> I ended up with the compatible rather than $ref.
> >
> > Only warnings about required properties? Those are supposed to get
> > filtered out if the node is disabled. Maybe being in a $ref doesn't
> > work.
>
> This seems to break regardless it is in $ref or when you directly
> reference the schema.
>
> I tested display/msm/dpu-sc7180.yaml on modified DTB when a required
> property is missing (I removed reg-names) and:
>
> 1. When node is enabled:
>
> c7180-idp.dtb: display-controller@ae01000: 'reg-names' is a required
> property
>
>         Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>
> rch/arm64/boot/dts/qcom/sc7180-idp.dtb: display-controller@ae01000:
> Unevaluated properties are not allowed ('interrupt-parent',
> 'interrupts', 'operating-points-v2', 'opp-table', 'ports',
> 'power-domains' were unexpected)
>
>
> 2. When node is disabled the first error disappears (so no clue which
> one is missing) but schema does not pass:
>
> qcom/sc7180-idp.dtb: display-controller@ae01000: Unevaluated properties
> are not allowed ('interrupt-parent', 'interrupts',
> 'operating-points-v2', 'opp-table', 'ports', 'power-domains' were
> unexpected)
>
>         From schema: Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
>
>
> However I think there is no such problem, as Dmitry said, that ref
> changes anything. There will be always failure - either from parent
> schema (using $ref) or from device child schema (the one which actually
> misses the property).

Initially I stumbled upon this issue with the dsi and dsi_phy nodes
for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
emit warnings regarding the missing -supply properties despite nodes
being disabled. If I use `compatible' here, the schema checks pass.
Thus I'd prefer to leave `compatible' here. Not to mention that it
also allows specifying a tighter binding than just using the $ref.

-- 
With best wishes
Dmitry
