Return-Path: <linux-arm-msm+bounces-7180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE482CBF0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 11:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879DB1F21891
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 10:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D1620DC6;
	Sat, 13 Jan 2024 10:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="acad1NjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0178517BC8
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 10:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55818b733f7so5755043a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 02:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705142578; x=1705747378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UMsaz3V55EldnOohrJxE/w54JgAQsf7G30bRTdJho7s=;
        b=acad1NjHXJWLJ3PnF5GuGD9aj5uj5FtVvtMOCRbsXd8e12yH14fJZ0a8nxtAcSYP/O
         l41Wsxqy1GA88jF/00O3B3d/122Nd1ZMv9d7NGUjC4MWJZdyWVF08dQOZVx0Xlrq6PEF
         AET/UIXAht1yp9nLnxkyIcDOBSmj+d6nXOhKk8KCTrZLNtaUWbIxOmUgPuYgaaOrrYp7
         QcMoVTLXccosTADVJO3gAucsEZXJ2TbGvT21QA+Vt+7uIY0Y4ThdHfQMHuqUZgVWsUln
         r/tVZK7TtLu0TYl8EPomHg+Vp4yVZ8MlowpQz759Py24JpJ8YXPAsWONqSHldI/11aMR
         LloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705142578; x=1705747378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMsaz3V55EldnOohrJxE/w54JgAQsf7G30bRTdJho7s=;
        b=C7jcSJ1/wmDXTxvWfoOpKnwQDUXUJmnuwS7JJJnywsM5vzOgbmVl+miFflDLHtnxt+
         P+jng7fFBekyAuiwP0x0gp/hzXu3/W1tqdvqU+axTck/+F0ymByB3l7h3P7oWwfoBvYz
         RaqC6YLrsTju1ilb8OAtPMA4F7Jeiou74obXZBWYl2zh/wJWxSqehLm2agiPxabgAeyH
         +tH1nShe7MEfATZMWQh+vW+F7ZAdgk/wc62A23Uuaw9Kryh8v4MXF6oCT2Zmps+GIV4S
         UpaRk7NDYpCnf8gSXQUeG3zjCJrX6vmhYU9dZRCPLZ0i9DWRWwd/F9YNaNHU2lo4eavV
         2ZdQ==
X-Gm-Message-State: AOJu0YzEo59QPRgqYIbpDekIOZxYbBA05ruGq6wjceKr2v1SpfgnkFUu
	viZ489e+FZKoLqT95TIeDJOCJdE1Yi+HmQ==
X-Google-Smtp-Source: AGHT+IEDhUHuow5cUnfaDZxShK3gwQeACAUbNraZ6Glsem2Hp2gjkSqCqIaszZQpe4nB/zJNZo3qOQ==
X-Received: by 2002:a17:907:1706:b0:a2d:45c2:5f8d with SMTP id le6-20020a170907170600b00a2d45c25f8dmr159504ejc.121.1705142578253;
        Sat, 13 Jan 2024 02:42:58 -0800 (PST)
Received: from [192.168.174.25] (178235179017.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.17])
        by smtp.gmail.com with ESMTPSA id c17-20020a170906695100b00a26e53be089sm2740787ejs.44.2024.01.13.02.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 02:42:57 -0800 (PST)
Message-ID: <f6ec016e-7319-42a7-8ca3-06f21a7ab6e5@linaro.org>
Date: Sat, 13 Jan 2024 11:42:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] phy: qcom: qmp-usb: split USB-C PHY driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-7-de7dfd459353@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240113-pmi632-typec-v1-7-de7dfd459353@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.01.2024 06:42, Dmitry Baryshkov wrote:
> In preparation to adding Type-C handling for MSM8998, QCM2290 and SM6115
> platforms, create new QMP USB-C PHY driver by splitting mentioned
> platforms to a separate file. In future it will also be extended with
> support for the DisplayPort handling. It will also be reused later for
> such platforms as SDM660, SM6125, SM6150.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]


> +#include "phy-qcom-qmp.h"
> +#include "phy-qcom-qmp-pcs-misc-v3.h"
> +
> +/* QPHY_SW_RESET bit */
> +#define SW_RESET				BIT(0)
> +/* QPHY_POWER_DOWN_CONTROL */
> +#define SW_PWRDN				BIT(0)

Most / all of these defines could probably live in a header file.

[...]

