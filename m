Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2023605F2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Oct 2022 13:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiJTLpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Oct 2022 07:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbiJTLpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Oct 2022 07:45:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA82667C8D
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 04:45:09 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g7so27984966lfv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Oct 2022 04:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVvr8KxW1V+9Gb+qu7bNAZijhKE3cc/WUDrzhWJvxIQ=;
        b=mEf1U//XhnHRLuDAbGHkWNCIJ4Xwl+zbnVKk9MxuYuy4GIofr496UwlSWyKefdJ6i3
         Mqc0TG8UOlG7VRBJIunMYhM8Mynu5OdocFDrTtHluqxZcOQm89Ec9g6cOPUHRqTOiUHC
         rDB+y9mvQ50dLIrdX8QBU+xr/zCNzTN0HPMHS5U3zRlVPhRLrVNB77KECBFUo8taFMV9
         Zx8CLsldpWuFHgG83tLNEeq8LlhcwraAMB0HgQM4ucfx09SW/mQ2p+z0BEzUf/unHONv
         WIqeUmleH+LhQYMPBUf1kY+ksu2whH2faMQi1ID5vz3TYP6vUuhSpWFmkpY3qtxf4TeX
         l4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVvr8KxW1V+9Gb+qu7bNAZijhKE3cc/WUDrzhWJvxIQ=;
        b=qUftjhujLY6BjVtAWzm+EDVEf47DjSbY7lmUQlxyB1DwKhke8lM1iUMX75JvRglcIJ
         PcsAOq5e9NMKx7GjceP8IEaap0y4+bE3QiACCqWMGHmZhiReaSj7kymdue8lWtLuJcVt
         bxN5KFwmGAtreyjGMjR3BmKj7pMoHXIqjDa/lcUxvG2Zbv2EdY4Qzj5dZ81ed6tabF+7
         jLA9JxARB+SuJLPEZ8xIlnz5mHCR/1Atez1XHlgJvS5gJnWMhJgQJHLbSANmKTVTUU4X
         DbtG2dGZSQm+tZHB6A1s5PehF80PKRx3k1/Ielv5iPl1ux/JQOmr0w/IUB75FOkA0I2v
         4ASA==
X-Gm-Message-State: ACrzQf0TedWTFddaJ3komLcWltyfEBOiEidbXKzSQqLN4wO79pR+5Tg1
        rRYaTWcRU/IFMYqDFFBw9cf/SQ==
X-Google-Smtp-Source: AMsMyM6buEz9fja4jmvTnnZcwkBWu5RLSNSfpRz08IEzx+CztOx9iDPvxUD+YhC48ym9gs6Es1EgdA==
X-Received: by 2002:ac2:4ed1:0:b0:4a4:4773:fef0 with SMTP id p17-20020ac24ed1000000b004a44773fef0mr4385717lfr.668.1666266308078;
        Thu, 20 Oct 2022 04:45:08 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q3-20020a2eb4a3000000b00262fae1ffe6sm2860738ljm.110.2022.10.20.04.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Oct 2022 04:45:07 -0700 (PDT)
Message-ID: <7eb2371f-063e-df97-1b3c-94859e35e4d5@linaro.org>
Date:   Thu, 20 Oct 2022 14:45:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/4] PCI: qcom: Use clk_bulk_ API for 1.0.0 clocks
 handling
Content-Language: en-GB
To:     Johan Hovold <johan@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org
References: <20221020103120.1541862-1-dmitry.baryshkov@linaro.org>
 <20221020103120.1541862-3-dmitry.baryshkov@linaro.org>
 <Y1EsOGhEqNe9Cxo6@hovoldconsulting.com>
 <30850757-0e39-bd3d-0d4f-cdb4627b097c@linaro.org>
 <Y1Ex5ks9PIJmPfkf@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y1Ex5ks9PIJmPfkf@hovoldconsulting.com>
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

On 20/10/2022 14:32, Johan Hovold wrote:
> On Thu, Oct 20, 2022 at 02:22:47PM +0300, Dmitry Baryshkov wrote:
>> On 20/10/2022 14:08, Johan Hovold wrote:
>>> On Thu, Oct 20, 2022 at 01:31:18PM +0300, Dmitry Baryshkov wrote:
> 
>>>> +	res->clks[0].id = "aux";
>>>> +	res->clks[1].id = "iface";
>>>> +	res->clks[2].id = "master_bus";
>>>> +	res->clks[3].id = "slave_bus";
>>>>    
>>>> -	res->slave_bus = devm_clk_get(dev, "slave_bus");
>>>> -	if (IS_ERR(res->slave_bus))
>>>> -		return PTR_ERR(res->slave_bus);
>>>> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>
>>> Are you sure there are no dependencies between these clocks and that
>>> they can be enabled and disabled in any order?
>>
>> The order is enforced by the bulk API. Forward to enable, backward to
>> disable.
> 
> Right you are. (I had it mixed up with a different API which had no such
> guarantees and now I can't seem to remember which it was, maybe I dreamt
> it.)

Most probably you were thinking about regulators, which are a separate 
crazy beast. The regulator_bulk_enable() enables all the regulators in 
parallel using async calls.

-- 
With best wishes
Dmitry

