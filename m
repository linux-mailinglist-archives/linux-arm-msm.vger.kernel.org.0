Return-Path: <linux-arm-msm+bounces-84894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA09CB294F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D422F30C3C98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28932D7DF8;
	Wed, 10 Dec 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AE6GEMQ8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F12D6E4D;
	Wed, 10 Dec 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765359512; cv=none; b=QSdnHLiv6lm5XC7dzyiJFf0qMvVCuJwjMOtADZ2J8h0Q6MF+MNc852C2k7CNbRgNcQOmZy81Gcq3IBnwks7kxYFweUFUdM5xdfvVzqjN+BE6DRNhg1jpKZ9ghKESv1nuEFYcQXIZLaSEB44TMauxIyY9vL1yPwB8ASAty14Eke8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765359512; c=relaxed/simple;
	bh=Be/a8Vzi3MFVgGg37+GA9fVkh4zEQ1ttUE2ImU+huyM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JZ4k231SrMsOxNGBOdOJkD9iSdlthKujsDqRpSJszm+Y1klGRk6gMjb4BeiJ7zfKPgewluiPeCz1q/E/qNItFM9mQ3nXQdCLYarvPuIzKwqygV+Yy1ryQ2s9qE9MA7KK36tVtHw9S5RLpvIz8Ws3HS4V5PqXFzSqdSTXTEGlUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AE6GEMQ8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0724C4CEF1;
	Wed, 10 Dec 2025 09:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765359511;
	bh=Be/a8Vzi3MFVgGg37+GA9fVkh4zEQ1ttUE2ImU+huyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AE6GEMQ8KTVZyKujWM7EJAk43AHhr6JS+3RJqIaO+JGqGXKwY3MT+dNsb48UQPZ+o
	 7s3kaAq7MK2onJUsxRWIt7pC1dq0pVel3EOYtTJ6NzCxAQjXvsLTDyO5xCeYl43ogI
	 MJz4Yxmkz06Y2gSaTdw9g8sfj4pRsmrUx+OwLWNTdT8y6j+PqG4VELLOqwmjaLsMBo
	 R1Ao8nwHcBIKaE+RNIwMxXEzPcY/TTHNpgFaaWgl8GjBDsrtn45BWeFoc8dsNR7BW6
	 YDtuYoDzbyzNyAyNi3sQhdttGcqTC/RYLJQEO6gtEKK+YpLp/8Bi7ybiX5grSsnNST
	 n6VYGBgqWu4Qw==
Date: Wed, 10 Dec 2025 18:38:27 +0900
From: Jakub Kicinski <kuba@kernel.org>
To: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] net: mhi: Enable Ethernet interface support
Message-ID: <20251210183827.7024a8cf@kernel.org>
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
	<20251209-vdev_next-20251208_eth_v6-v6-1-80898204f5d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Dec 2025 16:55:38 +0530 Vivek Pernamitta wrote:
> Add support to configure a new client as Ethernet type over MHI by
> setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
> interface named eth%d. This complements existing NET driver support.
> 
> Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
> M-plane, NETCONF, and S-plane components.
> 
> M-plane:
> Implement DU M-Plane software for non-real-time O-RAN management
> between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
> models. Provide capability exchange, configuration management,
> performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
> R004-v18.00.

Noob question perhaps, what does any of this have to do with Ethernet?
You need Ethernet to exchange NETCONF messages?

