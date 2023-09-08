Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE2F7985EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 12:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239378AbjIHKgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Sep 2023 06:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjIHKgh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Sep 2023 06:36:37 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFA8919A5
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Sep 2023 03:36:31 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31adc5c899fso1940121f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Sep 2023 03:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694169390; x=1694774190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3365epFx7LcXGmfNolHsodlPpUOyKdHg5aTvRwZxU/8=;
        b=RQPfZkLNNvPsLzPrIX8dolish6TnsCOKtbfpLNBW5cQ8gOO43842bJpNsn+tFRT706
         UEOQqJ+9uY26rTCalcLjMHryqKAYViKY3FIjZFE7ZXUYeXf5wSp7i6e8cOToAPUO8+/T
         wOzY7nLgAmT6AaMJIdu45OzUeiAvD5H9xpx1/g9orrUlGG/rpf3XhJ4VzVA9A58h9BWq
         g2bFbD7XkdcroFQHLzO7xFOzSGJtSuEgh3DmlTHeyldUJqQFPK7CvWBdN3aqec6clD8+
         pSSGRj1Jro6b+y2IM8hTLkDnKUrWcqxtxl8WMMvEbgJA0KVHxq5s+28qfs7tI9mCi037
         X7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694169390; x=1694774190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3365epFx7LcXGmfNolHsodlPpUOyKdHg5aTvRwZxU/8=;
        b=sXe0Fg3HA0ZC0nfCuDFxLwt1BPJH4yoqccDqCTwCz8b6wfYjtgBz+gJBWQwRUr7+Zn
         4AEIAfmQVUZrAjNmTZ9YpVjw6McJd1OSXVdBRSs0cOzpxecEh1vNs4GJKsNcD03C3OzZ
         iMz6ZzVxAaENgN62IlOdHRaWtTXpqu1Ga3jL8V+KEjp5wa/sho+gaRD6X6Uk3M7YT4su
         cyG5JmR7J3pLKArYhf9bs3IVCBcNjwaCzFzlLxoV6NWFHqIi7zbC057TlHmHcqXq8J4L
         s0+dau2I79TiHEW2ylP4tCj+2m+fbEF0PJoKhcqetdJROVl28c1b5YtZMOjuDFtVAjtb
         ZlcQ==
X-Gm-Message-State: AOJu0Yxa/cFZIx60/E5ufBDy8rIooY/N29yEPvDtEatPO91hjmt43nI4
        IOViiI3uPLbW2x1PFXO+v/PQjA==
X-Google-Smtp-Source: AGHT+IGr9AkyYDXkcu9tYUq68tDphkoTHwc/U6PrO7lcJlsZWWeAVyD6ErAsIS/p/pTBMmbdMeEncg==
X-Received: by 2002:a05:6000:1250:b0:31d:74f8:fae with SMTP id j16-20020a056000125000b0031d74f80faemr1407561wrx.71.1694169390290;
        Fri, 08 Sep 2023 03:36:30 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d58ce000000b0031433443265sm1746955wrf.53.2023.09.08.03.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 03:36:29 -0700 (PDT)
Message-ID: <e1ab1df4-8431-483d-8f20-74de5349cfbc@linaro.org>
Date:   Fri, 8 Sep 2023 11:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/17] media: qcom: camss: Move vfe_disable into a
 common routine where applicable
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, rfoss@kernel.org,
        todor.too@gmail.com, agross@kernel.org, andersson@kernel.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230907164410.36651-1-bryan.odonoghue@linaro.org>
 <20230907164410.36651-16-bryan.odonoghue@linaro.org>
 <8b424303-09c9-4270-abfd-4f209f5c41e0@linaro.org>
 <41d1e364-40a4-48b2-97ef-6c76d238002e@linaro.org>
 <c9570c8e-c9a5-43f5-8b69-d5c38d214061@linaro.org>
 <c5d64d12-668a-4d70-85ee-e4111d85a1be@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c5d64d12-668a-4d70-85ee-e4111d85a1be@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2023 11:24, Konrad Dybcio wrote:
> On 8.09.2023 12:21, Bryan O'Donoghue wrote:
>> On 08/09/2023 11:04, Konrad Dybcio wrote:
>>> On 8.09.2023 12:02, Konrad Dybcio wrote:
>>>> On 7.09.2023 18:44, Bryan O'Donoghue wrote:
>>>>> We can move vfe_disable() into a common routine in the core VFE file
>>>>> provided we make wm_stop() a VFE specific callback.
>>>>>
>>>>> The callback is required to capture the case where VFE 17x currently isn't
>>>>> VC enabled where as VFE 480 is.
>>>>>
>>>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> ---
>>>> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> Konrad
>>> Actually there's
>>>
>>> ret = vfe_reset(vfe);
>>>
>>> return ret;
>>>
>>>
>>> which could just be
>>>
>>> return vfe_reset(vfe);
>>>
>>>
>>> Konrad
>>
>> On purpose.
>>
>> I prefer the ret = ; return ret; pattern since it makes it easier / less work to
>>
>> ret = fn();
>> if (ret)
>>      goto error;
>>
>> error:
>>      return ret;
> There's no error label in vfe_disable_output
> 
> Konrad

No there is not. Its a pattern I use to make adding jump labels easier 
later on.

Just like you use the pattern of appending "," to aggregate initialisation.

---
bod
