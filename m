Return-Path: <linux-arm-msm+bounces-59963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125AAC9DED
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 09:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E827D1895DCF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 07:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9361993BD;
	Sun,  1 Jun 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UofdgAQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC000158545
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 07:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748761374; cv=none; b=l24HgTYFaWSr76s/T8VbDgpzaNueKTC3Jx58YTsv+uLm32nfrA0HLLZiDFuRWfY9pWpuU4048Mmpi45IX8KN37vImBIKhWJFKT0m01AKxAtfRLPYDJ3IgLAseOapX2znvGZFhwzTZdSbgLzB+yTa4EI8EsJh3bT70OD8s6++FDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748761374; c=relaxed/simple;
	bh=ZpXIsoCNkIaCWakIXCBYuMK3hWGdOlG4BDi5Q3+PCGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUzcolgZi3FSqNnLkN48Y5hDKx6k5A1KDC9QhCus+5frYYPZ2rAJubXd5pE8hnkL9/tKCD12jx/cxEejjGQqho05h2fxX8Da9xPonD1rfF9qMmGtTHn9U6iYpjZeAHKWJY0agZOqGyhEi5a4xGLBIjSGpCwq+/VrFxiFGNmbcy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UofdgAQ8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c73f82dfso2662440b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 00:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748761371; x=1749366171; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+iFRI5r7fhc3gT4Zu9mCDHhajl4bRBMElLO/zxVSGSE=;
        b=UofdgAQ84sK9P4S5GNf/gWiVAfeDVuJRtgiTOO4GjCyY+fx0EL3vmm5VLrFy6+T6zN
         hm8W/gVUMLEdMokBYMhT/ELtEvP0Dpj9KLEjVzZ5z/VWKiO0MQ16UUlih5zk5peF84tL
         aqxOub00JnjHhUpDYa+VUTSzuuZaf4MwC6DIC68MMMtIdZQc684PPa3Laok+ua//Nn4r
         ZEP9uj6NhPfy84IucU/lVfYSywlaq+J40i+IPRaDudNBD/vO7fRNY2qGRH8Wg8LjfG7w
         IhgLI9D+nt37C97d0r9SX3Yat2ltBtlrMnNo1yQb2luZ0NlwnKuVV6lm2DKeyig3jwxh
         U9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748761371; x=1749366171;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+iFRI5r7fhc3gT4Zu9mCDHhajl4bRBMElLO/zxVSGSE=;
        b=r/jsvXIzLlKHoWc9WdyTbsQdlXv62/bNkYj9N2EWNVIt6CLSJt48fkKZYxk78ehAuY
         zjOc30jCg93yRosBV4j5tnB/RuMhl4NFS+g0TlW0Fc8hJnC7XIZFVGnGoz33pxKIpP8U
         FBKiyjOPB79S1ll/t8vc5VCo4N0tPL2qs4mxe9PirSpU/m7Zl6uF/FOPvkO6KrG0gQkF
         nNCzW2wX6V0bCUtHTsVGU+gjjhwRCRmueR6sheysuzvlVAev7Bcu/qwg3Jfox9NwVMYD
         mRcuJA3vlINZUmvqNpzEP3mC4LQiWcBaxuxTStdBoOLcu32Vtm6IOR8yq7okmPdVdvIP
         pvKg==
X-Forwarded-Encrypted: i=1; AJvYcCW2lhjiXHD/irdrmpqaccybDN5jYpcGgYbrZn0rBYcuN0zT9mKnKNLoupfUpt+EuxxWJHB5wZhQRa/sQ1O+@vger.kernel.org
X-Gm-Message-State: AOJu0YwGDcKh8N8kHeu6CRVrBIpeTSSliet7iD4N2CYMsgECzKxMSviH
	qr0rrk0p2L/UM5MiAEo+hBbtn+3FBBcPxYh1nlaRVDz2Q7K8QJ2fbcyeaWPoQ4CKnA==
X-Gm-Gg: ASbGncs00dOTmA4DYeTUZ6a4DRJww2hJx72K/vSPUG4ItFbADyVuJ+IYeneKJkVvbCt
	KBi0zME4R1piogsxBnD4j2/SuL9xYEVlXjw+TED4NyQWVIDeeG7/PpgXGpI5TZIikcrp7rUk6fl
	RSG5kFrvvSgc3oxj6FASiYS+GXg8tt0peXxb5OWim1UYo27TdC/r2UWpdvmF7h0Gazv54RiN3IC
	rRvDrClsVmS2mZj6Mi8g4j6DRc8D0+0Mmu5QpHpW1UpDBoOXBUqBKe7x2klcTjdU5t7kQidiPXp
	Bhqsj9siPVJ5L1nlkz3gtjZZg3mkL/pPZX8AT8nW/Rxt9ZhRPZCy+UiHw7A3cYA=
