Return-Path: <linux-arm-msm+bounces-61161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C84AD8048
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 03:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91A027AB792
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21AC1D6DB5;
	Fri, 13 Jun 2025 01:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q94CNsO3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E172636;
	Fri, 13 Jun 2025 01:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749778200; cv=none; b=jrDOwB0mN0sY+SMiz3OJbkSSnDGJSZs1YoybAdbqvlxXkPevHsdjwNmrduquGsLBq94XxePqUqcetQTkN6Dw+9yjrXFTYIhzlA4B1hzOPx2gRVQS5l9JqZdvAox29tCqaz5BXrUwygiUzNIs7jE1h/1NqEuZzUNLFERxorSi2G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749778200; c=relaxed/simple;
	bh=RqMcqn0JWcgiJ7EPq03fKjRRCEN6dTdTUjbtUhbkVY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWPu9RAEwjO2kHHTJs4VKAF7q3xC8pk1dXZQkMsOtuEQfM58BxRQdWgSoAPsWh20TDTT20rUtrHcT1W6VZDmgzncStTq/mbsqG7OmPLOkI9HfdK6YPin6eR8EN0OTfGZQ0qJJEfoPMD3l3sHnP9IAyTxkLoDPEjD6av2XEVyQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q94CNsO3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39684C4CEEA;
	Fri, 13 Jun 2025 01:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749778200;
	bh=RqMcqn0JWcgiJ7EPq03fKjRRCEN6dTdTUjbtUhbkVY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q94CNsO3znQfKi0xRGCXB/Fk3qrKKSZAAz74XJRYRyiJN8bEkUArl86tJ9bVMcKVl
	 FhTHXgtbQ9LkNYdUrYyRhX/F+WGnGaj0T9fPBADf6Ltzqz7sq4GgiD3oASo5FlxXpN
	 mB9ZxENtk92E8T69NZbg3uupmmfF0gVDd1OVBSoiE3uD7m7ez07yRIz1GbpgSQW+cf
	 1Mku5nql8dRmwIxfFwPameDsRS6hY1H2rExcEDzMiyaWNMOdZd4lapVSsJ72YmJnxc
	 GN7uicZrXfIRBGx0DmFihnbp/aqu5hPFFX/Irqs9PYWIIbKa3hV0qvXkkNZoiW76xs
	 rmpiCizfQ4J3Q==
Date: Thu, 12 Jun 2025 18:29:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH net-next v5 0/5] Add support for the IPQ5018 Internal GE
 PHY
Message-ID: <20250612182958.7e8c5bf0@kernel.org>
In-Reply-To: <DS7PR19MB8883E05490D6A0BD48DE11909D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
References: <DS7PR19MB8883E05490D6A0BD48DE11909D74A@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Jun 2025 17:10:24 +0400 George Moussalem wrote:
>  [PATCH net-next v5 0/5] 

I guess my explanation wasn't good enough :)
This is not a correctly formatted series. It looks like a series with 5
patches where patches 1 4 5 where lost. We need the cover letter to say
0/2 and patches to say 1/2 and 2/2.

