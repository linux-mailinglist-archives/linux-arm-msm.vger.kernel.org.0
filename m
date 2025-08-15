Return-Path: <linux-arm-msm+bounces-69399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA042B2858F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 20:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33B151D042E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 18:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB7030DEA2;
	Fri, 15 Aug 2025 18:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S60jODD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11267309DAB;
	Fri, 15 Aug 2025 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755281342; cv=none; b=B1yvu7EO9Chq/OpGDNQKj1WrovSDwCtgCkaNaPS6KbrfyPmALVqBSTO7CYxsOCgUOG9RQneyVkc+tjyQ16rUsOivWO5aCUQ0IARAtlhkzGErqwD8E+ZWfZeCI/A54zLTD2vcu1XB4axHAlOEpkxuCCz3WmZKTFSYIVASvvEP6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755281342; c=relaxed/simple;
	bh=19brnsyyIp2ph9JbH6r7iqDFUZXwBNSUtnngklw5n6g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sDYH0XmS6dwn3sSF+4dYXYy1nf7yTOPSTYjFMHP3jM8JSJeilMj6X2zV3REtTXDh8XoU/3a/Grv31A0DCaZ/qb1jkpnnYTArsI/mOPGqUIsbDW6Ya1hbsc8pNAhp7th4iVTuZzK1/JP0uJdlXf8EIrqJNMcoWcAtptxEbpHxXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S60jODD6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E79AC4CEF5;
	Fri, 15 Aug 2025 18:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755281341;
	bh=19brnsyyIp2ph9JbH6r7iqDFUZXwBNSUtnngklw5n6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S60jODD61ed3m6ByVsl+MR8QbRZKIVfOeqq8DilJzWDV6I3KqSnlntv4IIbsnqGXz
	 tHVlV2ynSErS2aY1pbiKCwOELGvq461gdtnLaDJiBAWGHNZRgP896oJ3AwLlmMZFAv
	 ob4bojVv05YsoyaE+VqiqLLB5n1hH3pAfCUrvNAJghu2QKBfdcmRTupW+6LGeefGap
	 +IONgtaP5WX3+nTXXsT+KvvRXVloVLZKOQx00dTmxsICH6/cj3poHsWehbK9IU94hZ
	 FCUcYmkLeT+qe5GKZrFYvAdiia/GfPC/IV/4mbBLAkcEGFIuKObc08DGCy6y6P3LVc
	 mEuRjdnlaHqXA==
Date: Fri, 15 Aug 2025 11:09:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Denis Kenzior <denkenz@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 01/11] net: qrtr: ns: validate msglen before ctrl_pkt
 use
Message-ID: <20250815110900.2da8f3c5@kernel.org>
In-Reply-To: <161d8d203f17fde87ac7dd2c9c24be6d1f35a3c1.1754962436.git.ionic@ionic.de>
References: <cover.1754962436.git.ionic@ionic.de>
	<161d8d203f17fde87ac7dd2c9c24be6d1f35a3c1.1754962436.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Aug 2025 03:35:27 +0200 Mihai Moldovan wrote:
> The qrtr_ctrl_pkt structure is currently accessed without checking
> if the received payload is large enough to hold the structure's fields.
> Add a check to ensure the payload length is sufficient.
> 
> Signed-off-by: Denis Kenzior <denkenz@gmail.com>
> Reviewed-by: Marcel Holtmann <marcel@holtmann.org>
> Reviewed-by: Andy Gross <agross@kernel.org>
> Signed-off-by: Mihai Moldovan <ionic@ionic.de>
> Fixes: 0c2204a4ad71 ("net: qrtr: Migrate nameservice to kernel from userspace")

If this is a fix it has to go to net, then once it reaches Linus's tree
the dependent patches should be reposted for net-next.

> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> index 3de9350cbf30..2bcfe539dc3e 100644
> --- a/net/qrtr/ns.c
> +++ b/net/qrtr/ns.c
> @@ -619,6 +619,9 @@ static void qrtr_ns_worker(struct work_struct *work)
>  			break;
>  		}
>  
> +		if ((size_t)msglen < sizeof(*pkt))
> +			break;

why not continue?

