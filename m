Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E014C2CC13B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 16:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgLBPsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 10:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728507AbgLBPsX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 10:48:23 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F17BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 07:47:43 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id s8so4477074wrw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 07:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hZCo1m8g7QPYnEX3m7SsmQm546vtQp+mN348j0Xkt6I=;
        b=WozaPSMeOVI9euTVFOarywGpxKAPZvKOXOEWQtvyps7gdpv6liS1NZR50dH857phu2
         Y1bMq0kgHUwjXNWnESQfr3PxIZEMqAohaQBnW3/nd5DWWL0S8YiX4k2whD+N+KHoeFop
         17/44eB5Xm0ZftGesDSIUrNQbgxc63hr9WR9P18dHP2Yda+6R4cQEaB0jjNIxAR/g1W8
         CXSxIStqcYpyTXP8aiLtE9H/hTG0YMbcil0gG63TyDzHxLfKpu8LoaL2NjmbWB8Bx3hS
         YTce5kYBVLCHvO2X2wSEbN2x3JqL4Li+z851OEp0eKF9dELEArBV1erCImBwUK+G++v5
         dmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hZCo1m8g7QPYnEX3m7SsmQm546vtQp+mN348j0Xkt6I=;
        b=iOb1SOwkqN0G43BSS2nm+CE9lLZ1VZOt45nb2Qditxw9/gXlRGWAEjMs3GBjghjBEu
         e5JfArl0r6Axlr48CjH9Z+rhpB6VTWht2xdUhC99/srbve1Rd6UOx+oIGvj1gzadGwfs
         /hHIQCSA0t+XUQhd7t95npOK/7AmqWGZ9ANqLDJnKee9JUKUbiTRRZZ5l3CIFyuubFKl
         OGyy34Jy23KIc8M4/1ZGGmL1KO/9eu6BxRvPZL50IymiycjJxGFl9p/zkY8VwC7apdSk
         TfkQEA5NI9i62MLg74DiWS8xwjbhBrvSPa1M0cnJu6oYNNezxuLyBVXa+Wf+o0BXCFOD
         bf0A==
X-Gm-Message-State: AOAM533SP0AJ1n4QnYvvEw3WrlG91zD3l8bnGSr+cWWHTVyNI1tguCQV
        jq6PMEUrvs72rzCDYhnF4BcjLFzRWhwuu2+p
X-Google-Smtp-Source: ABdhPJzPDRn6F8yI8MQnEqRIUcKoTyE96fFWrfcQlIjRGQGvsOzW1c+R+URB/NtEvglv2Rk0vXYh+w==
X-Received: by 2002:adf:f102:: with SMTP id r2mr4198893wro.315.1606924061942;
        Wed, 02 Dec 2020 07:47:41 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id r13sm2444950wrs.6.2020.12.02.07.47.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 07:47:41 -0800 (PST)
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sm8250: add apr and its services
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201201153706.13450-1-srinivas.kandagatla@linaro.org>
 <20201201153706.13450-2-srinivas.kandagatla@linaro.org>
 <X8aYkxFMf+dzNRNt@builder.lan>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6cbf6754-56bc-c35a-038e-08903c2e09d2@linaro.org>
Date:   Wed, 2 Dec 2020 15:47:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8aYkxFMf+dzNRNt@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many thanks Bjorn for review,

On 01/12/2020 19:25, Bjorn Andersson wrote:
> On Tue 01 Dec 09:37 CST 2020, Srinivas Kandagatla wrote:
> 
>> Add apr node and its associated services required for audio on RB5.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 56 ++++++++++++++++++++++++++++
>>   1 file changed, 56 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 65acd1f381eb..3b4e98b13d36 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -11,6 +11,8 @@
>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>   #include <dt-bindings/power/qcom-aoss-qmp.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>> +#include <dt-bindings/soc/qcom,apr.h>
>> +#include <dt-bindings/sound/qcom,q6afe.h>
> 
> Please move this line one step down to maintain the alphabetical sort
> order.

I agree with all the comments on this patch as well as other patches, 
will send v2 with those fixed!

Thanks,
srini
> 
> Thanks,
> Bjorn
> 
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>   #include <dt-bindings/thermal/thermal.h>
>>   
>> @@ -2620,6 +2622,60 @@
>>   				label = "lpass";
>>   				qcom,remote-pid = <2>;
>>   
>> +				apr {
>> +					compatible = "qcom,apr-v2";
>> +					qcom,glink-channels = "apr_audio_svc";
>> +					qcom,apr-domain = <APR_DOMAIN_ADSP>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					apr-service@3 {
>> +						reg = <APR_SVC_ADSP_CORE>;
>> +						compatible = "qcom,q6core";
>> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +					};
>> +
>> +					q6afe: apr-service@4 {
>> +						compatible = "qcom,q6afe";
>> +						reg = <APR_SVC_AFE>;
>> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +						q6afedai: dais {
>> +							compatible = "qcom,q6afe-dais";
>> +							#address-cells = <1>;
>> +							#size-cells = <0>;
>> +							#sound-dai-cells = <1>;
>> +						};
>> +
>> +						q6afecc: cc {
>> +							compatible = "qcom,q6afe-clocks";
>> +							#clock-cells = <2>;
>> +						};
>> +					};
>> +
>> +					q6asm: apr-service@7 {
>> +						compatible = "qcom,q6asm";
>> +						reg = <APR_SVC_ASM>;
>> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +						q6asmdai: dais {
>> +							compatible = "qcom,q6asm-dais";
>> +							#address-cells = <1>;
>> +							#size-cells = <0>;
>> +							#sound-dai-cells = <1>;
>> +							iommus = <&apps_smmu 0x1801 0x0>;
>> +						};
>> +					};
>> +
>> +					q6adm: apr-service@8 {
>> +						compatible = "qcom,q6adm";
>> +						reg = <APR_SVC_ADM>;
>> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +						q6routing: routing {
>> +							compatible = "qcom,q6adm-routing";
>> +							#sound-dai-cells = <0>;
>> +						};
>> +					};
>> +				};
>> +
>>   				fastrpc {
>>   					compatible = "qcom,fastrpc";
>>   					qcom,glink-channels = "fastrpcglink-apps-dsp";
>> -- 
>> 2.21.0
>>
