Return-Path: <linux-arm-msm+bounces-7194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FA82CCF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 15:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 871042839D6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 14:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 393A621345;
	Sat, 13 Jan 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wzky0yXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA3421119
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 14:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-598e07d9e9fso119756eaf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jan 2024 06:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705155339; x=1705760139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GpDGmuJVxdjDUWEr6kZyW9N+8zv6rEZ2JqLAU+v81VA=;
        b=Wzky0yXDmkE7SpiNV5ecXXnyXtSYzECnIsM16i7q9puQrxjzu01MPknsLnt+uli+WX
         kjrHn0X+M6OaY7m1/9L3UWdlBkoM/ULfXqJqthe2HcdCdu8uwFKSrlDqVe9ng/7KOIY1
         M0not3dlFdrgD6bxg2MnSjMWinkI9qMEBVu+lTh2yd2fokWaF9skCzdhac4YYM4bddAY
         NkKFeSFLxzZxjfGQFR20KrUjmnvLvO3tS3dKFYRI55goA0mrXi64iLKITt6moodBdTNH
         oHz+Dz6NTtZDXqOjSjlt0ZkErBRSvA7EGfXIAFlRYG1RQ9pxG0X6qa7II7s1VjU6iRaw
         6m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705155339; x=1705760139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpDGmuJVxdjDUWEr6kZyW9N+8zv6rEZ2JqLAU+v81VA=;
        b=Er2HDy9+QDu722ehT+wd6JpLHsjH4V9U78CaslSan8OP4Fr+U8sxfX8hMsQYACwsVQ
         FuQ87k8tTdP3aiQYM//XFmxFQSAHdwFV+Rbc4v7RI3ppWHFhBrZkCLemaFU2Un+Smo5E
         B4swD0qTvMRVEkHjBmjDDHysnHWmuCV5PJ5ePDSQRinC4UYSueqHkJHnt+Y3tuoJp9cH
         hA+QLbwkRYi+HVBNZihmLkLKK8X6FEBIZYXCyBUf9hQuIiUYBrHdubst8tgHWGIXMqua
         rNz6D/SPrCDW9gbfiqedYqyf5eOnEY1bb8UMEblUCRLPtnhWImOhYXg+ecgVbMZki81Y
         CYtg==
X-Gm-Message-State: AOJu0Yz9ck9QUUVMA68IV6/c2nkQ9rx06n6fgWvuIAtSah6H+JCjMSfW
	hvPxwEN92AP2AFqE50Lz7FlW8b3rd+41tUD+rmSX8CAckzSEWQ==
X-Google-Smtp-Source: AGHT+IGmizCd5syeqMnnXBBY8/Nm+SD3H32E3Q7uuwl7FpPEfX8ik7nRdHLpZVBm1j4DEkVPqZDGzNXqzlG2wKpThAs=
X-Received: by 2002:a05:6358:ee85:b0:175:50b4:8ca2 with SMTP id
 il5-20020a056358ee8500b0017550b48ca2mr3154743rwb.9.1705155339368; Sat, 13 Jan
 2024 06:15:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240113-pmi632-typec-v1-0-de7dfd459353@linaro.org>
 <20240113-pmi632-typec-v1-7-de7dfd459353@linaro.org> <f6ec016e-7319-42a7-8ca3-06f21a7ab6e5@linaro.org>
In-Reply-To: <f6ec016e-7319-42a7-8ca3-06f21a7ab6e5@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jan 2024 16:15:28 +0200
Message-ID: <CAA8EJppOR3z4n4ws_3S9KiCFmHhzPsBiEjWw5Bgy4o+F4deT9w@mail.gmail.com>
Subject: Re: [PATCH 07/13] phy: qcom: qmp-usb: split USB-C PHY driver
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 13 Jan 2024 at 12:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 13.01.2024 06:42, Dmitry Baryshkov wrote:
> > In preparation to adding Type-C handling for MSM8998, QCM2290 and SM6115
> > platforms, create new QMP USB-C PHY driver by splitting mentioned
> > platforms to a separate file. In future it will also be extended with
> > support for the DisplayPort handling. It will also be reused later for
> > such platforms as SDM660, SM6125, SM6150.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> [...]
>
>
> > +#include "phy-qcom-qmp.h"
> > +#include "phy-qcom-qmp-pcs-misc-v3.h"
> > +
> > +/* QPHY_SW_RESET bit */
> > +#define SW_RESET                             BIT(0)
> > +/* QPHY_POWER_DOWN_CONTROL */
> > +#define SW_PWRDN                             BIT(0)
>
> Most / all of these defines could probably live in a header file.

For this (and several other comments), see
https://lore.kernel.org/linux-arm-msm/20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org/

>
> [...]
>
> > +struct qmp_usbc_offsets {
> > +     u16 serdes;
> > +     u16 pcs;
> > +     u16 pcs_misc;
> > +     u16 pcs_usb;
> > +     u16 tx;
> > +     u16 rx;
> > +     /* for PHYs with >= 2 lanes */
>
> So, all PHYs within this driver if I'm following correctly

Yes. I just felt that it is easier to follow for copy & modify rather
than just rushing all the changes in. I can squash one of the next
patches that clear single-lane support out of this driver..

>
> > +     u16 tx2;
> > +     u16 rx2;
> > +};
> > +
>
> > +static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
> > +{
> > +     u32 reg;
> > +
> > +     reg = readl(base + offset);
> > +     reg |= val;
> > +     writel(reg, base + offset);
> > +
> > +     /* ensure that above write is through */
> > +     readl(base + offset);
> > +}
> > +
> > +static inline void qphy_clrbits(void __iomem *base, u32 offset, u32 val)
> > +{
> > +     u32 reg;
> > +
> > +     reg = readl(base + offset);
> > +     reg &= ~val;
> > +     writel(reg, base + offset);
> > +
> > +     /* ensure that above write is through */
> > +     readl(base + offset);
> > +}
>
> Maybe you could use regmap to avoid NIH-ing such accessors

