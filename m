Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40D4669492
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241275AbjAMKqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:46:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240773AbjAMKp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:45:58 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F3215F3F
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:44:11 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b3so32546698lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0cJY2QzJymCV6m/o9AZRrVEg4sA7Mf8RR5di2bPPh1U=;
        b=uveNyrhYtUe+KMVJmtCuq8ovBhUOw7d4yvfWZUfLG7hdZrFC+FFfK12ZUbXlBY2Sh7
         1eGGy21dbx4l/CP7uWbdILWR2ZeaoaoYFEkjSjKcMZp1cmkPMmYj3RveMb5DwxgL0Wuo
         MGBoeRbXFtVDHCgGX+6JiS6NTtqfS0Oy9NxtyLczLiPQcikwDtZVWE6ONAVbTQCVWZpw
         2v8lGl42aH1rjr18xHAG63lgOfj7JuNUha2OPwWEKENARpsRb4QbnCWE8Fq/hYpydmi5
         YLF/4PV1Is8QRRzNV5CFt2NrtInXKqxIvXQG/LlDadGfW9zElZe/sJdK4MAFIwfYGp1E
         9f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cJY2QzJymCV6m/o9AZRrVEg4sA7Mf8RR5di2bPPh1U=;
        b=dBjSKm2kuo+G4DO7CUPu35yn/gpUSesLmi6w/vQkbLimHISNjHxRyifGUsJefzQM+x
         wRljYog11YBn6E/EDMS/qeVrbqaHRr9vJMLRWnKz8wcCxngYiipW1hooygo4OvQL7jUu
         sn3/dA7gP9dSNyOzsiP+z3nfsz0EyaUv4n+4gnPxY4O376I7oe+ulp/zEN42fySwQIW/
         oGzXrpzTrufuunhQJaedq/zY9o8Yi5T4L7ZCoKMquMdaYOCA2c/UFSTlJk9HsC2nKZ/i
         Q1rKuicPH4r21Yx4kt9eTGxB4o4YgmpfZLwA92Hzb981I578jM8jhbiJlApQ30i+Kk4q
         iZhA==
X-Gm-Message-State: AFqh2kqDltlc5kJ28gVJNUIrI3eojnFPv/c1qvacJYwzDJW8r60FXesc
        aMs0iknRvam+P84vxrrn4XISNQ==
X-Google-Smtp-Source: AMrXdXs1K3k8dz69gU2BLNHHD/h9uh6YkU5C8bzpVHqrsIMLkLR2+NqBiudu5n0wZCBa8adp/by7FA==
X-Received: by 2002:a05:6512:15a7:b0:4ae:8476:2df with SMTP id bp39-20020a05651215a700b004ae847602dfmr5485495lfb.10.1673606649524;
        Fri, 13 Jan 2023 02:44:09 -0800 (PST)
Received: from [192.168.2.31] ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id b8-20020a056512060800b004cb1de3f487sm3786430lfe.104.2023.01.13.02.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 02:44:09 -0800 (PST)
Message-ID: <f2140e89-84a4-99a9-b2d1-7b4e0d0313d3@linaro.org>
Date:   Fri, 13 Jan 2023 12:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 10/13] clk: qcom: cpu-8996: fix ACD initialization
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
 <20230111192004.2509750-11-dmitry.baryshkov@linaro.org>
 <1c8d38e0-2f9d-9e89-5e21-e74ac7851727@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1c8d38e0-2f9d-9e89-5e21-e74ac7851727@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2023 16:35, Konrad Dybcio wrote:
> 
> 
> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>> The vendor kernel applies different order while programming SSSCTL and
>> L2ACDCR registers on power and performance clusters. However it was
>> demonstrated that doing this upstream results in the board reset. Make
>> both clusters use the same sequence, which fixes the reset.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> I think we should look for the source of why this doesn't work,
> e.g. does downstream program it earlier somewhere? Are we
> missing something else that may bite later?

I'm not sure what is the reason for downstream doing init in such 
sequence. Right now I'm sure that doing ACD init with the provided 
sequence fails the boot in some conditions. There might be the 
difference in the CPU init order. Or any other ordering issue. Or the 
lack of the CPR. Or Kryo LDO programming. There is a huge difference 
between vendor's 3.18 and the current 6.x.

I propose to take the patch in, as it fixes the boot and runtime issue 
and revisit it later if any of the problems occur. I don't fancy such 
approach usually, but without the documentation I don't see a way to 
find any particular reason for programming pwr and perf using the 
different order of operations.

> 
> Konrad
>>   drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>> index 47c58bb5f21a..1c00eb629b61 100644
>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>> @@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>>   	return ret;
>>   }
>>   
>> -#define CPU_AFINITY_MASK 0xFFF
>> -#define PWRCL_CPU_REG_MASK 0x3
>> -#define PERFCL_CPU_REG_MASK 0x103
>> +#define CPU_CLUSTER_AFFINITY_MASK 0xf00
>> +#define PWRCL_AFFINITY_MASK 0x000
>> +#define PERFCL_AFFINITY_MASK 0x100
>>   
>>   #define L2ACDCR_REG 0x580ULL
>>   #define L2ACDTD_REG 0x581ULL
>> @@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
>>   	if (val == 0x00006a11)
>>   		goto out;
>>   
>> -	hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
>> -
>>   	kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
>>   	kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
>>   	kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
>>   
>> -	if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
>> -		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>> -		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>> -	}
>> +	kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>>   
>> -	if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
>> -		kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>> +	hwid = read_cpuid_mpidr();
>> +	if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
>> +		regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>> +	else
>>   		regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>> -	}
>>   
>>   out:
>>   	spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);

-- 
With best wishes
Dmitry

