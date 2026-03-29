Return-Path: <linux-arm-msm+bounces-100603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M/REDcwDyWmitQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:49:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB10351A1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89FE8301178C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8861130AACB;
	Sun, 29 Mar 2026 10:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GWj6znoZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B12D23BC
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781385; cv=none; b=V3XWs8fBEs/peRyaY5fUKFSYM97vts8jnY1Tnv56dTEMKZkIJ+inYsnbl953YFQGJDXa9yyjSaIrJoLRD42qCn/RgekCRU21+PeDzwb72TCEA9fbvncycqbQ9A5tj1pQPfuk/VfgNGx20Zb61dua5G/SLgXmWrZEfMgNW6veIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781385; c=relaxed/simple;
	bh=qPgJB1412scMKjPERTwejrRFPUKo3ELQQitWiHmRd68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pg2S+z23f7uwIbP58FyvR30wZ2Qh0VKsUxvcy5GQFJAEgDkplhmf8CA9/3hnpTbGm9LJMiDgCB1F2c2J4RuBrVP+8YtVEgdSY2N4+NYDqLGZJhfn013oSB6/BhC8rjEqWt66gpvgX78JrkRS7qlwE9YyWYTxVOoEc1K0P3++Mag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GWj6znoZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso42313165e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774781382; x=1775386182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sq3b0TAiUMLd8kb02Rio5LSq8QkOvfsP8V+wJj+SSFE=;
        b=GWj6znoZWsgmoI1nERD73GZkPZaWX8nR10AR6gqXoizKhX2XtpnIrYHkHUdDZ1RobJ
         PvSgHdxkSQlgVb3gu4xOmtfpFNbd+ESAMuN/EdlVPIKiZkAyBKUx3ZtRxA63e7beS1UO
         iTKW91JrrzO++xsL/gxY86Vd2I/SfXmpZxZiMXo4AkWboc6LwHbKHJn020GSTaktUlva
         6STZZiidoVY7HSwilYZB2QpskSmemLxiD1PyVK5/7hdcZTgAduOJWKe/O6s1PGl7uRTH
         WbG5E2eFrEQWaay3YoznoxvDXAMYbbG6NRRaMVpPe/NRFWRtXqg/ZMeasZlROsAi3sdE
         8ZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781382; x=1775386182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sq3b0TAiUMLd8kb02Rio5LSq8QkOvfsP8V+wJj+SSFE=;
        b=O07WRRhw5J3hAkUF/aYxNDpN/avx8vPFsMgBGuKkpvi0axSZEnEitLkSZdJgsbHZat
         50kXM2ebPGbnxB2F9JU8rP3cQwz5SDGLKH2Ws+tuJVpbiHu+SLYjtUDlpnSS7Z49QI8s
         VU1wV1CY3ur8lDC5jvcE7a7WzpOL/q5MS2qi7oCpoBywCYREK5dZQbAbImG2aCfO1q92
         Q2GY0KfPV9SJ0QWRNAsEpwywHf5Ai920r3hG0Xi4h/TkJLrZPPNNqphUENNPesS99zTs
         de0ItplothPA7SBrRTEx1cIoOHRT1t3b8zJWx5ku25GgyJCm6sP4mLNoXE1wYAAK6iwE
         EY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpVxU7M15ZlfZ9K3eK6Omn6ITBDZgihcJOtJWDSPa1emuzDLhS9KssSEhA5CmdZK70ibqQ5Ml3wwhWrFIB@vger.kernel.org
X-Gm-Message-State: AOJu0YygTWPPZaXYXfAG5gajUoRt5uJ4DyNeLs5rQaCC4P6KkkVoej9x
	MMSOGLH5cHwxsCXoR6xu8wmdqoYP7PgIkRKVjf5pcQ1eLZhEVpXBFR8ybzdGkB3lrDg=
