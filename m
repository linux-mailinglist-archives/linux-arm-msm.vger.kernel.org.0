Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 434866679D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 16:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234690AbjALPtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 10:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240659AbjALPtC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 10:49:02 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C9468792
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:38:08 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id v25so28946701lfe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UokpHPU0/CDmS6F/enVQfF6HXAy0LQLEXmkgeAwI3bg=;
        b=WxWNIC31SmiuNKufHtV6TyXqziRsMxBeG0xQXWKPMvwRg6FDjWqF/QeTxjgo5dkgB6
         v7UglTiyMI9Uy4Ai1Td5rrmiv3xtcUsy2qtsZ+nmq0Y9vA2bt3R8lrIHxGvdYVWqfMn+
         0ifFUW9eVe3HXrkPMjnbuaAY5BIzpHUUgUmQId90JGAPg3BJ93zBFSB2AUH8RRFqoQJs
         AcEHD3HZj0bIHNGVijsc2BRtkKl6PZukwS+6inErWZnde/ZJN34+keWfdQoProrSopGb
         USjZENwpREYJC+nIMW4Mwn5ZwmJS9fQeWk4OfK8fJ9/H/9GhXyAMxVlxVlbEdAWb4tBM
         SWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UokpHPU0/CDmS6F/enVQfF6HXAy0LQLEXmkgeAwI3bg=;
        b=f/7n/Hp+dh2jkHZTKqEiRcl9ERg+6KFUwmjzhfrGciIwVxphs7VzZdY9M76pmn0fs8
         Wucvt79nmQx4DrF/LsN0dq1QInfXo+twR4MIzgeJxd+DKS05PZ/EA9Hj6IUA/ZIpi9RP
         KHMgV4i9peSYg8ART6iex4Yf0JtQXpzLNI0f0/GkUjIo+zGEzeJKRt10j9C2TOiAtCpI
         mSRULAkdGPZIZ778eK6glD54ymd4GIi8BzRhyqElCNdqseCwzBL93gSSFiAE1wr1QsLT
         5c2I1Dum5PxUkzHA+1ntbRp6LCFCGssNOLnMNxOd3IBEDjwTF+5v90KXx+DsZnLFLsWD
         Dbfw==
X-Gm-Message-State: AFqh2kphlBnLHP4m7Z+3qkWyx+daTGz8NoGpM6OJJHLGFXhFNTBQ1YPK
        Qt8wcMn2hEj5SGVrZU3F529uLA==
X-Google-Smtp-Source: AMrXdXu/la29HyOnu94jfg8ykt0Qza8Mg/nw9w7LUQBl6gtbKhWWHiwg23T4Cz5bQucfSIjk5D+nLQ==
X-Received: by 2002:a05:6512:1390:b0:4cb:4307:eda5 with SMTP id p16-20020a056512139000b004cb4307eda5mr4428904lfa.25.1673537886932;
        Thu, 12 Jan 2023 07:38:06 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b004a47e7b91c4sm3300642lfo.195.2023.01.12.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:38:06 -0800 (PST)
Message-ID: <fdd82d5f-d66b-b297-ed28-f44e9806e020@linaro.org>
Date:   Thu, 12 Jan 2023 17:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-5-dmitry.baryshkov@linaro.org>
 <3cd04f83-94df-931c-728a-f015ad05d876@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3cd04f83-94df-931c-728a-f015ad05d876@linaro.org>
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

On 12/01/2023 17:05, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:57, Dmitry Baryshkov wrote:
>> Add device tree node for the CBF clock.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 37ebd8a3b2c8..e5a638b85ffc 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -3558,6 +3558,13 @@ saw3: syscon@9a10000 {
>>   			reg = <0x09a10000 0x1000>;
>>   		};
>>   
>> +		cbf: clock-controller@9a11000 {
>> +			compatible = "qcom,msm8996-cbf";
>> +			reg = <0x09a11000 0x10000>;
>> +			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
> Shouldn't this be RPM_SMD_XO_A_CLK_SRC? I don't see BB_CLK
> referenced *anywhere* downstream, other than being defined
> in the 8996 GCC driver..

Good question. On the schematics I have the CXO input is connected to 
the BBCLK1 PMIC pin.

> 
> Konrad
> 
>> +			#clock-cells = <0>;
>> +		};
>> +
>>   		intc: interrupt-controller@9bc0000 {
>>   			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>>   			#interrupt-cells = <3>;

-- 
With best wishes
Dmitry

