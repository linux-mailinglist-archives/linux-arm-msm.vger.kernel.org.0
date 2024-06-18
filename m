Return-Path: <linux-arm-msm+bounces-22967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B590C4D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 10:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C48A2829C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 08:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AFA14F9C9;
	Tue, 18 Jun 2024 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TMxkDlbH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D728314F114
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695356; cv=none; b=XYZl48qTejk45jajB/3Im4vsPodDlsz5dasRKLw8SiSNg/k9wyARBvfeEzVBpF+287ulN1xMzaN4EXZlg1+SzZu8Ed9IPqAq82aQXjA610Gys/klp3whsty6NyxCjlg9mMc8kytjF23WenyH39iUAZswkAb9oCrd6hVkQelJ7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695356; c=relaxed/simple;
	bh=L4wf4x2dBZQvEnpkKvLPORNBkAK3TS9LwI2recHxqhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWyOlF1UyOy8+h9ZdNQ+6L1gpFC10YOD2bnXTIAzUEIjm8rLAiYTY3ME1QNhQDYB398NMyQGvLHi1BRcuAeB5/hNd7qQ1IYnvLCUNkbexOS8INuszcUCd/dqVi79Rg7c50qJEGZooAoqat3xpXpN//XmrcUouxFpf+uUR+IKUA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TMxkDlbH; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-705fff50de2so1244888b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718695354; x=1719300154; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q8tUv88VFJag+gHbNp32GqIa0FEWnLAl/tXMaE0LKQE=;
        b=TMxkDlbH4c5urzf0yhxuPNvFMuRp81/pyouYNyen7BPTYwfZSVqdE80zl8j05lDmh3
         +3YIL86M/MRLRIEvc1y0HqVU3dUAnjeHqTi/EMmjmJadxGvd3CeoevXPhgJiBHyapk11
         Gxh2O7HTWisu+SDKYgXCOl1OIRrPQwjL3pzBiyRwRXS66MLu1tnocWBND6w+6A3TZiq+
         u+AZbMBdBiS86RuJpKPULrM4qbmeW4AUGPM3kUHy4Wvs/6bse2Q+ihRCGyxS8T5A4cmW
         SvVeZ7vq+TdF2B6mn9jsZb8WJn70Ym8dK0ZUm43O1zhRoNrqrqs+i9L9Tdurumk0bEeq
         NVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718695354; x=1719300154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8tUv88VFJag+gHbNp32GqIa0FEWnLAl/tXMaE0LKQE=;
        b=HIoRejQ0pqRO3bd5pkfOkYXYa08hVr7xVsmfKSS/eKo04Ks2WipQsw8/yXqjM1R7Fn
         hUO+odEiWIL9uKDdUjyarLruYjOCgYajESxm1rQzH3W/G6aedRE/OSfRWu2k6kvdkjQo
         l87Y6c220bsfsUBNcjKpXSdkUHSEE+asequfXKX6nXvfqvnj/v6Bs5HFTDViIaxmxaH5
         CmSPjJbAaVNwjyq72cUO2FG2mW9OVhXfSAq7XchnYx5iC6cnkF6OFlCVgAYV6d0eypFw
         wpYVouk/LVc6mvJRpKRYnDHJDk35xIfEKScmSQtu0F9o5rYWx8yoz5gEFHuR9oPep/vy
         e3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+risY+RtnzK1DBB7mLLYP1tHiuxn5cMTf6qSTcQubo5NpKL+eLmXBN68tUldfG5Q0XPwthvQ8jjyg4rIU1Y57DZ+PXyi5wgYwDHYGxQ==
X-Gm-Message-State: AOJu0Yzc1PT5azrttRzqONhgyNFJl0VLM7Wqr8yRz4ya9LtlWU2mVGSz
	i4Pj2Upf3hkumfBSEZm8XTK/EeGtNrnswatBGKF89Vv9SqN4rylA/+7iQQuo3g==
X-Google-Smtp-Source: AGHT+IHZA/cvn9bGNm1TUpflHmsdUDHSxPPQlxV8VE5MQB+zfjE1Wi5tnhZ8CkLkeliOfy7yjei59g==
X-Received: by 2002:a05:6a00:2d95:b0:704:229e:54bd with SMTP id d2e1a72fcca58-7061aba4f70mr3085370b3a.8.1718695354052;
        Tue, 18 Jun 2024 00:22:34 -0700 (PDT)
