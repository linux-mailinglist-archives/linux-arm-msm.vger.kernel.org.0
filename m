Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B9C5F9CC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 12:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiJJK3I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 06:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbiJJK3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 06:29:06 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C5B1CFEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 03:29:05 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id c2so6852762qvo.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Oct 2022 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Ty/SQ7ZQb5ub5WO9P8Lo7LRFzcBze++LmcsjSK0IUs=;
        b=SbUTQwNXF6cpHzOUKB1Eotm+CoeI6DGaiOBfiJR4e3h/fAZDpIg7aILfdKMDA7cuZ2
         lVgKfsv1H2ABJopnsyON6w/78z9cAG6qCBDxeb+xv+qsH5Ae5hM9/zYYhjDmZXtVvHmT
         cjwJ1yl/iiaIam9sgblVmhCopRSn343SeiRhqXlevol+G4H7qZxKe5/P27SoylDLb7TY
         uSbwxOcqb1DQdZHWDar/g+e0SMWVS8pBHiWlYMyzpysuKRekYoo+JYTMHbYOWD0VGtFV
         ws85HrSHx8Chltg2HsfdtngDRSJi71AD3GraHpDqJ/kp62kGFUZKNFpUHuYeNsAomiI3
         5O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ty/SQ7ZQb5ub5WO9P8Lo7LRFzcBze++LmcsjSK0IUs=;
        b=ZK0Rn/xGQjvkio89LKn15WEa+UPMp/0xR/aCCmnMawzZkOb4O1/mFQDzJAl7uJJ0TA
         BiMF1Q6Nzopz3Ae5ul4quQsZhNlCfPf9xk8Ti2TJV+YoI0QR+FRhNdqZ7KU7zv+oIZty
         ffDdQEf3dL2XPtIW+W/iKek4EpU+u5HEHi/y5/+O7+9Bh7sEYzk2aNlhQxRS/BTGorU4
         s5xaIRFOFRq9XrUrP3XX35VQA0CfRygLjVNK8yhNQpQm7BlK7mg05QtcLBvLp9xqH0/0
         KiUfU2CXCaOjLak/ahil3PGoQLtCo5sjlDKRJUGcTSsKD2cFl21TIxWJbQebn491zZLC
         zRBg==
X-Gm-Message-State: ACrzQf3/l5+iy52Ks5PAhlGwMVQWgWx2KbgSy5AjUa/mQXjjceeAoeSL
        xrKRYqPJUgD45Mj/5riWSq2Rvg==
X-Google-Smtp-Source: AMsMyM4UpI8bhDJqFqWEygDw1Ur2ePekgUCEnUAFdHhbnnGN696lz2RnVs4cGmw1vQYo2W2/TttGqw==
X-Received: by 2002:a05:6214:2b05:b0:4b1:d595:3a24 with SMTP id jx5-20020a0562142b0500b004b1d5953a24mr14514640qvb.71.1665397744246;
        Mon, 10 Oct 2022 03:29:04 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id h3-20020a05620a244300b006d94c499d8fsm9930615qkn.50.2022.10.10.03.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 03:29:03 -0700 (PDT)
Message-ID: <d97b7d32-6e27-5a04-336b-0af6bd92c83c@linaro.org>
Date:   Mon, 10 Oct 2022 06:26:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 34/40] arm64: dts: qcom: sm6125: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
 <20220912061746.6311-35-krzysztof.kozlowski@linaro.org>
 <20221009174621.ecamh76faoibuykv@SoMainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221009174621.ecamh76faoibuykv@SoMainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/10/2022 13:46, Marijn Suijten wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>> index 8c582a9e4ada..1fe3fa3ad877 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>> @@ -387,19 +387,19 @@ tlmm: pinctrl@500000 {
>>  			#interrupt-cells = <2>;
>>  
>>  			sdc2_off_state: sdc2-off-state {
>> -				clk {
>> +				clk-pins {
>>  					pins = "sdc2_clk";
>>  					drive-strength = <2>;
>>  					bias-disable;
>>  				};
>>  
>> -				cmd {
>> +				cmd-pins {
>>  					pins = "sdc2_cmd";
>>  					drive-strength = <2>;
>>  					bias-pull-up;
>>  				};
>>  
>> -				data {
>> +				data-pins {
>>  					pins = "sdc2_data";
>>  					drive-strength = <2>;
>>  					bias-pull-up;
>> @@ -413,13 +413,13 @@ clk {
>>  					bias-disable;
>>  				};
>>  
>> -				cmd {
>> +				cmd-pins-pins {
> 
> Is this double -pins-pins suffix intended?
> 

No, thanks for noticing it.

Best regards,
Krzysztof

