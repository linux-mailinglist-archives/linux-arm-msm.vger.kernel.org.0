Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64FE605E35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 12:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbiJTKxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 06:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbiJTKxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 06:53:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3B41DE3F7
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 03:53:06 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j4so32923460lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 03:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISfaqMEVOt5NqZEabZB8HqvfH97r0fX/dwv3Z1arI3k=;
        b=XrsYM0iklTxLXZILvOg1PPVfUoCjJp8xeQHMrJz7StSbFgE4mtixPNAIUAQpQtkNIk
         2zUilbpOZSD2UFSkKpLSyCcx74qLnyo9CuxjyWW1fHbpp9yXQki6QWznnRGEzQ/z7vH7
         KLg/0V+gmqqpmITyg+u3lJPI4exFRkg4w3bRG3mQy6urIdVWU5Bf3xYpzJLvuFy4BmfS
         MTFy5bRqg78PSBWqv5o3QR+zyn8/4f9KiQg+qQe5yW1TGv1utkLDkiXmoF8J9S1aXJ69
         NSO3x12qyuVK6Npj9hte5slILYjO1GxIcmffctQ/DQ6IOIVb03i/f14otGrA2YNuxE1I
         J4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISfaqMEVOt5NqZEabZB8HqvfH97r0fX/dwv3Z1arI3k=;
        b=qQHUqp1Nbh0LGvkASI7+aKGz0b+O2EmtugH/muCLUbdzW8xnDvA1Jp6/E+hxk/uPI8
         rn9j0plqVgByfrxJC5hsQu6aGZEGGFWUFDyMx7rl6aLk0bUoNLrekldVKGbYthzgQTNP
         ex9i94QygSxQUhORAVvHgMKDwylpLNnctGvUqscbDjtVW3r2tiV+Yw9axTM19RAYU0JU
         mpa0BseqxEWfHFMimcU28ks/FUmJ3bqpEgTb4FY61Vrx/F2vbAGlLVuxUzrseS48KYe4
         XxES7sHE6hD1VHYHptK2Ume+DWoYBSkUJ9W65YWh0YSPDmKGPgvp1jyDwPVTd3by6yxS
         C8TA==
X-Gm-Message-State: ACrzQf2PM8lDUfpbE1pl76RvcaI2GsIxMAF0Wm86mgIn83dFxNs4/7MS
        yFbgUnKA1+WcEPyP59vIttuVig==
X-Google-Smtp-Source: AMsMyM6xi13XCb8wPT/fKx+LGwtxsuOWmheJ8Ywz9Lm/ngGNRFgqX7aiftxA0zyAVVJooR5s4uB4Yg==
X-Received: by 2002:a05:6512:250c:b0:4a2:731e:ca1 with SMTP id be12-20020a056512250c00b004a2731e0ca1mr4869703lfb.357.1666263185032;
        Thu, 20 Oct 2022 03:53:05 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512308f00b00492f0f66956sm2661106lfd.284.2022.10.20.03.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 03:53:04 -0700 (PDT)
Message-ID: <f170d43e-f3b7-38f6-6376-2c9116413c1a@linaro.org>
Date:   Thu, 20 Oct 2022 13:53:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 13/15] phy: qcom-qmp-pcie: add support for pipediv2
 clock
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019113552.22353-1-johan+linaro@kernel.org>
 <20221019113552.22353-14-johan+linaro@kernel.org>
 <325d6c7b-ca96-df73-a792-4d156a710267@linaro.org>
 <Y1EPZBinv0tyZVqW@hovoldconsulting.com>
 <7eb3fb9a-ce4a-eee0-b6bc-cee6aa6bf37b@linaro.org>
 <Y1EnsKMhoWo+cIWo@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y1EnsKMhoWo+cIWo@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/10/2022 13:49, Johan Hovold wrote:
> On Thu, Oct 20, 2022 at 12:28:14PM +0300, Dmitry Baryshkov wrote:
>> On 20/10/2022 12:05, Johan Hovold wrote:
> 
>>> Here's your example diff inline:
> 
>>> @@ -2206,12 +2207,17 @@ static int qmp_pcie_parse_dt_legacy(struct qmp_pcie *qmp, struct device_node *np
>>>    		}
>>>    	}
>>>    
>>> -	qmp->pipe_clk = devm_get_clk_from_child(dev, np, NULL);
>>> -	if (IS_ERR(qmp->pipe_clk)) {
>>> -		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
>>> +	clk = devm_get_clk_from_child(dev, np, NULL);
>>> +	if (IS_ERR(clk)) {
>>> +		return dev_err_probe(dev, PTR_ERR(clk),
>>>    				     "failed to get pipe clock\n");
>>>    	}
>>>    
>>> +	qmp->num_pipe_clks = 1;
>>> +	qmp->pipe_clks = devm_kcalloc(dev, qmp->num_pipe_clks,
>>> +				      sizeof(*qmp->pipe_clks), GFP_KERNEL);
>>> +	qmp->pipe_clks[0].clk = clk;
>>>
>>> So here you're poking at bulk API internals and forgot to set the id
>>> string, which the implementation uses.
>>
>> I didn't forget, I just skipped setting it. Hmm. I thought that it is
>> used only for clk_bulk_get. But after checking, it seems it's also used
>> for error messages. Mea culpa.
>>
>> But it's not that I was poking into the internals. These items are in
>> the public header.
> 
> My point is that you're not using the bulk API as it was intended (e.g.
> with clk_bulk_get()) and you risk running into issues like the above.
> 
> And looking up the actual clock name for this is overkill, even in the
> case were it is provided, so we'd need to set it unconditionally to
> "pipe" (which is fine).
> 
>>> For reasons like this, and the fact that will likely never have a third
>>> pipe clock, I'm reluctant to using the bulk API.
>>
>> Let's resort to the maintainer opinion then.
> 
> I'll take another look at it too.

Thanks!

-- 
With best wishes
Dmitry