> +struct qmp_usbc_offsets {
> +	u16 serdes;
> +	u16 pcs;
> +	u16 pcs_misc;
> +	u16 pcs_usb;
> +	u16 tx;
> +	u16 rx;
> +	/* for PHYs with >= 2 lanes */

So, all PHYs within this driver if I'm following correctly

> +	u16 tx2;
> +	u16 rx2;
> +};
> +

> +static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> +{
> +	u32 reg;
> +
> +	reg = readl(base + offset);
> +	reg |= val;
> +	writel(reg, base + offset);
> +
> +	/* ensure that above write is through */
> +	readl(base + offset);
> +}
> +
> +static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
> +{
> +	u32 reg;
> +
> +	reg = readl(base + offset);
> +	reg &= ~val;
> +	writel(reg, base + offset);
> +
> +	/* ensure that above write is through */
> +	readl(base + offset);
> +}

Maybe you could use regmap to avoid NIH-ing such accessors

> +
> +/* list of clocks required by phy */
> +static const char * const qmp_usbc_phy_clk_l[] = {
> +	"aux", "cfg_ahb", "ref", "com_aux",
> +};
> +
> +/* list of resets */
> +static const char * const usb3phy_legacy_reset_l[] = {
> +	"phy", "common",
> +};
> +
> +static const char * const usb3phy_reset_l[] = {
> +	"phy_phy", "phy",
> +};
> +
> +/* list of regulators */
> +static const char * const qmp_phy_vreg_l[] = {
> +	"vdda-phy", "vdda-pll",
> +};
> +
> +static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
> +	.serdes		= 0x0,
> +	.pcs		= 0xc00,
> +	.pcs_misc	= 0xa00,
> +	.tx		= 0x200,
> +	.rx		= 0x400,
> +	.tx2		= 0x600,
> +	.rx2		= 0x800,
> +};
> +
> +static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
> +	.lanes			= 2,
> +
> +	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
> +
> +	.serdes_tbl             = msm8998_usb3_serdes_tbl,
> +	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
> +	.tx_tbl                 = msm8998_usb3_tx_tbl,
> +	.tx_tbl_num             = ARRAY_SIZE(msm8998_usb3_tx_tbl),
> +	.rx_tbl                 = msm8998_usb3_rx_tbl,
> +	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
> +	.pcs_tbl                = msm8998_usb3_pcs_tbl,
> +	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
> +	.vreg_list              = qmp_phy_vreg_l,
> +	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs                   = qmp_v3_usb3phy_regs_layout,
> +};
> +
> +static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
> +	.lanes			= 2,
> +
> +	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
> +
> +	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
> +	.tx_tbl			= qcm2290_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
> +	.rx_tbl			= qcm2290_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
> +	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
> +	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> +};
> +
> +static void qmp_usbc_configure_lane(void __iomem *base,
> +					const struct qmp_phy_init_tbl tbl[],
> +					int num,
> +					u8 lane_mask)
> +{
> +	int i;
> +	const struct qmp_phy_init_tbl *t = tbl;
> +
> +	if (!t)
> +		return;
> +
> +	for (i = 0; i < num; i++, t++) {
> +		if (!(t->lane_mask & lane_mask))
> +			continue;
> +
> +		writel(t->val, base + t->offset);
> +	}
> +}
> +
> +static void qmp_usbc_configure(void __iomem *base,
> +				   const struct qmp_phy_init_tbl tbl[],
> +				   int num)
> +{
> +	qmp_usbc_configure_lane(base, tbl, num, 0xff);
> +}
> +

Can this be inlined?

> +static int qmp_usbc_serdes_init(struct qmp_usbc *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	void __iomem *serdes = qmp->serdes;
> +	const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
> +	int serdes_tbl_num = cfg->serdes_tbl_num;
> +
> +	qmp_usbc_configure(serdes, serdes_tbl, serdes_tbl_num);
> +
> +	return 0;
> +}

Can this be inlined?

[...]

> +	/* Tx, Rx, and PCS configurations */
> +	qmp_usbc_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
> +	qmp_usbc_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
> +
> +	if (cfg->lanes >= 2) {

Again, if (true) IIUC


> +		qmp_usbc_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
> +		qmp_usbc_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
> +	}
> +
> +	qmp_usbc_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
> +
> +	if (pcs_usb)

if (false)?

[...]

The rest looks to be boilerplate that's already present in at least
one more driver..

Konrad

