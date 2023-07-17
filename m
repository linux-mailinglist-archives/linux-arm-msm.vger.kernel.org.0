Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9F067562E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjGQMkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 08:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGQMkN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 08:40:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 165621B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 05:40:12 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso6917574e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689597610; x=1692189610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1Ez0XiPLy9JQwhDNp6ZwsehdR2q+I+6iiZpL3yjjI4=;
        b=UiJVgcZc1um0ymdVxx7Qz8YrMbZ5xB4BACi8gz+pwwXnG8SCdz1jr2Kmrp5155iLft
         IT2KWs79Usr6aAuifgRs20Ig3dYOu+ilq80T5wCQnnmfsRXUyn0UDGvpjJ7RYbEjcL+T
         26//kyqqXmVmLy72Ruxc9hZ1We8tFvU0vdM/eBQlNfP7KnpeA4CsRY8V6MN1o4cGUen9
         Vsgi9HEt5XLD73q6OA166zRAxYn92xicwXaIW+UMjNv9RobRn+MLFe40UrrzOFe/K/k+
         dCUZmUjXDMzYJWuK0IPGjpsccDVacA5uoL2KrvZnsCVpt6p7TqjCAP6DURAykm7Cjf/6
         mSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689597610; x=1692189610;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1Ez0XiPLy9JQwhDNp6ZwsehdR2q+I+6iiZpL3yjjI4=;
        b=iK+/WL3BzFDUo6QdQSnAQJWoPfDoKFfe6S4rlko9tRLMXcYTT3J1SfvVi88zj8947P
         AHND2LipAtK4jhzCTXIR1trwEk5Yst6WEN6dR4AQwBx0iJSTPN5sTn7HAyL2kLWwlUeF
         JaLXWKjqBqHNxJPujcAygSD25pYMvkUJNupHb24Fk7wBkBSSJDt5HPiZisAggVzaB9RI
         mhW4MTKLeU/BwDr5gVCob6puRKi82k5XEv53Wt2Hfdy2wWzGfWsszX4q+bR2Qkx9fnPJ
         yPythhYN4kwyY4CvWLWY5caLr4AgYa3p6DZEL68uNkUuSSJo+ddHBjv0VokTUFK0s0Dt
         o+6w==
X-Gm-Message-State: ABy/qLZEZJqSLsPfDWGgzC7lFpFyrFQotuf5Tt905ywkswErrR+2AuC9
        PBPPGD2WUO6MrhLydh/AIlsOwA==
X-Google-Smtp-Source: APBJJlFlrt06OaGdZfNAxWrHT6kvaDJ+IC4DHu/DkSdZ/pXGp9vkEW0W8pzarXiHkMOaSrbKJEzKkg==
X-Received: by 2002:a05:6512:3e05:b0:4fd:bdf8:930d with SMTP id i5-20020a0565123e0500b004fdbdf8930dmr2076739lfv.22.1689597610213;
        Mon, 17 Jul 2023 05:40:10 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id w2-20020a05651203c200b004f87024742fsm2791201lfp.235.2023.07.17.05.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 05:40:09 -0700 (PDT)
Message-ID: <18f2a5b5-5cc2-6bea-ca08-5da218b3192b@linaro.org>
Date:   Mon, 17 Jul 2023 14:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] media: camss: Intepret OF graph connections more
 sensibly
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>
Cc:     Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230614-topic-camss_grpah-v2-1-57d9d5e49038@linaro.org>
 <ZLUcaQN6hCjjulTv@hovoldconsulting.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZLUcaQN6hCjjulTv@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17.07.2023 12:48, Johan Hovold wrote:
> On Sat, Jul 15, 2023 at 05:37:52PM +0200, Konrad Dybcio wrote:
>> Not all endpoints of camss have to be populated. In fact, most of the
>> time they shouldn't be as n-th auxilliary cameras are usually ewaste.
>>
>> Don't fail probing the entire camss even even one endpoint is not
>> linked and throw an error when none is found.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> Changes in v2:
>> - Use if-else instead of the ternary operator (Bryan)
>> - Drop "RFC"
>> - Link to v1: https://lore.kernel.org/r/20230614-topic-camss_grpah-v1-1-5f4b516310fa@linaro.org
>> ---
>>  drivers/media/platform/qcom/camss/camss.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 1ef26aea3eae..8b75197fa5d7 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -1084,9 +1084,8 @@ static int camss_of_parse_ports(struct camss *camss)
>>  
>>  		remote = of_graph_get_remote_port_parent(node);
>>  		if (!remote) {
>> -			dev_err(dev, "Cannot get remote parent\n");
>> -			ret = -EINVAL;
>> -			goto err_cleanup;
>> +			of_node_put(node);
> 
> This is broken and could potentially lead to a use after free.
> 
> Specifically, the iteration macro already takes care of putting this
> reference.
/**
 * for_each_endpoint_of_node - iterate over every endpoint in a device node
 * @parent: parent device node containing ports and endpoints
 * @child: loop variable pointing to the current endpoint node
 *
 * When breaking out of the loop, of_node_put(child) has to be called manually.
 */

> 
>> +			continue;
>>  		}
>>  
>>  		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
>> @@ -1105,7 +1104,10 @@ static int camss_of_parse_ports(struct camss *camss)
>>  		num_subdevs++;
>>  	}
>>  
>> -	return num_subdevs;
>> +	if (num_subdevs)
>> +		return num_subdevs;
>> +
>> +	return -EINVAL;
> 
> Please change this so that you test for the error condition rather than
> its inverse for symmetry. That is
> 
> 	if (!num_subdevs)
> 		return -EINVAL;
> 
> 	return num_subdevs;
Right, this makes more sense

Konrad
> 
> Returning EINVAL (invalid argument) is perhaps not the best choice, but
> the driver already does so here and in other places so keeping it for
> now should be fine.
> 
>>  err_cleanup:
>>  	of_node_put(node);
> 
> Johan
