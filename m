Return-Path: <linux-arm-msm+bounces-66746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFAB127CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 02:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5648C1CE02EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 00:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403E280B;
	Sat, 26 Jul 2025 00:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2tvAvDe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E175645;
	Sat, 26 Jul 2025 00:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753488537; cv=none; b=DfDnnXdHtee4g9CURJoH0O0haIicFNEBQcN4EPHdQk+fXzIcLhuW9pCVksybCQygRtj9ny4sonh73d2GT1rsOPU3Hyyf0c2bjrtzYL1LXtXgEC/iz/OKtO4y7WSGdB8g/1xSKo0tKe/NM2AnmR+iYpKCVdbbJo4t2ybtMPssmT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753488537; c=relaxed/simple;
	bh=2Qyiz6o25kHHGnGvBlLB0KeYsqiZAGU8ye0SPij8U9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PyP4Ell+fUI5us6j5qOpmVETO+0iIl3+LETPLUrZ3Ccy9q3c7IeP/Rryb24/C25QopxEpww5T0LKyHCkqC765ibWfCQhNm33F3FUuE2qgRVUj4l9ZL+N6o3xyimfpHc8yQuh8QiyAOXW0rKP/jm9zW9De6zkvn4vXFsXVD3cIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2tvAvDe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1A5C4CEE7;
	Sat, 26 Jul 2025 00:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753488536;
	bh=2Qyiz6o25kHHGnGvBlLB0KeYsqiZAGU8ye0SPij8U9Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u2tvAvDeY4EhGvz35YtrJVhYIwnflJA5n6Q6RnM4VcJwtDPcFA+gR17bA7ZBH5KbS
	 5h4nmlfEro4SLzcw21AqqROLbJH1rxmBTyTEMzCK9DGYHabu2SBfqd0txSEBQlMIY8
	 eenknQtaKnpJKjHcqtm0rLu5HccQBgaLhXFV5j6mA2aii+mAh+DrW3+1QNO7Q80TUJ
	 HcKTrmlHW59FLWg73l89TvfWElpr9BH+bgOrtrbutVKzWJny7UTGBlgPVW3yJ0N4W7
	 cbOKl678dCH6WOmKr7JeFVb1RwQr6RS3CruaIiNV8xdoQqvWQ6j8BuX6YSjNpefGLZ
	 vm92psuR2aUPA==
Date: Fri, 25 Jul 2025 17:08:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Manivannan Sadhasivam <mani@kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>, Vivek Pernamitta
 <quic_vpernami@quicinc.com>
Subject: Re: [PATCH 1/4] net: mhi: Rename MHI interface to improve clarity
Message-ID: <20250725170855.072f7011@kernel.org>
In-Reply-To: <20250724-b4-eth_us-v1-1-4dff04a9a128@quicinc.com>
References: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
	<20250724-b4-eth_us-v1-1-4dff04a9a128@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Jul 2025 19:21:17 +0530 Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Rename the MHI network interface to include the device name, improving
> clarity when multiple MHI controllers are connected.
> 
> Currently, MHI NET device interfaces are created as mhi_swip<n>/
> mhi_hwip<n> for each channel, making it difficult to distinguish between
> channels when multiple EP/MHI controllers are connected.
> 
> Rename the MHI interface to include the device name, for example:
> - Channel IP_SW0 for the 1st MHI controller will be named mhi0_IP_SW0.
> - Channel IP_SW0 for the 2nd MHI controller will be named mhi1_IP_SW0.
> - Channel IP_HW0 for the 1st MHI controller will be named mhi0_IP_HW0.

The userspace can rename the interfaces. It has the association with
the underlying device right there in the udev event.

