Return-Path: <linux-arm-msm+bounces-82370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B95CC6AC70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6C28B4EA855
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340C630B519;
	Tue, 18 Nov 2025 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGZ5Ruq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0740E3570AB;
	Tue, 18 Nov 2025 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484773; cv=none; b=X3jmv28cfeuFAiNS7C3TKs/xqnVuTBUJvsukX6EusAFb2Ip6LvBlwbdrtGhkb4AjHBE2xwAT0WXEXUnEQMfQlu4Y1NpIpOIhWmWRL7ndFP6WdLm0nsj5LbNxtXlUXWuVTVXJ31GvnSkgcJ50tqAXPm6ZZ78hlAqoeoQRlOuNrso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484773; c=relaxed/simple;
	bh=xAm1zDJBYs1yREAbrbFBldFfX+BbQfw8t7SPPJ7/ewk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2fi06ZzQvdpUJBpRKqwnPO/Ud/LSmnFp+tkP07J/gk9RMg0jvlB3uARUS12487seWHjZdk+6ySQdBCMTPKwY8llR+wUTZeSKFnjdo28sLOz4RrLhaYXp7ABekAxUJHEi82j+VaeQOnSpGEMCmVCYgJImjLzs58dyURS6oPnrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGZ5Ruq/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73C9C19424;
	Tue, 18 Nov 2025 16:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484772;
	bh=xAm1zDJBYs1yREAbrbFBldFfX+BbQfw8t7SPPJ7/ewk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aGZ5Ruq/6BzkpjObLltIN7lS/GhlyHQNI4mUFMRcbV7s/nExDNuVWP38N67JEIhpq
	 s1WB8jz0AQxmShdmLxKTDCTb2W+HlAP8UKRqDtbK/H53O13TcW08XoMqZjRw1FFRw9
	 RQ9/3ngSQKK8naHY+OKGdI2bLyDQOs87WMzAp9dnhLS0WWIOEzWfJy7vMsvf2A15wB
	 9bNQdkg6FqZMNt0bsdCQJniE03AKnvu7cez5Y0V3+09QgxqesrfWkf37nPZSpcoqFh
	 GZtyrjpseJNNZgd/Xacv85THBWAip0xBNC0UdjRvppf5JcDHX8VT8NNKw3deUXmKER
	 x3yzBCtZqFT6g==
Date: Tue, 18 Nov 2025 10:57:39 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v3 4/4] misc: fastrpc: Update dma_bits for CDSP support
 on Kaanapali SoC
Message-ID: <3qgrwpi3vl3bumd2zxmjxvwgdewuwwsj3fymljkf2etjedleup@xsrnpuuv66ax>
References: <20251114084142.3386682-1-kumari.pallavi@oss.qualcomm.com>
 <20251114084142.3386682-5-kumari.pallavi@oss.qualcomm.com>
 <3gld6djjzfwu6rj47tz6gdwdpmh3hjexce5y6crqjus7ourgxf@puxrcpvijitl>
 <2404a7a5-f4ac-4e62-b4b7-df0494d71150@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2404a7a5-f4ac-4e62-b4b7-df0494d71150@oss.qualcomm.com>

