Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CAA6678B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 16:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240314AbjALPMN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 10:12:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240268AbjALPLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 10:11:43 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B3FD59F82
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:00:11 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id o7so19266583ljj.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaQ9ZHyuu9//EamyGdwOkl8euCIGdNz3eD+kZ2iAohk=;
        b=QJF5OeqnAvMwzskjPorC7foJSE/Nbch7wj6+UNjOoMLhVDp9qQlhVBMjUAiJr/pBeH
         Dt/GCg5U4oWLcWP4yaLoXJg/kTFMgzlYAVMWTZYAxfdQ+M6+aiKrKl2svm4MtrP3jlM/
         KRPGPiniCS+rRqZVpvLBZNi4fOYQJAyyoTrY81P/nDyhrXK6ZEA4YRC0ayVRtHTGXGo2
         0OvHXjHJ0kzffbYN/UfAzxO0lTKHyZTALIafKTX3kkktbZQD297b8wQLs211FeWQ//AG
         wblEquFnFPhxjSQWf9a6Ma0s3UY/MRodRydGPEuAAou4yQMrNK81pt2Y+grIV8MkdJ79
         ee0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaQ9ZHyuu9//EamyGdwOkl8euCIGdNz3eD+kZ2iAohk=;
        b=zEG0rLsIwS5fjp5roB9fkvDSvBNP7rEno/cWCEPHI/wnX0ae62WfVMkwPSEPeUho7U
         g/Vm2MS1uP36fdfBjTLpoFogOW4A6ElRCRlmUKIQRa5tRgQZMCD+jhEc8SgMs+/ypYHP
         +HnZa0bAZbSTaCciX5K/WmLIroquh0MBI0unB/M9iegqd+czRe/O19HmHu3KY6V3ZyxN
         tQnq02bTLOImJatKqGQeSJ9Hf8L6YHAv3BkIEvChVmD/FdLBurYTTkjMEFA+S5lrIm/L
         jZJc+uD4uBPJ7sxkuIH7vwwNiruwCUdyqFSPNedrk+gmI82/+b9uXB0cU836LVO0+XxX
         2eAA==
X-Gm-Message-State: AFqh2ko8jaK+lO41EFZdhnSwAylFlA5KmQaTkn/Cbx5NBJ2trIwanVpc
        Pk6YaEbi+eV32oLqVY1Rh5SJ4g==
X-Google-Smtp-Source: AMrXdXvB4uvKPlxwGlmMw4RXZq+Vd1fccVVTCpVIAHuzZd799sD1Ipn8TYhEgN9GENn507gyvXbaRg==
X-Received: by 2002:a05:651c:12c3:b0:27f:f08b:ce25 with SMTP id 3-20020a05651c12c300b0027ff08bce25mr11105906lje.52.1673535609180;
        Thu, 12 Jan 2023 07:00:09 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p17-20020a2eb991000000b0027fb76a4b44sm2201139ljp.97.2023.01.12.07.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:00:07 -0800 (PST)
Message-ID: <360f92f9-8b3b-e491-e72c-c9cdcbe0c731@linaro.org>
Date:   Thu, 12 Jan 2023 16:00:06 +0100
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
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111195754.2593134-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 20:57, Dmitry Baryshkov wrote:
> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
> according to CPU frequencies.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
TODO: assess if we should be doing this manually or rely on SPDM..

