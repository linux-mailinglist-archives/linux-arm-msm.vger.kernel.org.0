Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20377750AB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 16:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbjGLOWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 10:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbjGLOWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 10:22:49 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ABC1995
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 07:22:40 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1766882a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689171759; x=1691763759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IqgIPueFUvObMdtqLpPDVT+S6vncjR3E3Hz6m9Y1oow=;
        b=cIIzWRE4mtjWnQxfXCjdWnyeBPXXR53TA75FPRduSJYczxPCyzNzrbmb4czW05Prbo
         J6JcIoLHWVTcj9tmtg45QVny+awIbjTF7+gnYbTIzra6CdEfaka1/j26SzZ4ndm+T3HN
         l6QV5s6EFKIhjSn6g94sai9Bd7IveDKmX8h4n+GgUTkMkGUN62jEhbN2JscQw85yVC2K
         zWY8QDfRTYBsKe3JhsN7TmuX/LmIKX46GhMBoM4gLccMBtJfLG4ZhYbbT7IlAFzJRqHL
         bupDja5RwzdjuRx9LJNEo7O4YhGes2zYaVGfCZIyVPL1CIpUdb0KOLt45d3sHQ1kPfjH
         UtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689171759; x=1691763759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqgIPueFUvObMdtqLpPDVT+S6vncjR3E3Hz6m9Y1oow=;
        b=h0Wei3W1Rb/eUeBP2XH2b6tk4YsIKILeLVZTPjHugZ9uk/xxQz8V6dZmAoxFSi6EPm
         a7vfgMSVoBfuYok5HjmSo32gFR8GZFTV4ouzfYm3GphA00pAwT1udUgoxsnuRoVEQFpd
         CteJaCWmsX6ZyQfe4t2ONajXykK5MyQM7CIsihZ2IKlkq214cREa6A8VvgFhhmnpEBEm
         /lhYOtPpUierf17TVRZDB9fjdYFzFX7UkHvN7EWRVl0K3fYDjhm3qDMmZ/9XJ/MmM/eQ
         ict8jBIFdTfSEqog3sQRNjXtWlsrsXlazyhN3WuB9ToxbqGim+bkIENgQT9KbRbJ81iV
         BM1Q==
X-Gm-Message-State: ABy/qLYrMjWd2XykBE4Wd5XscrSu2bl3ZIU6NmRedaujmwXVzL0cYE7+
        loVz3dN/bm/niBnjJodq9inUiA==
X-Google-Smtp-Source: APBJJlH4rWD1FiIK9TcwLHZ7qIEY9eOufK42OGUuMk0um7uxrlk9UIxsBVKWnp2Z884Kt/9jVeE4hw==
X-Received: by 2002:a05:6402:440b:b0:51f:e0f0:f2cd with SMTP id y11-20020a056402440b00b0051fe0f0f2cdmr2774872eda.3.1689171759329;
        Wed, 12 Jul 2023 07:22:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e3-20020a50ec83000000b0051e0ea53eaasm2833835edr.97.2023.07.12.07.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:22:38 -0700 (PDT)
Message-ID: <69c01f0f-4eb0-bb44-a238-5c9ce5beede9@linaro.org>
Date:   Wed, 12 Jul 2023 16:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/7] dt-bindings: soc: qcom: Add qcom-pbs bindings
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc:     pavel@ucw.cz, lee@kernel.org, thierry.reding@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        u.kleine-koenig@pengutronix.de, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20230621185949.2068-1-quic_amelende@quicinc.com>
 <20230621185949.2068-2-quic_amelende@quicinc.com>
 <20230626135857.GA3118929-robh@kernel.org>
 <2e871e21-a81d-0d7d-993b-9a9d7bd9d962@quicinc.com>
 <e7298704-5a03-0961-90a3-dab4af60c326@linaro.org>
 <32e9a512-fd74-b2f6-6b8a-fefb9ad5912d@quicinc.com>
 <431faa87-d152-5f7a-40fd-8b6fe26f0bb9@linaro.org>
 <71e1f36f-8fd8-9d61-d563-577d4fb54f10@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <71e1f36f-8fd8-9d61-d563-577d4fb54f10@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2023 22:12, Anjelique Melendez wrote:

>>>
>>> On PMI632, peripherals are partitioned over 2 different SIDs
>>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/pmi632.dtsi?h=v6.5-rc1#n42
>>> and https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/pmi632.dtsi?h=v6.5-rc1#n149).
>>> Unfortunately, the pbs peripheral and the lpg peripherals are on different
>>> PMI632 devices and therefore have different regmaps.
>>>  
>>> If we get rid of the pbs node we need to get a handle to the proper regmap.
>>> I see two possible options, we could either introduce a new client property
>>> which points to a peripheral on the same device as pbs.
>>>
>>> i.e.
>>> 	led-controller {
>>> 		compatible = "qcom,pmi632-lpg";
>>>       		#address-cells = <1>;
>>>       		#size-cells = <0>;
>>>       		#pwm-cells = <2>;
>>>      		nvmem-names = "lpg_chan_sdam";
>>>       		nvmem = <&pmi632_sdam7>;
>>>       		qcom,pbs-phandle = <&pmi632_gpios>;
>>>       		..... 
>>> 	};
>>> Then when client is probing could do something like the following to get the regmap
>>>
>>> 	dn = of_parse_phandle(node, "qcom,pbs-phandle", 0);
>>> 	pdev = of_find_device_by_node(dn);
>>> 	pbs_regmap = dev_get_regmap(&pdev->dev->parent, NULL);
>>>
>>>
>>>
>>> Or we could use the nvmem phandle and just have something like this in client's probe
>>>
>>> 	dn = of_parse_phandle(node, "nvmem", 0);
>>> 	pdev = of_find_device_by_node(dn);
>>> 	pbs_regmap = dev_get_regmap(&pdev->dev->parent, NULL);
>>>
>>>
>>>
>>> Let me know what your thoughts are on this.
>>
>> Rob asked you - "Is there more than 1 instance in a PMIC?" - and you did
>> not answer positively, just mentioned something about drivers in
>> downstream, which do not matter. So is the answer for that question:
>> yes, you have two instances of the same PMIC differing by presence of
>> PBS and other features"?
>>
> Sorry that was a misunderstanding on my part.
> Yes, answer to Rob's question should have been "We have two instances of PMI632,
> where one instance holds the pbs peripheral and the other holds the lpg
> peripherals. The child node for pbs is needed so lpg client can access
> the PMI632 regmap which contains the pbs peripheral."

I guess I miss here something. What is "LPG client"? I don't understand
why this LPG client needs existence of PBS node, to be able to get the
regmap.

PBS is a child of PMIC, so it can get regmap from the parent. What's
more, which DT property passes the regmap from PMIC to LPG client?

Best regards,
Krzysztof

