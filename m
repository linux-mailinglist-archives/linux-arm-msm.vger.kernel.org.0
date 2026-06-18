Return-Path: <linux-arm-msm+bounces-113800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XpS/OWVkNGpkWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:34:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AB6A2C61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 23:34:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="FPUcJ/Hg";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113800-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113800-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6C833036D77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 21:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205382DB788;
	Thu, 18 Jun 2026 21:34:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF97A1F7575;
	Thu, 18 Jun 2026 21:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781818466; cv=none; b=K7WJJ7jqFAcC2WKhYWJvYth71kZ1vlFN7OSNICG2vRjWUt//8P+WJhkSi355ur+0pQ6U8tgi/tqj8f4CCwwqnUQNG9CdXPx6955jtnR/5woXY/K6qGpQoM7u5B4TXE0eVdt683G/zWcn7ePM9qJcRxrIE2k8kVZPsT4efbTfPfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781818466; c=relaxed/simple;
	bh=V0dU+RPqLcrNGy3M5mqfss241GGxh1epWhvlGSPk17Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYagCBGf5ewGjXpdkRY/J0yh9XF/C98qAeBl29f3INkKONXMwuQ4QEv9tmTZbBvR18RohXEK1KVDwISdcu4qtKa23UGMf9mh2qRxaXkbY10bvF0RSoabhUhpKe+tfZa43bo5tS+wCR3d8TssrH3axTzbqdz9o8QcH4KVRVKde+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPUcJ/Hg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACA21F000E9;
	Thu, 18 Jun 2026 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781818464;
	bh=R+L0DdAEGMycXl1W1CxofB46nS1zC+XHz1N/Z/8inps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FPUcJ/HgN2+6Fv/086nUElxoQ44yOBid1l0MdPL5X9rxGu50gYg0zSwXwsWqTc//c
	 vyPzltrx3iw9ejnPFrCdoZ23WbEdhSjU5RDr46/mlIwHHwdlJOyIMR3OlZX7Tp73r4
	 2UIliSJUZWA/ZyP35kYvrwfOeuXCXG7OW5ZBOeP1W5wUr10N2RynOiklswsGf9cmrB
	 epf+K9P2rX0SuF7Cvm6Xhh3BEufMioANY4ukLhaEWHLpoKPe6VXk2WbfIftoC3Umv6
	 qnMLn3kBfU9sUEjkHuzcPYxxPJd5DVb8h38ywhn3x0AyEFKobPW6qvJWqwfEhTuy8e
	 wTn4HroiVatcw==
Message-ID: <cd8da4f2-e6f2-4ad0-b9c6-952af9e1aa11@kernel.org>
Date: Thu, 18 Jun 2026 22:34:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113800-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 413AB6A2C61



On 6/11/26 12:29 PM, Ajay Kumar Nandam wrote:
> Add machine-driver support for Qualcomm Shikra EVK variants by matching
> dedicated compatible strings and applying board-specific audio behavior.
> 
> Shikra platforms are available as CQM, CQS, and IQS variants with
> different audio components and processing architectures:
> 
> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>   PM4125 + Rouleur codec components.
> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>   on CPU only and no DSP is involved.

This patch is doing too many things you need to seperate them in to
seperate patches.

> - CQS uses modem-DSP based audio processing.
> - IQS uses a third-party MAX98091 codec with modem-DSP support.
> 
> Introduce variant-specific handling so codec controls, DAPM widgets, and
> clock programming match the board design and avoid invalid clock setup on
> variants where it is not applicable.
> 
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/common.c   |  2 ++
>  sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>  sound/soc/qcom/sdw.c      |  3 ++
>  3 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index f42c98ded..32d6c09b2 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -3,6 +3,7 @@
>  // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>  
>  #include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,qaif.h>
>  #include <linux/module.h>
>  #include <sound/jack.h>
>  #include <linux/input-event-codes.h>
> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  	}
>  
>  	switch (cpu_dai->id) {
> +	case QAIF_CDC_DMA_RX0:
>  	case TX_CODEC_DMA_TX_0:
>  	case TX_CODEC_DMA_TX_1:
>  	case TX_CODEC_DMA_TX_2:
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index e5d23e244..4c985f81c 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>  	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>  };
>  
> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +};
> +
> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone", NULL),
> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
> +	SND_SOC_DAPM_SPK("Speaker", NULL),
> +};
> +
> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> +	SOC_DAPM_PIN_SWITCH("Headphone"),
> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
> +	SOC_DAPM_PIN_SWITCH("Speaker"),
> +};
> +
>  struct snd_soc_common {
>  	const char *driver_name;
>  	const struct snd_soc_dapm_widget *dapm_widgets;
> @@ -49,6 +68,7 @@ struct snd_soc_common {
>  	bool codec_sysclk_set;
>  	bool mi2s_mclk_enable;
>  	bool mi2s_bclk_enable;
> +	bool dsp_bypass;
How is this related to this patch?

>  };
>  
>  struct sc8280xp_snd_data {
> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  	int mclk_freq = sc8280xp_get_mclk_freq(params);
>  	int bclk_freq = sc8280xp_get_bclk_freq(params);
>  
> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
> +	if (data->snd_soc_common_priv->dsp_bypass)
> +		return 0;
> +
This has nothing to do with what this patch is doing.

>  	switch (cpu_dai->id) {
>  	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>  					       SND_SOC_CLOCK_IN);
>  
>  		if (data->snd_soc_common_priv->codec_sysclk_set)
> -			snd_soc_dai_set_sysclk(cpu_dai,
> +			snd_soc_dai_set_sysclk(codec_dai,
this is not related to shikra support

>  					       0, mclk_freq,
>  					       SND_SOC_CLOCK_IN);
>  		break;
> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>  	int i;
>  
>  	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> +		if (link->no_pcm == 1 || link->num_codecs > 0) {

Looks like you are mixing multiple changes in single patch, please
seperate them.

>  			link->init = sc8280xp_snd_init;
>  			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>  			link->ops = &sc8280xp_be_ops;
> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>  	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>  };
>  
> +static const struct snd_soc_common shikra_cqm_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_cqm_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
> +	.dsp_bypass = true,
> +};
> +
> +static const struct snd_soc_common shikra_cqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_cqm_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
> +	.mi2s_bclk_enable = true,
> +	.codec_sysclk_set = true,
> +};
> +
> +static const struct snd_soc_common shikra_iqs_priv_data = {
> +	.driver_name = "shikra",
> +	.dapm_widgets = shikra_iqs_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
> +	.controls = shikra_iqs_controls,
> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
> +			 SND_SOC_DAIFMT_NB_NF |
> +			 SND_SOC_DAIFMT_I2S,
> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +};
> +
>  static struct snd_soc_common sm8450_priv_data = {
>  	.driver_name = "sm8450",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>  	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>  	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>  	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>  	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>  	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 6576b47a4..0be743cec 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -4,6 +4,7 @@
>  
>  #include <dt-bindings/sound/qcom,lpass.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,qaif.h>
>  #include <linux/module.h>
>  #include <sound/soc.h>
>  #include "sdw.h"
> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>  	switch (id) {
>  	case LPASS_CDC_DMA_TX3:
>  	case LPASS_CDC_DMA_RX0:
> +	case QAIF_CDC_DMA_VA_TX0:
> +	case QAIF_CDC_DMA_RX0:
>  		return true;
>  	default:
>  		break;


