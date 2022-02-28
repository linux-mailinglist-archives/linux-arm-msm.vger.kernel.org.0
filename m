Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0334C7A88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 21:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiB1Ugn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 15:36:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiB1Ugm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 15:36:42 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5328EB6D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 12:36:03 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id g6-20020a9d6486000000b005acf9a0b644so10457489otl.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 12:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=DnbFngqfufuVTV8BEebuiOMNgQnV4+enHodmf57s2nY=;
        b=Ubg2gogtuClcFrTjghZgjXnPtjDc6NUvr54dAtOrjXTwLIcW4UEVas2lMn9bN23YQH
         m0zEhI8shmvjqESiG6EdHdvB8pEAd7Ly/QjkAmB2mwTRE8kgbBZPP2GVDFWG1u0ejJNC
         2AKLLy4/k+cQ6utg/dGqP+Vt799Fz2I487OjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=DnbFngqfufuVTV8BEebuiOMNgQnV4+enHodmf57s2nY=;
        b=dOloTtf5/MlSnbp2ooQ6C99/MPGnWbGnki+t3GoGxyRsXj6tJRqvt8SzJgnUQJWI5W
         RjkH2fuBqTFVEoXjeTLqzh7CilPdgAL+twqCM4XghhBzs8NRvcKYrqC+0KhMOoqB0O72
         bIwHoWvrmO70AiO5FVkvJg9kqsa4LtqzLO7IJtBbcEDbTiOZIf7sYSiLtdSAs+2+1P6C
         ZmQUM4zq4rvao7yL7ggd4ix5V4LlwzGNCX0SLvH+dhAdaMVnBUBU5Gr0dAqCQDD4+jEl
         v8OE2x4U+7HKAIYGL1fXdrk6noq0NHp72/1baOUWvKxroaAjil6QqbxJfu0eKP3JZ+1U
         JF8Q==
X-Gm-Message-State: AOAM531uEwlOBxTn3aBKXC7eJlngutiGwYzC1Qtt7t/iULIPtu5VWeQy
        TUttJjGucSpySWJ/HYXTz+Ct29Wyqacy6jbXbtxZKw==
X-Google-Smtp-Source: ABdhPJzf+lYhpqsqA+oxysJafg7aent578gGwJJLtUFap4dXPJHjOyVXhw/HaLDHOJhrHI4W5Je6BIl+JEjlvzLq+t4=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr10087910ota.159.1646080562525; Mon, 28
 Feb 2022 12:36:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 12:36:02 -0800
MIME-Version: 1.0
In-Reply-To: <42570508-ed62-af26-220e-c776418a722e@quicinc.com>
References: <1645182064-15843-1-git-send-email-quic_c_skakit@quicinc.com>
 <1645182064-15843-6-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n509bg6RzieOtYuUvicU14D7bmgH-u02F1TB+hBZ+xH4CA@mail.gmail.com> <42570508-ed62-af26-220e-c776418a722e@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Feb 2022 12:36:02 -0800
Message-ID: <CAE-0n50J=4qrkR9ycEGxbKVHwm9Om8S2YSJR_Y71_iErR-wAHw@mail.gmail.com>
Subject: Re: [PATCH V7 5/5] arm64: dts: qcom: sc7280: Add pm8008 support for sc7280-idp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_collinsd@quicinc.com,
        quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya Kakitapalli (Temp) (2022-02-28 06:25:06)
>
> On 2/19/2022 7:31 AM, Stephen Boyd wrote:
> > Quoting Satya Priya (2022-02-18 03:01:03)
>
> >> +               pins = "gpio4";
> >> +               function = "normal";
> >> +               bias-disable;
> >> +               output-high;
> > Is this a reset signal? Should the driver be deasserting the reset when
> > it is ready? That could be the same time the gpio is acquired.
>
>
> I didn't get your question exactly.. hope this answers your query
>
> The pm8008 chip needs this gpio to be toggled , in order to come out of
> reset and start any transactions..
>
> Please let me know if you have more queries

Yes that answers it for me. Thanks.

This is a reset gpio and should be a DT property like

	reset-gpios = <&pm8350c_gpios 4 GPIO_ACTIVE_HIGH>

in the pm8008 node. When the driver probes it should get the gpio and
do any toggling to take it out of reset. It shouldn't be done through
pinconf settings.
