Return-Path: <linux-arm-msm+bounces-59982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E69AC9EF8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 17:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33A757A6C26
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Jun 2025 15:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8B41E0DE3;
	Sun,  1 Jun 2025 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DoMgpcIr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1C91CEAA3
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jun 2025 15:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748791327; cv=none; b=Zi5WLRgTP8GCPvLCqUXI7RSkJs3blpd56Y/GhgBLCKtvh5QAKi4HvihJzMoXpZdrRnum8y71YatEI1ZYbVdWpUwABXawiUrQcGn6DRfymoVrs/GVNFBOmpbHnva8s85eEUR9MN2fjs/QIVSdKeH0lRsSI2f4sp9BRNYqFSnj1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748791327; c=relaxed/simple;
	bh=ZWlsEbLLjAaCv4BuA8/UppFHgvPukzjx4SMXwLnm5Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnmtxuskCC2+TZmP532zYrdmUjV8gsjNo0eYf5Wa6vlC0DfvNjMBrmdjXCtXq89JpPcYDHx9Rxyn8XMw4o0fTZLpqCqAbisJSAZrIfLRo2j+OSrnfor6BVvvZRzvPdyfyN7VS4f+UbKNWWRSQNIVSOL55UVm84OL5t/9VqwLCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DoMgpcIr; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23526264386so23420205ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748791325; x=1749396125; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eXW1/YM5zz+CF3xJy+mpJXWMMDbrJMLFqUUrCR702J4=;
        b=DoMgpcIr3+j9jveptIHnnmhjxXlkroqXJsX5WHePW9RilVbjMJXQzeZq9W6MmNURQT
         bHN8OBFkR5IZvBHHQHPp/8GHUllsV1xnG9jx84vBntsyRA2KUgJenoFQswm/JolTCIQe
         8s/6T0PMBiqrsR1Hh7yc4mgQf67HRvW0pYu5m54Q4RB/9XlqUaWxUFQNeZ4HDqnmQhyr
         lSFZfbLCOlpAOzcGG0Ydis21FhvGjcUuBQ0g09cTKGyyq22spNX1TZT3/5cVxpioZ8hP
         ZoBXeGlu2XNNBKWiwYgrmRgH34s3eWeygnHbbTOSoQ3TRfDG5WTHrM1GJlCcJZe1ETLy
         79oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748791325; x=1749396125;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXW1/YM5zz+CF3xJy+mpJXWMMDbrJMLFqUUrCR702J4=;
        b=lLFheY/4BEJDep+1K23YawPIXKsm9Pc95JHtBS/FhPVU9H5aeLpQbA7bamur+HJjyV
         ljUI7/FUtujraPTIKwj0l8RgO+z63jndCt2OA7MTZ25glXsaCjAbAepFxj+rMyrFqOQZ
         fZEgwTSHVpgP593vo3FOnIt28QtjmKD/0toXKRYc5xBw8ff+KnoqOTgUsOFcWFSxQoxr
         Nq38HpZ827o3b0jJKOKP6/5UkF0UZ7xVGbpf8if5NZ1mmtl+yVBTPu7PPjCuq7Zec71I
         ucDXsQo01SZjqCeknXGKV0QYe9KXLaXNkROIaMiHa5QctEXVr2YKmgccBXqH3Tb26Jsq
         pPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwKne+dEeHn0kCGwhvm1Rko+xGmW/gWwhF3gKLFV5Ueii5BmNTxCNKOYN4elMt8S9qhtpgimFL4yVtUYjf@vger.kernel.org
X-Gm-Message-State: AOJu0YygewcuKSvSwplPCApZ9R4+z6FznAydBF9aUxX1TWhW5JzSIoV5
	GoRh7q3Tj2mvZL9OczOccZhVdwY63q0ufCOZ3iA5tLqpx8kOgX7E0Fi+ygoMOLjOEA==
X-Gm-Gg: ASbGncsMLZW3vvO+SCFeNz9LxN3uezEaYqHI6DxF8MTWdCGAEJusL8Qd4ePcup8cowz
	Ugx18xFay/VUGfD36Ker6sn+u+1cutSAezSdwg+SgYGgU5FqXobF8rlDqbgh+2ih1F1F0o/X5/Z
	cNMljqXTt1KHBPgSRBMH0ylJGQfjY0V8g5PnPnhPvim+8f5eOuf4iaeQ1JzKhvinW9qT36kx3oL
	vbuui8qVbS7K4HJvsdZ6DP2vWHZg9gBkDRo/Jr9rrcTrqj2ktkJyWIUs4I2aTNFNiLYNsiZh2Ug
	YhAikknmZr4nGm14DJ/gDFlmSH2xpWBGqdqAPR3o2N8W9UqDaO4z0TD5xuSgSuI=
X-Google-Smtp-Source: AGHT+IEJfc8pHNvgATHLpZnaIzj8JyRGFCc9pjej88kFaniJEBRrgyJVFmdFH5e4bqy8CSn/z6tt1w==
X-Received: by 2002:a17:902:ec90:b0:234:be9b:539a with SMTP id d9443c01a7336-2355f9ef410mr75898605ad.40.1748791325354;
        Sun, 01 Jun 2025 08:22:05 -0700 (PDT)
