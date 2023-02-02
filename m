Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740DC687746
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 09:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjBBIZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 03:25:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbjBBIZ7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 03:25:59 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F69A258
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 00:25:57 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id k6so1053433vsk.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 00:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dySXG4mZAAK7k0xvpRqN+47QGjuEgNdkN7HEObQW1oA=;
        b=rJEEsof/MmsLjXWluFAZBoJOPBT2cDiV9CJUpO0y1rGVczlYwa20BN75TcXm8p4Yvz
         x8FIQcc5xAEvh7/v2BCUSU27Bpvm8lNWTlT3tIBMFp00kUyhNpPEEg5R80IA0hGfmUXw
         6s42db5fKy0OqLl08I8A8KosX7u465m86QyE5BcL3NKPGq8XZKI24h3alv8O2Ao78QRK
         QIrlNygLcT1LhdtHzAVfaGH1xF7Cxz5D832UUgSycsO2nfwKuB6Dblo2VtcDOfoLIepb
         TC3FKqh1RRNqxz1uPyo4ZOBrCRJqX5XWkpZCpG9N/GXgxC4a8/lF3DUm3EbaFa3OSduV
         si0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dySXG4mZAAK7k0xvpRqN+47QGjuEgNdkN7HEObQW1oA=;
        b=zD1ddZQGOhqRuDycegBWvqobPUhMwXP9unaLk1P7iNL8OUmcHavHRdUpohCDum/bhf
         WFAWiXLlH7zXCzh+eoZ/OImGaZj5IBmgQrggiGbf8Cd/6V+oYmbnsuJngwRvxQCgJvps
         vGf8FwQLKBveMjbQ46U456J6pMeq3aClj2GEFV9+hSqAMSs370NS0qaiYAXrgsyAU559
         Gm16tfy6ISwy22xDqJaD7oHOhMhRa4bCKJfxUSgpznLnhtC8yHnXGPBefAQcKW6/wCOm
         IkJW0hmaqdkogNuhCgyisybysvBE9aQN5LaDriWNPqpd3e1nnG++CEnX4SKJHZl5Q8Hp
         JS/Q==
X-Gm-Message-State: AO0yUKXJz506I7anCYWmASN5lycC1THUWGT0daVeO12ORfRLomC/4D4a
        QdHPNagEKMSw744DfM5Zks75kNVPBo1Vqwv/lWIlqg==
X-Google-Smtp-Source: AK7set/zlobdzp0LIIzLsRU3WPQnJbsxhDsOriAVNIOEhGcv4WVs2/wcn7b35rFFhbtcBatzY7mRPkcviIgVIiBCwpo=
X-Received: by 2002:a67:e002:0:b0:3fe:b46c:7889 with SMTP id
 c2-20020a67e002000000b003feb46c7889mr990452vsl.78.1675326356657; Thu, 02 Feb
 2023 00:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20230201150011.200613-1-brgl@bgdev.pl> <CACRpkdYEQkxEJ23Xt4hjwu3Jxct-QXZktdzze5Pf6SBNYj80Fg@mail.gmail.com>
In-Reply-To: <CACRpkdYEQkxEJ23Xt4hjwu3Jxct-QXZktdzze5Pf6SBNYj80Fg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 2 Feb 2023 09:25:45 +0100
Message-ID: <CAMRc=MdDwSi+DDJmn3Yrnh5m8EK5EJEfLrejXHN0+0k41DKx3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: add dt-bindings and driver for sa8775p-tlmm
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 1, 2023 at 11:46 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Feb 1, 2023 at 4:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > This series contains the device-tree bindings and the pinctrl driver for the
> > SA8775P platforms.
> >
> > v2 -> v3 (Changes in DT bindings only)
> > - fix the gpio pattern property (platform has 148 GPIOs)
> > - add blank lines for better readability
>
> v3 patch set applied, fixing the 149->148 number in the example
> in patch 1!
>

Thanks! Seems like only patch 1/2 got into your branch?

Bart
