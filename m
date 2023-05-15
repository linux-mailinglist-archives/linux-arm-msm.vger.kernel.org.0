Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F69B7031BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 17:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240701AbjEOPjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 11:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237257AbjEOPjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 11:39:55 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D40102
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:39:53 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f4ec041fc3so30020325e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684165192; x=1686757192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=59tvTch++2mP9Nr5iylaIL/TWi1rCDyA6i27+/EN1zk=;
        b=ku2Xs34xBoMLNl1Jwaldg0s5m2VpZaCLMYmk6/cqXWTjcM6jN2MTS1fmXgNCN9zTV1
         b6peXVeGkn1bCAw3Z9TKp4F7N4jvgV2ZdNPfDYT16yATYnwQ2pRDUPs7Vnd/UHVFs4UY
         jyuq0VwPNSIj9z3Cdx/YrmJVl0k8otJXLagGvYQqNcGOV4OmTFy086G/9i+ex0zo0E9w
         hfIqevGKB6YUQBUymypHFPHxHNz9yrARQmHd2faCVbVZ0SewxOGfFujsKM1mrrrg0AUJ
         YQFfLIUMmEYTu4aezDgnaycH4O+2egkt7YND5JHwo6wXKkzDzT13BkkBlXK5BF0jXEBT
         tTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165192; x=1686757192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59tvTch++2mP9Nr5iylaIL/TWi1rCDyA6i27+/EN1zk=;
        b=LOeZsu9Scdskq5skmOvF5tIO52xJskHLaA+pxbQW5YSX3cTm2OOff5QfgDsOqFSriR
         I4C8i1spLdVGVpmuQZt8a/6G5YSvVIhM3Y9SLhAsO4IN3vQmAzyiSulhIRblOLXQ6fcm
         CQ/v+Bi0tYBAWuQl2vLw5w/5Y8HQ9/vdXrFwMLoQKjqvwv5e9sJSOAEl+azM6fguIRA4
         VQw4QHjfJ6X5PbbTecyNjgb66nbQ/VCwIQwQ82Ivdm/OsLxI9bhkvMFrGop1mXuf3pz4
         mrM1y+VywZ0YkCOoJSXwF6iAlwsLYn4TDGuBcw/irGnhSSFgcb+qCvRipaYVVXhDJz9Q
         Snww==
X-Gm-Message-State: AC+VfDzO3xwD39e0JSm+xrL107+BBUNL+Djp3trsjcZizak8Lo4fu3JB
        ftMiUdq9elT/GI/xvnjOeyWV7g==
X-Google-Smtp-Source: ACHHUZ5P+KApkZqamEk1XZRMl/uZR4cMDDmejlQn+eIn4c53BLIU4/ACKz8R7+XuXCfg927Q+2D1fQ==
X-Received: by 2002:a1c:f711:0:b0:3f5:1a4:a08d with SMTP id v17-20020a1cf711000000b003f501a4a08dmr4324580wmh.7.1684165192188;
        Mon, 15 May 2023 08:39:52 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id v25-20020a1cf719000000b003f50e88ffb5sm2101564wmh.24.2023.05.15.08.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:39:51 -0700 (PDT)
Message-ID: <53480bd1-0b6f-053c-b1fd-b04de7b49096@linaro.org>
Date:   Mon, 15 May 2023 15:39:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] leds: qcom-lpg: Fix PWM period limits
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230512165524.3367443-1-quic_bjorande@quicinc.com>
 <cab829ec-5763-1352-618a-adad8c01227d@linaro.org>
 <20230515022041.4i2w36vubzggpdt6@ripper>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230515022041.4i2w36vubzggpdt6@ripper>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15/05/2023 02:20, Bjorn Andersson wrote:
> On Sat, May 13, 2023 at 10:09:49AM +0000, Caleb Connolly wrote:
>>
>>
>> On 12/05/2023 16:55, Bjorn Andersson wrote:
>>> The introduction of high resolution PWM support moved the parenthesis of
>>> the divisions in the calculation of min and max period. The result in
>>> both divisions is in most cases truncation to 0, which limits the period
>>> to the range of [0, 0].
>>
>> Huh, TIL C gives multiplication and division the same precedence when
>> deciding order of operations.
> 
> There where no explicit parenthesis in the original implementation. So
> I guess it would be more correct to state that parenthesis was
> introduced around part of the expression?

It might be clearer just to say the div64_u64 changed the order of
operations.
> 
> Let me know if you think the wording matters and you would prefer me to
> rewrite it.

Yeah, that would be appreciated

Thanks
> 
> Regards,
> Bjorn
> 
-- 
Kind Regards,
Caleb (they/them)