Konrad
>  drivers/clk/qcom/clk-cbf-8996.c | 141 +++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> index bdd4f8b48a7e..76db623b0f92 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -5,6 +5,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -225,6 +226,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
>  	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
>  };
>  
> +#ifdef CONFIG_INTERCONNECT
> +struct qcom_msm8996_cbf_icc_provider {
> +	struct icc_provider provider;
> +	struct clk *clk;
> +};
> +
> +#define to_qcom_cbf_provider(_provider) \
> +	container_of(_provider, struct qcom_msm8996_cbf_icc_provider, provider)
> +
> +enum {
> +	CBF_MASTER_NODE = 2000,
> +	CBF_SLAVE_NODE
> +};
> +
> +#define CBF_NUM_NODES 2
> +
> +static int qcom_msm8996_cbf_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct qcom_msm8996_cbf_icc_provider *qp;
> +
> +	qp = to_qcom_cbf_provider(src->provider);
> +
> +	return clk_set_rate(qp->clk, icc_units_to_bps(dst->peak_bw));
> +}
> +
> +static int qcom_msm8996_cbf_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
> +{
> +	struct qcom_msm8996_cbf_icc_provider *qp;
> +
> +	qp = to_qcom_cbf_provider(node->provider);
> +	*peak = clk_get_rate(qp->clk) / 1000ULL;
> +
> +	return 0;
> +}
> +
> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct clk_hw *cbf_hw)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct qcom_msm8996_cbf_icc_provider *qp;
> +	struct icc_provider *provider;
> +	struct icc_onecell_data *data;
> +	struct icc_node *node;
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	data = devm_kzalloc(dev, struct_size(data, nodes, CBF_NUM_NODES), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->num_nodes = CBF_NUM_NODES;
> +
> +	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
> +	if (!qp)
> +		return -ENOMEM;
> +
> +	qp->clk = clk;
> +
> +	provider = &qp->provider;
> +	provider->dev = dev;
> +	provider->get_bw = qcom_msm8996_cbf_icc_get_bw;
> +	provider->set = qcom_msm8996_cbf_set;
> +	provider->aggregate = icc_std_aggregate;
> +	provider->xlate = of_icc_xlate_onecell;
> +	INIT_LIST_HEAD(&provider->nodes);
> +	provider->data = data;
> +
> +	ret = icc_provider_add(provider);
> +	if (ret) {
> +		dev_err(dev, "error adding interconnect provider\n");
> +		return ret;
> +	}
> +
> +	node = icc_node_create(CBF_MASTER_NODE);
> +	if (IS_ERR(node)) {
> +		ret = PTR_ERR(node);
> +		goto err;
> +	}
> +
> +	node->name = "cbf_master";
> +	icc_node_add(node, provider);
> +	icc_link_create(node, CBF_SLAVE_NODE);
> +	data->nodes[0] = node;
> +
> +	node = icc_node_create(CBF_SLAVE_NODE);
> +	if (IS_ERR(node)) {
> +		ret = PTR_ERR(node);
> +		goto err;
> +	}
> +
> +	node->name = "cbf_slave";
> +	icc_node_add(node, provider);
> +	data->nodes[1] = node;
> +
> +	platform_set_drvdata(pdev, provider);
> +
> +	return 0;
> +
> +err:
> +	icc_nodes_remove(provider);
> +	icc_provider_del(provider);
> +
> +	return ret;
> +}
> +
> +static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
> +{
> +	struct icc_provider *provider = platform_get_drvdata(pdev);
> +
> +	icc_nodes_remove(provider);
> +	icc_provider_del(provider);
> +
> +	return 0;
> +}
> +#else
> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
> +{
> +	dev_warn(&pdev->dev, "interconnects support is disabled, CBF clock is fixed\n");
> +
> +	return 0;
> +}
> +#define qcom_msm8996_cbf_icc_remove(pdev) (0)
> +#endif
> +
>  static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>  {
>  	void __iomem *base;
> @@ -284,7 +412,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
> +	if (ret)
> +		return ret;
> +
> +	return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
> +}
> +
> +static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
> +{
> +	return qcom_msm8996_cbf_icc_remove(pdev);
>  }
>  
>  static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
> @@ -295,9 +432,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
>  
>  static struct platform_driver qcom_msm8996_cbf_driver = {
>  	.probe = qcom_msm8996_cbf_probe,
> +	.remove = qcom_msm8996_cbf_remove,
>  	.driver = {
>  		.name = "qcom-msm8996-cbf",
>  		.of_match_table = qcom_msm8996_cbf_match_table,
> +		.sync_state = icc_sync_state,
>  	},
>  };
>  
