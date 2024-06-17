Return-Path: <linux-arm-msm+bounces-22802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7990A57B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 08:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04C26B26B4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 06:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C20418628D;
	Mon, 17 Jun 2024 06:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UU/fOpQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC21836DF;
	Mon, 17 Jun 2024 06:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718605418; cv=none; b=PFyvIYVO3p8tYHzqNMAwIONtPCwAoeJjK2nyMDtc7EKIi0usfKW7veGXNMk+hNBp+RIU5cekxSZWCEk9j+UIpa06ByXk6W5njiILdsUy1GS3RBespgGgObSz/qragz/SJFa3lGfqum0aHxTNHf+CHOs9czA3Jv8s4nVTPhV4fkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718605418; c=relaxed/simple;
	bh=kM0fEbPvfxJcz/fBeOtmL8ZaqveVA9uOdgOegzW5RGk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UnL/0hMteJwv+qgK5Uas9ag0RDQ0nPVmiB2Lo5Y13bkoaL/yZBJoVVxyu8YD0V5gUiyzpx+K3lRypyYfy6xEzft4aq/U6/jkNb+SDIoRGPZfwc1gza4q2rSC5WDXw4Z18ByAPENE17fz9MJ2fPzYgXFU5NWidNGrc6ah+e2/XXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UU/fOpQO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718605416; x=1750141416;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kM0fEbPvfxJcz/fBeOtmL8ZaqveVA9uOdgOegzW5RGk=;
  b=UU/fOpQOrzxGmrqJUa6zcMcuhSCp7MYC65siX4EJn+q3i9p2E65sPFya
   q5RXROuQeQRR+LaTRnD6uNTF712+a8nGCNIXq7u67UeQbajAyOwVAWpxW
   XfJeQIkmpu6FD6Yncg/Ellk6ZeQXUQt6JchX812iDVf24FnCsvIP4W1o0
   Uk9CKamRwTIhXricqfjbVdL62P8gVPlzGCzAZU1/weuWYWBT6tB6S2RFp
   GlLZKyV6UrA9HVzvwrHT8I8mi5euNbKtY5ERsZO22zmpby/yI7NkTJPy+
   uGu1YgJ4jF3GQDxTtg+dZEXbIlnrlQJ6nO39kUyo1w9b0o6fAaJg3a/1Q
   w==;
X-CSE-ConnectionGUID: j4R03yz4Qtm6W1pzO/u0Tw==
X-CSE-MsgGUID: LT8djJkXQi+gkZL4ooPC2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26049421"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26049421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 23:23:35 -0700
X-CSE-ConnectionGUID: JC94FT3BRzyCKeg0rleuBw==
X-CSE-MsgGUID: O7gUGk+rTQyJRZmkrJtSgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41034498"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.247])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 23:23:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 17 Jun 2024 09:23:13 +0300 (EEST)
To: Ferry Toth <fntoth@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
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
    Marek Szyprowski <m.szyprowski@samsung.com>, 
    Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH 00/15] tty: serial: switch from circ_buf to kfifo
In-Reply-To: <45d41a5d-384e-4dc9-8b43-8dd8734b822a@gmail.com>
Message-ID: <4d8d8e80-cc65-02f6-799c-412a2b8eb00a@linux.intel.com>
References: <20240405060826.2521-1-jirislaby@kernel.org> <daf06969-15fd-470e-88b8-a717066fe312@linaro.org> <cebad7f8-3f47-4e6a-93b7-32fcf2367874@kernel.org> <f42ef4a3-4bfe-4354-9220-ed742e093c86@gmail.com> <364fbb96-006f-4582-a0f8-a0f9edd50f6f@gmail.com>
 <f6dc3a45-7be8-4ce2-c7da-65c6bd9ce8d1@linux.intel.com> <45d41a5d-384e-4dc9-8b43-8dd8734b822a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-811963831-1718605393=:1125"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-811963831-1718605393=:1125
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 16 Jun 2024, Ferry Toth wrote:

