Return-Path: <linux-arm-msm+bounces-44990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 727B2A10451
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70893188785B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5013DABE3;
	Tue, 14 Jan 2025 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmzPRxu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83B3DABE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736850901; cv=none; b=ci6aYTdP5kjzGJxGYyuj9EkKl+vMX0IR4YZOV9SBCK5H5ZffUw8Y/QxtU2fag+nP058yNZW9JjZclADwlns9zhO8cTXKWanOkzfbFFEMCWFwA1iZn6hIn6LjY5kok4q+KvCrE3WP/jOvHPKJN6L0j+yQV6zo5JqysjHixWJk8Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736850901; c=relaxed/simple;
	bh=oBY+3eZc51Y6fF6g/l8GEc6MeyGaj+xttfDQd4bfPhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMgvJSVh0DWvY8I1qjJmGY2TZ8CBr+ZA4l5urQhHwYnaolL1DrWUtBsLdcSPw16o7TiuylkySJ/sWDNz0kgD+2zCeomnyHGCWaHIkoS0oDhe0ZGuFEPAFZUDABCuQmgHFNVo8cdRbeGolsyxq/ajt4o2koSbT6s0YLrur6l2/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmzPRxu/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4950958e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 02:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736850897; x=1737455697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=;
        b=gmzPRxu/O9WthVoXIcfrpQWp3mNRQRuQnLIFI+Yk2GGYuFtoEvFABbxrLFbzFyKli6
         lB0LnXCU+44vF4KjLCogQoXIbDhLL79r1bkO+uPkupWeNFz3thx7uwjZXCvnXw7s/EG8
         zZhPuyPYsU+SNfvgVt4UBXK4l1TpnbWhsR7Kpk0Sy0jPBayJ5kkjQnh5AIC1RhFmutCr
         FIxJ1a9VRFpGAPDW/VpEk230NiTOwUqq6Db/lGtKSrqGaEL30DQE04qPtaie7A0x6K7H
         MmRrhlCtprYLwBtj6ayfANmNp2xd0yzpkr0XUBJxhwVfovZ+fxTx5fMFFuREAwwpdTz8
         tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736850897; x=1737455697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T82zNstFBnDSTTkW/x3AxhknKVdFYWE7bW1yyO8UUJc=;
        b=vq2WCuovqJfq9GL3nUM3nhyGYXlvn8UxRlRLjp0j9ZFJglPsHxkddmfSKDVBn/QbLo
         p073lbE9bm96YQTzPCfEsrhcW5u1gXFxTK0J5CTtcfqWCkA5SjjAqFyh2mbRxAJe6JTY
         I2bu7j4zhKZOkmbkbE6wEvTRuluY/pTeBP6ikYWGNmekFoCt/sBHY9DZFRUXUNrlIg32
         WReI2lzRwikKIWCIJBYuGdEDrcFFOcVbV/TC20QZZnY4AmdM8Hhbg4PocLHCbykMtiZC
         gyfBsRI+8BOpUdvWEp6x/9KWz+nnMwx++Qs3uPUlj9/AVRUer2v3Z8hqfI9yGOhIBPUx
         yYew==
X-Forwarded-Encrypted: i=1; AJvYcCVoxpcTUEKpl8o8XUnJWPbp9uPmclFEpvnXTWrXfEPuKPR0s+OJyLbFDDIyuMjoDUlsIQ1hToMh1oTU8cQz@vger.kernel.org
X-Gm-Message-State: AOJu0YwWITkfsPJMe0OBIZmMG4KkOHmK4QreknwPl3PhhI8JROCrvr4w
	AUNsQ6Oh12Orz2wB9RaPThrCh952fac5rj2wpKIwgiImZnYDfY2bGGAQclfIxa0=
X-Gm-Gg: ASbGncvynFdnpxpdOe7jSuTFvN7q4qFYQMyN/7GKRDM5akbNxKPe+CtZfFse7rS1UuO
	ftjhoT+E5WBaIvcFcMSHj5V41G/bl5UuRkomjolM+EMmBd7W4C8HA9y9//ICzmr/8Kch4yHCrPK
	ve2/sWgyZkzCI/+Hml726gZQT4IcCLxvY+0a1siiqNcjWYGDK/5imrsw0I81PFz5XlCpOXvGGWs
	9xutalBYBI1IFCOi6Yqqd0D5TPNlUZzggIAnydNPgWOaPGhNP/UFhFaUYbqAehHgZVgaZ1DJU+k
	CA5nz18mT1LjijvpftwNv9QZcgS/pndeAc+k
X-Google-Smtp-Source: AGHT+IFwrbLGTrG2dyiu5uP2+GJnDGK0/StK5LmN5McezpTF9gNRaaageIc+tg7gnEcGTINdnMPa7w==
X-Received: by 2002:a05:6512:ba9:b0:540:2223:9b20 with SMTP id 2adb3069b0e04-542845d1b75mr6413752e87.53.1736850897244;
        Tue, 14 Jan 2025 02:34:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49ee9sm1623927e87.52.2025.01.14.02.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:34:56 -0800 (PST)
