Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 111D252886C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245174AbiEPPUv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 11:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238081AbiEPPUu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 11:20:50 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3225339B82
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:20:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id l18so29328107ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G7CXt1upwwabaETJJYUPnPn5xcMj8KlUx8qpO/i3pqA=;
        b=OGMXeu7mP0Vh0Zt2/U3TkzT+Mg12ZeVoiXZcwNSgpIWit8ICREdlyjnmyiO6tsrx+t
         TjVbYN+UAKIE511DNEt3YGps4UlwiwmjhBa/h0tLXq/SXKc5yWe9rJ2R1cUGRm+z8XaZ
         N6ZLt3lzn9y8bjLe2b1wic64GOlKBsjeUA85A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G7CXt1upwwabaETJJYUPnPn5xcMj8KlUx8qpO/i3pqA=;
        b=fkgkgVua8lZ2rxlNBNDw9vvkPC4fXNFVcRWxPy6dD3hyh87r16wOIkBqXyHTp6yqOn
         CnHpZUugcdikb2aGnChUe4kDz4eqkqW6i9NkrS/V1fKc/jpcZO7wcUxKkjbX1SF93WVx
         WJF63A6VBHPeF9N1exHagVQiZucJVBxFQ6plJeOsHST+kw/+na2CqSwGTyYY17EP87M8
         8D3mQ2ZjG98ZAS0uTaS75b7mWOYcEOhvHUA9kABo84rDq8vr4PrclSAcQwKTdChdGufg
         RwDn8g1/ZAFycl/YBVlGtTK7n+qgrTdRwz3m0LyBxYoLACRH8nRnWRn8bnAtfK1nB4hw
         ciQQ==
X-Gm-Message-State: AOAM530Rg0lvWMuRV26q9MpmXPva97kMHNLk9FUFNGe14S8Wex8vsb7t
        37c89Fhwyg+m/B9z/fdu3xf/WyS/ioJYEWUvjQQ=
X-Google-Smtp-Source: ABdhPJw/0L7MfpwZhSQpAITQCAsrNQbkXsL6a5Bw6bSFxdWZqmz2XA+6eT/9QjK4boaE32M7dpeoGg==
X-Received: by 2002:a17:906:c142:b0:6da:9781:ae5d with SMTP id dp2-20020a170906c14200b006da9781ae5dmr14831123ejc.73.1652714446413;
        Mon, 16 May 2022 08:20:46 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id n29-20020a17090673dd00b006f52dbc192bsm24246ejl.37.2022.05.16.08.20.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 08:20:45 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id d21so5087589wra.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:20:44 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr14401709wry.342.1652714444272; Mon, 16
 May 2022 08:20:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220512090429.1.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid>
 <828bc65f-e585-0fe7-c038-c750861c9446@linaro.org> <48d96a4e-ce1b-03a1-1831-36555efd7080@linaro.org>
 <CAD=FV=WNSv+kgTZwjHVq+YNQAG0uB42QUPaU-BPTV_W+j=5aYg@mail.gmail.com>
 <96686d6d-83a9-05a2-9fdc-f9fc4b4e7eed@linaro.org> <CAD=FV=W8F5xbv2tKhCvjLLHitts+eQFbFE3fb3wogwY91Q7gAA@mail.gmail.com>
 <e7730596-8fb9-7fbd-3074-de561086a121@linaro.org>
