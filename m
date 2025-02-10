Return-Path: <linux-arm-msm+bounces-47391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F853A2E80E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4603A75B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF39C1C3C0D;
	Mon, 10 Feb 2025 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RagU2v1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B171ADC9B;
	Mon, 10 Feb 2025 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739180599; cv=none; b=CFpIoyGWnEGxh8t5nUs5h4ke6DNelMCAg8fCJvJB9l4im2Q6TbTFNhM0nTiycZ0J1GB0jWoUnIWgJpL80o/PSFuWYwuppA4TcIVsmhmO0QUfjICInMVwTNZQh+mIoDIlAgMG69VTYzaN7fyp+3hwYV041Ay8XB0LFIuMRMXpjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739180599; c=relaxed/simple;
	bh=EWO8DBm96kpCkbfP+4QwRo9y0XLCMDlUiEYibAPkvLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnTgQMBSdl9TcXiv3jrvfJ3ZzZalLqtAHjRRvRVzKa2uqNoFLXjjK3cxpY3vJUgX1RVd0I3rErzGsNNfIop8arNpuUOmCdXV0Y1t0hu/gQV2qVvjgKSrfT/AJMypmkeMmRjTuu8upSTPYbP1Tjo1xKy7sNPQdyFjrPcRwervcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RagU2v1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B0BC4CED1;
	Mon, 10 Feb 2025 09:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739180598;
	bh=EWO8DBm96kpCkbfP+4QwRo9y0XLCMDlUiEYibAPkvLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RagU2v1fzUMe+W8FD9sVGp11Twieu8uCeSxBIa1TgImMCuONV7nKmrn+LzbzPtOV4
	 CODbBJX5fdRvqKnXqqf0E+Us/DrX5L1dNzLi95TP1ZeU0HXZMuBrmR5kOpPxyFsUhh
	 A8RYesQSrWx0UGQ9J2cYgqLxTT/sKKYHm5nj5TGU2g8wdWt3Bry15kWPcoKk09A9lG
	 5+ncWPBN3svUvtUxIpAOTtyqo8WvTi0V3+ZLBs9l0dP+jDOQwX9eZ1AJPW3SvjW9d8
	 tdPbk5H6jeEHEsTzMVqZIVHfNEEAcu+aJB8lsSdTMY35SC1Gxgi9xUGg08NMjy/zrf
	 9FfjPi4gAEmgw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thQK3-000000002at-1R3M;
	Mon, 10 Feb 2025 10:43:24 +0100
Date: Mon, 10 Feb 2025 10:43:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Saranya R <quic_sarar@quicinc.com>,
	Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z6nKOz97Neb1zZOa@hovoldconsulting.com>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
 <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
 <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>

On Mon, Feb 10, 2025 at 02:50:18PM +0530, Mukesh Ojha wrote:
> On Thu, Feb 06, 2025 at 04:13:25PM -0600, Bjorn Andersson wrote:
> 
> > On Wed, Jan 29, 2025 at 09:25:44PM +0530, Mukesh Ojha wrote:
> > > When some client process A call pdr_add_lookup() to add the look up for
> > > the service and does schedule locator work, later a process B got a new
> > > server packet indicating locator is up and call pdr_locator_new_server()
> > > which eventually sets pdr->locator_init_complete to true which process A
> > > sees and takes list lock and queries domain list but it will timeout due
> > > to deadlock as the response will queued to the same qmi->wq and it is
> > > ordered workqueue and process B is not able to complete new server
> > > request work due to deadlock on list lock.
> > > 
> > >        Process A                        Process B
> > > 
> > >                                      process_scheduled_works()
> > > pdr_add_lookup()                      qmi_data_ready_work()
> > >  process_scheduled_works()             pdr_locator_new_server()
> > >                                          pdr->locator_init_complete=true;
> > >    pdr_locator_work()
> > >     mutex_lock(&pdr->list_lock);
> > > 
> > >      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> > > 
> > >       pdr_get_domain_list()
> > >        pr_err("PDR: %s get domain list
> > >                txn wait failed: %d\n",
> > >                req->service_name,
> > >                ret);
> > > 
> > > Fix it by removing the unnecessary list iteration as the list iteration
> > > is already being done inside locator work, so avoid it here and just
> > > call schedule_work() here.
> > > 
> > 
> > I came to the same patch while looking into the issue related to
> > in-kernel pd-mapper reported here:
> > https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> > 
> > So:
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

I was gonna ask if you have confirmed that this indeed fixes the audio
regression with the in-kernel pd-mapper?

Is this how you discovered the issue as well, Mukesh and Saranya?

If so, please mention that in the commit message, but in any case also
include the corresponding error messages directly so that people running
into this can find the fix more easily. (I see the pr_err now, but it's
not as greppable).

A Link tag to my report would be good to have as well if this fixes the
audio regression.

Johan

