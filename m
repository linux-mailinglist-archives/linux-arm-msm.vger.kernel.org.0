Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A60FBB89DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 06:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfITEBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 00:01:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59020 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfITEA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 00:00:59 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 052526118C; Fri, 20 Sep 2019 04:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568952058;
        bh=AIK0J5ogWhXcwUg2uYgcVFaQol74vgG+i08Ed7lID8w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EgUFX0VjBqUu1Czv9Gy5G6Ai/JXuvctgFYX8nOsrQP7bGryZut2RWkKc+lXsIvqJw
         X6vehAJVFBEjYCHP56QBqHyeXrzT8sgy4EsRzkpgEpYDpeIAWFZyUURclzzHd9Ibyf
         wu7y3Fkxyeb7N5OOGpMciu/R+Lg6EwdsOmVDcZUM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE237613A3;
        Fri, 20 Sep 2019 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568952057;
        bh=AIK0J5ogWhXcwUg2uYgcVFaQol74vgG+i08Ed7lID8w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fuPwKVsg8qhEumAD189eaRUzvVyUM8cpbHU2SaEnCDL5o6s78TNmRrTFurEt+1T38
         BeLNp7DhB6Knv3DLyhx+LRcEsj6bCnn07nCeCX/sEP+xnAKRhlReJ/u93lIQ9SPy85
         nGOeG/0yzeW3GGtS0jhITZL5JSJlMuPxl5uD069U=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE237613A3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
To:     Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-4-tdas@codeaurora.org>
 <74643831-1a58-e279-aca3-8753f5fcbe04@codeaurora.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <28d2670d-a8bb-50d6-2154-79278db64bca@codeaurora.org>
Date:   Fri, 20 Sep 2019 09:30:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <74643831-1a58-e279-aca3-8753f5fcbe04@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajendra,

Please pick the patch in the series : 
https://patchwork.kernel.org/patch/11150013/

On 9/19/2019 4:38 PM, Rajendra Nayak wrote:
> []..
> 
>> +static struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
>> +};
> 
> this fails to build..
> 
> In file included from drivers/clk/qcom/gcc-sc7180.c:17:0:
> drivers/clk/qcom/gcc-sc7180.c:2429:17: error: 
> ‘gcc_qupv3_wrap0_s0_clk_src_src’ undeclared here (not in a function)
>    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>                   ^
> drivers/clk/qcom/clk-rcg.h:171:12: note: in definition of macro 
> ‘DEFINE_RCG_DFS’
>    { .rcg = &r##_src, .init = &r##_init }
>              ^
> drivers/clk/qcom/gcc-sc7180.c:2430:17: error: 
> ‘gcc_qupv3_wrap0_s1_clk_src_src’ undeclared here (not in a function)
>    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>                   ^
> drivers/clk/qcom/clk-rcg.h:171:12: note: in definition of macro 
> ‘DEFINE_RCG_DFS’
>    { .rcg = &r##_src, .init = &r##_init }
>              ^
> Perhaps you should drop _src here and in the clk_init_data names.
> 
>> +
>> +static const struct regmap_config gcc_sc7180_regmap_config = {
>> +    .reg_bits = 32,
>> +    .reg_stride = 4,
>> +    .val_bits = 32,
>> +    .max_register = 0x18208c,
>> +    .fast_io = true,
>> +};
>> +
>> +static const struct qcom_cc_desc gcc_sc7180_desc = {
>> +    .config = &gcc_sc7180_regmap_config,
>> +    .clk_hws = gcc_sc7180_hws,
>> +    .num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
>> +    .clks = gcc_sc7180_clocks,
>> +    .num_clks = ARRAY_SIZE(gcc_sc7180_clocks),
>> +    .resets = gcc_sc7180_resets,
>> +    .num_resets = ARRAY_SIZE(gcc_sc7180_resets),
>> +    .gdscs = gcc_sc7180_gdscs,
>> +    .num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
>> +};
>> +
>> +static const struct of_device_id gcc_sc7180_match_table[] = {
>> +    { .compatible = "qcom,gcc-sc7180" },
>> +    { }
>> +};
>> +MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
>> +
>> +static int gcc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +    struct regmap *regmap;
>> +    int ret;
>> +
>> +    regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
>> +    if (IS_ERR(regmap))
>> +        return PTR_ERR(regmap);
>> +
>> +    /*
>> +     * Disable the GPLL0 active input to MM blocks, NPU
>> +     * and GPU via MISC registers.
>> +     */
>> +    regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
>> +    regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
>> +    regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);
>> +
>> +    ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +                    ARRAY_SIZE(gcc_dfs_clocks));
>> +    if (ret)
>> +        return ret;
>> +
>> +    return qcom_cc_really_probe(pdev, &gcc_sc7180_desc, regmap);
>> +}
>> +
>> +static struct platform_driver gcc_sc7180_driver = {
>> +    .probe = gcc_sc7180_probe,
>> +    .driver = {
>> +        .name = "gcc-sc7180",
>> +        .of_match_table = gcc_sc7180_match_table,
>> +    },
>> +};
>> +
>> +static int __init gcc_sc7180_init(void)
>> +{
>> +    return platform_driver_register(&gcc_sc7180_driver);
>> +}
>> +subsys_initcall(gcc_sc7180_init);
>> +
>> +static void __exit gcc_sc7180_exit(void)
>> +{
>> +    platform_driver_unregister(&gcc_sc7180_driver);
>> +}
>> +module_exit(gcc_sc7180_exit);
>> +
>> +MODULE_DESCRIPTION("QTI GCC SC7180 Driver");
>> +MODULE_LICENSE("GPL v2");
>> -- 
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
