Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0366DB5E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 23:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjDGVr2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 17:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDGVr1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 17:47:27 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607FBC17E
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 14:47:26 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id o20so41707810ljp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 14:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680904044;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKr1VFdANaH910gTqIuF+QQoeNNCvbMtK24RJzAeJ1s=;
        b=BERlpGeiqyFM0KnKvmiUU8mdGnHlblFPFC9arB92MIKu/seqPM4ZnZ+MjWIffcIQ70
         6nPyThcFs0Y78oeP9UgGSbD2pf7HcmqNZsT/SdCz5Ye+azz5dajvX/5PxgoJCBPCtu3v
         G+EIWBDM5fL18cgxwDPF6NQRIZQNPX68rprMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680904044;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKr1VFdANaH910gTqIuF+QQoeNNCvbMtK24RJzAeJ1s=;
        b=lJNEEn3AGsgtd5fVLaN1o9eSs/h2S+bv8JZu6bxaTpuazgcQ5dVJaDVQ/JlQechZ42
         6bqcc1vpyTXNWfgdBL+u7FeY8riKbWkydGjqYTUSh81bo7g8DbGhClagC2SLk2900yGP
         goD3qNXO/PHhtIZMRrb5Ro5wu3qaU9LRcIsQDIAl5eJ1q1CAXiH4w6Iq0wB+I03kR1/v
         C7akvr9p5pi220utewg3Ma8QCYEdk42O2/CRDFzz6JjS7aPPOS6bWkjLrQ3nm48+CHcy
         j17UDqcXhM3wS4lPuY8T4BsY26J8dguC+i94eUkOw1K0wM5899A6o4oBMA55Avnz0h0U
         etsQ==
X-Gm-Message-State: AAQBX9f0ti7Lei1SV2dAfCrrc2qB6bxnidUiexMHinCt2SFKZx9ejDRF
        mG0lzVm+xSPJI6/U4wNtSB+li6Cegv2hHv6deI4odw==
X-Google-Smtp-Source: AKy350ZkmDyMUF2lwovyh7fmUX0Xqi/7P8gpx4vAUkL98n181sdNQCjwfzR/32ySpWV+vBM0DQ4nXhrXJTY5+W6hCOQ=
X-Received: by 2002:a2e:be9d:0:b0:298:b378:961f with SMTP id
 a29-20020a2ebe9d000000b00298b378961fmr1072284ljr.0.1680904044665; Fri, 07 Apr
 2023 14:47:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Apr 2023 14:47:24 -0700
MIME-Version: 1.0
In-Reply-To: <20230407142859.1.Ia5d70e320b60d6707c6182879097708e49b8b519@changeid>
References: <20230407142859.1.Ia5d70e320b60d6707c6182879097708e49b8b519@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 7 Apr 2023 14:47:24 -0700
Message-ID: <CAE-0n534cJ-=WdE81oDfGHS=6i5CsW5M8UgYZKrUxLeuO3a9aQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add "and" to PIN_CONFIG_INPUT_ENABLE comment
To:     Douglas Anderson <dianders@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2023-04-07 14:29:14)
> The comment recently added talking about PIN_CONFIG_INPUT_ENABLE is
> clearly missing the word "and". Comments live forever, so let's fix
> it.
>
> Fixes: e49eabe3e13f ("pinctrl: qcom: Support OUTPUT_ENABLE; deprecate INPUT_ENABLE")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Link: https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/4409769/comment/9a1d5def_e1e71db7/
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
