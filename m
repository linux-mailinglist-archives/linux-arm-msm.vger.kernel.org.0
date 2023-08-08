Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD7477491A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbjHHTsq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236631AbjHHTsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:48:35 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C364DEB9
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:53:06 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so7631029a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513584; x=1692118384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MiAjavq0sK918LzUOhJOnDEbmGyu/bjq8deQKGQYoYk=;
        b=cJG7jA3htWGkFOzXpeLdUPTU/P+z6+4glxnJp2tf3LnVP5dtJg453yd4KkWBWERqdE
         brypzkvr5LLYeSbJHc36+2MsIboQvHK1TeHNRY/AwuojMRffRhtmz4owC4fvCxr9uvPK
         SLjJyKmuXnTVhGO1UUkjgV7yQ14ieVvyT07ph1fAZasu9K2zHDV5S4mCkSW71ulEajzp
         P+fkDMd6+xQ550bgJ4wslIaxTNHLQB+r3PFTATNimv8y52kDb11zYgcy8RjQe0IQwo76
         2my2FZxhv6QX+eA5q3pp8k+nHOu7OhiiKDvsi3DklrC9AlcZGj7WaY7nnZVfMsbrVcKa
         LjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513584; x=1692118384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MiAjavq0sK918LzUOhJOnDEbmGyu/bjq8deQKGQYoYk=;
        b=lsGjWJVHypYiCnJJmmQFKWBvBDAQ9wgUhTPL/bEG/biiKXzhEne53L2Ohrz+0fJe88
         FQeODNZxId+1OWNXSFPnbo8XIs90LGRLpWNw+fn6zMdE6hVlCaIT+E4x6jyCTE1ck6SA
         RT7ic7StOHBW8etP6NsJqsnIRpdyWQ/+HHA4RpDdXAUiwzfZSWwVW/fNwr4V0xbHCvn/
         a/37Py2vutktYmr6efsfdGMFO8mLLTORMhQLkNyRATN4xtz8HBqbhBTDg5nqQzAYB+7A
         DBHG2lobyej2RauFAi2/f1QSIb/S2b6vWGvXoTigTQpjImGVgxfWqGAYU7X+swKSAo2T
         8PWQ==
X-Gm-Message-State: AOJu0Yx+NLw3RJd7sj3vI6ypMYFAK9ez6GB83ZiGWrmJimDTCxHkQB2N
        b7MbajSnqpDI/dNfvtrXYpxk+egNQvI75+KZqc4=
X-Google-Smtp-Source: AGHT+IHO1SvdXIMzYOuM/7cTZqhd0uBE3xSnzMkXW+UP4EsFgvWuxndxBMzXA8yQRk6sNMAZx/98UQ==
X-Received: by 2002:aa7:d055:0:b0:51d:91ef:c836 with SMTP id n21-20020aa7d055000000b0051d91efc836mr9472510edo.32.1691494293685;
        Tue, 08 Aug 2023 04:31:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906244800b00992b2c55c67sm6619400ejb.156.2023.08.08.04.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 04:31:33 -0700 (PDT)
Message-ID: <29e20953-5660-079e-2136-0962eec9cab5@linaro.org>
Date:   Tue, 8 Aug 2023 13:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/9] i2c: mlxbf: Use dev_err_probe in probe function
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Liao Chang <liaochang1@huawei.com>, florian.fainelli@broadcom.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, yangyicong@hisilicon.com,
        aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        kblaiech@nvidia.com, asmaa@nvidia.com, loic.poulain@linaro.org,
        rfoss@kernel.org, ardb@kernel.org, gcherian@marvell.com,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230808012954.1643834-1-liaochang1@huawei.com>
 <20230808012954.1643834-3-liaochang1@huawei.com>
 <a5b2f1a2-d509-0949-fc1d-929476c2618b@linaro.org>
 <20230808112907.4rnvmyha4v6cg5ds@intel.intel>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230808112907.4rnvmyha4v6cg5ds@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/08/2023 13:29, Andi Shyti wrote:
> Hi Krzysztof,
> 
> On Tue, Aug 08, 2023 at 10:36:40AM +0200, Krzysztof Kozlowski wrote:
>> On 08/08/2023 03:29, Liao Chang wrote:
>>> Use the dev_err_probe function instead of dev_err in the probe function
>>> so that the printed messge includes the return value and also handles
>>> -EPROBE_DEFER nicely.
>>>
>>> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>>> Signed-off-by: Liao Chang <liaochang1@huawei.com>
>>
>> ...
>>
>>> @@ -2413,10 +2399,8 @@ static int mlxbf_i2c_probe(struct platform_device *pdev)
>>>  	ret = devm_request_irq(dev, irq, mlxbf_i2c_irq,
>>>  			       IRQF_SHARED | IRQF_PROBE_SHARED,
>>>  			       dev_name(dev), priv);
>>> -	if (ret < 0) {
>>> -		dev_err(dev, "Cannot get irq %d\n", irq);
>>> -		return ret;
>>> -	}
>>> +	if (ret < 0)
>>> +		return dev_err_probe(dev, ret, "Cannot get irq %d\n", irq);
>>
>> I don't think this is needed:
>> https://lore.kernel.org/all/20230721094641.77189-1-frank.li@vivo.com/
> 
> Hmm, that's a bit borderline, I'd say. The change to

What's borderline exactly? devm_request_threaded_irq_probe() is coming,
right? If it is accepted this hunk is useless and soon should be
replaced with proper one.

Instead of making many trivial changes doing the same, all these series
should be aligned.

> devm_request_irq/devm_request_threaded_irq_probe seems like
> something for another series. But for now, I think I'll accept
> this as it is since it fits within the scope of this current
> series.


Best regards,
Krzysztof

