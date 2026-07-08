Return-Path: <linux-arm-msm+bounces-117614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PM5kCi1ATmqpJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:18:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6732726388
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:18:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=n1lJiYVk;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117614-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117614-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AA4F30473FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910B039A04A;
	Wed,  8 Jul 2026 12:17:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE54F43E4A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:17:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513079; cv=none; b=paXQJaP7flxf33zi98ovAM2gMpWNYgnIzzq1qgiDjgad8RXWn444bOgbthieFp2zumjxirAB0n49UHMXrU/1PsREFAjdYY1zADvSEaxyumYJqzfBpTGWLv0uQYR3yX58MS4qcVbp1YckNs9pGOP4eARFZZo7MklwCm+OzspmYtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513079; c=relaxed/simple;
	bh=gt1sheQIviRHfIj/UZc8opTwHEugzb9D3v4q5g0GNME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgWzkWZGWd5tWRDwo3hHpNqgM7nAmzwzHvK+ETJKZNgCcxr2uHhFQDk7xs25k1N5wCkvOL24TSZe1VtKQ7wiTRRkYGn9Saa0UFiIjx7zxbNMnhnAMufS0e+xCvx2yXG94spbtmmiNPw+ZiD3U0SjzqAejnuM0zUFxsBgmMlM9LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1lJiYVk; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4720d22c94aso580412f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783513076; x=1784117876; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=;
        b=n1lJiYVkfNgEzxvugVKuV0yrOwRSSL60Uw1HXTySn9I0pM0k/yKAoz6FY61xt9aH+R
         Nah/tucx9fFgg4QKbe3uYLba8p3JXzXo69B/5KVZdUcHRQypb4bsUO+dT0NMK/NrY0vM
         powvW+2IQ+VvQ4dtjfw6AiXi+F0Jq/oFkE2YYrA9wqbXT4JvJT7G19d1KOqmHWBxuFY2
         bA3nk1U/IEmDS8e54HIxJjlUpBcwcc2d0bILPG+2qpY+5pWXGStVv3ar5e+Z/N3AleJM
         hyprtPNl0Pog4xNY1/2WdzWyuoYjy2rlNZ+mv66MBNSxspU35ZNs94MyY4OFcFS6nt3c
         UetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513076; x=1784117876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ulKrnpD8tXDSCpSxwsbsqYNUR8mY4krEK4ViHq+duU=;
        b=ANtwWl6ad9nUnfThj6MMI3lBehtLVCuc+iJU56QiE5yd0wSdlUMpgyivFkHuJKgJ5J
         M62YdRRW1RG6kNpJuZ4Seh6tnIg4Y/nCFUoUOdMbD2FH4FMK+AfPthrS5cISsPAADsiK
         iTFSRumiRaizQgr4ojaTc8Vx2MMslU0uBbZlzEPcq5Q1+LKNfFmyt0tdsQTP6DjAJe7O
         Jk3S4mBfEJnn0T6mSlovBWo2tMV06R4qvPp+F+933ntv1uyBSZAyDXPj4r3bIc1087ja
         yd8ZryaQ+kbl9l1rts/AN6ydgsfuKFngYHjuvaWByc1eAq8cqXdO3L3V3dZOu2lmOXJt
         w56Q==
X-Forwarded-Encrypted: i=1; AHgh+RrThUyCrPl5SZm24ypxQBtDbAAHv/PphzeepWudK5KvWukFQgUvgZfAAw8VQxznRmg5OIsTQXnvvR3F+oQU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+NxSeUfP1Rn9K9d9EXjn2U7TrdSknNDErRHiN6HzraQvCdWC
	7jt9p1mlM4w9xgUacFAIxkphT/fS3BP3iut3q8khwVs47O8XTCbWJeqVerEVqEL3dYY=
X-Gm-Gg: AfdE7clGwizdVCPw/h2bT0LtWp9HtfwBFa1CnwpJ8u/I96Y6vQz/ejRBvb91fRpXpEm
	Zi8+IKFZZZ8DxcyUgYaN5QNBBDU1QBrfQ5kvR2rD7JVcoRlc+mxM8/vBzhpT+iMXbKWQHlgfYed
	Rvo3v7bPlhsxiij5g+x8jsi9Wgto1/BGiR4RMwxtgPzSk+RxzaDD32JCQvIS7Muz5MkuHwpxbyN
	IAnpEVVEGWF/V6czaNSWtP7g1yuP3hPUPYsnD0mcn7C/TUMvOVogbxKwdbgjzKEFEAJUZSRKP7X
	fXshkTGdrgirHswtSMU2w8b53hdT/aKl9NAvR4+A6cAK212hAX7eM3hg8dCaniI45Z/pBh+5Bsx
	tSQWFn8AfH4V8YtrkuzA4PWoR8z/gcnrzGUWVQ1VXqvAOpRwgxNjHtodpojcMOThqTxrgzsFiO0
	XPNnpMzvtElQzeskJr8Btm0Phr
