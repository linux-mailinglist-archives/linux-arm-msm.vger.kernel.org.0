Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27A316679D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 16:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbjALPtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 10:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240551AbjALPs2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 10:48:28 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160F8625E8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:38:01 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id g13so29001263lfv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEUvqG76d1GJ6BhE9V6Xx4xIqZDDA06DqRNZMhr8jkQ=;
        b=fK5I2YDII0EV8s7DzywvnawXctLFMxLhI3M3tRPf5D6MBIM9W4Ok440Ej53lJC3mJA
         hHc3rA/C6JvGjvBkPcr5EKNtmUrgRN2k2YMu/eUZdGVQgkRW/zXIE12e2hP3I3psKPsv
         kty59PK6QPAsbfyJGrj/j40S9NtTD3QqPmlg294jNd/KQizDOog6t9bcYB4zdzcLD7B4
         0FZCVNc+uS7qHutmmf3bf0uVlVP1PnAXnaZnOzq+fKdOzUU7amal0WRJe+7BFy8PxPX/
         X8Jh+NrxNWndGP7Brlyz6xWHW0pf0qJ4BMg55c7coka4tENSNIwRD60qfOH9RNU/dx1X
         A4kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEUvqG76d1GJ6BhE9V6Xx4xIqZDDA06DqRNZMhr8jkQ=;
        b=tQQsqOP/hio4OHq2TbF1DuR4QJguruPX9Hrb8r3UP0dYBkbsDwsgX2ryOfgzkMIFxc
         hNBjIUy5FAyfftW3ozP5tSVwlCYyzbnKKk464t1+HEUS5VeVS/ErTH0dAdmAwllnG79e
         +UBSj+ZPGNFbC6o/XywgGB/iQr4/JGp1muJOOYkt/bJipBfBKWC1+bC53XqoMPR9vuqS
         KxU0+lG8FYHa3EgNf+jqSljeSg+Gj7GS630ptfnqyxh44FjZVSA8eIQBBGB1DefwhXZI
         LygzxgdnvhkWQXPd2kNoxTEav87DDCNKhMuhfA6mj6pn+QX1lcFvGVX3UtsG3TwBTuGh
         9Whw==
X-Gm-Message-State: AFqh2kokR2S1BzZh58YEAwZukTw6qTrsGmglEjC6tPCE7JrUqSTjZOZy
        5vt+hSOk61SjDNrU5OEGI/Q6CqoSPPalPFIz
X-Google-Smtp-Source: AMrXdXsOlD8RqPNHopC/Ljb1p2ChYY7uK2feYvTNkKN2IEn+4P5GDq5eQYGhIkRigL6eXVz2+uAzPw==
X-Received: by 2002:a05:6512:1594:b0:4b5:6a20:ca90 with SMTP id bp20-20020a056512159400b004b56a20ca90mr26053894lfb.10.1673537879417;
        Thu, 12 Jan 2023 07:37:59 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id z3-20020a0565120c0300b004cb03999979sm3327203lfu.40.2023.01.12.07.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:37:57 -0800 (PST)
Message-ID: <60c9549b-df3d-7af5-f741-cbce86bc94eb@linaro.org>
Date:   Thu, 12 Jan 2023 16:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/5] clk: qcom: cbf-msm8996: scale CBF clock according to
 the CPUfreq
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
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-4-dmitry.baryshkov@linaro.org>
 <360f92f9-8b3b-e491-e72c-c9cdcbe0c731@linaro.org>
 <8dd3e1d4-42ca-2f5d-689c-4c5f48abb748@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <8dd3e1d4-42ca-2f5d-689c-4c5f48abb748@linaro.org>
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



On 12.01.2023 16:29, Dmitry Baryshkov wrote:
> On 12/01/2023 17:00, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:57, Dmitry Baryshkov wrote:
>>> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
>>> according to CPU frequencies.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> TODO: assess if we should be doing this manually or rely on SPDM..
> 
> Manually, see the msm-3.18's devfreq-cpu and m4m-cpufreq maps.
> 
> SPDM uses CBF as an input not as an output.
Thanks, that makes sense, I keep confusing it!

