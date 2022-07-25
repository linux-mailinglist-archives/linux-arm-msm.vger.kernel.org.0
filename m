Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B56F580375
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jul 2022 19:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbiGYRWY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 13:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234713AbiGYRWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 13:22:24 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C89D1570E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:22:22 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id oy13so21843652ejb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zUy3JQinT5zEMmvPRHWqcr5IDPsM1DIyMUC6zCQlI6I=;
        b=k2KG6ZlODkZYWbPbwOPA4zi/qtp84p7mZ4NtfLStgWadSQkXR8A2emtJblmYykjA1z
         p86O+4lc6rdUwtLUjMfEFj/J7iusXpG4neZhKPt4zMSVuDbkuSATKNk01MpaxsK24l96
         WoX2Xnqnbvq9Ce5snXzATeYUwtNvO5XjmfdDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zUy3JQinT5zEMmvPRHWqcr5IDPsM1DIyMUC6zCQlI6I=;
        b=PAn2bXeZYm5KB1WnTGrBbqRwX+tvGngKoJ7VnZ+/E9XF8I064t5/1FZl9uW2W9GsXg
         EmfMc3uCVt1acsO4D6QEN2arwcqjsXhJdfDtIJtwgBdIK5dsrt5u9puQ25ZFqX2gWVQ0
         DQyCubVxUkmpkBU/+T6KuXe3SdtUthDnhCu+Vx8vL5dmU7igBup6r6WSQdqbQfa4wICD
         eFP5lVR8nE8vss0iTox/nzKuZdJDdw2gWW5B55NavVcMUSXes5g4zOUH2awzpesn7HLG
         2igwaEokiFFbd5LB8WZKHHmIho2AYj5bp03jPF6Hfma1GgZytwuHmomvD3GXv0/V0q9A
         FGAA==
X-Gm-Message-State: AJIora/5ue6khIIjobU868xP509zJ1gLkHSzO798kgGdDzsb3Q7Bn4Gv
        azmtLiemOIHh8QWC8n8aCbZJbiiijbouRvpn
X-Google-Smtp-Source: AGRyM1tGChXV7tdsibDsdC/6ivTedOpptVOUQEKZBHYtO1ok0OwaijPpKm1jRexL+nQ9jSyk8ZOYqw==
X-Received: by 2002:a17:906:98c8:b0:72b:408f:f499 with SMTP id zd8-20020a17090698c800b0072b408ff499mr10806518ejb.736.1658769740944;
        Mon, 25 Jul 2022 10:22:20 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id bk8-20020a170906b0c800b0072b8222c7f7sm5654679ejb.33.2022.07.25.10.22.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 10:22:16 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id d13so9298980wrn.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 10:22:16 -0700 (PDT)
X-Received: by 2002:a05:6000:178f:b0:21e:98ee:f1e6 with SMTP id
 e15-20020a056000178f00b0021e98eef1e6mr803134wrg.405.1658769735618; Mon, 25
 Jul 2022 10:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
 <b1aafb00-f00a-2621-ad51-fb2f7491dace@linaro.org> <CAA8EJpp_tSCR3CLGSD_qq62MzjVQOYGspY345aNfNSu1tMM=Vw@mail.gmail.com>
 <CAD=FV=WGtDMmB08py8D6jc0cv3xGsn5Rfc0MObQbEV=CiisBYg@mail.gmail.com>
 <76defcb3-8566-286a-d953-54c4a2b04782@linaro.org> <CAD=FV=XhYD0U=FAaGV0aLJhZ4LrULXrLptDV7=D8A91Kx=Qkgg@mail.gmail.com>
 <e3eb02f4-daf7-ed69-001f-72a275819af5@linaro.org> <CAD=FV=WYshw8tcDb7dRS-CRdH1q2BOp0g74_qKtvKa1Lzo+mcg@mail.gmail.com>
 <9e012a76-aaab-9525-f3d4-8d84e26325a9@linaro.org>
