Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95DFE4C5E9B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Feb 2022 21:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiB0U3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Feb 2022 15:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbiB0U3I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Feb 2022 15:29:08 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871991120;
        Sun, 27 Feb 2022 12:28:31 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id s1so12647451iob.9;
        Sun, 27 Feb 2022 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fzg6iYXSNKVB/B3u46f0RaXaElVn5XYb3RsU+WpzRio=;
        b=iPy+5+uXmK6oU5dgeSjdJXiJZcrWKeFhsuh8GGM4k6+Uc6Rq+i06jhqBQIyPPxCuoB
         pfn/TwasGzSIPhZaq9wmhmxOfHMu3KDwVQKRGs9/idX6vlA1B77J1wfiyKgdAGUURtzg
         u34FNjqszZj7RJG/E6o4weKtXWwUToSFbvP3BV0OtVGXJfxDxqtgKUypRhHdAsIgY7cP
         4c38AWEBs++f4Fs9CqlWXDe0uMHdcKKvad8jrYzfSqukSWzwyjC0/ZBgCyphGovj3FMi
         VunamQ9Nl+MjdxRWzLqjtUeXN5Eh+cFdvPMyVjgCMsB4ddYklkn0Tre1UQFfQGwOHyIc
         T16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fzg6iYXSNKVB/B3u46f0RaXaElVn5XYb3RsU+WpzRio=;
        b=HqDvE07jZuZ+okyhLKl3CHIwrrqMaOdWwOdrj8WTGJl00D46KzIM7y0TxyYcg+LwXZ
         OF/1vDgTdNVEJYNZdFCxtaRBKGWY4IutcZ4QiehOZWdKUh2i7aXPjvk8iKALD4yvIsCT
         DZouUKRmTo7BcnMuAqji++L5c4gd/uAGED/Q+NL29W7v5BsbIHTQ0xX7RKwn4qY+iP6M
         MHk4BXigm+PSRIlaU2KZIDCuOSFZoZN0uumFskMMOwlK1i4v5Ipx9oLK0fym0PJu3txo
         hkSqarsOwFZ5MjWZpyJbdLPMYWbVWnO+uoOUdV6nMGN07LbsgG8QqP4Q/AUFZAWimXNa
         Vn5g==
X-Gm-Message-State: AOAM531esThhv1ThWRhi4/xNym46Bp1+UkkQnUkd3dCq+KU1/i9xQ8Ry
        ++h80ny8NjIjV5S0aswEv5uNIVDuprqjO4iP66c=
X-Google-Smtp-Source: ABdhPJwejOkmQD87ahDxHoNXNHtvO3IB2s9jVqlJxN6Ba9Brs+iMWG/AGidEJ4KW/AwT/HM0UE3zGli8Wko/YoJWlnQ=
X-Received: by 2002:a5d:970d:0:b0:5f2:9242:d881 with SMTP id
 h13-20020a5d970d000000b005f29242d881mr12948221iol.187.1645993710963; Sun, 27
 Feb 2022 12:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20220220212034.9152-1-michael.srba@seznam.cz> <20220220212034.9152-5-michael.srba@seznam.cz>
In-Reply-To: <20220220212034.9152-5-michael.srba@seznam.cz>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sun, 27 Feb 2022 13:28:20 -0700
Message-ID: <CAOCk7NqsaaQH=j87pQvUoMmrJT0_yPXAdgvu9ymmenE5bOebRg@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: msm8998: reserve potentially
 inaccessible clocks
To:     michael.srba@seznam.cz
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 21, 2022 at 2:24 AM <michael.srba@seznam.cz> wrote:
>
> From: Michael Srba <michael.srba@seznam.cz>
>
> With the gcc driver now being more complete and describing clocks which
> might not always be write-accessible to the OS, conservatively specify
> all such clocks as protected in the SoC dts.
> The board dts - or even user-supplied dts - can override this property
> to reflect the actual configuration.
>
> Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>

Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
