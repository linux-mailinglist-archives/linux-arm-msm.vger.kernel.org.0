Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE24574658
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 10:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiGNIJb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 04:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiGNIJa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 04:09:30 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B572B19C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 01:09:28 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u14so1272928ljh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eug4fwts06ljl3bIhOz7HlYGU3mc05ie4gAPEb/LZr8=;
        b=q9TvXr5zTpj+xu+3bRrE7S3Z45IY+DANlI/KHzaSL88ZBSqjQx7BHz9rdG2rkL5ZYS
         jTxizTW9LYqqBHwGNFgCubPKnnP+h9RRtMAGTSTZ5Fjw4Qp2xmFU3lwr6aitQecO3E8c
         +AUbokK37PRczpB+/U4JFeyl7+c3aM6zPODf8Qsm9DJ58279IQYXlr6cyDW0RmsqmId0
         OvwYycgi4Ock2+WZpt6cx+3z5IPZPeOXBXNOSHW8uqiDsVjEiax9SBsW/WZLERW4i0aA
         J0YJZcnksFOYkGSxlDzkdTMCI5b5TfN9WsPIwEB3vlfPI+XQczpXbTJ0/Sjl5TX4qwsG
         1FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eug4fwts06ljl3bIhOz7HlYGU3mc05ie4gAPEb/LZr8=;
        b=ZlHsQ9wF/ItLd2xrRXKShBQyYbp62hEnpcaHwd1JujG6sYRB6zZ5ycqcfE4t47DNRX
         1RkApnP4ahE8iaT+9y9XrAA5AwUO0aBuykCRpLDywUf9V9EFwyzxtzmxGAHH6RAhFGb4
         oqsLMnkiJGleYLH/AQsZsMu+TmPDg77NB4s0WvxjYFBucxw3hCusomEmuM5OC9QbThXU
         63p8Ya4i/zuaVdRZ8G+Vw2cC0ARv93o/4Dy7tEaxov+UKS9kRKLW/8Lo9TsD892w6HAz
         zpy+LvJsGgqtI/rI5YkNM7bPHQk1MPrGR5W2DJ/9oG2kp4EzkEHF8fWayP5vCIfDM23a
         ETBw==
X-Gm-Message-State: AJIora+D7ZWFF5CMCOguhGgtlvWCTzd6swYgqclXFEhwOvKsPAHFbE5C
        PMIOpMhWnXezlFeQduoViOP1iA==
X-Google-Smtp-Source: AGRyM1uNyTDieNyYglod7hULm/TGluwst3C+RtGk1MIeEE0gr+/XKgDr5Xn0Z802XbVUIS/v/JmC8w==
X-Received: by 2002:a2e:3606:0:b0:25d:9de6:629b with SMTP id d6-20020a2e3606000000b0025d9de6629bmr162045lja.339.1657786166289;
        Thu, 14 Jul 2022 01:09:26 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f6-20020a0565123b0600b004785b66a9a4sm227687lfv.126.2022.07.14.01.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 01:09:25 -0700 (PDT)
Message-ID: <14e42eda-7eab-0570-b6c1-101722c8aa1e@linaro.org>
Date:   Thu, 14 Jul 2022 10:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
 <Ys85KUGnlXlUI+zE@builder.lan>
 <50ce334b-4c13-1eb3-0e6e-96c9ccee7e1d@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <50ce334b-4c13-1eb3-0e6e-96c9ccee7e1d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/07/2022 09:41, Dmitry Baryshkov wrote:
> On 14/07/2022 00:29, Bjorn Andersson wrote:
>> On Mon 20 Jun 06:07 CDT 2022, Dmitry Baryshkov wrote:
>>
>>> Add pxo/cxo clocks to the GCC device tree node.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> index 47b97daecef1..61e3ab0ebfd3 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> @@ -50,13 +50,13 @@ cpu-pmu {
>>>   	};
>>>   
>>>   	clocks {
>>> -		cxo_board {
>>> +		cxo_board: cxo_board {
>>
>> As requested by Krzysztof, please use clock-output-names to specify the
>> name of the clock, and rename the node "cxo-board-clk".
> 
> Actually I believe Krzysztof agreed (and acked) this change, as it 
> follows the example of existing boards.

Yeah, because this would be out of scope of this change. In the long
term fixing the node name would be still useful, because DTC W=2 complains.


Best regards,
Krzysztof
