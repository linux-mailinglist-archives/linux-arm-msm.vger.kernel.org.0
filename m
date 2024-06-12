Return-Path: <linux-arm-msm+bounces-22441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D223905367
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 15:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD4691F21712
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 13:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8DA1791F2;
	Wed, 12 Jun 2024 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWcJpCx2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF4178CE2;
	Wed, 12 Jun 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198097; cv=none; b=HaavO4F2DdoEkNu3B5D4qQ2FimCTMx9+ACHqLsxqHWJ6TUteq+ZZX3qrpVyKhcCOMxSckKEpVAw2A1OqSP/EaPXOJeUxokqEtPpHEDoabQB+oU1wleTa+Ibqqa5wtfnUwsd8pbpDxrCHXWSw/59kYJRvzqVO9o40Wk9vyxjspq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198097; c=relaxed/simple;
	bh=NjR9EmT2USXh4mzPSyqvcRcDLdrJnfGaf9Bxzh5GMm8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ma/WOxIfMKhwYsvoQNq30yinOvxZhl4Mq5AH+rkCX/ywvzj3lTSdHR+gt+bUyd3cHhrxiIr6fdoau4DfLMVkhEZqhli+/4sStmLHe1EE3ZEb5Y3yXYgWkSA2W/qQC5oGiDSqaNYfOxMvUBxlGnpva1J89aUDeSeSDFiT5UtXEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWcJpCx2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718198096; x=1749734096;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NjR9EmT2USXh4mzPSyqvcRcDLdrJnfGaf9Bxzh5GMm8=;
  b=NWcJpCx20V4swG705ViPMktXjyJkhwNkgisQbZMPxU895k1cavm1ONRf
   /fH5C3NVpa5oVgMFHFc9rowQcUpbQa+aQs2naxytbD8OJRxD42yo+G1ZH
   UIN8oeQKepmJ7hxieuOUdDSFWnwWYXceu4ccxYCvlA29xAA0J+hUPtkbZ
   ExOe4N93F1QZxO/V0geZVWb5catqKLf6kTUg6P8lclndmUt1jWwST4UvP
   0/oeXtlA+mbBouNnn7PC3loz4OEhgHbfXDby6/hOuW8DcKF/qAZQnNgla
   F9iNIxzUb6YQ5uL62MeYuOs5hTQjWFNTLrmsvriGRtCLOIAq91zcezTmB
   Q==;
X-CSE-ConnectionGUID: mlou6Ze8QCOxsBMuvoPOpg==
X-CSE-MsgGUID: TXQYRVnsSwC/UE0gmI1KxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14833613"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14833613"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 06:13:59 -0700
X-CSE-ConnectionGUID: s17X2DmVRiyWyalMUlsVIw==
X-CSE-MsgGUID: Z9GqfwPoRs2NdGc50Rzebw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="70990266"
Received: from unknown (HELO localhost) ([10.245.247.204])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 06:13:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 12 Jun 2024 16:13:38 +0300 (EEST)
To: Ferry Toth <fntoth@gmail.com>
cc: Jiri Slaby <jirislaby@kernel.org>, neil.armstrong@linaro.org, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, Al Cooper <alcooperx@gmail.com>, 
    Alexander Shiyan <shc_work@mail.ru>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Alexandre Torgue <alexandre.torgue@foss.st.com>, 
    Alim Akhtar <alim.akhtar@samsung.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Baruch Siach <baruch@tkos.co.il>, Bjorn Andersson <andersson@kernel.org>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    "David S. Miller" <davem@davemloft.net>, 
    Fabio Estevam <festevam@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Chunyan Zhang <zhang.lyra@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
    Jonathan Hunter <jonathanh@nvidia.com>, 
    Kevin Hilman <khilman@baylibre.com>, 
    Konrad Dybcio <konrad.dybcio@linaro.org>, 
    Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
    Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, 
    Laxman Dewangan <ldewangan@nvidia.com>, 
    linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, 
    Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
    Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>, 
    "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Nicholas Piggin <npiggin@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Patrice Chotard <patrice.chotard@foss.st.com>, 
    Peter Korsgaard <jacmet@sunsite.dk>, 
    Richard Genoud <richard.genoud@gmail.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
    Stefani Seibold <stefani@seibold.net>, 
    Sumit Semwal <sumit.semwal@linaro.org>, 
    Taichi Sugaya <sugaya.taichi@socionext.com>, 
    Takao Orito <orito.takao@socionext.com>, 
    Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, 
    Thierry Reding <thierry.reding@gmail.com>, Timur Tabi <timur@kernel.org>, 
    Vineet Gupta <vgupta@kernel.org>, 
    Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 00/15] tty: serial: switch from circ_buf to kfifo
