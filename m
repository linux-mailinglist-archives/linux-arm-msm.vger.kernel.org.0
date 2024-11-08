Return-Path: <linux-arm-msm+bounces-37336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E10089C1A03
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 11:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A7C1F25F7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 10:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8EE1E2618;
	Fri,  8 Nov 2024 10:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEusAy3P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4902E13A27D;
	Fri,  8 Nov 2024 10:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731060601; cv=none; b=BhMQa+Xr2P5kPWXLCrUWW01IiXbPMsiePDoRPz2CjIlcnOxom2ZjXyJrJ2lq/ilei4gdPFXx3D+ImwP7/SlmSnrUiOhbgvK9kfnCi08kWfPRZGk3h3flf2etT0fV+njkQgWPX2tK3iM8O92VXo0RFuTlCLzr3Boq2Cm+oXrVDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731060601; c=relaxed/simple;
	bh=GcaTVnuhZPHI8Rduj8Qe+ffknyFZam6gp7wslPFdY2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiK5AFunfMQkrvuE2yJHdr/cTXkQnXHQzPCiI4R5r40Un1GgeIgyczuKRCfHk4wIwguRYB+zTY5CEzsYrH/NuwhetkZKD8K8bjQJ5vY5U1n0pdQzX4NHuV8zlkrK57EBGS2d0fQPGYbmTm7wDMp2VQRvMhc3IaboArI6KiAKIE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEusAy3P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5132C4CECD;
	Fri,  8 Nov 2024 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731060600;
	bh=GcaTVnuhZPHI8Rduj8Qe+ffknyFZam6gp7wslPFdY2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEusAy3PJK3H/26X6rm4R9BqsxpVKaCxmuXEpycNAeCqAS+9ELigYuuAQSwt3ZImt
	 O6jdqBMbbZIgj/IRuETaARd2OP/bBkgRsswTIJm0GtGyc5TKLvRSHuHJmEM2gNTs3O
	 RMuzmFRbmoyROUHrYN7PmFbgcKSZVCM4pDoBq7JcqCyPUWUi2qkEzK9YrYHbFmfqyL
	 yNlOMaSl1se3fpiCtE4x1/ONpNveXcsHwnUfebc6Cb7/qjxOSeHf++PyOfX011C9ZA
	 d/cnUIv8NmCCPrfuJpYW7aMX9T+N4190GhfKybvq56LDWA9U4zeLAj1e19XMhyEZDH
	 I1yBKQn5P2DzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t9LwI-000000007VS-0qHO;
	Fri, 08 Nov 2024 11:10:02 +0100
Date: Fri, 8 Nov 2024 11:10:02 +0100
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
Message-ID: <Zy3jeixo2uTooRGo@hovoldconsulting.com>
References: <ZyTtVdkCCES0lkl4@hovoldconsulting.com>
 <da2bc665-5010-4d92-b9ac-7c442859cd10@quicinc.com>
 <ZymoMlSCQQScpRIZ@hovoldconsulting.com>
 <730a6e17-04f5-41b5-a0d8-7220b8c59b58@quicinc.com>
 <Zyzoh0zv1Z7LDfjW@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyzoh0zv1Z7LDfjW@hovoldconsulting.com>

On Thu, Nov 07, 2024 at 05:19:19PM +0100, Johan Hovold wrote:
> On Tue, Nov 05, 2024 at 10:26:40AM -0800, Chris Lew wrote:
> > On 11/4/2024 9:08 PM, Johan Hovold wrote:

> > > I naively tried adding a sleep after registering the endpoint, but that
> > > is at least not sufficient to trigger the NULL-deref.

> No, neither tqftpserv or diag-router are used here, but after digging
> through the code it seems my hunch about this being related to the
> in-kernel pd-mapper was correct.
> 
> The qrtr worker, qrtr_ns_worker(), is called when the in-kernel
> pd-mapper adds the server, and processing the QRTR_TYPE_NEW_SERVER
> command eventually ends up in mhi_gen_tre() for the modem:
> 
> [    9.026694] qcom_pdm_start - adding server
> [    9.034684] ctrl_cmd_new_server - service = 0x40, instance = 0x101, node_id = 1, port = 0
> [    9.042155] mhi-pci-generic 0005:01:00.0: mhi_gen_tre - buf_info = ffff800080d4d038, offset_of(buf_info->used) = 34

> And I can indeed imagine that leading to the NULL deref in case the
> endpoint is registered before being fully set up.

I've been able to reproduce the issue twice now by instrumenting the
code to increase the race window. Specifically, I added a sleep in
mhi_init_chan_ctxt() after allocating the ring buffers but before
initialising the wp pointers. And when the in-kernel pd-mapper is
started in that window, we hit the NULL-deref:

        [    8.593582] mhi-pci-generic 0005:01:00.0: mhi_init_chan_ctxt - ring allocated (IPCR:20), buf_ring->base = ffff800080d55000
        [    8.598902] mhi_net mhi0_IP_SW0: mhi_prepare_channel - channel started (46), dir = 1
        [    8.612888] mhi_net mhi0_IP_SW0: mhi_prepare_channel - channel started (47), dir = 2
        [    8.614767] qcom_pdm_start - adding server
        [    8.615302] ctrl_cmd_new_server - service = 0x40, instance = 0x101, node_id = 1, port = 0
        [    8.615388] mhi-pci-generic 0005:01:00.0: mhi_gen_tre - buf_info = 0000000000000000 (IPCR:20)
        [    8.615402] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000034
        ...
        [    8.615541] Call trace:
        [    8.615542]  mhi_gen_tre+0x68/0x248 [mhi]
        [    8.615544]  mhi_queue+0x74/0x194 [mhi]
        [    8.615546]  mhi_queue_skb+0x5c/0x8c [mhi]
        [    8.615549]  qcom_mhi_qrtr_send+0x6c/0x160 [qrtr_mhi]
        [    8.615551]  qrtr_node_enqueue+0xd0/0x4a0 [qrtr]
        [    8.615553]  qrtr_bcast_enqueue+0x78/0xe8 [qrtr]
        [    8.615554]  qrtr_sendmsg+0x15c/0x33c [qrtr]
        [    8.615555]  sock_sendmsg+0xc0/0xec
        [    8.615560]  kernel_sendmsg+0x30/0x40
        [    8.615561]  service_announce_new+0xbc/0x1c4 [qrtr]
        [    8.615563]  qrtr_ns_worker+0x754/0x7d4 [qrtr]

Johan

