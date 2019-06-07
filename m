Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6D939968
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 01:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730655AbfFGXIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 19:08:36 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35711 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730543AbfFGXIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 19:08:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id h11so3108970ljb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 16:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CJjAb+Z5ioBZ0AM/8mCFtzkkLn/OKSEL3IHSOtuKgfQ=;
        b=FkVCVtLwoVP2xNToV3V9nLLFBH8qK0uahCMEKeFCpaR2z9IF0rpEg8YFqnUmGXZsgq
         DfvxttPbgwKv51MItse2JF1YQ5TsRI5GCwNHRb9IYez7H3NYfXRNHgXB0gnp2gTndxNB
         LwkbDBxTrRmHrzyvFF13obVOy9KBAFVFFzTocL3+JUOgAFqMpgZ+U41+ABtrRyWnIodz
         eqN5ctPHY09xzgpkZFV2Tez9dxUvSL4e5wfFHFtt31VxWoUedzV9qMV9ZKUB51qacrdz
         tTCqV/urQYCK3kC4ka+GuQTTXl3BE0wjaSiIPmANYwxUqfk3h0q8w6gczsAnBL5+4gOe
         vC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CJjAb+Z5ioBZ0AM/8mCFtzkkLn/OKSEL3IHSOtuKgfQ=;
        b=S86xosSkzQPWQYV1z3bxu607WpC4uUGSl9GroZzWONiFsv59LEbtOkJcR6URl/qwEE
         AlaJPNTbb6VVbZoTaR+U609J3GZwnuw9ar+q59Hah/FVM9urB/rBHzLoVKXMhqwhTYfh
         1QiKupBb290Zor5aTyEGzFV5LRpFoNHxmc9715C/cHFZSBGi1JAqxBak0gXSaxK1HkkT
         i4zHFP4YJakQkBReqh5+gAUtV0leh39NJZcYOJ/CSQ3b6dptWAPx5NrCzNGvbdqzZj+H
         sIvmbyHHNDZLfc9bLbompE3YUoxGBWjMxrU4uMiVLRothxkMMeyTWeR0G6iWYNo8QtEw
         RVOA==
X-Gm-Message-State: APjAAAX6Wa7K6w9SvyA0ER2Zdh2Bx5/3Qmew5PJJkMC0uUS3ll1zjssL
        IwbqLbgjGZGYWwSNDc6kb1z43hz/XeyR9VCDOHlNpw==
X-Google-Smtp-Source: APXvYqxUOi2ComwroPYJqL0+HmrxnRaNzTbxCzwrLY351hzZwjGfd8PvKzmcThTDM6zJHWY6X2LcwPf0/66wKSkFxIw=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr19985474lje.46.1559948910013;
 Fri, 07 Jun 2019 16:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 01:08:22 +0200
Message-ID: <CACRpkdbxUHR8Uo+M7+_0v77Pg6k_jmL79KeHKNzWmFhtq+mZXw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add minimal boot support for IPQ6018
To:     Sricharan R <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote=
:

> The IPQ6018 is Qualcomm=E2=80=99s 802.11ax SoC for Routers,
> Gateways and Access Points.
>
> This series adds minimal board boot support for ipq6018-cp01
> board.
>
> Sricharan R (6):
>   pinctrl: qcom: Add ipq6018 pinctrl driver
>   dt-bindings: qcom: Add ipq6018 bindings

I'm happy to merge these two if I can get a review from
Bjorn Andersson on them.

Yours,
Linus Walleij
