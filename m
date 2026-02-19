Return-Path: <linux-arm-msm+bounces-93425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOUTE3sxl2kcvgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:51:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA86160621
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 16:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88D773003738
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CC63446BC;
	Thu, 19 Feb 2026 15:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x1eCrl4H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771634A3D8
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 15:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771516278; cv=none; b=Nd6TB3JzzZGnkVlkudd/AKQcMGWeS0pf0Oh2hnOyoiP1VtWGuQIEuBwsEIBDQBNFgv0TZGce+q2WRY79c+sQ1eLgy6hyEfujYN/YleZYg7zFLIduHMH9l8rBzzWxWKMxH6Y4bC3NmYtOAkh+BtVqIpPfA6+7EFvp773tpQG+Fl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771516278; c=relaxed/simple;
	bh=ODFwwXoRVjbg5ASiqI3JvCuqjJsJcoTjporBqEvLB54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArIh5eJavHBOjla97rCDZX/qrwGf+S9/dUn7fDAVBJ8lwd8oeGuwu5u0B9wB9orRyMc1TeS9ElaTaYIJyhgXVOrzxF2tDTN9uK+nqWW+4Yk/5rnBR2yICRCl4Yf/j2sX7xM3nUAwhciNVzKKaUWMsGrPT7ScgE0OP6FxbUnMTtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x1eCrl4H; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483a233819aso6315165e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 07:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771516275; x=1772121075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6bmYmrM1uJ1f/mzBWOAIkHYrJfIo9TYZxvrZO7Xg+M=;
        b=x1eCrl4HKdsL0U/WDYJRvtF39HI5enhrfUr+2g47FPlr48ZvEL1rIcn7xF/ejJQKAb
         pEuC/qm50Cub65Mzqzlrh3xlS1IMx/ocB7fKXVqoMhPL1rF4eyont565qeHvzEgzigJ/
         E/qRzX04rMDA3fHXWguvsekeCtPnfnIjx9aSRniZoIwURnggzw0Kh3/Y1F96UlJQttED
         EH8rlNwjjx1k+nY1jRz/MphLmYKSVx7LOfwY0bl8d7ldUaXMjxaHOirX/ZkAlpckRwxy
         ClawJ6uJLZIyKFliRRcsbgiuIzE/GLjepJ6zJ2XZiC4XIg7OIKWapIj/zHooSn7mEYM6
         LlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771516275; x=1772121075;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6bmYmrM1uJ1f/mzBWOAIkHYrJfIo9TYZxvrZO7Xg+M=;
        b=l1+SWWAwCHHFAe/MvIUtrsQwzwzEKN8xWYqqvZGNrn0P1RnOQ/vqVNxvseuhM+nL66
         m81Bk2Hb8dilulIyFyrqOF7Z02PX+6Mhgiv+drTPrfLk3kOt3nT7fDTUV6TpGicKyx8N
         +nRKJVyqznwmuFrxEmH8559rvAN2VguL8h0HWYA6Gl7Pyf/5Am+vlvqQ6ANRKswY3x6I
         aX/nR3qMFJwYGSoA1aqXuzDN4sVDn7DNzhU1rdINjyNgQqDZq63vTRLkWkCeFKeFD5Nx
         uGrWncg+sBuLUEoQXfi4gYWlwSj/Ix5h1TF9pcu6JkoWCfSmcErJ445b0jepl2l7Vyeq
         Tiig==
X-Forwarded-Encrypted: i=1; AJvYcCWOZHNPzSpxeqRAS6dwg2go83tihaROaB7yC10sPfX8qaI8y72pmaF25PEXizGIRov737fr3arITC9WnGbd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnmo8Ydnzp/uYyDR+1WrqbPxmbzi877mogajZUL4X99wb2CGUZ
	FrWZ4t81pcIfXvSp71aNabQjeyNuSa6Bt7Bth+UzX/p/pEn9ThnYlviNinhI8/qZSqCEaPH40P7
	kj8mlgF0=
X-Gm-Gg: AZuq6aLxbEd81o/ydBCintHVEL4B7JFiHKbR55gKbKx4p5Ey+KncNfNnmHG/Dju5xyZ
	Hl6sWrQvM51mBSJA2zSr6ATXziroNEQx17PdY2Wmzlc/GiWAqwGDzUzb4NifyVNi67TVRCj90f6
	r1QB9ddvgw0dI5Qxt9WrECraXYE02PqdowHwSItfzFu4tpBEidSFu6PcY/xsLi5K0ZPT6CEX38C
	1jGHnSPFwqoCKBtUYIRQojl3PsdL6aPbYJ5r7ZjKGReabqnOP9ACp89+a8o3rAJZvVHAKiAaMWz
	u1+fglaXq4JsK5hc21yu7gRFSfB4YFmUaKUVy1AmnO6B/x5lT6AYCTB1bNyh8A426X28yJcUeL+
	EZRZlHGU03Mqj26YcLtgOHODwqM0+h6WsJhbIg5AnuZrv1c5ZE8pIIigvt1phePKrUYoXtr8UWX
	V+ushzbROCstWoHSj9DkpUcq1Vh9YANmA1EFwnZmqeCd5Nvq+6xku4MVSXBtuyUDBdgbRzgZGci
	90=
X-Received: by 2002:a05:600c:3b01:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-48398a678e6mr97258585e9.3.1771516274692;
        Thu, 19 Feb 2026 07:51:14 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31bc068sm9361445e9.4.2026.02.19.07.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 07:51:14 -0800 (PST)
