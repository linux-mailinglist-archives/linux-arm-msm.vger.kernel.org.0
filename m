Return-Path: <linux-arm-msm+bounces-55536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0689A9BDE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C165920654
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 05:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ECA22A4CA;
	Fri, 25 Apr 2025 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AtntRqN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4822A1C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745559436; cv=none; b=GXzgBUL0cDl/BBj4OA9DiaJyu+LB4TRLuca6ApvzppJTqjRGjM4T5T6aCDUJEz9SdMY6Xeo9Bp+UA6wYVCtyhBna/shp5JCYC3yF/tT/szOAFFWVIFzBhNCuc5POzS4DjsPzs01TzpU3oOmGFiv4rdc/dQOpc0iT1sqaZF3pDoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745559436; c=relaxed/simple;
	bh=9oNTXG3PnUqLy2ZCkPQnR80hdVQIyQFuYc7MoYL2GNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnt+It6rgG92uOCYUHj0agsqzlGHzc02izquWdi9m9ggzhY+hEDGGp9SSLG0NXDlwJeC9IqNQsJ7mtqWakKaFwliU1kk8//2y2Mm+apv4f5DEaxWYvWI40bW5OEvsRm4GmZE2FzTjlQovYCRimmKWhivUNpg1Rqb4P9B8cMiYjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AtntRqN8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7376dd56f60so1355724b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745559433; x=1746164233; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=;
        b=AtntRqN8v8y7EJETrxCEeyxAQmO9oTsJycOwj6JghIiiwcF01Rx6e0JFcz/WfxVuRn
         E6Bc9QkCWMtg3CKMI0aTxSGR+8IBPNOcATCm3EceSlnyuDWXrU60Dg1pUWVL4WfRtYOX
         KAqIaVaBf1KEsedlfmBGihW2eh7EaigGAXhkhzIMsqHBSeyoU5lxw4wzmVmznYa0H53M
         pr1Sq6ZRPIBjxbKOx4SET6ZzmdM+4pGPlOQR9Q8u1ieXfnWAQA/3bwFp/xm7cokQ/4mR
         5/d/gxmsQ2vbfN2VNCnQs2mn9OrvqalgSgXoCQXkjksy5z3b8CCkXZVnNQUM5HzABlbL
         cnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745559433; x=1746164233;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8A3cjy377Xq8M/J5lIds8iTR3Oz7LnaNIlKAmosVk0=;
        b=qDu1p4+64nIqN7o5eX1e1THuA+KKwitelZEMLOVotBLu0Quk/gqW4KJ63w9rAZ00Ic
         v/iXXY2quUkg3J9BipwFjRv4GXkUl/3SXfB5MBwfAhuStT1wgJGqgkr961YEUylMD0gr
         eQ/adbyglZHBma/Jj1uE/g1abFUi31itZdc5iUrCo0wyRqQg+EDtHIf0+x//5PIdaZI6
         KJ4Z2CpwBRLFQsj890xQrI2GWEZFj5dY//8XmvaLc+/O0uVgbJ42zZal/RzSKQlYXGMQ
         fJEiAv83YraMxNanyQcPduni/GcGvx80SpmN6+ShPCUzIs4mgyUmV+pxp5yLy1huAj/B
         XVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcHsqh6r67UBmpEdt5pS4P0aKSp80Clk29Mw2UH9WMeIzURyMv9nZ/F+4KEc+BGL/IA+uDXh8Pz56j0bQF@vger.kernel.org
X-Gm-Message-State: AOJu0YwFxHcPGKEN5MxfiGtKqdupdXVEE5I20fY4C2sEQLsJ+MqdlA3K
	qm+S6xY5Cz+1yOnFAOhhrkgxiyT7SSBJne2JZTs/k7yHR/5nByAKH3ihhbnDPQ==
X-Gm-Gg: ASbGnctK0p+AOfgF6mh9UP8Z5TPEkGj1yRpqMOX9utEUTJ7Q1mj6msbc1gkt07X2uxu
	UknXoQZyt9I1u3CgcWT70zsYBEqljiunu1wTiGnOlfn/jvNnKI3kc4XFyBRx9B4rhHU5tzQRX6W
	eBa5gD3PMLCZs8Cnj6yJMKgNqSYFJmuRT40I1OiCMI32kMjRrRCHH0f7meABfPPehKRvQKg0t77
	bbvTQqHPX34nqhROWHx8dms5/DUR+Y1E3Ipu3OwomWwrExRwZT27ey9K75gsgM4EF0ZI1jtXGoH
	7yE0TuxBClHFQZoOFFk36sc3ylB8UwvBAl7HmRdVKubGxVDFmYk=
X-Google-Smtp-Source: AGHT+IGcoqrCxQ/PlAvuIQ3GNQhMlOAxNWlv8vOGFLV8g7pv3hl+e+Uba/O0SiwZcqMn3LRnx3eY/Q==
X-Received: by 2002:a05:6a00:b4a:b0:73e:10ea:b1e9 with SMTP id d2e1a72fcca58-73fd6defd3emr1305557b3a.6.1745559433403;
        Thu, 24 Apr 2025 22:37:13 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25accfc9sm2436701b3a.176.2025.04.24.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 22:37:12 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:07:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, 
	ath11k@lists.infradead.org, jjohnson@kernel.org, quic_bqiang@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