Received: from thinkpad ([120.56.205.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d21f4bsm56574435ad.250.2025.06.01.08.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 08:22:04 -0700 (PDT)
Date: Sun, 1 Jun 2025 20:51:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Helgaas <bhelgaas@google.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v2 2/2] PCI: Add support for PCIe wake interrupt
Message-ID: <543ocn4vecyjej26ynjggm6zwj7bmn27rd6c4foo36gvxeltma@6d5dfdoscxwm>
References: <20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com>
 <20250419-wake_irq_support-v2-2-06baed9a87a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250419-wake_irq_support-v2-2-06baed9a87a1@oss.qualcomm.com>

On Sat, Apr 19, 2025 at 11:13:04AM +0530, Krishna Chaitanya Chundru wrote:

Subject prefix should be 'PCI/portdrv'

> PCIe wake interrupt is needed for bringing back PCIe device state
> from D3cold to D0.
> 
> Implement new functions, of_pci_setup_wake_irq() and
> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
> using the Device Tree.
> 
> From the port bus driver call these functions to enable wake support
> for bridges.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/of.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/pci/pci.h          |  6 +++++
>  drivers/pci/pcie/portdrv.c | 12 +++++++++-
>  3 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index ab7a8252bf4137a17971c3eb8ab70ce78ca70969..13623797c88a03dfb9d9079518d87a5e1e68df38 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -7,6 +7,7 @@
>  #define pr_fmt(fmt)	"PCI: OF: " fmt
>  
>  #include <linux/cleanup.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
> @@ -15,6 +16,7 @@
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>  #include "pci.h"
>  
>  #ifdef CONFIG_PCI
> @@ -966,3 +968,61 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>  	return slot_power_limit_mw;
>  }
>  EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +
> +/**
> + * of_pci_setup_wake_irq - Set up wake interrupt for PCI device

This function is for setting up the wake interrupt for slot, not for endpoint
devices, isn't it? Then it should be named as such:

	of_pci_slot_setup_wake_irq()

> + * @pdev: The PCI device structure
> + *
> + * This function sets up the wake interrupt for a PCI device by getting the
> + * corresponding GPIO pin from the device tree, and configuring it as a

s/GPIO pin/WAKE# GPIO

> + * dedicated wake interrupt.
> + *
> + * Return: 0 if the wake gpio is not available or successfully parsed else

s/wake gpio/WAKE# GPIO

> + * errno otherwise.
> + */
> +int of_pci_setup_wake_irq(struct pci_dev *pdev)
> +{
> +	struct gpio_desc *wake;
> +	struct device_node *dn;
> +	int ret, wake_irq;
> +
> +	dn = pci_device_to_OF_node(pdev);
> +	if (!dn)
> +		return 0;
> +
> +	wake = devm_fwnode_gpiod_get(&pdev->dev, of_fwnode_handle(dn),
> +				     "wake", GPIOD_IN, NULL);
> +	if (IS_ERR(wake)) {
> +		dev_warn(&pdev->dev, "Cannot get wake GPIO\n");

WAKE# is an optional GPIO. So the driver should not warn users if it is not
defined in the root port node. It should however print the error log and return
errno, if the API returns other than -ENOENT.

> +		return 0;
> +	}
> +
> +	wake_irq = gpiod_to_irq(wake);
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
> +		device_init_wakeup(&pdev->dev, false);
> +		return ret;
> +	}
> +	irq_set_irq_type(wake_irq, IRQ_TYPE_EDGE_FALLING);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_pci_setup_wake_irq);
> +
> +/**
> + * of_pci_teardown_wake_irq - Teardown wake interrupt setup for PCI device

Same comment as above.

> + *
> + * @pdev: The PCI device structure
> + *
> + * This function tears down the wake interrupt setup for a PCI device,
> + * clearing the dedicated wake interrupt and disabling device wake-up.
> + */
> +void of_pci_teardown_wake_irq(struct pci_dev *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +}
> +EXPORT_SYMBOL_GPL(of_pci_teardown_wake_irq);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index b81e99cd4b62a3022c8b07a09f212f6888674487..b2f65289f4156fa1851c2d2f20c4ca948f36258f 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -888,6 +888,9 @@ void pci_release_of_node(struct pci_dev *dev);
>  void pci_set_bus_of_node(struct pci_bus *bus);
>  void pci_release_bus_of_node(struct pci_bus *bus);
>  
> +int of_pci_setup_wake_irq(struct pci_dev *pdev);
> +void of_pci_teardown_wake_irq(struct pci_dev *pdev);
> +
>  int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>  bool of_pci_supply_present(struct device_node *np);
>  
> @@ -931,6 +934,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>  	return 0;
>  }
>  
> +static int of_pci_setup_wake_irq(struct pci_dev *pdev) { return 0; }
> +static void of_pci_teardown_wake_irq(struct pci_dev *pdev) { }
> +

Provide stub for these APIs if CONFIG_OF is not enabled.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

