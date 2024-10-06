Return-Path: <linux-arm-msm+bounces-33256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003479920A2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6958281A2E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F0D18B492;
	Sun,  6 Oct 2024 19:17:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A115618B476;
	Sun,  6 Oct 2024 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728242279; cv=none; b=fNIBmETOYP5I9vej/q8ygfN2feg+V1CS5veBlHdGc6OLlW7VhghKzT4hL0ELbsY0M8E3zO6AH0UxUAi8/61TS3/ShNyC4hXaIEIrXHgafMg8eXLo40Sj/gEfoRHtbod3I/1qu79xgSdM7m17F76ykDH4tOsXs03gI0epHQYJbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728242279; c=relaxed/simple;
	bh=Z4+wRyUJ9HPs/O/EcxZGAI5wFRETD782JSXCiGXHUgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeJQoCR4ZtLy3zVsjW4gLpDl4eP67M9pJaXFqYpt/ZiSXxqnM1mFU1Gb5Yj01PnrtGzm5l5gXmlAGozaXmdgzwlMREFUjzZhT8T0ZZBS0EXb5yynrmb954agYoySVz83gKE2gLoTS824G+2l1Hr8f/qI0DlzONJ5Tv0lSg5icSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 22ACC200AFA;
	Sun,  6 Oct 2024 21:17:56 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0AD0E200030;
	Sun,  6 Oct 2024 21:17:56 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D0FEE202E3;
	Sun,  6 Oct 2024 21:17:56 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:17:56 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jacob Keller <jacob.e.keller@intel.com>
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
Subject: Re: [PATCH v2 1/7] net: driver: stmmac: extend CSR calc support
Message-ID: <ZwLiZOaQ0X1NkfPu@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB8506A4B49180F34117B93655E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <35fd8e73-2225-4644-82f1-037294710d30@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35fd8e73-2225-4644-82f1-037294710d30@intel.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Aug 20, 2024 at 02:09:56PM -0700, Jacob Keller wrote:
> 
> 
> On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> > Add support for CSR clock range up to 800 MHz.
> > 
> > When in, fix STMMAC_CSR_250_300M divider comment.
> > 
> 
> The phrasing of this was somewhat confusing. I would also have chosen to
> do this as a separate fix, since it makes reading the change somewhat
> more difficult. A separate change could also explain how it was wrong in
> the first place and add more context.

OK, divided to the two commits for v3.

> 
> Either way, I think its a minor enough change and it only affects a code
> comment. Not a huge deal.
> 
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>

Thanks you.
/Jan

