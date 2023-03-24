Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E756C7A5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 09:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbjCXIyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 04:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231869AbjCXIyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 04:54:11 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7CB1A950
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 01:54:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id eg48so4853247edb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 01:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NNXplUZWv2uC8xy5gETPaTQRPgOmXhcKawD8mHOM96I=;
        b=zVU3hHmlipliPeWoyg87GxPpsFN+Mrhj4VARlvwjnLsFt4Zs8wxkKAbMYSn93nEEIF
         EwVEUE6IsLr9grcxDb9bKAhKmHpontmLvymc8LtKF/pn3dzhJL9MPKtH0LkwhsTLMgZj
         WEv+L870Jxy6CfL0zuXA1uwDH32kJW9WD0CsEEUTNnWZQbxSvz8J1WYEv2Y9ormPuFhG
         J1C7ffB0TKAYW4Stq+awGhXz5T2MGs9OobLrOvNqvRoFyTiaZlglULT4xZuhTkgWhiHY
         LNNR5lGagd8ipojcW76vcOVDLMgPtP1d6vEyN36DYJqn7xSxwT9VTkvFQsCu938HSELk
         p27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NNXplUZWv2uC8xy5gETPaTQRPgOmXhcKawD8mHOM96I=;
        b=iutwz9PtzvTjhYKKr9pyL7a1qvqbCl+ATU5iaJIcLyStbUwQfOoEcpJ+PDGNHOjkmw
         NMfPh4FSCqygypD3gOlVh2X/Y9xsOPEOKXJoeeyXMsLn0Duzg62qlfVOlp6mr3WUei9Y
         Bz3plCawWB/zZZ6/3VslvobB7B4URCjfKNXcA+pOjDLgf8z+PC2qvlCQl02bGQicQkKT
         Sjo5t7msWSpWYPHIqrnpKSbvWbC7koasK7OfFC2MVbM3kJgJ/25Xz5yT7N3YackYTvzN
         X+sVtjXG8df0CHeDi0Xa0QvJN65KvjZvUEv+NafPQBKJdjJ1Zp1boKup77WdFmQLtxG0
         yT0Q==
X-Gm-Message-State: AAQBX9eIkIPfm6Tc3Z6/xPJCJYU0sc4DwNFa8nbC+YTyy6UeR147nxEB
        d9u4M1ARFauxlrOmylvPVhgCww==
X-Google-Smtp-Source: AKy350bZgiKkDUCbgQQLT9YEaIuSJGm/ZBIWZUHLUO47cm+GH5NzLc1eDt5Y0018/bTU/tsOB+qUYg==
X-Received: by 2002:a17:907:9d1a:b0:8a5:8620:575 with SMTP id kt26-20020a1709079d1a00b008a586200575mr2039609ejc.3.1679648047919;
        Fri, 24 Mar 2023 01:54:07 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373? ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id h13-20020a170906110d00b009333aa81446sm8232726eja.115.2023.03.24.01.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:54:07 -0700 (PDT)
Message-ID: <66be41fe-0a90-506d-132c-5b87cb1c9e4e@linaro.org>
Date:   Fri, 24 Mar 2023 09:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [net-next PATCH v5 12/15] arm: qcom: dt: Drop unevaluated
 properties in switch nodes for rb3011
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
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20230319191814.22067-1-ansuelsmth@gmail.com>
 <20230319191814.22067-13-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230319191814.22067-13-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/03/2023 20:18, Christian Marangi wrote:
> IPQ8064 MikroTik RB3011UiAS-RM DT have currently unevaluted properties
> in the 2 switch nodes. The bindings #address-cells and #size-cells are
> redundant and cause warning for 'Unevaluated properties are not
> allowed'.
> 
> Drop these bindings to mute these warning as they should not be there
> from the start.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

ARM: dts: qcom: ipq8064-rb3011:

Best regards,
Krzysztof

