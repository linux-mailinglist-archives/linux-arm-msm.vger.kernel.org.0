Return-Path: <linux-arm-msm+bounces-70463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41240B32503
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Aug 2025 00:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6A61D20EAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 22:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68FB27AC2A;
	Fri, 22 Aug 2025 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kg5vkRsw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26915539A;
	Fri, 22 Aug 2025 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755901269; cv=none; b=r+9xCRCkeKk2Klq7lFizeWg7rk1Bs8EkhCbgnEAPDZvK5+3f6h2zbm/Wv8SPBVKjB9Xye4So3VGvjfm6zvpnI2OfjUHSanukcyEsEdFxFTkXysMXYkzGCwk7+yIMoN4G1RF+3rG/E6LAz0+YYWhg1eYxZ6f4hEr3c6x7obAuKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755901269; c=relaxed/simple;
	bh=1Z6GTjqZUoYLu0n+fPRDRUch1MWREiojl8WgKrm2nTA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bvpj0iUZ0ulg564qcY2Q1OYEE02cSHNNaPngdmzjB7LmNB83c+0enpyH4sQ1lg7rZBNEwbDAEwueQIyOaBPJtXrXIeBR+9NrNBWQSMoVwP9NvNvIodpVPuhLs3nP2V0bHUFKa99nMobuoLXz1K/FgEySvGgRxi4IQrVhs4HxjcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kg5vkRsw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EDCC4CEED;
	Fri, 22 Aug 2025 22:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755901269;
	bh=1Z6GTjqZUoYLu0n+fPRDRUch1MWREiojl8WgKrm2nTA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kg5vkRswA36yWTffqxPpqyX8aeCy5H23GTbocMTenTyn+62tB7/2WaVT/o6edzngS
	 Vuugl1X+g3nFRKIJ1dRWNYXIh45ybI0CqLG4iqNG3nnBfCMljAX6giNtxjITG3B/ft
	 tKgHJsMhwvUypZ4Qh1m0dZ5sZ8oehuMs7ysYpxDXp48cT7Tk3n/D+EzLRjmQ6FU3aG
	 8+hhlM5BI1gORlM7kSGryfxIuyNrITooB27Ux15cXG1amO0Z/0IZC2du2Q7Jg0NE5H
	 +j/m7D0Ru8ShnxfigLFxX9MZ/eTfQSSDV2DDBLjKcFrJ0yF5T1Xjq0QmJGggUXdtLg
	 U2V1hoDBZrP2w==
Date: Fri, 22 Aug 2025 15:21:08 -0700
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
Message-ID: <20250822152108.323af5e5@kernel.org>
In-Reply-To: <d5ae397b-a33a-42c9-91a1-5ba3fcc367a5@ionic.de>
References: <cover.1754962436.git.ionic@ionic.de>
	<161d8d203f17fde87ac7dd2c9c24be6d1f35a3c1.1754962436.git.ionic@ionic.de>
	<20250815110900.2da8f3c5@kernel.org>
	<d5ae397b-a33a-42c9-91a1-5ba3fcc367a5@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 22 Aug 2025 21:08:47 +0200 Mihai Moldovan wrote:
> >> diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
> >> index 3de9350cbf30..2bcfe539dc3e 100644
> >> --- a/net/qrtr/ns.c
> >> +++ b/net/qrtr/ns.c
> >> @@ -619,6 +619,9 @@ static void qrtr_ns_worker(struct work_struct *work)
> >>   			break;
> >>   		}
> >>   
> >> +		if ((size_t)msglen < sizeof(*pkt))
> >> +			break;  
> > 
> > why not continue?  
> 
> I don't really know and am not familiar with the QRTR protocol, but here's my 
> best guess:
> 
> Since we're using non-blocking I/O, it doesn't seem to make sense to continue, 
> because the next receive call would just break out anyway once it returns no 
> data at all. Notice that we're also breaking out for -EAGAIN.
> 
> Also, if we somehow got a short read, and we're currently dropping the buffer we 
> just read, any additional data after a subsequent receive would be garbage to us 
> anyway. We'd probably have to keep the old buffer content around and concatenate 
> it with data returned from a new receive call.

Okay, I don't know this proto and driver either. Just reading the
existing code it seemed like it's only breaks if the socket itself
has an error. If the command is not recognized or garbage the loop
will at most print an error and carry on looping..

