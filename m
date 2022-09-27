Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8CA5EBCE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 10:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiI0IOT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 04:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbiI0INt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 04:13:49 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D910CE20
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 01:09:36 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id bk15so5978401wrb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=Ut3iGu0b/mI6XW5rpgCs/5VK4qy+LVrOrJIS25KPemw=;
        b=i4Jvq0fa9Bl6I2SPiG4hGMCYydOUsAwFpniv75l8RduOKIDc+1n907TVHDddAjeadQ
         R/8ye3NnLtMldaO9llS3wIopU6SlVHg7cJk3qvlr+/JoAOOTw1/5ncKSMOyy2+UN9IG+
         OCh2VvIaQ6XZqTD+bLDNQLcY8BOB9cqII1xsU7J4Lu7D+94BOmzTRqRbNpQ3nD3yehzE
         6pF6bZt60JhmPPtpvL0yiGU+IJ01BRZfai2B9lqRHoQvnwCExYbzh27J1CBqg7QS4DN/
         3plZLbc0+SMImRnuUUtnHlw+4U7XuXRHzUpY0Gjy4Fi/2IQRGrE31/IjgHvc4/J3PfxF
         Cd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Ut3iGu0b/mI6XW5rpgCs/5VK4qy+LVrOrJIS25KPemw=;
        b=mZ3S1370OZngqy2MQAmD4HMtg4FaZcTLbcH8btD86CKLNbjTA4ald9xCeaKDV4tr2q
         Myx4WfFMULbxgbtb1HPjz7lskVZdyly3IzR9FD49xzemzHIfXpZ4URcIJ+aNWAP5q7gz
         VSU0iMvqYAD+aNSUkJ+6vDgSIumk6sxjq0XzfRXMr2/AQRjQ0AtfGNBx1O2+/Qs8gyt+
         txeV9ZsSjXogBG0KFOtqcmaoWxrylUoA4lps370WB7sanrW6uP4asf3IvSNLvLaH1YUj
         Q4qkL0P4Vd/zGM7ZDMVaKizHmKeEWp8jA7pf9nPDFkF8/HHfZdMYJ2CI0vy/veytwVfS
         8DBA==
X-Gm-Message-State: ACrzQf0oitxiDAeGZXs0si+CCHOe2WNJkQHMH5q2m6SvXvYqYuiZNUoG
        ZzfmSkkkKYCzIsFlmp3eEczK2A==
X-Google-Smtp-Source: AMsMyM4WHp67dF80OY/vsCx8rfoGnuoWLl1ptdh1oP4myyjv5slsl9o3gYYnbqLklpA+rBFT+1PyXw==
X-Received: by 2002:adf:a15e:0:b0:22c:b9b7:abd0 with SMTP id r30-20020adfa15e000000b0022cb9b7abd0mr1508586wrr.584.1664266174765;
        Tue, 27 Sep 2022 01:09:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b771:c77b:f889:9833? ([2a01:e0a:982:cbb0:b771:c77b:f889:9833])
        by smtp.gmail.com with ESMTPSA id d37-20020a05600c4c2500b003b332a7b898sm899485wmp.45.2022.09.27.01.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 01:09:34 -0700 (PDT)
Message-ID: <82fd53cf-c45e-fd9e-13b2-3cc2ff155d65@linaro.org>
Date:   Tue, 27 Sep 2022 10:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/3] ARM: dts: qcom: msm8974: add missing TCSR syscon
 compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220920150414.637634-1-krzysztof.kozlowski@linaro.org>
 <20220920150414.637634-3-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220920150414.637634-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/09/2022 17:04, Krzysztof Kozlowski wrote:
> TCSR syscon node should come with dedicated compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 7a9be0acf3f5..a4e12daf3eeb 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1239,7 +1239,7 @@ tcsr_mutex_block: syscon@fd484000 {
>   		};
>   
>   		tcsr: syscon@fd4a0000 {
> -			compatible = "syscon";
> +			compatible = "qcom,tcsr-msm8974", "syscon";
>   			reg = <0xfd4a0000 0x10000>;
>   		};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
