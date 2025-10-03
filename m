Return-Path: <linux-arm-msm+bounces-75914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D20BB702D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 15:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EAFD3B33F9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 13:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63E32F0C4D;
	Fri,  3 Oct 2025 13:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RdIJdGD0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDEF2F0C41
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759497918; cv=none; b=SqYg/EN6BW2BS0EIktKwzhU+brpOzjAHrCXIgDTNdWhAXgDvEjfZXD6enONsDbQYbKZQOr3WgpqnZQ9iscv+Ufo1JdXEOfR6rX1UAtZXIaOsmh7nzmIa6+E3kaQHLiYq1Hcx2ZTLV0XswcRPo8qiC2IVIwrOsnC5EEK6pnDRrco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759497918; c=relaxed/simple;
	bh=xYenE7SfJTNnSZEqd5j+ZPY04ztrbMPqfhqucA6ARQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkxjMS4fvdkKTlRRt9Bd0pfnOxEMSHnTfgK47mLF4ITXno0qHEkrxEGnFPiSNrCWcMdKIVXz9UUiP2IAeE/wa9XHndjQxM6YMR8oFOJnY0UN2gLWk+XYBmhfGWqiF0myMIlRvbO9wkb6HVM7uU2YsSLepC3LI7eytEOgE9TajLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RdIJdGD0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 13A734E40E8F;
	Fri,  3 Oct 2025 13:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEB5B60683;
	Fri,  3 Oct 2025 13:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77EF1102F1BE8;
	Fri,  3 Oct 2025 15:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759497911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ptzp+2oJuw+CxI6X5o8rCGyADt/tgv4sV6+WYhGeroU=;
	b=RdIJdGD0bJYNxg5ovmgufKgK04VYIolbqXYuQRztDusYp2GxHVsqgprbo8KUk9ImQVvoYh
	+IuF1+tlh7XkiALCjHIVXTYyermJ8YS65zYivldjU8rNS+JAybPgGIwaOfI/8fj2y6KLL9
	M0Si99AJGYa6qY5RU7z1voEdbr2ElyQVb6PNSg8FDlYe3NnlHePZKCq6QVCsk31raIL3O2
	J0odDaxLvtHeC0zqSmes9fsQiODAtw0QkvdEki6rBdtK32ytymmR9F38iXzouyzztX6TCo
	9HFE6hD9g91YVxWp0eFYc1WMWK7+Z4HyN+eJXAlUvXt+haIwSaOOORPn86KQOQ==
Message-ID: <67535617-92fc-44d4-ba2b-060d0408a5e7@bootlin.com>
Date: Fri, 3 Oct 2025 15:24:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: experimental PCS conversion
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Eric Dumazet <edumazet@google.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Paolo Abeni <pabeni@redhat.com>, Rohan G Thomas <rohan.g.thomas@altera.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Simon Horman <horms@kernel.org>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yu-Chun Lin <eleanor15x@gmail.com>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
 <4822b6a5-5b40-47bb-8bff-7a3cc91f93c8@bootlin.com>
 <aNVENwSF4I3hyP4q@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aNVENwSF4I3hyP4q@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

> Thanks for the offer of testing.
> 
> Do you know how the stmmac core has been synthesized as far as the
> MII interface from it?
> 
> If not, if it's using gmac1000, possibly later cores as well, then
> DMA_HW_FEATURE (or FEATURE0) bits 30:28 should give that information.
> I'd guess GMII, so probably contains 0. The driver doesn't actually
> use these, or even look at them.

When synthesized with Lynx, this reads 0 indeed. On my device there are 
2 instances of socfpga, the other instance doesn't include Lynx and uses 
RGMII, so in that case bits 30:28 read 1.

I hope that helps :)

Maxime


