Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A9A671FA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 15:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbjAROdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 09:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbjAROcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 09:32:45 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027131E5EE
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:21:08 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id vw16so20451914ejc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 06:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33e6GgoXuh4+eRQrB35G/on3xqyiWTKOBlZuPx8InNI=;
        b=Sb/PUPXAYas7wvDGn0+GrQNUMREqJ/xfUq7WdEavD1gxG55WsyzZG+i2xH+UlPg+vn
         nPJLzTQd0D8IJPcT1ju6sIU7WgU3EOmTH9TKw8qXhrOmzsTnDfBkU3NR2XBMST66J+1E
         /cFNop0pxpv3vfviyatW+1lwUcn5OTeX3g9VkWJALfYdz/dQoxfYVXPctyP+dGhZ2hKg
         vnSlYmw6Iq4QeaOKnhbBjVZOHXvqDtKXGZHYkPaFQF0be+T1+HGVW0oKEHTlPSr7a1ai
         h/AUYZJLKrB5z3Ch8t43jSV/hNvkIAS1S3dnXj9zGGN4PMu1ZMZ4szRZ3/Kq2M82znuu
         9Klw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33e6GgoXuh4+eRQrB35G/on3xqyiWTKOBlZuPx8InNI=;
        b=zR8hBFvz48RJ2HHZ9zZYDNeBbo/MXZIP0BfL8GYtkMmCp++4mzZIWD/2nxyFOhtsIr
         GdCwqway7eiopjb0wk83OWBVgapwgEOSZMBPUU16tI3aFqZUTIY/WPpz7B00AIAlkwhN
         cHXsjLVyiSwjK2qFquQIGGYfziOi09QBkhALYonGpjbshurJ4FV83p+wP3C64huvRdvr
         DlQ+i9I0Nev6cxc0e19u4T6KQyHy2ddTpY5z0PteOcWBNi9zjtD/gPc2YDAbXIY6WHEU
         AOks+T17mI1QnKcYV5lMo168/dSaQfSTsppdZz2T1IQomjHZLViNFHGGnZHQwlxboKni
         JG6A==
X-Gm-Message-State: AFqh2kr52OQSBa1q41sX/pR5Ke9tdVGPCVfJLByu/Zc9D5WQXMNaxHw4
        s156I98/ow9sOpRe4QRgNZp/2Q==
X-Google-Smtp-Source: AMrXdXtCAxv+2l1VlAteHKGFEAdd3zSyCQ73cImzSL4Y5Ql4b+9mRf0+X/Wf6Zyd5AeIviKMsaZVig==
X-Received: by 2002:a17:906:1605:b0:870:2f70:c631 with SMTP id m5-20020a170906160500b008702f70c631mr9104735ejd.2.1674051666578;
        Wed, 18 Jan 2023 06:21:06 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id h10-20020a1709070b0a00b0084d4e9a13cbsm11599021ejl.221.2023.01.18.06.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 06:21:06 -0800 (PST)
Message-ID: <671e8d1d-d41b-5747-540f-9174b12ffb4b@linaro.org>
Date:   Wed, 18 Jan 2023 15:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/7] clk: qcom: cbf-msm8996: scale CBF clock according
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
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230117225824.1552604-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.01.2023 23:58, Dmitry Baryshkov wrote:
> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
> according to CPU frequencies.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-cbf-8996.c | 141 +++++++++++++++++++++++++++++++-
>  1 file changed, 140 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
> index 9cde0e660228..9e30311a310b 100644
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
Where did the 2000 come from?

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
s/interconnects/interconnect

Will cpufreq still work correctly with opp tables having bw
properties, the nodes having icc properties and the icc provider
not probing? And then, will the system not choke up with high CPU
and inadequately low CBF clocks?

Maybe `select INTERCONNECT_something_8996` would be better?

Konrad
> +
> +	return 0;
> +}
> +#define qcom_msm8996_cbf_icc_remove(pdev) (0)
> +#endif
> +
>  static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>  {
>  	void __iomem *base;
> @@ -283,7 +411,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
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
> @@ -294,9 +431,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
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
