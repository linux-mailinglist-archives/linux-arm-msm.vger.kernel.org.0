Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743B75A08F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 08:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235427AbiHYGkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 02:40:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235390AbiHYGkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 02:40:37 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A387640
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 23:40:33 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx38so18452717ljb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 23:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Hxs/x32k0wl5TtEJWin9IF/OZYyYHuwn2WA9sVkAPH4=;
        b=ggHLVlPzMVeo5o60HoxiBTPeE4b7XvUvw7wCzxVRNSSxvZrDzA0vum3fttHKJZb1fR
         ST8lBPut9MqchJJeAk+l32ls+cCSMyClhfXUvVYMKIEhPoNwHBoIrhjkvVDI2hc/QbDh
         pgjS3TRKKqt46IeSOS3sTeECjqy8EEbXyu7dFuu5GTwYGmOMnU7ROusgefK8z35FK/e4
         0i7ICMCPQxxrz3krhI1mirSmSzgAmZGdmZM6HYzcNk4VNzZvSWefNz2tttcalQl43l/V
         lqnW25YgvOxlavOf3rM4vrivoTNbdMcBJLeQRPCXEiwVKsJ3WVtb88F7aCzDu2UXWzKs
         F5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Hxs/x32k0wl5TtEJWin9IF/OZYyYHuwn2WA9sVkAPH4=;
        b=oAaAfC+7akSvPmv79e8RJni3W35nkIlZGW+19riOY+lG33uindPAHvltyDEcuE4kIv
         MEP6vjZE1seqIx31QniGNg0kOxyuzARS0kazCYUH5MATn4kwm+/OXwUGk5BVoW6Ewym8
         v+6Id/cnpRV2pJx6JwNLixWg3vPkCfDwWAZswEn+a9aU20yQt6DExrWeBvOAVsIP1Z80
         E8asUg1sbwIO4fgGKFNUiVwCnBb0DCtC6CSoyAhTNRlsDo/ZXL3f4DkW52JYg4iu/If1
         Qd+1UO62GC/phZn93pzbm4uG3rTo1hTXw87rNG02YKbz7pEI7eFNTj5gRv6OaMQZilnr
         Logg==
X-Gm-Message-State: ACgBeo2pOiJqbQ25J18y9qQEH2T/tGtvxPjNfDXRiP3iNMsS7UGTE2g9
        0YcXYQ/c7OblnKHnegYebJhU8g==
X-Google-Smtp-Source: AA6agR4sp9L/aoyZrx2uYhRDhFUfFvBZsJbtMUKU/6yfJBjXbHfPdGvgpeQbd0c1lWSvZ8iGu6FKYQ==
X-Received: by 2002:a05:651c:b2c:b0:261:d82f:75b8 with SMTP id b44-20020a05651c0b2c00b00261d82f75b8mr601195ljr.266.1661409632356;
        Wed, 24 Aug 2022 23:40:32 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b00492d7a7b4e3sm339246lfg.4.2022.08.24.23.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:40:31 -0700 (PDT)
Message-ID: <e5239fb9-07fd-3263-76a8-afb2f89b7d7e@linaro.org>
Date:   Thu, 25 Aug 2022 09:40:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ARM: configs: replace CONFIG_NO_HZ=y with
 CONFIG_NO_HZ_IDLE=y
Content-Language: en-US
To:     Stefan Hansson <newbie13xd@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org
References: <20220822161018.16101-1-newbie13xd@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822161018.16101-1-newbie13xd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/08/2022 19:10, Stefan Hansson wrote:
> According to https://www.kernel.org/doc/html/latest/timers/no_hz.html,
> CONFIG_NO_HZ=y should be replaced by CONFIG_NO_HZ_IDLE=y for newer
> kernels, so let's reflect that in the 32-bit ARM defconfigs.
> 

Thanks for the patch. You did not send it to ARM SoC maintainers and
their Patchwork mailbox, so I don't think it will be picked up. Please
resend with proper Cc list to ARM AND ARM64 SoC SUB-ARCHITECTURES
(COMMON PARTS)

Best regards,
Krzysztof
