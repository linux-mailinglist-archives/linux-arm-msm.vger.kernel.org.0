Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B1264377C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 22:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbiLEV4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 16:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232482AbiLEVzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 16:55:45 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C204BB86A
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 13:54:41 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id d123so3069888iof.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 13:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+AmwLSmxjTyQnjlvK0vFRf0x1rcJCoW+1z6eBfZS58=;
        b=BAHDVu4QbF8d2giMn4B9XCOMNRg6yLsqGxXleO80T+fXHSgksKd+sQgSyeiWkdunlF
         uzCbMsdLbbjvHRyYHXXtLUc2hXJMPpDRZrKF9zNhACA1wxeA7KMDCBNTmOQdp8i6uFUO
         zfr0jggtjVJXcVlhJtQSG3TVcKJXf00avlkO0AEW/2THfE2xtJsSToY5Y2ziBMXdPSdx
         ZOqNVStv2+1E/ckF74HagEoDX8+oODMREhpPvWpWgp1TMfv3awJ6kwDsFZY9LX4qUPdO
         /lnKC6VXoBxakHtoNHbJjXCxYo6Alixd0l5OWwtm7VI9e/RZVIsiBChbUjtWTVexK4EY
         pKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+AmwLSmxjTyQnjlvK0vFRf0x1rcJCoW+1z6eBfZS58=;
        b=K8h1EaGCyc/K6e+J0isjH1waDJn5mIJRsOI3wGvG83UbruWyW1v2mN7vmUsFrHKE5Y
         UH74RNPlJExV/URA38Az/NFurJq8WITB4uVyD4x402Z7HnL6NOinZUhDBKpiHsRHWr2j
         e32l5athymuzwyBvq+Vbb6OkQyFY91dEMfG3EGjGJ/dQXWYU8GTVu/AF7tjffH0a0uou
         ZptJEf4oZJtjI3Svgpz0VLfXp1b/uPDyfWy6hc5bEsMqpQMmnc7NjgFroJz/E7E6QC7y
         HZE3s39/W0jPSzOeQqCBud4JwVCKdLkMCevumqAmGHyf+RaX6LXWq3/x5xFVnggIw/M9
         HPaw==
X-Gm-Message-State: ANoB5plZ2D55H7TEFpnts7J8wmmCrYusgahbBNHwAQCXZ5WuVT8Kzuor
        7Bhn1v1ZlIhHE7QgNcgPXppRRSTGY1+bePBz
X-Google-Smtp-Source: AA0mqf7sNVJpJrhGFg7xGhyPyhF6AJ/WwjJelEPLdLiSGDRTHWuo5ddbOsmmFwjctEWGoWjo5r1AyA==
X-Received: by 2002:a5d:9d4b:0:b0:6de:3e2c:a77a with SMTP id k11-20020a5d9d4b000000b006de3e2ca77amr38360212iok.148.1670277281069;
        Mon, 05 Dec 2022 13:54:41 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id q7-20020a0566022f0700b006ddd85d06c2sm6333055iow.55.2022.12.05.13.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 13:54:40 -0800 (PST)
Message-ID: <a9226554-e592-1d41-d6c7-e343f0e48e97@linaro.org>
Date:   Mon, 5 Dec 2022 15:54:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/16] clk: qcom: smd-rpm: drop the rpm_status_id field
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
 <20221203175808.859067-9-dmitry.baryshkov@linaro.org>
 <b250eddc-5164-817a-1c8b-26999feb6b27@linaro.org>
 <77F879AA-7303-4D3A-AD81-9EC5E9CB5ACC@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <77F879AA-7303-4D3A-AD81-9EC5E9CB5ACC@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/5/22 3:38 PM, Dmitry Baryshkov wrote:
> 
> 
> On 5 December 2022 20:04:54 GMT+03:00, Alex Elder <elder@linaro.org> wrote:
>> On 12/3/22 11:58 AM, Dmitry Baryshkov wrote:
>>> The rpm_status_id field is a leftover from the non-SMD clocks. It is of
>>> no use for the SMD-RPM clock driver and is always equal to zero. Drop it
>>> completely.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Since the macro is defining static structures it's fine, but it
>> could be reassuring to see the rpm_status_id explicitly assigned
>> to 0.  (Just a comment, no change needed.)  It's a good change.
> 
> Excuse me, probably I misunderstood your comment. The field is removed completely, so there is no place for it to be assigned to 0.

No, I missed that last hunk, where the field got eliminated.

Nevermind my comment, thanks for correcting me.

					-Alex

