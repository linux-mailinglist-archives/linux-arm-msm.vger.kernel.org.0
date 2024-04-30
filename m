Return-Path: <linux-arm-msm+bounces-18866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A983F8B69D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 07:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC4651C22076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 05:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4BD17579;
	Tue, 30 Apr 2024 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cEsW47AF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8EF1757A
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714454496; cv=none; b=cJXCd9f/ria9Yj3Q8K6kBTtCg07Wl2ah1YKM/4uAWSo4ATiAjExL6Nm8iClepvjjSIzJ/X7TxFjFIBSMhfgMklaXyVs7H8/8k0ODg7GPKx4GnhVhvwkNHpen8qxkTtW0hX3ghbQtsIIGg8LAKbl9p0/gt9oniPFnQd7RvZwCY68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714454496; c=relaxed/simple;
	bh=zH5JC0vELFAUV2si43PisfO65kvPP588yFpbrzrGSos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJD6YlOwkHJzyTQu3tTeNAeQpRqbpxSLRXEqoWZbtCDli0Qd/+4QLj07lmAnhC1D+wLO0/CRr3YZ3i1VCk+GSORn51Ij47Opt7gYapjunrDvicJfOxSUsYWPrQLArfbBmSXt07ASDHtkd/BTufF0+/FdCGQ4hi5eLBc8p+IYI6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cEsW47AF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f07de6ab93so4898493b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 22:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714454493; x=1715059293; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuMDk+h2WAX2hDgqHpK6EhDjKwV5gOXwgT8Rq78Xqd4=;
        b=cEsW47AFpiI/9pedaZLxALyw90Dd/GjV0uVAz2OTqytL1rBj5yIvC1xJh5sKJvDejL
         /KwlyrNP4yx34Lm91sJq85g05vDO2b1PPQCGbNd/uUSisr3aFiQLerfzunv/blLT/tIS
         5cxSaZuWVf9uEq+v51mhwHWS9V8AhQxAmGJyakyvGilWYPw6SBBmLlyQX/ZF3FNtuGVv
         6WRJp/0PpLn0zHSC0mKDAB3WfqhmubtoE+CtAPDEcP1Gj6pdVNhBcKaNsU3ZJ38rWV5Z
         LLPBcSi2ZUJ7rXeFCf7EeIuLz1dV+2+biOfe/ZscqEKeZh/vq1u2+kaGgMOXsIA3ngmk
         V7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714454493; x=1715059293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vuMDk+h2WAX2hDgqHpK6EhDjKwV5gOXwgT8Rq78Xqd4=;
        b=u5RpTSnF1ntunzYPwl8PajhnaweAcIhMWUHU2HHgtEiFoHnxtKsZcXFteQLY+I6ApV
         WxBDafrZeqQ25R3f62frz4H1Nq/9kMtUeABnK/EtLuCR1agyblNNtvTyx+dq8saqHlH3
         PhSXxRbuBvXmuq8njjPK40Ce13yojt6czv/+jYB1bAxtslpgc3Y/EJC6oxD2FWbRp4/7
         Td0/Vj/saK3ua8cCojaCsCQUWjl9vqu/FzgXhXSd+p9rAj6hO7oXthcDNlo4NkEOWZqz
         7WUmcuX5fOaoEbEnjyvWn0kULePIijJ4VQFLrNRG7eHxEYwc45VdKZPmfIxtJcwwAW30
         S48A==
X-Forwarded-Encrypted: i=1; AJvYcCXe7/BRDohiIga6SFBaP4rrIizcxPewius+5jFvxbXGOCBP2BbZKG4mMVa82xKFelROMjsePvqvdkyRS6zdokBZ21fExo5E+oDzvQ4AOA==
X-Gm-Message-State: AOJu0Yw+HPC/6QIBoslzuWTNEFkJjr073ESJxT4XdD2j7gg0HjOaNAat
	RFMf8mQcDNa7h8Zt8cNaTUSh74+Dpn0YCJd4uT2ofpiMVgBQ5abhic92MTFgFg==
X-Google-Smtp-Source: AGHT+IGjt94arU+ZMuPGRIOgYFN5GyJzfTxZ9ToNSzFhHOOIVfYVbECLUUHpDJTHXYHeiixGugp64w==
X-Received: by 2002:a05:6a00:398d:b0:6ec:e726:b6f5 with SMTP id fi13-20020a056a00398d00b006ece726b6f5mr14601591pfb.26.1714454492888;
        Mon, 29 Apr 2024 22:21:32 -0700 (PDT)
