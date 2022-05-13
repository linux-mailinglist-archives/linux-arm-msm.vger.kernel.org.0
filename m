Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31122526BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 22:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345715AbiEMUo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 16:44:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiEMUoy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 16:44:54 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C27245C58
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:44:53 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id i19so18329228eja.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=55dffKzUURo3SfiqA/BEE8o52UNGk7nPiNJj9q1EvHo=;
        b=CkwOTBQa/6gpAvG7tg13PNADiJwjora+sLhHNmoDE5nuiBQ9yLYCkJyKH570Geq6zw
         4ayQB+4KtUdQOc7XprcGjHYoxqC2GIaCbnwloQ/SAKoCUo5gIvwmb+FljxCzfaZ1do3M
         fN40nTvQPGJixSvk/XOSsiVBi6lhuyEMXsIkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55dffKzUURo3SfiqA/BEE8o52UNGk7nPiNJj9q1EvHo=;
        b=zjt9hYHkKWcV4E5ENJI/RzZF/bFNJi/TV8OgzMAJH4TDycobkRjSGm3qdZF6iTPsrl
         4lUK5hRmrt/JCDZoJRYdcVP20OqmYDefuAEpFGB00b7Ct5vrD38i/UjKCjCPLWwCxxnf
         +sOMeCDtOCoEkBCH6QaF8ee7kwXvu37a8WkYD0wfWzZ6nIaesEYbwLQIblchOAxpK+6f
         IKE0pTz4DnTn37JhBzpNHhLs0z1GNIXK/K/kQ8D+5WMbyrCqulERvm7Zoggp+1ODVVEt
         1PD8p1agiPHvAwgaXLF7s0bFpep3E6EzeHUaXG79z/Pg1nazJG0KiFnXfo3rWeP3UiUC
         DSNg==
X-Gm-Message-State: AOAM5333t4SUF3ZD7diAuFIHW2YCCs66+dJXT9GqjQnta/n7sZuVHc50
        seuABj5lrSZ5FkFaYnMZAI5TjyN/JbdHX7hEQVI=
X-Google-Smtp-Source: ABdhPJyN4Kr5+QhlX9YEJezenF687tekNRsjxRqTHX22IA+lvw22c0v0QKHbQKL87uhhZ5o9Jucl/A==
X-Received: by 2002:a17:906:7954:b0:6f4:dfbe:acd3 with SMTP id l20-20020a170906795400b006f4dfbeacd3mr5914699ejo.416.1652474691685;
        Fri, 13 May 2022 13:44:51 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id u6-20020a170906108600b006f3ef214e50sm1081165eju.182.2022.05.13.13.44.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 13:44:51 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id u3so12874334wrg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 13:44:50 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr5333219wry.342.1652474690235; Fri, 13
 May 2022 13:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
 <20220513095722.v2.4.Ie8713bc0377672ed8dd71189e66fc0b77226fb85@changeid> <Yn7BbNeVXV1aGCsi@google.com>
In-Reply-To: <Yn7BbNeVXV1aGCsi@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 13 May 2022 13:44:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VpdfrkKJg8bgtTEACxH5VP+rXG0MTXPARi3S1htuqbSg@mail.gmail.com>
Message-ID: <CAD=FV=VpdfrkKJg8bgtTEACxH5VP+rXG0MTXPARi3S1htuqbSg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: arm: qcom: Add more sc7180 Chromebook
 board bindings
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 13, 2022 at 1:37 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 09:59:20AM -0700, Douglas Anderson wrote:
> > This adds board bindings for boards that are downstream but not quite
> > upstream yet.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> I didn't follow the discussion about the odd sku ids (-sku1537,
> -sku1536, -sku1024, ...), but they match what is in the
> downstream tree, so it seems alright :)

It makes more sense in hex. hex(1536) = 0x600. Basically on these
boards there are two sets of GPIO strappings, the normal SKU
strappings and the panel strappings. Depthcharge combines them. You
end up with an ugly decimal number, but it's not the end of the world.

-Doug
