Return-Path: <linux-arm-msm+bounces-113123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uu4ZJWi7L2oeFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:44:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63D684ACA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:44:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m++IjaU4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F35309FD59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16953CF97F;
	Mon, 15 Jun 2026 08:38:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806413CF1E9;
	Mon, 15 Jun 2026 08:38:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512692; cv=none; b=elo8D5APypEjw3ML6qDVW/OVwNCdydYtzrwPS15MQ0yPbf2C+8UeqZUhtKVajLU0kjENJNSdNsFWEBTHl3/cQwhrYN7Ps9REIhzPoJcF/0cfgoKl19CeOJAZAzp6viLakQ6/VELPPQPvz1BVRCGSA79Lj6m+rFtHPARLwrsWfog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512692; c=relaxed/simple;
	bh=Yc8YgaOeckLfcWMZNEjRKbADiGdtYnCXJVORfn2GLvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aH13bzLqaOegDe79UvAcZ1nGL+/vHMocvXIGfmAUirIicYfkQ4ZiaSaG3r9oiEUke07MrOmBHydZQCqiCYPmvhkI/xrnRfIcwsCrC5KIsMoG3R4zg8svW0uZqk+qwMSzNDxoNOqtE4RUvKXRZtODoNB5pj+t8tzeaIzqt9WRPzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m++IjaU4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 432C51F000E9;
	Mon, 15 Jun 2026 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781512691;
	bh=DsGsr35sR8U0/CHU/ppJusj67EVShvd662z8K8HANtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=m++IjaU4GjR48q02/l5zqnDD4hgqRAGdHtk+2llqQI3q3kUdXzoNX/ZaJ04c7VIs3
	 XgNrMpEjXQGfGIgOn3EH9E73PMmC3Xw3ZfWEFFMV2nV4N1npzyZA7yjOyCf6msyYav
	 AN5u70dm5Gal2VkzPk2DScuaxD0jHXeFyBOtFLafOfhEz0Wh+8vj3c1ZUdts4HC/eO
	 bL/F7aXtLAhFojkTnm9ldoN4zTKYuJKX/NJLeb+etXC2iX94dSIpXyUbxyxIncrgH0
	 PHrp3KbgjyEs9O6MMu+r2mOmhYrpc6sHIoshjbsXZoZhwG/c/aIW0sX2dGJVykUSYy
	 Ztl593nFb8rMw==