> Hi
>=20
> adding Phil
>=20
> Op 12-06-2024 om 15:13 schreef Ilpo J=C3=A4rvinen:
> > On Mon, 10 Jun 2024, Ferry Toth wrote:
> > > Op 07-06-2024 om 22:32 schreef Ferry Toth:
> > > > Op 22-04-2024 om 07:51 schreef Jiri Slaby:
> > > > > On 19. 04. 24, 17:12, Neil Armstrong wrote:
> > > > > > On 05/04/2024 08:08, Jiri Slaby (SUSE) wrote:
> > > > > > > This series switches tty serial layer to use kfifo instead of
> > > > > > > circ_buf.
> > > > > > >=20
> > > > > > > The reasoning can be found in the switching patch in this ser=
ies:
> > > > > > > """
> > > > > > > Switch from struct circ_buf to proper kfifo. kfifo provides m=
uch
> > > > > > > better
> > > > > > > API, esp. when wrap-around of the buffer needs to be taken in=
to
> > > > > > > account.
> > > > > > > Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes f=
or
> > > > > > > example.
> > > > > > >=20
> > > > > > > Kfifo API can also fill in scatter-gather DMA structures, so =
it
> > > > > > > easier
> > > > > > > for that use case too. Look at lpuart_dma_tx() for example. N=
ote
> > > > > > > that
> > > > > > > not all drivers can be converted to that (like atmel_serial),=
 they
> > > > > > > handle DMA specially.
> > > > > > >=20
> > > > > > > Note that usb-serial uses kfifo for TX for ages.
> > > > > > > """
> > > > > Sadly, everyone had a chance to test the series:
> > > > >     https://lore.kernel.org/all/20240319095315.27624-1-jirislaby@=
kernel.org/
> > > > > for more than two weeks before I sent this version for inclusion.=
 And
