Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33B35528823
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 May 2022 17:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239696AbiEPPMB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 May 2022 11:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245140AbiEPPLi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 May 2022 11:11:38 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F6733A35
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:11:37 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kq17so29320874ejb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QhOe+cbJpQ93yezmNjBYNkoQz1rzToEQuOQW8v6GMak=;
        b=TMjo+X04V5/NRDQ2Z2Yd8NypG6VmbuZCI/jaFOpz3fPoo06X/Hub6O/PggtslDk28m
         N9d8jcS/6+aKEqZBK6bahPJkmst9B3dKAsE/eWEGdkHAGgt5/Yu4/IqtcGpFEo0v6v3C
         DA4hoXRONUlwqFy6gocEufGRgWB9dI8rPhT04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QhOe+cbJpQ93yezmNjBYNkoQz1rzToEQuOQW8v6GMak=;
        b=Ykgh68ePsvirgeuIL5KmesNk4tOS0OXRCD8qDr4Y6xtuLE7L/8bkgknH9YRAiS8owR
         6ehbal8JwlEZILBIG6QVPPMXPHhQVXAUTgbkNEMDu463+6oz3Go2n9be0CtNZodo5BkL
         J9142QjSOSND5BZSk4wOo0M7Onz3PH+9t3Ny3DJlvcW5DWBGJZ4PA5WN5sndPy51gBHp
         H8NuzFz2Ezhnr1lWWwa8pMDSCR56DRJziiWdb3/1vNBqkIPpFmfwxrtgW2RLGJArvxyQ
         WLqYSj7dZDbgMvErrAicyfOUsKuCwDScaPGHX6V5LltW+qlZDbQMPGm4gYO1QdhEXQXx
         jfSw==
X-Gm-Message-State: AOAM533wf2XcEX5R3yIA6kRQlwkT0O7+7lw3N6/EuV4wlWbWYNJLHTaA
        MsHJQtJcc6SUDj4mgoxzqETynydnFkbr0+OQhYg=
X-Google-Smtp-Source: ABdhPJwpMYRbtF61I0ZoyrBOfZWansrcWgr4Igp5yBtdQiqBhD9QMYbCOnl+NW8r9oVZvI93UUR/QQ==
X-Received: by 2002:a17:907:d89:b0:6f5:be3:b06d with SMTP id go9-20020a1709070d8900b006f50be3b06dmr15591707ejc.74.1652713895439;
        Mon, 16 May 2022 08:11:35 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id e21-20020a170906649500b006f3ef214de1sm10347ejm.71.2022.05.16.08.11.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 08:11:34 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id m1so20964714wrb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 May 2022 08:11:34 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr4962075wrt.301.1652713894018; Mon, 16
 May 2022 08:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220512090429.1.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid>
 <828bc65f-e585-0fe7-c038-c750861c9446@linaro.org> <48d96a4e-ce1b-03a1-1831-36555efd7080@linaro.org>
 <CAD=FV=WNSv+kgTZwjHVq+YNQAG0uB42QUPaU-BPTV_W+j=5aYg@mail.gmail.com> <96686d6d-83a9-05a2-9fdc-f9fc4b4e7eed@linaro.org>
In-Reply-To: <96686d6d-83a9-05a2-9fdc-f9fc4b4e7eed@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 16 May 2022 08:11:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W8F5xbv2tKhCvjLLHitts+eQFbFE3fb3wogwY91Q7gAA@mail.gmail.com>
Message-ID: <CAD=FV=W8F5xbv2tKhCvjLLHitts+eQFbFE3fb3wogwY91Q7gAA@mail.gmail.com>
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

On Sun, May 15, 2022 at 11:40 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/05/2022 19:00, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 13, 2022 at 2:01 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 13/05/2022 09:57, Krzysztof Kozlowski wrote:
> >>> On 12/05/2022 18:04, Douglas Anderson wrote:
> >>>> This copy-pastes compatibles from sc7180-based boards from the device
> >>>> trees to the yaml file so that `make dtbs_check` will be happy.
> >>>>
> >>>> NOTES:
> >>>> - I make no attempt to try to share an "item" for all sc7180 based
> >>>>   Chromebooks. Because of the revision matching scheme used by the
> >>>>   Chromebook bootloader, at times we need a different number of
> >>>>   revisions listed.
> >>>> - Some of the odd entries in here (like google,homestar-rev23 or the
> >>>>   fact that "Google Lazor Limozeen without Touchscreen" changed from
> >>>>   sku5 to sku6) are not typos but simply reflect reality.
> >>>> - Many revisions of boards here never actually went to consumers, but
> >>>>   they are still in use within various companies that were involved in
> >>>>   Chromebook development. Since Chromebooks are developed with an
> >>>>   "upstream first" methodology, having these revisions supported with
> >>>>   upstream Linux is important. Making it easy for Chromebooks to be
> >>>>   developed with an "upstream first" methodology is valuable to the
> >>>>   upstream community because it improves the quality of upstream and
> >>>>   gets Chromebooks supported with vanilla upstream faster.
> >>>>
> >>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>> ---
> >>>>
> >>>>  .../devicetree/bindings/arm/qcom.yaml         | 180 ++++++++++++++++++
> >>>>  1 file changed, 180 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> index 5c06d1bfc046..399be67eb5d2 100644
> >>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >>>> @@ -214,11 +214,191 @@ properties:
> >>>>                - qcom,ipq8074-hk10-c2
> >>>>            - const: qcom,ipq8074
> >>>>
> >>>> +      # Qualcomm Technologies, Inc. SC7180 IDP
> >>>>        - items:
> >>>>            - enum:
> >>>>                - qcom,sc7180-idp
> >>>>            - const: qcom,sc7180
> >>>>
> >>>> +      # Google CoachZ (rev1 - 2)
> >>>> +      - items:
> >>>> +          - const: google,coachz-rev1
> >>>> +          - const: google,coachz-rev2
> >>>
> >>> The inverted pattern of old revision being compatible with the new one,
> >>> is done on purpose? You claim here every rev1 is always compatible with
> >>> rev2 ...
> >>>
> >>> I don't think we discussed such patterns in previous talk. I quickly
> >>> went through it and there were only skuX moving around, not rev1 being
> >>> newer then rev2.
> >
> > Isn't this what we just had a whole discussion about?
> >
> > Oh, I see. You're objecting to the fact that the order here lists
> > "rev1" first and "rev2" second.
> >
> > I think the issue here is that for the purposes of booting Chromebooks
> > the order here doesn't matter. Certainly we can pick a fixed order and
> > we can validate that the order in the yaml matches the order in the
> > device tree, but for all intents and purposes it doesn't matter to
> > anything. The same device tree is compatible with _both_ rev1 and rev2
> > coachz devices. Neither of those two devices is inherently better
> > supported by this device tree than the other.
>
> OK, thanks for explanation. Since these were not documented maybe fixing
> existing DTS to more expected order (rev2 being the newest, rev1
> following) would make sense. But certainly please use such new order
> compatibles for new DTSes.

I'm still not sure I understand: if the list of revisions is
effectively unordered, why does it matter which order they are listed
in? Certainly we can change the order, but I'm not sure how I justify
the extra churn in my patch description.

-Doug