Konrad
> 
>>
>> Konrad
>>>   drivers/clk/qcom/clk-cbf-8996.c | 141 +++++++++++++++++++++++++++++++-
>>>   1 file changed, 140 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
>>> index bdd4f8b48a7e..76db623b0f92 100644
>>> --- a/drivers/clk/qcom/clk-cbf-8996.c
>>> +++ b/drivers/clk/qcom/clk-cbf-8996.c
>>> @@ -5,6 +5,7 @@
>>>   #include <linux/bitfield.h>
>>>   #include <linux/clk.h>
>>>   #include <linux/clk-provider.h>
>>> +#include <linux/interconnect-provider.h>
>>>   #include <linux/of.h>
>>>   #include <linux/module.h>
>>>   #include <linux/platform_device.h>
>>> @@ -225,6 +226,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
>>>       .val_format_endian    = REGMAP_ENDIAN_LITTLE,
>>>   };
>>>   +#ifdef CONFIG_INTERCONNECT
>>> +struct qcom_msm8996_cbf_icc_provider {
>>> +    struct icc_provider provider;
>>> +    struct clk *clk;
>>> +};
>>> +
>>> +#define to_qcom_cbf_provider(_provider) \
>>> +    container_of(_provider, struct qcom_msm8996_cbf_icc_provider, provider)
>>> +
>>> +enum {
>>> +    CBF_MASTER_NODE = 2000,
>>> +    CBF_SLAVE_NODE
>>> +};
>>> +
>>> +#define CBF_NUM_NODES 2
>>> +
>>> +static int qcom_msm8996_cbf_set(struct icc_node *src, struct icc_node *dst)
>>> +{
>>> +    struct qcom_msm8996_cbf_icc_provider *qp;
>>> +
>>> +    qp = to_qcom_cbf_provider(src->provider);
>>> +
>>> +    return clk_set_rate(qp->clk, icc_units_to_bps(dst->peak_bw));
>>> +}
>>> +
>>> +static int qcom_msm8996_cbf_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
>>> +{
>>> +    struct qcom_msm8996_cbf_icc_provider *qp;
>>> +
>>> +    qp = to_qcom_cbf_provider(node->provider);
>>> +    *peak = clk_get_rate(qp->clk) / 1000ULL;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct clk_hw *cbf_hw)
>>> +{
>>> +    struct device *dev = &pdev->dev;
>>> +    struct qcom_msm8996_cbf_icc_provider *qp;
>>> +    struct icc_provider *provider;
>>> +    struct icc_onecell_data *data;
>>> +    struct icc_node *node;
>>> +    struct clk *clk;
>>> +    int ret;
>>> +
>>> +    clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
>>> +    if (IS_ERR(clk))
>>> +        return PTR_ERR(clk);
>>> +
>>> +    data = devm_kzalloc(dev, struct_size(data, nodes, CBF_NUM_NODES), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    data->num_nodes = CBF_NUM_NODES;
>>> +
>>> +    qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
>>> +    if (!qp)
>>> +        return -ENOMEM;
>>> +
>>> +    qp->clk = clk;
>>> +
>>> +    provider = &qp->provider;
>>> +    provider->dev = dev;
>>> +    provider->get_bw = qcom_msm8996_cbf_icc_get_bw;
>>> +    provider->set = qcom_msm8996_cbf_set;
>>> +    provider->aggregate = icc_std_aggregate;
>>> +    provider->xlate = of_icc_xlate_onecell;
>>> +    INIT_LIST_HEAD(&provider->nodes);
>>> +    provider->data = data;
>>> +
>>> +    ret = icc_provider_add(provider);
>>> +    if (ret) {
>>> +        dev_err(dev, "error adding interconnect provider\n");
>>> +        return ret;
>>> +    }
>>> +
>>> +    node = icc_node_create(CBF_MASTER_NODE);
>>> +    if (IS_ERR(node)) {
>>> +        ret = PTR_ERR(node);
>>> +        goto err;
>>> +    }
>>> +
>>> +    node->name = "cbf_master";
>>> +    icc_node_add(node, provider);
>>> +    icc_link_create(node, CBF_SLAVE_NODE);
>>> +    data->nodes[0] = node;
>>> +
>>> +    node = icc_node_create(CBF_SLAVE_NODE);
>>> +    if (IS_ERR(node)) {
>>> +        ret = PTR_ERR(node);
>>> +        goto err;
>>> +    }
>>> +
>>> +    node->name = "cbf_slave";
>>> +    icc_node_add(node, provider);
>>> +    data->nodes[1] = node;
>>> +
>>> +    platform_set_drvdata(pdev, provider);
>>> +
>>> +    return 0;
>>> +
>>> +err:
>>> +    icc_nodes_remove(provider);
>>> +    icc_provider_del(provider);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
>>> +{
>>> +    struct icc_provider *provider = platform_get_drvdata(pdev);
>>> +
>>> +    icc_nodes_remove(provider);
>>> +    icc_provider_del(provider);
>>> +
>>> +    return 0;
>>> +}
>>> +#else
>>> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
>>> +{
>>> +    dev_warn(&pdev->dev, "interconnects support is disabled, CBF clock is fixed\n");
>>> +
>>> +    return 0;
>>> +}
>>> +#define qcom_msm8996_cbf_icc_remove(pdev) (0)
>>> +#endif
>>> +
>>>   static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>>>   {
>>>       void __iomem *base;
>>> @@ -284,7 +412,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>>>       if (ret)
>>>           return ret;
>>>   -    return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
>>> +    ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
>>> +}
>>> +
>>> +static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
>>> +{
>>> +    return qcom_msm8996_cbf_icc_remove(pdev);
>>>   }
>>>     static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
>>> @@ -295,9 +432,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
>>>     static struct platform_driver qcom_msm8996_cbf_driver = {
>>>       .probe = qcom_msm8996_cbf_probe,
>>> +    .remove = qcom_msm8996_cbf_remove,
>>>       .driver = {
>>>           .name = "qcom-msm8996-cbf",
>>>           .of_match_table = qcom_msm8996_cbf_match_table,
>>> +        .sync_state = icc_sync_state,
>>>       },
>>>   };
>>>   
> 