> > > > > then
> > > > > it took another 5 days till this series appeared in -next. But no=
one
> > > > > with
> > > > > this HW apparently cared enough back then. I'd wish they (you) di=
dn't.
> > > > > Maybe next time, people will listen more carefully:
> > > > > =3D=3D=3D
> > > > > This is Request for Testing as I cannot test all the changes
> > > > > (obviously). So please test your HW's serial properly.
> > > > > =3D=3D=3D
> > > > >=20
> > > > > > and should've been dropped immediately when the first regressio=
ns
> > > > > > were
> > > > > > reported.
> > > > > Provided the RFT was mostly ignored (anyone who tested that here,=
 or I
> > > > > only wasted my time?), how exactly would dropping help me finding
> > > > > potential issues in the series? In the end, noone is running -nex=
t in
> > > > > production, so glitches are sort of expected, right? And I believ=
e I
> > > > > smashed them quickly enough (despite I was sidetracked to handle =
the
> > > > > n_gsm
> > > > > issue). But I might be wrong, as usual.
> > > > I arrived at this party a bit late, sorry about that. No good excus=
es.
> > > >=20
> > > > > So no, dropping is not helping moving forward, actions taken by e=
=2Eg.
> > > > > Marek
> > > > > Szyprowski <m.szyprowski@samsung.com> do, IMNSHO.
> > > > Good news is I tested on Merrifield (Intel Edison) which is slow
> > > > (500MHz)
> > > > and has a HSU that can transmit up to 3.5Mb/s. It really normally n=
eeds
> > > > DMA
> > > > and just a single interrupt at the end of transmit and receive for =
which
> > > > I
> > > > my own patches locally. The bounce buffer I was using on transmit b=
roke
> > > > due
> > > > to this patch, so I dropped that. Still, with the extra interrupts
> > > > caused by
> > > > the circ buffer wrapping around it seems to work well. Too late to =
add
> > > > my
> > > > Tested-by.
> > > >=20
> > > > One question though: in 8250_dma.c serial8250_tx_dma() you mention =
"/*
> > > > kfifo
> > > > can do more than one sg, we don't (quite yet) */".
> > > >=20
> > > > I see the opportunity to use 2 sg entries to get all the data out i=
n one
> > > > dma
> > > > transfer, but there doesn't seem to be much documentation or exampl=
es on
> > > > how
> > > > to do that. It seems just increasing nents to 2 would do the trick?
> > > Currently I have this working on mrfld:
>=20
> diff --git a/drivers/tty/serial/8250/8250_dma.c
> b/drivers/tty/serial/8250/8250_dma.c
>=20
> index 8a353e3cc3dd..d215c494ee24 100644
>=20
> --- a/drivers/tty/serial/8250/8250_dma.c
>=20
> +++ b/drivers/tty/serial/8250/8250_dma.c
>=20
> @@ -89,7 +89,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)
>=20
> struct tty_port *tport =3D &p->port.state->port;
>=20
> struct dma_async_tx_descriptor *desc;
>=20
> struct uart_port *up =3D &p->port;
>=20
> - struct scatterlist sg;
>=20
> + struct scatterlist *sg;
>=20
> + struct scatterlist sgl[2];
>=20
> + int i;
>=20
> int ret;
>=20
> if (dma->tx_running) {
>=20
> @@ -110,18 +112,17 @@ int serial8250_tx_dma(struct uart_8250_port *p)
>=20
> serial8250_do_prepare_tx_dma(p);
>=20
> - sg_init_table(&sg, 1);
>=20
> - /* kfifo can do more than one sg, we don't (quite yet) */
>=20
> - ret =3D kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
>=20
> + sg_init_table(sgl, ARRAY_SIZE(sgl));
>=20
> +
>=20
> + ret =3D kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE=
(sgl),
>=20
> UART_XMIT_SIZE, dma->tx_addr);
>=20
> - /* we already checked empty fifo above, so there should be something */
>=20
> - if (WARN_ON_ONCE(ret !=3D 1))
>=20
> - return 0;
>=20
> + dma->tx_size =3D 0;
>=20
> - dma->tx_size =3D sg_dma_len(&sg);
>=20
> + for_each_sg(sgl, sg, ret, i)
>=20
> + dma->tx_size +=3D sg_dma_len(sg);
>=20
> - desc =3D dmaengine_prep_slave_sg(dma->txchan, &sg, 1,
>=20
> + desc =3D dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
>=20
> DMA_MEM_TO_DEV,
>=20
> DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>=20
> if (!desc) {
>=20
> > > Nevertheless I got this to work. Very nice. Thanks for this series.
> > > I am seeing only 2 interrupts (x2 as each interrupt happens twice), o=
ne
> > > for
> > > dma complete. The 2nd, not sure but likely, uart tx done.
> > > In any case the whole buffer is transferred without interchar gaps.
> > >=20
> > > > So, what was the reason to "don't (quite yet)"?
> > > Before considering to send out a patch for this, are there any caveat=
s
> > > that
> > > I'm overlooking?
> > Not exactly related to that quoted comment, but you should Cc the perso=
n
> > who added RNZ1 DMA a year or two back (in 8250_dw.c) because it require=
d
>=20
> RZN1
>=20
> I think you are referring to aa63d786cea2 ("serial: 8250: dw: Add support=
 for
> DMA flow controlling devices") by
>=20
> Phil Edworthy<phil.edworthy@renesas.com>?

The change was submitted by Miquel, I've added him into receipients as=20
well.

> > writing Tx length into some custom register. I don't know the meaning o=
f
> > that HW specific register so it would be good to get confirmation the H=
W
> I see dw8250_prepare_tx_dma() has RZN1_UART_xDMACR_BLK_SZ(dma->tx_size)
> > is okay if it gets more than 1 sg entry (at worst, a HW-specific limit
> > on nents might need to be imposed).
> >=20
> And is there a way to get the maximum nents supported? I thought
> kfifo_dma_out_prepare_mapped() would return a safe number.

This is about writing a value into RZN1_UART_*DMACR which seems to be=20
outside of dma subsystem's influence so I'd expect dma side does not know=
=20
about it.

--=20
 i.

--8323328-811963831-1718605393=:1125--

