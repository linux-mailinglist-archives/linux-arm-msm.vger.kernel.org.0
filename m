Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9061678D899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbjH3Saw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245122AbjH3ObB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 10:31:01 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8A519A
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 07:30:57 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe32016bc8so50285515e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693405855; x=1694010655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Z1Z9G4G/KVFZhr9R3sGbutXUCNsEgKocPQNRqGJxWY=;
        b=CQdKIkaLl/QEMaQQAghV3Eo0qUT1QT2VAmg6iQ1K2utQxi5eQjCnlJMWqFVdNIuIrm
         8bGLH87ZwUX/N/Fz5jJlqnz5Kv/mYuAD85ek2Zs/jB9zVi2KgLMY+a+CCfm5TVeP45xo
         SjfC43jpee9/0x6uehLKJobGo6in5iB5oOe0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693405855; x=1694010655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Z1Z9G4G/KVFZhr9R3sGbutXUCNsEgKocPQNRqGJxWY=;
        b=fsvxUVu/mHkc/SCReNrhgzJhSuqbC5dgsHzRYedOK36Y2FQWKk2u3rFE0kLFbGHvip
         wewAIzAKHTFLeKbKv9v2k541RmNYZTdQPxdjAmtT9j1x529yn3BJfUndMgjIhZxA6v56
         96G9hwU7T2jHHcrreXl2qQLLSOfqFuSI5mGsJvg6gNsQR7SK8r7+VwuNhg/qmJ1Tn88f
         Q+ZBmGvk1IECsAx9DH5PzTcs2pU/GzWnDN6lPV8coIpWOjZwMoTrbvyPG3E0RruWVBWc
         wnuhVmDFmZ7rUjEpPrSgJCpXg89ccqOAMAQNTmLtsKS6bsMmbwV8KfhZ88zmKpYHGbBf
         /YkQ==
X-Gm-Message-State: AOJu0YxWaWWFrq2iFGsONCQqxpIq/dwQZCi4zPPPYGlz6P4+yOgpwMFc
        gFDMVJtupHtHZegvpotXMW7dH1XkMmUBD8y6fAJFUIL7
X-Google-Smtp-Source: AGHT+IGkeqc+HH6QKzMRXeqlgdjaJUdRCYOkoCfeB0pVGiqrWzxii4ObrQ+2Zs3oXT6Rysn79knKAA==
X-Received: by 2002:a5d:4a8b:0:b0:31c:4c68:e73a with SMTP id o11-20020a5d4a8b000000b0031c4c68e73amr1770715wrq.66.1693405854836;
        Wed, 30 Aug 2023 07:30:54 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id z1-20020a17090655c100b0098cf565d98asm7270263ejp.22.2023.08.30.07.30.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 07:30:53 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4005f0a6c2bso74965e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 07:30:53 -0700 (PDT)
X-Received: by 2002:a05:600c:4f93:b0:3f4:fb7:48d4 with SMTP id
 n19-20020a05600c4f9300b003f40fb748d4mr325936wmq.3.1693405853267; Wed, 30 Aug
 2023 07:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com> <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com>
In-Reply-To: <20230830-fp5-initial-v1-2-5a954519bbad@fairphone.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 30 Aug 2023 07:30:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
Message-ID: <CAD=FV=WS2hgY=bQjLOs3Fdp8pbZyMsaS-0BpoxPq90Etfi+Xuw@mail.gmail.com>
Subject: Re: [PATCH 02/11] nvmem: qfprom: Mark core clk as optional
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     cros-qcom-dts-watchers@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 30, 2023 at 2:58=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
>
> On some platforms like sc7280 on non-ChromeOS devices the core clock
> cannot be touched by Linux so we cannot provide it. Mark it as optional
> as accessing qfprom works without it.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/nvmem/qfprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Are you actually testing burning fuses from the OS, or are you just
using the nvmem in "read-only" mode? From comments in the bindings, if
you're trying to burn the fuses then the clock is required. If things
are in read-only mode then the clock isn't required.

When I compare to the driver, it seems like the driver assumes that if
more than one memory region is provided then you must be supporting
burning fuses. The bindings agree that having 4 memory regions
specified means that the nvmem supports burning and 1 memory region
specified means read-only. The extra 3 memory regions in the nvmem are
all about fuse burning, I believe.

So maybe the right fix here is to just change your dts to specify one
memory region?

-Doug
