Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24C34E7D7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiCYTbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 15:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbiCYTbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 15:31:34 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985C22CD2F5
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:06:30 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v75so9196890oie.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 12:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lxCDnuzvI/dDOwtYF1oqphLQYyj16qlSkfozPWjfyEs=;
        b=IVtFFTm3opL1SvfintDvcx2agZk19yMVZYzgsJj2Nw6d+IpllQ8w6KPYzYe6/OSGwG
         XTUV6+5obZzj5GrVSCLM0sAj+SfjXi6QXi+osfdiMa4s2tW2hO4Icf0QndreQK/6ftuR
         HonuN+aKjB2KlBq6n60YrIZdOO82yXB0iWFwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lxCDnuzvI/dDOwtYF1oqphLQYyj16qlSkfozPWjfyEs=;
        b=ViZbnEpkfH+9pPnHfmHjFUEbf2vZVgCNTrO2g4pkCyzcqokaXigIMgQtTvp3grm5vP
         DbblQ+WvxGYF0jC9hcXYmlS6TVrgohDAZ+w2x8lo7vqexMk0ccQajH6tRWiPmu+TqGcy
         JnH9H5D1OrcWe4PZzHhikYKWkX55seDMF7pfSN4Ei72JrDDqDp708ctnNKXhJM41cen7
         dASrw6eqye9DXFdqSYh61m/NDUTPNJ2Zz1akflOXI8XejX0KmboBE/HybNul2yaGAYfX
         ZXLXpW7HXP1+ci/PyvYqEAeGUtmsBX6k6NmnHRDuf1NBoJUnTFIYOTJrE2wCDvzW3pfH
         1Nzw==
X-Gm-Message-State: AOAM533Bcg5UpxrKH6H4dIu62Oh4cae+pA0v+4+1X4tOeT/GOIGN+Yc/
        US0ESvtOnoL6quclfs+sTjn81GDySmxwd36oz9qIWwJ4gNw=
X-Google-Smtp-Source: ABdhPJz8JscmF7Q6aPXFTxS1Lm1vUzWWkKJ+skiG2uD+xzMzId2eANsm+pO6DweUUkxpGaGwXRpkrXq18QFkNFmegPc=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr5627914oie.193.1648231743322; Fri, 25
 Mar 2022 11:09:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Mar 2022 13:09:02 -0500
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WhhVBys4k7nZJ-SHB4y2Jf7JL9eeGUdBTqYG+c3m8-kA@mail.gmail.com>
References: <20220325081100.1.I9f06fec63b978699fe62591fec9e5ac31bb3a69d@changeid>
 <CAE-0n50hUGbH7_khhbsg3fbX_MCK0gEoStk-3xoUzje_a1=KQQ@mail.gmail.com> <CAD=FV=WhhVBys4k7nZJ-SHB4y2Jf7JL9eeGUdBTqYG+c3m8-kA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 25 Mar 2022 13:09:02 -0500
Message-ID: <CAE-0n52x6Hsb-jktp1asQROsQo5Cnz+jsBGRru-pNhSnj7ipTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-herobrine: Audio codec wants
 1.8V, not 1.62V
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Doug Anderson (2022-03-25 08:47:24)
>
> Yeah, I guess it sorta felt like it was a sub-part of the previous
> section since it was also adjusting Qcard regulators, but you're right
> that it's not actually a board-local name. What about if I change the
> section heading for "BOARD-LOCAL NAMES FOR REGULATORS THAT CONNECT TO
> QCARD" to:
>
> /*
>  * ADJUSTMENTS TO QCARD REGULATORS
>  *
>  * Mostly this is just board-local names for regulators that come from
>  * Qcard, but this also has some minor regulator overrides.
>  *
>  * Names are only listed here if regulators go somewhere other than a
>  * testpoint.
>  */
>
> I'll wait a few days and then send a v2 if that sounds OK.

Sounds good to me.
