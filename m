Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48974FEBAC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 01:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbiDLXw6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 19:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbiDLXwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 19:52:31 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A92FCE1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 16:50:11 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m14so286191wrb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 16:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ShN/rXSZKDhy7VrfNgli/IlBDtGr/3iqN8cN4k09Vn8=;
        b=iLzG9wP7sgYVdHoHOo3azGNItHgaCWAOJDkB/QBUnw/Edh1jsVv6a5T9dYGhH5tyKJ
         0a5HcblT9K+dlIXdpQ3tFA0+camcJdIhX0sVlnpfyClqUU7xSErsL1ZHMAXe3RYDUVxU
         pnQPunWVA93FVmVDTT1ynO2I0EP0jpsgjLcqbANq40SqMPeafOc2qptouftJDbwWKxiU
         YJntqySSJKzHtApqQ6+95e1SKgtfSwT+pxvIAnSf7+4KbMJSLYzztGaEgx3ZsDsoaByw
         DIk3kvIbfnwO+DYlR+ylE7IcBednV1Xsg/xKC98C0JJmhUv92qhnXZ8FlabDhfJDBUPC
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ShN/rXSZKDhy7VrfNgli/IlBDtGr/3iqN8cN4k09Vn8=;
        b=NXjRzkKckWg55EOS0JKJUqMb6Nw80lf9oZ+52Mons50x2eAJ6r+KQ/oZMTv+haeT8l
         m+IFD5fiSNGrjJjYD1SuC0+eSGTaPxymz6M1DQVvsYozb7TlM9CKHaVr+1H8whuYfWBl
         oQCu9dJxNwsoruhuPEgf8atglY3cJ1t1nozCyjskfuxmyMugEnhj9qyVPrtWrapv28uf
         wB2spD02WuQGWY/3isdmYlhdiHwU6pd7AKm7UnzdBtUSrJQgW4QiiCiICpq4xooV3QWU
         hFJYd5Xhoc/PE3lc/Fd9uJ7Cjj5WcZYLzbZU2lE0ciR3YZrsgeZgKSAHemBtl1w8gevx
         Sl4g==
X-Gm-Message-State: AOAM532Dma1qfpXKLv0NON2WpTsGz2zkrd0Ere9wL1/PYsB81tBqRfri
        75Ka44N0251Zmvaw1teAb2Pn0A==
X-Google-Smtp-Source: ABdhPJxVYF5/Ot+Wn6f/JaZIXiK9MrZIXg76PjvIZTuYXtHcHsUoi1/vTnJRY+UCQUGAWjcHqtPuRw==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id y5-20020a5d6205000000b001e4b3fd9ba8mr30055376wru.426.1649807409850;
        Tue, 12 Apr 2022 16:50:09 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600002c600b00207a389117csm9169769wry.53.2022.04.12.16.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 16:50:09 -0700 (PDT)
Message-ID: <50aa0994-a139-dcd6-7483-83bf80c37394@linaro.org>
Date:   Wed, 13 Apr 2022 00:50:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8250: camss: Add downstream
 camera pin definitions
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca, hfink@snap.com,
        jgrahsl@snap.com
References: <20220409164556.2832782-1-bryan.odonoghue@linaro.org>
 <20220409164556.2832782-4-bryan.odonoghue@linaro.org>
 <YlTeFYp6IoPJfHEb@builder.lan>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YlTeFYp6IoPJfHEb@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/2022 03:04, Bjorn Andersson wrote:
> On Sat 09 Apr 11:45 CDT 2022, Bryan O'Donoghue wrote:
> 
>> There are a number of pin mux descriptions for the CAMSS block which are
>> defined downstream.
>>
>> Bring in the definitions now. Subsequent changes will optionally activate
>> those muxes for different sm8250 based boards.
>>
> 
> I'm not able to spot where these are referenced, are they not used or am
> I just failing the search today?

Used here:

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=br-v5.19b%2brb5-dts%2bsensors&id=96d26b916efca18450ff67d385d846b50d8eb7e1

I'll send out the RB5 patch once I get regulator_bulk_*() added to the 
imx412 driver

https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=br-v5.19b%2brb5-dts%2bsensors&id=e11966d8101350d0e76eb3e1520165864bdbc296

> 
> I would prefer that we don't sprinkle pinctrl states that potentially
> might be used at a later time...
> 
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 471 +++++++++++++++++++++++++++
>>   1 file changed, 471 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 3d6c617de045..91ed079edbf7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -3687,6 +3687,477 @@ tlmm: pinctrl@f100000 {
>>   			gpio-ranges = <&tlmm 0 0 181>;
>>   			wakeup-parent = <&pdc>;
>>   
>> +			cam_sensor_mclk0_active: cam_sensor_mclk0_active {
> 
> Please don't use '_' in the node name.
> 
>> +				/* MCLK0 */
> 
> I would prefer that we don't inherit the mux/config split upstream.
> 
> You can either do:
> 
> cam-sensor-mclk0-active-state {
> 	pins = ;
> 	function = ;
> 	bias...
> };
> 
> or:
> 
> cam-sensor-mclk0-active-state {
> 	mclk0 {
> 		pins = ;
> 		function = ;
> 		bias...
> 	};
> };
> 
> And depending on how this state is actually used you could lump together
> the configuration of several pins - with different properties - in the
> same state node.

Sure np

---
bod
