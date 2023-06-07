Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 342347261A8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 15:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235653AbjFGNvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 09:51:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235262AbjFGNvP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 09:51:15 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91361BC7
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 06:51:11 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso1625981a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686145870; x=1688737870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wF8v/Nr5lYY1iKzsnANRPfQdGbEg+1le4IAIlYm+ax0=;
        b=a19VN202ZsV1liveY7vlwvCagRo6i8nWU8cqZuHZ7l6n90fuEDFGdDRVDBlRlm0hB8
         0O/nODEGeEImVU/JWEgGN+bxOl5FXsedftfqcMEdkyVbRcjrWIACKGf858QYRGNzZECh
         DNxUFUhLM3Og2xoANYSFj/kZy0k95ETNqUJ6NTnLQ/B9wu7Iu2/pQmUfUXgjCsnFIoZk
         C/geriDvGCdrHAE5Be3Z/EGOZzS2damev1roaWYS5oTc91gim1TyWuJWp4mWSd6fETn+
         HvrqQJZPtLc8EY7uMYIhhiopqR+tw+qySsbEhh4CFnb+JZANpz1+gLc9en48anq/u2yO
         udBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686145870; x=1688737870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wF8v/Nr5lYY1iKzsnANRPfQdGbEg+1le4IAIlYm+ax0=;
        b=K9f0vW4ixTzu4p12wwueoF7BABfJugK2DotUkHuH3PWvboy8ItMzaDZfjwBm9sm1uO
         z+vVcoizC6azWVRoH0lJtsHGrOOku6rZvUjDLqMuaOUqjW7suyS2KOmBHfiI8a/YlK9j
         qqTfFZyx48K7em5lmHeuJlrJ4qSLmNWe2PjK5M3+vRfyJ4PFI5IWnghp/khvfZNz9l6D
         xjCLupnc4iUbtOyfapr711J8TV/EYQB5ApmwjlZ0ly+NTT/a9g5p5iOAz40kxpTZEIys
         9inOHwTuHoktVAQmAkw0sP07pcwmnBtXQroYOYDyKFpTXJCUATRa6mFUSuMoeBh4XNnP
         UK6Q==
X-Gm-Message-State: AC+VfDzop/f8COCfjre6mCfTOnCZjI3bm/s7fKpE+sDaU+B4Q4jMNdcf
        R9dC0LF1s+Q0/c85NvaZqki+cA==
X-Google-Smtp-Source: ACHHUZ61ZYzOZ4qkEgIxn3mhmXuts2TGVrNlXVWmBlSrcX+pv3KLh/o2gVDhbbzqDVipusDsFtFojA==
X-Received: by 2002:a17:907:3e99:b0:96a:29c0:8515 with SMTP id hs25-20020a1709073e9900b0096a29c08515mr6259566ejc.58.1686145870379;
        Wed, 07 Jun 2023 06:51:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ss18-20020a170907039200b0094ee3e4c934sm6901777ejb.221.2023.06.07.06.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 06:51:09 -0700 (PDT)
Message-ID: <c39dc157-bd3d-a627-4eb0-a34ff43ab664@linaro.org>
Date:   Wed, 7 Jun 2023 15:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] soundwire: qcom: fix storing port config out-of-bounds
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
References: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
 <ZICBvP33XyOswWFM@matsya>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZICBvP33XyOswWFM@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2023 15:10, Vinod Koul wrote:
> On 01-06-23, 12:25, Krzysztof Kozlowski wrote:
>> The 'qcom_swrm_ctrl->pconfig' has size of QCOM_SDW_MAX_PORTS (14),
>> however we index it starting from 1, not 0, to match real port numbers.
>> This can lead to writing port config past 'pconfig' bounds and
>> overwriting next member of 'qcom_swrm_ctrl' struct.  Reported also by
>> smatch:
>>
>>   drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer overflow 'ctrl->pconfig' 14 <= 14
>>
>> Fixes: 9916c02ccd74 ("soundwire: qcom: cleanup internal port config indexing")
>> Cc: <stable@vger.kernel.org>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Link: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/soundwire/qcom.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 7cb1b7eba814..88a772075907 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -202,7 +202,8 @@ struct qcom_swrm_ctrl {
>>  	u32 intr_mask;
>>  	u8 rcmd_id;
>>  	u8 wcmd_id;
>> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>> +	/* Port numbers are 1 - 14 */
>> +	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
> 
> Better use SDW_MAX_PORTS ?

That's interesting idea, but except of value, is the meaning actually
the same? Driver claims that port 0 is masked and max number of ports is
14. Therefore it uses in all places constant QCOM_SDW_MAX_PORTS. We need
here +1, only because we index from 1, not 0, but we still index over
QCOM_SDW_MAX_PORTS, not SDW_MAX_PORTS. Wouldn't it be also confusing to
use here SDW_MAX_PORTS but then index over something else?

Best regards,
Krzysztof

