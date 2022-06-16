Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 539EE54E1A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 15:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbiFPNQA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 09:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiFPNP7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 09:15:59 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F283ED31
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 06:15:58 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id w6so2132835ybl.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 06:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=PZJxPerUVnWQ+ZJJXabeQPCvU+odG2XM/cCiTR2s9bg1u+Kq80JX5ApFI/RzXK0+5N
         91YSIyl3oArnIPhPglVuZa3e9yXet958I4d/aO29mbsfdc4wxqC+2Ha3GHxRa7P+C/W0
         /MeUW3hhtK1/8mt84BKomTg927useCl9wQUSKU9FmvhKIMrNLBmnrhUc6Q4NF8cAc8mk
         ISrwiouIgmkW9h2OrdhUIyQlvlxunlAeC03V1t+VlOn4UBEozATF/u6cpGazZNV0c/oJ
         OgqMMNyBlhjXRfOdGukXu/bRFb/aQF/PlDjPiPinMUucqHC6ndgFmuTlQ5RWfPsM5sUQ
         QFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=gHrggfs05HAsOmSONbpFcFwAdrYrMQEHSUDMmLobhMNCCIdAzlR1SWMahxV5sXx/ZM
         nHfTslHYEYLBW2WD+QgCmzC3n6ck6BeJwsX/YzV9HyzJuZR232vlVIRXTa0pCdzIQuYT
         21vfyAQqe+Jo7pqfIAeWApoPiHEfHdpV0SXxsxzAxW/KhimQQubwsl0645cTV2QB/0EE
         tfLPnk6oZpHv4fx8gow2bOYGrLJAviiuz5oD515oZ7UeBnd+II2LmYGY+LNC6u7C0kv5
         rGgAlE1bxswo49YAFpQRNGOpZkqV+1wcK1XD7GC8xHfdZcS+t4r+j8FlGwW30SeO8ZBe
         M/rQ==
X-Gm-Message-State: AJIora94FBwlEObTlZjgYbK75/4r4MUT2yQ030NWqapNQS5qEeb6WmZu
        y8jBc9RfiajuVrk35MYVzbM1zuBeWlC9VhjQFn9zuw==
X-Google-Smtp-Source: AGRyM1tKpRdJdPfQy0oaslWa7sXFz+A5JxujSmEL8Ch+XWKV8Tm8gJp6YIJusqmVvKOdq2xVRX8SI1z84IJEfDM3b38=
X-Received: by 2002:a25:3417:0:b0:664:aab3:7c44 with SMTP id
 b23-20020a253417000000b00664aab37c44mr5143357yba.533.1655385357716; Thu, 16
 Jun 2022 06:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-31-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-31-nuno.sa@analog.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jun 2022 15:15:46 +0200
Message-ID: <CACRpkdbTkyd0zwXU-7O-n3HejHhY+Vg-QKuSpatZ+O0QPgqbag@mail.gmail.com>
Subject: Re: [PATCH 30/34] iio: adc: qcom-spmi-vadc: convert to device properties
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
