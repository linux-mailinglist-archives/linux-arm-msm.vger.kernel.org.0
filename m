Return-Path: <linux-arm-msm+bounces-38015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8819CDDDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 12:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E67728229D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF4C1B6D1F;
	Fri, 15 Nov 2024 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKZgfOol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C7B1B3948
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731671862; cv=none; b=JUJ8S/0SWSX5pvSK6nZAKsmu0Z7uhVPiwbsZb4yco+ENn+abBwNdXEb3FNhcsLN2bLMQz6qZWU54Fi3+uywxvzUK1Awo/+zqE9qCI4Wx0Zen/4bztoQ5M1w7xgrDt5y4H2BvzPRp5d4uIty5eUa0xcDrdB2B61q9+s2DqX4Lj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731671862; c=relaxed/simple;
	bh=3PCLc6JHg+/COPy9QtRHjUbcpWaJsoK4fEGCaAkvl28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2fN/jGXyzh2IIcsqHmRIsmsD5JRMjziSDsasdpqdsBM2kDE7njmnMl8sYylMulsbD2B7c4FfIDAzV28aQicseLqfF1qgH2uUm3O54Y/hs0pNHZ1UpCEG490f/7tCM/ZRK3k2HqFQmignf1mGWIsYwwK3vKOgopSdg4fbEfbxpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKZgfOol; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7eb0bc007edso283250a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 03:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731671860; x=1732276660; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uCt9k+GAVMzvIuNpb03E3RgPTB9WFljhPlJF2v+aDCY=;
        b=dKZgfOolO+c2bPmaE3brJcaom5ZDEDsc2gYXh6n6KNDTWh5xSvFvxZFoYYSUfs7O4X
         vSfL4hHIDhVLv0k5dCV3dWgKgt75TpTY4Sk+nUDvDte04GR3EDNsvm/zlA8ZRBOe+W2K
         qFVF0feAhtdzDsdDBFk3bbCRIF9+2W5F4giNBXcTvhPbAgIyp5+poMdEgt3v/MJy3201
         QfPjBDj1KRKdzVs5kYEE8AF+eQje4PRTU7O+rpQVEavETShlpzJYvK+jjGISi8xi0lMI
         dOHSERuZAxAsVB/Le1kjA4ky3ARKfCccWKseEJLUsyd6qE4DLogT74Ex3FhmQXyjAdxH
         oByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671860; x=1732276660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCt9k+GAVMzvIuNpb03E3RgPTB9WFljhPlJF2v+aDCY=;
        b=aKh2NUwrLfhbuk8uT8ZBLTRT7m/8w9pmiT8BGZ2HXfVQHEsXPoeY5mwjnn/wFrALU5
         PEshjqNvZYEeurq/JQPNjhcvB+Q7BdLgqZi8TKMQBzUiqxZ+QO0/YxQyo/38lm1/kPFD
         gxPggnajYEM9FEvWKoIjfo9RzVapgMv3dgrVL8vYfzOqg/HIc0o3MVacu58HUoxHaqz1
         +We0yQwTUBd1bhlMRGPfwDyFcsYuoJDRKypGfijVFiR4ltwA7OnG+N8PL5tX4m8i1kza
         A7vDrWGYjvB39mrvz8Sav9gI/DCkcIViO7JXqmflRjUIicpbIHdeZINCIoTXwME7Ms/L
         JSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMKhFXndVU1v7YCgo+gITGztwDB688UlRgOBPltgkSgpTrb5buQVhd5UiRhv0MbG+UXStCUi08/i28bVZx@vger.kernel.org
X-Gm-Message-State: AOJu0YyceanIGzTMILGMN3xFHcsS77bBRDhgJfGq4DzK5gyJ5U9ucJ2n
	38KRsQ0zJr8eqlc6vZ4l7uP906xbiv/ceqpirHFYOvtvmmPHOTnfG6sI9NGfVw==
X-Google-Smtp-Source: AGHT+IGONxEz4Z0w25YthV6ZO/ymo1g7k+IQunHl1+xp1hq6h5Cgn3STyd9w9skNnOvequTxeJmjdg==
X-Received: by 2002:a05:6a21:32a0:b0:1d9:4837:ada2 with SMTP id adf61e73a8af0-1dc90bf799bmr2982887637.35.1731671859863;
        Fri, 15 Nov 2024 03:57:39 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770eef6csm1177542b3a.17.2024.11.15.03.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:57:39 -0800 (PST)
