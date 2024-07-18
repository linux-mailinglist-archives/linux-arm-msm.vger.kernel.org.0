Return-Path: <linux-arm-msm+bounces-26555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88248934CE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 14:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76151C2232E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 12:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8194F12FB34;
	Thu, 18 Jul 2024 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3oWJDfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875A012C473;
	Thu, 18 Jul 2024 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721304452; cv=none; b=G4oGTJXyUVcpYMgleQQ/pO3XA9EMYZaUtqIv4nDThJFDG1PV3pkOmuVayqJcvTElVmmV2Xpx2vyDq3tyTwe2P5tJmhBex9LoHabAKEE0j1uMBvIobCoOmz+djwzTtQTxi48PuBHENabxECN7tFrzZ6eadw3IXUR2403+uXb833g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721304452; c=relaxed/simple;
	bh=01nn3RyXxWlN75AcsNF/m8TgQhjzMhrIjCdTNAtMqUs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K6EqQ7j4rcysD8CaNNZTot4IHxUboecCsfnPxCq7XmrhDY1pTU+aOgBMemGEs+pwGuMPEofEfd5lhmAjoyMoH/xcCactk1dEWffk/a8Iu39hmwuEM2CeI45gtLkEzM0CTfO8Om0dFERA78K4DRhzDSjCksjn4NrX/3ImJNZvGtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3oWJDfr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721304451; x=1752840451;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=01nn3RyXxWlN75AcsNF/m8TgQhjzMhrIjCdTNAtMqUs=;
  b=f3oWJDfrSvGdDTbzM0ziYo6l8QxXh96zHzFU3EJbfiUS97CWfpjrmf9r
   OPidnDxOVnRMGFtxzzwl9mtRVUflfz6Aq+qUkShqitoKeU1Z/RYX1Vnhf
   0SWkfHhjSgIwQJpe48yHQum/2wT3wRh2nTaa1PjFBGCBOKy35bR20Pvv0
   lJrWhIsUx1Jy/ZMP7EYk2EiG/BwNLaK0XlBfQtj802XPGS2wViFGPsHFN
   Ckdh9Ldg0L6OQqFd4+cN/XRqT516fci0h91yXhJiVIlHZSEoVQyP7S/sw
   eeVRm/oYWHq7q95tTBNNcl8ztylrBuLG82Swri8XcAu9lxG0rdtdAYACQ
   w==;
X-CSE-ConnectionGUID: AoTDH4GHQCWPdRolQt7taA==
X-CSE-MsgGUID: SFYl9nSER4OXPHIp2CT2Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="41385445"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="41385445"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 05:07:29 -0700
X-CSE-ConnectionGUID: Lun8KLN+Q4aEJbUOb5ecQQ==
X-CSE-MsgGUID: wmuz3NaZQnG42N/YPylLYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="scan'208";a="88228670"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 05:07:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 18 Jul 2024 15:07:07 +0300 (EEST)
To: Ferry Toth <ftoth@exalondelft.nl>
cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    John Ogness <john.ogness@linutronix.de>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, neil.armstrong@linaro.org, 
    AlCooper <alcooperx@gmail.com>, AlexanderShiyan <shc_work@mail.ru>, 
    AlexandreBelloni <alexandre.belloni@bootlin.com>, 
    AlexandreTorgue <alexandre.torgue@foss.st.com>, 
    AlimAkhtar <alim.akhtar@samsung.com>, 
    AndrewMorton <akpm@linux-foundation.org>, 
    "AneeshKumarK . V" <aneesh.kumar@kernel.org>, 
    AngeloGioacchinoDelRegno <angelogioacchino.delregno@collabora.com>, 
    BaolinWang <baolin.wang@linux.alibaba.com>, 
    BaruchSiach <baruch@tkos.co.il>, BjornAndersson <andersson@kernel.org>, 
    ClaudiuBeznea <claudiu.beznea@tuxon.dev>, 
    "DavidS . Miller" <davem@davemloft.net>, FabioEstevam <festevam@gmail.com>, 
    HammerHsieh <hammerh0314@gmail.com>, 
    =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, 
    ChristopheLeroy <christophe.leroy@csgroup.eu>, 
    ChunyanZhang <zhang.lyra@gmail.com>, JeromeBrunet <jbrunet@baylibre.com>, 
    JonathanHunter <jonathanh@nvidia.com>, KevinHilman <khilman@baylibre.com>, 
    KonradDybcio <konrad.dybcio@linaro.org>, 
    KrzysztofKozlowski <krzysztof.kozlowski@linaro.org>, 
    KumaravelThiagarajan <kumaravel.thiagarajan@microchip.com>, 
    LaxmanDewangan <ldewangan@nvidia.com>, 
    linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
    "MaciejW . Rozycki" <macro@orcam.me.uk>, 
    ManivannanSadhasivam <manivannan.sadhasivam@linaro.org>, 
    MartinBlumenstingl <martin.blumenstingl@googlemail.com>, 
    MatthiasBrugger <matthias.bgg@gmail.com>, 
    MaximeCoquelin <mcoquelin.stm32@gmail.com>, 
    MichaelEllerman <mpe@ellerman.id.au>, MichalSimek <michal.simek@amd.com>, 
    "NaveenN . Rao" <naveen.n.rao@linux.ibm.com>, 
    NicolasFerre <nicolas.ferre@microchip.com>, 
    NicholasPiggin <npiggin@gmail.com>, OrsonZhai <orsonzhai@gmail.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    PatriceChotard <patrice.chotard@foss.st.com>, 
    PeterKorsgaard <jacmet@sunsite.dk>, 
    RichardGenoud <richard.genoud@gmail.com>, 
    RussellKing <linux@armlinux.org.uk>, SaschaHauer <s.hauer@pengutronix.de>, 
    ShawnGuo <shawnguo@kernel.org>, StefaniSeibold <stefani@seibold.net>, 
    SumitSemwal <sumit.semwal@linaro.org>, 
    TaichiSugaya <sugaya.taichi@socionext.com>, 
    TakaoOrito <orito.takao@socionext.com>, 
    TharunKumarP <tharunkumar.pasumarthi@microchip.com>, 
    ThierryReding <thierry.reding@gmail.com>, TimurTabi <timur@kernel.org>, 
    VineetGupta <vgupta@kernel.org>, 
    MarekSzyprowski <m.szyprowski@samsung.com>, 
    PhilEdworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v1 1/1] tty: serial: 8250_dma: use sgl with 2 nents to
 take care of buffer wrap
