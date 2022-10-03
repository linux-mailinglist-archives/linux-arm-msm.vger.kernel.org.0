Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18EC5F337D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiJCQZf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbiJCQZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:25:25 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91260175AC
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:25:24 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id j7so12166674wrr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=Al1klrhCb5qeDudnHRT2s3BBQ1zNa8ZAx2JqrtwTfF0=;
        b=wYyQjeeYG0VzFcAUM8kbpmX4dIMJ8OxYkO95CREltZFKhihw4eGcW+jKHHir/gCx3F
         JefQYtE7nQ08j8E7OGzojGzbV20m88Z5Yc+FmNU7h2E3Zv5WecvvncjQ5+KgQMjKbYBQ
         zmXehlvn/OTWTLwO+fOahEQCWH4j13tn2bcqlKRWlZ6AtzKdAofAiVAnKz0xSN0E3w/U
         aJXzKccAn9LcHorQHdE1l+xLggG6k8Dp4w70Oq9k00ZZFPzjJQPfQZrVI45STrk4YcG8
         Zw9z4qjZGWnpHVm5KqpZrbtozJsK/iRVGi2brb0uW9CRTimDbFZd2AziwncyErnsxC6b
         sr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Al1klrhCb5qeDudnHRT2s3BBQ1zNa8ZAx2JqrtwTfF0=;
        b=R1xt2YRU6IPNfMxSXJlX6Nz/+MWlkpImUxfB+8UqyzrNNfrIesh1GRCOOd7lQ1cDMm
         hhH8tuZUgC16vxaBkGvhmGNZNEF1hvPm5w2BQByBJdjhV8eJmvwu77U+MpMFxkVOsLFl
         ZGqOWtaRB+HOHZcTxcqO3IrQltI1+f+PMr3BYVVkCCCkBLPiyBdh8/BSdFcGdzrIk2sy
         J6o/nlGjyc0WnH1XFfDd1HeP+Oo4Bb9cYH1LjR6dp12Bcz6yRBRFIAnQOVDzB4qOPe72
         ZZ0+1kP9L0IMvqZIwOIydRTZt3vzs8pz7pFcH4VUHXAWE9I/f5szD+wf9+Z51GZDZRZx
         BykQ==
X-Gm-Message-State: ACrzQf1cfmneT7WIOPPzH01RXXcDGHqnkav8IR8mQ/5i2ZNRrdu/byJX
        9eogIPaBg4vNHhQwV/6L7IeP/A==
X-Google-Smtp-Source: AMsMyM6klcjrFFOKuxShq38mkqQ8YB+OlfVKzTdhZoLOdS2hcwgIXamWXzCN1sAe8apYv2v3T23TUw==
X-Received: by 2002:adf:d1ca:0:b0:22a:cb10:450d with SMTP id b10-20020adfd1ca000000b0022acb10450dmr12997105wrd.120.1664814323186;
        Mon, 03 Oct 2022 09:25:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b003b477532e66sm25090172wmq.2.2022.10.03.09.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:25:22 -0700 (PDT)
Message-ID: <773a434e-2eea-8f92-68b5-df08bbe29b01@linaro.org>
Date:   Mon, 3 Oct 2022 18:25:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 18/23] ARM: dts: qcom: msm8960-cdp: drop unit ids from
 regulator node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-19-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-19-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Drop the unused unit id from the gpio-regulator node, there is no
> addessing scheme in the /regulators node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-msm8960-cdp.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
> index 9157e3c4f48f..cb0f612e6c90 100644
> --- a/arch/arm/boot/dts/qcom-msm8960-cdp.dts
> +++ b/arch/arm/boot/dts/qcom-msm8960-cdp.dts
> @@ -18,7 +18,7 @@ chosen {
>   	regulators {
>   		compatible = "simple-bus";
>   
> -		ext_l2: gpio-regulator@91 {
> +		ext_l2: gpio-regulator {
>   			compatible = "regulator-fixed";
>   			regulator-name = "ext_l2";
>   			gpio = <&msmgpio 91 0>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
