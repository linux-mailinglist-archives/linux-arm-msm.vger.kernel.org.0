Return-Path: <linux-arm-msm+bounces-77343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F2BDDC35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D7373BBF22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1105A31A560;
	Wed, 15 Oct 2025 09:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eD/cc83R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFB331A552;
	Wed, 15 Oct 2025 09:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520359; cv=none; b=FmZBpgJ3+4Ohu+DQ9FJPULwURnNkWPTcwqtm7YYSivvmYi6WUcEjk4JgQo42E9/nVjPfFBJYGTU8BArLSeN6jkAphyQjzK++OuGgc3W+QRTJ2lylncRlsZgNSpFREaOeuPod+7utfksUD7vWlJg1ymqS/ByNk3qK+FMvGeBv0U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520359; c=relaxed/simple;
	bh=bvqcJJFOJIybp82L1CiimY/fNVZarwQWHwIox/XMPn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GpkC+YQHAYpOuuOPGCNAD80wXA69ZuojgcxT0GwuPWbkO8veElUDQIK9mApvzx59JA5HJiCjELKRIYl01aKAPAjWYnWenfyncIplyvKZfgOSfghWaXfoTw8+AUgKk/w4NhhuiXQqWM+8qaSMAUB6187CKb1hKYakiSezq+PwraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eD/cc83R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D325DC4CEF8;
	Wed, 15 Oct 2025 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760520359;
	bh=bvqcJJFOJIybp82L1CiimY/fNVZarwQWHwIox/XMPn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eD/cc83RNv4a6hP1K5ISJjiVUgRWv9jKWFiy4heVxspVrDqZCP4wjBccNd0lX9y3L
	 7PWagmjEdACDf4lgtscrjeSxk8bVk0Acfi/hcyWmv6WR3tS3+QJl3vM+eNoxnkQzFH
	 5xQopje5OxBiIef5ELHyuJ7u9nDSoMac11OFE0DQ/helhl7PynttpCjbFxxDdpsUgc
	 FhnrMK52vtjRI/Ewjuy0lxHJK6/CtUO6SJvqi3bt9Q+mQp4o8OWHND943+sqIkqyRH
	 7I62kiTglA3pF5t5QOhvWfTg933g/k0HV/g9nikipXZkA9H7m2T4h728UeKqZXcwYE
	 3xG8YZnOyd5wg==
Message-ID: <2a6319e5-15e5-4cb7-a2f3-7521383fc30e@kernel.org>
Date: Wed, 15 Oct 2025 10:25:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] misc: fastrpc: Update dma_mask for CDSP support on
 Kaanapali SoC
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>,
 kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
References: <20251015045702.3022060-1-kumari.pallavi@oss.qualcomm.com>
 <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20251015045702.3022060-4-kumari.pallavi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/15/25 5:57 AM, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA mask configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_mask` to 32-bit and update
> it to 34-bit based on CDSP and SoC-specific compatible string.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1a5d620b23f2..f2e5e53e9067 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -267,6 +267,7 @@ struct fastrpc_session_ctx {
>  
>  struct fastrpc_soc_data {
>  	u32 sid_pos;
> +	u32 cdsp_dma_mask;
How about making this an actual dmamask ex:

	u64 cdsp_dma_mask == DMA_BIT_MASK(64),
	u64 dma_mask == DMA_BIT_MASK(32),

This will give more clear picture of what is going on,

BTW, these values are not set in the patch for some reason for both
default and soc specific soc data>
>  struct fastrpc_channel_ctx {
> @@ -2178,6 +2179,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
> +	u32 dma_mask = 32;this should come from default soc_data, do not hardcode this here.
	u64 dma_mask = default_soc_data->dma_mask;>
>  	cctx = dev_get_drvdata(dev->parent);
>  	if (!cctx)
> @@ -2197,6 +2199,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->dev = dev;
>  	dev_set_drvdata(dev, sess);> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> +		dma_mask = cctx->soc_data->cdsp_dma_mask;
> +

>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2211,9 +2216,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_mask));
>  	if (rc) {
> -		dev_err(dev, "32-bit DMA enable failed\n");
> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_mask);
>  		return rc;
>  	}
>  