>>
>> Reviewed-by: Alex Elder <elder@linaro.org>
>>
>>> ---
>>>    drivers/clk/qcom/clk-smd-rpm.c | 20 +++++++-------------
>>>    1 file changed, 7 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
>>> index e52e0e242294..828cae6769f9 100644
>>> --- a/drivers/clk/qcom/clk-smd-rpm.c
>>> +++ b/drivers/clk/qcom/clk-smd-rpm.c
>>> @@ -25,13 +25,11 @@
>>>    #define QCOM_RPM_SMD_KEY_STATE				0x54415453
>>>    #define QCOM_RPM_SCALING_ENABLE_ID			0x2
>>>    -#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, stat_id,  \
>>> -			     key)					      \
>>> +#define __DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id, key)      \
>>>    	static struct clk_smd_rpm _platform##_##_active;		      \
>>>    	static struct clk_smd_rpm _platform##_##_name = {		      \
>>>    		.rpm_res_type = (type),					      \
>>>    		.rpm_clk_id = (r_id),					      \
>>> -		.rpm_status_id = (stat_id),				      \
>>>    		.rpm_key = (key),					      \
>>>    		.peer = &_platform##_##_active,				      \
>>>    		.rate = INT_MAX,					      \
>>> @@ -48,7 +46,6 @@
>>>    	static struct clk_smd_rpm _platform##_##_active = {		      \
>>>    		.rpm_res_type = (type),					      \
>>>    		.rpm_clk_id = (r_id),					      \
>>> -		.rpm_status_id = (stat_id),				      \
>>>    		.active_only = true,					      \
>>>    		.rpm_key = (key),					      \
>>>    		.peer = &_platform##_##_name,				      \
>>> @@ -65,12 +62,11 @@
>>>    	}
>>>      #define __DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id,    \
>>> -				    stat_id, r, key)			      \
>>> +				    r, key)			      \
>>>    	static struct clk_smd_rpm _platform##_##_active;		      \
>>>    	static struct clk_smd_rpm _platform##_##_name = {		      \
>>>    		.rpm_res_type = (type),					      \
>>>    		.rpm_clk_id = (r_id),					      \
>>> -		.rpm_status_id = (stat_id),				      \
>>>    		.rpm_key = (key),					      \
>>>    		.branch = true,						      \
>>>    		.peer = &_platform##_##_active,				      \
>>> @@ -88,7 +84,6 @@
>>>    	static struct clk_smd_rpm _platform##_##_active = {		      \
>>>    		.rpm_res_type = (type),					      \
>>>    		.rpm_clk_id = (r_id),					      \
>>> -		.rpm_status_id = (stat_id),				      \
>>>    		.active_only = true,					      \
>>>    		.rpm_key = (key),					      \
>>>    		.branch = true,						      \
>>> @@ -107,19 +102,19 @@
>>>      #define DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id)	      \
>>>    		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
>>> -		0, QCOM_RPM_SMD_KEY_RATE)
>>> +		QCOM_RPM_SMD_KEY_RATE)
>>>      #define DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type, r_id, r)   \
>>>    		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active, type,  \
>>> -		r_id, 0, r, QCOM_RPM_SMD_KEY_ENABLE)
>>> +		r_id, r, QCOM_RPM_SMD_KEY_ENABLE)
>>>      #define DEFINE_CLK_SMD_RPM_QDSS(_platform, _name, _active, type, r_id)	      \
>>>    		__DEFINE_CLK_SMD_RPM(_platform, _name, _active, type, r_id,   \
>>> -		0, QCOM_RPM_SMD_KEY_STATE)
>>> +		QCOM_RPM_SMD_KEY_STATE)
>>>      #define DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, _active, r_id, r)      \
>>>    		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name, _active,	      \
>>> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
>>> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>>>    		QCOM_RPM_KEY_SOFTWARE_ENABLE)
>>>      #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, _active,	      \
>>> @@ -128,7 +123,7 @@
>>>    					     r_id, r);			      \
>>>    		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
>>>    		_active##_pin,						      \
>>> -		QCOM_SMD_RPM_CLK_BUF_A, r_id, 0, r,			      \
>>> +		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
>>>    		QCOM_RPM_KEY_PIN_CTRL_CLK_BUFFER_ENABLE_KEY)
>>>      #define to_clk_smd_rpm(_hw) container_of(_hw, struct clk_smd_rpm, hw)
>>> @@ -137,7 +132,6 @@ struct clk_smd_rpm {
>>>    	const int rpm_res_type;
>>>    	const int rpm_key;
>>>    	const int rpm_clk_id;
>>> -	const int rpm_status_id;
>>>    	const bool active_only;
>>>    	bool enabled;
>>>    	bool branch;
>>
> 

