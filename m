Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4371F580383
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbiGYRaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiGYRap (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:30:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80030659B;
        Mon, 25 Jul 2022 10:30:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 146D961371;
        Mon, 25 Jul 2022 17:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7379CC385A5;
        Mon, 25 Jul 2022 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658770243;
        bh=EfA89CZcK6voB+Z5A/9ItMcf0E5XRFPvMUOvZhAUzOA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FoV6wQLq4iC2xN6YXELTQSuzOR7jiO+EYwUQtfLyT/Eaaogz8JPRRgWj/4u1VY4Lt
         vz1wwtot5/x4Su64mMOX4pQJqVBCiVrIi8VcLPfcCEFzIzpHgfAThgq6EHfnkBp1bM
         RxNAq722kKo22OsES8sIDMWwxJcfCDDS//bZIKe7dCQEmYiX9p0orZQPDf4Com8YPb
         5a6LSWII2arzSzZAuZ2usClrH8mn7zK9Zl7D1E11uye+f7IPOQzmzcfn+ES/bUS1UJ
         TxyqtzLH8kmjug9ek81BVnvn9BElhkJah2otL35D9/LKf3FuLJbeomCWaGRywUrR1c
         b4ktF99nwjofA==
Received: by mail-ua1-f44.google.com with SMTP id r22so4726605uap.13;
        Mon, 25 Jul 2022 10:30:43 -0700 (PDT)
X-Gm-Message-State: AJIora+w6xEa40r4zJ7gUMHNtlXS5N9BTL8FoIrStsZOPHBlBKMKXQJJ
        TyX6fV3MhG0uiRCuP044gTBGu5K7Ny37Fpwt6g==
X-Google-Smtp-Source: AGRyM1sF+l6oEXQ3XL+CLlv6MoOWgoJqWt8ddvBk24ucpq8yE/vR47dP7XlfKdnCqralo4YaaVu5Mhz5PvdlJXqZxeE=
X-Received: by 2002:ab0:6798:0:b0:382:d9f4:8d0 with SMTP id
 v24-20020ab06798000000b00382d9f408d0mr3705644uar.63.1658770242438; Mon, 25
 Jul 2022 10:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org> <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
In-Reply-To: <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 25 Jul 2022 11:30:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKRT-JkSN2=MnmrLbTGe6AHSuOE0Nt0J9Vg5A9bLuZBQw@mail.gmail.com>
Message-ID: <CAL_JsqKRT-JkSN2=MnmrLbTGe6AHSuOE0Nt0J9Vg5A9bLuZBQw@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 23, 2022 at 4:51 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 23 Jul 2022 at 20:48, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 23/07/2022 11:09, Dmitry Baryshkov wrote:
> > > Describing each compatible board in DT schema seems wrong to me. It
> > > means that each new board is incompatible by default, until added to the DT
> > > schema.
>
> s/incompatible/non-valid/
>
> >
> > The bindings do not document something because it is or it is no
> > compatible. They document the compatible. Your patch essentially removes
> > the documentation, so there is no point in having compatibles in board
> > at all...
>
> I do not quite agree here. Please correct me if I'm wrong.
> Schema defines which DT files are correct and which are not. Which
> properties are required, which values are valid, etc. So far so good.
> For the device nodes it declares (or is willing to declare) all
> possible compatibility strings. There is a sensible number of on-chip
> IP blocks, external chips, etc. Each and every new chip (or new IP
> block) we are going to have a yaml file describing its usage. Perfect.
> For the machine compatibility lists the arm,qcom schema declares which
> machine compat strings are valid. And this looks like a problem. Now
> for the DT to be fully valid against DT schema, we have to define its
> machine compat string.

If we don't document all the compatible strings, how do we know if
there are name collisions (same compatible string used for 2 different
boards)?

I'm not in favor of not documenting some compatibles. I'd be more
inclined to allow invalid combinations if it reduced duplicating
compatible strings than that.

> For each and every phone/sbc/evb we have to name it in schema. I think
> this is an overkill. It feels like we are putting DT information
> (mapping form machine compat to SoC) into the DT schema.
> For qcs404 we already have a schema which uses three items: {},
> qcom,qcs404-evb, qcom,qcs404. This sounds like a perfect idea to me.
> We allow any board, created by Qualcomm, Google or any other random
> vendor, named Foo, Bar or Baz, as long as it declares that it is
> compatible with qcom,qcs404-evb.
>
> To go even further. We now have the qrb5165-rb5.dts, declaring
> compatible = "qcom,qrb5165-rb5", "qcom,sm8250".
> If at some point I add a navigation/communication/whatever mezz on top
> of it. It would make sense to use compatible =
> "qcom,qrb5165-rb5-navi-comm", "qcom,qrb5165-rb5", "qcom,sm8250".
> Adding this to the growing list inside arm,qcom.yaml sounds like a
> nightmare.

The combination of SoMs and/or add-on boards is not a QCom specific
issue. So if there's going to be any change for how we do things, it
needs to be for everyone.


> I can only hope that at some point JSON schema gains
> postfixItems support (as proposed) to be able to change e.g.
> arm,qcom.yaml to list just our qcom,something platforms as possible
> postfixItems for the schema.

I'm not really sure we'd want to support that. I'm not thrilled that
'items' has changed to 'prefixItems' in newer versions. The name is
confusing for how we use 'items'. So my current thought is we'll stick
with 'items' even if we replace it with 'prefixItems' in the processed
schema.

Rob
