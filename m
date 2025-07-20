Return-Path: <linux-arm-msm+bounces-65772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FAB0B503
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631C33B598B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 10:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0C31F2B90;
	Sun, 20 Jul 2025 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b="lRhPbFuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.ionic.de (ionic.de [145.239.234.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E112E7F;
	Sun, 20 Jul 2025 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.234.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753008881; cv=none; b=ox9IbVyo/h0PyF/wErQg4M54bsvwg50YNDqPl14jm8bkoJHOB2lGTK/SUnIEZWTRPTt9Y4qSkQnYQGtDi10pMUiutvHP366Rk6P289nIOreU+WRiEneOh7e3uIt5Z2xGtioQ1+kV6NnHZc9BszTZgUYwMWB/cej85LNjeGw33NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753008881; c=relaxed/simple;
	bh=bsx4MjC/xMe/JRYnsTAeDdsIFjvZS6CDMjQ0u/mAV7k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qI5l9zBUsiWOZ1jO7KC2uhPzfu+phQ87Bb4M8zFJBrLqOUNNI4ogRabthkelGbYDAj9+KGgkRNTk+/J5VFpfNJzGlEECbEZwa3QvdKlZICZ81Usa+/J2Yr9WVub23wxWhwuRxAMq3BnelJ4hFif+5fF5Stm+FSbgbPY6WitBTg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de; spf=pass smtp.mailfrom=ionic.de; dkim=pass (1024-bit key) header.d=ionic.de header.i=@ionic.de header.b=lRhPbFuD; arc=none smtp.client-ip=145.239.234.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ionic.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionic.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ionic.de; s=default;
	t=1753008875; bh=bsx4MjC/xMe/JRYnsTAeDdsIFjvZS6CDMjQ0u/mAV7k=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=lRhPbFuDW7q1oGFuRSQLddSjVyndEgVPHzROSZdb628Vxeby54sxZTGi8R2DxADPb
	 /00UwBRWMEzrMpA9ZO6YTEIjPeN6jPg0yBy6ZRO+FIFzvqGiySwguMDGtXONDne+MW
	 jkbTNvmsdKsC+BHSIijO/+KhFc/6eFQnHmN2gbBo=
Received: from [172.24.215.49] (unknown [185.102.219.57])
	by mail.ionic.de (Postfix) with ESMTPSA id 2E5851480B21;
	Sun, 20 Jul 2025 12:54:35 +0200 (CEST)
Message-ID: <c7eeebdb-1ef5-4987-bf01-7890fb75e03b@ionic.de>
Date: Sun, 20 Jul 2025 12:54:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] QRTR Multi-endpoint support
From: Ionic <ionic@ionic.de>
To: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima
 <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Willem de Bruijn <willemb@google.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <cover.1752947108.git.ionic@ionic.de>
Content-Language: en-US
Organization: Root24
In-Reply-To: <cover.1752947108.git.ionic@ionic.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

* On 7/19/25 20:59, Mihai Moldovan wrote:
> NOTE: There is 32-bit unsafe use of radix_tree_insert in this patch set.
> This follows the existing usage inside net/qrtr/af_qrtr.c in
> qrtr_tx_wait(), qrtr_tx_resume() and qrtr_tx_flow_failed().  This was
> done deliberately in order to keep the changes as minimal as possible
> until it is known whether the approach outlined is generally acceptable.

Since this is an actual problem and has to be eventually resolved, I'd like to 
ask for some guidance.

The Radix Tree API is fixed to using unsigned long keys, and my best idea (and 
the easiest thing to implement) thus far is to just go with that and restrict 
node IDs, endpoint IDs and port numbers to sizeof(unsigned long) / 2 bytes, 
which for platforms with 32-bit longs would be 16 bits. Not quite ideal, but 
probably good enough at the very least for port numbers (I figure).

Something like that:

#define RADIX_TREE_HALF_INDEX_BITS (RADIX_TREE_INDEX_BITS >> 1)
#define RADIX_TREE_HALF_INDEX_MAX_VALUE ((unsigned long)(-1) >> 
RADIX_TREE_HALF_INDEX_BITS)

with checks to make sure that node IDs, endpoint IDs and port numbers fit within 
RADIX_TREE_HALF_INDEX_MAX_VALUE.


Is this limitation acceptable? How big can node IDs get, also accounting for 
uncommon (and maybe also unrealistic) but conceivable use cases?



Mihai

