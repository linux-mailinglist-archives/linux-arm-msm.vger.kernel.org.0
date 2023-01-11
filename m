Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6D66665EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 23:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbjAKWB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 17:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjAKWBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 17:01:55 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAEE1582A
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:01:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id y25so25616246lfa.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 14:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ds+ysKNpdyUSZP+78toha7tZH4ghJPhiLQmEloFPzAk=;
        b=KjTmFWTDlgLdJclssfDOuIyB+caIQTSzyi/4JtbrHlCeg+gHDrA1uruvifd0chNXvc
         cYtmpEsn/T+lp5EzdlCp1x0bfe5u1klutCVNG16f1eJ9sXZUXqHA5D/Dkeb5xylMXFGO
         h7Afr3pii0KF+NLrGdA8AcBRGTLCT9ga35e8DgS9LvTqFfp6PB70O2Z6cFoBkCicrmaa
         zp4XpG09KJkQgSNp9ccQ27ts8VTJH9+0pmdunbX1EaaZH3OOiKzht3ndck9yr3iO8hZE
         pfVTknPxsyVigD6NowkLJFcOfzMe6qvnDUO5Qnu+6JY/v0hKFWMDzuLN4C0OpTFpiQCY
         zXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds+ysKNpdyUSZP+78toha7tZH4ghJPhiLQmEloFPzAk=;
        b=Jsf/mbG6CR05u9u0pbQuQiEEWQUiwO+BDdScaLpEENMkaiDedJlvPpBjLEWI5birtv
         06Pau9Sz8fp82Be7fX8b0xF/+J958a0K3T9u5lJwstUAr75+QjDUUKZ5ZpJ3W186BDyw
         kNVccKu81qU09FajZBKNCS09XxVjgUO9y2J0kwRxzQIe1n4QDNFsJDBam58xYmlhwlET
         4mgtjHfrNADQEwgWi19i4hydR70LIzXZMa8WX+QhUN3vaBiha4O8t1ySxlO29kJ86l/d
         L1jfh/5ChZ9xZTkOzjRi+lD18g18C2Q5hMbT/bqFWFSNI4aRUraO2nlwwy/s4Gi1AKbI
         IgWQ==
X-Gm-Message-State: AFqh2koHxFKEyDgGQXHKQN0CHR7YZDer0Sxm7DH4TJ8JNm6qql7rqk+f
        lB24xTZmM9SC7VfRsfWicRv7Rg==
X-Google-Smtp-Source: AMrXdXsBUSyK3CCGvG5xf9Fl5bejVA6aAg1DPofedhAjZBydvV4hQcLhgPoCuk9CUVL1NoTu6nezgQ==
X-Received: by 2002:a05:6512:130c:b0:4ca:f9ec:eee2 with SMTP id x12-20020a056512130c00b004caf9eceee2mr22340609lfu.20.1673474512851;
        Wed, 11 Jan 2023 14:01:52 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x30-20020a0565123f9e00b004b543f38b7csm2934833lfa.21.2023.01.11.14.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 14:01:52 -0800 (PST)
Message-ID: <bbaea2e2-cea4-3528-4e9b-b003d53d0af7@linaro.org>
Date:   Thu, 12 Jan 2023 00:01:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/13] clk: qcom: cpu-8996: simplify the
 cpu_clk_notifier_cb
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
 <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
 <b4721d61-799e-2677-4273-0c92cb555cae@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b4721d61-799e-2677-4273-0c92cb555cae@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/01/2023 23:03, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:19, Dmitry Baryshkov wrote:
>> - Do not use the Alt PLL completely. Switch to smux when necessary to
>>    prevent overvolting
> Is this empirical evidence, or did Qualcomm recommendations change since
> msm-3.18 was released?

I think this is what they are doing, see 
https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L675

They switch altpll frequency for whatever reasons, then they do the 
dance of switching the parent rate to half rate if necessary and then 
they finally switch the parent's rate to the target rate. That's the 
only way I can interpret the cpu_clk_8996_set_rate().

https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L675

> 
> 
>> - Restore the parent in case the rate change aborts for some reason
>> - Do not duplicate resetting the parent in set_parent operation.
> These sound good.
> 
> Konrad
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 7e5246ca7e7f..ee7e18b37832 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -506,27 +506,34 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
>>   {
>>   	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
>>   	struct clk_notifier_data *cnd = data;
>> -	int ret;
>>   
>>   	switch (event) {
>>   	case PRE_RATE_CHANGE:
>> -		ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
>>   		qcom_cpu_clk_msm8996_acd_init(base);
>> +
>> +		/*
>> +		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
>> +		 * to bottom, so it will change the rate of the PLL before
>> +		 * chaging the parent of PMUX. This can result in pmux getting
>> +		 * clocked twice the expected rate.
>> +		 *
>> +		 * Manually switch to PLL/2 here.
>> +		 */
>> +		if (cnd->new_rate < DIV_2_THRESHOLD &&
>> +		    cnd->old_rate > DIV_2_THRESHOLD)
>> +			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
>> +
>>   		break;
>> -	case POST_RATE_CHANGE:
>> -		if (cnd->new_rate < DIV_2_THRESHOLD)
>> -			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
>> -							   SMUX_INDEX);
>> -		else
>> -			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
>> -							   ACD_INDEX);
>> -		break;
>> +	case ABORT_RATE_CHANGE:
>> +		/* Revert manual change */
>> +		if (cnd->new_rate < DIV_2_THRESHOLD &&
>> +		    cnd->old_rate > DIV_2_THRESHOLD)
>> +			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
>>   	default:
>> -		ret = 0;
>>   		break;
>>   	}
>>   
>> -	return notifier_from_errno(ret);
>> +	return NOTIFY_OK;
>>   };
>>   
>>   static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)

-- 
With best wishes
Dmitry

