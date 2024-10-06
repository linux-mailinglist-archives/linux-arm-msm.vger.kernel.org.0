Return-Path: <linux-arm-msm+bounces-33255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753399206F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5562B1C20A0B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 18:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372DE189BBA;
	Sun,  6 Oct 2024 18:34:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767BEACD;
	Sun,  6 Oct 2024 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728239685; cv=none; b=bxjzO8IMj8Hv8Ir/zdjMhD9VFz5zUFCl4or+BKsThc4FBSpxWhgBbML9+eGuhFytIIsatNXuOT0nr0GmfNbS/yPc+bEXl2TqqzkHV9UALnNfn++cl+xJh7TuDvoI4ukCVi0Y4hqJxp+0ftGCBjRJ8VWa3Y/uPmDqBxjBJVgdeE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728239685; c=relaxed/simple;
	bh=bz/6mdQZ9+I7pNFGDTyp0XME/c6fIV3UFvKZbTD37j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvEr2AFiN9pcHCcW0zURK2qdF9l36lDsK+dRfkiDHFxYiD5yfi91e5ydVlwed3rbagOhu3WcuioO6QUOdNj2bGl7tlqP4aZZ/2XY1Cd+u6Es3oZmEyOImHBebS2MMifTtPHzRhdTOFn6lSwUynC35qH5dSdpL5tKy10YO1OPu5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A745C20077D;
	Sun,  6 Oct 2024 20:24:47 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 932F6200076;
	Sun,  6 Oct 2024 20:24:47 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 61DBA203BD;
	Sun,  6 Oct 2024 20:24:48 +0200 (CEST)
Date: Sun, 6 Oct 2024 20:24:47 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	dl-S32 <S32@nxp.com>
Subject: Re: [PATCH v2 0/7] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Message-ID: <ZwLV7zpfQht0errK@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB85066576AD6848E2402DA354E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <ff9b3d88-9fe7-47fa-a425-4661181f9321@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff9b3d88-9fe7-47fa-a425-4661181f9321@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 19, 2024 at 08:03:30AM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 23:50, Jan Petrous (OSS) wrote:
> > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > interface over Pinctrl device or the output can be routed
> > to the embedded SerDes for SGMII connectivity.
> > 
> > The provided stmmac glue code implements only basic functionality,
> > interface support is restricted to RGMII only.
> > 
> > This patchset adds stmmac glue driver based on downstream NXP git [0].
> > 
> > [0] https://github.com/nxp-auto-linux/linux
> 
> All your threading is completely broken which makes it difficult to
> apply and compare patchsets. Just try - use b4 diff on this...
> 

Sorry for that. I had some difficulties with enabling SMTP traffic,
so I used Outlook what I see is totally unusable solution.

Now I have all b4/lei/msmtp/mutt tools installed and will use
it for v3.

BR.
/Jan


