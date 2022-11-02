Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCBC616DB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 20:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbiKBTUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 15:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbiKBTUV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 15:20:21 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D969EDFE2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 12:20:20 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id g10so5899746qkl.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7DzY3flKN/IpybPJ+aNMlwaIPUzPDi/AXVTF+yXVtg=;
        b=AUVQvakkgdtd6Ucua94NDfZheJbQoUZUUGgBmjJJSyhbyRr6aiM/l9Y9CJ0JocoXJb
         nh5lUAr1/U4VONjn0DNV82cFxP4lvdyqK6w0da+LQv8PVOgTjqx8xTWavJVez53QTcNg
         89w12zTVsn8dQ+tEmfmkRMzY7GVT02OD7rR+ZwemjZznX7NQzNmtFbRXWw95br/DCXv3
         by0MoapJqpgw4OIg3gulx4JdfUQ2CtN85QbQrDLx0zxBgLQWXL39XDcbLwi2drp5PEFA
         ylMYFtSmusVeT5Rn/nmPElKnROzDnZZS+mn0nGns1QclM0XtHfq+5zrxD5H9xfnxH2Bp
         qhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7DzY3flKN/IpybPJ+aNMlwaIPUzPDi/AXVTF+yXVtg=;
        b=q3ZjyzK7u3x+f46fAxD/KWRy4M8PXK+H0+bDS+ZS0YXs+Sn6u6PMyYeJKIgHKOCuTQ
         h1ZAhRWj4O13RIZNX6jzhgOJyI/gJmCSg8K82FWki35UnenKs8cd5F6u3Adr6r2vpmyP
         r65wG/W4Bmyl10G2HhCpdq2cVbbIyun63Q08r51FWDSgf0EurdyvnZoms/AEa5O2ixAv
         leCA/+g+3VQ54E3jaEFaoZgx34jD43XtFjXM4+yrJTSfILbulHym+jjT04TDDk6Olq7I
         6eSDXz67IY8jdOn+tpN1c5vkCPGNTPi9bePgLd8TDKxZEIfm4hqSBitO0u+exGaSxULn
         JERQ==
X-Gm-Message-State: ACrzQf2wKNLuTvy3b2zxWDo51eWaWNAl49M1MIxChiMrdaHZa1ZclmqZ
        IvHO0ZJ7AVthhSRPSKdgQQnrZA==
X-Google-Smtp-Source: AMsMyM42nja1y3Ce02aFRPqpX8h8vuMLN2/7sgBMjWDNKce78YBCG+ayNZ6L7Ps8tVVz/BOlp/7Ltg==
X-Received: by 2002:a05:620a:b14:b0:6fa:5e0b:d9fe with SMTP id t20-20020a05620a0b1400b006fa5e0bd9femr3596189qkg.594.1667416820026;
        Wed, 02 Nov 2022 12:20:20 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id ew12-20020a05622a514c00b003a51e8ef03dsm5774543qtb.62.2022.11.02.12.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 12:20:19 -0700 (PDT)
Message-ID: <1a8bab07-46c4-1585-45ff-8780c02afd4e@linaro.org>
Date:   Wed, 2 Nov 2022 15:20:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v11 2/2] arm64: dts: qcom: sagit: add initial device tree
 for sagit
Content-Language: en-US
To:     Dzmitry Sankouski <dsankouski@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20221102155558.1895829-1-dsankouski@gmail.com>
 <20221102155558.1895829-3-dsankouski@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102155558.1895829-3-dsankouski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/11/2022 11:55, Dzmitry Sankouski wrote:
> New device support - Xiaomi Mi6 phone
> 
> What works:
> - storage
> - usb
> - power regulators
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

(...)

> +
> +&blsp1_i2c5_sleep {
> +	/delete-property/ bias-pull-up;
> +	bias-disable;
> +};
> +
> +&blsp1_uart3 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		vddio-supply = <&vreg_s4a_1p8>;
> +		vddxo-supply = <&vreg_l7a_1p8>;
> +		vddrf-supply = <&vreg_l17a_1p3>;
> +		vddch0-supply = <&vreg_l25a_3p3>;
> +		max-speed = <3200000>;
> +	};
> +};
> +
> +&blsp1_uart3_on {
> +	rx {

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

6.1-rc3 is not a proper rebase... You *must* include maintainers'
entries. This *must* align with stuff has Bjorn. Also I expect it passes
dtbs_check on stuff in the next.

Best regards,
Krzysztof

