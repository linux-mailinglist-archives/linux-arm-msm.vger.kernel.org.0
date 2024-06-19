Return-Path: <linux-arm-msm+bounces-23313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3790590F99A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 01:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E306F1F22AF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 23:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6121586C2;
	Wed, 19 Jun 2024 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="k3NiJS0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73361FCF;
	Wed, 19 Jun 2024 23:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718838234; cv=none; b=BwnI0bFIa1wjc3crEu5CqLi69fz1dBKbRF24gTgdwnAsr9i/1z963ib817onL2aNJ3h3+nIOn5YD1u1JFU5HyUxX5QoD6kTqv8UthokRvEvGOZDO8S1uz36wZ57Cpc9pFsrbQFheg2BrYk5QeURTlvvMnwymk0fWdneOtg/JvWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718838234; c=relaxed/simple;
	bh=dZi0Gvh+GLG/1jbOwA+xe80NGtCynRIMekgpe8wJvR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKyYo905duyvNW/Atbq7pzm4tqWUP8Usv/yWUi6Plm6hfN/DhqNAE7mjQksYk/MrNkRDwvBzzR4O0+GovmAyWP0zwh8SHQKmZ69hwXQUOsrFsJoOufFDdigjpR1+bqIGz9NO7Mt693O6o2EeB9kELLc44WyZmR66HAQ/71J94TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=k3NiJS0N; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ywl436OGO2QA6BpHUwKrzeOAiJO51IGPFmToE85n3MU=; b=k3NiJS0N9XxGODPMgwgmw7ub38
	ukmXJZ+ztjxzI8/r4SpXVDrQpYUSzTJ8KGkmLSGEmtRSeeSwOWgSp6PAt+cTNRy119fiK3Tru3j0C
	WiZMULqHyyNqzjqOVVflEMIkK7nyj+ckMeCqY9gx7eVyZE7Pc+VyD6DAzdwk/SBF9hr8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK4Kq-000W3K-Kh; Thu, 20 Jun 2024 01:03:24 +0200
Date: Thu, 20 Jun 2024 01:03:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com,
	Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Add interconnect support for qcom_ethqos driver.
Message-ID: <53708a0d-1c20-4a26-a374-461002c846b3@lunn.ch>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>

On Wed, Jun 19, 2024 at 03:41:28PM -0700, Sagar Cheluvegowda wrote:
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---

You are supposed to put some text here which explains the big picture
of this patchset. The text will also be used in the text of the git
merge when the patchset is merged into net-next/main.

    Andrew

---
pw-bot: cr

