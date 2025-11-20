Return-Path: <linux-arm-msm+bounces-82604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B490C71C0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 03:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9010734D227
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 02:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AF6257842;
	Thu, 20 Nov 2025 02:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzuwnvXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370D4212B2F;
	Thu, 20 Nov 2025 02:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763604457; cv=none; b=JAHnIcdczIhOoJ3ISMe+PNfqIEwMpzJYi/ialQ5Bhe1lZ3dbaWjh/7n38YiDe3nbukd87Assa59Gfv1FMbI9RFY50pB7ZGQCrUlX9bDPU/CheSC5kSW54WPL7ix0g6V0u2r9ZRD0gQ8pIndCOGsvRJgUnTvzcM/Ct35wBvqYDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763604457; c=relaxed/simple;
	bh=r1PhrgCDHhvZWtjmbjWSnMOmdMdeBFzmlrNBwgfowPA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDDsEahm/8AdGyPVIi7kKCk1CbfWA8dtuvUMHAU0hYHDZWajhAtsjrmReSJO8CWKP5yq9GLVw6+fAL0Nx0NazJsIBVZgujht1uyBUXpngsNCNHIlj4otz6DT8sQue23plTERLD2JGXdP/9NBwvFiMZK69yhdO8uMnNi6ztT2x1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzuwnvXn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E07AC4CEF5;
	Thu, 20 Nov 2025 02:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763604456;
	bh=r1PhrgCDHhvZWtjmbjWSnMOmdMdeBFzmlrNBwgfowPA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XzuwnvXnsARIbB4sDpSWF6a0DFOa+Cfmqh3P1tTgjI0enfeKbwwglltTq7fEKjx8i
	 SHVuNfCoKPgK8D5bR4P4zbYBDMHT5mNQdQ3icUr6/Ha3BSHmYvglwccI1pUrknZMFx
	 6m05myUeUPzoQFW5std5B4MNM+mQUhTUayjZbYZU9DBtk6W9BTk4xP1S0AraNV3w7p
	 RkA0P+JLxVgVT5sbEdHTtETtELQ24CVQkzfE9znC6G3opqztfyqMTv1XYTlEiMK11z
	 FQ6jJsTA84nwpq0B6Df2k4lfSKnMFycXC2Sas07c4AqRdMoCH6XTQeCodM2cj3dDNH
	 Az5bP7Vzg9OiQ==
Date: Wed, 19 Nov 2025 18:07:35 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] *** Add support for Foxconn T99W760 ***
Message-ID: <20251119180735.1baeaa8b@kernel.org>
In-Reply-To: <20251119105615.48295-1-slark_xiao@163.com>
References: <20251119105615.48295-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Nov 2025 18:56:13 +0800 Slark Xiao wrote:
> Subject: [PATCH v3 0/2] *** Add support for Foxconn T99W760 ***

> *** This series add support for Foxconn 5G modem T99W760 ***

Please don't with the ***.

