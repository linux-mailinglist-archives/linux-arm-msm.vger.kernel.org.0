Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7242D4E6992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 21:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353170AbiCXUBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 16:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353105AbiCXUBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 16:01:41 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECAB85BD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:00:07 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id h63so6663848iof.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NIeb4/VCYD/DVpQS7+hcb33JtSGPsyNTOD4hJRIfFYg=;
        b=ig2LZmT/ULNd6has1x+tgUYcp8IlB29NYiSSDQoLQq7e4dlU3i6HB1VA7Q9gZeYXWi
         M3lCuAvR1UpnzsELZRdyf8bqrTPOEdmnFXOCBwKCPDfaxWan6BjVu9tXgGEHa9RSd8kr
         owI6u9PErmK310L9agaXHuclkSSY1jcINq+B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NIeb4/VCYD/DVpQS7+hcb33JtSGPsyNTOD4hJRIfFYg=;
        b=JjZIDXcTKe8bIeNjTocxBuGitGWRs8DSRTgaQZizdmrHSgIuZ/sSPuNfywD0CAStPl
         dLl6tZKXLTKdnqFUCP++0TFLSgT2hEIxodrdockZB9uGtkILjzqfPp1e53t2P0OwzLv5
         dVnF/k4ycM8KgOAq+N8hAiKA0IL8onbwlUusBUhxXSt05x5gQuz7Ki7lKghqExcrd2s7
         l3P7QI4yNNfEnGYgyiXJR8sy4CYV0GsncCOqyGu1ZpameFzsQ9Q2DoK7KFStxpRIeI1N
         S6L4dwJZVWu/kZ4XitgM7kZ3hnyxFg7aNkcdIBL7BwKRBciAEg/+SEneRdcWCrI63G21
         dSmg==
X-Gm-Message-State: AOAM532LBKroHmc7EnDXgeZOBwG2qzKvxyka6DpyqjJ9K3MQm5hpsEQ+
        h1k0P5rAkOIMdLNMYYvbxdAQLeVHdj1EEvyc
X-Google-Smtp-Source: ABdhPJwNDDHQ4JSBg1VoKC7TbOlcAmgQykQunkrclb3KYf04ZJ5n4rIEqQ/MVE05ok1D5Hkl/Y3TjA==
X-Received: by 2002:a5d:84c1:0:b0:649:f07e:9c9c with SMTP id z1-20020a5d84c1000000b00649f07e9c9cmr2889156ior.33.1648152006830;
        Thu, 24 Mar 2022 13:00:06 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id g5-20020a05660203c500b006463f6dd453sm2158100iov.34.2022.03.24.13.00.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 13:00:06 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9so3893814ilu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:00:05 -0700 (PDT)
X-Received: by 2002:a05:6e02:20c4:b0:2c8:5b82:3035 with SMTP id
 4-20020a056e0220c400b002c85b823035mr3583254ilq.220.1648152004944; Thu, 24 Mar
 2022 13:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220324101242.v1.1.Iebdb5af0db7d3d6364cb229a27cd7c668f1063ae@changeid>
In-Reply-To: <20220324101242.v1.1.Iebdb5af0db7d3d6364cb229a27cd7c668f1063ae@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Mar 2022 12:59:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XchtJx3ZsL4Bxj29b_-43E8p2fiJ5SBQSzbW8wp+gNfg@mail.gmail.com>
Message-ID: <CAD=FV=XchtJx3ZsL4Bxj29b_-43E8p2fiJ5SBQSzbW8wp+gNfg@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7280: Add device tree for
 herobrine villager
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 24, 2022 at 10:13 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add a basic device tree for the herobrine villager board.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/sc7280-herobrine-villager-r0.dts | 274 ++++++++++++++++++
>  2 files changed, 275 insertions(+)

Question: how does this interact with the patch:

https://lore.kernel.org/r/20220316172814.v1.3.Iad21bd53f3ac14956b8dbbf3825fc7ab29abdf97@changeid/

Specifically, if that patch lands first don't you need to add a patch
to turn on "pp3300_codec" ?

I was also looking at whether we should be enabling the wf_cam
regulators for villager. I believe that answer is "no", but _also_ I
believe that we should be _disabling_ the uf_cam regulators for
villager, right?


> +                         "MOS_LAA_AS_EN",              /* 90 */
> +                         "SD_CD_ODL",

I was somewhat surprised that "SD_CD_ODL" was listed here since,
diffing this with Herobrine, it appears that Villager doesn't have SD.
I checked the schematics, though, and I can confirm that the GPIO is
named this even if it just goes to a testpoint on the board. ;-) ...so
I'm fine keeping it here.

-Doug