In-Reply-To: <e7730596-8fb9-7fbd-3074-de561086a121@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 May 2022 08:20:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLz587xWX3GHxWrPm=8uzRhPqjwmYq_3rrFaHgTzrZtQ@mail.gmail.com>
Message-ID: <CAD=FV=VLz587xWX3GHxWrPm=8uzRhPqjwmYq_3rrFaHgTzrZtQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add sc7180 Chromebook board bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 16, 2022 at 8:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/05/2022 17:11, Doug Anderson wrote:
> > Hi,
> >
> > On Sun, May 15, 2022 at 11:40 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 13/05/2022 19:00, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Fri, May 13, 2022 at 2:01 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 13/05/2022 09:57, Krzysztof Kozlowski wrote:
> >>>>> On 12/05/2022 18:04, Douglas Anderson wrote:
> >>>>>> This copy-pastes compatibles from sc7180-based boards from the device
> >>>>>> trees to the yaml file so that `make dtbs_check` will be happy.
> >>>>>>
> >>>>>> NOTES:
> >>>>>> - I make no attempt to try to share an "item" for all sc7180 based
> >>>>>>   Chromebooks. Because of the revision matching scheme used by the
> >>>>>>   Chromebook bootloader, at times we need a different number of
> >>>>>>   revisions listed.
> >>>>>> - Some of the odd entries in here (like google,homestar-rev23 or the
> >>>>>>   fact that "Google Lazor Limozeen without Touchscreen" changed from
> >>>>>>   sku5 to sku6) are not typos but simply reflect reality.
> >>>>>> - Many revisions of boards here never actually went to consumers, but
> >>>>>>   they are still in use within various companies that were involved in
> >>>>>>   Chromebook development. Since Chromebooks are developed with an
> >>>>>>   "upstream first" methodology, having these revisions supported with
> >>>>>>   upstream Linux is important. Making it easy for Chromebooks to be
> >>>>>>   developed with an "upstream first" methodology is valuable to the
> >>>>>>   upstream community because it improves the quality of upstream and
> >>>>>>   gets Chromebooks supported with vanilla upstream faster.
> >>>>>>
> >>>>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>>>> ---
> >>>>>>
> >>>>>>  .../devicetree/bindings/arm/qcom.yaml         | 180 ++++++++++++++++++
> >>>>>>  1 file changed, 180 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>>> index 5c06d1bfc046..399be67eb5d2 100644
> >>>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>>>> @@ -214,11 +214,191 @@ properties:
> >>>>>>                - qcom,ipq8074-hk10-c2
> >>>>>>            - const: qcom,ipq8074
> >>>>>>
> >>>>>> +      # Qualcomm Technologies, Inc. SC7180 IDP
> >>>>>>        - items:
> >>>>>>            - enum:
> >>>>>>                - qcom,sc7180-idp
> >>>>>>            - const: qcom,sc7180
> >>>>>>
> >>>>>> +      # Google CoachZ (rev1 - 2)
> >>>>>> +      - items:
> >>>>>> +          - const: google,coachz-rev1
> >>>>>> +          - const: google,coachz-rev2
> >>>>>
> >>>>> The inverted pattern of old revision being compatible with the new one,
> >>>>> is done on purpose? You claim here every rev1 is always compatible with
> >>>>> rev2 ...
> >>>>>
> >>>>> I don't think we discussed such patterns in previous talk. I quickly
> >>>>> went through it and there were only skuX moving around, not rev1 being
> >>>>> newer then rev2.
> >>>
> >>> Isn't this what we just had a whole discussion about?
> >>>
> >>> Oh, I see. You're objecting to the fact that the order here lists
> >>> "rev1" first and "rev2" second.
> >>>
> >>> I think the issue here is that for the purposes of booting Chromebooks
> >>> the order here doesn't matter. Certainly we can pick a fixed order and
> >>> we can validate that the order in the yaml matches the order in the
> >>> device tree, but for all intents and purposes it doesn't matter to
> >>> anything. The same device tree is compatible with _both_ rev1 and rev2
> >>> coachz devices. Neither of those two devices is inherently better
> >>> supported by this device tree than the other.
> >>
> >> OK, thanks for explanation. Since these were not documented maybe fixing
> >> existing DTS to more expected order (rev2 being the newest, rev1
> >> following) would make sense. But certainly please use such new order
> >> compatibles for new DTSes.
> >
> > I'm still not sure I understand: if the list of revisions is
> > effectively unordered, why does it matter which order they are listed
> > in? Certainly we can change the order, but I'm not sure how I justify
> > the extra churn in my patch description.
>
> The list for the bindings (YAML), the toolset and for the Devicetree
> spec is ordered. Even if it is not ordered for your bootloader
> implementation.

Understood. This is just like clocks where technically they are
unordered (because you have "clock-names" to look them up) but it is
expected that the order be documented and consistent, if nothing else
to make it easier to validate.


> Your current order is a bit confusing:
>
> compatible = "google,coachz-rev1", "google,coachz-rev2", "qcom,sc7180";
>
> Changing the order in existing DTS, might not be worth.

OK, I'll leave the existing DTS alone.


> I propose then
> to introduce the logical order in the future, so for new DTS:
>
> compatible = "google,XXX-rev2", "google,XXX-rev1", "qcom,sc7180";
>
> I understood that for your bootloader it does not matter.

Sure. I'm not sure why it's any less confusing to list higher
revisions first, but if you find it less confusing we can do it in the
future.

-Doug