X-Received: by 2002:a05:6000:40cc:b0:47d:ede0:f8ff with SMTP id ffacd0b85a97d-47df073b1a4mr2646073f8f.9.1783513076033;
        Wed, 08 Jul 2026 05:17:56 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:28ff:335b:63e2:fdd2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm45642623f8f.37.2026.07.08.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:17:55 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:17:51 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Andy Gross <agross@codeaurora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v20 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <ak4_vsdef9MJd1Yv@linaro.org>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
 <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-6-56f67da84c05@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com,codeaurora.org,linaro.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-117614-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sashiko.dev:url,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6732726388

On Mon, Jun 29, 2026 at 12:01:08PM +0200, Bartosz Golaszewski wrote:
> Add support for BAM pipe locking. To that end: when starting DMA on an RX
> channel - prepend the existing queue of issued descriptors with an
> additional "dummy" command descriptor with the LOCK bit set. Once the
> transaction is done (no more issued descriptors), issue one more dummy
> descriptor with the UNLOCK bit.
> 
> We *must* wait until the transaction is signalled as done because we
> must not perform any writes into config registers while the engine is
> busy.
> 
> The dummy writes must be issued into a scratchpad register of the client
> so provide a mechanism to communicate the right address via descriptor
> metadata.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

I finally found the time to try this for the qcom_nandc driver on
MDM9607 (with scratchpad_addr = nandc->base_phys + NAND_VERSION). It
seems to work fine and my initial impression is that it does solve the
crashes/corruption when both Linux and the modem access the NAND in
parallel. (Hard to reproduce, needs a bit more testing.) Thanks!

It feels a bit awkward to call dmaengine_desc_attach_metadata() with the
same scratchpad_addr for every descriptor (especially because you store
it globally), but I also don't really have a better idea how to pass the
address for the dummy register.

> ---
>  drivers/dma/qcom/bam_dma.c       | 189 +++++++++++++++++++++++++++++++++++++--
>  include/linux/dma/qcom_bam_dma.h |  14 +++
>  2 files changed, 196 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index f3e713a5259c2c7c24cfdcec094814eb1202971a..f4f258994264a234f60debd3e66e31a6b35d1dc5 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> @@ -919,13 +977,23 @@ static u32 process_channel_irqs(struct bam_device *bdev)
>  			 * push back to front of desc_issued so that
>  			 * it gets restarted by the work queue.
>  			 */
> +
> +			list_del(&async_desc->desc_node);
>  			if (!async_desc->num_desc) {
> -				vchan_cookie_complete(&async_desc->vd);
> +				struct bam_desc_hw *hdesc = async_desc->desc;
> +				u16 flags = le16_to_cpu(hdesc->flags);
> +
> +				if (flags & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK)) {
> +					if (flags & DESC_FLAG_UNLOCK)
> +						bchan->bam_locked = false;
> +					bam_dma_free_lock_desc(&async_desc->vd);
> +				} else {
> +					vchan_cookie_complete(&async_desc->vd);
> +				}
>  			} else {
>  				list_add(&async_desc->vd.node,
>  					 &bchan->vc.desc_issued);
>  			}
> -			list_del(&async_desc->desc_node);
>  		}
>  	}
>  
> [...]
> @@ -1064,9 +1220,23 @@ static void bam_start_dma(struct bam_chan *bchan)
>  
>  	lockdep_assert_held(&bchan->vc.lock);
>  
> +	vd = vchan_next_desc(&bchan->vc);
>  	if (!vd)
>  		return;
>  
> +	/*
> +	 * Wrap the issued work with a LOCK/UNLOCK pair exactly once, at the
> +	 * start of a fresh sequence and only when there is real work to lock
> +	 * around. On a re-entry after a full FIFO, we see the BAM is locked
> +	 * and must not add another pair we simply continue loading the
> +	 * remainder of the same locked sequence.
> +	 */
> +	if (!bchan->bam_locked) {
> +		ret = bam_setup_pipe_lock(bchan);
> +		if (ret == 0 && bchan->bam_locked)
> +			vd = vchan_next_desc(&bchan->vc);
> +	}

I *suspect* though that Sashiko is right about the new race condition
here if new descriptors are queued while the hardware is busy processing
a locked sequence.

https://sashiko.dev/#/patchset/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05%40oss.qualcomm.com?part=6

Any idea how to fix this?

Thanks,
Stephan

