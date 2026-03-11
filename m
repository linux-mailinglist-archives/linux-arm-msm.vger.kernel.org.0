Return-Path: <linux-arm-msm+bounces-96896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGV+Fd0csWmOqwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:42:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0725E1E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB5D3303A3E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 07:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BE13B2FE2;
	Wed, 11 Mar 2026 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaDeYa6H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EA43B19B2;
	Wed, 11 Mar 2026 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773214935; cv=none; b=RHJnLOdw6vZ8+BqXtw3SL/Ri0fHDK3H9NixfmzgFWxZv1g7B9ARSPedhle5heTcKDvVHBOY7gYrb+ZOm/+YHNqOyOJwFJPWEi5DGEfnZm57jLlzAs6iwf9vKGBS70xL8tXurH7RHBRW78edTBcbXwiE4psA+ilo3SI3JtxWraZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773214935; c=relaxed/simple;
	bh=QeLzGLF8CNjkYSPppK6zWOOzDKT7ad73s5qPIAspWWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VY9CBDF6CEgczuFoRa3OJNHifwgvtULe/LKqXjA29roKf+jqr4mV4RoNikCEo1RReu5RzdNf1Q2apNgfEUusKP1ygEnLUcXEwbhK0T1si9C15fiIFtVsOnbRz5LZ9Hlm3catZS+wBk4JdNUu3a0TJ+5de6KGBQG7z4PN75Za8AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaDeYa6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652C0C4CEF7;
	Wed, 11 Mar 2026 07:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773214935;
	bh=QeLzGLF8CNjkYSPppK6zWOOzDKT7ad73s5qPIAspWWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IaDeYa6HVLa5+Y+GeU4WjTVwOsw2dslf81mBsXvq4uvNyyVpVoQLS0E6dgtOZSR+z
	 20OEJPhAX7rrfue/1OOZHoQPpiKzLp+h3m+/RaKNbFn/zcW4opLrFuZJrE46dO0wgS
	 20AC+JAsRromrO84+WIlL2bXLxGjx3E+EwF/eZRLmXMT7nrJNxUELfuiZYj7yH4YdV
	 pxx9T/NOF3BfiUwdw58jaYYcPxHvQ5T1IOPBxUfoe1IBi575PZmoA2Cf1rrPsqqfxy
	 /xblIbH0T4EuLRcyX185vyZ93GjXW3yyhofcwCum6r49Iefw07Pm/jRQmzN4xDEzMj
	 O1lVEbYwPD8iQ==
Message-ID: <604e98e6-dd40-4b44-92c4-5164c02cb996@kernel.org>
Date: Wed, 11 Mar 2026 07:42:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/10] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 jic23@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, srini@kernel.org,
 vkoul@kernel.org, neil.armstrong@linaro.org, sre@kernel.org,
 sboyd@kernel.org, krzk@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 quic_wcheng@quicinc.com, melody.olvera@oss.qualcomm.com,
 quic_nsekar@quicinc.com, ivo.ivanov.ivanov1@gmail.com, abelvesa@kernel.org,
 luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
 mitltlatltl@gmail.com, krishna.kurapati@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260114092742.13231-1-angelogioacchino.delregno@collabora.com>
 <20260114092742.13231-6-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260114092742.13231-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 10D0725E1E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96896-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,arndb.de,linuxfoundation.org,linaro.org,oss.qualcomm.com,quicinc.com,gmail.com,fairphone.com,vger.kernel.org,lists.infradead.org,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email]
X-Rspamd-Action: no action



On 1/14/26 9:27 AM, AngeloGioacchino Del Regno wrote:
> Some Qualcomm PMICs integrate a SDAM device, internally located in
> a specific address range reachable through SPMI communication.
> 
> Instead of using the parent SPMI device (the main PMIC) as a kind
> of syscon in this driver, register a new SPMI sub-device for SDAM
> and initialize its own regmap with this sub-device's specific base
> address, retrieved from the devicetree.
> 
> This allows to stop manually adding the register base address to
> every R/W call in this driver, as this can be, and is now, handled
> by the regmap API instead.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Am not sure what is the merge strategy, if you want me to take it via
nvmem tree, please let me know otherwise


Acked-by: Srinivas Kandagatla <srini@kernel.org>


