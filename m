Return-Path: <linux-arm-msm+bounces-33261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEA89920BC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:37:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7767A1F2102C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC12618A6CC;
	Sun,  6 Oct 2024 19:37:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE2154C08;
	Sun,  6 Oct 2024 19:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243458; cv=none; b=r1hiLfMpW0K7vXJTCdBSOsrh9jfFyQ0Z56lhJbjmJjT5as1z2N0Oa83ogiX/tw4fZBVzPHrwae3laED11/qdsuuUuRxSqG/NXxLljmgT8G4gAw8tcMsCi1d0w9Yfe5lUlxS0DE49liReVGffXoF61H2NvHGoa2VhZQXrLYIBlx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243458; c=relaxed/simple;
	bh=kFFi9fQ5bfx2S02Hw5G9PZ1pC2v99DAF++zrD6iNq9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ0YZDC0IGp1p87kEXwjgRZarN4i5ebC53aZUW1toy08FeiRfpJaedyoyF/I5zk9HM17iX5SQevoq/4PIQJIUPfyBN2RRMt7+qkJVorTgYvEOt36kZAIChVYGgmGOMxxmzfbOj6wbOjTow6m40gdkXAmGZlZWbA0uZg9alaXrXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B672E1A1A35;
	Sun,  6 Oct 2024 21:37:35 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A98921A10D0;
	Sun,  6 Oct 2024 21:37:35 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7C8BA202E3;
	Sun,  6 Oct 2024 21:37:36 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:37:35 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v2 4/7] net: phy: add helper for mapping RGMII link speed
 to clock rate
Message-ID: <ZwLm/1EtUZE+WsD1@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <8fe67776-e2b6-48e3-8c60-a5a4f18cd60c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8fe67776-e2b6-48e3-8c60-a5a4f18cd60c@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 19, 2024 at 05:57:11PM +0200, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 09:50:46PM +0000, Jan Petrous (OSS) wrote:
> > The helper rgmii_clock() implemented Russel's hint during stmmac
> > glue driver review:
> > 
> > ---
> > We seem to have multiple cases of very similar logic in lots of stmmac
> > platform drivers, and I think it's about time we said no more to this.
> > So, what I think we should do is as follows:
> > 
> > add the following helper - either in stmmac, or more generically
> > (phylib? - in which case its name will need changing.)
> 
> As Russell pointed out, this code appears a few times in the stmmac
> driver. Please include patches changing the other instances to use
> this helper.
> 
> It also looks like macb, and maybe xgene_enet_hw.c could use it as
> well.
> 

OK, for v3 added patches for the following possible users:
dwmac-sti, xgene_enet, macb, dwmac-starfive, dwmac-rk,
dwmac-intel-plat, dwmac-imx, dwmac-dwc-qos-eth.

BR.
/Jan


