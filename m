Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597E867533B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 12:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbjATLON (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 06:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjATLOH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 06:14:07 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A84CE10243
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:13:44 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id v10so6317976edi.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 03:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FuhoEfe+x4LjN0r99tBoSP0Kvb0x2Tn/6Y6JaLynj7I=;
        b=pOEOgB2pbTKsBM1C1+xQ8x7eT/MxYr+YfOcHxVrSenGRSBqRg9Wxml/KOukR0uHwJf
         l9z4PLEbnMk6lsyuhT5o0xstt34b839zZv3Y++fjzGHk0b20IMM+k0Z0baZ+mgf+iuW0
         nUecF/pcaBK9XUnZ7YUmKiEj6dg4s+HpKrHft+9axwx8NtNJum1nY4tal8rWZeL9HGhb
         81pMz+QYCDJbtOH5G0ihjdkC68QjZ6ewivAwU3bDshipuZb56WU4RFlT3n43CZ4nX1xM
         K5jBy2oyLHS/4IuZXtBuJSv+8abtq/bEs7LX2XZ99aPBOxawQaEHfZcsoGEn9vmo0NYE
         0LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FuhoEfe+x4LjN0r99tBoSP0Kvb0x2Tn/6Y6JaLynj7I=;
        b=UlI0LQSHcSjNChMELxmELfbHs1hh3+dqGhwwvDPQp6CvZCNk9aAUYy9rDvtkDH0TL0
         JTtlQvNDbGPudu2RpVupiALIujiELXTdUnrFW4eccWtQT1S+3HEVvbKGY26LaaPPHhzv
         EHlngrTCVj9MbgV6SxQTmYo6PUmoYTs8b0lDAx3C2/SZp+LKK+HvJ0pEV9CjB57CIb7Q
         TzAL9TStHJTCq1lf5UhVuFoW05C9IX/BWEkbWtd4dfBalWmqZm8pJYNLWBSTBhMkQ8jd
         Vgs7tbKjpBqEGa8H4/7GyHzAz5Dj/dQASUbOzkFGHW6/ZTOkIzmiD60MJWbZfhqsBhJx
         aWFw==
X-Gm-Message-State: AFqh2krwVkTX9wdN9p0V+49m67q2eh11nFAq8VWVlLQjrCfYLtOzJvlX
        0hMEhNsjVMtq0N+xDfx0lPImAQ==
X-Google-Smtp-Source: AMrXdXtTnc3o24tM0Tcf5Mp7DRP+wyVzxXoEtBnghfwWP2wOr7hoAQNjOx8F6mGEg4JwxYUTez6Kmg==
X-Received: by 2002:aa7:cf92:0:b0:48b:58be:472c with SMTP id z18-20020aa7cf92000000b0048b58be472cmr14651328edx.18.1674213222738;
        Fri, 20 Jan 2023 03:13:42 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id p11-20020a05640243cb00b0049e19136c22sm6454312edc.95.2023.01.20.03.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:13:42 -0800 (PST)
Message-ID: <2c263a7a-9286-d6ea-d2f9-d776c07b8551@linaro.org>
Date:   Fri, 20 Jan 2023 12:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 4/8] clk: qcom: cbf-msm8996: scale CBF clock according
 to the CPUfreq
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
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.01.2023 07:14, Dmitry Baryshkov wrote:
> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
> according to CPU frequencies.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-cbf-8996.c | 143 +++++++++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> index 9cde0e660228..b049b4f7b270 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -5,11 +5,14 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
> +#include <dt-bindings/interconnect/qcom,msm8996-cbf.h>
> +
>  #include "clk-alpha-pll.h"
>  #include "clk-regmap.h"
>  
> @@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
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
> +	data->nodes[MASTER_CBF_M4M] = node;
> +
> +	node = icc_node_create(CBF_SLAVE_NODE);
> +	if (IS_ERR(node)) {
> +		ret = PTR_ERR(node);
> +		goto err;
> +	}
> +
> +	node->name = "cbf_slave";
> +	icc_node_add(node, provider);
> +	data->nodes[SLAVE_CBF_M4M] = node;
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
> @@ -283,7 +413,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
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
> @@ -294,9 +433,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
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
