Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 176A869FD39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 21:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjBVUyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 15:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBVUyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 15:54:19 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8352F79F
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 12:54:17 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id z42so1474321ljq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 12:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+U/HR42fPN8hC1rLiFVx6gFnszC/TbPe/bv3kKzKu0=;
        b=CpRdXAFmOXc8IWlUDaDmIRyL492+EudgL57Ia+Ej4J/pA083GCZm2E890NYHAWXl4H
         gRWZQhMyBAx7qd1418S6eaKRYZpxK2f9a6rrfuGGAhLIeyfgzbHu8VOPxH/4ky8i3DLe
         3iCP+ka5Mg4l+T9qFxcJo6xxtYVlz9RaV5DP638kjBnr/qXm1LPXRcC5vOzGgbrQUwwS
         I1IpFPC0QW2kV2WzZ7j6NhnrZCJ2IV7ai/7LWSokyJmbaa37/+fKe5DFFlqbsWURQelG
         uOCnN4G3xvJugc1YcU67KxUC89u+i9+5qNAzFJC/xZ0fHk7COJ7G3RkJbOeERK6gfqR0
         BCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+U/HR42fPN8hC1rLiFVx6gFnszC/TbPe/bv3kKzKu0=;
        b=0JHtV6+n4jrAzwGmdL9JN+IWSuRvkHutQog7TK+OHlUbB0++6aWmSwcuxkdN5mHAlh
         QD/M591wk9QgNHHvNc++NMySVMOJrDKQxW6BGsJspR+ogsvscRBFPbgXMNokbULinEfV
         rg8iYikuCdQ5PcuiH1cnpe32BaOAm6r+0VINrg7VOnQdouf7btrq9zcNL2J83DYSVcMN
         AoTB62UqbgW2dmwRXTnU0GtnzZEMtIMK1Xfv6S7Kip7KZMU8/cplQyusU/neeEd9FsdD
         6RC7nbWA74c+6/KPyV7phdgY9KsYAYvYy+aTEiwhfj5NQYDdKqM/WHNg1236bmCsVXbK
         jynQ==
X-Gm-Message-State: AO0yUKU8+L9QbbAzOUiOkM+dxndW/+0lz0tY4yAzV7lwlY6zMlJmONrp
        Qfsk+1f5S82r5AQhXP4rSdUBzQ==
X-Google-Smtp-Source: AK7set/z3+BDrX7ucC0zd60YdqSri9mynP/jEgjOEf4l5BcziLEjl9kpQGB6RLQwxKutOQl6az8wLQ==
X-Received: by 2002:a2e:7a16:0:b0:293:806:dd74 with SMTP id v22-20020a2e7a16000000b002930806dd74mr2969798ljc.46.1677099255917;
        Wed, 22 Feb 2023 12:54:15 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id 4-20020a05651c008400b002934ad42ce1sm939198ljq.103.2023.02.22.12.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 12:54:15 -0800 (PST)
Message-ID: <ac9a36fa-5c39-d984-3056-169fd5ab405b@linaro.org>
Date:   Wed, 22 Feb 2023 21:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] Input: gpio-keys - add support for
 linux,input-value DTS property
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>
References: <cover.1677022414.git.soyer@irl.hu>
 <3519a11b0ef5324a2befbd137cd2aa0cb8fd057d.1677022414.git.soyer@irl.hu>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <3519a11b0ef5324a2befbd137cd2aa0cb8fd057d.1677022414.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.02.2023 01:10, Gergo Koteles wrote:
> Allows setting the value of EV_ABS events from DTS.
> This property is included in the gpio-keys.yaml scheme, but was only
> implemented for gpio-keys-polled.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/input/keyboard/gpio_keys.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index 5496482a38c1..c42f86ad0766 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -770,6 +770,9 @@ gpio_keys_get_devtree_pdata(struct device *dev)
>  					     &button->type))
>  			button->type = EV_KEY;
>  
> +		fwnode_property_read_u32(child, "linux,input-value",
> +					 (u32 *)&button->value);
> +
>  		button->wakeup =
>  			fwnode_property_read_bool(child, "wakeup-source") ||
>  			/* legacy name */
