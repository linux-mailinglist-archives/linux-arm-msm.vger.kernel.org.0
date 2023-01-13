Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5622F669959
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 15:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbjAMODx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 09:03:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241757AbjAMOCv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:02:51 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17BC2BC1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:00:36 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id f34so33229498lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBkjCgH/S4+zja9GzwYgpPsdNEZWlR+52ok1y+g6x/E=;
        b=oZ/Q9thIkb7M5vKCG2gaS2Zjd3chlHTyxpb4Svy0Yen3DrkgHo7G4si+LrfxrVxsZt
         qe1r1IDkgCx4LR9MJ3dw4t36fyAvgDnYrTHXnUypoFsRhYEGPhJJrn3+g0bEky/A6Yce
         bmLtIMJ32+trXS2sOqFbEjpenMzeaGB4x5YhxP3uyNiMuSArpHLojm36qfqEwAXidg1v
         js722w5yaC3yN46ER1WfMYC3PQ7mOiL7mg4pDDDVN84KcqdZruqjPkwGhlbrvzVzk3FO
         QlUIWzz/dWei1W23Sc1Cutu64WibED7SWZWyzvyckIXuh49Gv8T4Ik64aBuU9DLkZxWU
         tQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBkjCgH/S4+zja9GzwYgpPsdNEZWlR+52ok1y+g6x/E=;
        b=qwu4k5QEy+QXCNAjQER6+Lu4+e+nVIrDxBEUTVna+stLQQA18W0Iu2U6K5O7MhMURv
         ONFy80KY0TNtCwJDWhP83AfnI2Wu+/V8SoX87kpBZj3/TMN6ucC8BWrQcKLZrpnhTrxf
         O//0SjFRZF9y+bHEm2fhxBbDngLkgSoAMaJzyuvHvlsnBNMo9yj558pNH9r4mof3prTY
         JSPyNiRSImIyzffYSWB43iteHDFsp/pm56CXNoHRzssOe7VpF+Uld52atw+YN6cBe2Zl
         HDZ1KVFzLi7aC7ALeKolQtkOQzLlhqJ46zEwZcDyPF88c51WKG8XC18Y9o8TSYjrkxE8
         GYGg==
X-Gm-Message-State: AFqh2kqPUrSFbDgMqz0ADIglC1bxOrc837GRC+h1gaI29HzKKAkkMxMD
        qsBsWUQI2BbhWJYXa/GU82+OHQ==
X-Google-Smtp-Source: AMrXdXuvV49S07ZHejZTWVcmIs/UwlOQ5p3FIP5cG/I1LHaUe2FHtfATf3m3ppAtkCP+BOudCV9e6Q==
X-Received: by 2002:ac2:491d:0:b0:4ca:faa4:af15 with SMTP id n29-20020ac2491d000000b004cafaa4af15mr20122639lfi.66.1673618434896;
        Fri, 13 Jan 2023 06:00:34 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id q11-20020a056512210b00b004cc9042c9cfsm1897868lfr.158.2023.01.13.06.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 06:00:33 -0800 (PST)
Message-ID: <3cb18e7f-27ca-1e3f-94e7-6f767a026b07@linaro.org>
Date:   Fri, 13 Jan 2023 15:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 10/13] clk: qcom: cpu-8996: fix ACD initialization
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <f2140e89-84a4-99a9-b2d1-7b4e0d0313d3@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <f2140e89-84a4-99a9-b2d1-7b4e0d0313d3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.01.2023 11:44, Dmitry Baryshkov wrote:
> On 12/01/2023 16:35, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:20, Dmitry Baryshkov wrote:
>>> The vendor kernel applies different order while programming SSSCTL and
>>> L2ACDCR registers on power and performance clusters. However it was
>>> demonstrated that doing this upstream results in the board reset. Make
>>> both clusters use the same sequence, which fixes the reset.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> I think we should look for the source of why this doesn't work,
>> e.g. does downstream program it earlier somewhere? Are we
>> missing something else that may bite later?
> 
> I'm not sure what is the reason for downstream doing init in such sequence. Right now I'm sure that doing ACD init with the provided sequence fails the boot in some conditions. There might be the difference in the CPU init order. Or any other ordering issue. Or the lack of the CPR. Or Kryo LDO programming. There is a huge difference between vendor's 3.18 and the current 6.x.
> 
> I propose to take the patch in, as it fixes the boot and runtime issue and revisit it later if any of the problems occur. I don't fancy such approach usually, but without the documentation I don't see a way to find any particular reason for programming pwr and perf using the different order of operations.
Ack, let's do that.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

One more thing, I noticed that downstream calls ACD init on
`CPU_STARTING` event instead of `PRE_RATE_CHANGE`, see [1].
Are we "over-programming" ACD too much, or is it intended/fine?

Konrad

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.7.5.r1-05300-8x96.0/drivers/clk/msm/clock-cpu-8996.c#L1522-1540
> 
>>
>> Konrad
>>>   drivers/clk/qcom/clk-cpu-8996.c | 20 ++++++++------------
>>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
>>> index 47c58bb5f21a..1c00eb629b61 100644
>>> --- a/drivers/clk/qcom/clk-cpu-8996.c
>>> +++ b/drivers/clk/qcom/clk-cpu-8996.c
>>> @@ -475,9 +475,9 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
>>>       return ret;
>>>   }
>>>   -#define CPU_AFINITY_MASK 0xFFF
>>> -#define PWRCL_CPU_REG_MASK 0x3
>>> -#define PERFCL_CPU_REG_MASK 0x103
>>> +#define CPU_CLUSTER_AFFINITY_MASK 0xf00
>>> +#define PWRCL_AFFINITY_MASK 0x000
>>> +#define PERFCL_AFFINITY_MASK 0x100
>>>     #define L2ACDCR_REG 0x580ULL
>>>   #define L2ACDTD_REG 0x581ULL
>>> @@ -498,21 +498,17 @@ static void qcom_cpu_clk_msm8996_acd_init(struct regmap *regmap)
>>>       if (val == 0x00006a11)
>>>           goto out;
>>>   -    hwid = read_cpuid_mpidr() & CPU_AFINITY_MASK;
>>> -
>>>       kryo_l2_set_indirect_reg(L2ACDTD_REG, 0x00006a11);
>>>       kryo_l2_set_indirect_reg(L2ACDDVMRC_REG, 0x000e0f0f);
>>>       kryo_l2_set_indirect_reg(L2ACDSSCR_REG, 0x00000601);
>>>   -    if (PWRCL_CPU_REG_MASK == (hwid | PWRCL_CPU_REG_MASK)) {
>>> -        regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>>> -        kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>>> -    }
>>> +    kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>>>   -    if (PERFCL_CPU_REG_MASK == (hwid | PERFCL_CPU_REG_MASK)) {
>>> -        kryo_l2_set_indirect_reg(L2ACDCR_REG, 0x002c5ffd);
>>> +    hwid = read_cpuid_mpidr();
>>> +    if ((hwid & CPU_CLUSTER_AFFINITY_MASK) == PWRCL_AFFINITY_MASK)
>>> +        regmap_write(regmap, PWRCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>>> +    else
>>>           regmap_write(regmap, PERFCL_REG_OFFSET + SSSCTL_OFFSET, 0xf);
>>> -    }
>>>     out:
>>>       spin_unlock_irqrestore(&qcom_clk_acd_lock, flags);
> 
