Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE23B4E6AC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 23:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240614AbiCXWhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 18:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240155AbiCXWho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 18:37:44 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5D1BA33D
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:36:11 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id pv16so12076551ejb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e6IOeNLpJyv8LNAg0lIn+GQLMzUbl9r7/TJFCZNGFfI=;
        b=dGR+6YPVvBEoetW1oLf+P+zyYE0iBwuXw+PtnY7E9zECYTvAPHLgKdxN0F5oLHWXI2
         hFbNqFIdty29VuOjAZlLV4A2PE7MfkwddEWJFez5qCBGTpqBh/5MQzHz4FP6wuFyPuw1
         h4JAD83gjbqFuL3aFtb3g14/klmt1aHjKUaJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6IOeNLpJyv8LNAg0lIn+GQLMzUbl9r7/TJFCZNGFfI=;
        b=WLlWZFHPgtYA7T702RoaFPWMOHdQPqA6cu+pWDeoncohBkAoSXplJBfDaLjDzgdTTa
         ZSHrgjFjXmLqi84k57xbdUBvVGAS0GG1kiW0JIRSAldqCNAjAv6QVcHKLhVl1pACN2WG
         59I632NDJp47HAUIXBURhnH3cksob2GGCNtVuHUFaqlu3ha/2A0RK0Rh7kJvKHAHz54L
         s0ew02vztGlQJDcGJE+IH6DaGtQRiAfbMw0am0DbeqSjcu17wVer44tJfjql0OMuqjuZ
         /fuyqALhroG9aHeeqXOFc3rqXT3QAnYLengNsC0L17t86JxCbqhBEo4s/JY98XXZ5oRZ
         dLiA==
X-Gm-Message-State: AOAM530AsZfUSPSHoZKjnGVluVqApU+5Fuu6IKRLBz4RTGzZ8yV/Szsh
        TvEDwshPeN1zHx6lnlDnNSZXtkMViuo4a00j
X-Google-Smtp-Source: ABdhPJzYTLrMW9vyoAYvWtxMt9FSm9p3IoUt2ZZ7Ygd/7p9ch6d9aabjjFripHYsNGLFR5UFSILdvg==
X-Received: by 2002:a17:906:2695:b0:6cf:e1b4:118b with SMTP id t21-20020a170906269500b006cfe1b4118bmr8072483ejc.348.1648161369647;
        Thu, 24 Mar 2022 15:36:09 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id n24-20020a17090673d800b006df8ec24712sm1630886ejl.215.2022.03.24.15.36.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 15:36:08 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id a1so8532067wrh.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 15:36:08 -0700 (PDT)
X-Received: by 2002:a05:6000:1704:b0:203:d857:aa7a with SMTP id
 n4-20020a056000170400b00203d857aa7amr6123801wrc.513.1648161368223; Thu, 24
 Mar 2022 15:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220324223331.876199-1-swboyd@chromium.org>
In-Reply-To: <20220324223331.876199-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 24 Mar 2022 15:35:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdB-RNXQeQsyzMF0hu6Z3vz1wRRiqQwvepY_TuQDHKuw@mail.gmail.com>
Message-ID: <CAD=FV=UdB-RNXQeQsyzMF0hu6Z3vz1wRRiqQwvepY_TuQDHKuw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
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

Hi,

On Thu, Mar 24, 2022 at 3:33 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This node should be named sar1-irq-odl, not sar0-irq-odl. Otherwise
> we'll overwrite the settings for sar0 with what is intended for sar1,
> leading to probe failures for sar1 that are quite confusing.
>
> Fixes: 116f7cc43d28 ("arm64: dts: qcom: sc7280: Add herobrine-r1")
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Oops! Thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