--srini
>  drivers/nvmem/Kconfig          |  1 +
>  drivers/nvmem/qcom-spmi-sdam.c | 38 +++++++++++++++++++++++-----------
>  2 files changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index bf47a982cf62..5e924c869e77 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -368,6 +368,7 @@ config NVMEM_SNVS_LPGPR
>  config NVMEM_SPMI_SDAM
>  	tristate "SPMI SDAM Support"
>  	depends on SPMI
> +	select REGMAP_SPMI
>  	help
>  	  This driver supports the Shared Direct Access Memory Module on
>  	  Qualcomm Technologies, Inc. PMICs. It provides the clients
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> index 4f1cca6eab71..4974105dd963 100644
> --- a/drivers/nvmem/qcom-spmi-sdam.c
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -9,6 +9,7 @@
>  #include <linux/nvmem-provider.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/spmi.h>
>  
>  #define SDAM_MEM_START			0x40
>  #define REGISTER_MAP_ID			0x40
> @@ -20,7 +21,6 @@
>  struct sdam_chip {
>  	struct regmap			*regmap;
>  	struct nvmem_config		sdam_config;
> -	unsigned int			base;
>  	unsigned int			size;
>  };
>  
> @@ -73,7 +73,7 @@ static int sdam_read(void *priv, unsigned int offset, void *val,
>  		return -EINVAL;
>  	}
>  
> -	rc = regmap_bulk_read(sdam->regmap, sdam->base + offset, val, bytes);
> +	rc = regmap_bulk_read(sdam->regmap, offset, val, bytes);
>  	if (rc < 0)
>  		dev_err(dev, "Failed to read SDAM offset %#x len=%zd, rc=%d\n",
>  						offset, bytes, rc);
> @@ -100,7 +100,7 @@ static int sdam_write(void *priv, unsigned int offset, void *val,
>  		return -EINVAL;
>  	}
>  
> -	rc = regmap_bulk_write(sdam->regmap, sdam->base + offset, val, bytes);
> +	rc = regmap_bulk_write(sdam->regmap, offset, val, bytes);
>  	if (rc < 0)
>  		dev_err(dev, "Failed to write SDAM offset %#x len=%zd, rc=%d\n",
>  						offset, bytes, rc);
> @@ -110,8 +110,17 @@ static int sdam_write(void *priv, unsigned int offset, void *val,
>  
>  static int sdam_probe(struct platform_device *pdev)
>  {
> +	struct regmap_config sdam_regmap_config = {
> +		.reg_bits = 16,
> +		.val_bits = 8,
> +		.max_register = 0xff,
> +		.fast_io = true,
> +	};
>  	struct sdam_chip *sdam;
>  	struct nvmem_device *nvmem;
> +	struct spmi_device *sparent;
> +	struct spmi_subdevice *sub_sdev;
> +	struct device *dev = &pdev->dev;
>  	unsigned int val;
>  	int rc;
>  
> @@ -119,19 +128,23 @@ static int sdam_probe(struct platform_device *pdev)
>  	if (!sdam)
>  		return -ENOMEM;
>  
> -	sdam->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> -	if (!sdam->regmap) {
> -		dev_err(&pdev->dev, "Failed to get regmap handle\n");
> -		return -ENXIO;
> -	}
> +	sparent = to_spmi_device(dev->parent);
> +	sub_sdev = devm_spmi_subdevice_alloc_and_add(dev, sparent);
> +	if (IS_ERR(sub_sdev))
> +		return PTR_ERR(sub_sdev);
>  
> -	rc = of_property_read_u32(pdev->dev.of_node, "reg", &sdam->base);
> +	rc = device_property_read_u32(dev, "reg", &sdam_regmap_config.reg_base);
>  	if (rc < 0) {
> -		dev_err(&pdev->dev, "Failed to get SDAM base, rc=%d\n", rc);
> +		dev_err(dev, "Failed to get SDAM base, rc=%d\n", rc);
>  		return -EINVAL;
>  	}
>  
> -	rc = regmap_read(sdam->regmap, sdam->base + SDAM_SIZE, &val);
> +	sdam->regmap = devm_regmap_init_spmi_ext(&sub_sdev->sdev, &sdam_regmap_config);
> +	if (IS_ERR(sdam->regmap))
> +		return dev_err_probe(dev, PTR_ERR(sdam->regmap),
> +				     "Failed to get regmap handle\n");
> +
> +	rc = regmap_read(sdam->regmap, SDAM_SIZE, &val);
>  	if (rc < 0) {
>  		dev_err(&pdev->dev, "Failed to read SDAM_SIZE rc=%d\n", rc);
>  		return -EINVAL;
> @@ -159,7 +172,7 @@ static int sdam_probe(struct platform_device *pdev)
>  	}
>  	dev_dbg(&pdev->dev,
>  		"SDAM base=%#x size=%u registered successfully\n",
> -		sdam->base, sdam->size);
> +		sdam_regmap_config.reg_base, sdam->size);
>  
>  	return 0;
>  }
> @@ -181,3 +194,4 @@ module_platform_driver(sdam_driver);
>  
>  MODULE_DESCRIPTION("QCOM SPMI SDAM driver");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("SPMI");


