Return-Path: <linux-arm-msm+bounces-22024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BE78FFD75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 09:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34BA1C21E74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 07:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B8F156C78;
	Fri,  7 Jun 2024 07:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SELNdqpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC9155328;
	Fri,  7 Jun 2024 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717746624; cv=none; b=Q7kP+yCfXIHpYB30STYKT7a+uhKGg8XKRgYyhCJrqp1+vuATIBVtJBvv7rm1I90aIusipl0lxfYsCwOK+QwlJUx2QFYd88IL0otC+4EiAJrlHHV0ySILCDpLrfgfWgzKtBD6EUocX3nRIHsuhLP3L9UchVdIWVlKjznoKV1mBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717746624; c=relaxed/simple;
	bh=5bSYW/OmR4/wal1ut/foq1tKCKOAO5TPQCk933qsvz0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EfgSUQFL29yDHxNQ8ArMy9/mwaVPYJTizocXiJAKAI3B/CqXa4AfjqTqCDKluGRmQvGMY5D+OJc7ra/So9wnAkrtrWE0fq7mWz/er9X33papzsxJV6DEVEip38LbnRoWJRD00XNRejDM5bTEbXcIRDavYnvkG8EZ+4EF08HQdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SELNdqpQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717746623; x=1749282623;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=5bSYW/OmR4/wal1ut/foq1tKCKOAO5TPQCk933qsvz0=;
  b=SELNdqpQip7EH3CwVLLgB9WA4PO6t4TksYUq+WyQ4EragSfd2QBaFQwU
   8Hh5dsVrm4gq0OhMan0sS1/yftYCNnFCMfXrn5va3nwgJcZdwIwvCVUMx
   J2X9suagB1bgTO5Wzh/TtJwdICRNkEhnfLInpt+mQm9j10DXtN6ZLUWlX
   XPnH66kav78jMpfV6IFWho6wMazzEIrImCjSfxe/MXm0dUaZAStQJ/XTP
   fAhrX3zFUVONBd8N3lVbtIQ1jRuz4jZPqRZoXWdDSRIFIc51842vvoRHe
   ZGBn3XwSzBAKddYsVXVWiMMeIZsLDCh0Vc9k2BslXSIU5Xpz7DzDbgGcL
   w==;
X-CSE-ConnectionGUID: bI7r25+TRcOO5WzXltpTxw==
X-CSE-MsgGUID: Xhw61JgdQ9iJ2Oky/wAIlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31950220"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="31950220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:50:22 -0700
X-CSE-ConnectionGUID: ZjVPWUJxRAqkAO5Rhf5EmA==
X-CSE-MsgGUID: XV6WleSXTUSCOnGmx40KJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="43164700"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.184])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 00:50:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 7 Jun 2024 10:50:14 +0300 (EEST)
To: Douglas Anderson <dianders@chromium.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    John Ogness <john.ogness@linutronix.de>, 
    Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>, 
    Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: Re: [PATCH v3 2/7] serial: qcom-geni: Fix the timeout in
 qcom_geni_serial_poll_bit()
In-Reply-To: <20240604090028.v3.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Message-ID: <554749d5-5709-c740-b05d-bd4957d1e8d0@linux.intel.com>
References: <20240604160123.2029413-1-dianders@chromium.org> <20240604090028.v3.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-413156389-1717744313=:1044"
Content-ID: <38ab697f-f43e-d6fd-0616-ad63d3f6baa4@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-413156389-1717744313=:1044
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <df8a971e-b0b3-8dfa-a43b-695e750872ad@linux.intel.com>

On Tue, 4 Jun 2024, Douglas Anderson wrote:

> The qcom_geni_serial_poll_bit() is supposed to be able to be used to
> poll a bit that's will become set when a TX transfer finishes. Because
> of this it tries to set its timeout based on how long the UART will
> take to shift out all of the queued bytes. There are two problems
> here:
> 1. There appears to be a hidden extra word on the firmware side which
>    is the word that the firmware has already taken out of the FIFO and
>    is currently shifting out. We need to account for this.
> 2. The timeout calculation was assuming that it would only need 8 bits
>    on the wire to shift out 1 byte. This isn't true. Typically 10 bits
>    are used (8 data bits, 1 start and 1 stop bit), but as much as 13
>    bits could be used (14 if we allowed 9 bits per byte, which we
>    don't).
>=20
> The too-short timeout was seen causing problems in a future patch
> which more properly waited for bytes to transfer out of the UART
> before cancelling.
>=20
> Rather than fix the calculation, replace it with the core-provided
> uart_fifo_timeout() function.
>=20
> NOTE: during earlycon, uart_fifo_timeout() has the same limitations
> about not being able to figure out the exact timeout that the old
> function did. Luckily uart_fifo_timeout() returns the same default
> timeout of 20ms in this case. We'll add a comment about it, though, to
> make it more obvious what's happening.
>=20
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v3:
> - Use uart_fifo_timeout() for timeout.
>=20
> Changes in v2:
> - New
>=20
>  drivers/tty/serial/qcom_geni_serial.c | 37 +++++++++++++--------------
>  1 file changed, 18 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 2bd25afe0d92..a48a15c2555e 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -124,7 +124,6 @@ struct qcom_geni_serial_port {
>  =09dma_addr_t tx_dma_addr;
>  =09dma_addr_t rx_dma_addr;
>  =09bool setup;
> -=09unsigned int baud;
>  =09unsigned long clk_rate;
>  =09void *rx_buf;
>  =09u32 loopback;
> @@ -269,24 +268,25 @@ static bool qcom_geni_serial_poll_bit(struct uart_p=
ort *uport,
>  =09=09=09=09int offset, int field, bool set)
>  {
>  =09u32 reg;
> -=09struct qcom_geni_serial_port *port;
> -=09unsigned int baud;
> -=09unsigned int fifo_bits;
> -=09unsigned long timeout_us =3D 20000;
> -=09struct qcom_geni_private_data *private_data =3D uport->private_data;
> +=09unsigned long timeout_us;
> =20
> -=09if (private_data->drv) {
> -=09=09port =3D to_dev_port(uport);
> -=09=09baud =3D port->baud;
> -=09=09if (!baud)
> -=09=09=09baud =3D 115200;
> -=09=09fifo_bits =3D port->tx_fifo_depth * port->tx_fifo_width;
> -=09=09/*
> -=09=09 * Total polling iterations based on FIFO worth of bytes to be
> -=09=09 * sent at current baud. Add a little fluff to the wait.
> -=09=09 */
> -=09=09timeout_us =3D ((fifo_bits * USEC_PER_SEC) / baud) + 500;
> -=09}
> +=09/*
> +=09 * This function is used to poll bits, some of which (like CMD_DONE)
> +=09 * might take as long as it takes for the FIFO plus the temp register
> +=09 * on the geni side to drain. The Linux core calculates such a timeou=
t
> +=09 * for us and we can get it from uart_fifo_timeout().
> +=09 *
> +=09 * It should be noted that during earlycon the variables that
> +=09 * uart_fifo_timeout() makes use of in "uport" may not be setup yet.
> +=09 * It's difficult to set things up for earlycon since it can't
> +=09 * necessarily figure out the baud rate and reading the FIFO depth
> +=09 * from the wrapper means some extra MMIO maps that we don't get by
> +=09 * default. This isn't a big problem, though, since uart_fifo_timeout=
()
> +=09 * gives back its "slop" of 20ms as a minimum and that should be
> +=09 * plenty of time for earlycon unless we're running at an extremely
> +=09 * low baud rate.
> +=09 */
> +=09timeout_us =3D jiffies_to_usecs(uart_fifo_timeout(uport));

Hi,

While this is not exactly incorrect, the back and forth conversions nsecs=
=20
-> jiffies -> usecs feels somewhat odd, perhaps reworking=20
uart_fifo_timeout()'s return type from jiffies to e.g. usecs would be=20
preferrable. As is, the jiffies as its return type seems a small obstacle=
=20
for using uart_fifo_timeout() which has come up in other contexts too.

> @@ -1224,7 +1224,6 @@ static void qcom_geni_serial_set_termios(struct uar=
t_port *uport,
>  =09qcom_geni_serial_stop_rx(uport);
>  =09/* baud rate */
>  =09baud =3D uart_get_baud_rate(uport, termios, old, 300, 4000000);
> -=09port->baud =3D baud;

It's always nice to see this kind of cache variable removed, good work. :-)

--=20
 i.
--8323328-413156389-1717744313=:1044--

