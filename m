Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213945A6952
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 19:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbiH3RN2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 13:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiH3RN1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 13:13:27 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E778BA9D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:13:26 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u9so23546961ejy.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UvXjdpOBOlQjXTxcHn0j8A5QeMGUq/3slCHIZyddxdM=;
        b=Fnv5wPVDAk09qRTv+WtGrIZllXwiu2F/otARTbIkHxUNdqqLyJyPZawqnGFHLVb4cr
         Y9E67W2H8MQRfMD9BMeCnD6cb0/Wy5wfJJJ53jp9nFHhZlAJ8ZBKbM61XWMdtcon+o1v
         kX2NroAuimYpcIR9rGExM05zQgE9DD5+dY2Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UvXjdpOBOlQjXTxcHn0j8A5QeMGUq/3slCHIZyddxdM=;
        b=JJd1wFOrd4aCoDUUCh/SlJl2sT9xbSuI4H8AspDMCL6fmLKSaxunZ6cz29qgmWsDOs
         BUrHPd3oIdyxlNKyYGQmMzVedyQOJZ/XUULaJORI751HjuuTwqxdU5/zetXKE5uO1/xM
         7QAw1NigZgfzvzUpbfMbpSOK8+byn76WvqfYKq0pNaVZcJtycFJpBpvUONdeuTRM4zPO
         ZBTlAvt6jfwl906JUuDGtHHimriB9fsaUIq9qhPD96C4Tr+F0l0nntoQwROHZqzWcIcM
         d7ddPnPu2wxUnGufgpKXnNv4PAMVkKm6XEw+l8hLVSKRdv6MeEN6G6XhMBKsLT/Ear+Q
         kPIg==
X-Gm-Message-State: ACgBeo2YigqkmD0dzuVVQH4wQvqDabpIzUZBLMUvEi7gm9sXoTGYVwof
        auuoNUinY4GzqyvWL1n0sCkb40ChbC4gXQE8
X-Google-Smtp-Source: AA6agR57fXv2i83FIvdZIjapoD1G1bF5ek37tWQ9Y2ykFJFPTiXEK8JfBsUT+i0N6z3+O7qcbvAVoQ==
X-Received: by 2002:a17:907:6d99:b0:73d:5192:ddab with SMTP id sb25-20020a1709076d9900b0073d5192ddabmr17300978ejc.246.1661879604541;
        Tue, 30 Aug 2022 10:13:24 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id dv10-20020a170906b80a00b0073d6234ceebsm6021531ejb.160.2022.08.30.10.13.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:13:23 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id n17so15111917wrm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 10:13:22 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr9527247wru.405.1661879602477; Tue, 30
 Aug 2022 10:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220830053307.3997495-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220830133300.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
 <184d4ff5-e80c-6a24-8071-0b0a69710685@linaro.org> <CAD=FV=VorVNKHgybGAH=dD5ob+1RYoguczycjOYu-5VPu=9Jkw@mail.gmail.com>
 <bc707091-3417-bc89-70bf-3a2496a11196@linaro.org>
In-Reply-To: <bc707091-3417-bc89-70bf-3a2496a11196@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Aug 2022 10:13:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+JdT8YMwMdbcK+14fSBXt7U3J7DtZFR0LxER0bS_9fQ@mail.gmail.com>
Message-ID: <CAD=FV=U+JdT8YMwMdbcK+14fSBXt7U3J7DtZFR0LxER0bS_9fQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7280: Add device tree for
 herobrine evoker
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 30, 2022 at 9:50 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/08/2022 19:10, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 30, 2022 at 2:33 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >>> +};
> >>> +
> >>> +/*
> >>> + * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
> >>
> >> What does it mean and why it's SCREAMING?
> >>> + *
> >>> + * Sort order matches the order in the parent files (parents before children).
> >>
> >> Why? Sorting should be rather alphabetical.
> >
> > We've had this discussion on the lists in the past. See, for instance:
> >
> > https://lore.kernel.org/r/CAD=FV=U2C1W+JHWyGRfyRB=WiPKLYvtjO90UDoJ9p+Xwe09+ow@mail.gmail.com/
>
> Good explanation, such sorting rule is quite nice. The part about
> regulators is still a bit confusing, I guess it is about some other
> pieces in some other place?

Yeah, we originally started with the regulator sorting of "parents
above children" long ago when it helped avoid some cases of
-EPROBE_DEFER in Linux. The -EPROBE_DEFER isn't a reason these days,
but when I looked back at it I decided that I quite liked "parents
above children" and that it matched my mental model.

Specifically, take a look at
"/sys/kernel/debug/regulator/regulator_summary". Parent regulators are
listed above child regulators because it makes the most sense to think
of the regulator tree. Obviously we can only do this in the dts for
regulators that are separate nodes and not ones provided by a big
PMIC, but we often end up with quite a few of those in the end.

In "child" device trees that are overriding a single regulator (like
evoker) the comment is a bit nonsensical, of course. I'd be OK with
removing the "Sort order matches the order in the parent files
(parents before children)." in the evoker device tree since there's
really only one regulator in this section. The only downside would be
that when someone adds that second regulator then they might not know
the sort ordering. ...so I would be fine keeping it too...


> But isn't this kind of obvious from
> including other DTSI?

Isn't what kind of obvious from including the other DTSI? That the
sort order should match the sort order of the parent for this section?
It wasn't obvious to me. Since there are usually just a few regulators
that referenced like this it seemed like it might be easiest to just
alphabetize them in the child device trees. ...but I settled on
thinking that matching the parent was marginally better. Since I
debated it myself I decided it was probably better to comment so
others understood the sort order...

-Doug
