Return-Path: <linux-arm-msm+bounces-64111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1EAFDE08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 05:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EBC116A590
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 03:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D5D35897;
	Wed,  9 Jul 2025 03:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S5frwjjA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A07404E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 03:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752031090; cv=none; b=uZofcxGr39FfmhDN5usXXgzutjor32m4yl+GtQjfB3rJXEQZOv/jZeUUwiLrD5kN2erhQp6QDNaPhj6QG7G6whN3slFvazJrn96NKXqJWZRhR5UU0fOAmgc6qv2wpmiG0Imyxu5BVLSkQXB3DGSpLN/znNK0h3L3GSHz80I/qPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752031090; c=relaxed/simple;
	bh=BJ/g+c5xY2G5P29E0eeh/R3h2Ux7fpi7iUA6mqj0GmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvctbQwPtJ7xMKFHzsgdx9oAwwzSOc3g21GLG5SPJeGVzZfHUv9SJGcezjIknQS5XjC/GCMpnT7C3LUyU9cq81AvBsQ2gDIrObupG5Pv5gk+6RGHhsFY3AQ3NNkTKESw9SUAJSyM2D0eLEIB3yh1rGhpQnhDFotZ8WidTFmoaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S5frwjjA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748fe69a7baso4276597b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 20:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752031088; x=1752635888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l9e+Cq19Bnt4gqLovZXhsuwDL43YzIOk43RTj4Ef5Pg=;
        b=S5frwjjAkQlgePLc86Zu0qV/EGgCWm8MrBsNzmCi2Ib2IPn3AeoPI/tG8PvjRGS83Q
         jsAEUWWo6L7H1Yzo1ymDuCvava97A+r4FAtG0sxytXX9jNLt7vtDlTewNSInFrBHzvj5
         gADdgEkF6nyacFJiUgaGqPPaOTYUf0N09RjIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752031088; x=1752635888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9e+Cq19Bnt4gqLovZXhsuwDL43YzIOk43RTj4Ef5Pg=;
        b=HBrP7q2XQV0DQOyDmezHsJjX005nevqdlTz72QbLl4Dd8sqMXLYXQTUjRgIOfO/WyD
         TpVV/h5t6M+xXd8WFr376zQriOw0AuFhO3YA+3+/qWscxxH+IA2B1zNL/YxXOfYpXHw+
         SxQjl1vVnvOMq+Kuw/4UAO0oZ7W2MO/px8LEFZVpNebXU3qOi+vvD3Xo08Yetr0Pja/F
         KNHP4/WwicDeR46AuIdbzWo9gw+ppZKgY9tDg12tHfvMe+JtQOrno+KLUjfISk6W3sVF
         JtSutyXBuAyHdgP5yb5gNA+NKH33zV7ZH7CUrRgdXNwD5wOumC1OwMmmVspe1+Upw7Dj
         7E/g==
X-Forwarded-Encrypted: i=1; AJvYcCVDSj1ukjPOaZHsZy+5+bcNwJirIpRr6LD+LBwQjXx5OVtanj6ikCmKCequuTuVbl4V2c6Qxvf1LLzj39ZC@vger.kernel.org
X-Gm-Message-State: AOJu0YxiqWT4ihA9bgMAglTxQf0odCpckNW3inSXRUhTVsv9D8aibWza
	WqvsEVJDyhhHTiCIPW5pDbyCnN2ObNE7LiTMXjtDwc8WWJZdzSkfpH48usqxWrhvLw==
X-Gm-Gg: ASbGncvY8IXT9auMErr2YfgZa3IDmol4GoqyofTJylvfxw9DcryIvgrMeTPMulgLDkC
	GWzZBFxHL7rEqxDLWr38bUvsKdiVMb3dRPXCO5R2Ui9t+su8tgVVQsmS2HTPEON6C6/o8zULWuq
	hSKHy37eYNidJ7TnQSmx4kNRUSbJfqXJJnNhdU06flcUV/s1n/Y48PA81X+tWtEmwYWBS323NbH
	vIaT1Uv50mFDqL1FvKHmSYBoEqxO7ws7fHlrZeHYY3tGlVNpOxXLiBBV6T5Z+cHIz4Oml/2xaX9
	+hJH1aEf052aokTPCb41vNPW7JTu2t3iFQGSz8bdXIrp2+w4jo6PP+dg+FURUCeERB3YQpVqUV7
	jIdKq8jvXyfnSVxuVxaTnO8qo
