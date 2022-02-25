Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A884C4D29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 19:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbiBYSEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 13:04:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbiBYSEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 13:04:01 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DBA2255AC
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 10:03:29 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d3so5726404wrf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 10:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=myxelBqy30bTcJ8ZX5UhYCHIKBHFqSW0CcEE1Z58khk=;
        b=jOi89ia8H2rFcP3T7+wURDQtxvvySEXht1DO13PIwFY9RJIC/QiSqLOm1dtVkdAyaf
         AbYh/oSAOyApE9Q1Kn/SpPICp4CNncqYnBYGAUyAGspr1g1GvGGFqLdM7rgD91v4+oxu
         PWhLDigQFqAdiLhHI/JPrvGC+Rv/YYNnLlA2yzJVwr5dfMs7NQkqFay3wPrgTRyqGr0y
         RosJil9OVqTiq+9ABreNkg2ZbxVtQefuRQwZhgN+VwviRBOoLfunc9ocRyUzinV0JAqi
         VyCJrUSUMQH+F3MGkSN1QVb2Czn2J3jI73XkYiBHEI5aCts8fyqgVSGdE5ov+B7vV6UQ
         Q+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=myxelBqy30bTcJ8ZX5UhYCHIKBHFqSW0CcEE1Z58khk=;
        b=2GKOE84IQR52TVCPCWW18McxYDrG+n1El1/0uA52NL7qMFlVb6U1q6xNbuKDZhwZtJ
         3tGesiY4/kVkpHpjUifZx/o9SgPP5pMpviKOimLub18mQ/VZF4EBGsvmV1ORb0bs+mG2
         dfO6cWj8vwJ0dnfJ9D7+vSH4WjUix3ZUJRFrV5kedXM9CmMLN2McpMG2n8hmQ0qeQYxZ
         8hZZ040FW8qZBpJYJHFn5YUG/bngp61mScIt10FGpLfaCzZDf4gZnRWUQgXJtn/X2NxE
         DNsupboKyH74J1wOBN5J2/8Oqs2USxsLIBOnsNDwPxR+e4YBNJlVeaMrCxmLHSDTIVxe
         ESXw==
X-Gm-Message-State: AOAM531mS+N3LqPDltwRqu1zEaGUA/ergrRNOPsxSvQEiclM/QgvuudP
        Az5CixeA00I+zWalI7Buz2yYQw==
X-Google-Smtp-Source: ABdhPJxjMNMdYhsq1gDFcmAYq8MGRlkuy47ls/d6GXdHncZa9U6DNBLuj8UsSq1feDuCyGWhxSUoJg==
X-Received: by 2002:a5d:5245:0:b0:1ed:9eca:cf3d with SMTP id k5-20020a5d5245000000b001ed9ecacf3dmr6811167wrc.666.1645812207584;
        Fri, 25 Feb 2022 10:03:27 -0800 (PST)
Received: from [192.168.86.34] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id s3-20020adfbc03000000b001e4b0e4a7fdsm2918057wrg.93.2022.02.25.10.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Feb 2022 10:03:26 -0800 (PST)
Message-ID: <4811be6f-7e86-2a62-94cf-98504d5e64e7@linaro.org>
Date:   Fri, 25 Feb 2022 18:03:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, yung-chuan.liao@linux.intel.com,
        sanyog.r.kale@intel.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
References: <1645800257-27025-1-git-send-email-quic_srivasam@quicinc.com>
 <a99a59eb-cd59-f566-b98d-486c94f32eec@linaro.org>
 <06650d56-eed3-73ad-d6b4-6b56a5a70669@linux.intel.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <06650d56-eed3-73ad-d6b4-6b56a5a70669@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25/02/2022 15:43, Pierre-Louis Bossart wrote:
> 
> 
> On 2/25/22 08:45, Srinivas Kandagatla wrote:
>>
>>
>> On 25/02/2022 14:44, Srinivasa Rao Mandadapu wrote:
>>> Remove wait_for_completion_timeout from soundwire probe as it seems
>>> unnecessary and device enumeration is anyway not happening here,
>>> hence this api is blocking till it completes max wait time.
>>> Also, as device enumeration event is dependent on wcd938x probe to be
>>> completed, its of no use waiting here.
>>> Waiting here increasing the boot time almost 4 seconds and impacting
>>> other modules like touch screen.
>>>
>>> Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be
>>> complete in probe")
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>>
>> LGTM,
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> I don't get the idea, sorry.
> 
> If you look at the code, these are the cases where this 'struct
> completion' is used
> 
> 	struct completion enumeration;
> 	complete(&ctrl->enumeration);
> 	/* Enable Auto enumeration */
> 	init_completion(&ctrl->enumeration);
> 	wait_for_completion_timeout(&ctrl->enumeration,
> 
> 
> so if you remove the wait_for_completeion, then you might just as well
> remove the whole thing and revert 06dd96738d618
> 
> what am I missing?
Yes, that makes more sense to revert it, as it is the only user of this 
completion.
We could add it back when we really need this again in pm runtime setup 
if required.

--srini
> 
> 
>>> ---
>>>    drivers/soundwire/qcom.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index 5481341..9a32a24 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct
>>> platform_device *pdev)
>>>        }
>>>          qcom_swrm_init(ctrl);
>>> -    wait_for_completion_timeout(&ctrl->enumeration,
>>> -                    msecs_to_jiffies(TIMEOUT_MS));
>>>        ret = qcom_swrm_register_dais(ctrl);
>>>        if (ret)
>>>            goto err_master_add;