In-Reply-To: <364fbb96-006f-4582-a0f8-a0f9edd50f6f@gmail.com>
Message-ID: <f6dc3a45-7be8-4ce2-c7da-65c6bd9ce8d1@linux.intel.com>
References: <20240405060826.2521-1-jirislaby@kernel.org> <daf06969-15fd-470e-88b8-a717066fe312@linaro.org> <cebad7f8-3f47-4e6a-93b7-32fcf2367874@kernel.org> <f42ef4a3-4bfe-4354-9220-ed742e093c86@gmail.com> <364fbb96-006f-4582-a0f8-a0f9edd50f6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Jun 2024, Ferry Toth wrote:
> Op 07-06-2024 om 22:32 schreef Ferry Toth:
> > Op 22-04-2024 om 07:51 schreef Jiri Slaby:
> > > On 19. 04. 24, 17:12, Neil Armstrong wrote:
> > > > On 05/04/2024 08:08, Jiri Slaby (SUSE) wrote:
> > > > > This series switches tty serial layer to use kfifo instead of
> > > > > circ_buf.
> > > > > 
> > > > > The reasoning can be found in the switching patch in this series:
> > > > > """
> > > > > Switch from struct circ_buf to proper kfifo. kfifo provides much
> > > > > better
> > > > > API, esp. when wrap-around of the buffer needs to be taken into
> > > > > account.
> > > > > Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for
> > > > > example.
> > > > > 
> > > > > Kfifo API can also fill in scatter-gather DMA structures, so it easier
> > > > > for that use case too. Look at lpuart_dma_tx() for example. Note that
> > > > > not all drivers can be converted to that (like atmel_serial), they
> > > > > handle DMA specially.
> > > > > 
> > > > > Note that usb-serial uses kfifo for TX for ages.
> > > > > """

> > > Sadly, everyone had a chance to test the series:
> > >    https://lore.kernel.org/all/20240319095315.27624-1-jirislaby@kernel.org/
> > > for more than two weeks before I sent this version for inclusion. And then
> > > it took another 5 days till this series appeared in -next. But noone with
> > > this HW apparently cared enough back then. I'd wish they (you) didn't.
> > > Maybe next time, people will listen more carefully:
> > > ===
> > > This is Request for Testing as I cannot test all the changes
> > > (obviously). So please test your HW's serial properly.
> > > ===
> > > 
> > > > and should've been dropped immediately when the first regressions were
> > > > reported.
> > > 
> > > Provided the RFT was mostly ignored (anyone who tested that here, or I
> > > only wasted my time?), how exactly would dropping help me finding
> > > potential issues in the series? In the end, noone is running -next in
> > > production, so glitches are sort of expected, right? And I believe I
> > > smashed them quickly enough (despite I was sidetracked to handle the n_gsm
> > > issue). But I might be wrong, as usual.
> > 
> > I arrived at this party a bit late, sorry about that. No good excuses.
> > 
> > > So no, dropping is not helping moving forward, actions taken by e.g. Marek
> > > Szyprowski <m.szyprowski@samsung.com> do, IMNSHO.
> > 
> > Good news is I tested on Merrifield (Intel Edison) which is slow (500MHz)
> > and has a HSU that can transmit up to 3.5Mb/s. It really normally needs DMA
> > and just a single interrupt at the end of transmit and receive for which I
> > my own patches locally. The bounce buffer I was using on transmit broke due
> > to this patch, so I dropped that. Still, with the extra interrupts caused by
> > the circ buffer wrapping around it seems to work well. Too late to add my
> > Tested-by.
> > 
> > One question though: in 8250_dma.c serial8250_tx_dma() you mention "/* kfifo
> > can do more than one sg, we don't (quite yet) */".
> > 
> > I see the opportunity to use 2 sg entries to get all the data out in one dma
> > transfer, but there doesn't seem to be much documentation or examples on how
> > to do that. It seems just increasing nents to 2 would do the trick?
> 
> Nevertheless I got this to work. Very nice. Thanks for this series.
> I am seeing only 2 interrupts (x2 as each interrupt happens twice), one for
> dma complete. The 2nd, not sure but likely, uart tx done.
> In any case the whole buffer is transferred without interchar gaps.
> 
> > So, what was the reason to "don't (quite yet)"?
> 
> Before considering to send out a patch for this, are there any caveats that
> I'm overlooking?

Not exactly related to that quoted comment, but you should Cc the person 
who added RNZ1 DMA a year or two back (in 8250_dw.c) because it required 
writing Tx length into some custom register. I don't know the meaning of 
that HW specific register so it would be good to get confirmation the HW 
is okay if it gets more than 1 sg entry (at worst, a HW-specific limit 
on nents might need to be imposed).

-- 
 i.


