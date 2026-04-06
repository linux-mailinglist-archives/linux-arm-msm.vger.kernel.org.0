Return-Path: <linux-arm-msm+bounces-102022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VNYRJp821GkNsQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:41:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E22843A7E62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 00:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC31B303FFBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 22:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CDE39DBC0;
	Mon,  6 Apr 2026 22:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P56FrZx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBBB1E89C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 22:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775515291; cv=none; b=e9U4rBEN6d4nOw2iMHWc3Y3QzylLHlc8kjmnN2LNi0fn4SLsJ9ptvsa0hKPhxKPGcCZeHLIg638fYPtRKwL8E/32JOQGVjIiDbiwMJ7OUQm/AH6tAE8q56htPPTaDv4Ox3KtfP84f1xvIoZ3HwgUTOYjZ8Ti4AvKO3shcHNEOnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775515291; c=relaxed/simple;
	bh=rq3AU77WzvBFXo+3+0Fp5PwIFd7YUbJZ6A/QINchdfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLkRMmF1xFNWCwSronQdT1yDQsZ5IdEA0jkN1jAaDaqamENbIgSV0MWk+AJGGAKYk5hnhjO+0CRDuzocKmxB/LvlNZV6srmzFiCFZ1yLG38z91jtfaja+TRwH2rpCctmZE1XHs3fuiiMUqI3SL33ZzXkGwbVQ13z4KWiXZH3ACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P56FrZx/; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38df0a031daso2567051fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 15:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775515289; x=1776120089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6xY5R4cNcV4g8oF6JwJO4h1zpXLceVm3FoP5Twk7Qo=;
        b=P56FrZx/GdYgpvN6O+oFAqrAdrJ0BaKrBkV0/ClXdenRzQFp3six4esYcnVEE288pQ
         gCeOpW9QTnwUBS5dVGVRI/KpJac9jn8vwxP0ENVvJnkUv9cGBO3w6DaDLFrkUAYdy/8T
         aw8F/SlAmeGTS5yODIQJcFzsUa6oezk7SGUHC9UkSUZ1gpmh40TTjkVE/Tql00ZcWqj5
         o4Oo3Bjsv8dCIt3/fHnCI1LGpTGLd8EYSD1oJQGA5peDFMRC5H8IreEYHm6Q7k8zlVTm
         yYGp6EcqfoCFnUfN9c3bMPjOT0bZdlo3i+THKRZUepw+PNQ64rx96+FAqkZjlH194KGp
         beyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775515289; x=1776120089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6xY5R4cNcV4g8oF6JwJO4h1zpXLceVm3FoP5Twk7Qo=;
        b=SW3PSfYSwJkswqk4wTyN5SPn0z7ZggemTKcAOjvUbzbHmT7WkzlEInc60fOQ7Xi5W+
         X1vXIAzILRtM/XwBBR9zLdBk666rO5BCErXsHUOambRr8sm2yzIkmw0FNDTGFmWKpk61
         Awpcl39QLg8Gs8igBULEnwl+7SSdNNlMXgbqUNLvvRoH9zjsCMM/+j/DFh1o5nKKywmP
         V6qIto/xQ4lChsRISAvP5xJTQYOCpKhCbZETyouyUsKvT00ZF00teF1DFvZ7qf9hZjow
         V3le6nYBLO1rfxPTatC20VqAeG1aABuAzw+rA32fWmXGraHRzTWPTq1rjYEWuyRPNweX
         HVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaJbT+XeleodgdCdV4inLdWFvIWfJuK6yRJPRwmwZJp3QsODl+75Io5Zi1KzASDyGQVPnubbUSLc90sTzR@vger.kernel.org
X-Gm-Message-State: AOJu0YzM5AWF10sHEJCPZjzOJ21mPhhuYdhsXaR6i4yYucyrlLwz4wBc
	S9CbwWqA0NhakgHwsViEmDKiub3iN7sLsKLcJQxgLIwT7+LDDts8M/mET0/jQ5Hws5k=
X-Gm-Gg: AeBDievUI/JiOGMcKUSPucL0JycQHyJ5dysyP6bABON6ZnJNfCrmt16q8WOJ0fmvbL+
	DBwZxlwFFUXnUbFhqIuTewLw5KfFnFeoWlJMF93x5aKv9cg+qEG2uNY5SMIhy0FNX97pPUtZXrr
	6aSm7ZFdK9V7xgW8SOM5rhtaTUKmFYsgsuUFlFVtqT9jaNLnmNBTqAoaWDkHGcqJfeQjftVPAvl
	eujRfZvD3vYDiO5LhhLWq/fZlX9tO69Ylm17d9avSsnH5aZAHEzhVNLLAOgtx6vd+0sLppOTIV/
	lIbDbHwWzN2sdH4gVwJUxPn7cW7GSp0mYiCMSpGcS4mqG8NP9gG3M+/VBiJIcaPRlFOzzdMLk2O
	lXJieMHc5lA3tlbJ3aiJEF++A5zfXi/NfCqOP4Lws9DGzwMeJlREtcTmgouUNbVvEeDK97eqQ+P
	lvgX0HtjTuAQsrbv5TJQlGlXpAz5sHBkgT9J7kuKYqQwZDuxAlljTHCDp1atNJB7pS3a5VBe/EG
	dLe2g==
