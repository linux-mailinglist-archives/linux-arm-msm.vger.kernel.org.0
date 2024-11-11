Return-Path: <linux-arm-msm+bounces-37468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AD9C3F82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 14:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01567B23403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 13:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E562519D091;
	Mon, 11 Nov 2024 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hSb82/h6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF719CC3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731331444; cv=none; b=OoJZ52Skl4gbrvaFQMZlT52eE9+XbWXAa8BYUwnLW9PUxF/teZzu+jzbyOFszvvUhwV8WzA7uSBiTVgybFGqEjsFofKJwVTLp2roenA8sSpMyzmDR6SRmW6O7A56aesL8D6Nung16hBPvIWQp9iVC7m3s8ztL1h7sxxNdp/UNeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731331444; c=relaxed/simple;
	bh=BoaoeqbeyUOvn7WP73a6KOdu1YB919JFAjykLls4wsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjOpLF/pB4C0JvnVtMWQ2u9EBVJ+5ctL6f6O+clxTESOKY8aLOMk/BZ5pRaVZj+NOEdSLAkLNZ2c8tOjktiVi36wDzyJjleApLyPf5GT/123sSQP5GOfVC6tc9/U+e5J1s/fupGAoK/AMZ8hJfdFixaXIInje88+U39DqVBZqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hSb82/h6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539e63c8678so5188259e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 05:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731331441; x=1731936241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F0ZCNI6kl5teAZQUYaSc9mohJZaUhda3kkpGw2GKN4I=;
        b=hSb82/h6YKUJm5tW8xjCeH7eXbOBpFk/MscJy2bfK7Qzu/zph6FP184Hqj+Lc96IkP
         ho0T6+zdMrh402lZFLWfN/WQ1b+gn8I7SruoO42QQRbQhz1Rgd5dSIkc9dtqnJgPpQW+
         +QeFq7rwOvX4q82MlM55aa98CfmuuhTATt6RSxJ2Xp5pHM7sIk+U1xeiX6KF7YGXGcNJ
         LJA72+nWzvJh4a6YbqeL3hZCndbfYMALuU92Daz3Ao81uFD9kYikhAMX4JgiJcKdyHmU
         HgpV4DFsRpp5eMu+Tku6sTNZeo68XOAVOy2E2XZec6Cn8pxoxmcmrlhTOa8AzTg8+EpZ
         Sl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331441; x=1731936241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0ZCNI6kl5teAZQUYaSc9mohJZaUhda3kkpGw2GKN4I=;
        b=B8Ic/ZsTZDUs36SVLA52jtOt88TKgaG7GWQNQZk+u7dhxVIpRvJiRaxMEajTaXXIZW
         gtvm7nfP4dbNZoze/I8A8rSaKhAuMNU6ng//OLVNiMlGYOrzhzUGzS2Ug8lNkmhzeIvA
         6E7v5jBQXiHaFmcxAdF+Sk1uBSPFrB+gVsX57nzPzZU1Fgu2eAi5Vxwrd5PF1xFAtEx7
         boYSTske1vb9QkOnJj1deTlQGIeP9Ipq//9L6p/LHPbuTu0CiqOiVB6xBgqeyrNwhvPl
         9usou1vx0LJoCiG/OB8TZ5b2hdM+aURvZrUUsspu4l8TDMwgMg/ecl9IIHQuKVPX2qjJ
         ve8g==
X-Forwarded-Encrypted: i=1; AJvYcCVX/Q+tgo3z2v2tVEc2UYtQpYw8T7W0+dQDvN4f07VmD7c278TLFQgnY+Jf5GYk+rbnsK821uLySw2y2a32@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8EBygB1xd1NsCcqVyF5hgkzem/EDPpNl17WUuCGG/RRAfd2z/
	IND6YFpbBCW1aDZvt9sEr4jQ5dyVWv3sEmSMZqvohzScUGI1rhIaOp7DxpC6EXU=
X-Google-Smtp-Source: AGHT+IEEe4ztIRfiB6EUQYXFBNvUI4O8N31vnPja5ApAW0YMJ1wZbYBdh7X/Djlst1W6GjxNtU+asg==
X-Received: by 2002:a05:6512:1395:b0:539:959e:f0e8 with SMTP id 2adb3069b0e04-53d862d3f7dmr6211967e87.21.1731331440852;
        Mon, 11 Nov 2024 05:24:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9c37sm1558052e87.181.2024.11.11.05.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 05:23:59 -0800 (PST)
Date: Mon, 11 Nov 2024 15:23:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] interconnect: qcom: Add EPSS L3 support on SA8775P
Message-ID: <s2b7dzjcwp3yasgmtj5pbzu3l6yvd2vo3cp2a4nm6evpdnyjjl@kcb4zuqmfjix>
References: <20241110123825.28783-1-quic_rlaggysh@quicinc.com>
 <20241110123825.28783-4-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241110123825.28783-4-quic_rlaggysh@quicinc.com>

