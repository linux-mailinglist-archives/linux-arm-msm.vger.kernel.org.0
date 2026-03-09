Return-Path: <linux-arm-msm+bounces-96271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPevMj3UrmlhJAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:07:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE3523A465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 15:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6AE4F301D4CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 14:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2193C6A30;
	Mon,  9 Mar 2026 14:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3fYBqC1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF01643B;
	Mon,  9 Mar 2026 14:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773065233; cv=none; b=bGDpJGgTtsJVs0ttZTZo+WCjXAH4/O4NOvR8GgmV8U+wMMHNvXbkJU7GTJuU9nwkVDQ+rnNF4jaxWT3Hxc3OdgJEBTTynajNuQgZBxJW9pEyy3zybi0r7uEwddphP3LZLIaxkmXzBj9LFoknMrU4eV5v525qwJUudSV4pHYNQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773065233; c=relaxed/simple;
	bh=HlKSCs8dHrJ/flqaXfiyPFLgo7dL4HLFHv1x55rIGCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfVypMpMr34kxgSvC46O75eG3rDcBEiqv+9mf1TJ53wtYcIhMT0IsSs2YwML3TAX+r7RStEdu/c2Z2CMsnw61mMtdxBZ5a3ypgo90q4/pZvGs2dhMLW7rfWlltpYl6wFLTk1Lhi+WX4bwquOMW9UIrWNfjuwi2Dlwac10sPJhIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3fYBqC1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2552FC2BC9E;
	Mon,  9 Mar 2026 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773065232;
	bh=HlKSCs8dHrJ/flqaXfiyPFLgo7dL4HLFHv1x55rIGCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f3fYBqC19P8Um7L72Av6UyuTTxVQKTvIqv71/Oxqhcf/27ICq0O2X3r3Oi6hmMPzj
	 w9AMKuJwl6tr1VVecaAgrkHMmuQ61F2xii09l7ktbKxx47NnTXG1pvSytlhSmSF8cK
	 pu0tY4lMqvzu/GpnSyLe6ji4j8yBtsijqm6oAoS4F9UVijFfarKhL9gsB0zLMMHIj8
	 un8RB1vwxNG46Y+yMBV1v3ozfy9IOpYUF6YVtKvfcaodCA4IJeK/eC9iDOrIYQSAan
	 WdEowAfnW8rqEobLgxup6ojQSjro4RZgjXDoZMZ9Wnxxik3sYWJ2sk1cQdRagx2cSI
	 j7lR0LEo2OVmQ==
Message-ID: <cafce8ef-5297-46ea-a14d-8a12bdf2f181@kernel.org>
Date: Mon, 9 Mar 2026 14:07:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] ASoC: qcom: qdsp6: q6prm: add the missing LPASS
 MCLK clock IDs
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260309111300.2484262-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7BE3523A465
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96271-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.972];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,lkml.org:url]
X-Rspamd-Action: no action



On 3/9/26 11:12 AM, Mohammad Rafi Shaik wrote:
> Add the missing LPASS MCLK ids for the q6prm ADSP.
> 
> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---


This patch has already been submitted previously by Neil, Please pick
the patch from https://lkml.org/lkml/2025/10/6/828


--srini
>  sound/soc/qcom/qdsp6/q6prm-clocks.c |  5 +++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 11 +++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..51b131fa9 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -42,6 +42,11 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_INT5_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_INT6_MI2S_IBIT),
>  	Q6PRM_CLK(LPASS_CLK_ID_QUI_MI2S_OSR),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_1),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_2),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_3),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_4),
> +	Q6PRM_CLK(LPASS_CLK_ID_MCLK_5),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA_CORE_NPL_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_VA_CORE_MCLK),
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index a988a3208..8296370e3 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -52,6 +52,17 @@
>  /* Clock ID for QUINARY MI2S OSR CLK  */
>  #define Q6PRM_LPASS_CLK_ID_QUI_MI2S_OSR                         0x116
>  
> +/* Clock ID for MCLK1 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_1				0x300
> +/* Clock ID for MCLK2 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_2				0x301
> +/* Clock ID for MCLK3 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_3				0x302
> +/* Clock ID for MCLK4 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_4				0x303
> +/* Clock ID for MCLK5 */
> +#define Q6PRM_LPASS_CLK_ID_MCLK_5				0x304
> +
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_MCLK			0x305
>  #define Q6PRM_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x306
>  