X-Received: by 2002:a05:6512:39c7:b0:5a2:bc5c:f421 with SMTP id 2adb3069b0e04-5a337596dddmr2971851e87.8.1775515288463;
        Mon, 06 Apr 2026 15:41:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3509sm3676707e87.75.2026.04.06.15.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 15:41:28 -0700 (PDT)
Message-ID: <7b349fdc-7a78-4c17-a8ae-2729bc704186@linaro.org>
Date: Tue, 7 Apr 2026 01:41:18 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
To: bod@kernel.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
 Milen Mitkov <quic_mmitkov@quicinc.com>,
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
 <20260406-camss-rdi-fix-v1-1-d3f8b12473d0@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260406-camss-rdi-fix-v1-1-d3f8b12473d0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102022-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: E22843A7E62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 00:55, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Fix streaming to RDI1 and RDI2. csid->phy.en_vc contains a bitmask of
> enabled CSID ports not virtual channels.
> 
> We cycle through the number of available CSID ports and test this value
> against the vc_en bitmask.
> 
> We then use the passed value both as an index to the port configuration
> macros and as a virtual channel index.
> 
> This is a very broken pattern. Reviewing the initial introduction of VC
> support it states that you can only map one CSID to one VFE. This is true
> however each CSID has multiple sources which can sink inside of the VFE -
> for example there is a "pixel" path for bayer stats which sources @
> CSID(x):3 and sinks on VFE(x):pix.
> 
> That is CSID port # 3 should drive VFE port #3. With our current setup only
> a sensor which drives virtual channel number #3 could possibly enable that
> setup.
> 
> This is deeply wrong the virtual channel has no relevance to hooking CSID
> to VFE, a fact that is proven after this patch is applied allowing
> RDI0,RDI1 and RDI2 to function with VC0 whereas before only RDI1 worked.
> 
> Default the VC back to zero. A follow on series will implement subdev
> streams to actually enable VCs without breaking CSID source to VFE sink.
> 
> Fixes: 253314b20408 ("media: qcom: camss: Add CSID 680 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-680.c | 26 +++++++++++-----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> index 3ad3a174bcfb8..35a6bb209f97c 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -219,9 +219,9 @@ static void __csid_configure_top(struct csid_device *csid)
>   	    CSID_TOP_IO_PATH_CFG0(csid->id));
>   }
>   
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
>   {
> -	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
>   	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>   								   csid->res->formats->nformats,
>   								   input_format->code);
> @@ -240,21 +240,21 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 * the four least significant bits of the five bit VC
>   	 * bitfield to generate an internal CID value.
>   	 *
> -	 * CSID_RDI_CFG0(vc)
> +	 * CSID_RDI_CFG0(port)
>   	 * DT_ID : 28:27
>   	 * VC    : 26:22
>   	 * DT    : 21:16
>   	 *
>   	 * CID   : VC 3:0 << 2 | DT_ID 1:0
>   	 */
> -	dt_id = vc & 0x03;
> +	dt_id = port & 0x03;
>   
>   	/* note: for non-RDI path, this should be format->decode_format */
>   	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>   	val |= format->data_type << RDI_CFG0_DATA_TYPE;
>   	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
>   	val |= dt_id << RDI_CFG0_DT_ID;
> -	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
>   
>   	val = RDI_CFG1_TIMESTAMP_STB_FRAME;
>   	val |= RDI_CFG1_BYTE_CNTR_EN;
> @@ -265,23 +265,23 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	val |= RDI_CFG1_CROP_V_EN;
>   	val |= RDI_CFG1_PACKING_MIPI;
>   
> -	writel(val, csid->base + CSID_RDI_CFG1(vc));
> +	writel(val, csid->base + CSID_RDI_CFG1(port));
>   
>   	val = 0;
> -	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>   
>   	val = 1;
> -	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>   
>   	val = 0;
> -	writel(val, csid->base + CSID_RDI_CTRL(vc));
> +	writel(val, csid->base + CSID_RDI_CTRL(port));
>   
> -	val = readl(csid->base + CSID_RDI_CFG0(vc));
> +	val = readl(csid->base + CSID_RDI_CFG0(port));
>   	if (enable)
>   		val |= RDI_CFG0_ENABLE;
>   	else
>   		val &= ~RDI_CFG0_ENABLE;
> -	writel(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -293,8 +293,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>          /* Loop through all enabled VCs and configure stream for each */

The comment should get an update as well, this is applicable and should be done
for the changes in camss-csid-680.c, camss-csid-gen2.c and camss-csid-gen3.c.

>   	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
>   		if (csid->phy.en_vc & BIT(i)) {
> -			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_configure_rx(csid, &csid->phy, i);
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx(csid, &csid->phy, 0);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   	}
> 

-- 
Best wishes,
Vladimir