regmap will still require posting through read, will it not?

>
> > +
> > +/* list of clocks required by phy */
> > +static const char * const qmp_usbc_phy_clk_l[] = {
> > +     "aux", "cfg_ahb", "ref", "com_aux",
> > +};
> > +
> > +/* list of resets */
> > +static const char * const usb3phy_legacy_reset_l[] = {
> > +     "phy", "common",
> > +};
> > +
> > +static const char * const usb3phy_reset_l[] = {
> > +     "phy_phy", "phy",
> > +};
> > +
> > +/* list of regulators */
> > +static const char * const qmp_phy_vreg_l[] = {
> > +     "vdda-phy", "vdda-pll",
> > +};
> > +
> > +static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
> > +     .serdes         = 0x0,
> > +     .pcs            = 0xc00,
> > +     .pcs_misc       = 0xa00,
> > +     .tx             = 0x200,
> > +     .rx             = 0x400,
> > +     .tx2            = 0x600,
> > +     .rx2            = 0x800,
> > +};
> > +
> > +static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
> > +     .lanes                  = 2,
> > +
> > +     .offsets                = &qmp_usbc_offsets_v3_qcm2290,
> > +
> > +     .serdes_tbl             = msm8998_usb3_serdes_tbl,
> > +     .serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
> > +     .tx_tbl                 = msm8998_usb3_tx_tbl,
> > +     .tx_tbl_num             = ARRAY_SIZE(msm8998_usb3_tx_tbl),
> > +     .rx_tbl                 = msm8998_usb3_rx_tbl,
> > +     .rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
> > +     .pcs_tbl                = msm8998_usb3_pcs_tbl,
> > +     .pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
> > +     .vreg_list              = qmp_phy_vreg_l,
> > +     .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> > +     .regs                   = qmp_v3_usb3phy_regs_layout,
> > +};
> > +
> > +static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
> > +     .lanes                  = 2,
> > +
> > +     .offsets                = &qmp_usbc_offsets_v3_qcm2290,
> > +
> > +     .serdes_tbl             = qcm2290_usb3_serdes_tbl,
> > +     .serdes_tbl_num         = ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
> > +     .tx_tbl                 = qcm2290_usb3_tx_tbl,
> > +     .tx_tbl_num             = ARRAY_SIZE(qcm2290_usb3_tx_tbl),
> > +     .rx_tbl                 = qcm2290_usb3_rx_tbl,
> > +     .rx_tbl_num             = ARRAY_SIZE(qcm2290_usb3_rx_tbl),
> > +     .pcs_tbl                = qcm2290_usb3_pcs_tbl,
> > +     .pcs_tbl_num            = ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> > +     .vreg_list              = qmp_phy_vreg_l,
> > +     .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
> > +     .regs                   = qmp_v3_usb3phy_regs_layout_qcm2290,
> > +};
> > +
> > +static void qmp_usbc_configure_lane(void __iomem *base,
> > +                                     const struct qmp_phy_init_tbl tbl[],
> > +                                     int num,
> > +                                     u8 lane_mask)
> > +{
> > +     int i;
> > +     const struct qmp_phy_init_tbl *t = tbl;
> > +
> > +     if (!t)
> > +             return;
> > +
> > +     for (i = 0; i < num; i++, t++) {
> > +             if (!(t->lane_mask & lane_mask))
> > +                     continue;
> > +
> > +             writel(t->val, base + t->offset);
> > +     }
> > +}
> > +
> > +static void qmp_usbc_configure(void __iomem *base,
> > +                                const struct qmp_phy_init_tbl tbl[],
> > +                                int num)
> > +{
> > +     qmp_usbc_configure_lane(base, tbl, num, 0xff);
> > +}
> > +
>
> Can this be inlined?

Yes and yes.

>
> > +static int qmp_usbc_serdes_init(struct qmp_usbc *qmp)
> > +{
> > +     const struct qmp_phy_cfg *cfg = qmp->cfg;
> > +     void __iomem *serdes = qmp->serdes;
> > +     const struct qmp_phy_init_tbl *serdes_tbl = cfg->serdes_tbl;
> > +     int serdes_tbl_num = cfg->serdes_tbl_num;
> > +
> > +     qmp_usbc_configure(serdes, serdes_tbl, serdes_tbl_num);
> > +
> > +     return 0;
> > +}
>
> Can this be inlined?
>
> [...]
>
> > +     /* Tx, Rx, and PCS configurations */
> > +     qmp_usbc_configure_lane(tx, cfg->tx_tbl, cfg->tx_tbl_num, 1);
> > +     qmp_usbc_configure_lane(rx, cfg->rx_tbl, cfg->rx_tbl_num, 1);
> > +
> > +     if (cfg->lanes >= 2) {
>
> Again, if (true) IIUC
>
>
> > +             qmp_usbc_configure_lane(qmp->tx2, cfg->tx_tbl, cfg->tx_tbl_num, 2);
> > +             qmp_usbc_configure_lane(qmp->rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
> > +     }
> > +
> > +     qmp_usbc_configure(pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
> > +
> > +     if (pcs_usb)
>
> if (false)?

Nice catch.

>
> [...]
>
> The rest looks to be boilerplate that's already present in at least
> one more driver..
>
> Konrad



-- 
With best wishes
Dmitry

