Return-Path: <linux-arm-msm+bounces-95902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK6iEP0Tq2lzZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:50:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A10A522673E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 18:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 572343008D1F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 17:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5213A9D99;
	Fri,  6 Mar 2026 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vaMtsJDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836F03F23B3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 17:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819450; cv=none; b=rBGkdp23+K7qecNq8gZbIkf+d5BFQa6kQ0lk4eAyAQSwOUxivTPPFatSG0ijcLECm5GDvmoGZC2u4ItuqZx3jS0onU3O60Gw9xzH4rskD2ZauQDfBbjlIgtQsokABVOFSeIkaAYsm9qVz7hTKCwRuf0caHmETFQglHq9WcdaK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819450; c=relaxed/simple;
	bh=TN6+7SOhv/QluXEOSZ2R3yz5cesa1HDneUCZnoJx/+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VWAgfK2iCIP4tWPt+34b3pNBDhw8EmurXWHFQKuZQDO8NXQxJ5oc/8cgNAtScwoTd9PzNP4v53TzW00HgZJqgZNktvgAN5oXrn400hGp2kHW58Fd7d8PHVY7Ft0lScUwLQfWTkrze22EVCxQT0kwhcX1yJYpnRV2yJMO7bOGbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vaMtsJDW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483703e4b08so92970615e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772819445; x=1773424245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfXNl4LI/BbPWSESoLt5h8xXsRScFDB8lotHZ/T+L1Q=;
        b=vaMtsJDWntHuXpSi8BOu3a9qdzgre+N0H64D9Gkd8d3tXF76ujoLtY2RE+okuXbTvl
         bVjPXrsCJY2P5Ug+9cgvYLX0dz4zOxUpgCTfXMov1vPZ2GaPNrkpMtF0GPxcJy0pkiV3
         Czs/9iL8vSpB+ZotjryJvb4f3TfWd885q6D0XDmwOfy2y8oGW6nYjOkbaeBHOEPEEvJ+
         KvDldramxfYZiQeNw/J4tKDNlih3CgXT3t4IlYAegR0x+hiiGQGM1QkJLTynJ02peD5h
         UdfqCI4dSZ4KZLG3TrujFgnFfE9Kv1Bgi5BzWn8cYd4y28oxxutrYeXa6WPnyLWr8/3q
         btSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819445; x=1773424245;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfXNl4LI/BbPWSESoLt5h8xXsRScFDB8lotHZ/T+L1Q=;
        b=GoQeoeykb4UV1zlyuywY40Mq0jlqMGPycBhRZE2REcpTE6jgCBbrpnpfup/I5OVPuN
         FLv/POyZZUYCDpIUSatBHspMUqeXYijpZGysBxlD10D8oDTHva1FRmCR7veVwxe5mftF
         Q7j/QH4TPV3ffDWd98c035Wtxxwwb4AXjqFGxmY5sp5knmzUDzBhREnnxCCODQgwKGyI
         RIcn1IFRef3SVnXIrkZe69u2Aa3PZCBSOKhDgh+s1YOzuxZRQAWChKFMe2xO5kappnFN
         arccBJW/NQul4wb+QW7cTaR9K0Pzg600Abi/oOLpe7FnYIXdAD2P1//8ksasX75TM7Fj
         RAJA==
X-Forwarded-Encrypted: i=1; AJvYcCVQnOlYuKYKUhTROEtfhP8xYZOtLpKa4+UZXFYs6nk9W1KEo1sdJXbOoBWjNQWWiHPvOvMOcHWF9GAh+xsK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg37ccR6NruCM69HYVqoTLqgUmmQZGZ36VC7UbBsA8mzcrvGBo
	JUP9p0PrcA5mwyk0T1ox1uO6tyUH+4a0kxJTopwpqzHk6WWf3N38xTygdLqa6EkFAN0=
X-Gm-Gg: ATEYQzyd7xMCoJ8xkaYKKQKZoXSB8ie+QyDsmfNtNcM8a/Qb68vhl5K/km5eAhful7g
	D/hb+bU/Q4hZEWQB6vA/iGPUzeK4swu2KET7oTPnv3cRgKEmbzjsqreuVu8zMZ/TTYoD4fpLH+0
	JgNJgWMzYeKrBhBanFy4k5uFvjoF90NQlQ4wyVMG7o6q7uCkyF7KcEZYWUfz5MmHYIdnTik4rYI
	TmgCx41NRdjhrjSKkT+l58BieI2HQxFg+26YrDd8koOiW9T5nucQu4hnW9/Kn1y9sghC+FYWp/h
	etl+Xm9NqSTCtImmue1QfcXwSQtuETT5N4kkfSiItBer1EX2N81BzLfZNODw7Dv/hBd9vf36MHC
	PFvA9ztAtPaamAfwecRlLYWPFh79vz64DFn+gtTSWum/o4GOq4ctwVIYG7Q5sqoeaVz0eXItzW/
	4is078D/g2rd9spxNTuh0Nf52gz/aw7HtvIYE=
X-Received: by 2002:a05:600c:1e88:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-48526759d12mr55798445e9.15.1772819444688;
        Fri, 06 Mar 2026 09:50:44 -0800 (PST)
Received: from [192.168.1.102] ([93.107.81.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b0c38sm55432125e9.9.2026.03.06.09.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 09:50:44 -0800 (PST)
Message-ID: <ac87ca00-27ef-4fad-9d69-146beb5609af@linaro.org>
Date: Fri, 6 Mar 2026 17:50:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] media: qcom: camss: csid-340: Switch to generic
 CSID_CFG/CTRL registers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com
References: <20260306140220.1512341-1-loic.poulain@oss.qualcomm.com>
 <20260306140220.1512341-2-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260306140220.1512341-2-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A10A522673E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95902-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Action: no action

On 06/03/2026 14:02, Loic Poulain wrote:
> The former RDI-specific register definitions (CSID_RDI_CFG0/CTRL) are
> renamed to unified CSID_CFG0/CSID_CTRL variants, as their layout is
> interface agnostic. This refactoring provides the foundation for
> extending csid-340 with missing PIX interface/path support.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   .../platform/qcom/camss/camss-csid-340.c      | 43 ++++++++++---------
>   1 file changed, 22 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
> index 2b50f9b96a34..adcbe3e01d62 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -41,19 +41,20 @@
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
>   
>   static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config *phy)
>   {
> @@ -71,7 +72,7 @@ static void __csid_configure_rx(struct csid_device *csid, struct csid_phy_config
>   
>   static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
>   {
> -	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
> +	writel_relaxed(!!enable, csid->base + CSID_CTRL(rdi));
>   }
>   
>   static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
> @@ -88,7 +89,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	 * the four least significant bits of the five bit VC
>   	 * bitfield to generate an internal CID value.
>   	 *
> -	 * CSID_RDI_CFG0(vc)
> +	 * CSID_CFG0(vc)
>   	 * DT_ID : 28:27
>   	 * VC    : 26:22
>   	 * DT    : 21:16
> @@ -97,18 +98,18 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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
>   	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
>   		csid->id, enable ? "enable" : "disable", format->data_type, vc);
>   
> -	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
> +	writel_relaxed(val, csid->base + CSID_CFG0(vc));
>   }
>   
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

