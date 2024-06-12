Return-Path: <linux-arm-msm+bounces-22367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B7A9049F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676AC1F244EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 04:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CBC208D4;
	Wed, 12 Jun 2024 04:27:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1061B10A0E;
	Wed, 12 Jun 2024 04:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718166428; cv=none; b=g/VQgSCkXzZoBuDy74WGaDnS58lB5BO5dFnfZd53zCRNwCHN9mYS1TqhCklmb49IPOsM/vR/nLXSmzqPOqlXOT3qnlC0xq3ZbD0mt4zp39U/prhKbJL7v0wCt6yMVu/WEwCLfJ/wa9DxsBb6x+Tj/JLIQGPpoOH8nUZin0i50OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718166428; c=relaxed/simple;
	bh=MBJunRKKZCYSzLIojD7Nl18fcwI5Ptviv8JR3p0uV4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/v22icvk1I4brtT37Zc816A0p/tDsfExsImhRHDDhoMxpLic09NN0HzJ93PLwuZGFmrdbHhZ/dGhQkoPH92X3RgIoy/Bh2VtCSvHU0oQTYKsEjaOPZXEB2GCEIHxY6bsxCXsDte7kzJ/9CNp75P8ECpeFQejnYBKP0Os5CUe6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FFAC32786;
	Wed, 12 Jun 2024 04:27:03 +0000 (UTC)
Date: Wed, 12 Jun 2024 09:56:55 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>, quic_jhugo@quicinc.com,
	Qiang Yu <quic_qianyu@quicinc.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"mhi@lists.linux.dev" <mhi@lists.linux.dev>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: Re: [PATCH v1 2/2] net: wwan: Fix SDX72 ping failure issue
Message-ID: <20240612042655.GA2645@thinkpad>
References: <20240607100309.453122-1-slark_xiao@163.com>
 <30d71968-d32d-4121-b221-d95a4cdfedb8@gmail.com>
 <97a4347.18d5.19004f07932.Coremail.slark_xiao@163.com>
 <c292fcdc-4e5b-4e6a-9317-e293e2b6b74e@gmail.com>
 <320ba7ec.38c9.1900a687ddc.Coremail.slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <320ba7ec.38c9.1900a687ddc.Coremail.slark_xiao@163.com>

On Wed, Jun 12, 2024 at 11:05:38AM +0800, Slark Xiao wrote:
> 
> At 2024-06-12 06:46:33, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
> >On 11.06.2024 04:36, Slark Xiao wrote:
> >> +More maintainer to this second patch list.
> >> 
> >> At 2024-06-08 06:28:48, "Sergey Ryazanov" <ryazanov.s.a@gmail.com> wrote:
> >>> Hello Slark,
> >>>
> >>> without the first patch it is close to impossible to understand this
> >>> one. Next time please send such tightly connected patches to both
> >>> mailing lists.
> >>>
> >> Sorry for this mistake since it's my first commit about committing code to 2
> >> difference area: mhi and mbim. Both the maintainers are difference.
> >> In case a new version commit would be created, I would like to ask if
> >> should I add both side maintainers on these 2 patches ?
> >
> >No worries. We finally got both sides of the puzzle. BTW, looks like the 
> >first patch still lacks Linux netdev mailing list in the CC.
> >
> >Usually maintainers are responsible for applying patches to their 
> >dedicated repositories (trees), and then eventually for sending them in 
> >batch to the main tree. So, if a work consists of two patches, it is 
> >better to apply them together to one of the trees. Otherwise, it can 
> >cause a build failure in one tree due to lack of required changes that 
> >have been applied to other. Sometimes contributors even specify a 
> >preferred tree in a cover letter. However, it is still up to maintainers 
> >to make a decision which tree is better when a work changes several 
> >subsystems.
> >
> 
> Thanks for your detailed explanation. 
> Since this change was modified mainly on mhi side, I prefer to commit it to
>  mhi side. 
> @loic @mani, what's your opinion?
> 

There is a build dependency with the MHI patch. So I'll just take both patches
through MHI tree once I get an ACK from WWAN maintainers.

> >>> On 07.06.2024 13:03, Slark Xiao wrote:
> >>>> For SDX72 MBIM device, it starts data mux id from 112 instead of 0.
> >>>> This would lead to device can't ping outside successfully.
> >>>> Also MBIM side would report "bad packet session (112)".
> >>>> So we add a link id default value for these SDX72 products which
> >>>> works in MBIM mode.
> >>>>
> >>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> >>>
> >>> Since it a but fix, it needs a 'Fixes:' tag.
> >>>
> >> Actually, I thought it's a fix for common SDX72 product. But now I think
> >> it should be only meet for my SDX72 MBIM product. Previous commit
> >> has not been applied. So there is no commit id for "Fixes".
> >> But I think I shall include that patch in V2 version.
> >> Please ref:
> >> https://lore.kernel.org/lkml/20240520070633.308913-1-slark_xiao@163.com/
> >
> >There are nothing to fix yet. Great. Then you can resend the Foxconn 
> >SDX72 introduction work as a series that also includes these mux id 
> >changes. Just rename this specific patch to something less terrifying. 
> >Mean, remove the "Fix" word from the subject, please.
> >
> >Looks like "net: wwan: mhi: make default data link id configurable" 
> >subject also summarize the reason of the change.
> >
> 
> Currently I don't know if my previous commit which has been reviewed still
> be effective. Since this link_id changes only works for MBIM mode of SDX72.
> If keeps the commit of [1], then I will update this patch with v2 version which just update
> the subject . If not, then this SDX72 series would have 3 patches: [1] + first patch
> + second patch[v2](or 2 patches: combine [1] with first patch + second patch[v2]).
> Please let me know which solution would be better.
> 

Just send v2 of both patches. There are some comments in the MHI patch as well.

> Thanks.
> >>>> ---
> >>>>    drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> >>>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> >>>> index 3f72ae943b29..4ca5c845394b 100644
> >>>> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> >>>> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> >>>> @@ -618,7 +618,8 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
> >>>>    	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
> >>>>    
> >>>>    	/* Register wwan link ops with MHI controller representing WWAN instance */
> >>>> -	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
> >>>> +	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim,
> >>>> +		mhi_dev->mhi_cntrl->link_id ? mhi_dev->mhi_cntrl->link_id : 0);
> >>>
> >>> Is it possible to drop the ternary operator and pass the link_id directly?
> >>>

Yeah, just use link_id directly as it will be 0 by default.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

