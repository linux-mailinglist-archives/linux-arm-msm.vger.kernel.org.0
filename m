Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C952054D5DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 02:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346210AbiFPAO0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 20:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348088AbiFPAOW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 20:14:22 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C635034B8A
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:14:15 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id g8so6545850plt.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=LwNIyVGl6P4q0gd7chMhSD65ZMv4OXZcE0ZHZHBWVBg=;
        b=fLjfQ6g9D6t7DbLzhTEj8+KIW6cx6uH3ZXhKouWQK1Q+B6ieJXymTthUGW5ECpB8ZC
         5TJ79PUaWJ3LBhLI3cEJZKCPaZl+JTuti21cALWrdbOUC0Iy0HKxKijGiW+M6qLAddqz
         Tt8soxYtqFYboG5mCYJWA6yHHzToezDon/P2XsKv/VOPEaoPw3jIJdFVMIta7pqfr8BE
         3YE46EzaPwe+lCa8Z4GgRNDOkixePTjPd1VLt2O/ECtRPRVytcS1x+ALIMd5K2EBwPlY
         fCKhQXHwxvrlX5Gw1AaMHrEAtVJckd+mh/SJEOskOKrtHZIMIgtqpOefkbaibthwXvmy
         5dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LwNIyVGl6P4q0gd7chMhSD65ZMv4OXZcE0ZHZHBWVBg=;
        b=AP2u1zMB92IHMkRCokk3grxcXMtgnXmq4ySEL7MuzynJ/GMmTh2xSR3AnWNiK/Of9b
         R1fnW857VCyXScepIQcNXdtOMMiIoCzLV81t2rMUpck4+HkUoX26scqUMHsu+AaDR0du
         kB87p9EsUiZ+aJ4+i4K/e/85oXoCnXD8NPKxOxBwpBAn6g7TmKNpUOSPoxo6QOBmZeN8
         Q4ixCU9Y1wpUMndywXki9AcAh2dl/8fSJn9mLQGDEx1RKIgjo4XsqmM+vpoXi1zFd0dV
         fx6ueBWZKQeVJQN51vtjYZj83VjtgTN/z23zapa6yfqq59ZXMX90J7ZoD391lVqYT7M4
         5cVQ==
X-Gm-Message-State: AJIora9bLNCFAqJ9jaUofKAR2sR4TlBOPUhc6KPulaZQEySQe7dtAqvD
        Lqb0PhOUnJy3R82vdgBaRTxMwQ==
X-Google-Smtp-Source: AGRyM1sQOb+rad8pqIV9YhewcZC4WPd7DgSUhozcuO72HEHuc2mD+EjlwkpfXKkIGoK/O26/OL83kg==
X-Received: by 2002:a17:903:18f:b0:167:47f3:4a with SMTP id z15-20020a170903018f00b0016747f3004amr1818855plg.70.1655338455266;
        Wed, 15 Jun 2022 17:14:15 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id m22-20020a638c16000000b003fa95b940bdsm169537pgd.88.2022.06.15.17.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 17:14:14 -0700 (PDT)
Message-ID: <394e551d-c81f-5c06-3291-748a18713772@linaro.org>
Date:   Wed, 15 Jun 2022 17:14:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/6] arm64: dts: Add missing space around properties
Content-Language: en-US
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220612223201.2740248-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/06/2022 15:31, Niklas Söderlund wrote:
> Hello,
> 
> While debugging an issue on a Renesas board I found a typo with missing 
> spaces around properties that had been copied around [1]. This extends 
> this fix for all arm64 files.
> 
> 1. https://lore.kernel.org/linux-renesas-soc/20220608175728.1012550-1-niklas.soderlund+renesas@ragnatech.se/
> 
> Niklas Söderlund (6):
>   arm64: dts: broadcom: Add missing space around status property
>   arm64: dts: rockchip: Add missing space around regulator-name property
>   arm64: dts: freescale: Add missing space around properties
>   arm64: dts: hisilicon: Add missing space around properties
>   arm64: dts: qcom: Add missing space around properties
>   arm64: dts: ti: Add missing space around properties


I think you just did quite the same work already posted:

https://lore.kernel.org/all/?q=f%3Akrzysztof+%22adjust+whitespace+around%22


Best regards,
Krzysztof
