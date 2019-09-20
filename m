Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F20A1B8A35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 06:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfITEoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 00:44:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41268 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfITEoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 00:44:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E09546032C; Fri, 20 Sep 2019 04:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568954656;
        bh=5IzgzM6HNJw351IaOSYCnNV2iICFMAjVHpqKzXjNkYw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XZLlOrRrzZ38GeRIueOS7IgV26q4NIQgjIQg306oSed5HrsbK2VB0ZZre6cy34N0j
         YYWt8xnAhyjhPNjEX0zRdaHGliiShnszBxYz3wUGOLkaUZwlXkOtO8xaqHzsRgQhja
         mbkaKTgvGUhWEbeReJNiSAwUQo2Eyk0o+a28KTpI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.43.252] (unknown [27.59.41.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CD7C60A60;
        Fri, 20 Sep 2019 04:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568954655;
        bh=5IzgzM6HNJw351IaOSYCnNV2iICFMAjVHpqKzXjNkYw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=O6VBXZ0zBregHp5pjlLMBT7dc7zLTHbvGUcCRTVhqnyL0cTATCsVrl5V8eSCRHg+Y
         I9UfbYQhw38hen/IMIOWCazvDiblKuhF92KzCCSz/tBikR6mJRBf4dypQp1mP34hD5
         L2LXf77mqDX/LoTnmMBlf6on9OVJ6Q7sOhAZJRMg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CD7C60A60
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-4-tdas@codeaurora.org>
 <74643831-1a58-e279-aca3-8753f5fcbe04@codeaurora.org>
 <28d2670d-a8bb-50d6-2154-79278db64bca@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <9c6a3aa5-5e89-4fe0-9e35-16b031aca899@codeaurora.org>
Date:   Fri, 20 Sep 2019 10:14:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <28d2670d-a8bb-50d6-2154-79278db64bca@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9/20/2019 9:30 AM, Taniya Das wrote:
> Hi Rajendra,
> 
> Please pick the patch in the series : https://patchwork.kernel.org/patch/11150013/

ah, right, not sure how I missed the PATCH 1/3 in the series.
Sorry about the noise.

> 
> On 9/19/2019 4:38 PM, Rajendra Nayak wrote:
>> []..
>>
>>> +static struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
>>> +};
>>
>> this fails to build..
>>
>> In file included from drivers/clk/qcom/gcc-sc7180.c:17:0:
>> drivers/clk/qcom/gcc-sc7180.c:2429:17: error: ‘gcc_qupv3_wrap0_s0_clk_src_src’ undeclared here (not in a function)
>>    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>>                   ^
>> drivers/clk/qcom/clk-rcg.h:171:12: note: in definition of macro ‘DEFINE_RCG_DFS’
>>    { .rcg = &r##_src, .init = &r##_init }
>>              ^
>> drivers/clk/qcom/gcc-sc7180.c:2430:17: error: ‘gcc_qupv3_wrap0_s1_clk_src_src’ undeclared here (not in a function)
>>    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>>                   ^
>> drivers/clk/qcom/clk-rcg.h:171:12: note: in definition of macro ‘DEFINE_RCG_DFS’
>>    { .rcg = &r##_src, .init = &r##_init }
>>              ^
>> Perhaps you should drop _src here and in the clk_init_data names.
>>
>>> +
>>> +static const struct regmap_config gcc_sc7180_regmap_config = {
>>> +    .reg_bits = 32,
>>> +    .reg_stride = 4,
>>> +    .val_bits = 32,
>>> +    .max_register = 0x18208c,
>>> +    .fast_io = true,
>>> +};
>>> +
>>> +static const struct qcom_cc_desc gcc_sc7180_desc = {
>>> +    .config = &gcc_sc7180_regmap_config,
>>> +    .clk_hws = gcc_sc7180_hws,
>>> +    .num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
>>> +    .clks = gcc_sc7180_clocks,
>>> +    .num_clks = ARRAY_SIZE(gcc_sc7180_clocks),
>>> +    .resets = gcc_sc7180_resets,
>>> +    .num_resets = ARRAY_SIZE(gcc_sc7180_resets),
>>> +    .gdscs = gcc_sc7180_gdscs,
>>> +    .num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
>>> +};
>>> +
>>> +static const struct of_device_id gcc_sc7180_match_table[] = {
>>> +    { .compatible = "qcom,gcc-sc7180" },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
>>> +
>>> +static int gcc_sc7180_probe(struct platform_device *pdev)
>>> +{
>>> +    struct regmap *regmap;
>>> +    int ret;
>>> +
>>> +    regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
>>> +    if (IS_ERR(regmap))
>>> +        return PTR_ERR(regmap);
>>> +
>>> +    /*
>>> +     * Disable the GPLL0 active input to MM blocks, NPU
>>> +     * and GPU via MISC registers.
>>> +     */
>>> +    regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
>>> +    regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
>>> +    regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);
>>> +
>>> +    ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>>> +                    ARRAY_SIZE(gcc_dfs_clocks));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return qcom_cc_really_probe(pdev, &gcc_sc7180_desc, regmap);
>>> +}
>>> +
>>> +static struct platform_driver gcc_sc7180_driver = {
>>> +    .probe = gcc_sc7180_probe,
>>> +    .driver = {
>>> +        .name = "gcc-sc7180",
>>> +        .of_match_table = gcc_sc7180_match_table,
>>> +    },
>>> +};
>>> +
>>> +static int __init gcc_sc7180_init(void)
>>> +{
>>> +    return platform_driver_register(&gcc_sc7180_driver);
>>> +}
>>> +subsys_initcall(gcc_sc7180_init);
>>> +
>>> +static void __exit gcc_sc7180_exit(void)
>>> +{
>>> +    platform_driver_unregister(&gcc_sc7180_driver);
>>> +}
>>> +module_exit(gcc_sc7180_exit);
>>> +
>>> +MODULE_DESCRIPTION("QTI GCC SC7180 Driver");
>>> +MODULE_LICENSE("GPL v2");
>>> -- 
>>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>>
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
