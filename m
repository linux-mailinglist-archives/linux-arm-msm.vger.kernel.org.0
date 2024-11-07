Return-Path: <linux-arm-msm+bounces-37265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D349C0B74
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 17:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC9DF284FCE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 16:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF990217F57;
	Thu,  7 Nov 2024 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpPMTerf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB66216DEB;
	Thu,  7 Nov 2024 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730996358; cv=none; b=V/7mGwSChp3adHfi7nyRWU7VxrnwLqryy/hPFV6SQlqmNqksIkUTwtB6t6RNVZuak5oJmttB+84qYC7XoAyCocick77lqEUiXgvw4FPyr7gbZCNZ4OK2VdpY+pI1V6o1j4Smd8rKL/jflFy9EQCw3pMKPeVjT5PTHM1AGGm9Ge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730996358; c=relaxed/simple;
	bh=KQ7cry36vTkjA4og1SiWDy+ivDsdMILVHBsVe4G2oJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B360a9D9KgLkKazphPK5AdDwKleSWb5Xl3tSi+uNORZaiK6/wbulpNBTilvB1fx99fWimqzRSvfpQmIGg/LVEWlX1rQlyVQI2pc6D8hKrkAvCpab4dBCpNEELTesea0OcwXWsD6wbXis8EPhCLYUIuHlgguxOmAzZI+Hde038RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpPMTerf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E48C4CECC;
	Thu,  7 Nov 2024 16:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730996358;
	bh=KQ7cry36vTkjA4og1SiWDy+ivDsdMILVHBsVe4G2oJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpPMTerfVbwqa7ZMfS0g7X479PkiRFrWPmEVb90pmoRdxv5GwzzmNQHToidB2U4aP
	 Xa/8vVBpzApJ/bqDJpbMqWrNiOYRQhwZOdvLlkIucBXIIHAkMycHxwRpAKDJp5qjSa
	 CU3H3VWFQl4a4n4KNN9cCeSZxlgHet/SYYn6Rc8e5s9BKavlyt4z/DNm9idD/ArgY2
	 3D5v0TpfedqSM+ISop9cA/uZNZwXTkQGcb+N7IxsdAKSzEL+SaQRxXCCWjXllIqlDo
	 +z8bHhY97ymlU6GexvcH9CHDxMmdWGIeY3uzBeJPaHhNiXWwtIT4V23+507ZN7QtCV
	 fd1bWXX9y/mOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t95E7-0000000035L-3ZL9;
	Thu, 07 Nov 2024 17:19:19 +0100
Date: Thu, 7 Nov 2024 17:19:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Chris Lew <quic_clew@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: qrtr/mhi: NULL-deref with in-kernel pd-mapper
Message-ID: <Zyzoh0zv1Z7LDfjW@hovoldconsulting.com>
References: <ZyTtVdkCCES0lkl4@hovoldconsulting.com>
 <da2bc665-5010-4d92-b9ac-7c442859cd10@quicinc.com>
 <ZymoMlSCQQScpRIZ@hovoldconsulting.com>
 <730a6e17-04f5-41b5-a0d8-7220b8c59b58@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <730a6e17-04f5-41b5-a0d8-7220b8c59b58@quicinc.com>

On Tue, Nov 05, 2024 at 10:26:40AM -0800, Chris Lew wrote:
> On 11/4/2024 9:08 PM, Johan Hovold wrote:
> > On Mon, Nov 04, 2024 at 04:26:15PM -0800, Chris Lew wrote:

> >> This looks like the null pointer would happen if qrtr tried to send
> >> before mhi_channel_prepare() is called.

> >> I think we have a patch that might fix this, let me dig it up and send
> >> it out.
> > 
> > Would that patch still help?
> > 
> > 	https://lore.kernel.org/lkml/20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com/
> 
> Yea this is the exact patch I had in mind, didnt realize the patch was 
> already sent a while back.

Heh, that's a bit of an understatement. Apparently the fix was posted
three years ago, but no one followed up with a v2:

	https://lore.kernel.org/lkml/1626831778-31796-1-git-send-email-bbhatt@codeaurora.org/

> > I naively tried adding a sleep after registering the endpoint, but that
> > is at least not sufficient to trigger the NULL-deref.
> 
> Looking at the callstack, this is broadcasting a NEW_SERVER notification 
> from qrtr_ns. I think you can force this by starting and stopping some 
> qmi service with the added sleep. Do you have tqftpserv or diag-router 
> in your environment? Those will open qmi services, so starting and 
> stopping those will cause the new_server broadcast in qrtr_ns.

No, neither tqftpserv or diag-router are used here, but after digging
through the code it seems my hunch about this being related to the
in-kernel pd-mapper was correct.

The qrtr worker, qrtr_ns_worker(), is called when the in-kernel
pd-mapper adds the server, and processing the QRTR_TYPE_NEW_SERVER
command eventually ends up in mhi_gen_tre() for the modem:

[    9.026694] qcom_pdm_start - adding server
[    9.034684] ctrl_cmd_new_server - service = 0x40, instance = 0x101, node_id = 1, port = 0
[    9.042155] mhi-pci-generic 0005:01:00.0: mhi_gen_tre - buf_info = ffff800080d4d038, offset_of(buf_info->used) = 34
[   10.669996] Call trace:
[   10.787734]  mhi_gen_tre+0x218/0x270 [mhi]
[   10.804727]  mhi_queue+0x74/0x194 [mhi]
[   10.804730]  mhi_queue_skb+0x5c/0x8c [mhi]
[   10.804732]  qcom_mhi_qrtr_send+0x6c/0x160 [qrtr_mhi]
[   10.804734]  qrtr_node_enqueue+0xd0/0x4a0 [qrtr]
[   10.804736]  qrtr_bcast_enqueue+0x78/0xe8 [qrtr]
[   10.804737]  qrtr_sendmsg+0x15c/0x33c [qrtr]
[   10.804739]  sock_sendmsg+0xc0/0xec
[   10.804742]  kernel_sendmsg+0x30/0x40
[   10.804743]  service_announce_new+0xbc/0x1c4 [qrtr]
[   10.804745]  qrtr_ns_worker+0x754/0x7d4 [qrtr]

And I can indeed imagine that leading to the NULL deref in case the
endpoint is registered before being fully set up.

Johan

