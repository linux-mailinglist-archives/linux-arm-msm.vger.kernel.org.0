Return-Path: <linux-arm-msm+bounces-101750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BRUXGavD0GmV/wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 09:54:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB8139A463
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 09:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CB84301485B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 07:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE9D3358D6;
	Sat,  4 Apr 2026 07:54:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0308A1531E8;
	Sat,  4 Apr 2026 07:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775289255; cv=none; b=rT6MsUg0lmSVVzK4GTdbnyuFlfQPefBPQ52w35x/+R/BMGLvXysZbCVD5ai/NDDjEm/FSxIWjtXxyglba9sHpMhEjZOHhzIVIWXrOrxqQ7nOsbwaZuh7HKGwB//SDogVM0E6U6vOWtf6nMAmzsHptTbcXq94ohQm/h3GfOX2h4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775289255; c=relaxed/simple;
	bh=YMXx3Itf1JhFfIb+aobrBUQ59FAYay00gTLdS3m6lG8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9eggh7CiIa52YGBzbaJMn7k1aw8u6pZhBZ4qr0ljGhEQXZgFDd4rOrpvmtM9VxHVgRwXZiRGHIPt3wVBGFfPJOGwv4aCGj2cNe1tgIVmRIn5o+6SJvXJDZQCtfduU4nyaQz23dxF5yCnCRgQiW5pFLLP6msncXX/0mK2udx+fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B40FC19423;
	Sat,  4 Apr 2026 07:54:10 +0000 (UTC)
Date: Sat, 4 Apr 2026 13:24:02 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Yiming Qian <yimingqian591@gmail.com>
Subject: Re: [PATCH v2 0/5] net: qrtr: ns: A bunch of fixs
Message-ID: <kgoysvkrt2m4ap65p3iylgurlf7r6gdo4hczxly4letowjlic6@pf66tyhaqnil>
References: <20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260403-qrtr-fix-v2-0-f88a14859c63@oss.qualcomm.com>
X-Spamd-Result: default: False [1.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed), No valid DKIM,reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,davemloft.net,google.com,redhat.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101750-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.762];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: BDB8139A463
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:36:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series fixes a bunch of possible memory exhaustion issues in the QRTR
> nameserver.
> 

Gosh. I messed up the cover letter. Please ignore the below: 

> Manivannan Sadhasivam (2):
>   net: qrtr: ns: Limit the maximum server registration per node
>   net: qrtr: ns: Limit the maximum lookups per socket
> 
>  net/qrtr/ns.c | 38 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 
> --
> 2.51.0
> 

Until here...

- Mani

> ---
> Manivannan Sadhasivam (5):
>       net: qrtr: ns: Limit the maximum server registration per node
>       net: qrtr: ns: Limit the maximum number of lookups
>       net: qrtr: ns: Free the node during ctrl_cmd_bye()
>       net: qrtr: ns: Limit the total number of nodes
>       net: qrtr: ns: Fix use-after-free in driver remove()
> 
>  net/qrtr/ns.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 61 insertions(+), 10 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260331-qrtr-fix-b502c26e5f46
> 
> Best regards,
> --  
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

