Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00AE454CB4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 16:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243483AbiFOO2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 10:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348976AbiFOO2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 10:28:10 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAF62FFD5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 07:27:44 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id x38so20797776ybd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=M0lG3b8vfMcZ/7Ka36O1ZxSsUemkOvvlFAQXkpVQ4QpCs+1BTt67QSw4HKiQD5WOcb
         52snuFlKH/21oU1OKHImIEHhsr/qfhoQOlanFV+m4TeEl8ICjJe2Sd491tUIQIDSw5Bq
         xHExXe7XqUhLlIhXKD4i9kKCqB5PLrMMw5aIrSuv673UinrPE2m5a9fMdvB5OZ6CYFIq
         /u1FbiRcfzMPM33M1qWbZlUZBeX0dAiMnD8nksss+jrH8U5wAD3bdbqxbououS4Wce5+
         si5vaEILsaJTJRlA5Tvc5IU5RHPyGLfiWb4X0xjPRiEJMgOmZeod+1F/8J2LCdxK/urt
         bp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=uI41BLVDwHEX9ddfyE870xcj5d7huWcXMjXhSBQCWSP4IjeS6trrse1sECwZ1/HtWg
         NQZPEaweOQFovZ0zZwzWGvgji4WiQmuV+I2oc5bMpsEO9Nz64MV2KmUo/RXqfzZjgxFl
         QSE8HNW3oTNL8YReLSVFfZuxrcpONzgE+I817kR38A6+1gItIFpVOresMqe4dTslvOc9
         qtxMkx14CHvVrPhUn5L5YczuzRdcoUuzOSGKHjIR2yu5VzwSWw4aKBBo3aftdLHTy1Nx
         qivV3Y5JcK2HkzMG1/k4LTJxEa6/uL061HbQs/HftMNnrFlR1lil6EaiRT8srcbFiBwF
         OP2w==
X-Gm-Message-State: AJIora/Hg+ebsEO0K51L8RNM1/DAJh6HtyzalQw51flaRifYkuPoLVxf
        +Af5UOPvv9F6Tp8kf7DD59vIYJIDyy5fWixRciT9Fg==
X-Google-Smtp-Source: AGRyM1t0twq2NH5TwVMffJ95BCvjUqTPe1/bY9PSUuCjeVYRJKVWPPGecH5Bnr87yp5uioRcTcWI/9qkOUV49rzlV5c=
X-Received: by 2002:a25:8387:0:b0:664:7589:27b9 with SMTP id
 t7-20020a258387000000b00664758927b9mr86691ybk.291.1655303263361; Wed, 15 Jun
 2022 07:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-30-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-30-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 16:27:32 +0200
Message-ID: <CACRpkdYtBY9bWevrWNL+mXz8LbsdDEFmGvrmPQ85Mn=yZ=FyHg@mail.gmail.com>
Subject: Re: [PATCH 29/34] iio: adc: qcom-pm8xxx-xoadc: convert to device properties
To:     =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc:     linux-imx@nxp.com, linux-renesas-soc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        chrome-platform@lists.linux.dev,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        openbmc@lists.ozlabs.org, Cai Huoqing <cai.huoqing@linux.dev>,
        Benjamin Fair <benjaminfair@google.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amit Kucheria <amitk@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Benson Leung <bleung@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Patrick Venture <venture@google.com>,
        Arnd Bergmann <arnd@arndb.de>, Nancy Yuen <yuenn@google.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 10, 2022 at 10:49 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