Date: Fri, 15 Nov 2024 17:27:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: andersson@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Jingoo Han <jingoohan1@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] PCI: qcom: Add support for host_stop_link() &
 host_start_link()
Message-ID: <20241115115729.wmcohbbc6sl4il3e@thinkpad>
References: <20241112-qps615_pwr-v3-0-29a1e98aa2b0@quicinc.com>
 <20241112-qps615_pwr-v3-5-29a1e98aa2b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241112-qps615_pwr-v3-5-29a1e98aa2b0@quicinc.com>

On Tue, Nov 12, 2024 at 08:31:37PM +0530, Krishna chaitanya chundru wrote:
> For the switches like QPS615 which needs to configure it before
> the PCIe link is established.
> 
> If the link is up, the boatloader might powered and configured the
> endpoint/switch already. In that case don't touch PCIe link else
> assert the PERST# and disable LTSSM bit so that PCIe controller
> will not participate in the link training as part of host_stop_link().
> 
> De-assert the PERST# and enable LTSSM bit back in host_start_link().
> 
> Introduce ltssm_disable function op to stop the link training.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index ef44a82be058..048aea94e319 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -246,6 +246,7 @@ struct qcom_pcie_ops {
>  	void (*host_post_init)(struct qcom_pcie *pcie);
>  	void (*deinit)(struct qcom_pcie *pcie);
>  	void (*ltssm_enable)(struct qcom_pcie *pcie);
> +	void (*ltssm_disable)(struct qcom_pcie *pcie);
>  	int (*config_sid)(struct qcom_pcie *pcie);
>  };
>  
> @@ -617,6 +618,41 @@ static int qcom_pcie_post_init_1_0_0(struct qcom_pcie *pcie)
>  	return 0;
>  }
>  
> +static int qcom_pcie_host_start_link(struct dw_pcie *pci)
> +{
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +
> +	if (!dw_pcie_link_up(pcie->pci))  {

I don't think the controller driver should worry about the bootloader
initialization. You should export dw_pcie_link_up() as a callback and call
start/stop link if only required (link not up) from the pwrctl driver.

- Mani

> +		qcom_ep_reset_deassert(pcie);
> +
> +		if (pcie->cfg->ops->ltssm_enable)
> +			pcie->cfg->ops->ltssm_enable(pcie);
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_pcie_host_stop_link(struct dw_pcie *pci)
> +{
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +
> +	if (!dw_pcie_link_up(pcie->pci))  {
> +		qcom_ep_reset_assert(pcie);
> +
> +		if (pcie->cfg->ops->ltssm_disable)
> +			pcie->cfg->ops->ltssm_disable(pcie);
> +	}
> +}
> +
> +static void qcom_pcie_2_3_2_ltssm_disable(struct qcom_pcie *pcie)
> +{
> +	u32 val;
> +
> +	val = readl(pcie->parf + PARF_LTSSM);
> +	val &= ~LTSSM_EN;
> +	writel(val, pcie->parf + PARF_LTSSM);
> +}
> +
>  static void qcom_pcie_2_3_2_ltssm_enable(struct qcom_pcie *pcie)
>  {
>  	u32 val;
> @@ -1361,6 +1397,7 @@ static const struct qcom_pcie_ops ops_1_9_0 = {
>  	.host_post_init = qcom_pcie_host_post_init_2_7_0,
>  	.deinit = qcom_pcie_deinit_2_7_0,
>  	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
> +	.ltssm_disable = qcom_pcie_2_3_2_ltssm_disable,
>  	.config_sid = qcom_pcie_config_sid_1_9_0,
>  };
>  
> @@ -1418,6 +1455,8 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
>  static const struct dw_pcie_ops dw_pcie_ops = {
>  	.link_up = qcom_pcie_link_up,
>  	.start_link = qcom_pcie_start_link,
> +	.host_start_link = qcom_pcie_host_start_link,
> +	.host_stop_link = qcom_pcie_host_stop_link,
>  };
>  
>  static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

