Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21A96CB10F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 23:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbjC0VxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 17:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjC0Vw7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 17:52:59 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AC23A88
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 14:52:49 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id p203so12616892ybb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679953969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLI5m06f2WlStlUywkxHpgfVuIZ5JS/MDTFzEPNuSfU=;
        b=pOSHTN0gxWzMWkqyiNymvzEciJmMzDynaEbRFezy7nLLDqD1LINJt9Abz9IIuoPrea
         w6BYlguZiNT/hPuPXgbYFH+nK5VQNYOCmkfeTEJcefvBQi9za56UC8iqta+AKeLauOTu
         BYL0/iVJoeimYgwvs/tGLDATSN9mnXGj/ZTsNmgMmjZWjqUGqwweml9p3K3ISlDJ3pRy
         FJb0uOBeoz+CDw0gVfgEvWnExyi8ZW1zUmJYIiBbYreayGe/FxZCi8XsTr1Ox7zjK0S5
         OocDVIB4YAfd2kuVypBdFKkODtS9bY96MYlXVs23YNcbgJMXbEQCjP9ECgACofB2FL3i
         aWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLI5m06f2WlStlUywkxHpgfVuIZ5JS/MDTFzEPNuSfU=;
        b=WudDK4t1QmgGfWtpsiR6cfqYjpW9p+BkJDUCUutcxZcj+zWuza6qN+2Pk5M09i6hPG
         LmToYBw4gZdU65HnIBLDuqmnYqO08P2sYsPh+FtDcdXVx+vhZaIuHzLuHF5zC8DtQUV+
         6HUkyVKti5fQzH0CY/k8wksiAr7aIrnTXfQLmv7tDH2VdoBlj0xgGKR/pzvQfU4HC3kl
         k/eocJftfBiVPHlwNb+vWkCMoeTBVXMgJmEFcIf6h7/9RIPdhrf3zthWKC/fIJLKwTbp
         Ovl4Ir3byNKrmOEG1mZsqbYiPT5TrT5BMhFlKhdewE3qimYuYng69bcyMSpJezZ8+SzC
         X8sQ==
X-Gm-Message-State: AAQBX9cF+90sm39l3xT7HrJy6BgxrCMoZpgpmGw1GxZVQ3CmV7ysAI+K
        SnXyi66DHu7pe40ZX6EVXVLgxsKdG+cJAQuxn+8Aow==
X-Google-Smtp-Source: AKy350YXWieWPPn4qPNXsbtFZBIPGWFVrw4KqEcgFae4NZrCaiM4DhD+RmS9uESY7KP/zdWUYuSeFcGkhfdSERGtuKw=
X-Received: by 2002:a25:542:0:b0:a6b:bc64:a0af with SMTP id
 63-20020a250542000000b00a6bbc64a0afmr8149446ybf.4.1679953969020; Mon, 27 Mar
 2023 14:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org> <CACRpkdYq4jE7Qn1w8iPeGz7vxj_CeZ+H48B0TVYmeF4Tt=kHgA@mail.gmail.com>
 <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
In-Reply-To: <CAL_JsqL+nF_WwZ-EDpUSD2yrxPLZWxaeb=WpTtPnnbpgcXT7qA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:52:37 +0200
Message-ID: <CACRpkdbR_PFSkqeK4xAmxdfdhi332hyax8jAnEa7VXFVp=QEDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 3:33=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Thu, Mar 23, 2023 at 3:40=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Sat, Mar 18, 2023 at 12:36=E2=80=AFAM Rob Herring <robh@kernel.org> =
wrote:
> >
> > > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> > > checking for this can be enabled in yamllint.
> > >
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> >
> > Should I queue this patch by the way, or do you need it to go into some
> > DT-related tree?
>
> Stands on its own. You can take it.

This sadly conflicts hard with my "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Cause seems to be major refactorings of Mediatek and Ralink
bindings.

Yours,
Linus Walleij
