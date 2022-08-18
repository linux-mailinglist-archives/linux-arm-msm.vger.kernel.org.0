Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125C75990A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 00:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239173AbiHRWkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 18:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236627AbiHRWj7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 18:39:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 905BAB6D48
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:39:58 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a7so5829460ejp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IjSeQulZP01xUbC8USliBx2oPfWvmG2UcFTgcurAAOM=;
        b=P9xvqk9NHwu+xbO9v1CQj1IbgkfjPi/VAsR2rs+ERg3WJNJnZnLDjeMOcIAv897NdQ
         y1wXBvkXKd6y6b2w/Ra1ymL9aFC9/vV3qytakRAIm07ptDI2Tnxo6Un5KOxMxyFWLPK5
         W11vtX2V1u/9FyImgAikGoI46CGWe296Gyjps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IjSeQulZP01xUbC8USliBx2oPfWvmG2UcFTgcurAAOM=;
        b=aOVGTfNIMu5jPrGVCYq8bZKrz5NQTShOwwv+MKPjVzNjGQn8t1RlWf7en//ClMyhZR
         F+4NuIV2NMriaUO8Cmbg05o1ktFql7SvUJ2zI+s+F4GGDUwX7wBYNmP6TbDsfsPS3YeI
         DmL25jaBjFKNb6di8LE0wxaIOGnvX+CheQit7QD7cVzMJ8JWeVUMOhdAi09rdgVX+RfU
         oC4d3hgQB1Rj51P9u8nWk4vVtZV/AVJiTTvv+O0pzBKqp3V08ghD69o5mL3sMPtbCUUb
         Z5UN0j9UjviSrEFrQOvHBCckFNvqGXXX9JhCt91QOzD0QdEFxxJeT1m04CM3HnRCKbDy
         w/PA==
X-Gm-Message-State: ACgBeo0KcHCqWK4QrvYjFvQTEPN3IwQW0EwH+4A+nWOtO/rKJJZnNhCC
        h6ABb7owFM344KxGViR2mP42Usfogo4Ivad1
X-Google-Smtp-Source: AA6agR40Ksg+Bbrh5I7bkB8WnejE5PXrv7DGgYBjCoP6EOIDohVK8ZH/Afn0oMZqB2gm+bxZmALXVw==
X-Received: by 2002:a17:906:7007:b0:6ff:8028:42e with SMTP id n7-20020a170906700700b006ff8028042emr3062340ejj.278.1660862396941;
        Thu, 18 Aug 2022 15:39:56 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00730e5397057sm1401931ejb.185.2022.08.18.15.39.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 15:39:56 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id k9so3288333wri.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 15:39:56 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr2614963wru.405.1660862395890; Thu, 18
 Aug 2022 15:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220818084216.1.I5c2b6fea19c4c0dec67fd4931f03df8e5ccaca95@changeid>
 <CAE-0n52GzxXEsToWzfU1TMuASuC6TKK7NXxYbBQWxNmM74FxZA@mail.gmail.com>
 <CAD=FV=WNuqtpnCr2Zn0z_L1OCiwD8dNzhDxvhfHYuYVmciPbuQ@mail.gmail.com> <60b5b49b-eb7a-c552-fcf1-3d3a360f8e25@chromium.org>
In-Reply-To: <60b5b49b-eb7a-c552-fcf1-3d3a360f8e25@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Aug 2022 15:39:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UkaiDSYvm7W1tnoty=3dnYTUaEmNcbP7=uEzniELt7QA@mail.gmail.com>
Message-ID: <CAD=FV=UkaiDSYvm7W1tnoty=3dnYTUaEmNcbP7=uEzniELt7QA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add sleep state for alc5682 codec
To:     "Joseph S. Barrera III" <joebar@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alexandru Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mengqi Guo <mqg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 18, 2022 at 3:19 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> On 8/18/22 1:34 PM, Doug Anderson wrote:
> > I tend to agree with Stephen's analysis. We actually need to keep the
> > pullup enabled unless we are actually turning power off to the codec,
> > which we don't seem to be doing.
> >
> > I guess I'm a little surprised that we don't even seem to turn any of
> > this codec's regulators off in S3. That seems like it would be drawing
> > power that we don't want. Maybe the "low power" mode of the codec is
> > low enough and we need to avoid powering it off to avoid pops / hisses
> > in S3 or something? If that's true, this might be one of those places
> > where the "LPM" of the regulators might actually be useful...
>
> OK, fair enough, so suggestions on what I should do instead? Should I
> look at why or how to turn the regulators off? Should I look into LPM?
> Are there existing bugs for such work?

It would be interesting to know from Judy if there's a reason we never
turn the audio codec rails off. Maybe there's history that I'm not
aware of? Matthias or Mengqi might also have ideas of how much power
is at stake here?

Ah, searching through the ChromeOS bug tracker finds some hits. At
this point we should probably move the discussion off the lists and
bring it back to the lists when we have some results. Unfortunately
most of the bugs are not public and so having a discussion here is
just noise for most people CCed.

-Doug