Received: from thinkpad ([120.60.129.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3bf7esm8386242b3a.114.2024.06.18.00.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 00:22:33 -0700 (PDT)
Date: Tue, 18 Jun 2024 12:52:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, johan+linaro@kernel.org,
	bmasney@redhat.com, djakov@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	vireshk@kernel.org, quic_vbadigan@quicinc.com,
	quic_skananth@quicinc.com, quic_nitegupt@quicinc.com,
	quic_parass@quicinc.com, krzysztof.kozlowski@linaro.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v14 1/4] PCI: qcom: Add ICC bandwidth vote for CPU to
 PCIe path
Message-ID: <20240618072222.GC5485@thinkpad>
References: <20240609-opp_support-v14-0-801cff862b5a@quicinc.com>
 <20240609-opp_support-v14-1-801cff862b5a@quicinc.com>
 <1b5f11a6-52e3-55ca-8c80-dca8f7e0c7c7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b5f11a6-52e3-55ca-8c80-dca8f7e0c7c7@linux.intel.com>

On Fri, Jun 14, 2024 at 03:14:10PM +0300, Ilpo Järvinen wrote:
> On Sun, 9 Jun 2024, Krishna chaitanya chundru wrote:
> 
> > To access the host controller registers of the host controller and the
> > endpoint BAR/config space, the CPU-PCIe ICC (interconnect) path should
> > be voted otherwise it may lead to NoC (Network on chip) timeout.
> > We are surviving because of other driver voting for this path.
> > 
> > As there is less access on this path compared to PCIe to mem path
> > add minimum vote i.e 1KBps bandwidth always which is sufficient enough
> > to keep the path active and is recommended by HW team.
> > 
> > During S2RAM (Suspend-to-RAM), the DBI access can happen very late (while
> > disabling the boot CPU). So do not disable the CPU-PCIe interconnect path
> > during S2RAM as that may lead to NoC error.
> > 
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 45 +++++++++++++++++++++++++++++++---
> >  1 file changed, 41 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 5f9f0ff19baa..ff1d891c8b9a 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -253,6 +253,7 @@ struct qcom_pcie {
> >  	struct phy *phy;
> >  	struct gpio_desc *reset;
> >  	struct icc_path *icc_mem;
> > +	struct icc_path *icc_cpu;
> >  	const struct qcom_pcie_cfg *cfg;
> >  	struct dentry *debugfs;
> >  	bool suspended;
> > @@ -1369,6 +1370,9 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
> >  	if (IS_ERR(pcie->icc_mem))
> >  		return PTR_ERR(pcie->icc_mem);
> >  
> > +	pcie->icc_cpu = devm_of_icc_get(pci->dev, "cpu-pcie");
> > +	if (IS_ERR(pcie->icc_cpu))
> > +		return PTR_ERR(pcie->icc_cpu);
> >  	/*
> >  	 * Some Qualcomm platforms require interconnect bandwidth constraints
> >  	 * to be set before enabling interconnect clocks.
> > @@ -1378,11 +1382,25 @@ static int qcom_pcie_icc_init(struct qcom_pcie *pcie)
> >  	 */
> >  	ret = icc_set_bw(pcie->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
> >  	if (ret) {
> > -		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
> > +		dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> >  			ret);
> 
> I think it would be better to separate these message clarifications into a 
> separate patch. It would make both patches more into the point.
> 

No, it doesn't make sense. This patch introduces ICC vote for CPU-PCIe path, so
it _should_ also update the error message.

- Mani

> Other than that, the change looked okay to me.
> 
> -- 
>  i.
> 
> >  		return ret;
> >  	}
> >  
> > +	/*
> > +	 * Since the CPU-PCIe path is only used for activities like register
> > +	 * access of the host controller and endpoint Config/BAR space access,
> > +	 * HW team has recommended to use a minimal bandwidth of 1KBps just to
> > +	 * keep the path active.
> > +	 */
> > +	ret = icc_set_bw(pcie->icc_cpu, 0, kBps_to_icc(1));
> > +	if (ret) {
> > +		dev_err(pci->dev, "Failed to set bandwidth for CPU-PCIe interconnect path: %d\n",
> > +			ret);
> > +		icc_set_bw(pcie->icc_mem, 0, 0);
> > +		return ret;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -1408,7 +1426,7 @@ static void qcom_pcie_icc_update(struct qcom_pcie *pcie)
> >  
> >  	ret = icc_set_bw(pcie->icc_mem, 0, width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
> >  	if (ret) {
> > -		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
> > +		dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
> >  			ret);
> >  	}
> >  }
> > @@ -1570,7 +1588,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
> >  	 */
> >  	ret = icc_set_bw(pcie->icc_mem, 0, kBps_to_icc(1));
> >  	if (ret) {
> > -		dev_err(dev, "Failed to set interconnect bandwidth: %d\n", ret);
> > +		dev_err(dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n", ret);
> >  		return ret;
> >  	}
> >  
> > @@ -1594,7 +1612,18 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
> >  		pcie->suspended = true;
> >  	}
> >  
> > -	return 0;
> > +	/*
> > +	 * Only disable CPU-PCIe interconnect path if the suspend is non-S2RAM.
> > +	 * Because on some platforms, DBI access can happen very late during the
> > +	 * S2RAM and a non-active CPU-PCIe interconnect path may lead to NoC
> > +	 * error.
> > +	 */
> > +	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> > +		ret = icc_disable(pcie->icc_cpu);
> > +		if (ret)
> > +			dev_err(dev, "Failed to disable CPU-PCIe interconnect path: %d\n", ret);
> > +	}
> > +	return ret;
> >  }
> >  
> >  static int qcom_pcie_resume_noirq(struct device *dev)
> > @@ -1602,6 +1631,14 @@ static int qcom_pcie_resume_noirq(struct device *dev)
> >  	struct qcom_pcie *pcie = dev_get_drvdata(dev);
> >  	int ret;
> >  
> > +	if (pm_suspend_target_state != PM_SUSPEND_MEM) {
> > +		ret = icc_enable(pcie->icc_cpu);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to enable CPU-PCIe interconnect path: %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> >  	if (pcie->suspended) {
> >  		ret = qcom_pcie_host_init(&pcie->pci->pp);
> >  		if (ret)
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