X-Google-Smtp-Source: AGHT+IG3BzT8Kf5h0a0hVa/1uZy2fDijrr+fOYTG4XEx3lNrrSSHU23cMo0Brr/5DC8GD0styvfufQ==
X-Received: by 2002:a05:6a00:b44:b0:740:9abe:4d94 with SMTP id d2e1a72fcca58-747d1ae068fmr5793245b3a.21.1748761370813;
        Sun, 01 Jun 2025 00:02:50 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe963a8sm5728660b3a.16.2025.06.01.00.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:02:50 -0700 (PDT)
Date: Sun, 1 Jun 2025 12:32:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v3 2/3] PCI: qcom: Add support for multi-root port
Message-ID: <n3fxoq64whe7rjmcaarmaimo57krrcmd5d6bxnla2qsikm3uzx@ncon7ivizuaf>
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-2-1afec3c4ea62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419-perst-v3-2-1afec3c4ea62@oss.qualcomm.com>

On Sat, Apr 19, 2025 at 10:49:25AM +0530, Krishna Chaitanya Chundru wrote:
> Move phy, perst handling to root port and provide a way to have multi-port

s/perst/PERST#

> logic.
> 
> Currently, qcom controllers only support single port, and all properties

s/qcom/Qcom

> are present in the controller node itself. This is incorrect, as
> properties like phy, perst, wake, etc. can vary per port and should be

If you are referring to properties, specify them as it is. Like, phys,
perst-gpios, etc...

> present in the root port node.
> 
> To maintain DT backwards compatibility, fallback to the legacy method of
> parsing the controller node if the port parsing fails.
> 
> pci-bus-common.yaml uses reset-gpios property for representing PERST, use

s/PERST/PERST#

> same property instead of perst-gpios.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 169 +++++++++++++++++++++++++++------
>  1 file changed, 142 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index dc98ae63362db0422384b1879a2b9a7dc564d091..e97e5076f5f77acbbdfb982af7acc69daf9bf307 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -262,6 +262,11 @@ struct qcom_pcie_cfg {
>  	bool no_l0s;
>  };
>  
> +struct qcom_pcie_port {
> +	struct list_head list;
> +	struct gpio_desc *reset;
> +	struct phy *phy;
> +};

Insert a newline.

>  struct qcom_pcie {
>  	struct dw_pcie *pci;
>  	void __iomem *parf;			/* DT parf */
> @@ -276,22 +281,35 @@ struct qcom_pcie {
>  	struct dentry *debugfs;
>  	bool suspended;
>  	bool use_pm_opp;
> +	struct list_head ports;

Move it above the boolean.

>  };
>  
>  #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
>  
> -static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> +static void qcom_perst_assert_deassert(struct qcom_pcie *pcie, bool assert)

qcom_perst_assert(..., bool assert)

>  {
> -	gpiod_set_value_cansleep(pcie->reset, 1);
> +	struct qcom_pcie_port *port, *tmp;
> +	int val = assert ? 1 : 0;
> +
> +	if (list_empty(&pcie->ports))
> +		gpiod_set_value_cansleep(pcie->reset, val);
> +	else
> +		list_for_each_entry_safe(port, tmp, &pcie->ports, list)

_safe loop should be used only when the entry is removed.

> +			gpiod_set_value_cansleep(port->reset, val);
> +
>  	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
>  }
>  
> +static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> +{
> +	qcom_perst_assert_deassert(pcie, true);
> +}
> +
>  static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
>  {
>  	/* Ensure that PERST has been asserted for at least 100 ms */
>  	msleep(100);
> -	gpiod_set_value_cansleep(pcie->reset, 0);
> -	usleep_range(PERST_DELAY_US, PERST_DELAY_US + 500);
> +	qcom_perst_assert_deassert(pcie, false);
>  }
>  
>  static int qcom_pcie_start_link(struct dw_pcie *pci)
> @@ -1229,6 +1247,59 @@ static int qcom_pcie_link_up(struct dw_pcie *pci)
>  	return !!(val & PCI_EXP_LNKSTA_DLLLA);
>  }
>  
> +static void qcom_pcie_phy_exit(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_port *port, *tmp;
> +
> +	if (list_empty(&pcie->ports))
> +		phy_exit(pcie->phy);
> +	else
> +		list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> +			phy_exit(port->phy);
> +}
> +
> +static void qcom_pcie_phy_off(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_port *port, *tmp;
> +
> +	if (list_empty(&pcie->ports)) {
> +		phy_power_off(pcie->phy);
> +	} else {
> +		list_for_each_entry_safe(port, tmp, &pcie->ports, list)
> +			phy_power_off(port->phy);
> +	}
> +}
> +
> +static int qcom_pcie_phy_power_on(struct qcom_pcie *pcie)
> +{
> +	struct qcom_pcie_port *port, *tmp;
> +	int ret = 0;
> +
> +	if (list_empty(&pcie->ports)) {
> +		ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +		if (ret)
> +			goto out;
> +
> +		ret = phy_power_on(pcie->phy);
> +		if (ret)
> +			goto out;
> +	} else {
> +		list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
> +			ret = phy_set_mode_ext(port->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> +			if (ret)
> +				goto out;
> +
> +			ret = phy_power_on(port->phy);
> +			if (ret) {
> +				qcom_pcie_phy_off(pcie);
> +				goto out;
> +			}
> +		}
> +	}
> +out:

I would prefer returning directly above instead of the err label.

> +	return ret;
> +}
> +
>  static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1241,11 +1312,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (ret)
>  		return ret;
>  
> -	ret = phy_set_mode_ext(pcie->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_RC);
> -	if (ret)
> -		goto err_deinit;
> -
> -	ret = phy_power_on(pcie->phy);
> +	ret = qcom_pcie_phy_power_on(pcie);
>  	if (ret)
>  		goto err_deinit;
>  
> @@ -1268,7 +1335,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>  err_assert_reset:
>  	qcom_ep_reset_assert(pcie);
>  err_disable_phy:
> -	phy_power_off(pcie->phy);
> +	qcom_pcie_phy_off(pcie);

