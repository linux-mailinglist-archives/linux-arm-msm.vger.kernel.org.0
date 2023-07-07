Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D17774ADD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 11:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbjGGJeY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 05:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232177AbjGGJeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 05:34:23 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5DF2108
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 02:34:21 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-bd61dd9a346so1799255276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 02:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688722460; x=1691314460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saX3pFAboAcYrHkIs/SI1SEfN7MogeSF5MWoGtRMhFk=;
        b=tKBHmQhdEqHIX9BwfY1SbILP0xtBAtAEBgnp60bPOiB0PARs0VGJapZZObxOAYPzob
         8S9c8CGrMLscX7N0s5/idB3/STrzWHy9oaVEktZFa0VRFGEuSDCXnQFMv0L13N4CBMxk
         p8pRTN2CHhIY56dyDbRLRTwGKtyeg7vcpr1Nd/vZfqQG4Aox5ANsXd53QryhJTlN+dRN
         xUbMEwRwinN4LxNfqAChlUJCweJmoeYFKT3v42My7/WMj2b7vvRciEuEUvn5IJrK2dWj
         hDUR3WHh01MVsTWtJqseun93zMx2WNmzS2h3kPeFm7zzQXvQznWld4vxbjD2vSpmZS6n
         zB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688722460; x=1691314460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saX3pFAboAcYrHkIs/SI1SEfN7MogeSF5MWoGtRMhFk=;
        b=kpkxkOER6VeuhiT/YJxT30Q9Wx1O4swBlw5UQokhIk5qd4yqk2O6VCirIEBgS44Y6i
         XLhxONuMcgcuYk0fWi6vKT/KTXaknEyKF1xvcgTgJMJeQ8USyTixffYdCZtlcmZqLxIg
         iQbyCJU9d5K/eWMNv29na2pqahubSFU4IUhiCkLGIAjg8yz99DaqTBIEvWm44UlE/kEk
         fu1Ielx8/FrqerN55JBifAA5T3dfyyFsgjSDpCOt4LHX1ExAR3I53vz9FXrm0z2I7EQz
         FGn7e4r7hEBnsSSxovVxe/YaLPiFyKgjwm+AY/09NJoR7N0DutdLfeTSHQ71Ft7k160A
         pOyA==
X-Gm-Message-State: ABy/qLaIegpg/+YFKUnD5sc7vhWqQj6yW2lO/IWG30eoBCeTXrYoqV1D
        HQlNlB3iALvfewXhNngq5EUUjLosWUDedV4lkOSDTw==
X-Google-Smtp-Source: APBJJlHjQReiyHI7JmsXYBFcwy7JZZqVtQoKWdLHJhl96Gf33wc5bk2N9yTDiaKvkgT1IOsbohnign+l1TnLkzIZ4Kw=
X-Received: by 2002:a25:8f89:0:b0:c5e:cb99:6346 with SMTP id
 u9-20020a258f89000000b00c5ecb996346mr3668707ybl.14.1688722460628; Fri, 07 Jul
 2023 02:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 7 Jul 2023 11:34:09 +0200
Message-ID: <CACRpkdY0WKDAx1XP6fq2WZeoK6kH+t_weYJPJm1aMnMKb7ZayQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/28] ARM: qcom: apq8064: support CPU frequency scaling
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jul 2, 2023 at 7:43=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Implement CPUFreq support for one of the oldest supported Qualcomm
> platforms, APQ8064. Each core has independent power and frequency
> control. Additionally the L2 cache is scaled to follow the CPU
> frequencies (failure to do so results in strange semi-random crashes).
>
> Core voltage is controlled through the SAW2 devices, one for each core.
> The L2 has two regulators, vdd-mem and vdd-dig.
>
> Dependencies: [1].
>
> [1] https://lore.kernel.org/linux-arm-msm/20230702134320.98831-1-dmitry.b=
aryshkov@linaro.org/

Just because it looks so cool, I applied this patches and the prerequisite
to master and booted the result on the APQ8060 DragonBoard, and
it still works.
Tested-by: Linus Walleij <linus.walleij@linaro.org>
(Mostly for the DTS refactoring, which is what affects APQ8060)

I guess the APQ8064 cpufreq and APQ8060 isn't actually far
apart, so it should be possible to fix APQ8060 as well, but we
can take that another day. I always wanted to fix the SAW2
regulators.

Yours,
Linus Walleij
