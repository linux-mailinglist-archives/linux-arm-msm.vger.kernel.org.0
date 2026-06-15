Return-Path: <linux-arm-msm+bounces-113141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vzyEEM3FL2rkGAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:28:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F16850CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:28:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EseCdOHd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113141-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113141-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7606E3002D14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFA23DA5AA;
	Mon, 15 Jun 2026 09:28:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C333239BFF1;
	Mon, 15 Jun 2026 09:28:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781515719; cv=none; b=M8ELCSxjwD5N3diSUorPJ2Wd9xuWKoOrlmn09fwamUI1uy+CNtNGf2Ijp7O9DQ50Hb3ffTPcl2LERrb09KN+CDB37oWsbUCESE79r5amLFEfWpB9SlgC4dGQFTXlKazn4L2HuVpI+xZF+yG7KawB9l4xkc6fGSgM3kYegmWPweM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781515719; c=relaxed/simple;
	bh=k9xXY25oYtrIP5mgGoqtX6UAynabxX6t1ZJHFP7Dv5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHIJGSGtykqV9b3O1p5UTAhuwPRC7SlVhw7ZIOX0HvwI/WhiTLbetX9dLhcTdybwE362FoycBR8DxDm99gXhD/NP2AzVdd40i/pwF+N5ZzebvgabUxpxR2mrEgwnXpEGHrF60ZcJpDA4KxpnxBwZ0ncC99i8o9j+XJ/lYJ1MFMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EseCdOHd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D371F000E9;
	Mon, 15 Jun 2026 09:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781515717;
	bh=IyQTJrPiNT34prgZvcY7l5YYxExwHM050pO4Iq0vlOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EseCdOHdJ76alzsBOdXSx8BwSxvX7QBwptSnjX5NHNX6cY/kzJFufHMbU4kXjwRJk
	 kAXBA8NF8gIEnx+nYrc93RmSB5mHJxEggRkRD6/2YVPJZHD9xCrqoPvYLc8wAbFFAe
	 qEkhOxHEkdDUC5u7u7UcDYCBBvNW3ns2gEO4w4mBCNTx1DWGxcAMGjSeasFQR01ETQ
	 Ol7cRbStgrkh86zLHUNgCGzPhKCiTMoorMeSPGgJRvuLeVhd2kczW9phR/Nwvpa3zN
	 FDb+ty5HaASftdrR5CnPP5kf8vKi1VJ6dSBnAzEXY0VsVYzWoazBYE2YkNXHrW5Uvf
	 wKPt32oELd71Q==
Message-ID: <90202cfd-19ad-4ae9-9f0d-cde014d8a663@kernel.org>
Date: Mon, 15 Jun 2026 10:28:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
 <20260610154517.134570-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260610154517.134570-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:prasad.kumpatla@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113141-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 435F16850CA



On 6/10/26 4:45 PM, Prasad Kumpatla wrote:
> Add topology parsing and media-format programming for Audio IF
> source and sink modules.
> 
> Add the Audio IF module IDs, the required topology tokens, and a
> dedicated topology loader that stores the parsed interface
> configuration in the AudioReach module state. Also add the Audio IF
> media-format path that sends the interface configuration, hardware
> endpoint media format, and frame-duration parameters for Audio IF
> modules.
> 
> This keeps the serial-interface configuration topology-driven while
> still allowing the machine driver to provide runtime slot and media
> format settings. The same Audio IF path can then be reused for TDM,
> PCM, and I2S style backends.
> 
> The new UAPI tokens (AR_TKN_U32_MODULE_SYNC_SRC=262 through
> AR_TKN_U32_MODULE_INV_EXT_BIT_CLK=276) are added.
> 
> MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
> (0x0700117D) are introduced in this patch.
> 

Which platform is this tested on, also please send a PR to
github.com/linux-msm/audioreach-topology to add thse new tokens.

> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  include/uapi/sound/snd_ar_tokens.h |  58 ++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.c  |  97 ++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h  |  62 +++++++++++++++++
>  sound/soc/qcom/qdsp6/topology.c    | 108 +++++++++++++++++++++++++++++
>  4 files changed, 325 insertions(+)
> 
> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
> index 6b8102eaa..355a1e629 100644
> --- a/include/uapi/sound/snd_ar_tokens.h
> +++ b/include/uapi/sound/snd_ar_tokens.h
> @@ -168,6 +168,48 @@ enum ar_event_types {
>   *						LOG_WAIT = 0,
>   *						LOG_IMMEDIATELY = 1
>   *
> + * %AR_TKN_U32_MODULE_SYNC_SRC:			Frame sync source
> + *						0 = external, 1 = internal
> + *
> + * %AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
> + *						0 = disable, 1 = enable
> + *
> + * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
> + *
> + * %AR_TKN_U32_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
> + *
> + * %AR_TKN_U32_MODULE_SLOT_WIDTH:			Slot width in bits (16 or 32)
> + *
> + * %AR_TKN_U32_MODULE_SYNC_MODE:			Frame sync mode
> + *						0 = short pulse, 1 = long pulse

We have 3 possible values, please correct this, also you could add
defines for these values.
> + *
> + * %AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
> + *						0 = normal, 1 = inverted
> + *
> + * %AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
> + *						0 = no delay, 1 = one cycle delay

Exactly same here, we have 2 cyle delay too.

> + *
> + * %AR_TKN_U32_MODULE_INTF_MODE:			Audio IF interface mode
> + *						AUDIO_IF_INTF_MODE_TDM = 0,
> + *						AUDIO_IF_INTF_MODE_PCM = 1,
> + *						AUDIO_IF_INTF_MODE_I2S = 2

Same here, defines for these.

> + *
> + * %AR_TKN_U32_MODULE_QAIF_TYPE:			QAIF hardware port type index
> + *
> + * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
> + *
> + * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
> + *
> + * %AR_TKN_U32_MODULE_BIT_CLK_TYPE:			Bit clock type
> + *						0 = internal, 1 = external,
> + *						2 = skip (bypass bit clock enable)
> + *
> + * %AR_TKN_U32_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
> + *						0 = normal, 1 = inverted
> + *
> + * %AR_TKN_U32_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
> + *						0 = normal, 1 = inverted
> + *
>   * %AR_TKN_DAI_INDEX:				dai index
>   *
>   */
> @@ -240,6 +282,22 @@ enum ar_event_types {
>  #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
>  #define AR_TKN_U32_MODULE_LOG_MODE		261
>  
> +#define AR_TKN_U32_MODULE_SYNC_SRC		262
> +#define AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE	263
> +#define AR_TKN_U32_MODULE_SLOT_MASK		264
> +#define AR_TKN_U32_MODULE_NSLOTS_PER_FRAME	265
> +#define AR_TKN_U32_MODULE_SLOT_WIDTH		266
> +#define AR_TKN_U32_MODULE_SYNC_MODE		267
> +#define AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE	268
> +#define AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY	269
> +#define AR_TKN_U32_MODULE_INTF_MODE		270
> +#define AR_TKN_U32_MODULE_QAIF_TYPE		271
> +#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
> +#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
> +#define AR_TKN_U32_MODULE_BIT_CLK_TYPE		274
> +#define AR_TKN_U32_MODULE_INV_INT_BIT_CLK	275
> +#define AR_TKN_U32_MODULE_INV_EXT_BIT_CLK	276
> +
Here you prefix the tokens with U32, however in dirver this values are
validated against U8 and U16, So please fix the prefixes to reflect the
range.


...

>  
>  	default:
>  		rc = 0;
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 62a2fd79b..1dc29ddfd 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -22,6 +22,8 @@ struct q6apm_graph;
>  #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
>  #define MODULE_ID_I2S_SINK		0x0700100A
>  #define MODULE_ID_I2S_SOURCE		0x0700100B
> +#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
> +#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
Please place it in the assending order.

>  #define MODULE_ID_SAL			0x07001010
>  #define MODULE_ID_MFC			0x07001015
>  #define MODULE_ID_DATA_LOGGING		0x0700101A
> @@ -544,6 +546,41 @@ struct param_id_i2s_intf_cfg {
>  #define PORT_ID_I2S_OUPUT		1
>  #define I2S_STACK_SIZE			2048
>  
> +#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
> +
> +#define AUDIO_IF_INTF_MODE_TDM		0x0
> +#define AUDIO_IF_INTF_MODE_PCM		0x1
> +#define AUDIO_IF_INTF_MODE_I2S		0x2
> +
> +struct param_id_audio_if_intf_cfg {

I know that we have not added documentation for all the structures, but
Am in process of adding them. Can you add kernel doc to these structs.
> +	uint16_t qaif_type;
> +	uint16_t intf_idx;
> +	uint16_t intf_mode;
> +	uint16_t ctrl_data_out_enable;
> +	uint32_t active_slot_mask;
> +	uint16_t nslots_per_frame;
> +	uint16_t slot_width;
> +	uint32_t active_lane_mask;
> +	uint32_t frame_sync_rate;
> +	uint16_t frame_sync_src;
> +	uint16_t frame_sync_mode;
> +	uint16_t invert_frame_sync_pulse;
> +	uint16_t frame_sync_data_delay;
> +	uint16_t bit_clk_type;
> +	uint8_t inv_int_bit_clk;
> +	uint8_t inv_ext_bit_clk;
> +} __packed;
> +
> +#define PARAM_ID_HW_EP_FRAME_DURATION		0x08001B2F
> +#define AUDIO_IF_FRAME_DURATION_US		1000
Why is this hardcoded?

> +
> +struct param_id_hw_ep_frame_duration {
> +	uint32_t frame_duration_in_us;
> +	uint32_t allow_frame_duration_normalization;
> +	uint32_t min_normalized_frame_dur_us;
> +	uint32_t max_normalized_frame_dur_us;
> +} __packed;
> +
>  #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
>  
>  struct param_id_display_port_intf_cfg {
> @@ -877,6 +914,28 @@ struct audioreach_module {
>  	uint32_t data_format;
>  	uint32_t hw_interface_type;
>  
> +	/* Audio IF module (TDM/PCM/I2S) */
> +	/*
> +	 * uint32_t fields first to minimise intra-block padding;
Why do we need this comments does not add a real value here?
> +	 * 2 bytes of trailing padding remain after inv_ext_bit_clk
> +	 * before the next uint32_t field (interleave_type).
> +	 */
> +	uint32_t slot_mask;
> +	uint32_t active_lane_mask;
> +	uint32_t frame_sync_rate;
> +	uint16_t qaif_type;
> +	uint16_t sync_src;
> +	uint16_t ctrl_data_out_enable;
> +	uint16_t nslots_per_frame;
> +	uint16_t slot_width;
> +	uint16_t intf_mode;
> +	uint16_t sync_mode;
> +	uint16_t ctrl_invert_sync_pulse;
> +	uint16_t ctrl_sync_data_delay;
> +	uint16_t bit_clk_type;
> +	uint8_t inv_int_bit_clk;
> +	uint8_t inv_ext_bit_clk;
> +
>  	/* PCM module specific */
>  	uint32_t interleave_type;
>  
> @@ -907,6 +966,9 @@ struct audioreach_module_config {
>  	u32	channel_allocation;
>  	u32	sd_line_mask;
>  	int	fmt;
> +	u32	slot_mask;
> +	u16	nslots_per_frame;
> +	u16	slot_width;
>  	struct snd_codec codec;
>  	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
>  };
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 1f69fba6d..2ae7ac3d2 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -753,6 +753,108 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
>  	return 0;
>  }
>  
> +static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
> +						  const struct snd_soc_tplg_vendor_array *mod_array)
> +{
> +	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
> +	int tkn_count = 0;
> +	u32 val;
> +
> +	mod_elem = mod_array->value;
> +
> +	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
> +		val = le32_to_cpu(mod_elem->value);
> +		switch (le32_to_cpu(mod_elem->token)) {
> +		case AR_TKN_U32_MODULE_HW_IF_IDX:
> +			if (val > U16_MAX)
> +				return -EINVAL;
Plese fix such instances as suggested at the top.

> +			mod->hw_interface_idx = val;
> +			break;
> +		case AR_TKN_U32_MODULE_FMT_DATA:
> +			mod->data_format = val;
> +			break;
> +		case AR_TKN_U32_MODULE_HW_IF_TYPE:
> +			mod->hw_interface_type = val;
where are we using this?

> +			break;
> +		case AR_TKN_U32_MODULE_SYNC_SRC:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->sync_src = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_CTRL_DATA_OUT_ENABLE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->ctrl_data_out_enable = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_SLOT_MASK:
> +			mod->slot_mask = val;
> +			break;
> +		case AR_TKN_U32_MODULE_NSLOTS_PER_FRAME:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->nslots_per_frame = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_SLOT_WIDTH:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->slot_width = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_INTF_MODE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->intf_mode = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_SYNC_MODE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->sync_mode = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_CTRL_INVERT_SYNC_PULSE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->ctrl_invert_sync_pulse = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_CTRL_SYNC_DATA_DELAY:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->ctrl_sync_data_delay = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_QAIF_TYPE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->qaif_type = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
> +			mod->active_lane_mask = val;
> +			break;
> +		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
> +			mod->frame_sync_rate = val;
> +			break;
> +		case AR_TKN_U32_MODULE_BIT_CLK_TYPE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->bit_clk_type = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_INV_INT_BIT_CLK:
> +			if (val > U8_MAX)
> +				return -EINVAL;
> +			mod->inv_int_bit_clk = (u8)val;
> +			break;
> +		case AR_TKN_U32_MODULE_INV_EXT_BIT_CLK:
> +			if (val > U8_MAX)
> +				return -EINVAL;
> +			mod->inv_ext_bit_clk = (u8)val;
> +			break;
> +		default:
> +			break;
> +		}
> +		tkn_count++;
> +		mod_elem++;
> +	}
> +
> +	return 0;
> +}

