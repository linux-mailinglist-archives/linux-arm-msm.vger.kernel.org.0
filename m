Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A688C144CFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 09:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgAVILE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 03:11:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38235 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgAVILE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 03:11:04 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so6117441wmc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 00:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yzwUgPfTsZjNhbzkAMeFUhcszle/0vrYiw5ZjCc0qF4=;
        b=TnzHga9S8h9Be3FoO1XWiv2DIzQOGFACQRd/yosgjSomuSRrdsUstes76PRPXV3SXa
         lPpZVH/VQVCSFumMyVuxJ+sj0AJi6QS3t1SNnynz5KV1aRgUnTiooAID1E5jY+Jr/Nco
         6J5N3+JDV6lmdl37FTwvPbcDNXDe5c5ud8XHGmniqTO1JQCteJVUMxSs/fm/0f38AEtH
         kmEscUWZa169QPhWsZBGusDalxGDNLC9SYLysnov7GYfFnakaP/bXli0ISTfKEtKOscE
         sxksTJP3Uub69bRrC8BEiwBqcIq6j/AbthaYwg6gh/KIRQP5H4FBXy/HKVALdEw1XYvi
         8S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yzwUgPfTsZjNhbzkAMeFUhcszle/0vrYiw5ZjCc0qF4=;
        b=O4YoCKySn/Q9n0ZDne94vL072X0rk1AeThEUVTPv7/uRrhsarQ4jYJobmVBAeIsKV4
         7rIsPJJ49ltK18+W32rx9gsRUNm3txCTlxQVM/iNmSmfbxrnBcue1V6lBxBEuHJEDOGl
         OzjQ0Y/XsbV2/Z+J7mNOMWPQnux6nqwvIRRM6Kd0dwWuZNXP4cVYvhRnLoo53ZH0Plb6
         wlED3wFCgfL35JZAiNhUGA/QFue+JF+k1A1AJ/DPH028E31rE949hMXp6x+/TDF2LJyL
         +O/TVeiq18LBFvk3qjBJ4uG040HcS0oQMZOv69DY+FxJQ920JMLBE+Qbyf3sHi45n1fN
         odcw==
X-Gm-Message-State: APjAAAX8/4Q8my59nnttxdx0PGhM3/YbNmCZkBDNeMk7LMtVIo0DANau
        Zlldk4APw5RfAWIXtGMbd2gzsg==
X-Google-Smtp-Source: APXvYqzzRzEr6jwcqUDFihYrTdelVgzN2tvwvMTiwlHnUIRZtbYeZLQz/sMz+0jB+J5904ICya9/MA==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr1622019wmj.100.1579680661316;
        Wed, 22 Jan 2020 00:11:01 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id o4sm56013442wrw.97.2020.01.22.00.11.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jan 2020 00:11:00 -0800 (PST)
Subject: Re: [PATCH v4 2/4] interconnect: qcom: Add OSM L3 interconnect
 provider support
To:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org,
        evgreen@chromium.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        daidavid1@codeaurora.org, saravanak@google.com,
        viresh.kumar@linaro.org
References: <20200109211215.18930-1-sibis@codeaurora.org>
 <20200109211215.18930-3-sibis@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <543ac242-236a-ead9-c2fb-4e3b47544c5b@linaro.org>
Date:   Wed, 22 Jan 2020 10:10:59 +0200
MIME-Version: 1.0
In-Reply-To: <20200109211215.18930-3-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

Thanks for working on this!

On 1/9/20 23:12, Sibi Sankar wrote:
> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
> resources of scaling L3 caches. Add a driver to handle bandwidth
> requests to OSM L3 from CPU on SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/interconnect/qcom/Kconfig  |   7 +
>  drivers/interconnect/qcom/Makefile |   2 +
>  drivers/interconnect/qcom/osm-l3.c | 267 +++++++++++++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644 drivers/interconnect/qcom/osm-l3.c
> 
> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
> index a9bbbdf7400f9..b94d28e7bf700 100644
> --- a/drivers/interconnect/qcom/Kconfig
> +++ b/drivers/interconnect/qcom/Kconfig
> @@ -14,6 +14,13 @@ config INTERCONNECT_QCOM_MSM8974
>  	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
>  	 platforms.
>  
> +config INTERCONNECT_QCOM_OSM_L3
> +	tristate "Qualcomm OSM L3 interconnect driver"
> +	depends on INTERCONNECT_QCOM || COMPILE_TEST
> +	help
> +	  Say y here to support the Operating State Manager (OSM) interconnect
> +	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
> +
>  config INTERCONNECT_QCOM_QCS404
>  	tristate "Qualcomm QCS404 interconnect driver"
>  	depends on INTERCONNECT_QCOM
> diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
> index 55ec3c5c89dbd..89fecbd1257c7 100644
> --- a/drivers/interconnect/qcom/Makefile
> +++ b/drivers/interconnect/qcom/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +icc-osm-l3-objs				:= osm-l3.o
>  qnoc-msm8974-objs			:= msm8974.o
>  qnoc-qcs404-objs			:= qcs404.o
>  qnoc-sc7180-objs			:= sc7180.o
> @@ -12,6 +13,7 @@ icc-smd-rpm-objs			:= smd-rpm.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_BCM_VOTER) += icc-bcm-voter.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8916) += qnoc-msm8916.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_MSM8974) += qnoc-msm8974.o
> +obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_QCS404) += qnoc-qcs404.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_RPMH) += icc-rpmh.o
>  obj-$(CONFIG_INTERCONNECT_QCOM_SC7180) += qnoc-sc7180.o
> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
> new file mode 100644
> index 0000000000000..7fde53c70081e
> --- /dev/null
> +++ b/drivers/interconnect/qcom/osm-l3.c
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.

