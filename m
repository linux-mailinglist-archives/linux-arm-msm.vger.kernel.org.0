Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3B786827
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 19:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404276AbfHHRhA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 13:37:00 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35366 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404079AbfHHRhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 13:37:00 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E3BE2604D4; Thu,  8 Aug 2019 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565285817;
        bh=28QdtB8S/+9ROA5E3hFE2ASjoIfQzNyjf2nP+ZFSzG0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n2lyCESlEb7yiFr4xZg+/LY+xpXvvInhSl0JfR7xntC4F7eOzOdxM2Ov/MAdw9QdN
         zoLwNl42btuJDXxUNpblRdupzvhL91synA+TgEsgn2Np24Z4P3p24y+NvQp+x3d0Zy
         mhWfCNZcMYR8LC9m4IPm/BjtivsP6erB3yZLWH4c=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.43.230] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50BD3602BC;
        Thu,  8 Aug 2019 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565285816;
        bh=28QdtB8S/+9ROA5E3hFE2ASjoIfQzNyjf2nP+ZFSzG0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CHrAdfMxvYzmwA1Enuq3waRKmS1pePnJRXotbNqmzrSLVO0yeLj2oT/zpnA0v3B0C
         hwISW7HXwEiOVKoEsqKgVjUtVAmJmp8+eX/+zAHhGz3c+nKLLvjXAseY0HRI6duGlb
         3ekSNSOjT7DP2pcP5dIFl+sHGwhkE6o7RajtLX4A=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 50BD3602BC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
Subject: Re: [PATCH 2/2] interconnect: qcom: Add OSM L3 interconnect provider
 support
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Evan Green <evgreen@chromium.org>,
        David Dai <daidavid1@codeaurora.org>
References: <20190807112432.26521-1-sibis@codeaurora.org>
 <20190807112432.26521-3-sibis@codeaurora.org>
 <CAGETcx8JgigJpRgjXsG+xChLUPrASRO7BapkYaSrvvTdQKfEuQ@mail.gmail.com>
From:   Sibi Sankar <sibis@codeaurora.org>
Message-ID: <9ea6ab4c-6357-653b-f91c-9b649205f0ab@codeaurora.org>
Date:   Thu, 8 Aug 2019 23:06:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAGETcx8JgigJpRgjXsG+xChLUPrASRO7BapkYaSrvvTdQKfEuQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Saravana,

Thanks for the review!