In-Reply-To: <20240716214055.102269-1-ftoth@exalondelft.nl>
Message-ID: <b31d654f-07f5-7a4b-1dc2-97b30ec4dad5@linux.intel.com>
References: <20240716214055.102269-1-ftoth@exalondelft.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1792353095-1721304427=:1055"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1792353095-1721304427=:1055
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 16 Jul 2024, Ferry Toth wrote:

> Previously 8250_dma used a circular xmit->buf as DMA output buffer. This
> causes messages that wrap around in the circular buffer to be
> transmitted using 2 DMA transfers. Depending on baud rate and processor
> load this can cause an interchar gap in the middle of the message. On
> the receiving end the gap may cause a short receive timeout, possibly
> long enough to terminate a DMA transfer, but too short to restart a
> receive DMA transfer in time thus causing a receive buffer overrun.
>=20
> This is especially a problem for devices with high speed UARTs (HSU)
> where even deep 64 byte FIFO's are not sufficient to handle interrupt
> latency.
>=20
> The circular buffer has now been replaced by kfifo which requires a SG
> list with a single entry, which still causes 2 dma transfers when a wrap
> around occurs. Fix this by allowing up to 2 entries in the sgl.
>=20
> Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
> ---
>  drivers/tty/serial/8250/8250_dma.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250=
/8250_dma.c
> index 8a353e3cc3dd..d215c494ee24 100644
> --- a/drivers/tty/serial/8250/8250_dma.c
> +++ b/drivers/tty/serial/8250/8250_dma.c
> @@ -89,7 +89,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)
>  =09struct tty_port=09=09=09*tport =3D &p->port.state->port;
>  =09struct dma_async_tx_descriptor=09*desc;
>  =09struct uart_port=09=09*up =3D &p->port;
> -=09struct scatterlist sg;
> +=09struct scatterlist=09=09*sg;
> +=09struct scatterlist=09=09sgl[2];
> +=09int i;
>  =09int ret;
> =20
>  =09if (dma->tx_running) {
> @@ -110,18 +112,17 @@ int serial8250_tx_dma(struct uart_8250_port *p)
> =20
>  =09serial8250_do_prepare_tx_dma(p);
> =20
> -=09sg_init_table(&sg, 1);
> -=09/* kfifo can do more than one sg, we don't (quite yet) */
> -=09ret =3D kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> +=09sg_init_table(sgl, ARRAY_SIZE(sgl));
> +
> +=09ret =3D kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SI=
ZE(sgl),
>  =09=09=09=09=09   UART_XMIT_SIZE, dma->tx_addr);
> =20
> -=09/* we already checked empty fifo above, so there should be something =
*/
> -=09if (WARN_ON_ONCE(ret !=3D 1))
> -=09=09return 0;
> +=09dma->tx_size =3D 0;
> =20
> -=09dma->tx_size =3D sg_dma_len(&sg);
> +=09for_each_sg(sgl, sg, ret, i)
> +=09=09dma->tx_size +=3D sg_dma_len(sg);
> =20
> -=09desc =3D dmaengine_prep_slave_sg(dma->txchan, &sg, 1,
> +=09desc =3D dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
>  =09=09=09=09       DMA_MEM_TO_DEV,
>  =09=09=09=09       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>  =09if (!desc) {

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

I envision though that this would be part of serial core so that it's not=
=20
limited to 8250 DMA but that can be changed on top of this at a later=20
time.

--=20
 i.

--8323328-1792353095-1721304427=:1055--