In-Reply-To: <9e012a76-aaab-9525-f3d4-8d84e26325a9@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 25 Jul 2022 10:22:02 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiJd6G0-QExB=SPDNx3TNFyFjyPvUGdkkBGPEe4XYiEw@mail.gmail.com>
Message-ID: <CAD=FV=XiJd6G0-QExB=SPDNx3TNFyFjyPvUGdkkBGPEe4XYiEw@mail.gmail.com>
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom: define schema, not devices
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 25, 2022 at 10:14 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/07/2022 19:09, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Jul 25, 2022 at 10:08 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 25/07/2022 18:54, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Mon, Jul 25, 2022 at 9:41 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 25/07/2022 18:25, Doug Anderson wrote:
> >>>>> Let's look specifically at the device tree file for the LTE board. One
> >>>>> way to look at it is that the dts for the LTE board should have
> >>>>> compatibles:
> >>>>>   compatible = "lte", "wifi-only"
> >>>>>
> >>>>> The above matches the normal device tree mentality. It says: "hey, if
> >>>>> you've got a lte driver for this board then use it; otherwise use the
> >>>>> wifi-only driver".
> >>>>>
> >>>>> However, the above is actually broken for the bootloader use case. The
> >>>>> bootloader is trying to pick a device tree and, to the bootloader, the
> >>>>> above says "you can use this dts for either an lte board or a
> >>>>> wifi-only board". That's bad. If the bootloader picks this device tree
> >>>>> for a wifi-only board then the OS will try to initialize lte and
> >>>>> things will crash. To go further, if you think about it things
> >>>>> actually work fine if the wifi-only device tree says it's compatible
> >>>>> with the LTE board. This is why I say it's opposite... ;-)
> >>>>
> >>>> This is not specific to "bootloaders" but your specific implementation
> >>>> of entire chain. How you described it, you have dependent pieces -
> >>>> user-space must use the same DTB as bootloader chosen, but bootloader
> >>>> makes different choices than user-space. It's perfectly fine to make
> >>>> these choices different, but then user-space should not depend on
> >>>> something which was/was not initialized in bootloader.
> >>>
> >>> I think there's a misunderstanding here.
> >>>
> >>> Currently the ChromeOS bootloader doesn't use the device tree to
> >>> control its flow at all. ...but the ChromeOS bootloader is in charge
> >>> of picking the device tree to give to the kernel.
> >>>
> >>> Specifically I'm not aware of any mechanism in the kernel where you
> >>> can give it a pile of device tree files and have it pick the right
> >>> one. I believe that the official ABI says that it's up to the
> >>> bootloader to provide the device tree to the kernel. This is right out
> >>> of `Documentation/arm64/booting.rst`
> >>>
> >>> A FIT image is, as far as I'm aware, a standard way to bundle a kernel
> >>> together with many device trees. The idea here is that the bootloader
> >>> should grab the kernel out and whichever device tree it decides is the
> >>> right one. It should then boot the kernel and give it the correct
> >>> device tree.
> >>
> >> So that's the same case if you had a device called "Foo" (google,foo)
> >> with a Qualcomm sdm845 processor (qcom,sdm845) and have a DTS like:
> >> "other-company,bar", "qcom,sdm845"
> >>
> >> Bootloader on Foo sees "bar", ignores it. Then it sees "qcom,sdm845"
> >> compatible and is all happy! It loads the DTS and passes to the kernel...
> >>
> >> You cannot do that...
> >
> > The bootloader never falls back to just the SoC name.
>
> There is no "SoC" part of compatible list. Only by convenience we put it
> that way, but DT spec does not define first compatible to be for
> platform because they all are[1], therefore following your earlier
> description - bootloader should load BAR DTS on FOO device just because
> qcom,sdm845 matches.

As documented in "Documentation/arm/google/chromebook-boot-flow.rst",
the bootloader creates a match list to pick a device tree file. It
never creates a match list that has just the SoC. It always picks
based on the board name and never falls back to just the SoC name.


-Doug
