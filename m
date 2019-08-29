Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 670FCA1C18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 15:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfH2N5v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 09:57:51 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41748 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbfH2N5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 09:57:51 -0400
Received: by mail-pl1-f193.google.com with SMTP id m9so1609782pls.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L/fpSI4uM40s3DtKV21QFlzEvXiHzEXWBGn7ZlQCExg=;
        b=Zxlp/In8ihfnhFT7qhAH2R05a3spmau5U90iJ7hTdtkHjQZY3eF6Ow334HIBgk1z6q
         Q671PJ/FC4BFrkm6pYSDFZfRUHxZABFe+DKE4gpwyc9RLdv2odedstcl2EWH7RlzCOtG
         itlcxTQTa6o4RuvHRBTBpBB77xOyuEDEzMUAbcsvdFvWVLmSUWagjTD3Mkui+jCOIYae
         gsnuy0nwI3xIXRsx/XSyJHhmAstMlBE/BONdafIFbpmAHqBexmGYAx2cUMqKC2//hdHC
         yC9htbtyMjdoCTLIV47cBc89SgohGd4JxVY5W9LWLlN6P7i5ssCs8vrw7hY9DH+7pBNJ
         n6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L/fpSI4uM40s3DtKV21QFlzEvXiHzEXWBGn7ZlQCExg=;
        b=k75CEiBUPo9x4tovjF6CIVL1/H/XdJWlwgGX9nlkOkj2yIueQhMOrBF3M4Q/esfdEO
         zxrsZh6yLBd5XDwbQoEnQiaSj1b6s4fPqzzFMeKxqIG034dCv45TAI6xHDTVqdcP8S37
         KCq++aPcLQ/Fr6tFG758MJucQD3rt6uhgIW+SAP99AUlonwkUlxvHYtVhiRTAJRViLZj
         WVxkdfC++uBpHBNQPwEbwGFvNGKMzD7AlI8f1IOuGKtc1PKgmQkLBb6zzRgCTtbBkCOF
         /nYxqB3n3dsHPMHjBtZLKWw7UASVziPP5i/SvnNGJGDhxvwEdfn3wd3XwdrirxvOLeAc
         8+MQ==
X-Gm-Message-State: APjAAAV0ZpB+jpxvmBEARJP7MZBwUnfzQXKHM5wROyoCfbBMti8TssHn
        KIeR3n6Ztcrnwl19Pe1nMSljqw==
X-Google-Smtp-Source: APXvYqxm+AgQTYebWGBMOQFJ9WB+XGmtaCiDndt9/NWaE7skuV6+wfzm+5jNo5nLCEF9aVYHKO6mtw==
X-Received: by 2002:a17:902:a50a:: with SMTP id s10mr9999672plq.108.1567087070623;
        Thu, 29 Aug 2019 06:57:50 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b30sm7138756pfr.117.2019.08.29.06.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 06:57:50 -0700 (PDT)
Date:   Thu, 29 Aug 2019 06:59:44 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, agross@kernel.org, jassisinghbrar@gmail.com,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mbox: qcom: add APCS child device for QCS404
Message-ID: <20190829135944.GI26807@tuxbook-pro>
References: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org>
 <20190829082759.6256-2-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829082759.6256-2-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 29 Aug 01:27 PDT 2019, Jorge Ramirez-Ortiz wrote:

> There is clock controller functionality in the APCS hardware block of
> qcs404 devices similar to msm8916.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Nice, I like this version.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index 705e17a5479c..d3676fd3cf94 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -47,7 +47,6 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
>  
>  static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
>  	struct qcom_apcs_ipc *apcs;
>  	struct regmap *regmap;
>  	struct resource *res;
> @@ -55,6 +54,11 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	void __iomem *base;
>  	unsigned long i;
>  	int ret;
> +	const struct of_device_id apcs_clk_match_table[] = {
> +		{ .compatible = "qcom,msm8916-apcs-kpss-global", },
> +		{ .compatible = "qcom,qcs404-apcs-apps-global", },
> +		{}
> +	};
>  
>  	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
>  	if (!apcs)
> @@ -89,7 +93,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
> +	if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
>  		apcs->clk = platform_device_register_data(&pdev->dev,
>  							  "qcom-apcs-msm8916-clk",
>  							  -1, NULL, 0);
> -- 
> 2.22.0
> 