Message-ID: <937aed10-9ec6-4ca4-bc60-db892121a416@kernel.org>
Date: Mon, 15 Jun 2026 09:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: qcom: audioreach: compute active channel maps
 from channel_map
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
 <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-1-18bb19c5ca22@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kancy2333@outlook.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-113123-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[outlook.com,vger.kernel.org,oss.qualcomm.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA63D684ACA



On 6/10/26 8:41 AM, Neil Armstrong wrote:
> The Qualcom SM8650 based Ayaneo Pocket S2 gaming device has a set
> of 2 WSA speakers connected on the WSA2 lines.
> 
> But the Audioreach DSP only handles WSA2 in pair with the WSA
> interface by using the upper bits of the active_channels_mask
> for WSA2 and the lower bits for WSA:
> 
> /-------------------------------------------------\
> | Bits  |     3    |     2    |   1     |     0   |
> |-------------------------------------------------|
> | Line  | WSA2 Ch2 | WSA2 Ch1 | WSA Ch2 | WSA Ch1 |
> \-------------------------------------------------/
> 
No, this is not totally correct, if the setup only has WSA2, then
channel 0 and 1 should be WSA2 channels.

What is the backend dai id that is in DT, it should be

	sound-dai = <&q6apmbedai WSA2_CODEC_DMA_RX_0>;

I also noticed that you are using
https://github.com/linux-msm/audioreach-topology/blob/main/SM8550-HDK.m4
which has WSA as backend dai, that is not correct, you should have WSA2.


> Setting only the WSA2 upper bits is perfectly valid and
> functional but the current Audioreach code builds the bitmask
> from the channels count with:
> 	active_channels_mask = (1 << num_channels) - 1;
> 
> In order to enable the WSA2 bits the channel count should be 4,
> but the lower WSA bits are then also enabled and the DSP errors
> out when trying to play on the disabled WSA interface.
> 
> A solution would've been to add a fake WSA2 topology element which
> would be translated into the top bits only, but it's not clean and
> add some special exceptions in the generic Audioreach code.
> 
> The solution suggested by Srinivas is to use the channel mapping to
> set this bitmask.
> 
> This works but makes all the other calls using the channel mapping fail
> because the DSP requires the channel_mapping table to start from index 0
> and using num_channel length in order to apply the mapping on the
> active_channels_mask bits in order.
> 
> So we need to skip the empty channel mapping entries in all other
> users of the channel_map to build valid channel_mapping tables.
> 
> This should not break any other usecases since the default channel
> mapping always start from index 0, and will add flexibilty to allow
> some special non linear mapping for other interfaces as well.
> 
> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 47 ++++++++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index a13f753eff98..9b80cfa56e8a 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -703,6 +703,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>  	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
>  	int size = ic_sz + ep_sz + fs_sz + pm_sz;
>  	void *p;
> +	int i;
>  
>  	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
>  	if (IS_ERR(pkt))
> @@ -741,7 +742,12 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
>  
>  	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
>  	intf_cfg->cfg.intf_index = module->hw_interface_idx;
> -	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
> +	intf_cfg->cfg.active_channels_mask = 0;
> +	/* Convert the physical channel mapping into a bit field */
> +	for (i = 0; i < AR_PCM_MAX_NUM_CHANNEL; i++)
> +		if (cfg->channel_map[i])
> +			intf_cfg->cfg.active_channels_mask |= BIT(i);
> +

This one looks good, this should be a bug fix patch.

>  	p += ic_sz;
>  
>  	pm_cfg = p;
> @@ -840,7 +846,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>  	uint32_t num_channels = cfg->num_channels;
>  	int payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
>  				APM_MODULE_PARAM_DATA_SIZE;
> -	int i;
> +	int i, j;
>  	void *p;
>  
>  	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
> @@ -860,8 +866,12 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
>  	media_format->sample_rate = cfg->sample_rate;
>  	media_format->bit_width = cfg->bit_width;
>  	media_format->num_channels = cfg->num_channels;
> -	for (i = 0; i < num_channels; i++)
> -		media_format->channel_mapping[i] = cfg->channel_map[i];
> +	/* Convert the physical mapping to a logical mapping of the channels */
> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
> +		if (!cfg->channel_map[i])
> +			continue;
> +		media_format->channel_mapping[j++] = cfg->channel_map[i];
Each element i of the channel_mapping[i] array, describes the channel i
inside the buffer where i is less than num_channels.  An unused channel
is set to 0.

For some reason I get impression that user is trying to set a 4 channels
instead of 2 channel.

Can you fix the backend-dai id and play it directly on WSA2 instead of WSA.
Or was there a reason for not doing it otherwise?

--srini

> +	}
>  
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
> @@ -1080,6 +1090,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>  	struct apm_pcm_module_media_fmt_cmd *cfg;
>  	struct apm_module_param_data *param_data;
>  	int payload_size;
> +	int i, j;
>  
>  	if (num_channels > 4) {
>  		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> @@ -1113,7 +1124,12 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>  	media_cfg->num_channels = mcfg->num_channels;
>  	media_cfg->q_factor = mcfg->bit_width - 1;
>  	media_cfg->bits_per_sample = mcfg->bit_width;
> -	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
> +	/* Convert the physical mapping to a logical mapping of the channels */
> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < mcfg->num_channels; i++) {
> +		if (!mcfg->channel_map[i])
> +			continue;
> +		media_cfg->channel_mapping[j++] = mcfg->channel_map[i];
> +	}
>  
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
> @@ -1127,6 +1143,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>  	struct payload_media_fmt_pcm *cfg;
>  	struct media_format *header;
>  	int rc, payload_size;
> +	int i, j;
>  	void *p;
>  
>  	if (num_channels > 4) {
> @@ -1166,7 +1183,12 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>  		cfg->q_factor = mcfg->bit_width - 1;
>  		cfg->endianness = PCM_LITTLE_ENDIAN;
>  		cfg->num_channels = mcfg->num_channels;
> -		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
> +		/* Convert the physical mapping to a logical mapping of the channels */
> +		for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < cfg->num_channels; i++) {
> +			if (!mcfg->channel_map[i])
> +				continue;
> +			cfg->channel_mapping[j++] = mcfg->channel_map[i];
> +		}
>  	} else {
>  		rc = audioreach_set_compr_media_format(header, p, mcfg);
>  		if (rc)
> @@ -1243,7 +1265,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>  	struct apm_module_sp_vi_ex_mode_cfg *ex_cfg;
>  	int op_sz, cm_sz, ex_sz;
>  	struct apm_module_param_data *param_data;
> -	int rc, i, payload_size;
> +	int rc, i, payload_size, j;
>  	struct gpr_pkt *pkt;
>  	void *p;
>  
> @@ -1284,14 +1306,19 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>  	param_data->param_size = cm_sz - APM_MODULE_PARAM_DATA_SIZE;
>  
>  	cm_cfg->cfg.num_channels = num_channels * 2;
> -	for (i = 0; i < num_channels; i++) {
> +	/* Convert the physical mapping to a logical mapping of the channels */
> +	for (i = 0, j = 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; i++) {
> +		if (!mcfg->channel_map[i])
> +			continue;
>  		/*
>  		 * Map speakers into Vsense and then Isense of each channel.
>  		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
>  		 * [1, 2, 3, 4]
>  		 */
> -		cm_cfg->cfg.channel_mapping[2 * i] = (mcfg->channel_map[i] - 1) * 2 + 1;
> -		cm_cfg->cfg.channel_mapping[2 * i + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
> +		cm_cfg->cfg.channel_mapping[2 * j] = (mcfg->channel_map[i] - 1) * 2 + 1;
> +		cm_cfg->cfg.channel_mapping[2 * j + 1] = (mcfg->channel_map[i] - 1) * 2 + 2;
> +
> +		++j;
>  	}
>  
>  	p += cm_sz;
> 


