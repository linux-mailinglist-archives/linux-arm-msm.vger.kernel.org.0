Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4F5F78D869
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 20:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234150AbjH3Sa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 14:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343737AbjH3QoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 12:44:08 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67461A3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 09:44:04 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52bca2e8563so3467796a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693413843; x=1694018643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJJlek7R83oK8d/2pVvV6qgerAYb4e+pH9LJHZNOAZM=;
        b=D9KzcvWHxGTCcuSHpVJU3DTCfH/So/HRBvz8ql4UyMhXFvkxcBAbFaDerquf25aaTQ
         bWmZSx9Ounbv/EBI1f2SIEOBj3ykLJRGkz0YKY/Rf4W7du3jt7hqN0MQP/r0fTu7XP8a
         0eLne5If7BrstuWwej6YXBYm8SFvQzC0BmncZAn+LaPrdX8sjIZ/JaVS1EzFgEx3Jhf7
         lLYTlxXRoKk8o+hE32qUwDMp5koxynXUrBer6MlEEKt1yGMpxpRLfItkOkURzokOuePu
         KPMNz8o5DklmXvehkTcqWoySOqlZCH8Nzuho1/NAwfWEkbqhtyHCZUO5pY56+4FuIlfr
         w2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693413843; x=1694018643;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJJlek7R83oK8d/2pVvV6qgerAYb4e+pH9LJHZNOAZM=;
        b=TSJWQZG3I2HBNP5aM/vKmuBwXTf4U2lIp2S39dwMC84x3e43DoCdEIK+Iez1knFKh0
         uwXEngCgdEJIa52GKhSBRc9mhBnveE7OZ2lc65x2a+I+EIS56+GIDtNhDQ1o3Sf2BWBl
         W7eZEUueHeC9S4reJIKozMLl+bCfFRoSmVepYEwl5qNnkO6mdbrJ8GYcX/jYh+FrzwOI
         o0i/7seTyf5xPneP7eNSoe1N7mMRnrIix5L8WRbhzDWUoyVXEYDsEGsVs4zFRTD7Immd
         KH7k/bPg0bddYoOfLU3Ym1wRDdKhvJ+JPrzaAtiKs8b+YbC+bUICZfio5YgvJGrn7vFA
         AJXA==
X-Gm-Message-State: AOJu0Yyf6uSigtAmCQVyEQTNVztwezcD+cYxlvW1RVKPkMlawGz4IY3H
        fH3+h8mwpdgrkGi0QeP0sjZKcg==
X-Google-Smtp-Source: AGHT+IEh9vHrZXzLULcxeCJyYvXSmxHauWdNpvw1Ksk5IA4QZMsBUUukL43s/mHCdq4zsxlM5OGixQ==
X-Received: by 2002:a17:906:109a:b0:99c:75f7:19c1 with SMTP id u26-20020a170906109a00b0099c75f719c1mr2218651eju.39.1693413843373;
        Wed, 30 Aug 2023 09:44:03 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id rn14-20020a170906d92e00b00992afee724bsm7358857ejb.76.2023.08.30.09.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 09:44:02 -0700 (PDT)
Message-ID: <18db547c-45b3-4d2a-cd98-d1d1a01270d3@linaro.org>
Date:   Wed, 30 Aug 2023 17:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/10] Hardware wrapped key support for qcom ice and
 ufs
Content-Language: en-US
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     Gaurav Kashyap <quic_gaurkash@quicinc.com>,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fscrypt@vger.kernel.org, omprsing@qti.qualcomm.com,
        quic_psodagud@quicinc.com, avmenon@quicinc.com,
        abel.vesa@linaro.org, quic_spuppala@quicinc.com
References: <20230719170423.220033-1-quic_gaurkash@quicinc.com>
 <f4b5512b-9922-1511-fc22-f14d25e2426a@linaro.org>
 <20230825210727.GA1366@sol.localdomain>
 <f63ce281-1434-f86f-3f4e-e1958a684bbd@linaro.org>
 <20230829181223.GA2066264@google.com>
 <2230571a-114c-0d03-d02a-fa08c2a8d483@linaro.org>
 <20230830161215.GA893@sol.localdomain>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230830161215.GA893@sol.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30/08/2023 17:12, Eric Biggers wrote:
> On Wed, Aug 30, 2023 at 11:00:07AM +0100, Srinivas Kandagatla wrote:
>>
>> 3. We are adding these apis/callbacks in common code without doing any
>> compatible or SoC checks. Is this going to be a issue if someone tries
>> fscrypt?
> 
> ufs-qcom only declares support for wrapped keys if it's supported.  See patch 5
> of this series:
> 
> +	if (qcom_ice_hwkm_supported(host->ice))
> +		hba->quirks |= UFSHCD_QUIRK_USES_WRAPPED_CRYPTO_KEYS;
> 
> That in turn uses:
> 
> +bool qcom_ice_hwkm_supported(struct qcom_ice *ice)
> +{
> +	return (ice->hwkm_version > 0);
> +}
> +EXPORT_SYMBOL_GPL(qcom_ice_hwkm_supported);
> 
> Which in turn comes from the ICE version being >= 3.2.  It does seem a bit
> suspicious; it probably should check for both the ICE version and the
> availability of QCOM_SCM_ES_GENERATE_ICE_KEY, QCOM_SCM_ES_PREPARE_ICE_KEY, and
> QCOM_SCM_ES_IMPORT_ICE_KEY.  Regardless, it sounds like you want it to be
> determined by something set in the device tree instead?  I don't think it's been
> demonstrated that that's necessary.  If we can detect the hardware capabilities
> dynamically, we should do that, right?

I don't mind either way.

It would be perfect if we can dynamically query the TZ version to 
determine these capabilities.


If not we are left with some way to derive that information either via 
DT or other means.

--srini
> 
> - Eric
