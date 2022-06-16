Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058E954D5E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 02:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346086AbiFPAPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 20:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244761AbiFPAPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 20:15:11 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0CA39BAF
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:15:10 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id g8so6547279plt.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QhMTt4uDdPDX7crPsrwX6noLLeOOWLBWTCCTPNEBLmM=;
        b=ru5SsmRKk+Sojj2R6znJyM93vwJ7wUai2a8cObSwMmzN4YNgCB8JlYLiNn6znXJiJw
         SAvClZQc69rn1bHRRPg/pv2SkIuy6tRiluZXuVPvnXyG66kQLUsjoDsryMh1AEFZdoBm
         N5eAi3pK6T9OdzTPAP6rYJjUR1OQWbJfZJVYPYUKrplu/6xj+eCh0TX4HHgulORQXKS3
         X61E1+EKCfmPf76M/bhT990z7uaKcMpFMfs2SI1Uq+qjimHQuuqHao67XvAFXVlFx2aR
         XeqXC7yQlCPPKxLzsJXyrUNScFdz32nXMBgNITb1BIp89n2QhWU8MNVkTS+MkjXfTGfY
         XnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QhMTt4uDdPDX7crPsrwX6noLLeOOWLBWTCCTPNEBLmM=;
        b=bUaoCRUPGuzjpuH9YboA9lhZUNeW8t0Atlm2cr9hOKphGyGGapxTomGt263SVOcmd8
         qZH8eAAf31SvJs8FeWhX5WtDrKOFSPOra6wveG24YnJDvLGF4JRS57FNCeS48IjJaXRZ
         tA6KYyp5LI9kj7MaqVHX+zTDLXOXpGMm71I191MD1NYTqZggjXQ+LWarPRctyMLZLQt0
         ES0znfR5SmP4XDjCd0W6jFGM2Kd0b686ISc8XZiQz4loudGsrDEvF1ABvz2ENF5wQ9+L
         2abEKJrIkrxkpU22sp1MW13iz3nf/wMCBvpjjJ7qSYm+DTQBBI1Y5eZaYa4f8fR72aqu
         se9A==
X-Gm-Message-State: AJIora/YcwpU6Gj5fKafqP0G3rm2cga0CBE/30mno3WhpCGXOM/P2GNH
        9p81bGpwhNIp3i37s9yP2zxJZw==
X-Google-Smtp-Source: AGRyM1sl2+qWzmkjduELBjaJmA4KbijZZrqkQHtEjfdM5ktH3OTsfeL6DARSLKZrTRgoSsLz62bp1Q==
X-Received: by 2002:a17:903:41c6:b0:164:1050:49ac with SMTP id u6-20020a17090341c600b00164105049acmr2017881ple.138.1655338509561;
        Wed, 15 Jun 2022 17:15:09 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id o18-20020a629a12000000b0051bf246ca2bsm225127pfe.100.2022.06.15.17.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 17:15:08 -0700 (PDT)
Message-ID: <2e3422a3-6f4d-235d-e66b-8c9597aab232@linaro.org>
Date:   Wed, 15 Jun 2022 17:15:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/6] arm64: dts: freescale: Add missing space around
 properties
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
 <20220612223201.2740248-4-niklas.soderlund+renesas@ragnatech.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220612223201.2740248-4-niklas.soderlund+renesas@ragnatech.se>
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
> Add the missing space around properties before the typo spreads to other
> files.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi            | 6 +++---
>  arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi           | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                 | 8 ++++----
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi                 | 8 ++++----
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi                 | 8 ++++----
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi                 | 2 +-
>  .../arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtsi | 6 +++---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi                | 6 +++---
>  8 files changed, 23 insertions(+), 23 deletions(-)

Please rebase on top of earlier patch:
https://lore.kernel.org/all/20220526204258.832179-1-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
