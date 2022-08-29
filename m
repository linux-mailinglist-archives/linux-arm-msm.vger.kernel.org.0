Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736FC5A523D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 18:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiH2Qww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 12:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiH2Qwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 12:52:50 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3448036A
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:52:46 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id s11so795501iln.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YQCZ5HXSfGZcA8bcBTLo0V3fSltEFeq1A11Jwesd6xE=;
        b=kYSctfKLBfS+DN/xG+rtV9Jy92t2ysJSmULWExywhnmeM6p58gImEdKuuQ1ee3JaaH
         tCdETv8lpg7U8P8M5yqFbeAkxkP2XBk0PkR7q4a3m/7FpDHGhF4/eGxenF4e1bHaiw9B
         II2LQsvExAMznOJMpU3H80SLkzQWY/ro6k9KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YQCZ5HXSfGZcA8bcBTLo0V3fSltEFeq1A11Jwesd6xE=;
        b=cw2CSCKM8YyyVjgRvvnkmwgE4sw+juGjm0NNxrFftXZJJdVhseCojjb1U4QO+HQ72Z
         CJOJ4gFikrx2yzbg9fMcZBvUpBAnzTm9N+1NTyWhTNHtyXPILwMotRf4VILqR1G3rMs/
         bvLrJKiBrFd0KUj5qB/1SEtGnvApYSgVhPG3afLiH+zW9dd7iRGFhTYpKHGjMZJEsSLn
         l0PDBuIORDAC3f4I0GJNgOcinzUq82CeEYIHktKFu2nJyn4WUDoVy1jc2p+OxbH38BCH
         Ffcw2jHFLL2sfLMWngo8U9uRaJX+HcWXerEXyGPCGawPxDvzfS1vQTJmoDchC8zH+NXN
         gmjQ==
X-Gm-Message-State: ACgBeo1tvqm4r11BSmfPpBOTcA2cI8ybXMrc+UGAMK4TvseQN1OvELCI
        zz674y7GYaajKFhRNmJr/7ykV00srRYKIFDd
X-Google-Smtp-Source: AA6agR5ocCWbL98P8rgV3RyCoWExBUuXOjxvAXodKovUZTJAGOutT4EH3iPM8F/IhDVsB1sshwORaQ==
X-Received: by 2002:a05:6e02:1c42:b0:2e7:d72c:befe with SMTP id d2-20020a056e021c4200b002e7d72cbefemr10524141ilg.250.1661791965175;
        Mon, 29 Aug 2022 09:52:45 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id l10-20020a056e021c0a00b002ea59935327sm4613421ilh.28.2022.08.29.09.52.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 09:52:43 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id h78so7032050iof.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 09:52:43 -0700 (PDT)
X-Received: by 2002:a05:6602:2dcb:b0:68b:7804:e924 with SMTP id
 l11-20020a0566022dcb00b0068b7804e924mr2910751iow.54.1661791962863; Mon, 29
 Aug 2022 09:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220829094435.1.I4534cf408373478dd6e84dc8b9ddd0d4e1a3f143@changeid>
In-Reply-To: <20220829094435.1.I4534cf408373478dd6e84dc8b9ddd0d4e1a3f143@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Aug 2022 09:52:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvpoK-z8pU0u+oKPahSA3sgwj+1u9DtJX4nRq4xOO24g@mail.gmail.com>
Message-ID: <CAD=FV=WvpoK-z8pU0u+oKPahSA3sgwj+1u9DtJX4nRq4xOO24g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-qcard: Add alias 'wifi0'
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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

On Mon, Aug 29, 2022 at 9:44 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Add the alias 'wifi0' for the WiFi interface on the Qcard. The alias
> is needed by the BIOS which patches the WiFi MAC address read from
> the VPD (Vital Product Data) into the device tree.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
