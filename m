Return-Path: <linux-arm-msm+bounces-69400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3F2B28599
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 20:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF7396016B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 18:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B82829D28A;
	Fri, 15 Aug 2025 18:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGZ+YaJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231821E51EB;
	Fri, 15 Aug 2025 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755281453; cv=none; b=P7ItNVKvAwyLLEJuZ4SAHerr0MOHCNfdZY0okyslS8/I4EIM5OqsRTO1VEWuY0X8L/iDH0kkKBpNOh6sIn7WwhgwLZuooHu/Gu8eSaw1dLzW94xCPNKZNYi0cUIVCntP1mUwIpA8q1dKLvGACRflFJCln3qOuuH6lkK3+0qZOgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755281453; c=relaxed/simple;
	bh=xyGRvffoiTMhp3ZWygnnC0QbETYQj9PlrSFtJ27j7Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzUFoXUzBPEqkKc3HGswGmMMXjOTjdxihys+vjuLGFz8EDhQ0qdKOMnQwI/WW3K0JXnNrpgbofPUW6VQZBDSrYA6cgy7UWoxuPinL/uIyurRMBvAp9omv4ak5j+9rkgx1IVXxqKW0rWVGKPLFSzir7B/l3OwDu73lQSSvbuv0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGZ+YaJ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32061C4CEEB;
	Fri, 15 Aug 2025 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755281452;
	bh=xyGRvffoiTMhp3ZWygnnC0QbETYQj9PlrSFtJ27j7Qs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CGZ+YaJ3rdupQLTqtUvfX2HhGwxtQButEg6b8yDrx2S2B/BNTn1sejDnsnL0ARyEy
	 cjUke5PxxXQsMmC1+rG/rWx1ZG3+vmiKNQu+I7NhPbC5xpLYiFCbleo8Ik5ehVVjGm
	 qPrWg/E8z/GoL2SH56wBiTSHeaYkozNLVCcixDdusoImZomFI3qjsjHS2wNYTlBdKk
	 fqoWenUE1t9v/1lW3/VcRMNuDyY0GyBgLojmJpxaM/eIESyGi6TTJGnz1uDFbvYvuE
	 KBpvuwlyomdACQ6chWyQfyyXpV1d7I7/e2xqdQ7bdeowreuTOdp1uIJzs692hhRwSh
	 tfJhGs+WF4g7A==
Date: Fri, 15 Aug 2025 11:10:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 03/11] net: qrtr: fit node ID + port number
 combination into unsigned long
Message-ID: <20250815111051.07aab6a1@kernel.org>
In-Reply-To: <d924086c0a1c25923ad8837867befb0acc157184.1754962437.git.ionic@ionic.de>
References: <cover.1754962436.git.ionic@ionic.de>
	<d924086c0a1c25923ad8837867befb0acc157184.1754962437.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Aug 2025 03:35:29 +0200 Mihai Moldovan wrote:
> Signed-off-by: Mihai Moldovan <ionic@ionic.de>
> Fixes: 5fdeb0d372ab ("net: qrtr: Implement outgoing flow control")

Same story, this presumably needs to go in as a fix.

