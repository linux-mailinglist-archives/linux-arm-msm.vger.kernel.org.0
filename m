Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5F97CA39D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Oct 2023 11:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbjJPJKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Oct 2023 05:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbjJPJKe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Oct 2023 05:10:34 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E81EB
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 02:10:30 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d9abc069c8bso4313036276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Oct 2023 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697447429; x=1698052229; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=guQPwERqmbSLzSooVd6YufMruj6qPUsQ0NJuOYONZV8=;
        b=UzW0mQ18HYp6YBW86q5rAqSxVT7feh4y7gARycMHDhoFl+QI2kpxPQOlGdl2pRKYF6
         zauv5e5rmcw6uVE/bUEuzDEBjkHWuQAChwT8v0P84nJMt4elO1DSWC8maafSqZMKJyzy
         ewR5N3FCRmd0sp0PsGhyENJvFhvXHkzocDzYp122X2fw9in3W/4YqkcjaDS3Ok/bB8kD
         OpBECv30SQkgv8fpN2bgnATmweSQQlsXHrxq4JGyrJjx9rsJqGPiO4ADAcE/OULABbII
         Qt0xnzRVUr4hXAj86p3xWUxBHDdXuAvklJjdn5qJM1olstXCHTVDKZ9OsxvNZxjCGzdS
         N3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697447429; x=1698052229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guQPwERqmbSLzSooVd6YufMruj6qPUsQ0NJuOYONZV8=;
        b=fkFZUxmp5kUjqiy3D6XGj/xSAVDJYNH9auopaj61Nso2H26H9w0tD5p1P/U5y5TM0Y
         WhQXWjgx7eNNg7uw6vK6BMjWw3QYBArU0Ndol98mk0mG4iWy/sFzqUdR37lV4CovJ3Qc
         RGBAbep3xWiD5jmmtKfwrI8JM3JL+ns3clIMXnIabe72IekMAXTluQ0djxauGT85RvB7
         fjY9/ruj/1cuAQB8QAad6pSR+1+D0AegWoDRYOrAahKAF2oDl6sm7TP2HnvoeyAO8Hh3
         Ll67FVZWn93mIC7QIlIEgmzH0oAMYgOTiixzCpKAw0NAz6/P+EcwapGD65NQO9HWQL8S
         DDKQ==
X-Gm-Message-State: AOJu0YzmtJGLBJMSnOb+3EESWtUSUQekTw7aRf/FmxIo6e2NZrSlwinf
        FeAWbaWe9wXLpOL6dMj5YqreNJjzEcAcEV/cSuBq2g==
X-Google-Smtp-Source: AGHT+IEipLFuUHaj03dCPa+NLWOhQ2iBypofZTx9FT231tcwWJ3nORz6xeMQ828d5I4aN/9HcL4F2UL/3nAKisR9Nto=
X-Received: by 2002:a25:bcc6:0:b0:d9a:4da4:b793 with SMTP id
 l6-20020a25bcc6000000b00d9a4da4b793mr16728922ybm.62.1697447429585; Mon, 16
 Oct 2023 02:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230929-topic-x13s_edpphy-v1-1-ce59f9eb4226@linaro.org>
 <CAA8EJprXCzVyaU49qgVcVfF0-FJ3QqAfTMZj5CEZm187hoi4=g@mail.gmail.com> <ZSz7---IW_7Oj2Zr@hovoldconsulting.com>
In-Reply-To: <ZSz7---IW_7Oj2Zr@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 16 Oct 2023 12:10:18 +0300
Message-ID: <CAA8EJpr=HQOs8Ho_s_34y0-krCHwq3MThMkUzhOkPVdOSMQ62A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: Use the correct DP PHY compatible
To:     Johan Hovold <johan@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 16 Oct 2023 at 12:01, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Oct 16, 2023 at 11:51:33AM +0300, Dmitry Baryshkov wrote:
> > On Fri, 29 Sept 2023 at 19:03, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> > >
> > > The DP PHY needs different settings when an eDP display is used.
> > > Make sure these apply on the X13s.
> >
> > Could you please clarify, is it the same PHY type, just being
> > repurposed for eDP or is it a different PHY type?
>
> Same PHY, just different settings AFAIK.
>
> > If the former is the case (and the same PHY can be used for both DP
> > and eDP), it should carry the same compatible string and use software
> > mechanisms (e.g. phy_set_mode_ext()) to be programmed for the correct
> > operation mode.
>
> Possibly, but that's not how the current binding and implementation
> works:
>
>         6993c079cd58 ("dt-bindings: phy: qcom-edp: Add SC8280XP PHY compatibles")
>         2300d1cb24b3 ("phy: qcom: edp: Introduce support for DisplayPort")
>         3b7267dec445 ("phy: qcom: edp: Add SC8280XP eDP and DP PHYs")
>
>         https://lore.kernel.org/lkml/20220810040745.3582985-1-bjorn.andersson@linaro.org/
>
> And you'd still need to infer the mode from DT somehow.

If it is the same hardware block, it seems incorrect to have two
different compat entries. For example, for PCIe RC vs PCIe EP we
specify the PHY mode from the host controller driver.
I'd say, we need to fix the bindings for both DP/eDP controller and
the PHY.  See the `phy-mode` DT property for example.


-- 
With best wishes
Dmitry
