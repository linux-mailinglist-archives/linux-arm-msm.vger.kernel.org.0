Return-Path: <linux-arm-msm+bounces-64047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FDEAFCC07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 15:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23BCC189FFDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4889C2E11BB;
	Tue,  8 Jul 2025 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi8tIPMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D02DE6EA;
	Tue,  8 Jul 2025 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751981182; cv=none; b=Upcc532mdIldfNkIy6pOR8CZnVc6ztfSu0kXPhDTXWKNbcP0u9qKpIc9ZTvZDydk58Q8vHFvOTcTiNYgEdaWvh6fii/r5x4TdUDTdPDhqt08AZuAQSu+M2Uj+8YKYYCGfXnpmP2sm9GMpi03v7ahKIWHhWBACf+gbaxjgfcJUzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751981182; c=relaxed/simple;
	bh=YMY6Nzud8gSG0GbUeuhST8FYBSDLtwSbG6Ipq/iKfek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqDF8BCuhQ5lt4K6gFheENjt20Yz9Eobp2Ti+K9fg2vduIdwKjA5Iwgy2U6hdN3dQjwQ8MNp7O1WjHpvqf+4YNFY0Cxf2C3muHmjiEjDg7ldc/rrvM8dZbsPiwj/jOe3LjU8Bjtc6a+ZNIaKFEPaldzUQW0WbgzNmS/zWd6zyvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi8tIPMp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F12C4CEF7;
	Tue,  8 Jul 2025 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751981182;
	bh=YMY6Nzud8gSG0GbUeuhST8FYBSDLtwSbG6Ipq/iKfek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wi8tIPMprO6vU9o3GzE/HX9J8RpHzCqjh5YN2ym+oE7jOfQVfQgJ0zzS2YGVp2hhO
	 GdteRykAuKgunI+wj5J35E2NyQ64mXDya+1G2j4Ia5HGf7tyKbApMRUTyWf82TgzQ7
	 T2RM9l4pEFS7MlJBQSwsdMUM5dCf1XaQZTvB6p+aPVpPcFhgjEl0R2BZ0zPnFBXiGD
	 QUMaMq4Y74ygoKetWQcgrfMPq94u7chSHfrRZ6cIoszV+tMSYDICBkMzUw9DoxAWxh
	 LY7eFMsgwBZeXyQUmKDc/awxRCNwMEOjtGgxK3+mMRa6YV7O8k8p+eCdBDh63P0HF6
	 SbjZX3qUi9QlQ==
Date: Tue, 8 Jul 2025 18:56:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <quic_yabdulra@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, jeff.hugo@oss.qualcomm.com, 
	quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
Message-ID: <ggswqscpu54klfvvevvcswvija4m7l667aov4qu65om5i5adhy@nbmg7dxed56g>
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
 <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
 <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <209dec58-c86c-494d-a6e9-fb0ab33b03c2@quicinc.com>

On Wed, Jul 02, 2025 at 04:06:55PM GMT, Youssef Samir wrote:
> 
> 
> On 6/17/2025 11:24 AM, Manivannan Sadhasivam wrote:
> > On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
> >> When a remote device sends a completion event to the host, it contains a
> >> pointer to the consumed TRE. The host uses this pointer to process all of
> >> the TREs between it and the host's local copy of the ring's read pointer.
> >> This works when processing completion for chained transactions, but can
> >> lead to nasty results if the device sends an event for a single-element
> >> transaction with a read pointer that is multiple elements ahead of the
> >> host's read pointer.
> >>
> > 
> > How can this happen? I cannot relate this with the scenario mentioned below.
> > 
> >> For instance, if the host accesses an event ring while the device is
> >> updating it, the pointer inside of the event might still point to an old
> >> TRE.
> > 
> > I cannot interpret this, sorry. The host is supposed to access the ring elements
> > till the RP. Even if the device updates the RP while host is processing the TREs,
> > it should not cause any issues for the host which only sees the used ring
> > elements.
> > 
> > Maybe I'm missing something?
> 
> Hi Mani,
> 
> This is related to the behavior that 'commit 6f18d174b73d ("bus: mhi: ep: Update read pointer only after buffer is written")'
> aimed to fix from the endpoint. The scenario I observed with a device using drivers/bus/mhi/ep/
> involved the device sending an MSI to host for an event that hasn't had its data
> completely updated. the event could be pointing to a TRE that is not local_rp + 1.
> As you mentioned, the host will process all the TREs until the event's rp,
> which allows it to access data that were freed or hasn't been written to yet.
> 

So you are saying that mhi_ep_ring_add_element() didn't update the ring pointer
before triggering MSI? If that's the case, we should add a barrier to make sure
that the RP is updated before raising MSI. Though, I thought that the implicit
barrier offered by the mutex_unlock() would be enough to make sure that the RP
is updated before triggering MSI.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

