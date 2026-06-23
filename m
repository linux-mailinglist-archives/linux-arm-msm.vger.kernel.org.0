Return-Path: <linux-arm-msm+bounces-114118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T+z9F0lLOmrs5QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:00:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 112FC6B582C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:00:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CnYDZE5v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114118-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114118-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8487E30C8D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0DF3CF1E4;
	Tue, 23 Jun 2026 08:54:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5BA3CEB8F;
	Tue, 23 Jun 2026 08:54:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204874; cv=none; b=mr55v0IxkMD9qwYbAoq8AJdvGPGuNIrvTHUaRN+oSq8F8XfGDS91TkK0snFIyLUJreUipXuJUYfENnfWS0HczZhBNYu/TEa9Aff7176/9FNHNnTZmaA/jE5HwESRDsYdbORrYi8z8COvmhhWEXLN+lGPTKAptAuI/DD2fr8fvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204874; c=relaxed/simple;
	bh=oGWohpozDNj5HcCqKiRi2M0XxBKU2rSmNKqQTb6qDBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7TTHnuEQQkBUzk6/lUOdhnXhGUK/S+s/C0T9j9lQYqLpzbpHkEkJUHju97ZeWTLwZlFk7cu467QrQs0T4uZtnY/YAgHvicYss7YaAlRw5Hi2ISneZ8a8t4W3EHmytQu0S4H0Pv3o/P4e50+2E+o7GXS/R26zXKWL4QYoGBw8F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnYDZE5v; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22F41F000E9;
	Tue, 23 Jun 2026 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204872;
	bh=j66E0sANIJ72GqjGOIoBRp/CCYURSlspKpay3Stku4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CnYDZE5vJu4AiYcc2fs4m0IhdA/NeTkA1nU7SfIuqY1t/83vJhs7Ne34KNwNVENq5
	 dEYWzXvyQxtscdFeHfTrVRfpotek9NWcrEDXumD2P5tZISDFQYceb1LvPY8Yg6fnmE
	 LUcNKxC//BU6MH6xD7fqPjyNwFt0sHEFwl0rTq/rADN0Eeb2Irheka2SlOiqLf0JR4
	 4FkXpvIPygP0SnQxPpaKN11rs/SPZ+/6plTXG8MNa+dmiikRH6TcuVaPim1fMGi9Oz
	 tYqIyQrexMvv3re2wNJ0gZAMmM45PboWckuX1oCBiqRLPLMGQ03NUH6ZnlLmb+zqFH
	 7ji96uqAtPsng==
Date: Tue, 23 Jun 2026 10:54:26 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] bus: mhi: ep: Add mhi_ep_queue_buf() API for raw
 buffer queuing
Message-ID: <2u2w73i6v53rdjkmufolowh55rd5ya3fypif4geed4xtnlzyq6@zqjjeugleht2>
References: <20260622-loopback_mhi-v4-0-782b3a0f2eef@oss.qualcomm.com>
 <20260622-loopback_mhi-v4-2-782b3a0f2eef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622-loopback_mhi-v4-2-782b3a0f2eef@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114118-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sumit.kumar@oss.qualcomm.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zqjjeugleht2:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 112FC6B582C

On Mon, Jun 22, 2026 at 10:39:16AM +0530, Sumit Kumar wrote:
> Some MHI endpoint clients do not use socket buffers and need a way to queue
> raw buffers for DL transfers. Add mhi_ep_queue_buf() to support this use
> case.
> 
> Refactor mhi_ep_queue_skb() to delegate to a new internal mhi_ep_queue()
> helper shared by both APIs, and rename mhi_ep_skb_completion() to
> mhi_ep_buf_completion() to reflect its broader use.
> 
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 29 ++++++++++++++++++++---------
>  include/linux/mhi_ep.h    | 15 +++++++++++++++
>  2 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..d44e1e54cfb4404b6589aab372e687db7492d3c3 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -516,7 +516,7 @@ static int mhi_ep_process_ch_ring(struct mhi_ep_ring *ring)
>  	return 0;
>  }
>  
> -static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
> +static void mhi_ep_buf_completion(struct mhi_ep_buf_info *buf_info)
>  {
>  	struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -544,22 +544,22 @@ static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
>  
>  	mhi_ep_ring_inc_index(ring);
>  }
> -
>  /* TODO: Handle partially formed TDs */
> -int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> +static int mhi_ep_queue(struct mhi_ep_device *mhi_dev, void *buf, size_t len,
> +			void *cb_buf)
>  {
>  	struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
>  	struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
>  	struct device *dev = &mhi_chan->mhi_dev->dev;
>  	struct mhi_ep_buf_info buf_info = {};
>  	struct mhi_ring_element *el;
> -	u32 buf_left, read_offset;
> +	size_t buf_left, read_offset;
>  	struct mhi_ep_ring *ring;
>  	size_t tr_len;
>  	u32 tre_len;
>  	int ret;
>  
> -	buf_left = skb->len;
> +	buf_left = len;
>  	ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
>  
>  	mutex_lock(&mhi_chan->lock);
> @@ -582,13 +582,13 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  		tre_len = MHI_TRE_DATA_GET_LEN(el);
>  
>  		tr_len = min(buf_left, tre_len);
> -		read_offset = skb->len - buf_left;
> +		read_offset = len - buf_left;
>  
> -		buf_info.dev_addr = skb->data + read_offset;
> +		buf_info.dev_addr = buf + read_offset;
>  		buf_info.host_addr = MHI_TRE_DATA_GET_PTR(el);
>  		buf_info.size = tr_len;
> -		buf_info.cb = mhi_ep_skb_completion;
> -		buf_info.cb_buf = skb;
> +		buf_info.cb = mhi_ep_buf_completion;
> +		buf_info.cb_buf = cb_buf;
>  		buf_info.mhi_dev = mhi_dev;
>  
>  		/*
> @@ -627,8 +627,19 @@ int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
>  
>  	return ret;
>  }
> +
> +int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb)
> +{
> +	return mhi_ep_queue(mhi_dev, skb->data, skb->len, skb);
> +}
>  EXPORT_SYMBOL_GPL(mhi_ep_queue_skb);
>  
> +int mhi_ep_queue_buf(struct mhi_ep_device *mhi_dev, void *buf, size_t len)
> +{
> +	return mhi_ep_queue(mhi_dev, buf, len, buf);
> +}
> +EXPORT_SYMBOL_GPL(mhi_ep_queue_buf);
> +
>  static int mhi_ep_cache_host_cfg(struct mhi_ep_cntrl *mhi_cntrl)
>  {
>  	size_t cmd_ctx_host_size, ch_ctx_host_size, ev_ctx_host_size;
> diff --git a/include/linux/mhi_ep.h b/include/linux/mhi_ep.h
> index 7b40fc8cbe77ab8419d167e89264b69a817b9fb1..59f796e56207aaf8be09edc9ba4d1f59b665581f 100644
> --- a/include/linux/mhi_ep.h
> +++ b/include/linux/mhi_ep.h
> @@ -302,4 +302,19 @@ bool mhi_ep_queue_is_empty(struct mhi_ep_device *mhi_dev, enum dma_data_directio
>   */
>  int mhi_ep_queue_skb(struct mhi_ep_device *mhi_dev, struct sk_buff *skb);
>  
> +/**
> + * mhi_ep_queue_buf - Send buffer to host over MHI Endpoint

You are not really 'sending' the buffer, but just 'transferring the buffer
contents'.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

