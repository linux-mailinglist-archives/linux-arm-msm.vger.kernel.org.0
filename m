Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAB23580364
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236695AbiGYRNu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236694AbiGYRNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:13:46 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC2613F5F
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:13:44 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id h18so8861673qvr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWxbhPJv323dBOga7BLAIkxAvIwV15TMuJATxPHW6U4=;
        b=to8PhtTUfLB4328jUwkeYdjB42CHE8bURrZJhYDcxRBA860CPbGaSlZKWENtz/ZJKQ
         kSYMjZqSetNwnyB1ffDPDjj76FOjLJvGZ+zv/hPkoUSAEel8UZEeps3wSYZ7p3Ncl68E
         x/N7NkiieXWOmxkp9oEsBY31wMkv7/hTNBhdz3bVjyVVwq9KPrleOO2zn83fWG6OH+yp
         jeFRNGTvXxNbQ1l0GpLhwHUyYeD6YEiewBIuJMqYxEn0PNcIApwwHSZBkBwcL+d787If
         7NlhkHaTwQjlbZ04K8lh1/93k23aPamO6qw4QCSRYh9JWFWDE2Gcvc10udKvX+IZKsDx
         gKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWxbhPJv323dBOga7BLAIkxAvIwV15TMuJATxPHW6U4=;
        b=gS89WRmdCWpws/nWfbwi5Bb8UqtaJM1SqVJTYMFucOUQKh4IfO7s3hS5YAAPWFYT0O
         ZYZjRGzglfOzhIgczlH4Zdnky79heRJ7Bu2jgvXBcHrSESp1GaFJL05Mxvaei8E/UcX7
         JQKWb09a/rrmGuaTGxQDKPRpcDPsINJC0nmawmEiig9L6k8CCFRtQ5jJg/7OLMhMcLu5
         NWFuCsqzzhQRYKQ9KWDVwliovh6d6edjzP8rO4WsSH4SBln3awPBhGAk1gjYMvfZkkzW
         Gd9FBEy4QHDO8a6cXgK2PpfM85fIGVIIBdWSvc+/6HJMiqITl+pofV4zoa2xCXnLjm8g
         o/Sw==
X-Gm-Message-State: AJIora9A40t+MDBy0my61FjMbN6ClKuLBGIxNWz2kc6iiLfxWhoiBAJj
        OdA2uadnuWbwakz/K5ruvfyWL0Ex3CaJDzhSRhzHpW5YAp8=
X-Google-Smtp-Source: AGRyM1vO7Fl6/wDwTJry1SfkMTvTNOn/8c6Wr2hZjoljiQ2oA9iu027EWeGY5nMo36S65J1Ft7Z43HRePAZna0tGQLk=
X-Received: by 2002:a05:6214:2a84:b0:473:2958:2b02 with SMTP id
 jr4-20020a0562142a8400b0047329582b02mr11571436qvb.122.1658769223886; Mon, 25
 Jul 2022 10:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org> <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <62982c58-2a06-0005-cb2f-ec78913da8e1@linaro.org>
In-Reply-To: <62982c58-2a06-0005-cb2f-ec78913da8e1@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 25 Jul 2022 20:13:32 +0300
Message-ID: <CAA8EJpratkeg3wpHZxsXavDzO-Gq9wnumVw6dwy7Qa6+YRdhUg@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Jul 2022 at 19:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/07/2022 00:50, Dmitry Baryshkov wrote:
> > On Sat, 23 Jul 2022 at 20:48, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> >>> Describing each compatible board in DT schema seems wrong to me. It
> >>> means that each new board is incompatible by default, until added to the DT
> >>> schema.
> >
> > s/incompatible/non-valid/
> >
> >>
> >> The bindings do not document something because it is or it is no
> >> compatible. They document the compatible. Your patch essentially removes
> >> the documentation, so there is no point in having compatibles in board
> >> at all...
> >
> > I do not quite agree here. Please correct me if I'm wrong.
> > Schema defines which DT files are correct and which are not. Which
> > properties are required, which values are valid, etc. So far so good.
>
> Schema is a tool, we create here bindings. The bindings document what
> you wrote above, plus compatibles and any other pieces mentioned in DT spec.
>
> > For the device nodes it declares (or is willing to declare) all
> > possible compatibility strings. There is a sensible number of on-chip
> > IP blocks, external chips, etc. Each and every new chip (or new IP
> > block) we are going to have a yaml file describing its usage. Perfect.
> > For the machine compatibility lists the arm,qcom schema declares which
> > machine compat strings are valid. And this looks like a problem. Now
> > for the DT to be fully valid against DT schema, we have to define its
> > machine compat string.
>
> Although one of goals is to have schema compliance, that is not the
> reason why we document compatibles. Compatibles were documented long
> time ago before DT schema came, because the bindings require it.
>
> Bindings define the interface between the DTS and software which uses
> it. SW is kernel, bootloaders, user-space and some more.

