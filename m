Return-Path: <linux-arm-msm+bounces-86880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52159CE8228
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 21:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2D343007C43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 20:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3B820B212;
	Mon, 29 Dec 2025 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b="DkKLOfvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C863B9
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 20:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767040452; cv=none; b=FSCOBe5crzC3XlgGUXKjKd1ZYay+BgvCQlt7HbG/3fnBt+KnVmWe1iMHH3N5xiRkkAdeYLT4zwbe9oo5EyUiHMpYRIEq0I561RjleQqZRiS9Ugt0iBpOLxCh4pSPK7BQSU+FDHutLBmAPyLYW1JczLdXdmx9uKqqgLenk0hk3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767040452; c=relaxed/simple;
	bh=EPqON0NSqSfECs5EOndT1pK8ZbKVHD+v+GTViMry5VM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aNSYe52bSkumUCkyXdd/4Qybqpfv5msXX7jlaJWrgAux4LP2bsfvP7Nr3or8msQywU/qdAl8cx5OZ3XJaspYJvhkPUhnB4NV7h+WFsZS4Rl9SNmi8RHcF7ictliuxis/VA8jh8K+GOJaOzmCgzJPURyke/8fpdbw5WsfdGIvr6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com; spf=pass smtp.mailfrom=joelselvaraj.com; dkim=pass (2048-bit key) header.d=joelselvaraj.com header.i=@joelselvaraj.com header.b=DkKLOfvh; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joelselvaraj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joelselvaraj.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=joelselvaraj.com;
	s=protonmail3; t=1767040438; x=1767299638;
	bh=o79q6zt//si3OMCcZ7z7Emw8dTFIrBUOhTln/yA6Fkg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DkKLOfvhvEVDVCuOLe84KzSjG4IQvtGinZEstINtP8O5c25N513mGMG/x4HVowTuc
	 QoG5pQr8Fy6OxZqhTIEluexh59d5Uqowzrg188v6h8O7Psx7f1yuX1UeqWYALd2mNi
	 SVX49AvlEE/uu6rXi7ye+n16NZjLCmE/heUfxjlaTvwWg8xxYdGKJe1gRUQH0XjBK+
	 7+Lx7CTDDp/OVZ5xvjkwyUFZgXnEG1R0AOCU+A/we/uNS8FCuOsMW4p1YBIqz9m4Z8
	 hrbuBO+8I5RVThuadvGSabIbu7nRjzCdIj3iS7SJ93Yn2Ym4gzijYQHfcAs1NPc7rU
	 bdfKPub5Zskuw==
Date: Mon, 29 Dec 2025 20:33:52 +0000
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, broonie@kernel.org
From: Joel Selvaraj <foss@joelselvaraj.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 07/13] ASoC: codecs: wcd: add common helper for wcd codecs
Message-ID: <d5d57177-5c82-43a4-bf80-ec9d336b043e@joelselvaraj.com>
Feedback-ID: 113812696:user:proton
X-Pm-Message-ID: 2f5656ea6ffe4b112825a2ced012b95571fddb70
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Srinivas Kandagatla,

This patch series broke internal microphones in Oneplus 6=20
(qcom/sdm845-oneplus-enchilada.dts). Reverting the patch series fixes=20
the mic in 6.18.2 kernel version. I suspect it is due to micbias related=20
code changes in this patch, although, I havent debugged the root cause=20
of the issue yet. This was initially noted in mobian distro [1]. I was=20
also able to confirm the same in postmarketOS. It would be nice to fix=20
this issue without having to revert the entire series.

[1]=20
https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/merge_req=
uests/29#note_708300

Regards,
Joel Selvaraj

