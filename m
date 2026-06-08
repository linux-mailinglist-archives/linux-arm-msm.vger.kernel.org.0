Return-Path: <linux-arm-msm+bounces-111640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W3t7DOMtJmqHTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:50:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 217D6652535
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=packett.cool header.s=key1 header.b=MGTsitXG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111640-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111640-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=packett.cool;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 907913003837
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 02:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5412733689E;
	Mon,  8 Jun 2026 02:50:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69A3358C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 02:50:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887008; cv=none; b=fYIucdpbyp7TvnyBiE0Za4X74y+NM1vVU4/TqghvS77i1Il7B+IBXr3YxvH6a0XpU6p5I2VCBjnDOJs9h+vcI/ejpFEBVHxX6loKr3dTEacx6hRSC59igiO2+lt1jgGXK2fyuBE6Lw+KmoXR9CIuc4Rm/3QO1lqFaoPnHWxTL90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887008; c=relaxed/simple;
	bh=491fWt55/N2aTx44vs9X6kBKZdkQr3bM+n0tnZ90BXg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6HFoma+ufgP+qdcKIJULTbtfxZIiW8UKPS6DoOhg4WM5tRiqUBLlSg0kcy1wrno3hLWEGO3MbFbOh1/daneldM54YBATnriKdu18InrjbdOP+s7eAi9CA0Wwy3ZJ31JuU4qArYQpSSzsQpPn+PIOa3DSf3+V3n2coMveNjxpDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=MGTsitXG; arc=none smtp.client-ip=95.215.58.187
Message-ID: <8b2318ff-d07c-4c2d-9c2d-ef7c5c763096@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780886993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om3kMyjepA1gbqPe5vEK7VOqgLsCQEKydpPF0v4/Fwc=;
	b=MGTsitXGrXbEf9LiDSGBLKIMTNZZCYtXzz8LKWu7cOEAhNE3pMzPeHTjJAgORivqI7b2lw
	GL1nsLfYT4+W0KRhVJiioeeg5sdfGWjL3y5bqlN+CkX8U6wIQCCC/HKjE7KnFkuFZAS6+Q
	F8R5uEHL+Hh+ljff00x/8rb+0XGfXRM9syD7eX3/GhkuhFvyxaWy8eWKoZc75y4WQ3kMkm
	q/5SI1m3+2T7qtlgfDLumqLQAf7pV4WFKED6d+5/MOdlYc7+6PN7M0AbT024IQ72ju60ua
	6v3nYJ3vtsKrlhBVT8lAeumvZQrO8DZAHtX1/Og7N5krHwj5tVr4q1EF8TW2Pg==
Date: Sun, 7 Jun 2026 23:49:41 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mohammad.rafi.shaik@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111640-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[packett.cool:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 217D6652535


On 6/7/26 11:30 PM, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> Each MI2S port now retrieves its clock handles from the device tree,
> allowing per-port clock configuration and proper enable/disable during
> startup and shutdown.
> [..]
> @@ -297,6 +373,59 @@ static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>   	.remove_order   = SND_SOC_COMP_ORDER_FIRST,
>   };
>   
> +static int of_q6apm_parse_dai_data(struct device *dev,
> +				   struct q6apm_lpass_dai_data *data)
> +{
> +	struct device_node *node;
> +	int ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {
> +		struct q6apm_dai_priv_data *priv;
> +		int id;
> +
> +		ret = of_property_read_u32(node, "reg", &id);
> +		if (ret || id < 0 || id >= APM_PORT_MAX) {
> +			dev_err(dev, "valid dai id not found:%d\n", ret);
> +			continue;
> +		}
> +
> +		switch (id) {
> +		/* MI2S specific properties */
> +		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
> +		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:

SENARY is also a thing these days btw..


~val