You will need to update the year.

> + *
> + */
> +
> +#include <dt-bindings/interconnect/qcom,osm-l3.h>

Please move this below the other linux/ headers.

> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_platform.h>

Is this used?

> +#include <linux/platform_device.h>
> +
> +#define LUT_MAX_ENTRIES			40U
> +#define LUT_SRC				GENMASK(31, 30)
> +#define LUT_L_VAL			GENMASK(7, 0)
> +#define LUT_ROW_SIZE			32
> +#define CLK_HW_DIV			2
> +
> +/* Register offsets */
> +#define REG_ENABLE			0x0
> +#define REG_FREQ_LUT			0x110
> +#define REG_PERF_STATE			0x920
> +
> +#define OSM_L3_MAX_LINKS		1
> +#define SDM845_MAX_RSC_NODES		130

This looks fragile.

> +
> +#define to_qcom_provider(_provider) \
> +	container_of(_provider, struct qcom_osm_l3_icc_provider, provider)
> +
> +enum {
> +	SDM845_MASTER_OSM_L3_APPS = SDM845_MAX_RSC_NODES + 1,
> +	SDM845_SLAVE_OSM_L3,
> +};
> +
> +struct qcom_osm_l3_icc_provider {
> +	void __iomem *base;
> +	unsigned int max_state;
> +	unsigned long lut_tables[LUT_MAX_ENTRIES];
> +	struct icc_provider provider;
> +};
> +
> +/**
> + * struct qcom_icc_node - Qualcomm specific interconnect nodes
> + * @name: the node name used in debugfs
> + * @links: an array of nodes where we can go next while traversing
> + * @id: a unique node identifier
> + * @num_links: the total number of @links
> + * @buswidth: width of the interconnect between a node and the bus
> + */
> +struct qcom_icc_node {
> +	const char *name;
> +	u16 links[OSM_L3_MAX_LINKS];
> +	u16 id;
> +	u16 num_links;
> +	u16 buswidth;
> +};
> +
> +struct qcom_icc_desc {
> +	struct qcom_icc_node **nodes;
> +	size_t num_nodes;
> +};
> +
> +#define DEFINE_QNODE(_name, _id, _buswidth, ...)			\
> +		static struct qcom_icc_node _name = {			\
> +		.name = #_name,						\
> +		.id = _id,						\
> +		.buswidth = _buswidth,					\
> +		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
> +		.links = { __VA_ARGS__ },				\
> +	}
> +
> +DEFINE_QNODE(sdm845_osm_apps_l3, SDM845_MASTER_OSM_L3_APPS, 16, SDM845_SLAVE_OSM_L3);
> +DEFINE_QNODE(sdm845_osm_l3, SDM845_SLAVE_OSM_L3, 16);
> +
> +static struct qcom_icc_node *sdm845_osm_l3_nodes[] = {
> +	[MASTER_OSM_L3_APPS] = &sdm845_osm_apps_l3,
> +	[SLAVE_OSM_L3] = &sdm845_osm_l3,
> +};
> +
> +static struct qcom_icc_desc sdm845_icc_osm_l3 = {
> +	.nodes = sdm845_osm_l3_nodes,
> +	.num_nodes = ARRAY_SIZE(sdm845_osm_l3_nodes),
> +};
> +
> +static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct qcom_osm_l3_icc_provider *qp;
> +	struct icc_provider *provider;
> +	struct qcom_icc_node *qn;
> +	struct icc_node *n;
> +	unsigned int index;
> +	u32 agg_peak = 0;
> +	u32 agg_avg = 0;
> +	u64 rate;
> +
> +	qn = src->data;
> +	provider = src->provider;
> +	qp = to_qcom_provider(provider);
> +
> +	list_for_each_entry(n, &provider->nodes, node_list)
> +		provider->aggregate(n, 0, n->avg_bw, n->peak_bw,
> +				    &agg_avg, &agg_peak);
> +
> +	rate = max(agg_avg, agg_peak);
> +	rate = icc_units_to_bps(rate);
> +	do_div(rate, qn->buswidth);
> +
> +	for (index = 0; index < qp->max_state - 1; index++) {
> +		if (qp->lut_tables[index] >= rate)
> +			break;
> +	}
> +
> +	writel_relaxed(index, qp->base + REG_PERF_STATE);
> +
> +	return 0;
> +}
> +
> +static int qcom_osm_l3_remove(struct platform_device *pdev)
> +{
> +	struct qcom_osm_l3_icc_provider *qp = platform_get_drvdata(pdev);
> +
> +	icc_nodes_remove(&qp->provider);
> +	return icc_provider_del(&qp->provider);
> +}
> +
> +static int qcom_osm_l3_probe(struct platform_device *pdev)
> +{
> +	u32 info, src, lval, i, prev_freq = 0, freq;
> +	static unsigned long hw_rate, xo_rate;
> +	struct qcom_osm_l3_icc_provider *qp;
> +	const struct qcom_icc_desc *desc;
> +	struct icc_onecell_data *data;
> +	struct icc_provider *provider;
> +	struct qcom_icc_node **qnodes;
> +	struct icc_node *node;
> +	size_t num_nodes;
> +	struct clk *clk;
> +	int ret;
> +
> +	clk = clk_get(&pdev->dev, "xo");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	xo_rate = clk_get_rate(clk);
> +	clk_put(clk);
> +
> +	clk = clk_get(&pdev->dev, "alternate");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	hw_rate = clk_get_rate(clk) / CLK_HW_DIV;
> +	clk_put(clk);
> +
> +	qp = devm_kzalloc(&pdev->dev, sizeof(*qp), GFP_KERNEL);
> +	if (!qp)
> +		return -ENOMEM;
> +
> +	qp->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(qp->base))
> +		return PTR_ERR(qp->base);
> +
> +	/* HW should be in enabled state to proceed */
> +	if (!(readl_relaxed(qp->base + REG_ENABLE) & 0x1)) {
> +		dev_err(&pdev->dev, "error hardware not enabled\n");
> +		return -ENODEV;
> +	}
> +
> +	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
> +		info = readl_relaxed(qp->base + REG_FREQ_LUT +
> +				     i * LUT_ROW_SIZE);
> +		src = FIELD_GET(LUT_SRC, info);
> +		lval = FIELD_GET(LUT_L_VAL, info);
> +		if (src)
> +			freq = xo_rate * lval;
> +		else
> +			freq = hw_rate;
> +
> +		/* Two of the same frequencies signify end of table */
> +		if (i > 0 && prev_freq == freq)
> +			break;
> +
> +		dev_dbg(&pdev->dev, "index=%d freq=%d\n", i, freq);
> +
> +		qp->lut_tables[i] = freq;
> +		prev_freq = freq;
> +	}
> +	qp->max_state = i;
> +
> +	desc = of_device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	qnodes = desc->nodes;
> +	num_nodes = desc->num_nodes;
> +
> +	data = devm_kcalloc(&pdev->dev, num_nodes, sizeof(*node), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	provider = &qp->provider;
> +	provider->dev = &pdev->dev;
> +	provider->set = qcom_icc_set;
> +	provider->aggregate = icc_std_aggregate;
> +	provider->xlate = of_icc_xlate_onecell;
> +	INIT_LIST_HEAD(&provider->nodes);
> +	provider->data = data;
> +
> +	ret = icc_provider_add(provider);
> +	if (ret) {
> +		dev_err(&pdev->dev, "error adding interconnect provider\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < num_nodes; i++) {
> +		size_t j;
> +
> +		node = icc_node_create(qnodes[i]->id);
> +		if (IS_ERR(node)) {
> +			ret = PTR_ERR(node);
> +			goto err;
> +		}
> +
> +		node->name = qnodes[i]->name;
> +		node->data = qnodes[i];
> +		icc_node_add(node, provider);
> +
> +		dev_dbg(&pdev->dev, "registered node %p %s %d\n", node,
> +			qnodes[i]->name, node->id);

Not sure how useful is this, but maybe it would be more appropriate to move it
to the framework instead of duplicating it in all the drivers. Please remove it.

> +
> +		for (j = 0; j < qnodes[i]->num_links; j++)
> +			icc_link_create(node, qnodes[i]->links[j]);
> +
> +		data->nodes[i] = node;
> +	}
> +	data->num_nodes = num_nodes;
> +
> +	platform_set_drvdata(pdev, qp);
> +
> +	return ret;

Just return 0.

> +err:
> +	qcom_osm_l3_remove(pdev);

I am afraid that this will not work. This function is using
platform_get_drvdata(), but the data is set after all the nodes
and links are created.

> +	return ret;
> +}
> +
> +static const struct of_device_id osm_l3_of_match[] = {
> +	{ .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_icc_osm_l3 },
> +	{ },

The comma is not needed.

> +};
> +MODULE_DEVICE_TABLE(of, osm_l3_of_match);
> +
> +static struct platform_driver osm_l3_driver = {
> +	.probe = qcom_osm_l3_probe,
> +	.remove = qcom_osm_l3_remove,
> +	.driver = {
> +		.name = "osm-l3",
> +		.of_match_table = osm_l3_of_match,
> +	},
> +};
> +module_platform_driver(osm_l3_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm OSM L3 interconnect driver");
> +MODULE_LICENSE("GPL v2");
> 

Thanks,
Georgi