On Mon, Nov 17, 2025 at 02:42:23PM +0530, Kumari Pallavi wrote:
> 
> 
> On 11/14/2025 9:30 PM, Bjorn Andersson wrote:
> > On Fri, Nov 14, 2025 at 02:11:42PM +0530, Kumari Pallavi wrote:
> > > DSP currently supports 32-bit IOVA (32-bit PA + 4-bit SID) for
> > > both Q6 and user DMA (uDMA) access. This is being upgraded to
> > > 34-bit PA + 4-bit SID due to a hardware revision in CDSP for
> > > Kaanapali SoC, which expands the DMA addressable range.
> > > Update DMA bits configuration in the driver to support CDSP on
> > > Kaanapali SoC. Set the default `dma_bits` to 32-bit and update
> > > it to 34-bit based on CDSP and OF matching on the fastrpc node.
> > > 
> > > Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> > > ---
> > >   drivers/misc/fastrpc.c | 15 +++++++++++++--
> > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index bcf3c7f8d3e9..2eb8d37cd9b4 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -267,6 +267,8 @@ struct fastrpc_session_ctx {
> > >   struct fastrpc_soc_data {
> > >   	u32 sid_pos;
> > > +	u32 cdsp_dma_bits;
> > > +	u32 dsp_default_dma_bits;
> > >   };
> > >   struct fastrpc_channel_ctx {
> > > @@ -2186,6 +2188,7 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   	int i, sessions = 0;
> > >   	unsigned long flags;
> > >   	int rc;
> > > +	u32 dma_bits;
> > >   	cctx = dev_get_drvdata(dev->parent);
> > >   	if (!cctx)
> > > @@ -2199,12 +2202,16 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   		spin_unlock_irqrestore(&cctx->lock, flags);
> > >   		return -ENOSPC;
> > >   	}
> > > +	dma_bits = cctx->soc_data->dsp_default_dma_bits;
> > >   	sess = &cctx->session[cctx->sesscount++];
> > >   	sess->used = false;
> > >   	sess->valid = true;
> > >   	sess->dev = dev;
> > >   	dev_set_drvdata(dev, sess);
> > > +	if (cctx->domain_id == CDSP_DOMAIN_ID)
> > > +		dma_bits = cctx->soc_data->cdsp_dma_bits;
> > > +
> > >   	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
> > >   		dev_info(dev, "FastRPC Session ID not specified in DT\n");
> > > @@ -2219,9 +2226,9 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
> > >   		}
> > >   	}
> > >   	spin_unlock_irqrestore(&cctx->lock, flags);
> > > -	rc = dma_set_mask(dev, DMA_BIT_MASK(32));
> > > +	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
> > >   	if (rc) {
> > > -		dev_err(dev, "32-bit DMA enable failed\n");
> > > +		dev_err(dev, "%u-bit DMA enable failed\n", dma_bits);
> > >   		return rc;
> > >   	}
> > > @@ -2308,10 +2315,14 @@ static int fastrpc_get_domain_id(const char *domain)
> > >   static const struct fastrpc_soc_data kaanapali_soc_data = {
> > >   	.sid_pos = 56,
> > > +	.cdsp_dma_bits = 34,
> > > +	.dsp_default_dma_bits = 32,
> > >   };
> > >   static const struct fastrpc_soc_data default_soc_data = {
> > >   	.sid_pos = 32,
> > > +	.cdsp_dma_bits = 32,
> > > +	.dsp_default_dma_bits = 32,
> > 
> > So, "dsp_default_dma_bits" specified "what is the dma_mask for the
> > non-CDSP fastrpc instances"? I don't find "dsp_default" to naturally
> > mean "not the cdsp".
> > 
> > 
> > Wouldn't it be better to introduce two different compatibles, one being
> > the "qcom,kaanapali-fastrpc" and one being the
> > "qcom,kaanapali-cdsp-fastrpc" and then use that to select things here?
> > 
> 
> Thank you for the suggestion. In this case, sid_pos is common across all
> DSP domains on kaanapali Soc. Splitting into two compatibles would lead to
> duplication of these shared property in the DT schema and driver logic.
> The only difference here is the DMA address width for CDSP (34-bit) versus
> other DSPs (32-bit).
> 
> To address the concern about naming, I can provide:
> 
> dma_bits_cdsp → clearly indicates this applies to the CDSP domain.
> dma_bits_non_cdsp (or dma_bits_other_dsp) → for ADSP and other DSP domains.
> Please let me know if this aligns with your suggestion ?
> 

This naming is much better.

I'm not entirely sure about the compatibility part though. The Kaanapali
CSDP and Kaanapali ADSP doesn't have the same DMA address width, so are
they then compatible/the same?

The fact that the two compatibles would refer to something with the same
sid_pos isn't a concern to me. De-duplicating a single constant at the
expense of more complicated logic, that is a concern however.

> > 
> > PS. You store "dma_bits" just for the sake of turning it into a
> > dma_mask, just store the DMA_BIT_MASK() directly here instead.
> > 
> 
> The current approach of assigning a value to cdsp_dma_mask allows for
> adaptable logging behavior, making it easier to trace.
> 

I presume you mean it allows you to do "%u-bit DMA enable failed"?

There are only two options here (32 and 34), and the only reason why
it's not directly obvious which case you're looking at is because you're
"dynamically" deriving that number from something else.

Regards,
Bjorn

> 
> > Regards,
> > Bjorn
> > 
> > >   };
> > >   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > > -- 
> > > 2.34.1
> > > 
> > > 
> 
> Thanks,
> Pallavi

