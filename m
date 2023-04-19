Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56946E7A1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 14:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbjDSMxv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 08:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbjDSMxu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 08:53:50 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6B910CA
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 05:53:48 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u3so29391608ejj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 05:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681908827; x=1684500827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p0N26j4yQXe74e+ivxmlhFDmNYunjLTGE2X1AOgnduA=;
        b=WYoY7KPFhRVS4KLzydaQSNQzYa2dWzZKW2yW8rpjs01sSODWUBXWzbIfn4vA9H6uK0
         s5kSjt85Lz2Ghc7SRuksA1JggdACvcAtj/8GGETZebpBIzb4refKMx6Cbko5WvD0hckk
         F1bZEYSwgX6qySecvsW5wNqpNILssGorZCBJdNF1PS13CQOa64wcpwwn1Iq70zwAMspL
         6KoGWU76d6E+Zcklv/i5KTKkdmaY/32ieN5wneFh+gYNjysrhKL5bcRh13Df0Ov2CF5F
         clw07YZvcQiDBXzB8llq7WVhGI/SgaNgW5ZV6v9GFdCd3u/X2KMBtv9pRQFNszezcfZy
         kKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681908827; x=1684500827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p0N26j4yQXe74e+ivxmlhFDmNYunjLTGE2X1AOgnduA=;
        b=doWP58iGgtNd3dwDqblk060IOI9WXDikQwEzjrl/a2PL/TLj/3kNTyyeEhm9Z4ja9L
         YwAF1m02YGO1uobaBnZ6109uME2P7wjyqqz1ab70104SADF5/t4Tptn92OgWfuEkT1dx
         m2rj6yrlr7P9wxIYid/NO8D2WubH84hUPCn6Thoy0Yl+AUpRNT1EsprqdzIrYmgkHMA/
         P+ICtpU/yepUKzQWtphyZ1OjwEx6lOnejXTSpmdcleIwNbJ/4MWEOMqlcw388fxDatIG
         a6I4oiT94eQNuildhkNdyyJL/JJaymN5C4CmgLGx8W7ijjBopV7J8Wy6b5IcWO5B67Zz
         ZSEQ==
X-Gm-Message-State: AAQBX9flB5xQ9fJUpAPjE1D9zs9OtIrI+0VkYMf1eclmSomzTkuCYJEF
        Bg7agj48KNKKj0QyoJU4xOfzuA==
X-Google-Smtp-Source: AKy350bBAaFNCpPlZzVexPb06lfEEFm/VEOm9rkda8D24LkFidQ/l3ZzXLJDLeOkUaIfhIETMTQqNg==
X-Received: by 2002:a17:906:1ec8:b0:906:3373:cfe9 with SMTP id m8-20020a1709061ec800b009063373cfe9mr14669488ejj.10.1681908827214;
        Wed, 19 Apr 2023 05:53:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id wy5-20020a170906fe0500b0094f1d0bad81sm6336798ejb.139.2023.04.19.05.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 05:53:46 -0700 (PDT)
Message-ID: <289b7604-d32d-49d9-8f06-87147d6fd473@linaro.org>
Date:   Wed, 19 Apr 2023 14:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [net-next PATCH v7 13/16] ARM: dts: qcom: ipq8064-rb3011: Add
 Switch LED for each port
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20230417151738.19426-1-ansuelsmth@gmail.com>
 <20230417151738.19426-14-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417151738.19426-14-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/04/2023 17:17, Christian Marangi wrote:
> Add Switch LED for each port for MikroTik RB3011UiAS-RM.
> 
> MikroTik RB3011UiAS-RM is a 10 port device with 2 qca8337 switch chips
> connected.
> 
> It was discovered that in the hardware design all 3 Switch LED trace of
> the related port is connected to the same LED. This was discovered by
> setting to 'always on' the related led in the switch regs and noticing
> that all 3 LED for the specific port (for example for port 1) cause the
> connected LED for port 1 to turn on. As an extra test we tried enabling
> 2 different LED for the port resulting in the LED turned off only if
> every led in the reg was off.
> 
> Aside from this funny and strange hardware implementation, the device
> itself have one green LED for each port, resulting in 10 green LED one
> for each of the 10 supported port.
> 
> Cc: Jonathan McDowell <noodles@earth.li>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 120 ++++++++++++++++++++++

Please do not send the DTS patches to the net-next, but to the Qualcomm
SoC maintainers. The DTS must not be mixed with driver code.

Best regards,
Krzysztof

