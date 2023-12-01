Return-Path: <linux-arm-msm+bounces-2820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF87380038D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 07:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BAAD2814D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 06:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA276BE7E;
	Fri,  1 Dec 2023 06:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsTJTU1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D1C171F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 22:09:42 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-423c28db22eso23828221cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 22:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701410981; x=1702015781; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HTBGY1oy5xfgo0+VO2qMvDpiGe30dNnP8Di6PCzHzfE=;
        b=dsTJTU1H7LuTxSWTa5qiVwMAnija+WQse5Rh/TLZScHYLxLIeCeTn6CAPqs1ezLnkF
         r+yBjsm7YWwkS7e/fJC6+c5DktV0ZsH/Y4V4K+WDPH+U1eeNUkuSFOCqUrcxJbDJj5LD
         jOgwtt1MAqYvLwfbAezuwWQoVNhS0OC99UptHECrZ+6sWYzB7BNpKTzXM7eCLAp0JlbH
         avfY7LS0S8uI5pOta7wXtdJAQD+oUnNtITv7Ncq2f0lsAFQqw9qriunjNv3/MBrBGjSq
         gpsNFlHPhWSyrRaKJ5AOrb0ICphiYaCGsK+iROeDZrD1Q8kfUmDqFNC1u6d7Mg6FGn7H
         Pf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701410981; x=1702015781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTBGY1oy5xfgo0+VO2qMvDpiGe30dNnP8Di6PCzHzfE=;
        b=EWJRJHtHXcttZ+bV2075WYQdSmtGSejV4mqWJ8y3hwwDIY7VUg9T3FSQHh5upajYtf
         UDtclzbA1hVjwmpQq2zLwlgJ7hbuCIc7oDrFCGs+bIrQeT58oeusl79t+URImWwqPVOU
         vDK9IuClTIoJh/GS+vaalorf2T139b5N//sutYurOsbNs73n8G6PKyOz+N+gK8FhbLni
         EfjjTs9qg94Y0LnrGYr5mHuWa2dj3tjVImz1sXQNTkvIowNc5YwH7RrQVHgCiiAcPp3P
         gSy5ZTNodoAsH+x5hoGDOoYQRriRdVIIjmbcFEu4IuNzW/u4+WdMCPw5v4qxRqE58r9t
         UtXA==
X-Gm-Message-State: AOJu0YyZEuhQ7W25wB4bPmhd99kuqAj+CXvScQ+vvvVJr8lHRRYatp/R
	34fQXHd96HamSdV6Cmadd2eY
X-Google-Smtp-Source: AGHT+IGAABQDU3axNxWPqU2DPDM9Qs/mgiEnVBVMMHF0/BtCPRJ3xlxbSW8ZA0IFsoPre5Xm6XtW/g==
X-Received: by 2002:a05:622a:1b02:b0:423:a6c5:1924 with SMTP id bb2-20020a05622a1b0200b00423a6c51924mr34045005qtb.23.1701410981424;
        Thu, 30 Nov 2023 22:09:41 -0800 (PST)
Received: from thinkpad ([117.213.102.92])
        by smtp.gmail.com with ESMTPSA id h14-20020ac8568e000000b00423e6885152sm1200897qta.75.2023.11.30.22.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 22:09:40 -0800 (PST)
Date: Fri, 1 Dec 2023 11:39:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_parass@quicinc.com,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 3/3] phy: qcom-qmp-pcie: Add support for keeping
 refclk always on
Message-ID: <20231201060928.GK4009@thinkpad>
References: <20231127-refclk_always_on-v3-0-26d969fa8f1d@quicinc.com>
 <20231127-refclk_always_on-v3-3-26d969fa8f1d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127-refclk_always_on-v3-3-26d969fa8f1d@quicinc.com>

On Mon, Nov 27, 2023 at 05:43:51PM +0530, Krishna chaitanya chundru wrote:
> In PCIe low power states like L1.1 or L1.2 the phy will stop
> supplying refclk to endpoint. If endpoint asserts clkreq to bring
> back link L0, then RC needs to provide refclk to endpoint.
> 
> Some platforms with pcie switch fail to drive the clkreq signal to
> the host from the endpoints because of the switch board design.
> Due to that refclk needs to supplied to the endpoint always.
> 
> Add a flag to keep refclk always supplied to endpoint.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 7fdf9b2596b6..e95f677817f7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -43,6 +43,8 @@
>  /* QPHY_PCS_STATUS bit */
>  #define PHYSTATUS				BIT(6)
>  #define PHYSTATUS_4_20				BIT(7)
> +/* PCS_PCIE_ENDPOINT_REFCLK_CNTRL */
> +#define EPCLK_ALWAYS_ON_EN			BIT(6)
>  
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>  
> @@ -2264,6 +2266,8 @@ struct qmp_pcie {
>  	struct phy *phy;
>  	int mode;
>  
> +	bool refclk_always_on;
> +
>  	struct clk_fixed_rate pipe_clk_fixed;
>  };
>  
> @@ -3179,6 +3183,10 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
>  	qmp_pcie_configure(pcs, tbls->pcs, tbls->pcs_num);
>  	qmp_pcie_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
>  
> +	if (qmp->refclk_always_on && cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL])
> +		qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL],
> +			     EPCLK_ALWAYS_ON_EN);
> +
>  	if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
>  		qmp_pcie_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
>  		qmp_pcie_init_port_b(qmp, tbls);
> @@ -3701,6 +3709,12 @@ static int qmp_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> +	qmp->refclk_always_on = of_property_read_bool(dev->of_node, "qcom,refclk-always-on");
> +	if (qmp->refclk_always_on && !qmp->cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL]) {
> +		dev_err(dev, "refclk is always on is present but refclk cntrl offset is not present\n");

"Firmware requested to keep REFCLK always ON, but driver missing offset\n"

- Mani

> +		goto err_node_put;
> +	}
> +
>  	ret = phy_pipe_clk_register(qmp, np);
>  	if (ret)
>  		goto err_node_put;
> 
> -- 
> 2.42.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

