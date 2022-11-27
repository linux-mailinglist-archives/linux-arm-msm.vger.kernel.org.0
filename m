Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C50639D1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 22:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiK0VId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 16:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiK0VIa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 16:08:30 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F305655B3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:08:28 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d3so11111754ljl.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQYm1e4H6Vkp4DL5/TiXL9Cz/h8OYYvPgZOczJW5nyM=;
        b=pT3HaFu9cU9HMEhxgVzzS7f3D9TufxB0wrRxVR4oPrjfGuYiUi+4/6mcpcOSse1eaC
         xoDxfgVwzFTuLBFGFgVZv2XHMra60/MOXFaLbuDLNubuzXIYXnhyCCsIwYq+zitwYm4D
         9OBny9/3h1bktFRE62+9yJi+xNIiobPcMz1UNYYE6bkrDEtkFKZXvlbeRlsIBRSSsihM
         Iyaa5YpfOCghq1RplmOmbPJJwJNcBdYMakWOv7V4MwrvcHpd224Spb1z8ZKnxRFFHZWr
         zA9PouRyFSSJtot2u+VbUAAZtoHjPCJ9+GPIfE9oKHr7UhHnlF0mS0Px8sFFuaf3VGlS
         Ivwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQYm1e4H6Vkp4DL5/TiXL9Cz/h8OYYvPgZOczJW5nyM=;
        b=HBLgj0DSsGGslNTJ5KR84bDbg5AY3kgUuNppmzaaNMSu5Q6IoR03E98PXGufJty3Lk
         YQKcZzBhM3lmMA5KbJYrvBUJnQaX1wq105uv4nvKYVWD0rjfHjj0Am7efr6DcgB6Gt3p
         q1CiTHi0YVLOu78pRRnfSQPQw031m9EQJO5bdRJCMaqOm18rwurW4zhxUgEYPBUgN4i4
         0zdHSbfumAZbaCjYp/i2kWopuYDiroiA1JVU1axHZJtK2Nf/nxvzK+IaxrEWjJ2g67XK
         lIgsX3n9zO2wU/rqhdBmQMyA7SbYCjNIUIRzsNTZZS/a3rdAticAh3rbdhLl2K0D0ZJa
         cNmw==
X-Gm-Message-State: ANoB5pnmY7IGm5+byriLwPIYEzvq7Lqv/CpsnXEYx3kcszqfJNdmzDK1
        5NZc9vllVNzhGoQuHgvAzW+wlg==
X-Google-Smtp-Source: AA0mqf7t8v/MRSZQOjDsyj59nBL5nfeomU+AHen/BKd0CVSqEQo7q6UPSAw4lqfDnteG4CxMN5v1OA==
X-Received: by 2002:a2e:8e33:0:b0:277:1d5b:74b with SMTP id r19-20020a2e8e33000000b002771d5b074bmr9151666ljk.522.1669583307357;
        Sun, 27 Nov 2022 13:08:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b004979db5aa5bsm1414367lfr.223.2022.11.27.13.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 13:08:26 -0800 (PST)
Message-ID: <292eca02-e59a-88af-8823-f14440ffe592@linaro.org>
Date:   Sun, 27 Nov 2022 22:08:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: msm8974: Add OnePlus One
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Julian Goldsmith <julian@juliangoldsmith.com>,
        Oleg Chernovskiy <kanedias@keemail.me>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221127181835.806410-1-luca@z3ntu.xyz>
 <20221127181835.806410-2-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127181835.806410-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/11/2022 19:18, Luca Weiss wrote:
> From: Julian Goldsmith <julian@juliangoldsmith.com>
> 
> OnePlus One is a smartphone launched in 2014 and is based on the
> Snapdragon 801 SoC (-AC variant).
> 

Thank you for your patch. There is something to discuss/improve.
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&gcc {
> +	compatible = "qcom,gcc-msm8974pro-ac";
> +};
> +
> +&otg {
> +	phys = <&usb_hs1_phy>;
> +	phy-select = <&tcsr 0xb000 0>;
> +	extcon = <&smbb>, <&usb_id>;
> +	vbus-supply = <&chg_otg>;
> +
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +
> +	status = "okay";
> +
> +	ulpi {
> +		phy@a {
> +			status = "okay";

Override by label (usb_hs1_phy). If the labels are named similarly, e.g.
usb_oth and usb_hs1_phy, then they will appear next to each other during
override/extend.

Best regards,
Krzysztof