On Sun, Nov 10, 2024 at 12:38:25PM +0000, Raviteja Laggyshetty wrote:
> Add Epoch Subsystem (EPSS) L3 interconnect provider support on
> SA8775P SoCs.
> 
> The EPSS instance in SA8775P uses PERF_STATE register instead of
> REG_L3_VOTE to scale L3 clocks. Add new generic compatible
> "qcom,epss-l3-perf" for PERF_STATE register based L3 scaling.

The patch does more than just ading a generic compatible. Please split
it into two parts. One adding a compat string, another one adding
support for multiple devices.

> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/osm-l3.c | 87 ++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/osm-l3.c b/drivers/interconnect/qcom/osm-l3.c
> index 6a656ed44d49..285afaa1f61e 100644
> --- a/drivers/interconnect/qcom/osm-l3.c
> +++ b/drivers/interconnect/qcom/osm-l3.c
> @@ -1,16 +1,19 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/args.h>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/idr.h>
>  #include <linux/interconnect-provider.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -34,9 +37,14 @@
>  
>  #define OSM_L3_MAX_LINKS		1
>  
> +#define OSM_L3_NODE_ID_START		10000
> +#define OSM_NODE_NAME_SUFFIX_SIZE	10
> +
>  #define to_osm_l3_provider(_provider) \
>  	container_of(_provider, struct qcom_osm_l3_icc_provider, provider)
>  
> +static DEFINE_IDA(osm_l3_id);
> +
>  struct qcom_osm_l3_icc_provider {
>  	void __iomem *base;
>  	unsigned int max_state;
> @@ -55,46 +63,40 @@ struct qcom_osm_l3_icc_provider {
>   */
>  struct qcom_osm_l3_node {
>  	const char *name;
> -	u16 links[OSM_L3_MAX_LINKS];
> +	const char *links[OSM_L3_MAX_LINKS];
>  	u16 id;
>  	u16 num_links;
>  	u16 buswidth;
>  };
>  
>  struct qcom_osm_l3_desc {
> -	const struct qcom_osm_l3_node * const *nodes;
> +	struct qcom_osm_l3_node * const *nodes;
>  	size_t num_nodes;
>  	unsigned int lut_row_size;
>  	unsigned int reg_freq_lut;
>  	unsigned int reg_perf_state;
>  };
>  
> -enum {
> -	OSM_L3_MASTER_NODE = 10000,
> -	OSM_L3_SLAVE_NODE,
> -};
> -
> -#define DEFINE_QNODE(_name, _id, _buswidth, ...)			\
> -	static const struct qcom_osm_l3_node _name = {			\
> +#define DEFINE_QNODE(_name, _buswidth, ...)				\
> +	static struct qcom_osm_l3_node _name = {			\
>  		.name = #_name,						\
> -		.id = _id,						\
>  		.buswidth = _buswidth,					\
>  		.num_links = COUNT_ARGS(__VA_ARGS__),			\
> -		.links = { __VA_ARGS__ },				\
> +		__VA_OPT__(.links = { #__VA_ARGS__ })			\
>  	}
>  
> -DEFINE_QNODE(osm_l3_master, OSM_L3_MASTER_NODE, 16, OSM_L3_SLAVE_NODE);
> -DEFINE_QNODE(osm_l3_slave, OSM_L3_SLAVE_NODE, 16);
> +DEFINE_QNODE(osm_l3_master, 16, osm_l3_slave);
> +DEFINE_QNODE(osm_l3_slave, 16);
>  
> -static const struct qcom_osm_l3_node * const osm_l3_nodes[] = {
> +static struct qcom_osm_l3_node * const osm_l3_nodes[] = {
>  	[MASTER_OSM_L3_APPS] = &osm_l3_master,
>  	[SLAVE_OSM_L3] = &osm_l3_slave,
>  };
>  
> -DEFINE_QNODE(epss_l3_master, OSM_L3_MASTER_NODE, 32, OSM_L3_SLAVE_NODE);
> -DEFINE_QNODE(epss_l3_slave, OSM_L3_SLAVE_NODE, 32);
> +DEFINE_QNODE(epss_l3_master, 32, epss_l3_slave);
> +DEFINE_QNODE(epss_l3_slave, 32);
>  
> -static const struct qcom_osm_l3_node * const epss_l3_nodes[] = {
> +static struct qcom_osm_l3_node * const epss_l3_nodes[] = {
>  	[MASTER_EPSS_L3_APPS] = &epss_l3_master,
>  	[SLAVE_EPSS_L3_SHARED] = &epss_l3_slave,
>  };
> @@ -123,6 +125,19 @@ static const struct qcom_osm_l3_desc epss_l3_l3_vote = {
>  	.reg_perf_state = EPSS_REG_L3_VOTE,
>  };
>  
> +static u16 get_node_id_by_name(const char *node_name,
> +			       const struct qcom_osm_l3_desc *desc)
> +{
> +	struct qcom_osm_l3_node *const *nodes = desc->nodes;
> +	int i;
> +
> +	for (i = 0; i < desc->num_nodes; i++) {
> +		if (!strcmp(nodes[i]->name, node_name))
> +			return nodes[i]->id;
> +	}
> +	return 0;
> +}
> +
>  static int qcom_osm_l3_set(struct icc_node *src, struct icc_node *dst)
>  {
>  	struct qcom_osm_l3_icc_provider *qp;
> @@ -164,10 +179,11 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>  	const struct qcom_osm_l3_desc *desc;
>  	struct icc_onecell_data *data;
>  	struct icc_provider *provider;
> -	const struct qcom_osm_l3_node * const *qnodes;
> +	struct qcom_osm_l3_node * const *qnodes;
>  	struct icc_node *node;
>  	size_t num_nodes;
>  	struct clk *clk;
> +	u64 addr;
>  	int ret;
>  
>  	clk = clk_get(&pdev->dev, "xo");
> @@ -188,6 +204,10 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>  	if (!qp)
>  		return -ENOMEM;
>  
> +	ret = of_property_read_reg(pdev->dev.of_node, 0, &addr, NULL);
> +	if (ret)
> +		return ret;
> +
>  	qp->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(qp->base))
>  		return PTR_ERR(qp->base);
> @@ -242,8 +262,13 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>  
>  	icc_provider_init(provider);
>  
> +	/* Allocate unique id for qnodes */
> +	for (i = 0; i < num_nodes; i++)
> +		qnodes[i]->id = ida_alloc_min(&osm_l3_id, OSM_L3_NODE_ID_START, GFP_KERNEL);
> +
>  	for (i = 0; i < num_nodes; i++) {
> -		size_t j;
> +		char *node_name;
> +		size_t j, len;
>  
>  		node = icc_node_create(qnodes[i]->id);
>  		if (IS_ERR(node)) {
> @@ -251,13 +276,29 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>  			goto err;
>  		}
>  
> -		node->name = qnodes[i]->name;
> +		/* len = strlen(node->name) + @ + 8 (base-address) + NULL */
> +		len = strlen(qnodes[i]->name) + OSM_NODE_NAME_SUFFIX_SIZE;
> +		node_name = devm_kzalloc(&pdev->dev, len, GFP_KERNEL);
> +		if (!node_name) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +
> +		snprintf(node_name, len, "%s@%08llx", qnodes[i]->name, addr);
> +		node->name = node_name;
> +
>  		/* Cast away const and add it back in qcom_osm_l3_set() */
>  		node->data = (void *)qnodes[i];
>  		icc_node_add(node, provider);
>  
> -		for (j = 0; j < qnodes[i]->num_links; j++)
> -			icc_link_create(node, qnodes[i]->links[j]);
> +		for (j = 0; j < qnodes[i]->num_links; j++) {
> +			u16 link_node_id = get_node_id_by_name(qnodes[i]->links[j], desc);
> +
> +			if (link_node_id)
> +				icc_link_create(node, link_node_id);
> +			else
> +				goto err;
> +		}
>  
>  		data->nodes[i] = node;
>  	}
> @@ -277,6 +318,7 @@ static int qcom_osm_l3_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id osm_l3_of_match[] = {
>  	{ .compatible = "qcom,epss-l3", .data = &epss_l3_l3_vote },
> +	{ .compatible = "qcom,epss-l3-perf", .data = &epss_l3_perf_state },
>  	{ .compatible = "qcom,osm-l3", .data = &osm_l3 },
>  	{ .compatible = "qcom,sc7180-osm-l3", .data = &osm_l3 },
>  	{ .compatible = "qcom,sc7280-epss-l3", .data = &epss_l3_perf_state },
> @@ -284,6 +326,7 @@ static const struct of_device_id osm_l3_of_match[] = {
>  	{ .compatible = "qcom,sm8150-osm-l3", .data = &osm_l3 },
>  	{ .compatible = "qcom,sc8180x-osm-l3", .data = &osm_l3 },
>  	{ .compatible = "qcom,sm8250-epss-l3", .data = &epss_l3_perf_state },
> +	{ .compatible = "qcom,sa8775p-epss-l3", .data = &epss_l3_perf_state },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, osm_l3_of_match);
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry

