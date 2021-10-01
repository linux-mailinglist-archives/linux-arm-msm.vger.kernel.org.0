Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4D541F40F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239124AbhJAR7f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:59:35 -0400
Received: from mga11.intel.com ([192.55.52.93]:29105 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238784AbhJAR7e (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:59:34 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="222315899"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="222315899"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 10:57:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; 
   d="scan'208";a="540435721"
Received: from pwhela2-mobl1.ger.corp.intel.com (HELO [10.213.160.166]) ([10.213.160.166])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 10:57:48 -0700
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2b6a9c7-2191-4bc9-b03b-3b22b495a4be@linux.intel.com>
Date:   Fri, 1 Oct 2021 12:57:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


> @@ -610,6 +611,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>  	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>  
> +	if (ctrl->swrm_hctl_reg) {
> +		val = ioread32(ctrl->swrm_hctl_reg);
> +		val &= 0xFFFFFFFD;

magic value, use a #define MASK_SOMETHING?

> +		iowrite32(val, ctrl->swrm_hctl_reg);
> +	}
> +
>  	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>  
>  	/* Enable Auto enumeration */
> @@ -1200,7 +1207,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	struct qcom_swrm_ctrl *ctrl;
>  	const struct qcom_swrm_data *data;
>  	int ret;
> -	u32 val;
> +	int val, swrm_hctl_reg = 0;
>  
>  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>  	if (!ctrl)
> @@ -1251,6 +1258,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>  	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>  
> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg))
> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);

if (!ctrl->swrm_hctl_reg)
    return -ENODEV;

?

> +
>  	ret = qcom_swrm_get_port_config(ctrl);
>  	if (ret)
>  		goto err_clk;
> 
