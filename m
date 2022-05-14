Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA8352711A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 14:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbiENM7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 08:59:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231176AbiENM73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 08:59:29 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C270865A2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 05:59:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d15so18743799lfk.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AIJzyHdeQPBN17hd4ci+FEoG/FDDqfH1kiPMV3V90kQ=;
        b=gxgDf7bEYIeFz6styE/14U1dRliJxq42KGSAHdmKXexA7Ndbw1QIoZmUWoeM+XFJ6g
         5dCEXoezlAM0sHE1IA8UJ1YAhXnqQBtZHAUMduTtN0vAqQIaZELHz/DJBmTaILCD6nH5
         RanyhNM2Z0SLBnViNcG4p8bWGKDq7JLckOwtfbLcYf1mQbR8yihj9FSqfM1ijFOTlvZy
         GfCFUpKWThmbrgt0ypmH5JEkzxplJ0xVi6kbT0IvshrRafO5Ff7GlT+HOsbA6yqJgHZI
         Zzj5miBiRwkTtLVU8lg7XvvUdyIfualew6QK9LSppE1HYNlTgqeZpYIO4RAIQZ1oNUT0
         0kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AIJzyHdeQPBN17hd4ci+FEoG/FDDqfH1kiPMV3V90kQ=;
        b=IBYzawYL770yZcVUDVx/uCvSY3OJCI6L3fGMIR/l6G7An4rp4rm66sXDT6VK5D25wD
         C4LKO14K2iOyv/qX5TkFKbX4EN3B37/1vE9yDOURBAdlU3ddgM+Kmqygfw977fyH6D2s
         dFF3pH3V4+JHzJdCLigV0mLTtm7+NrMGNKppcLy5/Wcu0VknzbA/pHWnfR3GzJVTEexi
         9TsBO2pW5+zr8aRcHnBk2r5+poEKxHZ5uu4g+XiTPt4cWD7AkY/rG2PAESqGXD2g+gF/
         KlL+QHsPt3cKrtQ45T3Bzf2/XYP5ARyO68xhpPQg/VnEDvbDeqQCh0U/UItO5W28MJ0w
         tyTw==
X-Gm-Message-State: AOAM530/GoeZ2xOY6n/5S1nKKxT/po1Gi8Ja2lq74hw3keXkNg917u2c
        HaNZbZFAKH2MPaJAfypXROC1qg==
X-Google-Smtp-Source: ABdhPJzSep50zFj5sKRc77gBdrfPUV8wkrPE2c4+YqYgnReJPOJcs6xbD8oVC742gF6bA1mlCzBUPQ==
X-Received: by 2002:a05:6512:b1c:b0:474:193a:755c with SMTP id w28-20020a0565120b1c00b00474193a755cmr6817152lfu.340.1652533166101;
        Sat, 14 May 2022 05:59:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m12-20020a2e710c000000b00251fcb946d2sm824820ljc.119.2022.05.14.05.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 May 2022 05:59:25 -0700 (PDT)
Message-ID: <39864947-af5a-2a0c-79b0-ff504b319cd1@linaro.org>
Date:   Sat, 14 May 2022 15:59:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm630: disable dsi1/dsi1_phy by
 default
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220513234518.3068480-1-dmitry.baryshkov@linaro.org>
 <20220513234518.3068480-3-dmitry.baryshkov@linaro.org>
 <20220514093756.f7gqpo2ok2osbcm4@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220514093756.f7gqpo2ok2osbcm4@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/05/2022 12:37, Marijn Suijten wrote:
> Title copy-paste error: it should read dsi0/dsi0_phy.  Can you also
> reorder this patch together with the dsi1/dsi1_phy one, and perhaps they
> should just be squashed?  Otherwise, does a Suggested-by: make sense
> here?

Yes, it does. Please excuse me.

> 
> - Marijn
> 
> On 2022-05-14 02:45:12, Dmitry Baryshkov wrote:
>> Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
>> They should be enabled in the board DT files. No existing boards use
>> them at this moment.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
