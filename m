Return-Path: <linux-arm-msm+bounces-81900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A8C5E7B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 18:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8AA234518F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 16:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC11258CE9;
	Fri, 14 Nov 2025 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+FmMKTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342922173F;
	Fri, 14 Nov 2025 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135758; cv=none; b=FUfWL2jJuB6hCHJx2oEr6qt1Vp5DKMgmzBCVFIUNawFg8+cTHm9N2d83FbuBK620QHVs6SUQ05y1zqi/ihuG5mfzdHBQoOH6UwWOHnJpFGM3XZac0wi6FC9U2YNBWBuJa/9Q99P0UIrOJ9ZhLJofC0M4DuXFF4CvcsM3ZYkSVWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135758; c=relaxed/simple;
	bh=FUDCpNgNop8HGZx7sTIXYdEJpntgdXS+elPR6PEkmS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJplxLc+dYxqUJUGRrWZg9oPmQL5vXwjog/dUypqTGFnIJdIcPbO13NGxb8Bj6IoZjlt+33wvzPe6d3p52zgqA4KkasvvMpCsJKiQ6ZCsYZ8fJrRPr7Oo6h9SYaaKMabHwEGAMX82dtljU428Uy5N+4q8oSDXSJ0883lGxGUrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+FmMKTs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43232C4CEF1;
	Fri, 14 Nov 2025 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135758;
	bh=FUDCpNgNop8HGZx7sTIXYdEJpntgdXS+elPR6PEkmS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+FmMKTsbYYRhC3CrAZYJakK68v4j0ChxewBYoHv0OLIJIoHpABT8jOpTwdvOodhN
	 UMUNQFDSDRvBIuC0nCwxDGIuzh0ywS7SLLFeXUqAk6iWS4lF82dfxpkTxzp1fAuTrK
	 vnVg7sfA3gDke6uRsBsq42FdsxD+PSJ4QkPqct/PAWQvvXtoEG99UpRorM7SDEDbkv
	 bYnTtHqOn4pYvLWRhQ+uU0vcPCNv3YQ1NQn/IgCknf+feHJc+Ke/GTX1ZrrzIB8sQq
	 8UJzPEsrhPXGhBuurXy0yM4N8vinXGGheDan6yEqhCiXiLcuCR91zgQI840G9jo+Xi
	 r7Ze6f22Awfcg==
Date: Fri, 14 Nov 2025 10:00:25 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <3gld6djjzfwu6rj47tz6gdwdpmh3hjexce5y6crqjus7ourgxf@puxrcpvijitl>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-5-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114084142.3386682-5-kumari.pallavi@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 02:11:42PM +0530, Kumari Pallavi wrote:
> DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> both Q6 and user DMA (uDMA) access. This is being upgraded to
> 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> Kaanapali SoC, which expands the DMA addressable range.
> Update DMA bits configuration in the driver to support CDSP on
> Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> it to 34-bit based on CDSP and OF matching on the fastrpc node.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index bcf3c7f8d3e9..2eb8d37cd9b4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
>  
>  struct fastrpc_soc_data {
>  	u32 sid_pos;
> +	u32 cdsp_dma_bits;
> +	u32 dsp_default_dma_bits;
>  };
>  
>  struct fastrpc_channel_ctx {
> @@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	int i, sessions = 0;
>  	unsigned long flags;
>  	int rc;
> +	u32 dma_bits;
>  
>  	cctx = dev_get_drvdata(dev->parent);
>  	if (!cctx)
> @@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		return -ENOSPC;
>  	}
> +	dma_bits = cctx->soc_data->dsp_default_dma_bits;
>  	sess = &cctx->session[cctx->sesscount++];
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
>  	dev_set_drvdata(dev, sess);
>  
> +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> +		dma_bits = cctx->soc_data->cdsp_dma_bits;
> +
>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>  
> @@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>  	if (rc) {
> -		dev_err(dev, "32-bit DMA enable failed\n");
> +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
>  		return rc;
>  	}
>  
> @@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
>  
>  static const struct fastrpc_soc_data kaanapali_soc_data = {
>  	.sid_pos = 56,
> +	.cdsp_dma_bits = 34,
> +	.dsp_default_dma_bits = 32,
>  };
>  
>  static const struct fastrpc_soc_data default_soc_data = {
>  	.sid_pos = 32,
> +	.cdsp_dma_bits = 32,
> +	.dsp_default_dma_bits = 32,

So, "dsp_default_dma_bits" specified "what is the dma_mask for the
non-CDSP fastrpc instances"? I don't find "dsp_default" to naturally
mean "not the cdsp".


Wouldn't it be better to introduce two different compatibles, one being
the "qcom,kaanapali-fastrpc" and one being the
"qcom,kaanapali-cdsp-fastrpc" and then use that to select things here?


PS. You store "dma_bits" just for the sake of turning it into a
dma_mask, just store the DMA_BIT_MASK() directly here instead.

Regards,
Bjorn

>  };
>  
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> -- 
> 2.34.1
> 
> 