X-Google-Smtp-Source: AGHT+IHNU1Dj5M7Gb2JJO6Y5rMtEmhaKwHD6t4IyD/awUkiX39KRiD2H/1C+9hth+BePaoYj8l5m0Q==
X-Received: by 2002:a05:6a20:1596:b0:220:af59:2e35 with SMTP id adf61e73a8af0-22cd8f236cdmr1320687637.38.1752031088548;
        Tue, 08 Jul 2025 20:18:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:9b88:4872:11ac:8ccb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74ce35a1d3dsm13309324b3a.34.2025.07.08.20.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 20:18:07 -0700 (PDT)
Date: Tue, 8 Jul 2025 20:18:06 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/3] PCI: qcom: Allow pwrctrl framework to control
 PERST#
Message-ID: <aG3fblf5twIAitvg@google.com>
References: <20250707-pci-pwrctrl-perst-v1-0-c3c7e513e312@kernel.org>
 <20250707-pci-pwrctrl-perst-v1-3-c3c7e513e312@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-pci-pwrctrl-perst-v1-3-c3c7e513e312@kernel.org>

Hi,

On Mon, Jul 07, 2025 at 11:48:40PM +0530, Manivannan Sadhasivam wrote:
> Since the Qcom platforms rely on pwrctrl framework to control the power
> supplies, allow it to control PERST# also. PERST# should be toggled during
> the power-on and power-off scenarios.
> 
> But the controller driver still need to assert PERST# during the controller
> initialization. So only skip the deassert if pwrctrl usage is detected. The
> pwrctrl framework will deassert PERST# after turning on the supplies.
> 
> The usage of pwrctrl framework is detected based on the new DT binding
> i.e., with the presence of PERST# and PHY properties in the Root Port node
> instead of the host bridge node.
> 
> When the legacy binding is used, PERST# is only controlled by the
> controller driver since it is not reliable to detect whether pwrctrl is
> used or not. So the legacy platforms are untouched by this commit.
> 
> Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c |  1 +
>  drivers/pci/controller/dwc/pcie-designware.h      |  1 +
>  drivers/pci/controller/dwc/pcie-qcom.c            | 26 ++++++++++++++++++++++-
>  3 files changed, 27 insertions(+), 1 deletion(-)

> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 620ac7cf09472b84c37e83ee3ce40e94a1d9d878..61e1d0d6469030c549328ab4d8c65d5377d525e3 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c

> @@ -1724,6 +1730,12 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>  	if (ret)
>  		return ret;
>  
> +	devfn = of_pci_get_devfn(node);
> +	if (devfn < 0)
> +		return -ENOENT;
> +
> +	pp->perst[PCI_SLOT(devfn)] = reset;

It seems like you assume a well-written device tree, such that this
PCI_SLOT(devfn) doesn't overflow the perst[] array. It seems like we
should guard against that somehow.

Also see my comment below, where I believe even a well-written device
tree could trip this up.

> +
>  	port->reset = reset;
>  	port->phy = phy;
>  	INIT_LIST_HEAD(&port->list);
> @@ -1734,10 +1746,20 @@ static int qcom_pcie_parse_port(struct qcom_pcie *pcie, struct device_node *node
>  
>  static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>  {
> +	struct dw_pcie_rp *pp = &pcie->pci->pp;
>  	struct device *dev = pcie->pci->dev;
>  	struct qcom_pcie_port *port, *tmp;
> +	int child_cnt;
>  	int ret = -ENOENT;
>  
> +	child_cnt = of_get_available_child_count(dev->of_node);

I think you're assuming "available children" correlate precisely with a
0-indexed array of ports. But what if, e.g., port 0 is disabled in the
device tree, and only port 1 is available? Then you'll overflow.

> +	if (!child_cnt)
> +		return ret;
> +
> +	pp->perst = kcalloc(child_cnt, sizeof(struct gpio_desc *), GFP_KERNEL);

IIUC, you kfree() this on error, but otherwise, you never free it. I
also see that this driver can't actually be unbound (commit f9a666008338
("PCI: qcom: Make explicitly non-modular")), so technically there's no
way to "leak" this other than by probe errors...
...but it still seems like devm_*() would fit better.

(NB: I'm not sure I agree with commit f9a666008338 that "[driver unbind]
doesn't have a sensible use case anyway". That just sounds like
laziness. And it *can* have a useful purpose for testing.)

Brian

> +	if (!pp->perst)
> +		return -ENOMEM;
> +
>  	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
>  		ret = qcom_pcie_parse_port(pcie, of_port);
>  		if (ret)
 