Received: from thinkpad ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id 13-20020a056a00070d00b006e69a142458sm20182974pfl.213.2024.04.29.22.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:21:32 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:51:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, johan+linaro@kernel.org,
	bmasney@redhat.com, djakov@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	vireshk@kernel.org, quic_vbadigan@quicinc.com,
	quic_skananth@quicinc.com, quic_nitegupt@quicinc.com,
	quic_parass@quicinc.com, krzysztof.kozlowski@linaro.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v12 2/6] PCI: qcom: Add ICC bandwidth vote for CPU to
 PCIe path
Message-ID: <20240430052125.GC3301@thinkpad>
References: <20240427-opp_support-v12-0-f6beb0a1f2fc@quicinc.com>
 <20240427-opp_support-v12-2-f6beb0a1f2fc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240427-opp_support-v12-2-f6beb0a1f2fc@quicinc.com>

On Sat, Apr 27, 2024 at 07:22:35AM +0530, Krishna chaitanya chundru wrote:
> To access the host controller registers of the host controller and the
> endpoint BAR/config space, the CPU-PCIe ICC (interconnect) path should
> be voted otherwise it may lead to NoC (Network on chip) timeout.
> We are surviving because of other driver voting for this path.
> 
> As there is less access on this path compared to PCIe to mem path
> add minimum vote i.e 1KBps bandwidth always which is sufficient enough
> to keep the path active and is recommended by HW team.
> 
> During S2RAM (Suspend-to-RAM), the DBI access can happen very late (while
> disabling the boot CPU). So do not disable the CPU-PCIe interconnect path
> during S2RAM as that may lead to NoC error.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 44 ++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 14772edcf0d3..465d63b4be1c 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -245,6 +245,7 @@ struct qcom_pcie {
>  	struct phy *phy;
>  	struct gpio_desc *reset;
>  	struct icc_path *icc_mem;
> +	struct icc_path *icc_cpu;
>  	const struct qcom_pcie_cfg *cfg;
>  	struct dentry *debugfs;
>  	bool suspended;
> @@ -1409,6 +1410,9 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
>  	if (IS_ERR(pcie->icc_mem))
>  		return PTR_ERR(pcie->icc_mem);
>  
> +	pcie->icc_cpu = devm_of_icc_get(pci->dev, "cpu-pcie");
> +	if (IS_ERR(pcie->icc_cpu))
> +		return PTR_ERR(pcie->icc_cpu);
>  	/*
>  	 * Some Qualcomm platforms require interconnect bandwidth constraints
>  	 * to be set before enabling interconnect clocks.
> @@ -1418,7 +1422,20 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
>  	 */
>  	ret = icc_set_bw(pcie->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
>  	if (ret) {
> -		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
> +		dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Since the CPU-PCIe path is only used for activities like register
> +	 * access of the host controller and endpoint Config/BAR space access,
> +	 * HW team has recommended to use a minimal bandwidth of 1KBps just to
> +	 * keep the path active.
> +	 */
> +	ret = icc_set_bw(pcie->icc_cpu, 0, kBps_to_icc(1));
> +	if (ret) {
> +		dev_err(pci->dev, "Failed to set bandwidth for CPU-PCIe interconnect path: %d\n",
>  			ret);
>  		return ret;
>  	}
> @@ -1448,7 +1465,7 @@ static void qcom_pcie_icc_update(struct qcom_pcie *pcie)
>  
>  	ret = icc_set_bw(pcie->icc_mem, 0, width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
>  	if (ret) {
> -		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
> +		dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
>  			ret);
>  	}
>  }
> @@ -1610,7 +1627,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
>  	 */
>  	ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
>  	if (ret) {
> -		dev_err(dev, "Failed to set interconnect bandwidth: %d\n", ret);
> +		dev_err(dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -1634,7 +1651,18 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
>  		pcie->suspended = true;
>  	}
>  
> -	return 0;
> +	/*
> +	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> +	 * Because on some platforms, DBI access can happen very late during the
> +	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> +	 * error.
> +	 */
> +	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +		ret = icc_disable(pcie->icc_cpu);
> +		if (ret)
> +			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
> +	}
> +	return ret;
>  }
>  
>  static int qcom_pcie_resume_noirq(struct device *dev)
> @@ -1642,6 +1670,14 @@ static int qcom_pcie_resume_noirq(struct device *dev)
>  	struct qcom_pcie *pcie = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> +		ret = icc_enable(pcie->icc_cpu);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	if (pcie->suspended) {
>  		ret = qcom_pcie_host_init(&pcie->pci->pp);
>  		if (ret)
> 
> -- 
> 2.42.0
> 

-- 
மணிவண்ணன் சதாசிவம்

