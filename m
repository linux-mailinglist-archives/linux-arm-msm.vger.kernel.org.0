Return-Path: <linux-arm-msm+bounces-117051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rXmgLyohTGq6ggEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:42:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5C715CC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:42:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Gf41fydi;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117051-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117051-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7565F301FFDB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884A547F2CA;
	Mon,  6 Jul 2026 21:41:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A147F2D3;
	Mon,  6 Jul 2026 21:41:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374117; cv=none; b=Uk29eyZ9+Y8++gHQIn3X1W5PfpmXICplPvX39Kx20LdlKUPCQ4wi/+PoZ0mFJOKukJfiqNT4mAUmqK9T7V8/NUfcUVJLzZIU0HuS2tv/ZuI8hge3GM5glGkgUWfCRh20fHeLHEKSVOddL9UDpnDGMXPlGku9ZpE3UyJvDfjzsl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374117; c=relaxed/simple;
	bh=3J0Fo4yba4Sl8TGOJEUHWDx5IRsrGMd2UIa1FdWf+Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ar84CYN8DzlxNinTgegGwlAgEPqSLofSaVBpbzD0uRBvhXlflsANiHesQDr13SfOkpNpKBddHDGRXJQBobrxgnZal5kHasX7Tv+lZ8h2VkapPJ4cX0NfU7ubknqz8KPjprkAKZ4N+HYPnUX+o1fzYYAEkshJ11tYgje++XXsXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gf41fydi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40F31F00ACF;
	Mon,  6 Jul 2026 21:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783374112;
	bh=QDQneGsQkI6GUwcZ7F90iZ0VFdH1q7VYixBFDuQLhhI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Gf41fydicqZ0kf1nVz1HELXAur6vVJd8GT5g9COYCH3e6pGmV86D2cDQu+XpH+pJT
	 0so7ODUgUjI5j+BUUbsQCWk5n6b4cJf7bvpSP4GShahp78lAZWgnrm4UJivNufqIRN
	 8d9FGMGz+RZeo8w4uJq9P1AsoHNgShPkgVqgikT8d13JkjlK1fLR9MsR0FZLV0jraE
	 JWXj1HVKjPKQU5nNE5jadZVyx/bKq2On7danx8uw7v9kf7tHPtNpX6EWEzvLtzTr3m
	 aTXkwoEfEnfirSirhNDeUl2F6c/74Ub7Ovm4oUC28+HJnhw73trWWFx/SDX2Jbn0pF
	 l2L0hu4+ZXHxQ==
Message-ID: <ac214cce-ccb2-4b21-a02e-2fc7816766bb@kernel.org>
Date: Mon, 6 Jul 2026 22:41:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ravi Hothi <ravi.hothi@oss.qualcomm.com>
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117051-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ravi.hothi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,catcrafts.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AE5C715CC7

On 7/6/26 8:22 PM, Jorijn van der Graaf wrote:
> The Qualcomm WCD9378 is the audio codec found on SM7635 boards such as
> the Fairphone 6. It pairs a WCD937x-compatible analog core with
> SDCA-style function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose
> built-in sequencers perform the analog power-up/down autonomously:
> capture is started by programming the ADC usage mode, requesting power
> state 0 on the function's power domain entity and letting the sequencer
> ramp the ADC and the mic bias selected through SMx_MB_SEL.

Thanks Jorijn for sending these patches over.

> 
> Like the other codecs of the family the WCD9378 presents two SoundWire
> slaves (manufacturer 0x0217, part 0x0110); a platform device created
> from the codec DT node acts as component master over the two slave
> devices, reusing the wcd-common helpers. Unlike the older family
> members, all control registers - the SDCA function blocks and the
> analog core alike - live in a 32-bit paged SDCA control address space
> accessed through the TX slave, so the slave regmap needs
> prop.paging_support (on Qualcomm controllers this in turn needs SCP
> address paging support in the controller driver).
> 
> Two hardware behaviours deserve a note:
> 
>  - The SDCA function engine does not survive SoundWire bus clock-stop.
>    Every register keeps its value (so a regcache sync restores
>    nothing), but the sequencers ignore all subsequent power requests,
>    including forced trigger and soft-reset writes; only a codec reset
>    revives the engine. The downstream driver sidesteps this by marking
>    the TX SoundWire master "qcom,is-always-on"; do the equivalent and
>    hold a runtime PM reference on the TX slave for as long as the
>    codec is bound. The FUNC_ACT class-load activation is likewise done
>    with plain writes rather than update_bits so the 0->1 activation
>    edge always reaches the wire regardless of regcache state.
> 
>    Scoping the reference to active capture and reviving the engine
>    with a codec reset on runtime resume was considered and rejected
>    for now: the reset tears down every SDCA function (including
>    future jack-detection state), forces re-enumeration of both slaves
>    and adds the ~65 ms class-load ritual to each capture start.
>    System sleep is untested and will need a reset-based recovery on
>    resume, since a runtime PM reference does not prevent clock-stop
>    across system suspend; that is a known limitation of this patch.
> 
>  - The TX analog gain field steps 1.5 dB per code (+30 dB over the
>    0..20 range), measured acoustically on a Fairphone 6 against a
>    fixed reference tone. The downstream wcd9378 driver corroborates
>    this: its TLV declares a 0..30 dB min/max over the same range.
>    (The wcd937x-family drivers declare 0.25 dB steps for the
>    equivalent field; whether that is correct for those chips has not
>    been verified here.)
> 
> Only the TX/capture paths (ADC1-3 fed from AMIC1-4, mic bias 1-3) are
> implemented; RX/playback, MBHC and the SmartAMP function can be added
> on top. The RX slave and a playback DAI are still registered: the
> codec is one component master over both slaves (the power topology
> and device links need the RX device bound), and registering both DAIs
> now keeps the DAI indices stable for machine drivers once playback
> lands. The ADC input muxes expose the full hardware routing;
> combinations not covered by any of the chip's 13 canned sys-usage
> profiles are rejected at sequencer power-up.

Was there a reason why RX not added?

I have been working on adding an SDCA compliant driver for this codec
for Glymur compute laptops just few weeks back, not fully ready yet.

@Ravi has been working on the same codec for a non compute device
(Eliza) and has made some good progress.

As this is an SDCA compliant codec, there might be way to get both modes
working with single driver (either with or without generic drivers),
which is something that I will be exploring in parallel.

Overall Looks like we could bring everything together to add better
support for this codec.

In the meantime Myself and Ravi will continue to test this codec along
with other changes and get back

Thanks for all the work and sharing it on the list.