On 8/8/19 2:51 AM, Saravana Kannan wrote:
> On Wed, Aug 7, 2019 at 4:24 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>>
>> On some Qualcomm SoCs, Operating State Manager (OSM) controls the
>> resources of scaling L3 caches. Add a driver to handle bandwidth
>> requests to OSM L3 from CPU/GPU.
>>
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |   7 +
>>   drivers/interconnect/qcom/Makefile |   2 +
>>   drivers/interconnect/qcom/osm-l3.c | 292 +++++++++++++++++++++++++++++
>>   3 files changed, 301 insertions(+)
>>   create mode 100644 drivers/interconnect/qcom/osm-l3.c
>>
>> diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
>> index d5e70ebc24108..f6c2a11a1a2c9 100644
>> --- a/drivers/interconnect/qcom/Kconfig
>> +++ b/drivers/interconnect/qcom/Kconfig
>> @@ -5,6 +5,13 @@ config INTERCONNECT_QCOM
>>          help
>>            Support for Qualcomm's Network-on-Chip interconnect hardware.
>>
>> +config INTERCONNECT_QCOM_OSM_L3
>> +       tristate "Qualcomm OSM L3 interconnect driver"
>> +       depends on INTERCONNECT_QCOM || COMPILE_TEST
>> +       help
>> +         Say y here to support the Operating State Manager (OSM) interconnect
>> +         driver which controls the scaling of L3 caches on Qualcomm SoCs.
>> +
>>   config INTERCONNECT_QCOM_SDM845
>>          tristate "Qualcomm SDM845 interconnect driver"
>>          depends on INTERCONNECT_QCOM
>> diff --git a/drivers/interconnect/qcom/Makefile b/drivers/interconnect/qcom/Makefile
>> index 1c1cea690f922..9078af5fed109 100644
>> --- a/drivers/interconnect/qcom/Makefile
>> +++ b/drivers/interconnect/qcom/Makefile
>> @@ -1,5 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>
>> +icc-osm-l3-objs                                := osm-l3.o
>>   qnoc-sdm845-objs                       := sdm845.o
>>
>> +obj-$(CONFIG_INTERCONNECT_QCOM_OSM_L3) += icc-osm-l3.o
>>   obj-$(CONFIG_INTERCONNECT_QCOM_SDM845) += qnoc-sdm845.o
>> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
>> new file mode 100644
>> index 0000000000000..1e7dfce6f4f9b
>> --- /dev/null
>> +++ b/drivers/interconnect/qcom/osm-l3.c
>> @@ -0,0 +1,292 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + *
>> + */
>> +
>> +#include <dt-bindings/interconnect/qcom,osm-l3.h>
>> +#include <dt-bindings/interconnect/qcom,sdm845.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/interconnect-provider.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define LUT_MAX_ENTRIES                        40U
>> +#define LUT_SRC                                GENMASK(31, 30)
>> +#define LUT_L_VAL                      GENMASK(7, 0)
>> +#define LUT_ROW_SIZE                   32
>> +#define CLK_HW_DIV                     2
>> +
>> +/* Register offsets */
>> +#define REG_ENABLE                     0x0
>> +#define REG_FREQ_LUT                   0x110
>> +#define REG_PERF_STATE                 0x920
>> +
>> +#define OSM_L3_MAX_LINKS               1
>> +
>> +#define to_qcom_provider(_provider) \
>> +       container_of(_provider, struct qcom_icc_provider, provider)
>> +
>> +enum {
>> +       SDM845_MASTER_OSM_L3_APPS = SLAVE_TCU + 1,
>> +       SDM845_MASTER_OSM_L3_GPU,
>> +       SDM845_SLAVE_OSM_L3,
>> +};
>> +
>> +struct qcom_icc_provider {
>> +       void __iomem *base;
>> +       unsigned int max_state;
>> +       unsigned long lut_tables[LUT_MAX_ENTRIES];
>> +       struct icc_provider provider;
>> +};
>> +
>> +/**
>> + * struct qcom_icc_node - Qualcomm specific interconnect nodes
>> + * @name: the node name used in debugfs
>> + * @links: an array of nodes where we can go next while traversing
>> + * @id: a unique node identifier
>> + * @num_links: the total number of @links
>> + * @buswidth: width of the interconnect between a node and the bus
>> + */
>> +struct qcom_icc_node {
>> +       const char *name;
>> +       u16 links[OSM_L3_MAX_LINKS];
>> +       u16 id;
>> +       u16 num_links;
>> +       u16 buswidth;
>> +};
>> +
>> +struct qcom_icc_desc {
>> +       struct qcom_icc_node **nodes;
>> +       size_t num_nodes;
>> +};
>> +
>> +#define DEFINE_QNODE(_name, _id, _buswidth, ...)                       \
>> +               static struct qcom_icc_node _name = {                   \
>> +               .name = #_name,                                         \
>> +               .id = _id,                                              \
>> +               .buswidth = _buswidth,                                  \
>> +               .num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),      \
>> +               .links = { __VA_ARGS__ },                               \
>> +       }
>> +
>> +DEFINE_QNODE(osm_apps_l3, SDM845_MASTER_OSM_L3_APPS, 16, SDM845_SLAVE_OSM_L3);
>> +DEFINE_QNODE(osm_gpu_l3, SDM845_MASTER_OSM_L3_GPU, 16, SDM845_SLAVE_OSM_L3);
>> +DEFINE_QNODE(osm_l3, SDM845_SLAVE_OSM_L3, 16);
>> +
>> +static struct qcom_icc_node *sdm845_osm_l3_nodes[] = {
>> +       [MASTER_OSM_L3_APPS] = &osm_apps_l3,
>> +       [MASTER_OSM_L3_GPU] = &osm_gpu_l3,
>> +       [SLAVE_OSM_L3] = &osm_l3,
>> +};
>> +
>> +static struct qcom_icc_desc sdm845_osm_l3 = {
>> +       .nodes = sdm845_osm_l3_nodes,
>> +       .num_nodes = ARRAY_SIZE(sdm845_osm_l3_nodes),
>> +};
>> +
>> +static int qcom_icc_aggregate(struct icc_node *node, u32 avg_bw,
>> +                             u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
>> +{
>> +       *agg_avg += avg_bw;
>> +       *agg_peak = max_t(u32, *agg_peak, peak_bw);
>> +
>> +       return 0;
>> +}
>> +
>> +static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>> +{
>> +       struct icc_provider *provider;
>> +       struct qcom_icc_provider *qp;
>> +       struct qcom_icc_node *qn;
>> +       struct icc_node *n;
>> +       unsigned int index;
>> +       u32 agg_peak = 0;
>> +       u32 agg_avg = 0;
>> +       u64 rate;
>> +
>> +       qn = src->data;
>> +       provider = src->provider;
>> +       qp = to_qcom_provider(provider);
>> +
>> +       list_for_each_entry(n, &provider->nodes, node_list)
>> +               qcom_icc_aggregate(n, n->avg_bw, n->peak_bw,
>> +                                  &agg_avg, &agg_peak);
>> +
>> +       rate = max(agg_avg, agg_peak);
>> +       rate = icc_units_to_bps(rate);
>> +       do_div(rate, qn->buswidth);
>> +
>> +       for (index = 0; index < qp->max_state; index++) {
>> +               if (qp->lut_tables[index] >= rate)
>> +                       break;
>> +       }
>> +
>> +       writel_relaxed(index, qp->base + REG_PERF_STATE);
>> +
>> +       return 0;
>> +}
>> +
>> +static int qcom_osm_l3_probe(struct platform_device *pdev)
>> +{
>> +       u32 info, src, lval, i, prev_freq = 0, freq;
>> +       static unsigned long hw_rate, xo_rate;
>> +       const struct qcom_icc_desc *desc;
>> +       struct icc_onecell_data *data;
>> +       struct icc_provider *provider;
>> +       struct qcom_icc_node **qnodes;
>> +       struct qcom_icc_provider *qp;
>> +       struct icc_node *node;
>> +       size_t num_nodes;
>> +       struct clk *clk;
>> +       int ret;
>> +
>> +       clk = clk_get(&pdev->dev, "xo");
>> +       if (IS_ERR(clk))
>> +               return PTR_ERR(clk);
>> +
>> +       xo_rate = clk_get_rate(clk);
>> +       clk_put(clk);
>> +
>> +       clk = clk_get(&pdev->dev, "alternate");
>> +       if (IS_ERR(clk))
>> +               return PTR_ERR(clk);
>> +
>> +       hw_rate = clk_get_rate(clk) / CLK_HW_DIV;
>> +       clk_put(clk);
>> +
>> +       qp = devm_kzalloc(&pdev->dev, sizeof(*qp), GFP_KERNEL);
>> +       if (!qp)
>> +               return -ENOMEM;
>> +
>> +       qp->base = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(qp->base))
>> +               return PTR_ERR(qp->base);
>> +
>> +       /* HW should be in enabled state to proceed */
>> +       if (!(readl_relaxed(qp->base + REG_ENABLE) & 0x1)) {
>> +               dev_err(&pdev->dev, "error hardware not enabled\n");
>> +               return -ENODEV;
>> +       }
>> +
>> +       for (i = 0; i < LUT_MAX_ENTRIES; i++) {
>> +               info = readl_relaxed(qp->base + REG_FREQ_LUT +
>> +                                    i * LUT_ROW_SIZE);
>> +               src = FIELD_GET(LUT_SRC, info);
>> +               lval = FIELD_GET(LUT_L_VAL, info);
>> +               if (src)
>> +                       freq = xo_rate * lval;
>> +               else
>> +                       freq = hw_rate;
>> +
>> +               /*
>> +                * Two of the same frequencies with the same core counts means
>> +                * end of table
>> +                */
>> +               if (i > 0 && prev_freq == freq)
>> +                       break;
>> +
>> +               qp->lut_tables[i] = freq;
>> +               prev_freq = freq;
>> +       }
>> +       qp->max_state = i;
>> +
>> +       desc = of_device_get_match_data(&pdev->dev);
>> +       if (!desc)
>> +               return -EINVAL;
>> +
>> +       qnodes = desc->nodes;
>> +       num_nodes = desc->num_nodes;
>> +
>> +       data = devm_kcalloc(&pdev->dev, num_nodes, sizeof(*node), GFP_KERNEL);
>> +       if (!data)
>> +               return -ENOMEM;
>> +
>> +       provider = &qp->provider;
>> +       provider->dev = &pdev->dev;
>> +       provider->set = qcom_icc_set;
>> +       provider->aggregate = qcom_icc_aggregate;
>> +       provider->xlate = of_icc_xlate_onecell;
>> +       INIT_LIST_HEAD(&provider->nodes);
>> +       provider->data = data;
>> +
>> +       ret = icc_provider_add(provider);
>> +       if (ret) {
>> +               dev_err(&pdev->dev, "error adding interconnect provider\n");
>> +               return ret;
>> +       }
>> +
>> +       for (i = 0; i < num_nodes; i++) {
>> +               size_t j;
>> +
>> +               node = icc_node_create(qnodes[i]->id);
>> +               if (IS_ERR(node)) {
>> +                       ret = PTR_ERR(node);
>> +                       goto err;
>> +               }
>> +
>> +               node->name = qnodes[i]->name;
>> +               node->data = qnodes[i];
>> +               icc_node_add(node, provider);
>> +
>> +               dev_dbg(&pdev->dev, "registered node %p %s %d\n", node,
>> +                       qnodes[i]->name, node->id);
>> +
>> +               /* populate links */
>> +               for (j = 0; j < qnodes[i]->num_links; j++)
>> +                       icc_link_create(node, qnodes[i]->links[j]);
>> +
>> +               data->nodes[i] = node;
>> +       }
>> +       data->num_nodes = num_nodes;
>> +
>> +       platform_set_drvdata(pdev, qp);
>> +
>> +       return ret;
>> +err:
>> +       list_for_each_entry(node, &provider->nodes, node_list) {
>> +               icc_node_del(node);
>> +               icc_node_destroy(node->id);
>> +       }
>> +
>> +       icc_provider_del(provider);
>> +       return ret;
>> +}
>> +
>> +static int qcom_osm_l3_remove(struct platform_device *pdev)
>> +{
>> +       struct qcom_icc_provider *qp = platform_get_drvdata(pdev);
>> +       struct icc_provider *provider = &qp->provider;
>> +       struct icc_node *n;
>> +
>> +       list_for_each_entry(n, &provider->nodes, node_list) {
>> +               icc_node_del(n);
>> +               icc_node_destroy(n->id);
>> +       }
>> +
>> +       return icc_provider_del(provider);
>> +}
>> +
>> +static const struct of_device_id osm_l3_of_match[] = {
>> +       { .compatible = "qcom,sdm845-osm-l3", .data = &sdm845_osm_l3 },
>> +       { },
>> +};
>> +MODULE_DEVICE_TABLE(of, osm_l3_of_match);
>> +
>> +static struct platform_driver osm_l3_driver = {
>> +       .probe = qcom_osm_l3_probe,
>> +       .remove = qcom_osm_l3_remove,
>> +       .driver = {
>> +               .name = "osm-l3",
>> +               .of_match_table = osm_l3_of_match,
>> +       },
>> +};
>> +module_platform_driver(osm_l3_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm OSM L3 interconnect driver");
>> +MODULE_LICENSE("GPL v2");
> 
> Did a quick scan of the code and it's not clear how you connect the L3
> interconnect provider to the rest of the interconnect. I don't see any
> DT or code references to the rest of the interconnects in the system.
> If GPU is making a bandwidth request all the way to L3, how do you
> make sure the interconnects between GPU and L3 also scale up properly.

For SDM845 OSM L3 provider the icc nodes endpoints are isolated from
rsc icc node endpoints i.e GPU would need to vote on this path in
addition to voting for DDR. On future SoCs if the need to scale
interconnect between GPU rsc nodes along with the OSM l3 nodes arises,
it can be trivially extended by linking the osm icc nodes with global
icc node ids of the gpu rsc nodes.

> 
> -Saravana
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
