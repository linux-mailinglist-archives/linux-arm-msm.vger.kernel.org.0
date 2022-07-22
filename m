Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5B357E572
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jul 2022 19:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbiGVRX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jul 2022 13:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235974AbiGVRXx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jul 2022 13:23:53 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B44C9C262
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 10:23:37 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id sz17so9680641ejc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/clfG4bokvt4j/ATqK3EbX5MJ0abz1lTIwYUzcWrb0A=;
        b=Q9Tcvp3Z3YKuPcNcL+jFWegHbKeruo+XcF8knqc3eyJHd5EeqOeypzFLZOemycFHKu
         FzmqrANNM8Pj+BDQ/5bUfxihA0bBJXBwz/07nQDcUd7PDBXGwiM8/MDV0KwAzSiqgxDh
         Sxu66dZ/tSTtKF2mxkO31MHfO86Zv5u1CMoiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/clfG4bokvt4j/ATqK3EbX5MJ0abz1lTIwYUzcWrb0A=;
        b=DxnWKTYTCcIqIbib0srOL4S4YqwPNwoxI61GEy8VIXf7dS4QnFfUh49t2pgH57/3Zq
         fvTyO+rACqDqC6hehP/SOGs4qHMcxrkTzYYOYvD7eKeD4GyqBYEdg3LB8qrBRqLyt6iU
         a2WsDpPjaMGanBoyiqxWmE2tJcYfePfrFZnTsd7DVKbaRnQhzQhnq2AShp5JOclrs0c9
         +FT0fzbenXlnnOaOBwslijjWvo8whGkvD4NibqEwESVwwJ4rMivlLOj/pvyEBjm9u8+I
         b1W6N46wbxFTc2ZI7DdnRY4tv1ov6tFE4Lq2o42fBfuTXzhz08FmGfztmaGFgDBqbaL9
         gU/Q==
X-Gm-Message-State: AJIora9VGj/0vWN32j0KWXptb9cMpTs/mwVP8RU6qwixtfpuE8fFxXfH
        fj2qMQOM3hwzfUCBkLQxBFGzLynvYaTQ7Llg
X-Google-Smtp-Source: AGRyM1vz6NkcoLZC8GLSOhVzbTTwYhxkUdNvXJeNk1I6aQZKQCzzVX3nnWUyAM5MbAdBooYSjJCyJQ==
X-Received: by 2002:a17:906:d54d:b0:72f:9b43:a4bf with SMTP id cr13-20020a170906d54d00b0072f9b43a4bfmr732431ejc.200.1658510608498;
        Fri, 22 Jul 2022 10:23:28 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906311200b00722bc0aa9e3sm2194702ejx.162.2022.07.22.10.23.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 10:23:25 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id bu1so7384370wrb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 10:23:24 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr600325wrr.583.1658510604287; Fri, 22
 Jul 2022 10:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220721033918.v3.1.I10519ca1bf88233702a90e296088808d18cdc7b1@changeid>
 <20220721033918.v3.2.I7ecbb7eeb58c5e6a33e32a3abf4d6874e6cb725c@changeid>
 <CAD=FV=WSBgupLFMCZgianck6uTkAyqrG0WK2ChSbNbJdhOPdLA@mail.gmail.com>
 <4b2fe9d0-f590-0fac-79fa-bb05da1d61df@linaro.org> <CAD=FV=XmaNdc9k98vAwbcN-sm0w_WeqhRsK_AUm3h4LZ5-egmQ@mail.gmail.com>
 <c2b03863-2249-13e6-98e0-731c1b40d0a9@linaro.org> <CAD=FV=XKC_fbBzna8TgiPRmPH_=AQ3ckv2EEjoNvayKQ83Uciw@mail.gmail.com>
 <8a4999b9-862e-f698-28b9-42d26f680367@linaro.org>
In-Reply-To: <8a4999b9-862e-f698-28b9-42d26f680367@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Jul 2022 10:23:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBCC6HwUzKJ51LBkfWpXcbY9QepVZfNzQJp3qADzkkQg@mail.gmail.com>
Message-ID: <CAD=FV=XBCC6HwUzKJ51LBkfWpXcbY9QepVZfNzQJp3qADzkkQg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: qcom: Document additional sku6
 for sc7180 pazquel
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 22, 2022 at 10:14 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/07/2022 20:29, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jul 21, 2022 at 9:52 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 21/07/2022 18:43, Doug Anderson wrote:
> >>> Hi,
> >>>
> >>> On Thu, Jul 21, 2022 at 9:33 AM Krzysztof Kozlowski
> >>> <krzysztof.kozlowski@linaro.org> wrote:
> >>>>
> >>>> On 21/07/2022 15:37, Doug Anderson wrote:
> >>>>>
> >>>>> Not worth sending a new version for, but normally I expect the
> >>>>> bindings to be patch #1 and the dts change to be patch #2. In any
> >>>>> case:
> >>>>>
> >>>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>>>
> >>>> I would say worth v4, because otherwise patches is not bisectable.
> >>>
> >>> You're saying because `dtbs_check` will fail between the two?
> >>
> >> Yes
> >
> > OK. Then I assume you agree that reversing the order of the patches
> > won't help, only combining the two patches into one.
> >
> >
> >>> How does
> >>> flipping the order help? If `dtbs_check` needs to be bisectable then
> >>> these two need to be one patch, but I was always under the impression
> >>> that we wanted bindings patches separate from dts patches.
> >>
> >> I don't think anyone said that bindings patches must be separate from
> >> DTS. The only restriction is DTS cannot go with drivers.
> >
> > I have always heard that best practice is to have bindings in a patch
> > by themselves.
>
> Yes, bindings must be separate patch, no one here objects this. You said
> they cannot go together via one maintainer tree or I misunderstood?
>
> > If I've misunderstood and/or folks have changed their
> > minds, that's fine, but historically I've been told to keep them
> > separate.
>
> Nothing changed. Bindings must be separate. They will be applied by
> maintainer and, if correctly ordered, this is bisectable.

OK, I think this is the disconnect here.

No matter what order Jimmy's patches land in, it won't be bisectable
from the standpoint of "make dtbs_check". This is what I've been
trying to say.

* If the bindings land first then the device tree won't have sku6 and
will fail "make dtbs_check"

* If the dts lands first then the bindings won't have sku6 and will
fail "make dtbs_check".

Am I missing something?

So when you said "I don't think anyone said that bindings patches must
be separate from DTS" and that you cared about "make dtbs_check" being
bisectable that you were saying you wanted these squashed into one
patch. I guess that's not the case.

-Doug