X-Gm-Gg: ATEYQzxHwRyu5D2kpGQOUDyQPbZ9SrIc4aeFCHQoySUf82akNfPQzPORZ7HvHxmydQI
	eNlAsoTcgw7NqamZxUGl9LPreZ7HBLj408MJmd3GyPhISWLtkQWe6ddftEQMqpsuKxmfgdcWEBN
	C3lpWraloTjpo0GGr/lg0Relq34mYa9kCQyBT5IjpRaqIlnaK2Fp9QARLObhl4hRqx+1MfIXnm5
	jg9Nrs/GEBBreyiwdeHtK1HFfVTU1oeTRqoo2i2/W+JCLzq6EGqoiQo79yM3EcbeIZsdtpYz0iu
	iK1bdaa4pyQAsLBqVVNsQ/f0arj8R3udN59DY+me6bT9SAPececqT2IfXgjT3xaCzUhJMzpt7CD
	JiHXqaxgrw7Tpd6UYT2iGvp+oICduEM94Oao3z+h7n1Cd5MT7QEfHZcMBpBCrta9NfatuuGI8qC
	3aYBk1Iwq5YMcPxFVWgRTDD+jlYDiHWCQ=
X-Received: by 2002:a05:600c:c089:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-48729109d76mr100787105e9.9.1774781382247;
        Sun, 29 Mar 2026 03:49:42 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.41.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2577cbdsm11789542f8f.33.2026.03.29.03.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 03:49:41 -0700 (PDT)
Message-ID: <9e4baba6-dc66-4257-91d1-2dc356c45aec@linaro.org>
Date: Sun, 29 Mar 2026 11:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] media: qcom: camss: vfe-340: Proper client
 handling
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
 <20260313131750.187518-5-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313131750.187518-5-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100603-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 9EB10351A1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 13:17, Loic Poulain wrote:
