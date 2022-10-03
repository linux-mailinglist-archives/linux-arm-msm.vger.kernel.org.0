Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A585F32C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 17:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbiJCPlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 11:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiJCPlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 11:41:15 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B953717E0B
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 08:41:13 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y8so15135786edc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IuvCfQHYZuAZNcIkhOTfBkyTOSNYocbfYay1Zp9a9K4=;
        b=iV7KVPyD504lwEn2yIKHgBC/KMGF9BeXrJj4c5rbhv579A6msPq5WNDspaAMVdMCko
         hyuD4qNmq3Kn7Im3t52pvqUvbPM94HIvImNzqFfh72cclhaLMb1RMM/qjc94DM18mVt2
         Jam94E4NUi72fhQjEkt2+C95MeSVYmLpOjAvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IuvCfQHYZuAZNcIkhOTfBkyTOSNYocbfYay1Zp9a9K4=;
        b=2uwnSP35ueMTUChGa42Xe0e+KRKaLQkDbLgDLDA1dr6rIgKJl9Gsh2ATuJlVfGaPi9
         /Z/RBIp1YDZ2Tfn+4Sl04V1W6eGc68Q5gO2iB8jhw989pRpOirDW9Ki+U8/b6HrI7uTH
         8m/vqnGDx+ZCDnA/xr4iIt5rhJvK2JhpAUPXpavj8Evcy061CcHh+kDCL7VI66pfMLYq
         8Tf2jzbdBlmE4w3p+1A4l0b2pE+XyA408grgDeObTcCLhTuSaQNhSDNkk8pY5jzIz4VP
         IDdzrQ1GSa1XpNGpP06o9lAuDbe+D0ECbrPl7Qo3ouBALuSV/gpKaezTCViq9af7KiGQ
         N8MA==
X-Gm-Message-State: ACrzQf2bFte/yDqMhnMggoXZ3700q7xg9kWI6JyEsscmHcPFrYiUkJ50
        vavBmP8DT7fONjqG8NvKm/W8HhkLrgZjzm3P
X-Google-Smtp-Source: AMsMyM778U7dYuFehXH7uMuTI8pOvtVQKJIB9seiWNsvR1B/PyEbwsFET09F6WtefXWF8+jLOZ5GlA==
X-Received: by 2002:a05:6402:26d4:b0:451:280d:3533 with SMTP id x20-20020a05640226d400b00451280d3533mr18710299edd.316.1664811671964;
        Mon, 03 Oct 2022 08:41:11 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id kv1-20020a17090778c100b00789eee82e02sm3447624ejc.152.2022.10.03.08.41.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 08:41:10 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id r6so17344551wru.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 08:41:09 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr13476137wrr.583.1664811669508; Mon, 03
 Oct 2022 08:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220930182212.209804-1-krzysztof.kozlowski@linaro.org>
 <20220930182212.209804-2-krzysztof.kozlowski@linaro.org> <CAD=FV=WSbpV4aqyHgSX6rwanQmZYG1hdNourjP5DEmsfdq6aDA@mail.gmail.com>
 <11a99a84-47ec-ca3e-5781-0f17ed33dbf9@linaro.org>
In-Reply-To: <11a99a84-47ec-ca3e-5781-0f17ed33dbf9@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 3 Oct 2022 08:40:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URMX9umJfqYOhnnnjsr09As-6mKAHs0YNZFK8n2K337g@mail.gmail.com>
Message-ID: <CAD=FV=URMX9umJfqYOhnnnjsr09As-6mKAHs0YNZFK8n2K337g@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-db845c: correct SPI2 pins
 drive strength
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        "# 4.0+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Oct 1, 2022 at 3:01 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/09/2022 22:12, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Sep 30, 2022 at 11:22 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> The pin configuration (done with generic pin controller helpers and
> >> as expressed by bindings) requires children nodes with either:
> >> 1. "pins" property and the actual configuration,
> >> 2. another set of nodes with above point.
> >>
> >> The qup_spi2_default pin configuration used second method - with a
> >> "pinmux" child.
> >>
> >> Fixes: 8d23a0040475 ("arm64: dts: qcom: db845c: add Low speed expansion i2c and spi nodes")
> >> Cc: <stable@vger.kernel.org>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Not tested on hardware.
> >> ---
> >>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> >> index 132417e2d11e..a157eab66dee 100644
> >> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> >> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> >> @@ -1123,7 +1123,9 @@ &wifi {
> >>
> >>  /* PINCTRL - additions to nodes defined in sdm845.dtsi */
> >>  &qup_spi2_default {
> >> -       drive-strength = <16>;
> >> +       pinmux {
> >> +               drive-strength = <16>;
> >> +       };
> >
> > The convention on Qualcomm boards of this era is that muxing (setting
> > the function) is done under a "pinmux" node and, unless some of the
> > pins need to be treated differently like for the UARTs, configuration
> > (bias, drive strength, etc) is done under a "pinconf" subnode.
>
> Yes, although this was not expressed in bindings.
>
> > I
> > believe that the "pinconf" subnode also needs to replicate the list of
> > pins, or at least that's what we did everywhere else on sdm845 /
> > sc7180.
>
> Yes.
>
> >
> > Thus to match conventions, I assume you'd do:
> >
> > &qup_spi2_default {
> >   pinconf {
>
> No, because I want a convention of all pinctrl bindings and drivers, not
> convention of old pinctrl ones. The new ones are already moved or being
> moved to "-state" and "-pins". In the same time I am also unifying the
> requirement of "function" property - enforcing it in each node, thus
> "pinconf" will not be valid anymore.

Regardless of where we want to end up, it feels like as of ${SUBJECT}
patch this should match existing conventions in this file. If a later
patch wants to change the conventions in this file then it can, but
having just this one patch leaving things in an inconsistent state
isn't great IMO...

If this really has to be one-off then the subnode shouldn't be called
"pinmux". A subnode called "pinmux" implies that it just has muxing
information in it. After your patch this is called "pinmux" but has
_configuration_ in it.


> >     pins = "gpio27", "gpio28", "gpio29", "gpio30";
> >     drive-strength = <16>;
> >   };
> > };
> >
> > We've since moved away from this to a less cumbersome approach, but
> > for "older" boards like db845c we should probably match the existing
> > convention, or have a flag day and change all sdm845 boards over to
> > the new convention.
>
> That's what my next patchset from yesterday was doing. Unifying the
> bindings with modern bindings and converting DTS to match them.
>
> https://lore.kernel.org/linux-devicetree/20220930200529.331223-1-krzysztof.kozlowski@linaro.org/T/#t

I wasn't CCed on that patch series. A few things jump out as not quite
right to me. I'll try to do a review.

-Doug
