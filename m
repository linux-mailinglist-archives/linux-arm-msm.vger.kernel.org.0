Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8355847D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 23:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiG1VsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 17:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229997AbiG1VsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 17:48:15 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E35550A5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:48:14 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ez10so5286376ejc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=96laK3X9C3HRNTHwHkJ/JwZirLHA0u1Wc3B+YkpYnbk=;
        b=dwGp1I6EVE9BIy633N3+06sVbzUdtGVoRiYhkuozOlTlbau/f2pEglaX1R7+dsByqT
         engBs/RHc9QlFai8NY3/kFpFsoGgjOWsOVz3WpfAHHD+/6AdSDu5yQGx3Qus4XIQufAd
         eGX++gEOJCCFMUw5AnUlbLqBp473kx5spGSIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=96laK3X9C3HRNTHwHkJ/JwZirLHA0u1Wc3B+YkpYnbk=;
        b=b2C7Ji0Szs2OeGoEPHPnQDz8HbmnQHafOAfRg4KjTVM3V03k4IS8igG2bxcGN155sj
         qIIorPLPIOES0P6MEgP+ErOZb5MZYYx0BWG8jS4qL8tMf7dJtf7O0KAlL73spaAZ1NoT
         m7jlXCj6/AczJ7Sdh7h/YpCFznUwpTZBZyY81363MVMDs7EkoqUM249T3BLWNYXzv7Sg
         1WK+qRi+PgdCjyYW30mRRtT1MXH3nbroA+h5fq8hNYU2Vtfl75YTyOjAtZhKmicV7A1A
         0fmasMi8R3tJLrrn8A93D+xLHqUfv+9UFpkP8SEsPdUf0YTdhcAOyIStPiufLy4oFFF7
         CLkg==
X-Gm-Message-State: AJIora8Z1RSaPcBktoC6qkP3l7upzBlJS1Let7Z4bty2A8BbRTF6Zucz
        FL4JrBV6dyqac5ud/3MjFFH5D6sFKEa+Q7a7
X-Google-Smtp-Source: AGRyM1v144d2Zph7De1yYqrO21Jrb7XrvWPtbHZBIaJYxNLprURgrf2nFDCrWbvYfG1iqP/TC80kxQ==
X-Received: by 2002:a17:906:cc45:b0:72b:313b:f3ee with SMTP id mm5-20020a170906cc4500b0072b313bf3eemr620322ejb.362.1659044892680;
        Thu, 28 Jul 2022 14:48:12 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b006fe8b456672sm847125eju.3.2022.07.28.14.48.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 14:48:09 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id c22so1683034wmr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:48:08 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr776502wmf.188.1659044887677; Thu, 28 Jul
 2022 14:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220728143215.v3.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
In-Reply-To: <20220728143215.v3.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Jul 2022 14:47:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2U5drgkUP57_hszWT+OEKhqcySOAog00NQ09AhtQ8Qg@mail.gmail.com>
Message-ID: <CAD=FV=U2U5drgkUP57_hszWT+OEKhqcySOAog00NQ09AhtQ8Qg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: document zoglin board
To:     Bob Moragues <moragues@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 28, 2022 at 2:33 PM Bob Moragues <moragues@chromium.org> wrote:
>
> Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
> Zoglin is identical to Hoglin except for the SPI Flash.
> The actual SPI Flash is dynamically probed at and not specified in DTS.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bob Moragues <moragues@chromium.org>

A nit from my point of view is that I would have expected your
Signed-off-by to be the first tag. As I understand it the tags are
usually supposed to be a top-to-bottom history of what happened. You
signed off on the patch and then people added reviews / acks. I don't
personally think this is important enough to spin a v4 for, though the
last word would be Bjorn.

> ---
>
> Changes in v3:
> - Fixed Author
> - Fixed duplicate Signed-off-by

Technically this should have been:

Changes in v3:
- Really really fixed Signed-off-by

Changes in v2:
- Fixed Author
- Fixed duplicate Signed-off-by

...but that's also not really worth spinning for.

I think this looks good now. Though unofficial (and not stable git
hashes), I've been trying to keep track of some patches during this
dead time till -rc1. I've put your two patches here:

https://github.com/dianders/kernel-staging/commits/qcom/arm64-staging

-Doug