I completely agree here.

From the point of HW/SW interfaces maybe the following compat lists
would make more sense:
- "xiaomi,msm8996-phone", "qcom,msm8996"
- "qcom,qrb5165-iot-platform", "qcom,sm8250"
- "qcom,sda845-iot-platform", "qcom,sdm845"
- "inforce,sda660-sbc", "qcom,sda660"

etc. IOW, describing the kind of the device, not the exact name/model of it.

>
> > For each and every phone/sbc/evb we have to name it in schema. I think
> > this is an overkill.
>
> Qualcomm is rather moderate, nothing big here so definitely it is not an
> overkill. We almost do not have there SoMs. Just take a pick at
> Freescale - this is much more complex than Qualcomm, so any changes
> should start with that. Qualcomm's "complexity" is not a reason to do
> anything...

Yeah, been there. As I wrote earlier, this looks like a postfixItems use case.

>
> > It feels like we are putting DT information
> > (mapping form machine compat to SoC) into the DT schema.
>
> No, we are documenting the compatible in bindings. Just like we always
> did and we always had to.
>
> > For qcs404 we already have a schema which uses three items: {},
> > qcom,qcs404-evb, qcom,qcs404. This sounds like a perfect idea to me.
> > We allow any board, created by Qualcomm, Google or any other random
> > vendor, named Foo, Bar or Baz, as long as it declares that it is
> > compatible with qcom,qcs404-evb.
> >
> > To go even further. We now have the qrb5165-rb5.dts, declaring
> > compatible = "qcom,qrb5165-rb5", "qcom,sm8250".
> > If at some point I add a navigation/communication/whatever mezz on top
> > of it. It would make sense to use compatible =
> > "qcom,qrb5165-rb5-navi-comm", "qcom,qrb5165-rb5", "qcom,sm8250".
> > Adding this to the growing list inside arm,qcom.yaml sounds like a
> > nightmare. I can only hope that at some point JSON schema gains
> > postfixItems support (as proposed) to be able to change e.g.
> > arm,qcom.yaml to list just our qcom,something platforms as possible
> > postfixItems for the schema.
>
> Again, Qualcomm complexity is nothing compared to Freescale. :)

Fortunately :-)
I was trying to propose a way to have a useful schema, while keeping
it small enough.

> > Regarding having compatibles in board files at all. I think that they
> > are somehow misused nowadays. Instead of declaring that the
> > Dragonboard 845c is compatible with "thundercomm,db845c",
> > "qcom,sdm845-sbc", "96boards,ce-board", "96boards,iot-board",
> > "qcom,sdm845", the DT file declares nearly useless
> > "thundercomm,db845c", "qcom,sdm845".
> >
> > Thus, if we (mostly) use machine compatible array to just define
> > Vendor+device name and the underlying Qualcomm SoC, I propose to leave
> > just a sensible part (SoC) in DT schema, while allowing any string in
> > the first part.
>
>
> No, because you miss then the purpose of bindings - to document the
> compatible which is the important piece of interface between
> DTS/bootloader/kernel/other OS/user-space.
>
> To summarize, you propose to not document board compatibles. This is not
> what we want, because then the next step is - let's don't document SoCs.
> If you do not document it, means anyone can uniliteraly change it, e.g.
> in kernel DTS, which will break all other users (e.g. user-space or
> bootloaders) parsing the compatibles. And before you say - no one parses
> the board compatibles - let me just say that several user-space
> (embedded/closed) parse them, bootloaders parse them (U-Boot, Google's
> Chromebooks and others)

Yes, I know. And in the case of e.g. Google ChromeOS bootloader it
might make sense to declare compatibles using patterns rather than
enumeration.

Anyway, thank you for your comments, let's continue with documenting
all the devices until something changes.

-- 
With best wishes
Dmitry
