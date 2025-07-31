Return-Path: <linux-arm-msm+bounces-67205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B00B169CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 02:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D71A37B5931
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 00:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD3F25760;
	Thu, 31 Jul 2025 00:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyQSZTBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C72905;
	Thu, 31 Jul 2025 00:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753923436; cv=none; b=Ou/sxg9at4CArKfnz44Vze7IwMBC6c+qFCxlz1CxcPaBZtXUHLwzMHlhY3yUgRl3wlQq6IgMVsAsJtaytzCBkLMDrhhaIwUD0teaJoNty35D4NMBTXZlD46KU7bF0hu+ombdVk/7mVa6vnlBN1dkW3qHaH5sRsJ97rE+Vqogyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753923436; c=relaxed/simple;
	bh=wDCunzODV3WzfX8u+ZDi/8KcT/PKQJWx3VvEoj6LrOk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5iVRW8SAutjhXCPP8GlMcZu3gXx6MTQx584nrGt2wlNaAWrLqa7yOAXE+vykT6fZORcT/bygWpqqbr3kMmPTJFawSyDL+Zdm2CzwSpIL066Rdh06rBw7xyPeOupoNw0ja8aDoOpZfFDv6WVc2tFKRa2YhzeI2BsImtWBU9YUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyQSZTBU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE78C4CEEB;
	Thu, 31 Jul 2025 00:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753923434;
	bh=wDCunzODV3WzfX8u+ZDi/8KcT/PKQJWx3VvEoj6LrOk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cyQSZTBUprASyb3cnu4YqOHRlv9tSJQRFIuXdW5g5Kzhbrnw8cYMAXwoE8QPGFI9e
	 u1DLnvSrZMvgSL3vw9L3UcEMqJbL51LPkgMGM/zwRCAoHvcH2UwH9mKiDtPL9L0kwI
	 2P3wxjVhrYTZKoipOAuFHU8W9wz683ux0KtZTM2HD4LdHTuFXgZSGl5M7uiFEiLGfS
	 /1dHh35A58oHrTucLHRYouwRtZx0xaK3llnZN3iTXWAVe0JxV+h0TokifUfoaDDetB
	 LTVJaX7xPkji/C/11bI54Mw99Nlp2ng5Y474drQheRU+EUsEQewUrn9s9e+by+Bneg
	 /qRgWiwNfYybQ==
Date: Wed, 30 Jul 2025 17:57:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mihai Moldovan <ionic@ionic.de>
Cc: linux-arm-msm@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/11] QRTR Multi-endpoint support
Message-ID: <20250730175712.76c3e2a7@kernel.org>
In-Reply-To: <cover.1753720934.git.ionic@ionic.de>
References: <cover.1753720934.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Jul 2025 18:45:17 +0200 Mihai Moldovan wrote:
> I am incredibly thankful for Denis's work on this. To get this back on
> track and to eventually get it merged, with his permission, I'm
> resubmitting his patch set with issues in the previous review rounds
> resolved. This feature is a prerequisite for my work on ath1{1,2}k to
> allow using multiple devices in one computer.

## Form letter - net-next-closed

We have already submitted our pull request with net-next material for v6.17,
and therefore net-next is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 11th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


