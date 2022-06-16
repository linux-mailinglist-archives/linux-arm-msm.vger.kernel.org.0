Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E387854D5E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 02:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbiFPAQ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 20:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345815AbiFPAQV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 20:16:21 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6703968F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:16:20 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so282041pjl.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 17:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0u5DkK3CDY/f+3CDZHfPfb+Kz45RP66UnIaqAL+o1Xw=;
        b=fiiTsE7dkdwuTIx/s63P6TMPZ7FKgTzsitulk+M/aVHuy3v/QmM9eUZMxfAUbO2Z2R
         Sf7ydiIR5s1yi6KlVQ+ZdXhW+bgCBlOZgTn8926v2ann58uw+kY/nFkSSQBRM+QTGlX4
         gu9RiCkzkLkD4jSeuEqkPwNgneok74aHAc+1jYjmorD622RjOwODXIn5KC8erdksvoQa
         +kHY/AGr/1KyBsyPXrSZSEleVs1A0rMUU1veJooMHUChG/O/mL8b/KCfOwqe8j42hKKd
         rAppQsM1WHAMheYyr47xIIy+cHm3CVt/D5TOo4n7whSqIePJEINJHbr07mpjudILtYOF
         cKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0u5DkK3CDY/f+3CDZHfPfb+Kz45RP66UnIaqAL+o1Xw=;
        b=bdRkYadA5W9t0f42dyKj1S5bDFbsYa7DHdyyylFG+FgR8zcjNdi1erOGny5OylreuF
         mp8Bl9miuQssonBbUWoZMkJsmgonfLm57uzXcq4igwUi6C5eL9OPdVwGWTP4HUVP9IOn
         P29cfz/oJ+uSr4oie4USod9KdaUHwaJ5xbcgDca8Vc7lVSEcvuaJHUsDYKnOL2xDxK55
         SwHqGuXr7oWQf/GNdy3OaHVmRbA/g+pjqWovygTicgKCbILxRwKmXg6JhptbSANbkn1I
         nQY0+lsjawssdFSfnaxhQxQR2oinOmCF29NpFP4IfVzIbfkSWhCgEZc7lcCcUopZk7Zq
         fQMg==
X-Gm-Message-State: AJIora8JEZwUD8PadGp06kDs/eeUdWPOIbfcr/oyA60UJCqKQRmowlPe
        pt+SNWxzFGKv3BG+84vyNDLTIQ==
X-Google-Smtp-Source: AGRyM1vQ8bP23i/Pt5tFi74liBmS3Y7kMWOHA/t9ysDpqJS9wBgemnTJNjz4eAHZ2l42+/G3L7iHAw==
X-Received: by 2002:a17:903:246:b0:153:84fe:a9b0 with SMTP id j6-20020a170903024600b0015384fea9b0mr1808913plh.163.1655338580002;
        Wed, 15 Jun 2022 17:16:20 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id im16-20020a170902bb1000b00163e5f99ee9sm211834plb.166.2022.06.15.17.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 17:16:19 -0700 (PDT)
Message-ID: <446e4e27-6c83-d503-09ce-31d38a0e8ed5@linaro.org>
Date:   Wed, 15 Jun 2022 17:16:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/6] arm64: dts: qcom: Add missing space around properties
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
 <20220612223201.2740248-6-niklas.soderlund+renesas@ragnatech.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220612223201.2740248-6-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/06/2022 15:32, Niklas Söderlund wrote:
> Add the missing space around properties before the typo spreads to other
> files
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

https://lore.kernel.org/all/20220526204248.832139-1-krzysztof.kozlowski@linaro.org/


Best regards,
Krzysztof
