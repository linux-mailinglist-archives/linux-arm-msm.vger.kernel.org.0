Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31D586BC1C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 00:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbjCOXwU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 19:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbjCOXwR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 19:52:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C45824BFD
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 16:52:13 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f18so209406lfa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 16:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678924332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTkT6oATf2mknBlo+CEz3GQDcOlS8+L67bLlAy6zbmY=;
        b=RWtv1MwFi8oZoOEq/QNzWdgHkzGNSwmQD9Pq4li+wte5asL7TZ06kLryPmxbnaJI+9
         sex0BOne07tCELRgLvSWi9HnwCRX3oPZUvgdUIYyo/uRwerMqBXLiQH1+JXh23X+EzqQ
         yzPK4/t6cEo5nym01JzQZ4oXjlAKrZGAl6T8pXWbcZOzzZDneWF4sVlby7dPDvB+qD2u
         5HVeHEnq0gg6f4okP+wlN9JgSW/hsFu225hvvTcPIR/poaysXw2aSpdWf4VQusNP7whE
         Gu8jQ9TtJechVWkOwG/OTR8mNtg51otANVHWC72ymWxHPxI9ldrHAMx7gm5yyiaj2Vyn
         ajug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678924332;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTkT6oATf2mknBlo+CEz3GQDcOlS8+L67bLlAy6zbmY=;
        b=58NFl3i5bjihzU8202KixN3tAQZRl/ttyxkn3/T0RCVhJ6XwY/klZisYYbqxYUvszW
         tAHCZqDPH9ttF8zLIDt12dCh5C5MGuLTVpwwez9qY9hxmCeagGCLbWFT8wq+mjwz0hMp
         xapzeTJ2T7cePo8TqiXJbaQ3X+yUbmUlWheDNUUfLyZrqc1DrE5zLaYgNDS2I5RuGibR
         Tn3rJua25uqxlLUqUWwoZY3uGsMTzedIh8YVdyiNZJUHdh6di4mUc/HJKllxP4luH3bH
         HmCT4EE9zfYSDR3TYJcEoO5vE0yyFS8qfk10/1HhMZg2aOW2v4nROWdokIcPSkxKrgfp
         sHHA==
X-Gm-Message-State: AO0yUKUmfwKSFu355D2fuB8IeoTqZguE11YdzQW5V43Z4DfbUQlypH1O
        ecyhfrki1jaho/N1QC2Noj23zQ==
X-Google-Smtp-Source: AK7set/YXODHkQ0JbL6pGCYu1xosbNt66OnbqLBMIJEMqg5lhcgh9tU8bVvelH1qBZvsWCNxp0gTDA==
X-Received: by 2002:ac2:52ad:0:b0:4e8:3f1f:3646 with SMTP id r13-20020ac252ad000000b004e83f1f3646mr2501910lfm.55.1678924331882;
        Wed, 15 Mar 2023 16:52:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25631000000b004cc7026d95asm986461lff.259.2023.03.15.16.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 16:52:11 -0700 (PDT)
Message-ID: <79731f2a-83e5-1e35-d450-456492cc5df2@linaro.org>
Date:   Thu, 16 Mar 2023 00:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add base qrb4210-rb2 board dts
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org
References: <20230315210145.2221116-1-bhupesh.sharma@linaro.org>
 <20230315210145.2221116-3-bhupesh.sharma@linaro.org>
 <20230315223604.ofy7vm3bpccf5aul@ripper>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230315223604.ofy7vm3bpccf5aul@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.03.2023 23:36, Bjorn Andersson wrote:
> On Thu, Mar 16, 2023 at 02:31:45AM +0530, Bhupesh Sharma wrote:
>> Add DTS for Qualcomm qrb4210-rb2 board which uses SM4250 SoC.
>>
>> This adds debug uart, emmc, uSD and tlmm support along with
>> regulators found on this board.
>>
>> Also defines the 'xo_board' and 'sleep_clk' frequencies for
>> this board.
>>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
[...]

>> +	vmmc-supply = <&vreg_l24a_2p96>;
> 
> Is there any reason why this platform doesn't require the vmmc supply to
> be driven to HPM? This has traditionally been coming back biting us
> through some stability issues later.
Do we even support HPM/LPM on SMD RPM?

Konrad
> 
> Regards,
> Bjorn
> 
>> +	vqmmc-supply = <&vreg_l11a_1p8>;
>> +	no-sdio;
>> +	non-removable;
>> +};
>> +
>> +&sdhc_2 {
>> +	status = "okay";
>> +
>> +	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>; /* card detect gpio */
>> +	vmmc-supply = <&vreg_l22a_2p96>;
>> +	vqmmc-supply = <&vreg_l5a_2p96>;
>> +	no-sdio;
>> +};
>> +
>> +&sleep_clk {
>> +	clock-frequency = <32000>;
>> +};
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <37 5>, <43 2>, <47 1>,
>> +			       <49 1>, <52 1>, <54 1>,
>> +			       <56 3>, <61 2>, <64 1>,
>> +			       <68 1>, <72 8>, <96 1>;
>> +};
>> +
>> +&uart4 {
>> +	status = "okay";
>> +};
>> +
>> +&xo_board {
>> +	clock-frequency = <19200000>;
>> +};
>> -- 
>> 2.38.1
>>
