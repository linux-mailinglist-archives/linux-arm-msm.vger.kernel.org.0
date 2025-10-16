Return-Path: <linux-arm-msm+bounces-77526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20444BE1F9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 09:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D3864F3B89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 07:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B50242FDC38;
	Thu, 16 Oct 2025 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nfuFh5AH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E223E35F
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600715; cv=none; b=D8f9GIctq9APijX0d5dcly5j0Aia4wIWBZYBOLVIAhxbbt1836KnOEuQIGcDqG/JhXs8tp0obvytPQOvVY+GgXLYBlMT2t3zYOrQmjTiza0SBdMCOPIo707idKZbTzZFclNfU6CeS1e/rc8gFOkXm9y0iPnjfbDio72BAFadljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600715; c=relaxed/simple;
	bh=39D5Sil96gvLms1//zOCjbIiT96hh7B0Yr94Qfs2TMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzA4VgRPHzLWwhfwnaIsYU1yv7e6p0d8VX0SnBQoLkOZAeNUJ8T2ciqdnlmRcJCEjxjQgD5SlExGDFRNQHKGIUrnXBZe93fKdFA0jAkIXRaCntDwH83in1gL1jYAW+wkDD313RcsXyLnVcLTw/2UuLHvVdULEQMdM8vX+J6XZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nfuFh5AH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D7D7C4E410F3;
	Thu, 16 Oct 2025 07:45:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0B066062C;
	Thu, 16 Oct 2025 07:45:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97CFF102F22F8;
	Thu, 16 Oct 2025 09:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760600710; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=I0v577q1BsABPUxTz1xRiLHueg9d5rceOxAUtuerf34=;
	b=nfuFh5AHbkXF3rWr3y6jX3fbtDy+caY15+qyME3fkfKk8vMoSZE0F7wBVUB6+AlW5Rn0oC
	JQ4BLlcUNFD7Ij4kWS4VxeXkEAAkxYSrDbPShUnhbAG0qH1cI4R9a/letuXmQOfatIN3AT
	520yznS0ic5zJTEAafuU+Zk84MEQ78cwP+v2vVANcbidvCn9nkcGxehZLRGcK9Y3Iu/6NJ
	CQ1JaLdOvzTlVXiOLn8PR2jID7PBiv4ul8+d86+R6j/2QfZcSwgUH1iDzMVZQVNDwRKgzu
	KFJQz+8PLdwAT084rrDEaf2vZtHezNZj4k7fSVvKvTHlc0TlD5dTaQdc64WgJA==
Message-ID: <f8bf183c-964c-4e97-b7f0-f2cb0560f784@bootlin.com>
Date: Thu, 16 Oct 2025 09:44:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/14] net: stmmac: phylink PCS conversion
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
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
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <aO-5gVqBV-2Nl7lr@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aO-5gVqBV-2Nl7lr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 15/10/2025 17:10, Russell King (Oracle) wrote:
> On Wed, Oct 15, 2025 at 03:19:25PM +0100, Russell King (Oracle) wrote:
>> Changes since RFC:
>> - new patch (7) to remove RGMII "pcs" mode
>> - new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
>> - new patch (9) to simplify the code moved in the previous patch
>> - new patch (10) to rename the confusing hw->ps to something more
>>   understandable.
>> - new patch (11) to shut up inappropriate complaints about
>>   "snps,ps-speed" being invalid.
>> - new patch (13) to add a MAC .pcs_init method, which will only be
>>   called when core has PCS present.
>> - modify patch 14 to use this new pcs_init method.
> 
> I've just noticed I sent out RFC v2.. completely forgot about that,
> sorry

:( I don't know if you saw my reply to it then...

To quote :
"
  I tested that series on socfpga with :

    - 1 instance using RGMII, w/ a ksz9031 PHY, and it works well,
      traffic flows, ethtool seems to report correct data

    - 1 instance that has the Lynx PCS (DMA_HW_FEATURE[30:28] == 0)

  This also works perfectly, switching between SGMII/1000BaseX dynamically
  by hotswapping SFP modules works well, no regression found at a first glance.
"

All the boards I have that have a flavour of stmmac don't seem to have the
internal PCS, are you still interested in some testing , just
for non-regression ?

 This is a subset of RFC v2, but with patches 13 and 14
> reversed.
> 
Maxime