--srini
> 
> Register sequences are derived from the GPL downstream wcd9378 driver
> in Qualcomm's audio-kernel-ar tree.
> 
> Verified on the Fairphone 6: handset mic capture through the LPASS TX
> macro at 48 kHz, repeated across reboots, including UCM-driven use by
> PipeWire in a Plasma Mobile session.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
> ---
>  sound/soc/codecs/Kconfig       |   19 +
>  sound/soc/codecs/Makefile      |    7 +
>  sound/soc/codecs/wcd9378-sdw.c |  495 ++++++++++++
>  sound/soc/codecs/wcd9378.c     | 1382 ++++++++++++++++++++++++++++++++
>  sound/soc/codecs/wcd9378.h     |  246 ++++++
>  5 files changed, 2149 insertions(+)
>  create mode 100644 sound/soc/codecs/wcd9378-sdw.c
>  create mode 100644 sound/soc/codecs/wcd9378.c
>  create mode 100644 sound/soc/codecs/wcd9378.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index a41d0f50825a..ac926a41305b 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -305,6 +305,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_WCD9335
>  	imply SND_SOC_WCD934X
>  	imply SND_SOC_WCD937X_SDW
> +	imply SND_SOC_WCD9378_SDW
>  	imply SND_SOC_WCD938X_SDW
>  	imply SND_SOC_WCD939X_SDW
>  	imply SND_SOC_LPASS_MACRO_COMMON
> @@ -2469,6 +2470,24 @@ config SND_SOC_WCD937X_SDW
>  	  via soundwire.
>  	  To compile this codec driver say Y or m.
>  
> +config SND_SOC_WCD9378
> +	depends on SND_SOC_WCD9378_SDW
> +	tristate
> +	depends on SOUNDWIRE || !SOUNDWIRE
> +	select SND_SOC_WCD_COMMON
> +
> +config SND_SOC_WCD9378_SDW
> +	tristate "WCD9378 Codec - SDW"
> +	select SND_SOC_WCD9378
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	help
> +	  The WCD9378 is an audio codec IC connected to the host over
> +	  SoundWire, found on Qualcomm SM7635 boards such as the
> +	  Fairphone 6. It has three ADCs for analog microphones, mic
> +	  bias supplies, headphone/earpiece outputs and MBHC.
> +	  To compile this codec driver say Y or m.
> +
>  config SND_SOC_WCD938X
>  	depends on SND_SOC_WCD938X_SDW
>  	tristate
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index aa0396e5b575..ef987493054e 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -360,6 +360,8 @@ snd-soc-wcd9335-y := wcd9335.o
>  snd-soc-wcd934x-y := wcd934x.o
>  snd-soc-wcd937x-y := wcd937x.o
>  snd-soc-wcd937x-sdw-y := wcd937x-sdw.o
> +snd-soc-wcd9378-y := wcd9378.o
> +snd-soc-wcd9378-sdw-y := wcd9378-sdw.o
>  snd-soc-wcd938x-y := wcd938x.o
>  snd-soc-wcd938x-sdw-y := wcd938x-sdw.o
>  snd-soc-wcd939x-y := wcd939x.o
> @@ -804,6 +806,11 @@ ifdef CONFIG_SND_SOC_WCD937X_SDW
>  # avoid link failure by forcing sdw code built-in when needed
>  obj-$(CONFIG_SND_SOC_WCD937X) += snd-soc-wcd937x-sdw.o
>  endif
> +obj-$(CONFIG_SND_SOC_WCD9378)	+= snd-soc-wcd9378.o
> +ifdef CONFIG_SND_SOC_WCD9378_SDW
> +# avoid link failure by forcing sdw code built-in when needed
> +obj-$(CONFIG_SND_SOC_WCD9378) += snd-soc-wcd9378-sdw.o
> +endif
>  obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
>  ifdef CONFIG_SND_SOC_WCD938X_SDW
>  # avoid link failure by forcing sdw code built-in when needed
> diff --git a/sound/soc/codecs/wcd9378-sdw.c b/sound/soc/codecs/wcd9378-sdw.c
> new file mode 100644
> index 000000000000..d9a99a6db500
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378-sdw.c
> @@ -0,0 +1,495 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Jorijn van der Graaf
> + *
> + * SoundWire slave driver for the Qualcomm WCD9378 audio codec.
> + *
> + * The codec presents two SoundWire slaves (RX and TX, mfg 0x0217 part
> + * 0x0110); the SDCA control space is a 32-bit paged register map accessed
> + * through the TX slave.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <sound/pcm_params.h>
> +
> +#include "wcd-common.h"
> +#include "wcd9378.h"
> +
> +#define WCD9378_SDW_CH(id, pn, cmask, mmask)	\
> +	[id] = {				\
> +		.port_num = pn,			\
> +		.ch_mask = cmask,		\
> +		.master_ch_mask = mmask,	\
> +	}
> +
> +/*
> + * Each ADC sits alone on its own TX device port (channel 1); by default
> + * they land on channels 1/2/3 of the same master port (SWRM_TX1 on the
> + * FP6). DMIC/MBHC masks per the downstream qcom,tx_swr_ch_map.
> + */
> +static struct wcd_sdw_ch_info wcd9378_sdw_tx_ch_info[] = {
> +	WCD9378_SDW_CH(WCD9378_ADC1, WCD9378_ADC_1_PORT, BIT(0), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_ADC2, WCD9378_ADC_2_PORT, BIT(0), BIT(1)),
> +	WCD9378_SDW_CH(WCD9378_ADC3, WCD9378_ADC_3_PORT, BIT(0), BIT(2)),
> +	WCD9378_SDW_CH(WCD9378_DMIC0, WCD9378_DMIC_0_1_MBHC_PORT, BIT(2), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_DMIC1, WCD9378_DMIC_0_1_MBHC_PORT, BIT(3), BIT(1)),
> +	WCD9378_SDW_CH(WCD9378_MBHC, WCD9378_DMIC_0_1_MBHC_PORT, BIT(2), BIT(2)),
> +	WCD9378_SDW_CH(WCD9378_DMIC2, WCD9378_DMIC_2_5_PORT, BIT(0), BIT(2)),
> +	WCD9378_SDW_CH(WCD9378_DMIC3, WCD9378_DMIC_2_5_PORT, BIT(1), BIT(3)),
> +	WCD9378_SDW_CH(WCD9378_DMIC4, WCD9378_DMIC_2_5_PORT, BIT(2), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_DMIC5, WCD9378_DMIC_2_5_PORT, BIT(3), BIT(1)),
> +};
> +
> +static struct wcd_sdw_ch_info wcd9378_sdw_rx_ch_info[] = {
> +	WCD9378_SDW_CH(WCD9378_HPH_L, WCD9378_HPH_PORT, BIT(0), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_HPH_R, WCD9378_HPH_PORT, BIT(1), BIT(1)),
> +	WCD9378_SDW_CH(WCD9378_CLSH, WCD9378_CLSH_PORT, BIT(0), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_COMP_L, WCD9378_COMP_PORT, BIT(0), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_COMP_R, WCD9378_COMP_PORT, BIT(1), BIT(1)),
> +	WCD9378_SDW_CH(WCD9378_LO, WCD9378_LO_PORT, BIT(0), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_DSD_L, WCD9378_DSD_PORT, BIT(0), BIT(0)),
> +	WCD9378_SDW_CH(WCD9378_DSD_R, WCD9378_DSD_PORT, BIT(1), BIT(1)),
> +};
> +
> +static struct sdw_dpn_prop wcd9378_dpn_prop[WCD9378_MAX_SWR_PORTS] = {
> +	{
> +		.num = 1,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 8,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		.num = 2,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 4,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		.num = 3,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 4,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		.num = 4,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 4,
> +		.simple_ch_prep_sm = true,
> +	}, {
> +		.num = 5,
> +		.type = SDW_DPN_SIMPLE,
> +		.min_ch = 1,
> +		.max_ch = 4,
> +		.simple_ch_prep_sm = true,
> +	}
> +};
> +
> +int wcd9378_sdw_hw_params(struct wcd9378_sdw_priv *wcd,
> +			  struct snd_pcm_substream *substream,
> +			  struct snd_pcm_hw_params *params,
> +			  struct snd_soc_dai *dai)
> +{
> +	struct sdw_port_config port_config[WCD9378_MAX_SWR_PORTS];
> +	unsigned long ch_mask;
> +	int i, j;
> +
> +	wcd->sconfig.ch_count = 1;
> +	wcd->active_ports = 0;
> +	for (i = 0; i < WCD9378_MAX_SWR_PORTS; i++) {
> +		ch_mask = wcd->port_config[i].ch_mask;
> +		if (!ch_mask)
> +			continue;
> +
> +		for_each_set_bit(j, &ch_mask, 4)
> +			wcd->sconfig.ch_count++;
> +
> +		port_config[wcd->active_ports] = wcd->port_config[i];
> +		wcd->active_ports++;
> +	}
> +
> +	wcd->sconfig.bps = 1;
> +	wcd->sconfig.frame_rate = params_rate(params);
> +	wcd->sconfig.direction = wcd->is_tx ? SDW_DATA_DIR_TX : SDW_DATA_DIR_RX;
> +	wcd->sconfig.type = SDW_STREAM_PCM;
> +
> +	return sdw_stream_add_slave(wcd->sdev, &wcd->sconfig,
> +				    &port_config[0], wcd->active_ports,
> +				    wcd->sruntime);
> +}
> +EXPORT_SYMBOL_GPL(wcd9378_sdw_hw_params);
> +
> +/*
> + * Tell the codec the bus clock: base 19.2 MHz plus a scale (div) per bank.
> + * The downstream driver writes these raw SCP registers on every capture
> + * start; here the bus_config callback covers bank switches.
> + */
> +static int wcd9378_bus_config(struct sdw_slave *slave,
> +			      struct sdw_bus_params *params)
> +{
> +	u8 scale;
> +
> +	switch (params->curr_dr_freq) {
> +	case 4800000:
> +		scale = WCD9378_SWRS_CLK_SCALE_DIV4;
> +		break;
> +	case 9600000:
> +	default:
> +		scale = WCD9378_SWRS_CLK_SCALE_DIV2;
> +		break;
> +	}
> +
> +	sdw_write(slave, WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(params->next_bank),
> +		  0x01);
> +	sdw_write(slave, WCD9378_SWRS_SCP_BASE_CLK,
> +		  WCD9378_SWRS_BASE_CLK_19P2MHZ);
> +	sdw_write(slave, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0, scale);
> +	sdw_write(slave, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1, scale);
> +
> +	return 0;
> +}
> +
> +static const struct sdw_slave_ops wcd9378_slave_ops = {
> +	.update_status = wcd_update_status,
> +	.bus_config = wcd9378_bus_config,
> +};
> +
> +static const struct reg_default wcd9378_defaults[] = {
> +	{ WCD9378_ANA_BIAS,			0x00 },
> +	{ WCD9378_ANA_TX_CH1,			0x20 },
> +	{ WCD9378_ANA_TX_CH2,			0x00 },
> +	{ WCD9378_ANA_TX_CH3,			0x20 },
> +	{ WCD9378_ANA_TX_CH3_HPF,		0x00 },
> +	{ WCD9378_ANA_MICB2_RAMP,		0x00 },
> +	{ WCD9378_BIAS_VBG_FINE_ADJ,		0x55 },
> +	{ WCD9378_MBHC_CTL_SPARE_1,		0x02 },
> +	{ WCD9378_MICB1_TEST_CTL_2,		0x00 },
> +	{ WCD9378_MICB2_TEST_CTL_2,		0x00 },
> +	{ WCD9378_MICB3_TEST_CTL_2,		0x80 },
> +	{ WCD9378_TX_COM_TXFE_DIV_CTL,		0x22 },
> +	{ WCD9378_SLEEP_CTL,			0x16 },
> +	{ WCD9378_TX_NEW_CH12_MUX,		0x11 },
> +	{ WCD9378_TX_NEW_CH34_MUX,		0x23 },
> +	{ WCD9378_TOP_CLK_CFG,			0x00 },
> +	{ WCD9378_CDC_ANA_TX_CLK_CTL,		0x0e },
> +	{ WCD9378_CDC_AMIC_CTL,			0x07 },
> +	{ WCD9378_PDM_WD_CTL0,			0x0f },
> +	{ WCD9378_PDM_WD_CTL1,			0x0f },
> +	{ WCD9378_PLATFORM_CTL,			0x01 },
> +	{ WCD9378_SYS_USAGE_CTRL,		0x00 },
> +	{ WCD9378_HPH_UP_T0,			0x02 },
> +	{ WCD9378_HPH_UP_T9,			0x02 },
> +	{ WCD9378_HPH_DN_T0,			0x05 },
> +	{ WCD9378_MICB_REMAP_TABLE_VAL_3,	0x00 },
> +	{ WCD9378_MICB_REMAP_TABLE_VAL_4,	0x00 },
> +	{ WCD9378_MICB_REMAP_TABLE_VAL_5,	0x00 },
> +	{ WCD9378_SM0_MB_SEL,			0x00 },
> +	{ WCD9378_SM1_MB_SEL,			0x00 },
> +	{ WCD9378_SM2_MB_SEL,			0x00 },
> +	{ WCD9378_MB_PULLUP_EN,			0x00 },
> +	{ WCD9378_SMP_AMP_FUNC_ACT,		0x00 },
> +	{ WCD9378_CMT_GRP_MASK,			0x00 },
> +	{ WCD9378_SMP_JACK_IT31_MICB,		0x00 },
> +	{ WCD9378_SMP_JACK_IT31_USAGE,		0x03 },
> +	{ WCD9378_SMP_JACK_PDE34_REQ_PS,	0x03 },
> +	{ WCD9378_SMP_JACK_FUNC_ACT,		0x00 },
> +	{ WCD9378_SMP_MIC_IT11_MICB(0),		0x00 },
> +	{ WCD9378_SMP_MIC_IT11_USAGE(0),	0x03 },
> +	{ WCD9378_SMP_MIC_PDE11_REQ_PS(0),	0x03 },
> +	{ WCD9378_SMP_MIC_FUNC_ACT(0),		0x00 },
> +	{ WCD9378_SMP_MIC_IT11_MICB(1),		0x00 },
> +	{ WCD9378_SMP_MIC_IT11_USAGE(1),	0x03 },
> +	{ WCD9378_SMP_MIC_PDE11_REQ_PS(1),	0x03 },
> +	{ WCD9378_SMP_MIC_FUNC_ACT(1),		0x00 },
> +	{ WCD9378_SMP_MIC_IT11_MICB(2),		0x00 },
> +	{ WCD9378_SMP_MIC_IT11_USAGE(2),	0x03 },
> +	{ WCD9378_SMP_MIC_PDE11_REQ_PS(2),	0x03 },
> +	{ WCD9378_SMP_MIC_FUNC_ACT(2),		0x00 },
> +};
> +
> +static bool wcd9378_rdwr_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case WCD9378_ANA_BIAS:
> +	case WCD9378_ANA_TX_CH1:
> +	case WCD9378_ANA_TX_CH2:
> +	case WCD9378_ANA_TX_CH3:
> +	case WCD9378_ANA_TX_CH3_HPF:
> +	case WCD9378_ANA_MICB2_RAMP:
> +	case WCD9378_BIAS_VBG_FINE_ADJ:
> +	case WCD9378_MBHC_CTL_SPARE_1:
> +	case WCD9378_MICB1_TEST_CTL_2:
> +	case WCD9378_MICB2_TEST_CTL_2:
> +	case WCD9378_MICB3_TEST_CTL_2:
> +	case WCD9378_TX_COM_TXFE_DIV_CTL:
> +	case WCD9378_SLEEP_CTL:
> +	case WCD9378_TX_NEW_CH12_MUX:
> +	case WCD9378_TX_NEW_CH34_MUX:
> +	case WCD9378_HPH_RDAC_GAIN_CTL:
> +	case WCD9378_HPH_RDAC_HD2_CTL_L:
> +	case WCD9378_HPH_RDAC_HD2_CTL_R:
> +	case WCD9378_TOP_CLK_CFG:
> +	case WCD9378_CDC_ANA_TX_CLK_CTL:
> +	case WCD9378_CDC_AMIC_CTL:
> +	case WCD9378_PDM_WD_CTL0:
> +	case WCD9378_PDM_WD_CTL1:
> +	case WCD9378_PLATFORM_CTL:
> +	case WCD9378_SYS_USAGE_CTRL:
> +	case WCD9378_HPH_UP_T0:
> +	case WCD9378_HPH_UP_T9:
> +	case WCD9378_HPH_DN_T0:
> +	case WCD9378_MICB_REMAP_TABLE_VAL_3:
> +	case WCD9378_MICB_REMAP_TABLE_VAL_4:
> +	case WCD9378_MICB_REMAP_TABLE_VAL_5:
> +	case WCD9378_SM0_MB_SEL:
> +	case WCD9378_SM1_MB_SEL:
> +	case WCD9378_SM2_MB_SEL:
> +	case WCD9378_MB_PULLUP_EN:
> +	case WCD9378_SMP_AMP_FUNC_STAT:
> +	case WCD9378_SMP_AMP_FUNC_ACT:
> +	case WCD9378_CMT_GRP_MASK:
> +	case WCD9378_SMP_JACK_IT31_MICB:
> +	case WCD9378_SMP_JACK_IT31_USAGE:
> +	case WCD9378_SMP_JACK_PDE34_REQ_PS:
> +	case WCD9378_SMP_JACK_FUNC_STAT:
> +	case WCD9378_SMP_JACK_FUNC_ACT:
> +	case WCD9378_SMP_MIC_IT11_MICB(0):
> +	case WCD9378_SMP_MIC_IT11_USAGE(0):
> +	case WCD9378_SMP_MIC_PDE11_REQ_PS(0):
> +	case WCD9378_SMP_MIC_FUNC_STAT(0):
> +	case WCD9378_SMP_MIC_FUNC_ACT(0):
> +	case WCD9378_SMP_MIC_IT11_MICB(1):
> +	case WCD9378_SMP_MIC_IT11_USAGE(1):
> +	case WCD9378_SMP_MIC_PDE11_REQ_PS(1):
> +	case WCD9378_SMP_MIC_FUNC_STAT(1):
> +	case WCD9378_SMP_MIC_FUNC_ACT(1):
> +	case WCD9378_SMP_MIC_IT11_MICB(2):
> +	case WCD9378_SMP_MIC_IT11_USAGE(2):
> +	case WCD9378_SMP_MIC_PDE11_REQ_PS(2):
> +	case WCD9378_SMP_MIC_FUNC_STAT(2):
> +	case WCD9378_SMP_MIC_FUNC_ACT(2):
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool wcd9378_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case WCD9378_FUNC_EXT_ID_0:
> +	case WCD9378_FUNC_EXT_ID_1:
> +	case WCD9378_FUNC_EXT_VER:
> +	case WCD9378_FUNC_STAT:
> +	case WCD9378_DEV_MANU_ID_0:
> +	case WCD9378_DEV_MANU_ID_1:
> +	case WCD9378_DEV_PART_ID_0:
> +	case WCD9378_DEV_PART_ID_1:
> +	case WCD9378_DEV_VER:
> +	case WCD9378_EFUSE_REG_16:
> +	case WCD9378_EFUSE_REG_29:
> +	case WCD9378_SEQ_TX0_STAT:
> +	case WCD9378_SEQ_TX1_STAT:
> +	case WCD9378_SEQ_TX2_STAT:
> +	case WCD9378_SMP_AMP_FUNC_STAT:
> +	case WCD9378_SMP_JACK_FUNC_STAT:
> +	case WCD9378_SMP_JACK_PDE34_ACT_PS:
> +	case WCD9378_SMP_MIC_FUNC_STAT(0):
> +	case WCD9378_SMP_MIC_FUNC_STAT(1):
> +	case WCD9378_SMP_MIC_FUNC_STAT(2):
> +	case WCD9378_SMP_MIC_OT10_USAGE(0):
> +	case WCD9378_SMP_MIC_PDE11_ACT_PS(0):
> +	case WCD9378_SMP_MIC_OT10_USAGE(1):
> +	case WCD9378_SMP_MIC_PDE11_ACT_PS(1):
> +	case WCD9378_SMP_MIC_OT10_USAGE(2):
> +	case WCD9378_SMP_MIC_PDE11_ACT_PS(2):
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool wcd9378_readable_register(struct device *dev, unsigned int reg)
> +{
> +	if (wcd9378_volatile_register(dev, reg))
> +		return true;
> +
> +	return wcd9378_rdwr_register(dev, reg);
> +}
> +
> +static const struct regmap_config wcd9378_regmap_config = {
> +	.name = "wcd9378_csr",
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_MAPLE,
> +	.reg_defaults = wcd9378_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(wcd9378_defaults),
> +	.max_register = WCD9378_MAX_REGISTER,
> +	.readable_reg = wcd9378_readable_register,
> +	.writeable_reg = wcd9378_rdwr_register,
> +	.volatile_reg = wcd9378_volatile_register,
> +};
> +
> +static int wcd9378_sdw_probe(struct sdw_slave *pdev,
> +			     const struct sdw_device_id *id)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct wcd9378_sdw_priv *wcd;
> +	u8 master_ch_mask[WCD9378_MAX_SWR_CH_IDS];
> +	int master_ch_mask_size = 0;
> +	int ret, i;
> +
> +	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
> +	if (!wcd)
> +		return -ENOMEM;
> +
> +	/* Port map index starts at 0, however the data ports start at index 1 */
> +	if (of_property_present(dev->of_node, "qcom,tx-port-mapping")) {
> +		wcd->is_tx = true;
> +		ret = of_property_read_u32_array(dev->of_node, "qcom,tx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD9378_MAX_TX_SWR_PORTS);
> +	} else {
> +		ret = of_property_read_u32_array(dev->of_node, "qcom,rx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD9378_MAX_SWR_PORTS);
> +	}
> +	if (ret < 0)
> +		dev_info(dev, "Error getting static port mapping for %s (%d)\n",
> +			 wcd->is_tx ? "TX" : "RX", ret);
> +
> +	wcd->sdev = pdev;
> +	dev_set_drvdata(dev, wcd);
> +
> +	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH |
> +				   SDW_SCP_INT1_PARITY;
> +	pdev->prop.lane_control_support = true;
> +	pdev->prop.simple_clk_stop_capable = true;
> +	/* The SDCA control space sits above the 16-bit address range */
> +	pdev->prop.paging_support = true;
> +
> +	memset(master_ch_mask, 0, WCD9378_MAX_SWR_CH_IDS);
> +
> +	if (wcd->is_tx) {
> +		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
> +								 "qcom,tx-channel-mapping");
> +		master_ch_mask_size = min_t(int, master_ch_mask_size,
> +					    ARRAY_SIZE(wcd9378_sdw_tx_ch_info));
> +
> +		if (master_ch_mask_size > 0)
> +			ret = of_property_read_u8_array(dev->of_node,
> +							"qcom,tx-channel-mapping",
> +							master_ch_mask,
> +							master_ch_mask_size);
> +	} else {
> +		master_ch_mask_size = of_property_count_u8_elems(dev->of_node,
> +								 "qcom,rx-channel-mapping");
> +		master_ch_mask_size = min_t(int, master_ch_mask_size,
> +					    ARRAY_SIZE(wcd9378_sdw_rx_ch_info));
> +
> +		if (master_ch_mask_size > 0)
> +			ret = of_property_read_u8_array(dev->of_node,
> +							"qcom,rx-channel-mapping",
> +							master_ch_mask,
> +							master_ch_mask_size);
> +	}
> +
> +	if (wcd->is_tx) {
> +		pdev->prop.source_ports = GENMASK(WCD9378_MAX_TX_SWR_PORTS, 1);
> +		pdev->prop.src_dpn_prop = wcd9378_dpn_prop;
> +		wcd->ch_info = &wcd9378_sdw_tx_ch_info[0];
> +
> +		for (i = 0; i < master_ch_mask_size; i++)
> +			wcd->ch_info[i].master_ch_mask = WCD9378_SWRM_CH_MASK(master_ch_mask[i]);
> +
> +		pdev->prop.wake_capable = true;
> +
> +		wcd->regmap = devm_regmap_init_sdw(pdev, &wcd9378_regmap_config);
> +		if (IS_ERR(wcd->regmap))
> +			return dev_err_probe(dev, PTR_ERR(wcd->regmap),
> +					     "Regmap init failed\n");
> +
> +		/* Start in cache-only until device is enumerated */
> +		regcache_cache_only(wcd->regmap, true);
> +	} else {
> +		pdev->prop.sink_ports = GENMASK(WCD9378_MAX_SWR_PORTS, 1);
> +		pdev->prop.sink_dpn_prop = wcd9378_dpn_prop;
> +		wcd->ch_info = &wcd9378_sdw_rx_ch_info[0];
> +
> +		for (i = 0; i < master_ch_mask_size; i++)
> +			wcd->ch_info[i].master_ch_mask = WCD9378_SWRM_CH_MASK(master_ch_mask[i]);
> +	}
> +
> +	ret = component_add(dev, &wcd_sdw_component_ops);
> +	if (ret)
> +		return ret;
> +
> +	/* Set suspended until aggregate device is bind */
> +	pm_runtime_set_suspended(dev);
> +
> +	return 0;
> +}
> +
> +static void wcd9378_sdw_remove(struct sdw_slave *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	component_del(dev, &wcd_sdw_component_ops);
> +}
> +
> +static const struct sdw_device_id wcd9378_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x0110, 0),
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(sdw, wcd9378_sdw_id);
> +
> +static int wcd9378_sdw_runtime_suspend(struct device *dev)
> +{
> +	struct wcd9378_sdw_priv *wcd = dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, true);
> +		regcache_mark_dirty(wcd->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd9378_sdw_runtime_resume(struct device *dev)
> +{
> +	struct wcd9378_sdw_priv *wcd = dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, false);
> +		regcache_sync(wcd->regmap);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops wcd9378_sdw_pm_ops = {
> +	RUNTIME_PM_OPS(wcd9378_sdw_runtime_suspend, wcd9378_sdw_runtime_resume, NULL)
> +};
> +
> +static struct sdw_driver wcd9378_sdw_driver = {
> +	.probe = wcd9378_sdw_probe,
> +	.remove = wcd9378_sdw_remove,
> +	.ops = &wcd9378_slave_ops,
> +	.id_table = wcd9378_sdw_id,
> +	.driver = {
> +		.name = "wcd9378-sdw",
> +		.pm = pm_ptr(&wcd9378_sdw_pm_ops),
> +	}
> +};
> +module_sdw_driver(wcd9378_sdw_driver);
> +
> +MODULE_DESCRIPTION("WCD9378 SDW codec driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/wcd9378.c b/sound/soc/codecs/wcd9378.c
> new file mode 100644
> index 000000000000..f4c4792d9d33
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378.c
> @@ -0,0 +1,1382 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026, Jorijn van der Graaf
> + *
> + * Qualcomm WCD9378 audio codec driver.
> + *
> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
> + * function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
> + * sequencers perform the analog power-up/down autonomously: capture is
> + * started by programming the ADC usage mode (ITxx_USAGE), requesting
> + * power state 0 on the function's PDE, and letting the sequencer ramp
> + * the micbias selected through SMx_MB_SEL.
> + *
> + * TX/capture paths only for now; RX (earpiece/headphone), MBHC and the
> + * SmartAMP function are not implemented.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/tlv.h>
> +
> +#include "wcd-common.h"
> +#include "wcd9378.h"
> +
> +enum {
> +	AIF1_PB = 0,
> +	AIF1_CAP,
> +	NUM_CODEC_DAIS,
> +};
> +
> +enum {
> +	MIC_BIAS_1 = 1,
> +	MIC_BIAS_2,
> +	MIC_BIAS_3,
> +};
> +
> +enum {
> +	MICB_PULLUP_ENABLE,
> +	MICB_PULLUP_DISABLE,
> +	MICB_ENABLE,
> +	MICB_DISABLE,
> +};
> +
> +/* sys-usage capability bits (SYS_USAGE_CTRL profile contents) */
> +enum {
> +	WCD9378_SYS_USAGE_CLASS_AB = 0,
> +	WCD9378_SYS_USAGE_TX1_FOR_JACK,
> +	WCD9378_SYS_USAGE_TX2_AMIC4,
> +	WCD9378_SYS_USAGE_TX2_AMIC1,
> +	WCD9378_SYS_USAGE_TX1_AMIC3,
> +	WCD9378_SYS_USAGE_TX1_AMIC2,
> +	WCD9378_SYS_USAGE_TX0_AMIC2,
> +	WCD9378_SYS_USAGE_TX0_AMIC1,
> +	WCD9378_SYS_USAGE_RX2_EAR,
> +	WCD9378_SYS_USAGE_RX2_AUX,
> +	WCD9378_SYS_USAGE_RX1_AUX,
> +	WCD9378_SYS_USAGE_RX0_EAR,
> +	WCD9378_SYS_USAGE_RX0_RX1_HPH,
> +};
> +
> +/* Capability sets of the 13 canned SYS_USAGE_CTRL profiles */
> +static const unsigned int wcd9378_sys_usage_profiles[] = {
> +	0x0c95, 0x12a7, 0x0c99, 0x1aab, 0x0894, 0x11a6, 0x0898,
> +	0x11ab, 0x126a, 0x116b, 0x1ca7, 0x1195, 0x1296,
> +};
> +
> +struct wcd9378_priv {
> +	struct sdw_slave *tx_sdw_dev;
> +	struct wcd9378_sdw_priv *sdw_priv[NUM_CODEC_DAIS];
> +	struct device *txdev;
> +	struct device *rxdev;
> +	struct device_node *rxnode;
> +	struct device_node *txnode;
> +	struct regmap *regmap;
> +	struct wcd_common common;
> +	/* micbias refcount lock */
> +	struct mutex micb_lock;
> +	u8 micb_usage_val[WCD9378_MAX_MICBIAS];
> +	int micb_ref[WCD9378_MAX_MICBIAS];
> +	int pullup_ref[WCD9378_MAX_MICBIAS];
> +	unsigned long sys_usage_mask;
> +	/* per-ADC profile bit and target function, latched at power-up */
> +	int tx_sys_bit[3];
> +	bool tx_is_jack[3];
> +	u32 tx_mode[3];
> +	struct gpio_desc *reset_gpio;
> +};
> +
> +static const char * const wcd9378_supplies[] = {
> +	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias",
> +};
> +
> +/* SDCA function block registers driving one ADC */
> +struct wcd9378_smp_fn {
> +	u32 usage_reg;
> +	u32 micb_reg;
> +	u32 req_reg;
> +	u32 act_reg;
> +	u32 hpf_reg;
> +	u8 hpf_mask;
> +};
> +
> +/* ADC1/2/3 through SmartMIC0/1/2 */
> +static const struct wcd9378_smp_fn wcd9378_smp_mic[] = {
> +	{
> +		.usage_reg = WCD9378_SMP_MIC_IT11_USAGE(0),
> +		.micb_reg = WCD9378_SMP_MIC_IT11_MICB(0),
> +		.req_reg = WCD9378_SMP_MIC_PDE11_REQ_PS(0),
> +		.act_reg = WCD9378_SMP_MIC_PDE11_ACT_PS(0),
> +		.hpf_reg = WCD9378_ANA_TX_CH2,
> +		.hpf_mask = WCD9378_ANA_TX_CH2_HPF1_INIT,
> +	}, {
> +		.usage_reg = WCD9378_SMP_MIC_IT11_USAGE(1),
> +		.micb_reg = WCD9378_SMP_MIC_IT11_MICB(1),
> +		.req_reg = WCD9378_SMP_MIC_PDE11_REQ_PS(1),
> +		.act_reg = WCD9378_SMP_MIC_PDE11_ACT_PS(1),
> +		.hpf_reg = WCD9378_ANA_TX_CH2,
> +		.hpf_mask = WCD9378_ANA_TX_CH2_HPF2_INIT,
> +	}, {
> +		.usage_reg = WCD9378_SMP_MIC_IT11_USAGE(2),
> +		.micb_reg = WCD9378_SMP_MIC_IT11_MICB(2),
> +		.req_reg = WCD9378_SMP_MIC_PDE11_REQ_PS(2),
> +		.act_reg = WCD9378_SMP_MIC_PDE11_ACT_PS(2),
> +		.hpf_reg = WCD9378_ANA_TX_CH3_HPF,
> +		.hpf_mask = WCD9378_ANA_TX_CH3_HPF3_INIT,
> +	},
> +};
> +
> +/* ADC2 fed from AMIC2 runs through the SmartJACK function instead */
> +static const struct wcd9378_smp_fn wcd9378_smp_jack_adc2 = {
> +	.usage_reg = WCD9378_SMP_JACK_IT31_USAGE,
> +	.micb_reg = WCD9378_SMP_JACK_IT31_MICB,
> +	.req_reg = WCD9378_SMP_JACK_PDE34_REQ_PS,
> +	.act_reg = WCD9378_SMP_JACK_PDE34_ACT_PS,
> +};
> +
> +/*
> + * Measured acoustically on the FP6: the TX gain field steps 1.5 dB per
> + * code (+6 dB per 4 codes, +30 dB over the full 0..20 range). The
> + * wcd937x-family drivers claim 0.25 dB steps for the same field.
> + */
> +static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 150, 0);
> +
> +static void wcd9378_reset(struct wcd9378_priv *wcd9378)
> +{
> +	gpiod_set_value(wcd9378->reset_gpio, 1);
> +	usleep_range(20, 30);
> +	gpiod_set_value(wcd9378->reset_gpio, 0);
> +	usleep_range(20, 30);
> +}
> +
> +/*
> + * Activate the SDCA function classes. Without FUNC_ACT the sequencer
> + * ignores all PDE power-state requests.
> + */
> +static void wcd9378_class_load(struct snd_soc_component *component)
> +{
> +	int i;
> +
> +	/*
> +	 * Plain writes, not update_bits, so the 0->1 activation edge
> +	 * always reaches the hardware regardless of regcache state.
> +	 * The engine boots from this edge only on a freshly reset
> +	 * codec; once it dies (bus clock-stop) no register write
> +	 * revives it, see the TX bus PM hold in wcd9378_bind().
> +	 */
> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_ACT, 0x00);
> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_ACT, 0x01);
> +	usleep_range(20000, 20010);
> +	snd_soc_component_write(component, WCD9378_SMP_AMP_FUNC_STAT, 0xff);
> +
> +	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_ACT, 0x00);
> +	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_ACT, 0x01);
> +	usleep_range(30000, 30010);
> +	snd_soc_component_update_bits(component, WCD9378_CMT_GRP_MASK,
> +				      0xff, 0x02);
> +	snd_soc_component_write(component, WCD9378_SMP_JACK_FUNC_STAT, 0xff);
> +
> +	for (i = 0; i < 3; i++) {
> +		snd_soc_component_write(component,
> +					WCD9378_SMP_MIC_FUNC_ACT(i), 0x00);
> +		snd_soc_component_write(component,
> +					WCD9378_SMP_MIC_FUNC_ACT(i), 0x01);
> +		usleep_range(5000, 5010);
> +		snd_soc_component_write(component,
> +					WCD9378_SMP_MIC_FUNC_STAT(i), 0xff);
> +	}
> +}
> +
> +static void wcd9378_io_init(struct snd_soc_component *component)
> +{
> +	u32 efuse;
> +
> +	/* Bandgap and analog master bias, with precharge pulse */
> +	efuse = snd_soc_component_read(component, WCD9378_EFUSE_REG_16);
> +	snd_soc_component_update_bits(component, WCD9378_MBHC_CTL_SPARE_1,
> +				      0x03, efuse == 0 ? 0x03 : 0x01);
> +	snd_soc_component_update_bits(component, WCD9378_SLEEP_CTL,
> +				      WCD9378_SLEEP_CTL_BG_CTL_MASK, 0x0e);
> +	snd_soc_component_update_bits(component, WCD9378_SLEEP_CTL,
> +				      WCD9378_SLEEP_CTL_BG_EN,
> +				      WCD9378_SLEEP_CTL_BG_EN);
> +	usleep_range(1000, 1010);
> +	snd_soc_component_update_bits(component, WCD9378_SLEEP_CTL,
> +				      WCD9378_SLEEP_CTL_LDOL_BG_SEL,
> +				      WCD9378_SLEEP_CTL_LDOL_BG_SEL);
> +	usleep_range(1000, 1010);
> +	snd_soc_component_update_bits(component, WCD9378_BIAS_VBG_FINE_ADJ,
> +				      0xf0, 0xb0);
> +	snd_soc_component_update_bits(component, WCD9378_ANA_BIAS,
> +				      WCD9378_ANA_BIAS_ANALOG_BIAS_EN,
> +				      WCD9378_ANA_BIAS_ANALOG_BIAS_EN);
> +	snd_soc_component_update_bits(component, WCD9378_ANA_BIAS,
> +				      WCD9378_ANA_BIAS_PRECHRG_EN,
> +				      WCD9378_ANA_BIAS_PRECHRG_EN);
> +	usleep_range(10000, 10010);
> +	snd_soc_component_update_bits(component, WCD9378_ANA_BIAS,
> +				      WCD9378_ANA_BIAS_PRECHRG_EN, 0x00);
> +
> +	/* TX supporting clocks/dividers */
> +	snd_soc_component_update_bits(component, WCD9378_CDC_ANA_TX_CLK_CTL,
> +				      WCD9378_CDC_ANA_TXSCBIAS_CLK_EN,
> +				      WCD9378_CDC_ANA_TXSCBIAS_CLK_EN);
> +	snd_soc_component_update_bits(component, WCD9378_TX_COM_TXFE_DIV_CTL,
> +				      WCD9378_TX_COM_TXFE_DIV_SEQ_BYPASS,
> +				      WCD9378_TX_COM_TXFE_DIV_SEQ_BYPASS);
> +	snd_soc_component_update_bits(component, WCD9378_PDM_WD_CTL0,
> +				      0x18, 0x10);
> +	snd_soc_component_update_bits(component, WCD9378_PDM_WD_CTL1,
> +				      0x18, 0x10);
> +
> +	/* Micbias LDO driver bias */
> +	snd_soc_component_update_bits(component, WCD9378_MICB1_TEST_CTL_2,
> +				      0x07, 0x01);
> +	snd_soc_component_update_bits(component, WCD9378_MICB2_TEST_CTL_2,
> +				      0x07, 0x01);
> +	snd_soc_component_update_bits(component, WCD9378_MICB3_TEST_CTL_2,
> +				      0x07, 0x01);
> +
> +	/* RX defaults (harmless while RX is unimplemented) */
> +	snd_soc_component_update_bits(component, WCD9378_HPH_RDAC_HD2_CTL_L,
> +				      0x0f, 0x04);
> +	snd_soc_component_update_bits(component, WCD9378_HPH_RDAC_HD2_CTL_R,
> +				      0x0f, 0x04);
> +	snd_soc_component_update_bits(component, WCD9378_HPH_RDAC_GAIN_CTL,
> +				      0xf0, 0x50);
> +	snd_soc_component_update_bits(component, WCD9378_HPH_UP_T0,
> +				      0x07, 0x05);
> +	snd_soc_component_update_bits(component, WCD9378_HPH_UP_T9,
> +				      0x07, 0x05);
> +	snd_soc_component_update_bits(component, WCD9378_HPH_DN_T0,
> +				      0x07, 0x06);
> +
> +	/* SmartMIC function N powers the micbias SMx_MB_SEL points at */
> +	snd_soc_component_update_bits(component, WCD9378_SM0_MB_SEL,
> +				      WCD9378_SM_MB_SEL_MASK, 0x01);
> +	snd_soc_component_update_bits(component, WCD9378_SM1_MB_SEL,
> +				      WCD9378_SM_MB_SEL_MASK, 0x02);
> +	snd_soc_component_update_bits(component, WCD9378_SM2_MB_SEL,
> +				      WCD9378_SM_MB_SEL_MASK, 0x03);
> +	snd_soc_component_update_bits(component, WCD9378_SYS_USAGE_CTRL,
> +				      WCD9378_SYS_USAGE_CTRL_MASK, 0x00);
> +
> +	wcd9378_class_load(component);
> +}
> +
> +/*
> + * Derive the sys-usage capability bit for an ADC from its input mux.
> + * Only combinations the canned profiles cover are usable.
> + */
> +static int wcd9378_sys_usage_bit_get(struct snd_soc_component *component,
> +				     int adc, bool *is_jack)
> +{
> +	u32 val;
> +
> +	*is_jack = false;
> +
> +	switch (adc) {
> +	case 0:
> +		val = snd_soc_component_read(component, WCD9378_TX_NEW_CH12_MUX) &
> +			WCD9378_TX_NEW_CH12_MUX_CH1_SEL_MASK;
> +		if (val == 0x01)
> +			return WCD9378_SYS_USAGE_TX0_AMIC1;
> +		if (val == 0x02)
> +			return WCD9378_SYS_USAGE_TX0_AMIC2;
> +		break;
> +	case 1:
> +		val = (snd_soc_component_read(component, WCD9378_TX_NEW_CH12_MUX) &
> +			WCD9378_TX_NEW_CH12_MUX_CH2_SEL_MASK) >> 3;
> +		if (val == 0x02) {
> +			*is_jack = true;
> +			return WCD9378_SYS_USAGE_TX1_AMIC2;
> +		}
> +		if (val == 0x03)
> +			return WCD9378_SYS_USAGE_TX1_AMIC3;
> +		break;
> +	case 2:
> +		val = snd_soc_component_read(component, WCD9378_TX_NEW_CH34_MUX) &
> +			WCD9378_TX_NEW_CH34_MUX_CH3_SEL_MASK;
> +		if (val == 0x01)
> +			return WCD9378_SYS_USAGE_TX2_AMIC1;
> +		if (val == 0x03)
> +			return WCD9378_SYS_USAGE_TX2_AMIC4;
> +		break;
> +	}
> +
> +	dev_err(component->dev,
> +		"ADC%d input mux selection not supported by any sys-usage profile\n",
> +		adc + 1);
> +	return -EINVAL;
> +}
> +
> +static int wcd9378_sys_usage_update(struct snd_soc_component *component,
> +				    int bit, bool enable)
> +{
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	int i;
> +
> +	if (!enable) {
> +		clear_bit(bit, &wcd9378->sys_usage_mask);
> +		return 0;
> +	}
> +
> +	set_bit(bit, &wcd9378->sys_usage_mask);
> +
> +	for (i = 0; i < ARRAY_SIZE(wcd9378_sys_usage_profiles); i++) {
> +		if ((wcd9378_sys_usage_profiles[i] & wcd9378->sys_usage_mask) ==
> +		    wcd9378->sys_usage_mask)
> +			break;
> +	}
> +
> +	if (i == ARRAY_SIZE(wcd9378_sys_usage_profiles)) {
> +		clear_bit(bit, &wcd9378->sys_usage_mask);
> +		dev_err(component->dev,
> +			"no sys-usage profile covers active paths (mask %#lx)\n",
> +			wcd9378->sys_usage_mask);
> +		return -EINVAL;
> +	}
> +
> +	snd_soc_component_update_bits(component, WCD9378_SYS_USAGE_CTRL,
> +				      WCD9378_SYS_USAGE_CTRL_MASK, i);
> +
> +	return 0;
> +}
> +
> +static u32 wcd9378_get_mode_val(struct wcd9378_priv *wcd9378, int adc)
> +{
> +	switch (wcd9378->tx_mode[adc]) {
> +	case 1:
> +		return WCD9378_ADC_USAGE_HIFI;
> +	case 2:
> +		return WCD9378_ADC_USAGE_LO_HIF;
> +	case 4:
> +		return WCD9378_ADC_USAGE_LP;
> +	case 0: /* ADC_INVALID (unset) */
> +	case 3:
> +	default:
> +		return WCD9378_ADC_USAGE_NORMAL;
> +	}
> +}
> +
> +/*
> + * Indicate the bus clock to the codec through the standard SCP
> + * BusClock_Base/Scale registers. The TX sequencers clock off the
> + * SoundWire bus clock and stall without this; the downstream driver
> + * writes these on every capture start and clears them on the last
> + * teardown.
> + */
> +/* Actual bus clock is half the SoundWire double-rate frequency */
> +static unsigned int wcd9378_tx_bus_clk(struct wcd9378_priv *wcd9378)
> +{
> +	return wcd9378->tx_sdw_dev->bus->params.curr_dr_freq / 2;
> +}
> +
> +static void wcd9378_swr_clk_indicate(struct wcd9378_priv *wcd9378, bool enable)
> +{
> +	struct sdw_slave *tx = wcd9378->tx_sdw_dev;
> +	u8 scale;
> +
> +	if (enable) {
> +		if (wcd9378_tx_bus_clk(wcd9378) >= 9600000)
> +			scale = WCD9378_SWRS_CLK_SCALE_DIV2;
> +		else
> +			scale = WCD9378_SWRS_CLK_SCALE_DIV4;
> +
> +		/*
> +		 * The downstream master broadcasts HOST_CLK_DIV2_CTL = 0x01
> +		 * (both banks) on every capture start; the sequencer does not
> +		 * power up without it.
> +		 */
> +		sdw_write(tx, WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(0), 0x01);
> +		sdw_write(tx, WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(1), 0x01);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BASE_CLK,
> +			  WCD9378_SWRS_BASE_CLK_19P2MHZ);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0, scale);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1, scale);
> +		sdw_write(tx, SDW_SCP_COMMIT, 0x02);
> +	} else {
> +		sdw_write(tx, WCD9378_SWRS_SCP_BASE_CLK, 0x00);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0, 0x00);
> +		sdw_write(tx, WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1, 0x00);
> +	}
> +}
> +
> +#define WCD9378_SYS_USAGE_TX_MASK	(BIT(WCD9378_SYS_USAGE_TX2_AMIC4) | \
> +					 BIT(WCD9378_SYS_USAGE_TX2_AMIC1) | \
> +					 BIT(WCD9378_SYS_USAGE_TX1_AMIC3) | \
> +					 BIT(WCD9378_SYS_USAGE_TX1_AMIC2) | \
> +					 BIT(WCD9378_SYS_USAGE_TX0_AMIC2) | \
> +					 BIT(WCD9378_SYS_USAGE_TX0_AMIC1))
> +
> +static int wcd9378_tx_sequencer_enable(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol,
> +				       int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	const struct wcd9378_smp_fn *fn;
> +	int adc = w->shift;
> +	bool is_jack = false;
> +	int sys_bit, retries;
> +	u32 val;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		sys_bit = wcd9378_sys_usage_bit_get(component, adc, &is_jack);
> +		if (sys_bit < 0)
> +			return sys_bit;
> +
> +		/*
> +		 * Latch the profile bit and the target function: the input
> +		 * mux can be rewritten while the path is powered, and
> +		 * power-down must tear down what was actually powered up.
> +		 */
> +		wcd9378->tx_sys_bit[adc] = sys_bit;
> +		wcd9378->tx_is_jack[adc] = is_jack;
> +		if (is_jack)
> +			fn = &wcd9378_smp_jack_adc2;
> +		else
> +			fn = &wcd9378_smp_mic[adc];
> +
> +		if (wcd9378_sys_usage_update(component, sys_bit, true))
> +			return -EINVAL;
> +
> +		/*
> +		 * NORMAL/HIFI ADC modes need a 9.6 MHz bus clock; on a
> +		 * 4.8 MHz bus only the LP mode is valid and anything else
> +		 * makes the sequencer refuse to power up.
> +		 */
> +		if (wcd9378_tx_bus_clk(wcd9378) < 9600000)
> +			val = WCD9378_ADC_USAGE_LP;
> +		else
> +			val = wcd9378_get_mode_val(wcd9378, adc);
> +
> +		snd_soc_component_update_bits(component, fn->usage_reg, 0xff, val);
> +		if (fn->hpf_reg)
> +			snd_soc_component_update_bits(component, fn->hpf_reg,
> +						      fn->hpf_mask, fn->hpf_mask);
> +		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
> +					      WCD9378_PDE_PS0_ON);
> +		usleep_range(800, 810);
> +
> +		wcd9378_swr_clk_indicate(wcd9378, true);
> +
> +		if (fn->hpf_reg)
> +			snd_soc_component_update_bits(component, fn->hpf_reg,
> +						      fn->hpf_mask, 0x00);
> +
> +		/* Wait for the sequencer to reach PS0 */
> +		retries = 20;
> +		do {
> +			val = snd_soc_component_read(component, fn->act_reg);
> +			if (val == WCD9378_PDE_PS0_ON)
> +				break;
> +			usleep_range(500, 510);
> +		} while (--retries);
> +		if (val != WCD9378_PDE_PS0_ON)
> +			dev_warn(component->dev,
> +				 "TX%d sequencer not in PS0 (act_ps %#x, bus %u Hz)\n",
> +				 adc, val,
> +				 wcd9378->tx_sdw_dev->bus->params.curr_dr_freq);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		sys_bit = wcd9378->tx_sys_bit[adc];
> +		if (sys_bit < 0)
> +			break;
> +		if (wcd9378->tx_is_jack[adc])
> +			fn = &wcd9378_smp_jack_adc2;
> +		else
> +			fn = &wcd9378_smp_mic[adc];
> +
> +		snd_soc_component_update_bits(component, fn->usage_reg, 0xff,
> +					      WCD9378_ADC_USAGE_OFF);
> +		if (fn->hpf_reg)
> +			snd_soc_component_update_bits(component, fn->hpf_reg,
> +						      fn->hpf_mask, 0x00);
> +		snd_soc_component_update_bits(component, fn->req_reg, 0xff,
> +					      WCD9378_PDE_PS3_OFF);
> +		usleep_range(800, 810);
> +		wcd9378_sys_usage_update(component, sys_bit, false);
> +		wcd9378->tx_sys_bit[adc] = -1;
> +
> +		if (!(wcd9378->sys_usage_mask & WCD9378_SYS_USAGE_TX_MASK))
> +			wcd9378_swr_clk_indicate(wcd9378, false);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd9378_micbias_control(struct snd_soc_component *component,
> +				   int micb_num, int req)
> +{
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	int mb_index = micb_num - 1;
> +	u32 usage_reg;
> +	u8 usage_val;
> +	u8 pullup_bit;
> +
> +	if (micb_num < MIC_BIAS_1 || micb_num > MIC_BIAS_3)
> +		return -EINVAL;
> +
> +	usage_reg = wcd9378_smp_mic[mb_index].micb_reg;
> +	usage_val = wcd9378->micb_usage_val[mb_index];
> +	pullup_bit = BIT(mb_index);
> +
> +	mutex_lock(&wcd9378->micb_lock);
> +
> +	switch (req) {
> +	case MICB_ENABLE:
> +		wcd9378->micb_ref[mb_index]++;
> +		if (wcd9378->micb_ref[mb_index] == 1) {
> +			if (micb_num == MIC_BIAS_2) {
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_ANA_MICB2_RAMP,
> +							      WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK,
> +							      0x0c);
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_ANA_MICB2_RAMP,
> +							      WCD9378_ANA_MICB2_RAMP_EN, 0x00);
> +			}
> +			snd_soc_component_update_bits(component, usage_reg,
> +						      0xff, usage_val);
> +			if (micb_num == MIC_BIAS_2)
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB,
> +							      0xff, usage_val);
> +		}
> +		break;
> +	case MICB_DISABLE:
> +		if (wcd9378->micb_ref[mb_index] > 0)
> +			wcd9378->micb_ref[mb_index]--;
> +		if (wcd9378->micb_ref[mb_index] == 0 &&
> +		    wcd9378->pullup_ref[mb_index] > 0) {
> +			snd_soc_component_update_bits(component,
> +						      WCD9378_MB_PULLUP_EN,
> +						      pullup_bit, pullup_bit);
> +			snd_soc_component_update_bits(component, usage_reg, 0xff,
> +						      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
> +			if (micb_num == MIC_BIAS_2)
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
> +							      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
> +		} else if (wcd9378->micb_ref[mb_index] == 0) {
> +			snd_soc_component_update_bits(component, usage_reg,
> +						      0xff, WCD9378_MICB_USAGE_OFF);
> +			if (micb_num == MIC_BIAS_2) {
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB,
> +							      0xff, WCD9378_MICB_USAGE_OFF);
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_ANA_MICB2_RAMP,
> +							      WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK,
> +							      0x0c);
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_ANA_MICB2_RAMP,
> +							      WCD9378_ANA_MICB2_RAMP_EN,
> +							      WCD9378_ANA_MICB2_RAMP_EN);
> +			}
> +		}
> +		break;
> +	case MICB_PULLUP_ENABLE:
> +		wcd9378->pullup_ref[mb_index]++;
> +		if (wcd9378->pullup_ref[mb_index] == 1 &&
> +		    wcd9378->micb_ref[mb_index] == 0) {
> +			snd_soc_component_update_bits(component,
> +						      WCD9378_MB_PULLUP_EN,
> +						      pullup_bit, pullup_bit);
> +			snd_soc_component_update_bits(component, usage_reg, 0xff,
> +						      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
> +			if (micb_num == MIC_BIAS_2)
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
> +							      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
> +		}
> +		break;
> +	case MICB_PULLUP_DISABLE:
> +		if (wcd9378->pullup_ref[mb_index] > 0)
> +			wcd9378->pullup_ref[mb_index]--;
> +		if (wcd9378->pullup_ref[mb_index] == 0 &&
> +		    wcd9378->micb_ref[mb_index] == 0) {
> +			snd_soc_component_update_bits(component,
> +						      WCD9378_MB_PULLUP_EN, pullup_bit, 0x00);
> +			snd_soc_component_update_bits(component, usage_reg, 0xff,
> +						      WCD9378_MICB_USAGE_PULL_DOWN);
> +			if (micb_num == MIC_BIAS_2)
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
> +							      WCD9378_MICB_USAGE_PULL_DOWN);
> +		}
> +		break;
> +	}
> +
> +	mutex_unlock(&wcd9378->micb_lock);
> +
> +	return 0;
> +}
> +
> +static int wcd9378_codec_enable_micbias(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	int micb_num = w->shift;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		wcd9378_micbias_control(component, micb_num, MICB_ENABLE);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		wcd9378_micbias_control(component, micb_num, MICB_DISABLE);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd9378_codec_enable_micbias_pullup(struct snd_soc_dapm_widget *w,
> +					       struct snd_kcontrol *kcontrol,
> +					       int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	int micb_num = w->shift;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		wcd9378_micbias_control(component, micb_num,
> +					MICB_PULLUP_ENABLE);
> +		break;
> +	case SND_SOC_DAPM_POST_PMU:
> +		usleep_range(1000, 1100);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		wcd9378_micbias_control(component, micb_num,
> +					MICB_PULLUP_DISABLE);
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd9378_connect_port(struct wcd9378_sdw_priv *wcd, u8 port_idx,
> +				u8 ch_id, bool enable)
> +{
> +	struct sdw_port_config *port_config = &wcd->port_config[port_idx - 1];
> +	const struct wcd_sdw_ch_info *ch_info = &wcd->ch_info[ch_id];
> +	u8 port_num = ch_info->port_num;
> +	u8 ch_mask = ch_info->ch_mask;
> +	u8 mstr_port_num, mstr_ch_mask;
> +	struct sdw_slave *sdev = wcd->sdev;
> +
> +	port_config->num = port_num;
> +
> +	mstr_port_num = sdev->m_port_map[port_num];
> +	mstr_ch_mask = ch_info->master_ch_mask;
> +
> +	if (enable) {
> +		port_config->ch_mask |= ch_mask;
> +		wcd->master_channel_map[mstr_port_num] |= mstr_ch_mask;
> +	} else {
> +		port_config->ch_mask &= ~ch_mask;
> +		wcd->master_channel_map[mstr_port_num] &= ~mstr_ch_mask;
> +	}
> +
> +	return 0;
> +}
> +
> +static int wcd9378_get_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(comp);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +
> +	wcd = wcd9378->sdw_priv[dai_id];
> +	portidx = wcd->ch_info[ch_idx].port_num;
> +
> +	ucontrol->value.integer.value[0] = wcd->port_enable[portidx];
> +
> +	return 0;
> +}
> +
> +static int wcd9378_set_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer = (struct soc_mixer_control *)kcontrol->private_value;
> +	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(comp);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id = mixer->shift;
> +	int ch_idx = mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	wcd = wcd9378->sdw_priv[dai_id];
> +	portidx = wcd->ch_info[ch_idx].port_num;
> +
> +	enable = ucontrol->value.integer.value[0];
> +
> +	if (enable == wcd->port_enable[portidx]) {
> +		wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +		return 0;
> +	}
> +
> +	wcd->port_enable[portidx] = enable;
> +	wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +
> +	return 1;
> +}
> +
> +static int wcd9378_tx_mode_get(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	int adc = e->shift_l;
> +
> +	ucontrol->value.enumerated.item[0] = wcd9378->tx_mode[adc];
> +
> +	return 0;
> +}
> +
> +static int wcd9378_tx_mode_put(struct snd_kcontrol *kcontrol,
> +			       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	int adc = e->shift_l;
> +	u32 mode_val = ucontrol->value.enumerated.item[0];
> +
> +	if (mode_val == wcd9378->tx_mode[adc])
> +		return 0;
> +
> +	wcd9378->tx_mode[adc] = mode_val;
> +
> +	return 1;
> +}
> +
> +static const char * const tx_mode_mux_text[] = {
> +	"ADC_INVALID", "ADC_HIFI", "ADC_LO_HIF", "ADC_NORMAL", "ADC_LP",
> +};
> +
> +static const struct soc_enum tx0_mode_enum =
> +	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(tx_mode_mux_text),
> +			tx_mode_mux_text);
> +static const struct soc_enum tx1_mode_enum =
> +	SOC_ENUM_SINGLE(SND_SOC_NOPM, 1, ARRAY_SIZE(tx_mode_mux_text),
> +			tx_mode_mux_text);
> +static const struct soc_enum tx2_mode_enum =
> +	SOC_ENUM_SINGLE(SND_SOC_NOPM, 2, ARRAY_SIZE(tx_mode_mux_text),
> +			tx_mode_mux_text);
> +
> +static const struct snd_kcontrol_new wcd9378_snd_controls[] = {
> +	SOC_SINGLE_TLV("ADC1 Volume", WCD9378_ANA_TX_CH1, 0, 20, 0,
> +		       analog_gain),
> +	SOC_SINGLE_TLV("ADC2 Volume", WCD9378_ANA_TX_CH2, 0, 20, 0,
> +		       analog_gain),
> +	SOC_SINGLE_TLV("ADC3 Volume", WCD9378_ANA_TX_CH3, 0, 20, 0,
> +		       analog_gain),
> +
> +	SOC_ENUM_EXT("TX0 MODE", tx0_mode_enum,
> +		     wcd9378_tx_mode_get, wcd9378_tx_mode_put),
> +	SOC_ENUM_EXT("TX1 MODE", tx1_mode_enum,
> +		     wcd9378_tx_mode_get, wcd9378_tx_mode_put),
> +	SOC_ENUM_EXT("TX2 MODE", tx2_mode_enum,
> +		     wcd9378_tx_mode_get, wcd9378_tx_mode_put),
> +
> +	SOC_SINGLE_EXT("ADC1 Switch", WCD9378_ADC1, AIF1_CAP, 1, 0,
> +		       wcd9378_get_swr_port, wcd9378_set_swr_port),
> +	SOC_SINGLE_EXT("ADC2 Switch", WCD9378_ADC2, AIF1_CAP, 1, 0,
> +		       wcd9378_get_swr_port, wcd9378_set_swr_port),
> +	SOC_SINGLE_EXT("ADC3 Switch", WCD9378_ADC3, AIF1_CAP, 1, 0,
> +		       wcd9378_get_swr_port, wcd9378_set_swr_port),
> +};
> +
> +static const char * const adc1_mux_text[] = {
> +	"CH1_AMIC_DISABLE", "CH1_AMIC1", "CH1_AMIC2", "CH1_AMIC3", "CH1_AMIC4",
> +};
> +
> +static const char * const adc2_mux_text[] = {
> +	"CH2_AMIC_DISABLE", "CH2_AMIC1", "CH2_AMIC2", "CH2_AMIC3", "CH2_AMIC4",
> +};
> +
> +static const char * const adc3_mux_text[] = {
> +	"CH3_AMIC_DISABLE", "CH3_AMIC1", "CH3_AMIC3", "CH3_AMIC4",
> +};
> +
> +static const struct soc_enum adc1_mux_enum =
> +	SOC_ENUM_SINGLE(WCD9378_TX_NEW_CH12_MUX, 0,
> +			ARRAY_SIZE(adc1_mux_text), adc1_mux_text);
> +static const struct soc_enum adc2_mux_enum =
> +	SOC_ENUM_SINGLE(WCD9378_TX_NEW_CH12_MUX, 3,
> +			ARRAY_SIZE(adc2_mux_text), adc2_mux_text);
> +static const struct soc_enum adc3_mux_enum =
> +	SOC_ENUM_SINGLE(WCD9378_TX_NEW_CH34_MUX, 0,
> +			ARRAY_SIZE(adc3_mux_text), adc3_mux_text);
> +
> +static const struct snd_kcontrol_new adc1_mux = SOC_DAPM_ENUM("ADC1 MUX", adc1_mux_enum);
> +static const struct snd_kcontrol_new adc2_mux = SOC_DAPM_ENUM("ADC2 MUX", adc2_mux_enum);
> +static const struct snd_kcontrol_new adc3_mux = SOC_DAPM_ENUM("ADC3 MUX", adc3_mux_enum);
> +
> +static const struct snd_kcontrol_new tx0_seq_switch =
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
> +static const struct snd_kcontrol_new tx1_seq_switch =
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
> +static const struct snd_kcontrol_new tx2_seq_switch =
> +	SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 1, 0);
> +
> +static const struct snd_soc_dapm_widget wcd9378_dapm_widgets[] = {
> +	/* Analog mic inputs */
> +	SND_SOC_DAPM_INPUT("AMIC1"),
> +	SND_SOC_DAPM_INPUT("AMIC2"),
> +	SND_SOC_DAPM_INPUT("AMIC3"),
> +	SND_SOC_DAPM_INPUT("AMIC4"),
> +
> +	/* ADC input muxes */
> +	SND_SOC_DAPM_MUX("ADC1 MUX", SND_SOC_NOPM, 0, 0, &adc1_mux),
> +	SND_SOC_DAPM_MUX("ADC2 MUX", SND_SOC_NOPM, 0, 0, &adc2_mux),
> +	SND_SOC_DAPM_MUX("ADC3 MUX", SND_SOC_NOPM, 0, 0, &adc3_mux),
> +
> +	/* SDCA TX sequencers (widget shift = ADC index) */
> +	SND_SOC_DAPM_MIXER_E("TX0 SEQUENCER", SND_SOC_NOPM, 0, 0,
> +			     &tx0_seq_switch, 1, wcd9378_tx_sequencer_enable,
> +			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MIXER_E("TX1 SEQUENCER", SND_SOC_NOPM, 1, 0,
> +			     &tx1_seq_switch, 1, wcd9378_tx_sequencer_enable,
> +			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_MIXER_E("TX2 SEQUENCER", SND_SOC_NOPM, 2, 0,
> +			     &tx2_seq_switch, 1, wcd9378_tx_sequencer_enable,
> +			     SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
> +
> +	/* Micbias supplies (widget shift = micbias number) */
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
> +			    wcd9378_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
> +			    wcd9378_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
> +			    wcd9378_codec_enable_micbias,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS1", SND_SOC_NOPM, MIC_BIAS_1, 0,
> +			    wcd9378_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS2", SND_SOC_NOPM, MIC_BIAS_2, 0,
> +			    wcd9378_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("VA MIC BIAS3", SND_SOC_NOPM, MIC_BIAS_3, 0,
> +			    wcd9378_codec_enable_micbias_pullup,
> +			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
> +			    SND_SOC_DAPM_POST_PMD),
> +
> +	/* Outputs towards the SoundWire TX bus / LPASS TX macro */
> +	SND_SOC_DAPM_OUTPUT("ADC1_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("ADC2_OUTPUT"),
> +	SND_SOC_DAPM_OUTPUT("ADC3_OUTPUT"),
> +};
> +
> +static const struct snd_soc_dapm_route wcd9378_audio_map[] = {
> +	{ "ADC1_OUTPUT", NULL, "TX0 SEQUENCER" },
> +	{ "TX0 SEQUENCER", "Switch", "ADC1 MUX" },
> +	{ "ADC1 MUX", "CH1_AMIC1", "AMIC1" },
> +	{ "ADC1 MUX", "CH1_AMIC2", "AMIC2" },
> +	{ "ADC1 MUX", "CH1_AMIC3", "AMIC3" },
> +	{ "ADC1 MUX", "CH1_AMIC4", "AMIC4" },
> +
> +	{ "ADC2_OUTPUT", NULL, "TX1 SEQUENCER" },
> +	{ "TX1 SEQUENCER", "Switch", "ADC2 MUX" },
> +	{ "ADC2 MUX", "CH2_AMIC1", "AMIC1" },
> +	{ "ADC2 MUX", "CH2_AMIC2", "AMIC2" },
> +	{ "ADC2 MUX", "CH2_AMIC3", "AMIC3" },
> +	{ "ADC2 MUX", "CH2_AMIC4", "AMIC4" },
> +
> +	{ "ADC3_OUTPUT", NULL, "TX2 SEQUENCER" },
> +	{ "TX2 SEQUENCER", "Switch", "ADC3 MUX" },
> +	{ "ADC3 MUX", "CH3_AMIC1", "AMIC1" },
> +	{ "ADC3 MUX", "CH3_AMIC3", "AMIC3" },
> +	{ "ADC3 MUX", "CH3_AMIC4", "AMIC4" },
> +};
> +
> +/*
> + * Map the DT micbias millivolt values onto ITxx_MICB usage codes;
> + * non-standard voltages go through the sequencer remap table.
> + */
> +static void wcd9378_set_micb_usage_vals(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	static const u32 remap_regs[] = {
> +		WCD9378_MICB_REMAP_TABLE_VAL_3,
> +		WCD9378_MICB_REMAP_TABLE_VAL_4,
> +		WCD9378_MICB_REMAP_TABLE_VAL_5,
> +	};
> +	int i, vout;
> +
> +	for (i = 0; i < WCD9378_MAX_MICBIAS; i++) {
> +		switch (wcd9378->common.micb_mv[i]) {
> +		case 1200:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_1P2V;
> +			break;
> +		case 1800:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_1P8V_OR_PULLUP;
> +			break;
> +		case 2200:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P2V;
> +			break;
> +		case 2500:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P5V;
> +			break;
> +		case 2700:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P7V;
> +			break;
> +		case 2750:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P75V;
> +			break;
> +		case 2800:
> +			wcd9378->micb_usage_val[i] = WCD9378_MICB_USAGE_2P8V;
> +			break;
> +		default:
> +			vout = wcd_get_micb_vout_ctl_val(component->dev,
> +							 wcd9378->common.micb_mv[i]);
> +			if (vout < 0) {
> +				wcd9378->micb_usage_val[i] =
> +					WCD9378_MICB_USAGE_1P8V_OR_PULLUP;
> +				break;
> +			}
> +			snd_soc_component_update_bits(component, remap_regs[i],
> +						      0xff, vout);
> +			wcd9378->micb_usage_val[i] =
> +				WCD9378_MICB_USAGE_REMAP_TABLE_3 + i;
> +			break;
> +		}
> +	}
> +}
> +
> +static int wcd9378_soc_codec_probe(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 = snd_soc_component_get_drvdata(component);
> +	struct device *dev = component->dev;
> +	unsigned int part0 = 0, part1 = 0;
> +	int ret;
> +
> +	ret = sdw_slave_wait_for_init(wcd9378->tx_sdw_dev, 5000);
> +	if (ret)
> +		return ret;
> +
> +	snd_soc_component_init_regmap(component, wcd9378->regmap);
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_0, &part0);
> +	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_1, &part1);
> +	dev_dbg(dev, "WCD9378 part id %#x\n", (part1 << 8) | part0);
> +
> +	/*
> +	 * SDCA interrupt type configuration, mirroring the downstream init
> +	 * sequence. Nothing consumes these interrupts yet (no MBHC support);
> +	 * kept so the bring-up sequence validated on hardware is unchanged.
> +	 */
> +	sdw_write(wcd9378->tx_sdw_dev, WCD9378_SWRS_SCP_SDCA_INTRTYPE_1, 0xff);
> +	sdw_write(wcd9378->tx_sdw_dev, WCD9378_SWRS_SCP_SDCA_INTRTYPE_2, 0x0b);
> +	sdw_write(wcd9378->tx_sdw_dev, WCD9378_SWRS_SCP_SDCA_INTRTYPE_3, 0xff);
> +
> +	wcd9378_io_init(component);
> +	wcd9378_set_micb_usage_vals(component);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_component_driver soc_codec_dev_wcd9378 = {
> +	.name = "wcd9378_codec",
> +	.probe = wcd9378_soc_codec_probe,
> +	.controls = wcd9378_snd_controls,
> +	.num_controls = ARRAY_SIZE(wcd9378_snd_controls),
> +	.dapm_widgets = wcd9378_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(wcd9378_dapm_widgets),
> +	.dapm_routes = wcd9378_audio_map,
> +	.num_dapm_routes = ARRAY_SIZE(wcd9378_audio_map),
> +	.endianness = 1,
> +};
> +
> +static int wcd9378_codec_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dai->dev);
> +	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
> +
> +	return wcd9378_sdw_hw_params(wcd, substream, params, dai);
> +}
> +
> +static int wcd9378_codec_free(struct snd_pcm_substream *substream,
> +			      struct snd_soc_dai *dai)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dai->dev);
> +	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
> +
> +	return sdw_stream_remove_slave(wcd->sdev, wcd->sruntime);
> +}
> +
> +static int wcd9378_codec_set_sdw_stream(struct snd_soc_dai *dai,
> +					void *stream, int direction)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dai->dev);
> +	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
> +
> +	wcd->sruntime = stream;
> +
> +	return 0;
> +}
> +
> +static int wcd9378_get_channel_map(const struct snd_soc_dai *dai,
> +				   unsigned int *tx_num, unsigned int *tx_slot,
> +				   unsigned int *rx_num, unsigned int *rx_slot)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dai->dev);
> +	struct wcd9378_sdw_priv *wcd = wcd9378->sdw_priv[dai->id];
> +	int i;
> +
> +	switch (dai->id) {
> +	case AIF1_PB:
> +		if (!rx_slot || !rx_num) {
> +			dev_err(dai->dev, "Invalid rx_slot %p or rx_num %p\n",
> +				rx_slot, rx_num);
> +			return -EINVAL;
> +		}
> +
> +		for (i = 0; i < SDW_MAX_PORTS; i++)
> +			rx_slot[i] = wcd->master_channel_map[i];
> +
> +		*rx_num = i;
> +		break;
> +	case AIF1_CAP:
> +		if (!tx_slot || !tx_num) {
> +			dev_err(dai->dev, "Invalid tx_slot %p or tx_num %p\n",
> +				tx_slot, tx_num);
> +			return -EINVAL;
> +		}
> +
> +		for (i = 0; i < SDW_MAX_PORTS; i++)
> +			tx_slot[i] = wcd->master_channel_map[i];
> +
> +		*tx_num = i;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops wcd9378_sdw_dai_ops = {
> +	.hw_params = wcd9378_codec_hw_params,
> +	.hw_free = wcd9378_codec_free,
> +	.set_stream = wcd9378_codec_set_sdw_stream,
> +	.get_channel_map = wcd9378_get_channel_map,
> +};
> +
> +#define WCD9378_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
> +		       SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
> +		       SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
> +#define WCD9378_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |\
> +			 SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
> +
> +static struct snd_soc_dai_driver wcd9378_dais[] = {
> +	[0] = {
> +		.name = "wcd9378-sdw-rx",
> +		.playback = {
> +			.stream_name = "WCD AIF Playback",
> +			.rates = WCD9378_RATES,
> +			.formats = WCD9378_FORMATS,
> +			.rate_min = 8000,
> +			.rate_max = 192000,
> +			.channels_min = 1,
> +			.channels_max = 4,
> +		},
> +		.ops = &wcd9378_sdw_dai_ops,
> +	},
> +	[1] = {
> +		.name = "wcd9378-sdw-tx",
> +		.capture = {
> +			.stream_name = "WCD AIF Capture",
> +			.rates = WCD9378_RATES,
> +			.formats = WCD9378_FORMATS,
> +			.rate_min = 8000,
> +			.rate_max = 192000,
> +			.channels_min = 1,
> +			.channels_max = 4,
> +		},
> +		.ops = &wcd9378_sdw_dai_ops,
> +	},
> +};
> +
> +static int wcd9378_bind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Give the SDW subdevices some more time to settle */
> +	usleep_range(5000, 5010);
> +
> +	ret = component_bind_all(dev, wcd9378);
> +	if (ret) {
> +		dev_err(dev, "Slave bind failed, ret = %d\n", ret);
> +		return ret;
> +	}
> +
> +	wcd9378->rxdev = of_sdw_find_device_by_node(wcd9378->rxnode);
> +	if (!wcd9378->rxdev) {
> +		dev_err(dev, "could not find rx slave with matching of node\n");
> +		ret = -EINVAL;
> +		goto err_component_unbind;
> +	}
> +
> +	wcd9378->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd9378->rxdev);
> +	wcd9378->sdw_priv[AIF1_PB]->wcd9378 = wcd9378;
> +
> +	wcd9378->txdev = of_sdw_find_device_by_node(wcd9378->txnode);
> +	if (!wcd9378->txdev) {
> +		dev_err(dev, "could not find tx slave with matching of node\n");
> +		ret = -EINVAL;
> +		goto err_put_rxdev;
> +	}
> +
> +	wcd9378->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd9378->txdev);
> +	wcd9378->sdw_priv[AIF1_CAP]->wcd9378 = wcd9378;
> +	wcd9378->tx_sdw_dev = dev_to_sdw_dev(wcd9378->txdev);
> +
> +	/*
> +	 * As TX is the main CSR reg interface, it should not be suspended
> +	 * first. Explicitly add the dependency link.
> +	 */
> +	if (!device_link_add(wcd9378->rxdev, wcd9378->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink TX and RX\n");
> +		ret = -EINVAL;
> +		goto err_put_txdev;
> +	}
> +
> +	if (!device_link_add(dev, wcd9378->txdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and TX\n");
> +		ret = -EINVAL;
> +		goto err_remove_link1;
> +	}
> +
> +	if (!device_link_add(dev, wcd9378->rxdev,
> +			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
> +		dev_err(dev, "Could not devlink WCD and RX\n");
> +		ret = -EINVAL;
> +		goto err_remove_link2;
> +	}
> +
> +	wcd9378->regmap = wcd9378->sdw_priv[AIF1_CAP]->regmap;
> +	if (!wcd9378->regmap) {
> +		dev_err(dev, "could not get TX device regmap\n");
> +		ret = -EINVAL;
> +		goto err_remove_link3;
> +	}
> +
> +	/*
> +	 * The SDCA function engine dies when the TX bus enters clock-stop
> +	 * and only a codec reset revives it — registers keep their values
> +	 * so a regcache sync or a FUNC_ACT re-toggle does not help. The
> +	 * downstream stack sidesteps the same problem by marking the TX
> +	 * SoundWire master "qcom,is-always-on"; do the equivalent and
> +	 * keep the TX slave (and thus its bus) runtime-active while the
> +	 * codec is bound.
> +	 */
> +	ret = pm_runtime_resume_and_get(wcd9378->txdev);
> +	if (ret < 0) {
> +		dev_err(dev, "could not resume TX device\n");
> +		goto err_remove_link3;
> +	}
> +
> +	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd9378,
> +					 wcd9378_dais, ARRAY_SIZE(wcd9378_dais));
> +	if (ret) {
> +		dev_err(dev, "Codec registration failed\n");
> +		pm_runtime_put(wcd9378->txdev);
> +		goto err_remove_link3;
> +	}
> +
> +	return ret;
> +
> +err_remove_link3:
> +	device_link_remove(dev, wcd9378->rxdev);
> +err_remove_link2:
> +	device_link_remove(dev, wcd9378->txdev);
> +err_remove_link1:
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +err_put_txdev:
> +	put_device(wcd9378->txdev);
> +err_put_rxdev:
> +	put_device(wcd9378->rxdev);
> +err_component_unbind:
> +	component_unbind_all(dev, wcd9378);
> +	return ret;
> +}
> +
> +static void wcd9378_unbind(struct device *dev)
> +{
> +	struct wcd9378_priv *wcd9378 = dev_get_drvdata(dev);
> +
> +	snd_soc_unregister_component(dev);
> +	pm_runtime_put(wcd9378->txdev);
> +	device_link_remove(dev, wcd9378->txdev);
> +	device_link_remove(dev, wcd9378->rxdev);
> +	device_link_remove(wcd9378->rxdev, wcd9378->txdev);
> +	component_unbind_all(dev, wcd9378);
> +	mutex_destroy(&wcd9378->micb_lock);
> +	put_device(wcd9378->txdev);
> +	put_device(wcd9378->rxdev);
> +}
> +
> +static const struct component_master_ops wcd9378_comp_ops = {
> +	.bind = wcd9378_bind,
> +	.unbind = wcd9378_unbind,
> +};
> +
> +static int wcd9378_add_slave_components(struct wcd9378_priv *wcd9378,
> +					struct device *dev,
> +					struct component_match **matchptr)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	wcd9378->rxnode = of_parse_phandle(np, "qcom,rx-device", 0);
> +	if (!wcd9378->rxnode) {
> +		dev_err(dev, "Couldn't parse phandle to qcom,rx-device!\n");
> +		return -ENODEV;
> +	}
> +
> +	component_match_add_release(dev, matchptr, component_release_of,
> +				    component_compare_of, wcd9378->rxnode);
> +
> +	wcd9378->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
> +	if (!wcd9378->txnode) {
> +		dev_err(dev, "Couldn't parse phandle to qcom,tx-device\n");
> +		return -ENODEV;
> +	}
> +
> +	component_match_add_release(dev, matchptr, component_release_of,
> +				    component_compare_of, wcd9378->txnode);
> +
> +	return 0;
> +}
> +
> +static int wcd9378_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct wcd9378_priv *wcd9378;
> +	int ret, i;
> +
> +	wcd9378 = devm_kzalloc(dev, sizeof(*wcd9378), GFP_KERNEL);
> +	if (!wcd9378)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, wcd9378);
> +	mutex_init(&wcd9378->micb_lock);
> +	for (i = 0; i < ARRAY_SIZE(wcd9378->tx_sys_bit); i++)
> +		wcd9378->tx_sys_bit[i] = -1;
> +	wcd9378->common.dev = dev;
> +	wcd9378->common.max_bias = WCD9378_MAX_MICBIAS;
> +
> +	wcd9378->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(wcd9378->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wcd9378->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd9378_supplies),
> +					     wcd9378_supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to get and enable supplies\n");
> +
> +	ret = wcd_dt_parse_micbias_info(&wcd9378->common);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get micbias\n");
> +
> +	ret = wcd9378_add_slave_components(wcd9378, dev, &match);
> +	if (ret)
> +		return ret;
> +
> +	wcd9378_reset(wcd9378);
> +
> +	ret = component_master_add_with_match(dev, &wcd9378_comp_ops, match);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return 0;
> +}
> +
> +static void wcd9378_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	component_master_del(dev, &wcd9378_comp_ops);
> +
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +}
> +
> +static const struct of_device_id wcd9378_of_match[] = {
> +	{ .compatible = "qcom,wcd9378-codec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, wcd9378_of_match);
> +
> +static struct platform_driver wcd9378_codec_driver = {
> +	.probe = wcd9378_probe,
> +	.remove = wcd9378_remove,
> +	.driver = {
> +		.name = "wcd9378_codec",
> +		.of_match_table = wcd9378_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +module_platform_driver(wcd9378_codec_driver);
> +
> +MODULE_DESCRIPTION("WCD9378 Codec driver");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/wcd9378.h b/sound/soc/codecs/wcd9378.h
> new file mode 100644
> index 000000000000..fb9e7925968a
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378.h
> @@ -0,0 +1,246 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2026, Jorijn van der Graaf
> + *
> + * Register map for the Qualcomm WCD9378 audio codec.
> + *
> + * The codec exposes its control registers in the SoundWire SDCA control
> + * address space (bit 30 set, SDCA function number in bits 25:22), accessed
> + * through the TX SoundWire slave. The analog core registers (function 0,
> + * implementation-defined region at +0x180000) are layout-compatible with
> + * the WCD937x family; on top of that the chip adds SDCA-style functions
> + * (SmartMIC0/1/2, SmartJACK, SmartAMP) whose sequencers drive the analog
> + * power-up autonomously.
> + */
> +
> +#ifndef __WCD9378_H__
> +#define __WCD9378_H__
> +
> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_type.h>
> +#include <sound/soc.h>
> +
> +/* SDCA function 0 (extension unit): device identity */
> +#define WCD9378_FUNC_EXT_ID_0			0x40000048
> +#define WCD9378_FUNC_EXT_ID_1			0x40000049
> +#define WCD9378_FUNC_EXT_VER			0x40000050
> +#define WCD9378_FUNC_STAT			0x40080000
> +#define WCD9378_DEV_MANU_ID_0			0x40100060
> +#define WCD9378_DEV_MANU_ID_1			0x40100061
> +#define WCD9378_DEV_PART_ID_0			0x40100068
> +#define WCD9378_DEV_PART_ID_1			0x40100069
> +#define WCD9378_DEV_VER				0x40100070
> +
> +/* Analog core (WCD937x-compatible layout), function 0 + 0x180000 */
> +#define WCD9378_ANA_PAGE			0x40180000
> +#define WCD9378_ANA_BIAS			0x40180001
> +#define WCD9378_ANA_BIAS_ANALOG_BIAS_EN		BIT(7)
> +#define WCD9378_ANA_BIAS_PRECHRG_EN		BIT(6)
> +#define WCD9378_ANA_RX_SUPPLIES			0x40180008
> +#define WCD9378_ANA_TX_CH1			0x4018000e
> +#define WCD9378_ANA_TX_CH2			0x4018000f
> +#define WCD9378_ANA_TX_CH2_HPF1_INIT		BIT(6)
> +#define WCD9378_ANA_TX_CH2_HPF2_INIT		BIT(5)
> +#define WCD9378_ANA_TX_CH3			0x40180010
> +#define WCD9378_ANA_TX_CH3_HPF			0x40180011
> +#define WCD9378_ANA_TX_CH3_HPF3_INIT		BIT(6)
> +#define WCD9378_ANA_TX_GAIN_MASK		GENMASK(4, 0)
> +#define WCD9378_ANA_MICB1			0x40180022
> +#define WCD9378_ANA_MICB2			0x40180023
> +#define WCD9378_ANA_MICB2_RAMP			0x40180024
> +#define WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK	GENMASK(4, 2)
> +#define WCD9378_ANA_MICB2_RAMP_EN		BIT(7)
> +#define WCD9378_ANA_MICB3			0x40180025
> +#define WCD9378_BIAS_VBG_FINE_ADJ		0x40180029
> +#define WCD9378_MBHC_CTL_SPARE_1		0x40180058
> +#define WCD9378_MICB1_TEST_CTL_2		0x4018006c
> +#define WCD9378_MICB2_TEST_CTL_2		0x4018006f
> +#define WCD9378_MICB3_TEST_CTL_2		0x40180072
> +#define WCD9378_TX_COM_TXFE_DIV_CTL		0x4018007b
> +#define WCD9378_TX_COM_TXFE_DIV_SEQ_BYPASS	BIT(7)
> +#define WCD9378_SLEEP_CTL			0x40180103
> +#define WCD9378_SLEEP_CTL_BG_CTL_MASK		GENMASK(3, 1)
> +#define WCD9378_SLEEP_CTL_BG_EN			BIT(7)
> +#define WCD9378_SLEEP_CTL_LDOL_BG_SEL		BIT(6)
> +#define WCD9378_TX_NEW_CH12_MUX			0x4018012e
> +#define WCD9378_TX_NEW_CH12_MUX_CH1_SEL_MASK	GENMASK(2, 0)
> +#define WCD9378_TX_NEW_CH12_MUX_CH2_SEL_MASK	GENMASK(5, 3)
> +#define WCD9378_TX_NEW_CH34_MUX			0x4018012f
> +#define WCD9378_TX_NEW_CH34_MUX_CH3_SEL_MASK	GENMASK(2, 0)
> +#define WCD9378_HPH_RDAC_GAIN_CTL		0x40180132
> +#define WCD9378_HPH_RDAC_HD2_CTL_L		0x40180133
> +#define WCD9378_HPH_RDAC_HD2_CTL_R		0x40180136
> +
> +/* Digital page */
> +#define WCD9378_TOP_CLK_CFG			0x40180407
> +#define WCD9378_CDC_ANA_TX_CLK_CTL		0x40180417
> +#define WCD9378_CDC_ANA_TXSCBIAS_CLK_EN		BIT(0)
> +#define WCD9378_CDC_AMIC_CTL			0x4018045a
> +#define WCD9378_PDM_WD_CTL0			0x40180465
> +#define WCD9378_PDM_WD_CTL1			0x40180466
> +#define WCD9378_EFUSE_REG_16			0x401804c0
> +#define WCD9378_EFUSE_REG_29			0x401804cd
> +#define WCD9378_PLATFORM_CTL			0x401804f0
> +
> +/* Sequencer block (SEQR) */
> +#define WCD9378_SYS_USAGE_CTRL			0x40180501
> +#define WCD9378_SYS_USAGE_CTRL_MASK		GENMASK(3, 0)
> +#define WCD9378_HPH_UP_T0			0x40180510
> +#define WCD9378_HPH_UP_T9			0x40180519
> +#define WCD9378_HPH_DN_T0			0x4018051b
> +#define WCD9378_SEQ_TX0_STAT			0x40180592
> +#define WCD9378_SEQ_TX1_STAT			0x40180593
> +#define WCD9378_SEQ_TX2_STAT			0x40180594
> +#define WCD9378_MICB_REMAP_TABLE_VAL_3		0x401805a3
> +#define WCD9378_MICB_REMAP_TABLE_VAL_4		0x401805a4
> +#define WCD9378_MICB_REMAP_TABLE_VAL_5		0x401805a5
> +#define WCD9378_SM0_MB_SEL			0x401805b0
> +#define WCD9378_SM1_MB_SEL			0x401805b1
> +#define WCD9378_SM2_MB_SEL			0x401805b2
> +#define WCD9378_SM_MB_SEL_MASK			GENMASK(1, 0)
> +#define WCD9378_MB_PULLUP_EN			0x401805b3
> +
> +/* SmartAMP SDCA function */
> +#define WCD9378_SMP_AMP_FUNC_STAT		0x40880000
> +#define WCD9378_SMP_AMP_FUNC_ACT		0x40880008
> +
> +/* SmartJACK SDCA function (hosts ADC2 when fed from AMIC2) */
> +#define WCD9378_CMT_GRP_MASK			0x40c00008
> +#define WCD9378_SMP_JACK_IT31_MICB		0x40c00798
> +#define WCD9378_SMP_JACK_IT31_USAGE		0x40c007a0
> +#define WCD9378_SMP_JACK_PDE34_REQ_PS		0x40c00808
> +#define WCD9378_SMP_JACK_FUNC_STAT		0x40c80000
> +#define WCD9378_SMP_JACK_FUNC_ACT		0x40c80008
> +#define WCD9378_SMP_JACK_PDE34_ACT_PS		0x40c80800
> +
> +/* SmartMIC0/1/2 SDCA functions (ADC1/ADC2/ADC3 sequencers) */
> +#define WCD9378_SMP_MIC_BASE(n)			(0x41000000 + (n) * 0x400000)
> +#define WCD9378_SMP_MIC_IT11_MICB(n)		(WCD9378_SMP_MIC_BASE(n) + 0x98)
> +#define WCD9378_SMP_MIC_IT11_USAGE(n)		(WCD9378_SMP_MIC_BASE(n) + 0xa0)
> +#define WCD9378_SMP_MIC_PDE11_REQ_PS(n)		(WCD9378_SMP_MIC_BASE(n) + 0x108)
> +#define WCD9378_SMP_MIC_OT10_USAGE(n)		(WCD9378_SMP_MIC_BASE(n) + 0x3a0)
> +#define WCD9378_SMP_MIC_FUNC_STAT(n)		(WCD9378_SMP_MIC_BASE(n) + 0x80000)
> +#define WCD9378_SMP_MIC_FUNC_ACT(n)		(WCD9378_SMP_MIC_BASE(n) + 0x80008)
> +#define WCD9378_SMP_MIC_PDE11_ACT_PS(n)		(WCD9378_SMP_MIC_BASE(n) + 0x80100)
> +
> +#define WCD9378_MAX_REGISTER			0x41900070
> +
> +/*
> + * Raw (16-bit, non-paged) Qualcomm slave SCP registers, written with
> + * sdw_write() directly. Bus clock indication towards the codec and
> + * SDCA interrupt type configuration.
> + */
> +#define WCD9378_SWRS_SCP_BASE_CLK		0x4d
> +#define WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK0	0x62
> +#define WCD9378_SWRS_SCP_BUSCLK_SCALE_BANK1	0x72
> +#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_1	0xf4
> +#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_2	0xf8
> +#define WCD9378_SWRS_SCP_SDCA_INTRTYPE_3	0xfc
> +#define WCD9378_SWRS_SCP_HOST_CLK_DIV2_CTL(m)	(0xe0 + 0x10 * (m))
> +#define WCD9378_SWRS_BASE_CLK_19P2MHZ		0x01
> +#define WCD9378_SWRS_CLK_SCALE_DIV2		0x02	/* 9.6 MHz */
> +#define WCD9378_SWRS_CLK_SCALE_DIV4		0x03	/* 4.8 MHz */
> +
> +/* ITxx_USAGE ADC mode values */
> +#define WCD9378_ADC_USAGE_HIFI			0x01
> +#define WCD9378_ADC_USAGE_LO_HIF		0x02
> +#define WCD9378_ADC_USAGE_NORMAL		0x03
> +#define WCD9378_ADC_USAGE_LP			0x05
> +#define WCD9378_ADC_USAGE_OFF			0x00
> +
> +/* ITxx_MICB usage values */
> +#define WCD9378_MICB_USAGE_OFF			0x00
> +#define WCD9378_MICB_USAGE_PULL_DOWN		0x01
> +#define WCD9378_MICB_USAGE_1P2V			0x02
> +#define WCD9378_MICB_USAGE_1P8V_OR_PULLUP	0x03
> +#define WCD9378_MICB_USAGE_2P5V			0x04
> +#define WCD9378_MICB_USAGE_2P75V		0x05
> +#define WCD9378_MICB_USAGE_2P2V			0xf0
> +#define WCD9378_MICB_USAGE_2P7V			0xf1
> +#define WCD9378_MICB_USAGE_2P8V			0xf2
> +#define WCD9378_MICB_USAGE_REMAP_TABLE_3	0xf3
> +#define WCD9378_MICB_USAGE_REMAP_TABLE_4	0xf4
> +#define WCD9378_MICB_USAGE_REMAP_TABLE_5	0xf5
> +
> +/* PDExx_REQ_PS power states */
> +#define WCD9378_PDE_PS0_ON			0x00
> +#define WCD9378_PDE_PS3_OFF			0x03
> +
> +#define WCD9378_MAX_MICBIAS			3
> +#define WCD9378_MAX_SWR_CH_IDS			15
> +#define WCD9378_SWRM_CH_MASK(ch_idx)		BIT((ch_idx) - 1)
> +
> +enum wcd9378_tx_sdw_ports {
> +	WCD9378_ADC_1_PORT = 1,
> +	WCD9378_ADC_2_PORT,
> +	WCD9378_ADC_3_PORT,
> +	WCD9378_DMIC_0_1_MBHC_PORT,
> +	WCD9378_DMIC_2_5_PORT,
> +	WCD9378_MAX_TX_SWR_PORTS = WCD9378_DMIC_2_5_PORT,
> +};
> +
> +enum wcd9378_rx_sdw_ports {
> +	WCD9378_HPH_PORT = 1,
> +	WCD9378_CLSH_PORT,
> +	WCD9378_COMP_PORT,
> +	WCD9378_LO_PORT,
> +	WCD9378_DSD_PORT,
> +	WCD9378_MAX_SWR_PORTS = WCD9378_DSD_PORT,
> +};
> +
> +enum wcd9378_tx_sdw_channels {
> +	WCD9378_ADC1,
> +	WCD9378_ADC2,
> +	WCD9378_ADC3,
> +	WCD9378_DMIC0,
> +	WCD9378_DMIC1,
> +	WCD9378_MBHC,
> +	WCD9378_DMIC2,
> +	WCD9378_DMIC3,
> +	WCD9378_DMIC4,
> +	WCD9378_DMIC5,
> +};
> +
> +enum wcd9378_rx_sdw_channels {
> +	WCD9378_HPH_L,
> +	WCD9378_HPH_R,
> +	WCD9378_CLSH,
> +	WCD9378_COMP_L,
> +	WCD9378_COMP_R,
> +	WCD9378_LO,
> +	WCD9378_DSD_L,
> +	WCD9378_DSD_R,
> +};
> +
> +struct wcd9378_priv;
> +struct wcd9378_sdw_priv {
> +	struct sdw_slave *sdev;
> +	struct sdw_stream_config sconfig;
> +	struct sdw_stream_runtime *sruntime;
> +	struct sdw_port_config port_config[WCD9378_MAX_SWR_PORTS];
> +	struct wcd_sdw_ch_info *ch_info;
> +	bool port_enable[WCD9378_MAX_SWR_CH_IDS];
> +	unsigned int master_channel_map[SDW_MAX_PORTS];
> +	int active_ports;
> +	bool is_tx;
> +	struct wcd9378_priv *wcd9378;
> +	struct regmap *regmap;
> +};
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_WCD9378_SDW)
> +int wcd9378_sdw_hw_params(struct wcd9378_sdw_priv *wcd,
> +			  struct snd_pcm_substream *substream,
> +			  struct snd_pcm_hw_params *params,
> +			  struct snd_soc_dai *dai);
> +#else
> +static inline int wcd9378_sdw_hw_params(struct wcd9378_sdw_priv *wcd,
> +					struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params,
> +					struct snd_soc_dai *dai)
> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
> +#endif /* __WCD9378_H__ */


