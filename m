Return-Path: <linux-arm-msm+bounces-61021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44670AD6101
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 23:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8883AB08B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 21:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBE72505CB;
	Wed, 11 Jun 2025 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crn5xSiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76B824EAAF;
	Wed, 11 Jun 2025 21:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676629; cv=none; b=euINOYFPKbLaOFbvWYuV15dt1ae9UOP8L8QNFQ0SimBm7tibMKXAFuK6y5alVTDbm41QH55cYNc0k5/tGfEIgdoUcHyVN8mZ00idLsFqoMhLGUc0lqDQH1lhe2zafUldeWI8FXjVhHQ/6d5haQLesmEZ1yGlKnHHc7LSycUvXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676629; c=relaxed/simple;
	bh=jm6YAMEI2w2bPtK1+XGUCqX2+AtqBcb2XwmANQwlY04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjhRO573DVwhui8ZNfU+10juTV6QPgnYDack0c0nQtezI9rch6cZFphuu8uhjiGGOQZjfcefng235SgDGe/mTKCt+r1Fbr35uRxWFV62erjvq2kN+Y/RaaRcTCEuSiHR2z72jA3UlI/CL9gnOAF7rbq0nphyG7t8a46t4p1nLAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crn5xSiM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2A7C4CEEA;
	Wed, 11 Jun 2025 21:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749676629;
	bh=jm6YAMEI2w2bPtK1+XGUCqX2+AtqBcb2XwmANQwlY04=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=crn5xSiMLRNCcCSCkkUgfe/DxNxgFUJK+XC0dZ4txcnO9MA64W44YX6b98zOd/tIS
	 lrqLEAZyt+2f9FLZgqj9aHfW64mWEZL+bvvfxKEbxP85eFQ/nH3mIFo0jLBajqr6qY
	 Wgdun6FOLVICUxKiyIb0PMsgR+15qkvfhtmB/o9M3C2lxQMrd/Q5iNMJFR2EPeA2LH
	 azP09qsX6hKsa64CSztLRvoQwlfbgnol9XRPHMmC2DRTbt3eJIhPwJcUsBhSaQwnMP
	 kFoveuLXe5ivnbyCRbf55BxW7qCR2DzmUcYKQTUK/APzp9QMzNy3pP8o1U9Y4Aq2PS
	 3lTn53jlv4akA==
Date: Wed, 11 Jun 2025 14:17:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: George Moussalem via B4 Relay
 <devnull+george.moussalem.outlook.com@kernel.org>
Cc: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/5] Add support for the IPQ5018 Internal GE PHY
Message-ID: <20250611141707.7f4371a1@kernel.org>
In-Reply-To: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
References: <20250610-ipq5018-ge-phy-v5-0-daa9694bdbd1@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Jun 2025 12:37:54 +0400 George Moussalem via B4 Relay wrote:
> The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
> output pins that provide an MDI interface to either an external switch
> in a PHY to PHY link architecture or directly to an attached RJ45
> connector.

Please repost just patches 2 and 3 for networking to merge (with 
[PATCH net-next] in the subject). The other patches will be merged
by other trees.
-- 
pw-bot: cr

