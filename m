Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E126152FF36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 22:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238741AbiEUUNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 16:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbiEUUNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 16:13:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABF92CDC0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:13:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id l13so12838808lfp.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 13:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=W60s9aC6h+YttGv57xQJp2IO+r1bH6/jqV6U6sCYyBg=;
        b=gCtJUbVglQ1XsI1aXHh7VkHcRPlEu9D4hQ7+GR3Kr0MiVJkjXAyqSKRdRVNRZ6mpPM
         YHs6THJaZ5Lrhs5+K1eDaiyPeOxHBGODtrFOZLsLQKt4bV8u8dbIDGhCAcDu/YxK82yc
         LOhfV5lbMuV4VGzhdAvqJqTVwIDQvudDNPiIDLf7YbJ6PbhyvDl1KstjVH4QBP4ayRlZ
         q8D/RiGBJAT0M/2RUvXfdzUJxH2jPF/FvxmwnpQAiRKn5aPb8uvvLdtu94qtcpJYmccf
         hG6TDYtNthjk0LIUdlIvn4JbozExIHuq7c5V9Diq50zPractTGaALwXy2Mwd0YsTfXob
         QbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=W60s9aC6h+YttGv57xQJp2IO+r1bH6/jqV6U6sCYyBg=;
        b=x/Xdhp5y66/dbkJoZCdBDC6SDQ7P/M0BMwYQ3YhTfs1i7BYqUeBQ2KBLrRnDHYad+m
         uvMeaB7JS21ngGzAGNoTR4/c/OpkZazdtXAXWRpD/m4CFbK8vmf56nNqdpyYFBokeVu2
         HAibBEAWM3rYJMeIgU93ru712nkREm+hUxeXOxgPn4auPWXL5tweNO9DBtzXpFs3jMtL
         XyCVI4QgDsRaBTaTUTJmQ5z16YDKRpESQutt0QpDYW9VBrJMZ25PTKbvH9I1fpRye0UV
         RhqCfh4F8WghnBLVI3Lcb/vJ3WjT29FUBGush7bmVVXhzMfjEpqs7wxMdTmeff18QAQM
         E/5Q==
X-Gm-Message-State: AOAM532HV3psogWbGGWTl8fsCO1KoHY00al4Rpvj8dS6lZfSu0qZBnqE
        hjENmHVFTtRKquQd6TNTijupEuCMquelFw==
X-Google-Smtp-Source: ABdhPJyywIjD2uZbgcFOxlxXlv/g5WJba8xGnwD5KWsQdAsxtqiSOh6MjNl9xCr3q1QhLRfMCZW1TA==
X-Received: by 2002:a05:6512:1520:b0:443:ec43:5fe8 with SMTP id bq32-20020a056512152000b00443ec435fe8mr11410945lfb.589.1653164031443;
        Sat, 21 May 2022 13:13:51 -0700 (PDT)
Received: from ?IPV6:2001:470:dd84:abc0::8a5? ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id a16-20020a056512201000b0047255d21159sm1175151lfb.136.2022.05.21.13.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 13:13:50 -0700 (PDT)
Message-ID: <86ac74b5-2964-fd0d-bf50-12aee73d5fec@linaro.org>
Date:   Sat, 21 May 2022 23:13:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 01/11] arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy
 by default
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20220521152049.1490220-1-dmitry.baryshkov@linaro.org>
 <20220521152049.1490220-2-dmitry.baryshkov@linaro.org>
 <20220521160652.oyqvurbjql23n243@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220521160652.oyqvurbjql23n243@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2022 19:06, Marijn Suijten wrote:
> On 2022-05-21 18:20:39, Dmitry Baryshkov wrote:
>> Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
>> They should be enabled in the board DT files. No existing boards use
>> them at this moment.
>>
>> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I also added my:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Please excuse me. I didn't pick up your R-b tags by mistake.

> 
> To v5, to confirm the Suggested-by.
> 
>> ---
>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index 240293592ef9..8697d40e9b74 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
>>   				phys = <&dsi0_phy>;
>>   				phy-names = "dsi";
>>   
>> +				status = "disabled";
>> +
>>   				ports {
>>   					#address-cells = <1>;
>>   					#size-cells = <0>;
>> @@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
>>   
>>   				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
>>   				clock-names = "iface", "ref";
>> +				status = "disabled";
>>   			};
>>   		};
>>   
>> -- 
>> 2.35.1
>>


-- 
With best wishes
Dmitry
