Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D1E631F13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 12:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiKULGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 06:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbiKULGB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 06:06:01 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88924E43E
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:05:58 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so12475963wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 03:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+hgl7y9OVmDFsgUacjiFs16gEXdr73WbhGJq0MMzaE=;
        b=CYMNjFfwLKE3DQ5tIKM8DOhTlQ5TsVWgTm/qTaywKxEp6IqKedU0g2EBqO1thD78oT
         5D1MoO8MvvMMNKtrTkq+7T/2hRvaoFmTwqTbLTlf97FUEzUlqv8l3rs352wVx7RUXTnj
         mTFq/+UGlwwpo8O1dhYvX7qbLePs4xrt98/yUwgL/ZHdk7kZ2edKrCgJpm0NtSlkXVLZ
         Hem1v6LaNoo6SAZIBwO/1uGK3mwK61T36UUrsZu1bYQePxJywzIpumf9lakowpOV8DMn
         p+Qwg0gaFFHbHhJ3LWPD20b5dOJNypKdFT28/oTT1oMvsN6+zC9hcVsADeU124yA4zyS
         dKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+hgl7y9OVmDFsgUacjiFs16gEXdr73WbhGJq0MMzaE=;
        b=k8ngwBI7QLIdTIW72wg8Kjq9/6Er7oXCt/cApsWaVwIHk60oR8JKDdwfHnEgkHTAe8
         sZHEGR+J63U/dJMWseCqrqdvGWLCGobYWcnxH7IdF/7JzWDiMVW+h0EDZXDlRrNTx+Na
         TazFaqxW39K9k5AZaDto/sFZ2FeZ86aR9dhDZ7gmOio3pQBNlqP1jzccI7ePcabQcsTK
         TqilWxK8Izl3pPKbak2PvvyVuTvZ8eKq1m0Xtr5RRI0l9s3m3r1xqXYFSbp9pB7UJKrc
         pFjsqJ2w2qOBQwhqs4ig8EPFY6wYtz4vG/XUUQTigH6BTSa1P0J4i5THg/70ddsT66bC
         3qdA==
X-Gm-Message-State: ANoB5pmdK1+9/WAhi/mvG3zww5CWLw/aaDRnoE9UhmhzTz/cQvkU0CJ5
        LT/bgEcjK89C4/oa3iOVEsDRxY+qhz9rrg==
X-Google-Smtp-Source: AA0mqf6T0Y8N7ZHHerVF5dl39uM+Z/kn8wCAfchXA20uq3JE8PkWELG9M+0ew83h00V/+ackL5/Cmg==
X-Received: by 2002:a05:600c:3d8b:b0:3d0:545:a0 with SMTP id bi11-20020a05600c3d8b00b003d0054500a0mr1355202wmb.123.1669028757258;
        Mon, 21 Nov 2022 03:05:57 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id n21-20020a05600c4f9500b003cfd64b6be1sm23319066wmq.27.2022.11.21.03.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:05:56 -0800 (PST)
Message-ID: <e027ca17-47bb-c886-2329-efd47127da67@linaro.org>
Date:   Mon, 21 Nov 2022 11:05:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc8280xp/sa8540p: add gpr node
To:     Johan Hovold <johan@kernel.org>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221119164425.86014-1-srinivas.kandagatla@linaro.org>
 <20221119164425.86014-2-srinivas.kandagatla@linaro.org>
 <Y3ss05yM1077yPcy@hovoldconsulting.com>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <Y3ss05yM1077yPcy@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 21/11/2022 07:46, Johan Hovold wrote:
> On Sat, Nov 19, 2022 at 04:44:23PM +0000, Srinivas Kandagatla wrote:
>> Add GPR node along with APM(Audio Process Manager) and PRM(Proxy
>> resource Manager) audio services.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 40 ++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> index c32bcded2aef..a610c12103bf 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>> @@ -12,6 +12,7 @@
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/soc/qcom,gpr.h>
> 
> Again, please keep the includes sorted.
> 

Thanks Johan, I will fix this along with other stray line comments and 
send v3.

--srini
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -1152,9 +1153,48 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>>   
>>   				label = "lpass";
>>   				qcom,remote-pid = <2>;
>> +
>> +				gpr {
>> +					compatible = "qcom,gpr";
>> +					qcom,glink-channels = "adsp_apps";
>> +					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
>> +					qcom,intents = <512 20>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					q6apm: service@1 {
>> +						compatible = "qcom,q6apm";
>> +						reg = <GPR_APM_MODULE_IID>;
>> +						#sound-dai-cells = <0>;
>> +						qcom,protection-domain = "avs/audio",
>> +									 "msm/adsp/audio_pd";
>> +						q6apmdai: dais {
>> +							compatible = "qcom,q6apm-dais";
>> +							iommus = <&apps_smmu 0x0c01 0x0>;
>> +						};
>> +
>> +						q6apmbedai: bedais {
>> +							compatible = "qcom,q6apm-lpass-dais";
>> +							#sound-dai-cells = <1>;
>> +						};
>> +					};
>> +
>> +					q6prm: service@2 {
>> +						compatible = "qcom,q6prm";
>> +						reg = <GPR_PRM_MODULE_IID>;
>> +						qcom,protection-domain = "avs/audio",
>> +									 "msm/adsp/audio_pd";
>> +						q6prmcc: clock-controller {
>> +							compatible = "qcom,q6prm-lpass-clocks";
>> +							clock-controller;
>> +							#clock-cells = <2>;
>> +						};
>> +					};
>> +				};
>>   			};
>>   		};
>>   
>> +
> 
> Drop the stray newline.
> 
>>   		usb_0_qmpphy: phy-wrapper@88ec000 {
>>   			compatible = "qcom,sc8280xp-qmp-usb43dp-phy";
>>   			reg = <0 0x088ec000 0 0x1e4>,
> 
> Johan
