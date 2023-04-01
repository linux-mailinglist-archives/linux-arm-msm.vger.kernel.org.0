Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE7406D30A7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Apr 2023 14:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjDAMHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Apr 2023 08:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbjDAMHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Apr 2023 08:07:08 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405171D922
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Apr 2023 05:07:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k37so32308365lfv.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Apr 2023 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680350825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7Qmqlgj/pXH3Y28DXqDizOgEn8pn2sV8hA+vFAOHvY=;
        b=Yg7crNRCm/hXBLfZLqn1mfEJ607+Poa1SAM2cROWjKYPWEWkwrGXkIFtCmzUGIu7zm
         OP5NMTzMNnWwF9WkT/pZ68PAs1QfrAQ+CoHVmJWWxRuZTEtqgJQFJgGsXwJamqCK5LvR
         11n17o/6aoIxrIymTaAtNKOu+OaKhTyaANQUOo2xdmkDK7fIgT/2BV1ekK3eAab1wElI
         J9NqlI2Zv+EHfiSvmcwgeGGFWuquuthrNXK8w4iu3bXaxu327RJ8Y6Co/H05D6pSn7dS
         5+uOwQ90IYJ28xf3mthvBBpNMNO6pGnVOU4Q3wPq4664X/cjWVFdfJ8JsdsSKqXUOceI
         /T9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680350825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7Qmqlgj/pXH3Y28DXqDizOgEn8pn2sV8hA+vFAOHvY=;
        b=PAEs/iAcqEle6YydU0YU03cQahK3oKPMTWIymv/SwuVjRoYCaTWnruF5mhcKB9IfNz
         YuSz/SDBhsfAsGlc62b8QzdDl0mJAcbRiAlXRHCmZTrTxvfnBLSnlwr/K/34iLIp+HGV
         7b5oGwklyaqjdq2xIBB/wyKho1wp8ZkWUGc7Xlfm7ap/8+/BQ3vPWLA1F81jQHPsa5kA
         Hq/zVhSZ07pXQKvrUF+zuaIk9lHtChgUrK4PFQgHdGWPL+GpgueWoHJVRKQL874ZBffR
         5qTyxkikRLQWPfBkZONXw0TOs7128ddANOLFWDwc6kLv995UX8AKNFxzgDFZhLX6pm7z
         SLng==
X-Gm-Message-State: AAQBX9f1WX3QuHod35vdl7yq83+AZ9NAT+1NExeByWwOnDQB0iUjJt2f
        H9nTy+rEkVqqMlrr0FAPxOJZAQ==
X-Google-Smtp-Source: AKy350ZeUt96m9Ua90W2xBAzxyacEvLLa/RKgrIImkJP0pE8+ut0lVJRyC55RxK3g3VKWlP0bwgljg==
X-Received: by 2002:ac2:523b:0:b0:4eb:cbb:9229 with SMTP id i27-20020ac2523b000000b004eb0cbb9229mr5804873lfl.59.1680350825498;
        Sat, 01 Apr 2023 05:07:05 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id h22-20020ac250d6000000b004cb24a027d2sm784282lfm.48.2023.04.01.05.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 05:07:05 -0700 (PDT)
Message-ID: <64f8f865-6a3f-118e-4080-91eb466a5acf@linaro.org>
Date:   Sat, 1 Apr 2023 14:06:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] irqchip: irq-qcom-mpm: Support passing a slice of
 SRAM as reg space
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230328-topic-msgram_mpm-v1-0-1b788a5f5a33@linaro.org>
 <20230328-topic-msgram_mpm-v1-2-1b788a5f5a33@linaro.org>
 <20230329034958.GC3554086@dragon>
 <c42b8c24-2159-64ae-d36c-92c69274f24f@linaro.org>
 <20230329132819.GA3590215@dragon>
 <14350eba-edb6-0243-5451-2e2b7d1bd3fd@linaro.org>
 <20230330013449.GB3590215@dragon>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330013449.GB3590215@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.03.2023 03:34, Shawn Guo wrote:
> On Wed, Mar 29, 2023 at 03:30:12PM +0200, Konrad Dybcio wrote:
>>>>>> @@ -374,9 +377,21 @@ static int qcom_mpm_init(struct device_node *np, struct device_node *parent)
>>>>>>  
>>>>>>  	raw_spin_lock_init(&priv->lock);
>>>>>>  
>>>>>> -	priv->base = devm_platform_ioremap_resource(pdev, 0);
>>>>>> -	if (IS_ERR(priv->base))
>>>>>> -		return PTR_ERR(priv->base);
>>>>>> +	/* If we have a handle to an RPM message ram partition, use it. */
>>>>>> +	msgram_np = of_parse_phandle(np, "qcom,rpm-msg-ram", 0);
>>>>>> +	if (msgram_np) {
>>>>>> +		ret = of_address_to_resource(msgram_np, 0, &res);
>>>>>> +		/* Don't use devm_ioremap_resource, as we're accessing a shared region. */
>>>>>> +		priv->base = ioremap(res.start, resource_size(&res));
>>>>>
>>>>> Are you suggesting that other cores/drivers will also need to access
>>>>> the mpm slice below?
>>>>>
>>>>> 	apss_mpm: sram@1b8 {
>>>>> 		reg = <0x1b8 0x48>;
>>>>> 	};
>>>> Yes, the RPM M3 core. Other slices may be accessed
>>>> by any core at any time.
>>>
>>> Hmm, let me reword my question.  Other than irq-qcom-mpm, is there any
>>> other Linux drivers that also need to request this slice region?
>> No.
>>
>>> Otherwise, I do not understand why devm_ioremap_resource() cannot be
>>> used.
>> drivers/rpmsg/qcom_glink_rpm.c calls devm_ioremap on the entire
>> RPM MSG RAM.
> 
> Can we use devm_ioremap() too instead of ioremap() here?
Hm. Yes, we totally can!

Konrad
> 
> Shawn