Message-ID: <qhoirbfx5p23542hhi3kk7ftwtptsnoxgtewddbh322d74rgb2@xbupxi3ix7sx>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <pgr6u3onrlf4mvldqn7cxlqkh3krduv542jqgjcy5c535ys6hm@dujbvax4b56s>
 <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07cc4ee2-4a13-495c-bc4d-8837d6b54414@oss.qualcomm.com>

+ ath11k list, Jeff and Baochen (for question regarding the use of reserved
memory for allocating the MHI data structures in host)

On Tue, Apr 08, 2025 at 08:56:43AM -0600, Jeff Hugo wrote:
> On 4/8/2025 1:01 AM, Manivannan Sadhasivam wrote:
> > On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
> > > From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > > 
> > > MHI control configurations such as channel context, event context, command
> > > context and rings, are currently allocated individually. During MHI
> > > initialization MHI bus driver needs to configure the address space in
> > > which this control configuration resides. Since different component of the
> > > config is being allocated separately, only logical solution is to give the
> > > entire RAM address space, as they could be anywhere.
> > > 
> > 
> > This is fine...
> 
> We tripped over this when experimenting with an automotive market product.
> The FW for that product had a rather strict interpretation of the spec,
> which we confirmed with the spec owner.
> 
> In the specific FW implementation, the device maps the entire MHI space of
> shared structures in a single ATU entry. The device cannot map an entire
> 64-bit address space, and it expects all of the shared structures in a
> single compact range.
> 
> This applies to the control structures, not the data buffers per the device
> implementation.
> 
> This restriction seems backed by the spec.  I can't find a reason why the
> device is invalid, if limited.  I don't think this should break anything,
> but more on that below.
> 

Yes, atleast I have heard about that limitation before.

> > 
> > > As per MHI specification the MHI control configuration address space should
> > > not be more them 4GB.
> > > 
> > 
> > Where exactly this limitation is specified in the spec? The spec supports full
> > 64 bit address space for the MHI control/data structures. But due to the device
> > DMA limitations, MHI controller drivers often use 32 bit address space. But
> > that's not a spec limitation.
> 
> Its not the clearest thing, sadly.
> 
> Document 80-NF223-11 Rev AB "MHI spec v1.2" Section 6.2 "MHI Registers"
> table 6-19 (page 106) -
> 
> Describing MHICTRLLIMIT: "The most significant 32 bits of MHICTRLBASE and
> MHICTRLLIMIT registers must be equal."
> 
> This means we have a 4GB range (32-bit) to play with in a 64-bit address
> space.  If the upper 32-bits of the 64-bit address for both the base and the
> limit must be the same, then the range of addresses from the base to the
> limit can only vary the lower 32-bits.
> 
> Invalid:
> BASE: 0x0
> LIMIT: 0xffffffff_ffffffff
> 
> Valid:
> BASE: 0x0f_00000000
> LIMIT: 0x0f_ffffffff
> 

Ah. Didn't spot this before, thanks for explaining!

> > > Since the current implementation is in violation of MHI specification.
> 
> For example mhi_init_dev_ctxt()
> 
> We allocate the chan_ctxt with dma_alloc_coherent() as an individual
> allocation.  In the case of AIC100, the device can access the full 64-bit
> address space, but the DMA engine is limited to a 32-bit transfer size.  The
> chan_ctxt probably won't be larger than 4GB, so the size is rather
> irrelevant.  Can be allocated anywhere.  Lets say that it gets put in the
> lower 32-bit address space - 0x0_XXXXXXXX
> 
> Then a little bit later we allocate er_ctxt with a different
> dma_alloc_coherent() instance.  Being a unique allocation, it is not tied to
> the chan_ctxt and can exist anywhere.  Lets assume that it gets put
> somewhere in the non-lower 32-bits - 0x1000_XXXXXXXX
> 
> Now we have a problem because we cannot describe a single range covering
> both of these allocations via MHICTRLBASE/MHICTRLLIMIT where the upper
> 32-bits of both registers is the same.
> 

Yes, I get it. I do not have issues in allocating all the structures in one go.
But the problem is with MHICTRL_BASE/LIMIT. More below.

> > > Allocate a single giant DMA buffer for MHI control configurations and
> > > limit the configuration address space to that buffer.
> > > 
> > 
> > I don't think this could work for all devices. For instance, some ath11k devices
> > use a fixed reserved region in host address space for MHICTRL/BASE.
> 
> Why would we be unable to allocate all of the control structures in a single
> allocation out of that reserved region?  Is it larger than 4GB in size?
> 

I was confused by the fact that ath11k driver adds an offset of 0x1000000 to the
reserved region for the iova_start:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/ath/ath11k/mhi.c?h=v6.15-rc3#n331

So this means the firmware will only map the memory from reserved + 0x1000000
for MHI data structures. But even with current implementation, the MHI stack
doesn't know anything about the offset, because it just relies on
dma_alloc_coherent() API which will only honor the reserved region pointed by
'memory' property in the node (without the offset).

So I'm not sure how the firmware makes sure that the data structures lives
within the offset region. This is more of a question to ath11k folks.

But your series is not going to make it any worse. Sorry about the confusion.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

