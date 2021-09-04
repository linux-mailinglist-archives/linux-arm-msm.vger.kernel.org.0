Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6258E400B19
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 13:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351478AbhIDLGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Sep 2021 07:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351479AbhIDLGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Sep 2021 07:06:03 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D77EEC061575
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Sep 2021 04:05:01 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F371A1F630;
        Sat,  4 Sep 2021 13:04:59 +0200 (CEST)
Date:   Sat, 4 Sep 2021 13:04:58 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 01/11] interconnect: icc-rpm: move bus clocks handling
 into qnoc_probe
Message-ID: <20210904110458.zg5c4cub3ixmozmx@Marijn-Arch-PC.localdomain>
References: <20210903232421.1384199-1-dmitry.baryshkov@linaro.org>
 <20210903232421.1384199-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903232421.1384199-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-04 02:24:11, Dmitry Baryshkov wrote:
> All icc-rpm drivers use the same set of bus clocks. Move handling of bus
> clocks to qnoc_probe. This both simplifies the code and allows using
> qnoc_probe as device's probe funcion.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/interconnect/qcom/icc-rpm.c | 22 ++++++++++++++--------
>  drivers/interconnect/qcom/icc-rpm.h |  5 ++---
>  drivers/interconnect/qcom/msm8916.c | 13 +------------
>  drivers/interconnect/qcom/msm8939.c | 13 +------------
>  drivers/interconnect/qcom/qcs404.c  | 13 +------------
>  5 files changed, 19 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index 54de49ca7808..394f515cc88d 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -86,8 +86,11 @@ static int qcom_icc_set(struct icc_node *src, struct icc_node *dst)
>  	return 0;
>  }
>  
> -int qnoc_probe(struct platform_device *pdev, size_t cd_size, int cd_num,
> -	       const struct clk_bulk_data *cd)
> +static const char * const bus_clocks[] = {
> +	"bus", "bus_a",
> +};
> +
> +int qnoc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct qcom_icc_desc *desc;
> @@ -97,6 +100,8 @@ int qnoc_probe(struct platform_device *pdev, size_t cd_size, int cd_num,
>  	struct qcom_icc_provider *qp;
>  	struct icc_node *node;
>  	size_t num_nodes, i;
> +	const char * const * cds;

Pointers are right-aligned, this should be:

	const char * const *cds;

> +	int cd_num;
>  	int ret;
>  
>  	/* wait for the RPM proxy */
> @@ -110,7 +115,10 @@ int qnoc_probe(struct platform_device *pdev, size_t cd_size, int cd_num,
>  	qnodes = desc->nodes;
>  	num_nodes = desc->num_nodes;
>  
> -	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
> +	cds = bus_clocks;
> +	cd_num = ARRAY_SIZE(bus_clocks);
> +
> +	qp = devm_kzalloc(dev, struct_size(qp, bus_clks, cd_num), GFP_KERNEL);
>  	if (!qp)
>  		return -ENOMEM;
>  
> @@ -119,12 +127,10 @@ int qnoc_probe(struct platform_device *pdev, size_t cd_size, int cd_num,
>  	if (!data)
>  		return -ENOMEM;
>  
> -	qp->bus_clks = devm_kmemdup(dev, cd, cd_size,
> -				    GFP_KERNEL);
> -	if (!qp->bus_clks)
> -		return -ENOMEM;
> -
> +	for (i = 0; i < cd_num; i++)
> +		qp->bus_clks[i].id = cds[i];
>  	qp->num_clks = cd_num;
> +
>  	ret = devm_clk_bulk_get(dev, qp->num_clks, qp->bus_clks);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
> index 79a6f68249c1..f4b05c20c097 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -22,8 +22,8 @@
>   */
>  struct qcom_icc_provider {
>  	struct icc_provider provider;
> -	struct clk_bulk_data *bus_clks;
>  	int num_clks;
> +	struct clk_bulk_data bus_clks[];
>  };
>  
>  /**
> @@ -66,8 +66,7 @@ struct qcom_icc_desc {
>  	}
>  
>  
> -int qnoc_probe(struct platform_device *pdev, size_t cd_size, int cd_num,
> -	       const struct clk_bulk_data *cd);
> +int qnoc_probe(struct platform_device *pdev);
>  int qnoc_remove(struct platform_device *pdev);
>  
>  #endif
> diff --git a/drivers/interconnect/qcom/msm8916.c b/drivers/interconnect/qcom/msm8916.c
> index fc3689c8947a..fc0d48d2997a 100644
> --- a/drivers/interconnect/qcom/msm8916.c
> +++ b/drivers/interconnect/qcom/msm8916.c
> @@ -105,11 +105,6 @@ enum {
>  	MSM8916_SNOC_PNOC_SLV,
>  };
>  
> -static const struct clk_bulk_data msm8916_bus_clocks[] = {
> -	{ .id = "bus" },
> -	{ .id = "bus_a" },
> -};
> -
>  DEFINE_QNODE(bimc_snoc_mas, MSM8916_BIMC_SNOC_MAS, 8, -1, -1, MSM8916_BIMC_SNOC_SLV);
>  DEFINE_QNODE(bimc_snoc_slv, MSM8916_BIMC_SNOC_SLV, 8, -1, -1, MSM8916_SNOC_INT_0, MSM8916_SNOC_INT_1);
>  DEFINE_QNODE(mas_apss, MSM8916_MASTER_AMPSS_M0, 8, -1, -1, MSM8916_SLAVE_EBI_CH0, MSM8916_BIMC_SNOC_MAS, MSM8916_SLAVE_AMPSS_L2);
> @@ -305,12 +300,6 @@ static struct qcom_icc_desc msm8916_pcnoc = {
>  	.num_nodes = ARRAY_SIZE(msm8916_pcnoc_nodes),
>  };
>  
> -static int msm8916_qnoc_probe(struct platform_device *pdev)
> -{
> -	return qnoc_probe(pdev, sizeof(msm8916_bus_clocks),
> -			  ARRAY_SIZE(msm8916_bus_clocks), msm8916_bus_clocks);
> -}
> -
>  static const struct of_device_id msm8916_noc_of_match[] = {
>  	{ .compatible = "qcom,msm8916-bimc", .data = &msm8916_bimc },
>  	{ .compatible = "qcom,msm8916-pcnoc", .data = &msm8916_pcnoc },
> @@ -320,7 +309,7 @@ static const struct of_device_id msm8916_noc_of_match[] = {
>  MODULE_DEVICE_TABLE(of, msm8916_noc_of_match);
>  
>  static struct platform_driver msm8916_noc_driver = {
> -	.probe = msm8916_qnoc_probe,
> +	.probe = qnoc_probe,
>  	.remove = qnoc_remove,
>  	.driver = {
>  		.name = "qnoc-msm8916",
> diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
> index 20f31a1b4192..4a5a2ec64960 100644
> --- a/drivers/interconnect/qcom/msm8939.c
> +++ b/drivers/interconnect/qcom/msm8939.c
> @@ -110,11 +110,6 @@ enum {
>  	MSM8939_SNOC_PNOC_SLV,
>  };
>  
> -static const struct clk_bulk_data msm8939_bus_clocks[] = {
> -	{ .id = "bus" },
> -	{ .id = "bus_a" },
> -};
> -
>  DEFINE_QNODE(bimc_snoc_mas, MSM8939_BIMC_SNOC_MAS, 8, -1, -1, MSM8939_BIMC_SNOC_SLV);
>  DEFINE_QNODE(bimc_snoc_slv, MSM8939_BIMC_SNOC_SLV, 16, -1, 2, MSM8939_SNOC_INT_0, MSM8939_SNOC_INT_1);
>  DEFINE_QNODE(mas_apss, MSM8939_MASTER_AMPSS_M0, 16, -1, -1, MSM8939_SLAVE_EBI_CH0, MSM8939_BIMC_SNOC_MAS, MSM8939_SLAVE_AMPSS_L2);
> @@ -326,12 +321,6 @@ static struct qcom_icc_desc msm8939_pcnoc = {
>  	.num_nodes = ARRAY_SIZE(msm8939_pcnoc_nodes),
>  };
>  
> -static int msm8939_qnoc_probe(struct platform_device *pdev)
> -{
> -	return qnoc_probe(pdev, sizeof(msm8939_bus_clocks),
> -			  ARRAY_SIZE(msm8939_bus_clocks), msm8939_bus_clocks);
> -}
> -
>  static const struct of_device_id msm8939_noc_of_match[] = {
>  	{ .compatible = "qcom,msm8939-bimc", .data = &msm8939_bimc },
>  	{ .compatible = "qcom,msm8939-pcnoc", .data = &msm8939_pcnoc },
> @@ -342,7 +331,7 @@ static const struct of_device_id msm8939_noc_of_match[] = {
>  MODULE_DEVICE_TABLE(of, msm8939_noc_of_match);
>  
>  static struct platform_driver msm8939_noc_driver = {
> -	.probe = msm8939_qnoc_probe,
> +	.probe = qnoc_probe,
>  	.remove = qnoc_remove,
>  	.driver = {
>  		.name = "qnoc-msm8939",
> diff --git a/drivers/interconnect/qcom/qcs404.c b/drivers/interconnect/qcom/qcs404.c
> index 36a7e30a00be..0f2fff230b13 100644
> --- a/drivers/interconnect/qcom/qcs404.c
> +++ b/drivers/interconnect/qcom/qcs404.c
> @@ -92,11 +92,6 @@ enum {
>  	QCS404_SLAVE_LPASS,
>  };
>  
> -static const struct clk_bulk_data qcs404_bus_clocks[] = {
> -	{ .id = "bus" },
> -	{ .id = "bus_a" },
> -};
> -
>  DEFINE_QNODE(mas_apps_proc, QCS404_MASTER_AMPSS_M0, 8, 0, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
>  DEFINE_QNODE(mas_oxili, QCS404_MASTER_GRAPHICS_3D, 8, -1, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
>  DEFINE_QNODE(mas_mdp, QCS404_MASTER_MDP_PORT0, 8, -1, -1, QCS404_SLAVE_EBI_CH0, QCS404_BIMC_SNOC_SLV);
> @@ -269,12 +264,6 @@ static struct qcom_icc_desc qcs404_snoc = {
>  };
>  
>  
> -static int qcs404_qnoc_probe(struct platform_device *pdev)
> -{
> -	return qnoc_probe(pdev, sizeof(qcs404_bus_clocks),
> -			  ARRAY_SIZE(qcs404_bus_clocks), qcs404_bus_clocks);
> -}
> -
>  static const struct of_device_id qcs404_noc_of_match[] = {
>  	{ .compatible = "qcom,qcs404-bimc", .data = &qcs404_bimc },
>  	{ .compatible = "qcom,qcs404-pcnoc", .data = &qcs404_pcnoc },
> @@ -284,7 +273,7 @@ static const struct of_device_id qcs404_noc_of_match[] = {
>  MODULE_DEVICE_TABLE(of, qcs404_noc_of_match);
>  
>  static struct platform_driver qcs404_noc_driver = {
> -	.probe = qcs404_qnoc_probe,
> +	.probe = qnoc_probe,
>  	.remove = qnoc_remove,
>  	.driver = {
>  		.name = "qnoc-qcs404",
