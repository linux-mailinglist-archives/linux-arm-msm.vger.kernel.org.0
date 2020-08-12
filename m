Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B54E242EAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 20:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgHLSr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 14:47:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:47408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgHLSr6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 14:47:58 -0400
Received: from onda.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6DCF52087C;
        Wed, 12 Aug 2020 18:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597258077;
        bh=v/XlzfHL4Q72/njOg1/Q9GwW5syrcPhwcxwKUuKnTYo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=2Zp4sO+xad3AfisPsiq3F/tr7slWvRTc07BpTBjN4wft0fhXyo/2SFHBjHG5Jg0eb
         xtzwHRcaFT3Jryk2XC7/2GdmmvIkziY3pT6L6613ow2VbIoDF2Hgd8GmAEsydhgCYZ
         OJo+5Z+LPt7fWv6JGlDkjt5PCgmRU+IT4XMlR9r0=
Date:   Wed, 12 Aug 2020 15:47:52 -0300
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 00/44] SPMI patches needed by Hikey 970
Message-ID: <20200812154752.3223b9d8@onda.lan>
In-Reply-To: <305f0df155e89e0c626b8f7366c4ab5f6741aedd.camel@perches.com>
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
        <305f0df155e89e0c626b8f7366c4ab5f6741aedd.camel@perches.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Em Wed, 12 Aug 2020 10:13:51 -0700
Joe Perches <joe@perches.com> escreveu:

> Perhaps these trivial bits on top:

Sounds fine for me. Feel free to send it with your SOB, adding my reviewed by:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  drivers/staging/hikey9xx/hi6421-spmi-pmic.c     |  5 +++--
>  drivers/staging/hikey9xx/hi6421v600-regulator.c |  6 +++---
>  drivers/staging/hikey9xx/hisi-spmi-controller.c | 21 +++++++++++++--------
>  3 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
> index 76766e7b8bf9..9d73458ca65a 100644
> --- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
> +++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
> @@ -99,7 +99,7 @@ int hi6421_spmi_pmic_write(struct hi6421_spmi_pmic *pmic, int reg, u32 val)
>  EXPORT_SYMBOL(hi6421_spmi_pmic_write);
>  
>  int hi6421_spmi_pmic_rmw(struct hi6421_spmi_pmic *pmic, int reg,
> -			  u32 mask, u32 bits)
> +			 u32 mask, u32 bits)
>  {
>  	unsigned long flags;
>  	u32 data;
> @@ -130,7 +130,8 @@ static irqreturn_t hi6421_spmi_irq_handler(int irq, void *data)
>  		hi6421_spmi_pmic_write(pmic, (i + pmic->irq_addr), pending);
>  
>  		/* solve powerkey order */
> -		if ((i == HISI_IRQ_KEY_NUM) && ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
> +		if ((i == HISI_IRQ_KEY_NUM) &&
> +		    ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
>  			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_DOWN]);
>  			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_UP]);
>  			pending &= (~HISI_IRQ_KEY_VALUE);
> diff --git a/drivers/staging/hikey9xx/hi6421v600-regulator.c b/drivers/staging/hikey9xx/hi6421v600-regulator.c
> index 29ef6bcadd84..82635ff54a74 100644
> --- a/drivers/staging/hikey9xx/hi6421v600-regulator.c
> +++ b/drivers/staging/hikey9xx/hi6421v600-regulator.c
> @@ -227,7 +227,7 @@ static int hi6421_spmi_dt_parse(struct platform_device *pdev,
>  
>  	ret = of_property_read_u32(np, "reg", &rdesc->enable_reg);
>  	if (ret) {
> -		dev_err(dev, "missing reg property\nn");
> +		dev_err(dev, "missing reg property\n");
>  		return ret;
>  	}
>  
> @@ -303,13 +303,13 @@ static int hi6421_spmi_dt_parse(struct platform_device *pdev,
>  	 */
>  	rdesc->vsel_mask = (1 << (fls(rdesc->n_voltages) - 1)) - 1;
>  
> -	dev_dbg(dev, "voltage selector settings: reg: 0x%x, mask: 0x%x",
> +	dev_dbg(dev, "voltage selector settings: reg: 0x%x, mask: 0x%x\n",
>  		rdesc->vsel_reg, rdesc->vsel_mask);
>  
>  	return 0;
>  }
>  
> -static struct regulator_ops hi6421_spmi_ldo_rops = {
> +static const struct regulator_ops hi6421_spmi_ldo_rops = {
>  	.is_enabled = hi6421_spmi_regulator_is_enabled,
>  	.enable = hi6421_spmi_regulator_enable,
>  	.disable = hi6421_spmi_regulator_disable,
> diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/staging/hikey9xx/hisi-spmi-controller.c
> index 583df10cbf1a..513d962b8bce 100644
> --- a/drivers/staging/hikey9xx/hisi-spmi-controller.c
> +++ b/drivers/staging/hikey9xx/hisi-spmi-controller.c
> @@ -102,7 +102,7 @@ static int spmi_controller_wait_for_done(struct device *dev,
>  			return 0;
>  		}
>  		udelay(1);
> -	}  while(timeout--);
> +	} while (timeout--);
>  
>  	dev_err(dev, "%s: timeout, status 0x%x\n", __func__, status);
>  	return -ETIMEDOUT;
> @@ -121,7 +121,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
>  
>  	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
>  		dev_err(&ctrl->dev,
> -			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
> +			"spmi_controller supports 1..%d bytes per trans, but:%ld requested\n",
>  			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
>  		return  -EINVAL;
>  	}
> @@ -137,7 +137,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
>  		op_code = SPMI_CMD_EXT_REG_READ_L;
>  		break;
>  	default:
> -		dev_err(&ctrl->dev, "invalid read cmd 0x%x", opc);
> +		dev_err(&ctrl->dev, "invalid read cmd 0x%x\n", opc);
>  		return -EINVAL;
>  	}
>  
> @@ -157,7 +157,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
>  		goto done;
>  
>  	for (i = 0; bc > i * SPMI_PER_DATAREG_BYTE; i++) {
> -		data = readl(spmi_controller->base + chnl_ofst + SPMI_SLAVE_OFFSET * slave_id + SPMI_APB_SPMI_RDATA0_BASE_ADDR + i * SPMI_PER_DATAREG_BYTE);
> +		data = readl(spmi_controller->base + chnl_ofst +
> +			     SPMI_SLAVE_OFFSET * slave_id +
> +			     SPMI_APB_SPMI_RDATA0_BASE_ADDR +
> +			     i * SPMI_PER_DATAREG_BYTE);
>  		data = be32_to_cpu((__be32)data);
>  		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
>  			memcpy(buf, &data, sizeof(data));
> @@ -194,7 +197,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
>  
>  	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
>  		dev_err(&ctrl->dev,
> -			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
> +			"spmi_controller supports 1..%d bytes per trans, but:%ld requested\n",
>  			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
>  		return  -EINVAL;
>  	}
> @@ -210,7 +213,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
>  		op_code = SPMI_CMD_EXT_REG_WRITE_L;
>  		break;
>  	default:
> -		dev_err(&ctrl->dev, "invalid write cmd 0x%x", opc);
> +		dev_err(&ctrl->dev, "invalid write cmd 0x%x\n", opc);
>  		return -EINVAL;
>  	}
>  
> @@ -234,8 +237,10 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
>  		}
>  
>  		writel((u32)cpu_to_be32(data),
> -		       spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_WDATA0_BASE_ADDR + SPMI_PER_DATAREG_BYTE * i);
> -	};
> +		       spmi_controller->base + chnl_ofst +
> +		       SPMI_APB_SPMI_WDATA0_BASE_ADDR +
> +		       SPMI_PER_DATAREG_BYTE * i);
> +	}
>  
>  	/* Start the transaction */
>  	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);
> 
> 