On 9/9/25 7:19 AM, Srinivas Kandagatla wrote:
> All the Qualcomm WCD codecs have most of its code duplicated across all
> these 3/4 drivers. This is an attempt to remove those duplicate
> parts by adding a common helper library for these codecs.
>=20
> To start with move all the micbias parsing and voltage settings these
> are identical in WCD934x, WCD937x, WCD938x and WCD939x codec driver.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   sound/soc/codecs/Kconfig      |  7 +++
>   sound/soc/codecs/Makefile     |  2 +
>   sound/soc/codecs/wcd-common.c | 70 +++++++++++++++++++++++++++
>   sound/soc/codecs/wcd-common.h | 27 +++++++++++
>   sound/soc/codecs/wcd934x.c    | 82 +++++++++----------------------
>   sound/soc/codecs/wcd937x.c    | 81 ++++++++-----------------------
>   sound/soc/codecs/wcd938x.c    | 88 +++++++---------------------------
>   sound/soc/codecs/wcd939x.c    | 90 +++++++----------------------------
>   8 files changed, 182 insertions(+), 265 deletions(-)
>   create mode 100644 sound/soc/codecs/wcd-common.c
>   create mode 100644 sound/soc/codecs/wcd-common.h
>=20
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index b8d58d2fe326..5bb51d084ec1 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2251,6 +2251,9 @@ config SND_SOC_UDA1380
>   config SND_SOC_WCD_CLASSH
>   =09tristate
>  =20
> +config SND_SOC_WCD_COMMON
> +=09tristate
> +
>   config SND_SOC_WCD9335
>   =09tristate "WCD9335 Codec"
>   =09depends on SLIMBUS
> @@ -2272,6 +2275,7 @@ config SND_SOC_WCD934X
>   =09select REGMAP_IRQ
>   =09select REGMAP_SLIMBUS
>   =09select SND_SOC_WCD_CLASSH
> +=09select SND_SOC_WCD_COMMON
>   =09select SND_SOC_WCD_MBHC
>   =09depends on MFD_WCD934X || COMPILE_TEST
>   =09help
> @@ -2283,6 +2287,7 @@ config SND_SOC_WCD937X
>   =09tristate
>   =09depends on SOUNDWIRE || !SOUNDWIRE
>   =09select SND_SOC_WCD_CLASSH
> +=09select SND_SOC_WCD_COMMON
>  =20
>   config SND_SOC_WCD937X_SDW
>   =09tristate "WCD9370/WCD9375 Codec - SDW"
> @@ -2302,6 +2307,7 @@ config SND_SOC_WCD938X
>   =09tristate
>   =09depends on SOUNDWIRE || !SOUNDWIRE
>   =09select SND_SOC_WCD_CLASSH
> +=09select SND_SOC_WCD_COMMON
>   =09select MULTIPLEXER
>  =20
>   config SND_SOC_WCD938X_SDW
> @@ -2321,6 +2327,7 @@ config SND_SOC_WCD939X
>   =09depends on SOUNDWIRE || !SOUNDWIRE
>   =09depends on TYPEC || !TYPEC
>   =09select SND_SOC_WCD_CLASSH
> +=09select SND_SOC_WCD_COMMON
>  =20
>   config SND_SOC_WCD939X_SDW
>   =09tristate "WCD9390/WCD9395 Codec - SDW"
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index a476d6c45451..8d9bc03ecc60 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -341,6 +341,7 @@ snd-soc-uda1334-y :=3D uda1334.o
>   snd-soc-uda1342-y :=3D uda1342.o
>   snd-soc-uda1380-y :=3D uda1380.o
>   snd-soc-wcd-classh-y :=3D wcd-clsh-v2.o
> +snd-soc-wcd-common-y :=3D wcd-common.o
>   snd-soc-wcd-mbhc-y :=3D wcd-mbhc-v2.o
>   snd-soc-wcd9335-y :=3D wcd9335.o
>   snd-soc-wcd934x-y :=3D wcd934x.o
> @@ -764,6 +765,7 @@ obj-$(CONFIG_SND_SOC_UDA1334)=09+=3D snd-soc-uda1334.=
o
>   obj-$(CONFIG_SND_SOC_UDA1342)=09+=3D snd-soc-uda1342.o
>   obj-$(CONFIG_SND_SOC_UDA1380)=09+=3D snd-soc-uda1380.o
>   obj-$(CONFIG_SND_SOC_WCD_CLASSH)=09+=3D snd-soc-wcd-classh.o
> +obj-$(CONFIG_SND_SOC_WCD_COMMON)=09+=3D snd-soc-wcd-common.o
>   obj-$(CONFIG_SND_SOC_WCD_MBHC)=09+=3D snd-soc-wcd-mbhc.o
>   obj-$(CONFIG_SND_SOC_WCD9335)=09+=3D snd-soc-wcd9335.o
>   obj-$(CONFIG_SND_SOC_WCD934X)=09+=3D snd-soc-wcd934x.o
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.=
c
> new file mode 100644
> index 000000000000..8f3c0806cdc9
> --- /dev/null
> +++ b/sound/soc/codecs/wcd-common.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiari=
es.
> +
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/printk.h>
> +
> +#include "wcd-common.h"
> +
> +#define WCD_MIN_MICBIAS_MV=091000
> +#define WCD_DEF_MICBIAS_MV=091800
> +#define WCD_MAX_MICBIAS_MV=092850
> +
> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv)
> +{
> +=09/* min micbias voltage is 1V and maximum is 2.85V */
> +=09if (micb_mv < WCD_MIN_MICBIAS_MV || micb_mv > WCD_MAX_MICBIAS_MV) {
> +=09=09dev_err(dev, "Unsupported micbias voltage (%u mV)\n", micb_mv);
> +=09=09return -EINVAL;
> +=09}
> +
> +=09return (micb_mv - WCD_MIN_MICBIAS_MV) / 50;
> +}
> +EXPORT_SYMBOL_GPL(wcd_get_micb_vout_ctl_val);
> +
> +static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *mi=
cb_mv)
> +{
> +=09char micbias[64];
> +=09int mv;
> +
> +=09sprintf(micbias, "qcom,micbias%d-microvolt", micb_num);
> +
> +=09if (of_property_read_u32(dev->of_node, micbias, &mv)) {
> +=09=09dev_err(dev, "%s value not found, using default\n", micbias);
> +=09=09mv =3D WCD_DEF_MICBIAS_MV;
> +=09} else {
> +=09=09/* convert it to milli volts */
> +=09=09mv =3D mv/1000;
> +=09}
> +=09if (micb_mv)
> +=09=09*micb_mv =3D mv;
> +
> +=09mv =3D wcd_get_micb_vout_ctl_val(dev, mv);
> +=09if (mv < 0) {
> +=09=09dev_err(dev, "Unsupported %s voltage (%d mV), falling back to defa=
ult (%d mV)\n",
> +=09=09=09=09micbias, mv, WCD_DEF_MICBIAS_MV);
> +=09=09return wcd_get_micb_vout_ctl_val(dev, WCD_DEF_MICBIAS_MV);
> +=09}
> +
> +=09return mv;
> +}
> +
> +int wcd_dt_parse_micbias_info(struct wcd_common *common)
> +{
> +=09int i;
> +
> +=09for (i =3D 0; i < common->max_bias; i++) {
> +=09=09common->micb_vout[i] =3D wcd_get_micbias_val(common->dev, i + 1, &=
common->micb_mv[i]);
> +=09=09if (common->micb_vout[i] < 0)
> +=09=09=09return -EINVAL;
> +=09}
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(wcd_dt_parse_micbias_info);
> +MODULE_DESCRIPTION("Common Qualcomm WCD Codec helpers driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/wcd-common.h b/sound/soc/codecs/wcd-common.=
h
> new file mode 100644
> index 000000000000..611f06cdec55
> --- /dev/null
> +++ b/sound/soc/codecs/wcd-common.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiari=
es.
> + */
> +
> +#ifndef __WCD_COMMON_H__
> +#define __WCD_COMMON_H__
> +
> +struct device;
> +struct sdw_slave;
> +struct sdw_bus_params;
> +struct irq_domain;
> +enum sdw_slave_status;
> +
> +#define WCD_MAX_MICBIAS=09=094
> +
> +struct wcd_common {
> +=09struct device *dev;
> +=09int max_bias;
> +=09u32 micb_mv[WCD_MAX_MICBIAS];
> +=09u32 micb_vout[WCD_MAX_MICBIAS];
> +};
> +
> +int wcd_get_micb_vout_ctl_val(struct device *dev, u32 micb_mv);
> +int wcd_dt_parse_micbias_info(struct wcd_common *common);
> +
> +#endif /* __WCD_COMMON_H__  */
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index 1bb7e1dc7e6b..d10b457e6c9a 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -21,6 +21,7 @@
>   #include <sound/soc-dapm.h>
>   #include <sound/tlv.h>
>   #include "wcd-clsh-v2.h"
> +#include "wcd-common.h"
>   #include "wcd-mbhc-v2.h"
>  =20
>   #include <dt-bindings/sound/qcom,wcd934x.h>
> @@ -116,9 +117,6 @@
>   #define WCD934X_DEC_PWR_LVL_DF=09=090x00
>   #define WCD934X_DEC_PWR_LVL_HYBRID WCD934X_DEC_PWR_LVL_DF
>  =20
> -#define WCD934X_DEF_MICBIAS_MV=091800
> -#define WCD934X_MAX_MICBIAS_MV=092850
> -
>   #define WCD_IIR_FILTER_SIZE=09(sizeof(u32) * BAND_MAX)
>  =20
>   #define WCD_IIR_FILTER_CTL(xname, iidx, bidx) \
> @@ -530,6 +528,7 @@ struct wcd934x_codec {
>   =09struct slim_device *sdev;
>   =09struct slim_device *sidev;
>   =09struct wcd_clsh_ctrl *clsh_ctrl;
> +=09struct wcd_common common;
>   =09struct snd_soc_component *component;
>   =09struct wcd934x_slim_ch rx_chs[WCD934X_RX_MAX];
>   =09struct wcd934x_slim_ch tx_chs[WCD934X_TX_MAX];
> @@ -555,7 +554,6 @@ struct wcd934x_codec {
>   =09struct mutex micb_lock;
>   =09u32 micb_ref[WCD934X_MAX_MICBIAS];
>   =09u32 pullup_ref[WCD934X_MAX_MICBIAS];
> -=09u32 micb2_mv;
>   };
>  =20
>   #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, h=
w)
> @@ -2168,55 +2166,24 @@ static struct clk *wcd934x_register_mclk_output(s=
truct wcd934x_codec *wcd)
>   =09return NULL;
>   }
>  =20
> -static int wcd934x_get_micbias_val(struct device *dev, const char *micbi=
as,
> -=09=09=09=09   u32 *micb_mv)
> -{
> -=09int mv;
> -
> -=09if (of_property_read_u32(dev->parent->of_node, micbias, &mv)) {
> -=09=09dev_err(dev, "%s value not found, using default\n", micbias);
> -=09=09mv =3D WCD934X_DEF_MICBIAS_MV;
> -=09} else {
> -=09=09/* convert it to milli volts */
> -=09=09mv =3D mv/1000;
> -=09}
> -
> -=09if (mv < 1000 || mv > 2850) {
> -=09=09dev_err(dev, "%s value not in valid range, using default\n",
> -=09=09=09micbias);
> -=09=09mv =3D WCD934X_DEF_MICBIAS_MV;
> -=09}
> -
> -=09if (micb_mv)
> -=09=09*micb_mv =3D mv;
> -
> -=09return (mv - 1000) / 50;
> -}
> -
>   static int wcd934x_init_dmic(struct snd_soc_component *comp)
>   {
> -=09int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
>   =09struct wcd934x_codec *wcd =3D dev_get_drvdata(comp->dev);
>   =09u32 def_dmic_rate, dmic_clk_drv;
> +=09int ret;
>  =20
> -=09vout_ctl_1 =3D wcd934x_get_micbias_val(comp->dev,
> -=09=09=09=09=09     "qcom,micbias1-microvolt", NULL);
> -=09vout_ctl_2 =3D wcd934x_get_micbias_val(comp->dev,
> -=09=09=09=09=09     "qcom,micbias2-microvolt",
> -=09=09=09=09=09     &wcd->micb2_mv);
> -=09vout_ctl_3 =3D wcd934x_get_micbias_val(comp->dev,
> -=09=09=09=09=09     "qcom,micbias3-microvolt", NULL);
> -=09vout_ctl_4 =3D wcd934x_get_micbias_val(comp->dev,
> -=09=09=09=09=09     "qcom,micbias4-microvolt", NULL);
> +=09ret =3D wcd_dt_parse_mbhc_data(comp->dev, &wcd->mbhc_cfg);
> +=09if (ret)
> +=09=09return ret;
>  =20
>   =09snd_soc_component_update_bits(comp, WCD934X_ANA_MICB1,
> -=09=09=09=09      WCD934X_MICB_VAL_MASK, vout_ctl_1);
> +=09=09=09=09      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[0]);
>   =09snd_soc_component_update_bits(comp, WCD934X_ANA_MICB2,
> -=09=09=09=09      WCD934X_MICB_VAL_MASK, vout_ctl_2);
> +=09=09=09=09      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[1]);
>   =09snd_soc_component_update_bits(comp, WCD934X_ANA_MICB3,
> -=09=09=09=09      WCD934X_MICB_VAL_MASK, vout_ctl_3);
> +=09=09=09=09      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[2]);
>   =09snd_soc_component_update_bits(comp, WCD934X_ANA_MICB4,
> -=09=09=09=09      WCD934X_MICB_VAL_MASK, vout_ctl_4);
> +=09=09=09=09      WCD934X_MICB_VAL_MASK, wcd->common.micb_vout[3]);
>  =20
>   =09if (wcd->rate =3D=3D WCD934X_MCLK_CLK_9P6MHZ)
>   =09=09def_dmic_rate =3D WCD9XXX_DMIC_SAMPLE_RATE_4P8MHZ;
> @@ -2517,15 +2484,6 @@ static void wcd934x_mbhc_micb_ramp_control(struct =
snd_soc_component *component,
>   =09}
>   }
>  =20
> -static int wcd934x_get_micb_vout_ctl_val(u32 micb_mv)
> -{
> -=09/* min micbias voltage is 1V and maximum is 2.85V */
> -=09if (micb_mv < 1000 || micb_mv > 2850)
> -=09=09return -EINVAL;
> -
> -=09return (micb_mv - 1000) / 50;
> -}
> -
>   static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *c=
omponent,
>   =09=09=09=09=09    int req_volt, int micb_num)
>   {
> @@ -2562,7 +2520,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct =
snd_soc_component *component,
>   =09cur_vout_ctl =3D snd_soc_component_read_field(component, micb_reg,
>   =09=09=09=09=09=09    WCD934X_MICB_VAL_MASK);
>  =20
> -=09req_vout_ctl =3D wcd934x_get_micb_vout_ctl_val(req_volt);
> +=09req_vout_ctl =3D wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>   =09if (req_vout_ctl < 0) {
>   =09=09ret =3D -EINVAL;
>   =09=09goto exit;
> @@ -2610,10 +2568,10 @@ static int wcd934x_mbhc_micb_ctrl_threshold_mic(s=
truct snd_soc_component *compon
>   =09 * voltage needed to detect threshold microphone, then do
>   =09 * not change the micbias, just return.
>   =09 */
> -=09if (wcd934x->micb2_mv >=3D WCD_MBHC_THR_HS_MICB_MV)
> +=09if (wcd934x->common.micb_mv[1] >=3D WCD_MBHC_THR_HS_MICB_MV)
>   =09=09return 0;
>  =20
> -=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->micb2_mv;
> +=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd934x->common.micb_m=
v[1];
>  =20
>   =09rc =3D wcd934x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS=
_2);
>  =20
> @@ -3036,7 +2994,7 @@ static void wcd934x_mbhc_deinit(struct snd_soc_comp=
onent *component)
>   static int wcd934x_comp_probe(struct snd_soc_component *component)
>   {
>   =09struct wcd934x_codec *wcd =3D dev_get_drvdata(component->dev);
> -=09int i;
> +=09int i, ret;
>  =20
>   =09snd_soc_component_init_regmap(component, wcd->regmap);
>   =09wcd->component =3D component;
> @@ -3054,7 +3012,12 @@ static int wcd934x_comp_probe(struct snd_soc_compo=
nent *component)
>   =09for (i =3D 0; i < NUM_CODEC_DAIS; i++)
>   =09=09INIT_LIST_HEAD(&wcd->dai[i].slim_ch_list);
>  =20
> -=09wcd934x_init_dmic(component);
> +
> +=09ret =3D wcd934x_init_dmic(component);
> +=09if (ret) {
> +=09=09dev_err(component->dev, "Failed to Initialize micbias\n");
> +=09=09return ret;
> +=09}
>  =20
>   =09if (wcd934x_mbhc_init(component))
>   =09=09dev_err(component->dev, "Failed to Initialize MBHC\n");
> @@ -5860,14 +5823,13 @@ static int wcd934x_codec_parse_data(struct wcd934=
x_codec *wcd)
>   =09cfg->anc_micbias =3D MIC_BIAS_2;
>   =09cfg->v_hs_max =3D WCD_MBHC_HS_V_MAX;
>   =09cfg->num_btn =3D WCD934X_MBHC_MAX_BUTTONS;
> -=09cfg->micb_mv =3D wcd->micb2_mv;
> +=09cfg->micb_mv =3D wcd->common.micb_mv[1];
>   =09cfg->linein_th =3D 5000;
>   =09cfg->hs_thr =3D 1700;
>   =09cfg->hph_thr =3D 50;
>  =20
>   =09wcd_dt_parse_mbhc_data(dev, cfg);
>  =20
> -
>   =09return 0;
>   }
>  =20
> @@ -5888,6 +5850,8 @@ static int wcd934x_codec_probe(struct platform_devi=
ce *pdev)
>   =09wcd->sdev =3D to_slim_device(data->dev);
>   =09mutex_init(&wcd->sysclk_mutex);
>   =09mutex_init(&wcd->micb_lock);
> +=09wcd->common.dev =3D dev->parent;
> +=09wcd->common.max_bias =3D 4;
>  =20
>   =09ret =3D wcd934x_codec_parse_data(wcd);
>   =09if (ret)
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index b78f37c582ca..ffe6508fd84c 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -21,6 +21,7 @@
>   #include <sound/tlv.h>
>  =20
>   #include "wcd-clsh-v2.h"
> +#include "wcd-common.h"
>   #include "wcd-mbhc-v2.h"
>   #include "wcd937x.h"
>  =20
> @@ -85,6 +86,7 @@ struct wcd937x_priv {
>   =09struct wcd_mbhc_config mbhc_cfg;
>   =09struct wcd_mbhc_intr intr_ids;
>   =09struct wcd_clsh_ctrl *clsh_info;
> +=09struct wcd_common common;
>   =09struct irq_domain *virq;
>   =09struct regmap_irq_chip_data *irq_chip;
>   =09struct snd_soc_jack *jack;
> @@ -93,9 +95,6 @@ struct wcd937x_priv {
>   =09s32 pullup_ref[WCD937X_MAX_MICBIAS];
>   =09u32 hph_mode;
>   =09int ear_rx_path;
> -=09u32 micb1_mv;
> -=09u32 micb2_mv;
> -=09u32 micb3_mv;
>   =09int hphr_pdm_wd_int;
>   =09int hphl_pdm_wd_int;
>   =09int aux_pdm_wd_int;
> @@ -872,15 +871,6 @@ static int wcd937x_enable_rx3(struct snd_soc_dapm_wi=
dget *w,
>   =09return 0;
>   }
>  =20
> -static int wcd937x_get_micb_vout_ctl_val(u32 micb_mv)
> -{
> -=09if (micb_mv < 1000 || micb_mv > 2850) {
> -=09=09pr_err("Unsupported micbias voltage (%u mV)\n", micb_mv);
> -=09=09return -EINVAL;
> -=09}
> -
> -=09return (micb_mv - 1000) / 50;
> -}
>  =20
>   static int wcd937x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
>   =09=09=09       struct snd_kcontrol *kcontrol, int event)
> @@ -1481,7 +1471,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct =
snd_soc_component *component,
>   =09cur_vout_ctl =3D snd_soc_component_read_field(component, micb_reg,
>   =09=09=09=09=09=09    WCD937X_MICB_VOUT_MASK);
>  =20
> -=09req_vout_ctl =3D wcd937x_get_micb_vout_ctl_val(req_volt);
> +=09req_vout_ctl =3D wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>   =09if (req_vout_ctl < 0) {
>   =09=09ret =3D -EINVAL;
>   =09=09goto exit;
> @@ -1529,10 +1519,10 @@ static int wcd937x_mbhc_micb_ctrl_threshold_mic(s=
truct snd_soc_component *compon
>   =09 * voltage needed to detect threshold microphone, then do
>   =09 * not change the micbias, just return.
>   =09 */
> -=09if (wcd937x->micb2_mv >=3D WCD_MBHC_THR_HS_MICB_MV)
> +=09if (wcd937x->common.micb_mv[2] >=3D WCD_MBHC_THR_HS_MICB_MV)
>   =09=09return 0;
>  =20
> -=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->micb2_mv;
> +=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd937x->common.micb_m=
v[2];
>  =20
>   =09return wcd937x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS=
_2);
>   }
> @@ -2436,22 +2426,14 @@ static const struct snd_soc_dapm_route wcd9375_au=
dio_map[] =3D {
>   =09{ "DMIC6_MIXER", "Switch", "DMIC6" },
>   };
>  =20
> -static int wcd937x_set_micbias_data(struct wcd937x_priv *wcd937x)
> +static void wcd937x_set_micbias_data(struct device *dev, struct wcd937x_=
priv *wcd937x)
>   {
> -=09int vout_ctl[3];
> -
> -=09/* Set micbias voltage */
> -=09vout_ctl[0] =3D wcd937x_get_micb_vout_ctl_val(wcd937x->micb1_mv);
> -=09vout_ctl[1] =3D wcd937x_get_micb_vout_ctl_val(wcd937x->micb2_mv);
> -=09vout_ctl[2] =3D wcd937x_get_micb_vout_ctl_val(wcd937x->micb3_mv);
> -=09if ((vout_ctl[0] | vout_ctl[1] | vout_ctl[2]) < 0)
> -=09=09return -EINVAL;
> -
> -=09regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MI=
CB_VOUT, vout_ctl[0]);
> -=09regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MI=
CB_VOUT, vout_ctl[1]);
> -=09regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MI=
CB_VOUT, vout_ctl[2]);
> -
> -=09return 0;
> +=09regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB1, WCD937X_ANA_MI=
CB_VOUT,
> +=09=09=09wcd937x->common.micb_vout[0]);
> +=09regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB2, WCD937X_ANA_MI=
CB_VOUT,
> +=09=09=09wcd937x->common.micb_vout[1]);
> +=09regmap_update_bits(wcd937x->regmap, WCD937X_ANA_MICB3, WCD937X_ANA_MI=
CB_VOUT,
> +=09=09=09wcd937x->common.micb_vout[2]);
>   }
>  =20
>   static irqreturn_t wcd937x_wd_handle_irq(int irq, void *data)
> @@ -2630,31 +2612,6 @@ static const struct snd_soc_component_driver soc_c=
odec_dev_wcd937x =3D {
>   =09.endianness =3D 1,
>   };
>  =20
> -static void wcd937x_dt_parse_micbias_info(struct device *dev, struct wcd=
937x_priv *wcd)
> -{
> -=09struct device_node *np =3D dev->of_node;
> -=09u32 prop_val =3D 0;
> -=09int ret =3D 0;
> -
> -=09ret =3D of_property_read_u32(np, "qcom,micbias1-microvolt", &prop_val=
);
> -=09if (!ret)
> -=09=09wcd->micb1_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_warn(dev, "Micbias1 DT property not found\n");
> -
> -=09ret =3D of_property_read_u32(np, "qcom,micbias2-microvolt", &prop_val=
);
> -=09if (!ret)
> -=09=09wcd->micb2_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_warn(dev, "Micbias2 DT property not found\n");
> -
> -=09ret =3D of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val=
);
> -=09if (!ret)
> -=09=09wcd->micb3_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_warn(dev, "Micbias3 DT property not found\n");
> -}
> -
>   static bool wcd937x_swap_gnd_mic(struct snd_soc_component *component)
>   {
>   =09int value;
> @@ -2848,11 +2805,7 @@ static int wcd937x_bind(struct device *dev)
>   =09wcd937x->sdw_priv[AIF1_PB]->slave_irq =3D wcd937x->virq;
>   =09wcd937x->sdw_priv[AIF1_CAP]->slave_irq =3D wcd937x->virq;
>  =20
> -=09ret =3D wcd937x_set_micbias_data(wcd937x);
> -=09if (ret < 0) {
> -=09=09dev_err(dev, "Bad micbias pdata\n");
> -=09=09return ret;
> -=09}
> +=09wcd937x_set_micbias_data(dev, wcd937x);
>  =20
>   =09ret =3D snd_soc_register_component(dev, &soc_codec_dev_wcd937x,
>   =09=09=09=09=09 wcd937x_dais, ARRAY_SIZE(wcd937x_dais));
> @@ -2920,6 +2873,8 @@ static int wcd937x_probe(struct platform_device *pd=
ev)
>  =20
>   =09dev_set_drvdata(dev, wcd937x);
>   =09mutex_init(&wcd937x->micb_lock);
> +=09wcd937x->common.dev =3D dev;
> +=09wcd937x->common.max_bias =3D 3;
>  =20
>   =09wcd937x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>   =09if (IS_ERR(wcd937x->reset_gpio))
> @@ -2939,13 +2894,15 @@ static int wcd937x_probe(struct platform_device *=
pdev)
>   =09if (ret)
>   =09=09return dev_err_probe(dev, ret, "Failed to get and enable supplies=
\n");
>  =20
> -=09wcd937x_dt_parse_micbias_info(dev, wcd937x);
> +=09ret =3D wcd_dt_parse_micbias_info(&wcd937x->common);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to get micbias\n");
>  =20
>   =09cfg->mbhc_micbias =3D MIC_BIAS_2;
>   =09cfg->anc_micbias =3D MIC_BIAS_2;
>   =09cfg->v_hs_max =3D WCD_MBHC_HS_V_MAX;
>   =09cfg->num_btn =3D WCD937X_MBHC_MAX_BUTTONS;
> -=09cfg->micb_mv =3D wcd937x->micb2_mv;
> +=09cfg->micb_mv =3D wcd937x->common.micb_mv[2];
>   =09cfg->linein_th =3D 5000;
>   =09cfg->hs_thr =3D 1700;
>   =09cfg->hph_thr =3D 50;
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index f8d7bf27a6ed..c8b6e543986d 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -22,6 +22,7 @@
>   #include <linux/regulator/consumer.h>
>  =20
>   #include "wcd-clsh-v2.h"
> +#include "wcd-common.h"
>   #include "wcd-mbhc-v2.h"
>   #include "wcd938x.h"
>  =20
> @@ -155,6 +156,7 @@ struct wcd938x_priv {
>   =09struct wcd_mbhc_config mbhc_cfg;
>   =09struct wcd_mbhc_intr intr_ids;
>   =09struct wcd_clsh_ctrl *clsh_info;
> +=09struct wcd_common common;
>   =09struct irq_domain *virq;
>   =09struct regmap_irq_chip_data *irq_chip;
>   =09struct snd_soc_jack *jack;
> @@ -169,10 +171,6 @@ struct wcd938x_priv {
>   =09struct gpio_desc *us_euro_gpio;
>   =09struct mux_control *us_euro_mux;
>   =09unsigned int mux_state;
> -=09u32 micb1_mv;
> -=09u32 micb2_mv;
> -=09u32 micb3_mv;
> -=09u32 micb4_mv;
>   =09int hphr_pdm_wd_int;
>   =09int hphl_pdm_wd_int;
>   =09int aux_pdm_wd_int;
> @@ -1974,15 +1972,6 @@ static void wcd938x_mbhc_micb_ramp_control(struct =
snd_soc_component *component,
>   =09}
>   }
>  =20
> -static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
> -{
> -=09/* min micbias voltage is 1V and maximum is 2.85V */
> -=09if (micb_mv < 1000 || micb_mv > 2850)
> -=09=09return -EINVAL;
> -
> -=09return (micb_mv - 1000) / 50;
> -}
> -
>   static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *c=
omponent,
>   =09=09=09=09=09    int req_volt, int micb_num)
>   {
> @@ -2019,7 +2008,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct =
snd_soc_component *component,
>   =09cur_vout_ctl =3D snd_soc_component_read_field(component, micb_reg,
>   =09=09=09=09=09=09    WCD938X_MICB_VOUT_MASK);
>  =20
> -=09req_vout_ctl =3D wcd938x_get_micb_vout_ctl_val(req_volt);
> +=09req_vout_ctl =3D wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>   =09if (req_vout_ctl < 0) {
>   =09=09ret =3D -EINVAL;
>   =09=09goto exit;
> @@ -2067,10 +2056,10 @@ static int wcd938x_mbhc_micb_ctrl_threshold_mic(s=
truct snd_soc_component *compon
>   =09 * voltage needed to detect threshold microphone, then do
>   =09 * not change the micbias, just return.
>   =09 */
> -=09if (wcd938x->micb2_mv >=3D WCD_MBHC_THR_HS_MICB_MV)
> +=09if (wcd938x->common.micb_mv[2] >=3D WCD_MBHC_THR_HS_MICB_MV)
>   =09=09return 0;
>  =20
> -=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->micb2_mv;
> +=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd938x->common.micb_m=
v[2];
>  =20
>   =09return wcd938x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS=
_2);
>   }
> @@ -2975,28 +2964,16 @@ static const struct snd_soc_dapm_route wcd938x_au=
dio_map[] =3D {
>   =09{"EAR", NULL, "EAR PGA"},
>   };
>  =20
> -static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
> +static void wcd938x_set_micbias_data(struct device *dev, struct wcd938x_=
priv *wcd938x)
>   {
> -=09int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
> -
> -=09/* set micbias voltage */
> -=09vout_ctl_1 =3D wcd938x_get_micb_vout_ctl_val(wcd938x->micb1_mv);
> -=09vout_ctl_2 =3D wcd938x_get_micb_vout_ctl_val(wcd938x->micb2_mv);
> -=09vout_ctl_3 =3D wcd938x_get_micb_vout_ctl_val(wcd938x->micb3_mv);
> -=09vout_ctl_4 =3D wcd938x_get_micb_vout_ctl_val(wcd938x->micb4_mv);
> -=09if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 =
< 0)
> -=09=09return -EINVAL;
> -
>   =09regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB1,
> -=09=09=09   WCD938X_MICB_VOUT_MASK, vout_ctl_1);
> +=09=09=09   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[0]);
>   =09regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB2,
> -=09=09=09   WCD938X_MICB_VOUT_MASK, vout_ctl_2);
> +=09=09=09   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[1]);
>   =09regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB3,
> -=09=09=09   WCD938X_MICB_VOUT_MASK, vout_ctl_3);
> +=09=09=09   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[2]);
>   =09regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB4,
> -=09=09=09   WCD938X_MICB_VOUT_MASK, vout_ctl_4);
> -
> -=09return 0;
> +=09=09=09   WCD938X_MICB_VOUT_MASK, wcd938x->common.micb_vout[3]);
>   }
>  =20
>   static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
> @@ -3200,37 +3177,6 @@ static const struct snd_soc_component_driver soc_c=
odec_dev_wcd938x =3D {
>   =09.endianness =3D 1,
>   };
>  =20
> -static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd=
938x_priv *wcd)
> -{
> -=09struct device_node *np =3D dev->of_node;
> -=09u32 prop_val =3D 0;
> -=09int rc =3D 0;
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val=
);
> -=09if (!rc)
> -=09=09wcd->micb1_mv =3D prop_val/1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val=
);
> -=09if (!rc)
> -=09=09wcd->micb2_mv =3D prop_val/1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val)=
;
> -=09if (!rc)
> -=09=09wcd->micb3_mv =3D prop_val/1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val=
);
> -=09if (!rc)
> -=09=09wcd->micb4_mv =3D prop_val/1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
> -}
> -
>   static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
>   {
>   =09struct wcd938x_priv *wcd938x =3D snd_soc_component_get_drvdata(compo=
nent);
> @@ -3295,13 +3241,15 @@ static int wcd938x_populate_dt_data(struct wcd938=
x_priv *wcd938x, struct device
>   =09if (ret)
>   =09=09return dev_err_probe(dev, ret, "Failed to get and enable supplies=
\n");
>  =20
> -=09wcd938x_dt_parse_micbias_info(dev, wcd938x);
> +=09ret =3D wcd_dt_parse_micbias_info(&wcd938x->common);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to get and enable supplies\=
n");
>  =20
>   =09cfg->mbhc_micbias =3D MIC_BIAS_2;
>   =09cfg->anc_micbias =3D MIC_BIAS_2;
>   =09cfg->v_hs_max =3D WCD_MBHC_HS_V_MAX;
>   =09cfg->num_btn =3D WCD938X_MBHC_MAX_BUTTONS;
> -=09cfg->micb_mv =3D wcd938x->micb2_mv;
> +=09cfg->micb_mv =3D wcd938x->common.micb_mv[2];
>   =09cfg->linein_th =3D 5000;
>   =09cfg->hs_thr =3D 1700;
>   =09cfg->hph_thr =3D 50;
> @@ -3457,11 +3405,7 @@ static int wcd938x_bind(struct device *dev)
>   =09wcd938x->sdw_priv[AIF1_PB]->slave_irq =3D wcd938x->virq;
>   =09wcd938x->sdw_priv[AIF1_CAP]->slave_irq =3D wcd938x->virq;
>  =20
> -=09ret =3D wcd938x_set_micbias_data(wcd938x);
> -=09if (ret < 0) {
> -=09=09dev_err(dev, "%s: bad micbias pdata\n", __func__);
> -=09=09goto err_remove_rx_link;
> -=09}
> +=09wcd938x_set_micbias_data(dev, wcd938x);
>  =20
>   =09ret =3D snd_soc_register_component(dev, &soc_codec_dev_wcd938x,
>   =09=09=09=09=09 wcd938x_dais, ARRAY_SIZE(wcd938x_dais));
> @@ -3550,6 +3494,8 @@ static int wcd938x_probe(struct platform_device *pd=
ev)
>  =20
>   =09dev_set_drvdata(dev, wcd938x);
>   =09mutex_init(&wcd938x->micb_lock);
> +=09wcd938x->common.dev =3D dev;
> +=09wcd938x->common.max_bias =3D 4;
>  =20
>   =09ret =3D wcd938x_populate_dt_data(wcd938x, dev);
>   =09if (ret)
> diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
> index 85730ae40c2c..59c920c50c00 100644
> --- a/sound/soc/codecs/wcd939x.c
> +++ b/sound/soc/codecs/wcd939x.c
> @@ -28,6 +28,7 @@
>   #include <linux/usb/typec_altmode.h>
>  =20
>   #include "wcd-clsh-v2.h"
> +#include "wcd-common.h"
>   #include "wcd-mbhc-v2.h"
>   #include "wcd939x.h"
>  =20
> @@ -191,6 +192,7 @@ struct wcd939x_priv {
>   =09struct wcd_mbhc_config mbhc_cfg;
>   =09struct wcd_mbhc_intr intr_ids;
>   =09struct wcd_clsh_ctrl *clsh_info;
> +=09struct wcd_common common;
>   =09struct irq_domain *virq;
>   =09struct regmap_irq_chip_data *irq_chip;
>   =09struct snd_soc_jack *jack;
> @@ -201,10 +203,6 @@ struct wcd939x_priv {
>   =09u32 tx_mode[TX_ADC_MAX];
>   =09int variant;
>   =09struct gpio_desc *reset_gpio;
> -=09u32 micb1_mv;
> -=09u32 micb2_mv;
> -=09u32 micb3_mv;
> -=09u32 micb4_mv;
>   =09int hphr_pdm_wd_int;
>   =09int hphl_pdm_wd_int;
>   =09int ear_pdm_wd_int;
> @@ -1919,17 +1917,6 @@ static void wcd939x_mbhc_micb_ramp_control(struct =
snd_soc_component *component,
>   =09}
>   }
>  =20
> -static int wcd939x_get_micb_vout_ctl_val(u32 micb_mv)
> -{
> -=09/* min micbias voltage is 1V and maximum is 2.85V */
> -=09if (micb_mv < 1000 || micb_mv > 2850) {
> -=09=09pr_err("%s: unsupported micbias voltage\n", __func__);
> -=09=09return -EINVAL;
> -=09}
> -
> -=09return (micb_mv - 1000) / 50;
> -}
> -
>   static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *c=
omponent,
>   =09=09=09=09=09    int req_volt, int micb_num)
>   {
> @@ -1969,7 +1956,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct =
snd_soc_component *component,
>   =09cur_vout_ctl =3D snd_soc_component_read_field(component, micb_reg,
>   =09=09=09=09=09=09    WCD939X_MICB_VOUT_CTL);
>  =20
> -=09req_vout_ctl =3D wcd939x_get_micb_vout_ctl_val(req_volt);
> +=09req_vout_ctl =3D wcd_get_micb_vout_ctl_val(component->dev, req_volt);
>   =09if (req_vout_ctl < 0) {
>   =09=09ret =3D req_vout_ctl;
>   =09=09goto exit;
> @@ -2021,10 +2008,10 @@ static int wcd939x_mbhc_micb_ctrl_threshold_mic(s=
truct snd_soc_component *compon
>   =09 * voltage needed to detect threshold microphone, then do
>   =09 * not change the micbias, just return.
>   =09 */
> -=09if (wcd939x->micb2_mv >=3D WCD_MBHC_THR_HS_MICB_MV)
> +=09if (wcd939x->common.micb_mv[1] >=3D WCD_MBHC_THR_HS_MICB_MV)
>   =09=09return 0;
>  =20
> -=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->micb2_mv;
> +=09micb_mv =3D req_en ? WCD_MBHC_THR_HS_MICB_MV : wcd939x->common.micb_m=
v[1];
>  =20
>   =09return wcd939x_mbhc_micb_adjust_voltage(component, micb_mv, MIC_BIAS=
_2);
>   }
> @@ -2895,28 +2882,16 @@ static const struct snd_soc_dapm_route wcd939x_au=
dio_map[] =3D {
>   =09{"EAR", NULL, "EAR PGA"},
>   };
>  =20
> -static int wcd939x_set_micbias_data(struct wcd939x_priv *wcd939x)
> +static void wcd939x_set_micbias_data(struct device *dev, struct wcd939x_=
priv *wcd939x)
>   {
> -=09int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
> -
> -=09/* set micbias voltage */
> -=09vout_ctl_1 =3D wcd939x_get_micb_vout_ctl_val(wcd939x->micb1_mv);
> -=09vout_ctl_2 =3D wcd939x_get_micb_vout_ctl_val(wcd939x->micb2_mv);
> -=09vout_ctl_3 =3D wcd939x_get_micb_vout_ctl_val(wcd939x->micb3_mv);
> -=09vout_ctl_4 =3D wcd939x_get_micb_vout_ctl_val(wcd939x->micb4_mv);
> -=09if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 =
< 0)
> -=09=09return -EINVAL;
> -
>   =09regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB1,
> -=09=09=09   WCD939X_MICB_VOUT_CTL, vout_ctl_1);
> +=09=09=09   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[0]);
>   =09regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB2,
> -=09=09=09   WCD939X_MICB_VOUT_CTL, vout_ctl_2);
> +=09=09=09   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[1]);
>   =09regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB3,
> -=09=09=09   WCD939X_MICB_VOUT_CTL, vout_ctl_3);
> +=09=09=09   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[2]);
>   =09regmap_update_bits(wcd939x->regmap, WCD939X_ANA_MICB4,
> -=09=09=09   WCD939X_MICB_VOUT_CTL, vout_ctl_4);
> -
> -=09return 0;
> +=09=09=09   WCD939X_MICB_VOUT_CTL, wcd939x->common.micb_vout[3]);
>   }
>  =20
>   static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
> @@ -3186,37 +3161,6 @@ static int wcd939x_typec_mux_set(struct typec_mux_=
dev *mux,
>   }
>   #endif /* CONFIG_TYPEC */
>  =20
> -static void wcd939x_dt_parse_micbias_info(struct device *dev, struct wcd=
939x_priv *wcd)
> -{
> -=09struct device_node *np =3D dev->of_node;
> -=09u32 prop_val =3D 0;
> -=09int rc =3D 0;
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val=
);
> -=09if (!rc)
> -=09=09wcd->micb1_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val=
);
> -=09if (!rc)
> -=09=09wcd->micb2_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val)=
;
> -=09if (!rc)
> -=09=09wcd->micb3_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
> -
> -=09rc =3D of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val=
);
> -=09if (!rc)
> -=09=09wcd->micb4_mv =3D prop_val / 1000;
> -=09else
> -=09=09dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
> -}
> -
>   #if IS_ENABLED(CONFIG_TYPEC)
>   static bool wcd939x_swap_gnd_mic(struct snd_soc_component *component)
>   {
> @@ -3252,13 +3196,15 @@ static int wcd939x_populate_dt_data(struct wcd939=
x_priv *wcd939x, struct device
>   =09if (ret)
>   =09=09return dev_err_probe(dev, ret, "Failed to get and enable supplies=
\n");
>  =20
> -=09wcd939x_dt_parse_micbias_info(dev, wcd939x);
> +=09ret =3D wcd_dt_parse_micbias_info(&wcd939x->common);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to get micbias\n");
>  =20
>   =09cfg->mbhc_micbias =3D MIC_BIAS_2;
>   =09cfg->anc_micbias =3D MIC_BIAS_2;
>   =09cfg->v_hs_max =3D WCD_MBHC_HS_V_MAX;
>   =09cfg->num_btn =3D WCD939X_MBHC_MAX_BUTTONS;
> -=09cfg->micb_mv =3D wcd939x->micb2_mv;
> +=09cfg->micb_mv =3D wcd939x->common.micb_mv[1];
>   =09cfg->linein_th =3D 5000;
>   =09cfg->hs_thr =3D 1700;
>   =09cfg->hph_thr =3D 50;
> @@ -3444,11 +3390,7 @@ static int wcd939x_bind(struct device *dev)
>   =09wcd939x->sdw_priv[AIF1_PB]->slave_irq =3D wcd939x->virq;
>   =09wcd939x->sdw_priv[AIF1_CAP]->slave_irq =3D wcd939x->virq;
>  =20
> -=09ret =3D wcd939x_set_micbias_data(wcd939x);
> -=09if (ret < 0) {
> -=09=09dev_err(dev, "%s: bad micbias pdata\n", __func__);
> -=09=09goto err_remove_rx_link;
> -=09}
> +=09wcd939x_set_micbias_data(dev, wcd939x);
>  =20
>   =09/* Check WCD9395 version */
>   =09regmap_read(wcd939x->regmap, WCD939X_DIGITAL_CHIP_ID1, &id1);
> @@ -3613,6 +3555,8 @@ static int wcd939x_probe(struct platform_device *pd=
ev)
>  =20
>   =09dev_set_drvdata(dev, wcd939x);
>   =09mutex_init(&wcd939x->micb_lock);
> +=09wcd939x->common.dev =3D dev;
> +=09wcd939x->common.max_bias =3D 4;
>  =20
>   =09ret =3D wcd939x_populate_dt_data(wcd939x, dev);
>   =09if (ret) {