Use 'qcom_pcie_phy_power_off' for consistency.

>  err_deinit:
>  	pcie->cfg->ops->deinit(pcie);
>  
> @@ -1281,7 +1348,7 @@ static void qcom_pcie_host_deinit(struct dw_pcie_rp *pp)
>  	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>  
>  	qcom_ep_reset_assert(pcie);
> -	phy_power_off(pcie->phy);
> +	qcom_pcie_phy_off(pcie);
>  	pcie->cfg->ops->deinit(pcie);
>  }
>  
> @@ -1579,11 +1646,41 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node)
> +{
> +	struct device *dev = pcie->pci->dev;
> +	struct qcom_pcie_port *port;
> +	struct gpio_desc *reset;
> +	struct phy *phy;
> +
> +	reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(node),
> +				      "reset", GPIOD_OUT_HIGH, "PERST#");
> +	if (IS_ERR(reset))
> +		return PTR_ERR(reset);
> +
> +	phy = devm_of_phy_get(dev, node, NULL);
> +	if (IS_ERR(phy))
> +		return PTR_ERR(phy);
> +
> +	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->reset = reset;
> +	port->phy = phy;
> +	INIT_LIST_HEAD(&port->list);
> +	list_add_tail(&port->list, &pcie->ports);
> +
> +	return 0;
> +}
> +
>  static int qcom_pcie_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_pcie_cfg *pcie_cfg;
>  	unsigned long max_freq = ULONG_MAX;
> +	struct qcom_pcie_port *port, *tmp;
>  	struct device *dev = &pdev->dev;
> +	struct device_node *of_port;
>  	struct dev_pm_opp *opp;
>  	struct qcom_pcie *pcie;
>  	struct dw_pcie_rp *pp;
> @@ -1611,6 +1708,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_pm_runtime_put;
>  
> +	INIT_LIST_HEAD(&pcie->ports);
> +
>  	pci->dev = dev;
>  	pci->ops = &dw_pcie_ops;
>  	pp = &pci->pp;
> @@ -1619,12 +1718,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pcie->cfg = pcie_cfg;
>  
> -	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
> -	if (IS_ERR(pcie->reset)) {
> -		ret = PTR_ERR(pcie->reset);
> -		goto err_pm_runtime_put;
> -	}
> -
>  	pcie->parf = devm_platform_ioremap_resource_byname(pdev, "parf");
>  	if (IS_ERR(pcie->parf)) {
>  		ret = PTR_ERR(pcie->parf);
> @@ -1647,12 +1740,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	pcie->phy = devm_phy_optional_get(dev, "pciephy");
> -	if (IS_ERR(pcie->phy)) {
> -		ret = PTR_ERR(pcie->phy);
> -		goto err_pm_runtime_put;
> -	}
> -
>  	/* OPP table is optional */
>  	ret = devm_pm_opp_of_add_table(dev);
>  	if (ret && ret != -ENODEV) {
> @@ -1699,9 +1786,35 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  
>  	pp->ops = &qcom_pcie_dw_ops;
>  
> -	ret = phy_init(pcie->phy);
> -	if (ret)
> -		goto err_pm_runtime_put;
> +	for_each_available_child_of_node(dev->of_node, of_port) {
> +		ret = qcom_pcie_parse_port(pcie, of_port);
> +		of_node_put(of_port);
> +		if (ret)

We should only skip the loop if ENOENT is returned. Any other errors should
be treated as a hard error and probe should fail.

> +			break;
> +	}
> +
> +	/*
> +	 * In the case of failure in parsing the port nodes, fallback to the

Driver cannot fallback to the legacy binding if the root port node parsing
fails. It can only do so if root the port node properties are not populated.

> +	 * legacy method of parsing the controller node. This is to maintain DT
> +	 * backwards compatibility.
> +	 */
> +	if (ret) {

Add a warning to let users/developers switch to new binding:

	dev_warn(dev, "Using legacy device tree binding\n");

- Mani

-- 
மணிவண்ணன் சதாசிவம்

