Return-Path: <linux-arm-msm+bounces-36996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585B9BC48B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 06:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2554C282C32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 05:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20DC1AB505;
	Tue,  5 Nov 2024 05:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AK6VuxFZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E08A3987D;
	Tue,  5 Nov 2024 05:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730783285; cv=none; b=qGDeLWvr0+fMEzOE3MoT0Dfk/Oq5PuAfuqxYK8You6FftIIueC/tXrmkl7LEHE5YY0Z0kumRHSF7Qw1BJVcynna3T/cW/NaT+dIRi7Z7/zb0Kno3lIZOIUQvWZdHkek3qITPpLX5JAa1JCSjnxvbJoSvvUzQfPpySVYujA6XyQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730783285; c=relaxed/simple;
	bh=Woa5l/TBzfjnbejfeJNuhIdCkk1UOKkNCSAnyW42mrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1grtJj0b3kRBueslMfacPkJGTah5y1XaeeiIFqSXQ5vCwu7wM/8dlhEuERtMkf4yz107/zbbkHvYCBA5MeWm6OIpbznlr5Nphx2lbHGvkmUl5Eq11y+OiVyk5yqrPbJXFJE2cPgrtk+a851XG/t/Zu3Fd3/3V4NFA/kC+P3VWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AK6VuxFZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14238C4CECF;
	Tue,  5 Nov 2024 05:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730783285;
	bh=Woa5l/TBzfjnbejfeJNuhIdCkk1UOKkNCSAnyW42mrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AK6VuxFZ1qdb1ASJhFnrWnZ+gjqjzhn5itjDiDIbY6oA5hQ/MVC4po0h7T9x4iP+d
	 ZTy31PQzwIe/YAjF9RT1WtQqVMAeK6En6Glkchdb81Q2pbUuJg/JQPr97aGEp218Rd
	 S1h0+VwuCtaRmMAUzkWkQ0B5XtN6QSU30D9wOE+Mlj14S59wGMPw64CVqiAl07TwQh
	 FQoCXxXydhukNne/RoKvirXXRse1ke8F4PM9ckEZDPOmVR31KvQ27NSPYDZFjIblNi
	 /0KQcuc36UIzD9Joar7eKBo5yMAgB0+hohgNAoFwnjzsACSGwdL9QNvYwvnelBb6eE
	 /Amp0A3yUXSnA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t8BnO-000000005Bi-3WGR;
	Tue, 05 Nov 2024 06:08:03 +0100
Date: Tue, 5 Nov 2024 06:08:02 +0100
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
Message-ID: <ZymoMlSCQQScpRIZ@hovoldconsulting.com>
References: <ZyTtVdkCCES0lkl4@hovoldconsulting.com>
 <da2bc665-5010-4d92-b9ac-7c442859cd10@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da2bc665-5010-4d92-b9ac-7c442859cd10@quicinc.com>

On Mon, Nov 04, 2024 at 04:26:15PM -0800, Chris Lew wrote:
> On 11/1/2024 8:01 AM, Johan Hovold wrote:

> > [    8.825593] Unable to handle kernel NULL pointer dereference at virtual
> > address 0000000000000034
> > .