Message-ID: <708b6179-90b9-4fe9-9c0c-738fc1c82c2e@linaro.org>
Date: Thu, 19 Feb 2026 15:51:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: qcom: camss: csid-340: Enable PIX path support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, rfoss@kernel.org,
 todor.too@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
 johannes.goede@oss.qualcomm.com
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260219152737.728106-3-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-93425-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6AA86160621
X-Rspamd-Action: no action

On 19/02/2026 15:27, Loic Poulain wrote:
> Add support for CSID to PIX interface.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csid-340.c      | 85 ++++++++++++-------
>   1 file changed, 55 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 2b50f9b96a34..f7b4cb054c55 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -41,19 +41,24 @@
>   #define		CSI2_RX_CFG1_MISR_EN			BIT(6)
>   #define		CSI2_RX_CFG1_CGC_MODE			BIT(7)
>   
> -#define CSID_RDI_CFG0(rdi)					(0x300 + 0x100 * (rdi))
> -#define		CSID_RDI_CFG0_BYTE_CNTR_EN		BIT(0)
> -#define		CSID_RDI_CFG0_TIMESTAMP_EN		BIT(1)
> -#define		CSID_RDI_CFG0_DECODE_FORMAT_MASK	GENMASK(15, 12)
> -#define		CSID_RDI_CFG0_DECODE_FORMAT_NOP		CSID_RDI_CFG0_DECODE_FORMAT_MASK
> -#define		CSID_RDI_CFG0_DT_MASK			GENMASK(21, 16)
> -#define		CSID_RDI_CFG0_VC_MASK			GENMASK(23, 22)
> -#define		CSID_RDI_CFG0_DTID_MASK			GENMASK(28, 27)
> -#define		CSID_RDI_CFG0_ENABLE			BIT(31)
> -
> -#define CSID_RDI_CTRL(rdi)					(0x308 + 0x100 * (rdi))
> -#define CSID_RDI_CTRL_HALT_AT_FRAME_BOUNDARY		0
> -#define CSID_RDI_CTRL_RESUME_AT_FRAME_BOUNDARY		1
> +#define CSID_CFG0(iface)					(0x300 + 0x100 * (iface))
> +#define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
> +#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
> +#define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
> +#define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
> +#define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
> +#define		CSID_CFG0_VC_MASK			GENMASK(23, 22)
> +#define		CSID_CFG0_DTID_MASK			GENMASK(28, 27)
> +#define		CSID_CFG0_ENABLE			BIT(31)
> +
> +#define CSID_CTRL(iface)					(0x308 + 0x100 * (iface))
> +#define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
> +#define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
> +
> +#define CSID_MAX_RDI_SRC_STREAMS	(MSM_CSID_MAX_SRC_STREAMS - 1)
> +#define CSID_PIX_SRC_STREAMS		CSID_MAX_RDI_SRC_STREAMS

This I think is fairly common - PIX is ~ always the last one of four - 
should probably be in the shared csid.h
> +
> +#define CSID_IFACE_PIX	-1

-1 ?

>   
>   static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
>   {
> @@ -69,11 +74,6 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
>   	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
>   }
>   
> -static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> -{
> -	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
> -}
> -
>   static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
>   {
>   	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
> @@ -88,7 +88,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 * the four least significant bits of the five bit VC
>   	 * bitfield to generate an internal CID value.
>   	 *
> -	 * CSID_RDI_CFG0(vc)
> +	 * CSID_CFG0(vc)
>   	 * DT_ID : 28:27
>   	 * VC    : 26:22
>   	 * DT    : 21:16
> @@ -97,18 +97,40 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 */
>   	dt_id = vc & 0x03;
>   
> -	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
> -	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
> -	val |= FIELD_PREP(CSID_RDI_CFG0_VC_MASK, vc);
> -	val |= FIELD_PREP(CSID_RDI_CFG0_DTID_MASK, dt_id);
> +	val = CSID_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
> +	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
> +	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
> +	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
>   
>   	if (enable)
> -		val |= CSID_RDI_CFG0_ENABLE;
> +		val |= CSID_CFG0_ENABLE;
>   
> -	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %s RDI (dt:0x%x vc=%u)\n",
>   		csid->id, enable ? "enable" : "disable", format->data_type, vc);
>   
> -	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel_relaxed(val, csid->base + CSID_CFG0(vc));
> +	writel_relaxed(!!enable, csid->base + CSID_CTRL(vc));
> +}
> +
> +static void __csid_configure_pix_stream(struct csid_device *csid, u8 enable)
> +{
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PADS_NUM - 1];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +	u32 val;
> +
> +	val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
> +	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
> +
> +	if (enable)
> +		val |= CSID_CFG0_ENABLE;
> +
> +	dev_dbg(csid->camss->dev, "CSID%u: Stream %s PIX (dt=0x%x df=0x%x)\n",
> +		csid->id, enable ? "enable" : "disable", format->data_type, format->decode_format);
> +
> +	writel_relaxed(val, csid->base + CSID_CFG0(CSID_IFACE_PIX));
> +	writel_relaxed(!!enable, csid->base + CSID_CTRL(CSID_IFACE_PIX));
>   }
>   
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -117,12 +139,15 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   
>   	__csid_configure_rx(csid, &csid->phy);
>   
> -	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -		if (csid->phy.en_vc & BIT(i)) {
> +	/* RDIs */
> +	for (i = 0; i < CSID_MAX_RDI_SRC_STREAMS; i++) {
> +		if (csid->phy.en_vc & BIT(i))
>   			__csid_configure_rdi_stream(csid, enable, i);
> -			__csid_ctrl_rdi(csid, enable, i);
> -		}
>   	}
> +
> +	/* PIX */
> +	if (csid->phy.en_vc & BIT(CSID_PIX_SRC_STREAMS))
> +		__csid_configure_pix_stream(csid, enable);
>   }
>   
>   static int csid_reset(struct csid_device *csid)


