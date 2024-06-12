Return-Path: <linux-arm-msm+bounces-22382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA02904CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96F81F21E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 07:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EDB16B75C;
	Wed, 12 Jun 2024 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSto2ezH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AC512DD9B;
	Wed, 12 Jun 2024 07:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177900; cv=none; b=lF+t42HP0DOlioMhRxmD7gb8oSrdHrjeRdKpHMZOHiCxSjD2nHboxJ9vdkwJfJn4oq2T2ebAFG7T4RjTFD1ljmCrAQAZHJH57OGLaF0cu1FnAWmfcQDsdU1Y28wnJHHcaOvoMtvFlR0H855aQLMKiD8xj4+0acCv1iFE2VjGRIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177900; c=relaxed/simple;
	bh=SRTOkK8vWEME9QApRo3c7TilPvpi/6OLtqm8jG7e20U=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QET8JN3FlBRdE9wEy/uOHAkO8DroNxJLDawW4UaTUZxIfTWKKQiXYBvxLPd8Zh002uVTI8aIcHlYJH2HFuCZknBkQ4vVtFbjKTaMmueW7zuuei2+XDhheFdi1YwxSK5QuA7eD41NEJuRpfCcUjVhxbVpFKlM4SxPcwiloRya9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSto2ezH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718177899; x=1749713899;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SRTOkK8vWEME9QApRo3c7TilPvpi/6OLtqm8jG7e20U=;
  b=aSto2ezHJhiXo79H5hJvdCyUhW7CahukGD+HLTFKaQ0BwUjq/mHmbIfm
   bqemET3RDrurjinEqhX2Y7AjeDlJDLq/VZUFo053l6CX0hDSpJ/KR1Lj1
   N3V1rAut0sjCBWZrrfMLPEHZi433Y+HeAcUlbTzYc4xO+yKLtP9OuwPp+
   rAcTsofDJ5vl4eLK/3O13fN9g7pFxFl+Xt3WiDzs0bn1qpFApgZ32TljY
   N9KS/8E1nGRKsgCBeTliI+CmMng0Vzv4YoWKRQzSaLSjzHOR7bkXd0NBW
   eM8ThICQV1VdrxquD2zvcRfgNJ3N6FByapU5caYr4p9k0MrHONL+5xi5J
   g==;
X-CSE-ConnectionGUID: P0gk9DqfQuWUnsqNRJ6fsw==
X-CSE-MsgGUID: cF8tf6jcRNC/wPn6PzhmYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14722439"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14722439"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 00:38:18 -0700
X-CSE-ConnectionGUID: sIJBPyJiQk2LWkQF+l5nXg==
X-CSE-MsgGUID: XzBC8xt2QZeDhWU8YfCBRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="44096445"
Received: from unknown (HELO localhost) ([10.245.247.204])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 00:38:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 12 Jun 2024 10:38:08 +0300 (EEST)
To: Douglas Anderson <dianders@chromium.org>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Johan Hovold <johan+linaro@kernel.org>, 
    John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konrad.dybcio@linaro.org>, 
    Stephen Boyd <swboyd@chromium.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4 2/8] tty: serial: Add uart_fifo_timeout_ms()
In-Reply-To: <20240610152420.v4.2.I65a6430ab75f74d20c28b5c5f819dd5b8455933d@changeid>
Message-ID: <0bb414fa-851b-40cf-ede9-fc6252c6b173@linux.intel.com>
References: <20240610222515.3023730-1-dianders@chromium.org> <20240610152420.v4.2.I65a6430ab75f74d20c28b5c5f819dd5b8455933d@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-260151195-1718177888=:1312"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-260151195-1718177888=:1312
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 10 Jun 2024, Douglas Anderson wrote:

> The current uart_fifo_timeout() returns jiffies, which is not always
> the most convenient for callers. Add a variant uart_fifo_timeout_ms()
> that returns the timeout in milliseconds.
>=20
> NOTES:
> - msecs_to_jiffies() rounds up, unlike nsecs_to_jiffies(). This is
>   because msecs_to_jiffies() is actually intended for device drivers
>   to calculate timeout value. This means we don't need to take the max
>   of the timeout and "1" since the timeout will always be > 0 ms (we
>   add 20 ms of slop).
> - uart_fifo_timeout_ms() returns "unsigned int" but we leave
>   uart_fifo_timeout() returning "unsigned long". This matches the
>   types of msecs_to_jiffies().
>=20
> Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
> Changes in v4:
> - New
>=20
>  include/linux/serial_core.h | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
> index 8cb65f50e830..97968acfd564 100644
> --- a/include/linux/serial_core.h
> +++ b/include/linux/serial_core.h
> @@ -889,14 +889,21 @@ unsigned int uart_get_divisor(struct uart_port *por=
t, unsigned int baud);
>  /*
>   * Calculates FIFO drain time.
>   */
> -static inline unsigned long uart_fifo_timeout(struct uart_port *port)
> +static inline unsigned int uart_fifo_timeout_ms(struct uart_port *port)
>  {
>  =09u64 fifo_timeout =3D (u64)READ_ONCE(port->frame_time) * port->fifosiz=
e;
> +=09unsigned int fifo_timeout_ms =3D div_u64(fifo_timeout, NSEC_PER_MSEC)=
;
> =20
> -=09/* Add .02 seconds of slop */
> -=09fifo_timeout +=3D 20 * NSEC_PER_MSEC;
> +=09/*
> +=09 * Add .02 seconds of slop. This also helps account for the fact that
> +=09 * when we converted from ns to ms that we didn't round up.
> +=09 */
> +=09return fifo_timeout_ms + 20;
> +}
> =20
> -=09return max(nsecs_to_jiffies(fifo_timeout), 1UL);
> +static inline unsigned long uart_fifo_timeout(struct uart_port *port)
> +{
> +=09return msecs_to_jiffies(uart_fifo_timeout_ms(port));
>  }

Hi,

This is definitely towards the right direction! However, it now does=20
double conversion, first div_u64() and then msecs_to_jiffies(). Perhaps it=
=20
would be better to retain the nsecs version (maybe rename it to _ns for=20
consistency) and add _ms variant that does the nsec -> msec conversion.

--=20
 i.

--8323328-260151195-1718177888=:1312--