Date: Tue, 14 Jan 2025 12:34:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/7] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <rpwm6gimdb4zyvyusovfbfaw4uxrossm6elayebvt2gusb7zwk@67w7672qpcto>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-5-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:11PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> On SM8750, the eUSB2 PHY used is M31 based. Add the initialization
> sequences to bring it out of reset, and to initialize the associated eUSB2
> repeater as well.

What does M31 mean? What is the relationship between the eUSB and USB
M31 PHYs?

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig              |  12 +-
>  drivers/phy/qualcomm/Makefile             |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 269 ++++++++++++++++++++++++++++++
>  3 files changed, 281 insertions(+), 1 deletion(-)

Please run the patch through checkpatch.pl --strict

> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..e15529673e358db914936a60fa605c872cd2511a
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#define USB_PHY_UTMI_CTRL0		(0x3c)
> +
> +#define USB_PHY_UTMI_CTRL5		(0x50)
> +
> +#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
> +#define FSEL				(0x7 << 4)

GENMASK()

> +#define FSEL_38_4_MHZ_VAL		(0x6 << 4)

FIELD_PREP

> +
> +#define USB_PHY_HS_PHY_CTRL2		(0x64)
> +
> +#define USB_PHY_CFG0			(0x94)
> +#define USB_PHY_CFG1			(0x154)
> +
> +#define USB_PHY_FSEL_SEL		(0xb8)
> +
> +#define USB_PHY_XCFGI_39_32		(0x16c)
> +#define USB_PHY_XCFGI_71_64		(0x17c)
> +#define USB_PHY_XCFGI_31_24		(0x168)
> +#define USB_PHY_XCFGI_7_0		(0x15c)
> +
> +#define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
> +{				\
> +	.off = o,		\
> +	.mask = b,		\
> +	.val = v,		\
> +}
> +
> +struct m31_phy_tbl_entry {
> +	u32 off;
> +	u32 mask;
> +	u32 val;
> +};
> +
> +struct m31_eusb2_priv_data {
> +	const struct m31_phy_tbl_entry	*setup_seq;
> +	unsigned int			setup_seq_nregs;
> +	const struct m31_phy_tbl_entry	*override_seq;
> +	unsigned int			override_seq_nregs;
> +	const struct m31_phy_tbl_entry	*reset_seq;
> +	unsigned int			reset_seq_nregs;
> +	unsigned int			fsel;
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG1, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_FSEL_SEL, BIT(0), 1),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, GENMASK(3, 2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, GENMASK(3, 0), 7),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, GENMASK(2, 0), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_7_0, GENMASK(1, 0), 0),
> +};
> +
> +static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(2), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, BIT(0), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(1), 1),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, BIT(2), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, BIT(1), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, BIT(3), 0),
> +	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, BIT(1), 0),
> +};
> +
> +struct m31eusb2_phy {
> +	struct phy			*phy;
> +	void __iomem			*base;
> +	const struct m31_eusb2_priv_data	*data;
> +
> +	struct regulator		*vreg;
> +	struct clk			*clk;
> +	struct reset_control		*reset;
> +
> +	struct phy *repeater;
> +};
> +
> +static void msm_m31_eusb2_write_readback(void __iomem *base, u32 offset,
> +					const u32 mask, u32 val)
> +{
> +	u32 write_val, tmp = readl_relaxed(base + offset);
> +
> +	tmp &= ~mask;
> +	write_val = tmp | val;
> +
> +	writel_relaxed(write_val, base + offset);
> +
> +	tmp = readl_relaxed(base + offset);
> +	tmp &= mask;
> +
> +	if (tmp != val)
> +		pr_err("write: %x to offset: %x FAILED\n", val, offset);
> +}
> +
> +static void m31eusb2_phy_write_sequence(struct m31eusb2_phy *phy,
> +					const struct m31_phy_tbl_entry *tbl,
> +					int num)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < num; i++, tbl++) {
> +		dev_dbg(&phy->phy->dev, "Offset:%x BitMask:%x Value:%x",
> +					tbl->off, tbl->mask, tbl->val);
> +
> +		msm_m31_eusb2_write_readback(phy->base,
> +					tbl->off, tbl->mask,
> +					tbl->val << __ffs(tbl->mask));

could you please check, what actually gets written? I suspect there
should be a -1 here.

> +	}
> +}
> +
> +static int m31eusb2_phy_init(struct phy *uphy)
> +{
> +	struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
> +	const struct m31_eusb2_priv_data *data = phy->data;
> +	int ret;
> +
> +	ret = regulator_enable(phy->vreg);
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = phy_init(phy->repeater);
> +	if (ret) {
> +		dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
> +		goto disable_vreg;
> +	}
> +
> +	if (ret) {
> +		dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		goto disable_repeater;
> +	}
> +
> +	/* Perform phy reset */
> +	reset_control_assert(phy->reset);
> +	udelay(5);
> +	reset_control_deassert(phy->reset);
> +
> +	m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
> +	msm_m31_eusb2_write_readback(phy->base,
> +					USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
> +					data->fsel);
> +	m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
> +	m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
> +
> +	return 0;
> +
> +disable_repeater:
> +	phy_exit(phy->repeater);
> +disable_vreg:
> +	regulator_disable(phy->vreg);
> +
> +	return 0;
> +}
> +

-- 
With best wishes
Dmitry