> We need to properly map camss WM index to our internal WM client
> instance. Today we only support RDI interfaces with the RDI_WM
> macro, introduce a __wm_to_client helper to support any interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../media/platform/qcom/camss/camss-vfe-340.c | 84 ++++++++++---------
>   1 file changed, 43 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> index 30d7630b3e8b..d129b0d3a6ed 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> @@ -69,24 +69,19 @@
>   #define TFE_BUS_FRAMEDROP_CFG_0(c)			BUS_REG(0x238 + (c) * 0x100)
>   #define TFE_BUS_FRAMEDROP_CFG_1(c)			BUS_REG(0x23c + (c) * 0x100)
>   
> -/*
> - * TODO: differentiate the port id based on requested type of RDI, BHIST etc
> - *
> - * TFE write master IDs (clients)
> - *
> - * BAYER		0
> - * IDEAL_RAW		1
> - * STATS_TINTLESS_BG	2
> - * STATS_BHIST		3
> - * STATS_AWB_BG		4
> - * STATS_AEC_BG		5
> - * STATS_BAF		6
> - * RDI0			7
> - * RDI1			8
> - * RDI2			9
> - */
> -#define RDI_WM(n)		(7 + (n))
> -#define TFE_WM_NUM		10
> +enum tfe_client {
> +	TFE_CLI_BAYER,
> +	TFE_CLI_IDEAL_RAW,
> +	TFE_CLI_STATS_TINTLESS_BG,
> +	TFE_CLI_STATS_BHIST,
> +	TFE_CLI_STATS_AWB_BG,
> +	TFE_CLI_STATS_AEC_BG,
> +	TFE_CLI_STATS_BAF,
> +	TFE_CLI_RDI0,
> +	TFE_CLI_RDI1,
> +	TFE_CLI_RDI2,
> +	TFE_CLI_NUM
> +};
>   
>   enum tfe_iface {
>   	TFE_IFACE_PIX,
> @@ -108,6 +103,13 @@ enum tfe_subgroups {
>   	TFE_SUBGROUP_NUM
>   };
>   
> +static enum tfe_client tfe_wm_client_map[VFE_LINE_NUM_MAX] = {
> +	[VFE_LINE_RDI0] = TFE_CLI_RDI0,
> +	[VFE_LINE_RDI1] = TFE_CLI_RDI1,
> +	[VFE_LINE_RDI2] = TFE_CLI_RDI2,
> +	[VFE_LINE_PIX] = TFE_CLI_BAYER,
> +};
> +
>   static enum tfe_iface tfe_line_iface_map[VFE_LINE_NUM_MAX] = {
>   	[VFE_LINE_RDI0] = TFE_IFACE_RDI0,
>   	[VFE_LINE_RDI1] = TFE_IFACE_RDI1,
> @@ -209,10 +211,10 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>   	status = readl_relaxed(vfe->base + TFE_BUS_OVERFLOW_STATUS);
>   	if (status) {
>   		writel_relaxed(status, vfe->base + TFE_BUS_STATUS_CLEAR);
> -		for (i = 0; i < TFE_WM_NUM; i++) {
> +		for (i = 0; i < TFE_CLI_NUM; i++) {
>   			if (status & BIT(i))
>   				dev_err_ratelimited(vfe->camss->dev,
> -						    "VFE%u: bus overflow for wm %u\n",
> +						    "VFE%u: bus overflow for client %u\n",
>   						    vfe->id, i);
>   		}
>   	}
> @@ -235,49 +237,49 @@ static void vfe_enable_irq(struct vfe_device *vfe)
>   	       TFE_BUS_IRQ_MASK_0_IMG_VIOL, vfe->base + TFE_BUS_IRQ_MASK_0);
>   }
>   
> -static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
> +static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
>   			  struct vfe_line *line)
>   {
> -	u8 wm = RDI_WM(rdi);
> +	u8 client = tfe_wm_client_map[wm];
>   
> -	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(wm));
> +	writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
>   }
>   
> -static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
> +static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
>   {
>   	struct v4l2_pix_format_mplane *pix = &line->video_out.active_fmt.fmt.pix_mp;
>   	u32 stride = pix->plane_fmt[0].bytesperline;
> -	u8 wm = RDI_WM(rdi);
> +	u8 client = tfe_wm_client_map[wm];
>   
>   	/* Configuration for plain RDI frames */
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(wm));
> -	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(wm));
> -	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(wm));
> -	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(wm));
> -	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(wm));
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> +	writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> +	writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> +	writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_INCR(client));
> +	writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BUS_PACKER_CFG(client));
>   
>   	/* No dropped frames, one irq per frame */
> -	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(wm));
> -	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(wm));
> -	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(wm));
> -	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(wm));
> +	writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> +	writel_relaxed(1, vfe->base + TFE_BUS_FRAMEDROP_CFG_1(client));
> +	writel_relaxed(0, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_0(client));
> +	writel_relaxed(1, vfe->base + TFE_BUS_IRQ_SUBSAMPLE_CFG_1(client));
>   
>   	vfe_enable_irq(vfe);
>   
>   	writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> -	       vfe->base + TFE_BUS_CLIENT_CFG(wm));
> +	       vfe->base + TFE_BUS_CLIENT_CFG(client));
>   
> -	dev_dbg(vfe->camss->dev, "VFE%u: Started RDI%u width %u height %u stride %u\n",
> -		vfe->id, rdi, pix->width, pix->height, stride);
> +	dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u height %u stride %u\n",
> +		vfe->id, client, pix->width, pix->height, client);
>   }
>   
> -static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
> +static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>   {
> -	u8 wm = RDI_WM(rdi);
> +	u8 client = tfe_wm_client_map[wm];
>   
> -	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(wm));
> +	writel(0, vfe->base + TFE_BUS_CLIENT_CFG(client));
>   
> -	dev_dbg(vfe->camss->dev, "VFE%u: Stopped RDI%u\n", vfe->id, rdi);
> +	dev_dbg(vfe->camss->dev, "VFE%u: Stopped client %u\n", vfe->id, client);
>   }
>   
>   static const struct camss_video_ops vfe_video_ops_520 = {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

