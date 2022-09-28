Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6C1B5ED6AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233833AbiI1HsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbiI1Hro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:47:44 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F9581CD10D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:44:22 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id iv17so7962512wmb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=WLj8j6x/9OHYVep8IhLt7HbfqCQZHnGJnfhIsUlvX08=;
        b=tAQqkxO8YPscj8Lku/8n5LiWrzRBHQUAJPuoj1DnaqVyy4fA6jJvvHGb+MtSt0yaZ+
         Py4f4efJ12Vhoy/G+Lq+mhq2Ugdhe/qk4fnVjoxmxPIFrMSNx9y6e4okyFhYLR3gdwSR
         yVLBemkY5kFrVpFvDk6i6Giuf53Kzje8MDzQLDR0xZKRvCsPJO313w88F6FjUiDmmLJh
         83po/R6yVbQ3avHKIi/ePRIAdxd+vDT9HxewVxLEeCnCnU8Co0RrQli0xII8IEhjYEbg
         ot08TL990H4zAKu4sq+C7/Vg7Uyg4WGnDR90OHjrUXYItiGJ8JOCMB0rE8Xd1OOm8ZMj
         AqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=WLj8j6x/9OHYVep8IhLt7HbfqCQZHnGJnfhIsUlvX08=;
        b=vv7a6jnS0TMxw8W4VZTMkTGi7vohwH6F6LkycsGy8D/Jqr0Khn6g+HkayBOSaSq9ML
         X1Ih5ORnB8tg6cnQI0wYSYPkgzv1df/efKCDnDZIqxfFSpshXmGTAgUtAFvF4BmoaG9c
         fXFfJCvfVY3Mdczox3AY+55zFlzHvmavhgFkN+8iLaEBvJNcw7S4y52E+krgd9DQ2kqa
         9Ed8dMRCYPw0lwFa9iidx9OTzNo0cWo+SJcURof0d9anrL2nOCtoJZ+rCpVlhsSSphDd
         oRJ9K1gEyb6l1z6XlpPYXbTT4jFS4S8wdN235pC8Snv+N22Ryn4CU3dDEotRLNfOjIMs
         0MbQ==
X-Gm-Message-State: ACrzQf2rFn1uXP1L4NtsXcsmEk+BxhoqCKvvDzFRbxfvd2TSUUY8Fu/Y
        eKr61OObnztaKCF6Q+zdzn+Skw==
X-Google-Smtp-Source: AMsMyM4ED8y/kRr1u9F+JDEFgEoA5AkZ6UPNzj+eW4fqZr2RTobp5mw0bbqP7mjDWqD34JJBR3HCeA==
X-Received: by 2002:a05:600c:1e18:b0:3b3:b9f8:2186 with SMTP id ay24-20020a05600c1e1800b003b3b9f82186mr5890887wmb.151.1664351054367;
        Wed, 28 Sep 2022 00:44:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d4b04000000b0022c96d3b6f2sm4561337wrq.54.2022.09.28.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:44:13 -0700 (PDT)
Message-ID: <dfa9da4d-5d4d-a9d7-a817-48378b5b7936@linaro.org>
Date:   Wed, 28 Sep 2022 09:44:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: cp01-c1: remove bootargs-append
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201415.1265191-1-robimarko@gmail.com>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220927201415.1265191-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 22:14, Robert Marko wrote:
> bootargs-append is a leftover from the vendor SDK, and does not exist
> in the mainline kernel at all, so remove it.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> index ff4c46645104..eaaaaa72234f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
> @@ -20,7 +20,6 @@ aliases {
>   
>   	chosen {
>   		stdout-path = "serial0:115200n8";
> -		bootargs-append = " swiotlb=1";
>   	};
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