> > [    9.002030] CPU: 10 UID: 0 PID: 11 Comm: kworker/u48:0 Not tainted 6.12.0-rc5 #4
> > [    9.029550] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> > [    9.029552] Workqueue: qrtr_ns_handler qrtr_ns_worker [qrtr]
> > [    9.061350] pstate: a1400005 (NzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> > [    9.061353] pc : mhi_gen_tre+0x44/0x224 [mhi]
> > [    9.106931] lr : mhi_gen_tre+0x40/0x224 [mhi]
> > [    9.106934] sp : ffff8000800fb7d0
> > [    9.106935] x29: ffff8000800fb7d0 x28: ffff6db7852bd000 x27: ffff800082490188
> > [    9.120382] dwc3 a000000.usb: Adding to iommu group 5
> > [    9.133750]
> > [    9.133752] x26: 0000000000000000 x25: ffff6db783e65080 x24: ffff80008248ff88
> > [    9.133754] x23: 0000000000000000 x22: ffff80008248ff80 x21: ffff8000800fb890
> > [    9.133756] x20: 0000000000000000 x19: 0000000000000002 x18: 000000000005cf20
> > [    9.133758] x17: 0000000000000028 x16: 0000000000000000
> > [    9.172738]  x15: ffffa5834131fbd0
> > [    9.172741] x14: ffffa5834137caf0 x13: 000000000000ce30 x12: ffff6db7808bc028
> > [    9.172743] x11: ffffa58341993000 x10: 0000000000000000 x9 : 00000000cf3f2b90
> > [    9.172745] x8 : 0000000094e5072b x7 : 00000000000404ce x6 : ffffa5834162cfb0
> > [    9.172747] x5 : 000000000000008b x4 : ffffa583419cddf0 x3 : 0000000000000007
> > [    9.172750] x2 : 0000000000000000
> > [    9.192697]  x1 : 000000000000000a x0 : ffff6db7808bb700
> > [    9.192700] Call trace:
> > [    9.192701]  mhi_gen_tre+0x44/0x224 [mhi]
> > [    9.192704]  mhi_queue+0x74/0x194 [mhi]
> > [    9.192706]  mhi_queue_skb+0x5c/0x8c [mhi]
> > [    9.210985]  qcom_mhi_qrtr_send+0x6c/0x160 [qrtr_mhi]
> > [    9.210989]  qrtr_node_enqueue+0xd0/0x4a0 [qrtr]
> > [    9.210992]  qrtr_bcast_enqueue+0x78/0xe8 [qrtr]
> > [    9.225530]  qrtr_sendmsg+0x15c/0x33c [qrtr]
> > [    9.225532]  sock_sendmsg+0xc0/0xec
> > [    9.240436]  kernel_sendmsg+0x30/0x40
> > [    9.240438]  service_announce_new+0xbc/0x1c4 [qrtr]
> > [    9.240440]  qrtr_ns_worker+0x714/0x794 [qrtr]
> > [    9.240441]  process_one_work+0x210/0x614
> > [    9.254527]  worker_thread+0x23c/0x378
> > [    9.254529]  kthread+0x124/0x128
> > [    9.254531]  ret_from_fork+0x10/0x20
> > [    9.254534] Code: aa0003f9 aa1b03e0 94001a4d f9401b14 (3940d280)
> > [    9.267369] ---[ end trace 0000000000000000 ]---
> > [    9.267371] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> 
> Thanks for reporting this.

Thanks for taking a look, Chris.

> I'm not sure the in-kernel pd-mapper should be affecting this path. I 
> think this is for WLAN since it is the mhi qrtr and I'm not aware of 
> WLAN needing to listen to the pd-mapper framework.

This function is called for both the WWAN and WLAN on this machine, and
it seems like the modem is typically probed first and around the time
when I saw the NULL-deref.

[    8.802728] mhi-pci-generic 0005:01:00.0: mhi_gen_tre - buf_info = ffff800080d75000, offsetof(buf_info->used) = 0x34
...
[    9.980638] ath12k_pci 0004:01:00.0: mhi_gen_tre - buf_info = ffff800081d35000, offsetof(buf_info->used) = 0x34
 
> The offset seems to be mapped back to 
> linux/drivers/bus/mhi/host/main.c:1220, I had some extra debug configs 
> enabled so not sure the offset is still valid.
> 
> 	WARN_ON(buf_info->used);
> 	buf_info->pre_mapped = info->pre_mapped;
> 
> This looks like the null pointer would happen if qrtr tried to send 
> before mhi_channel_prepare() is called.

I didn't look closely at the code, but I can confirm that the offset of
buf_info->used is indeed 0x34, which could indicate that it's the

	buf_info = buf_ring->wp;

pointer that was NULL.

> I think we have a patch that might fix this, let me dig it up and send 
> it out.

Would that patch still help?

	https://lore.kernel.org/lkml/20241104-qrtr_mhi-v1-1-79adf7e3bba5@quicinc.com/

I naively tried adding a sleep after registering the endpoint, but that
is at least not sufficient to trigger the NULL-deref.

Johan

