Return-Path: <linux-arm-msm+bounces-34205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57899B8FD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 11:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 979B7280E8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 09:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE66130ADA;
	Sun, 13 Oct 2024 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GK3LqFg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876BB231CB9;
	Sun, 13 Oct 2024 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728813205; cv=none; b=RnviQaYiReD1XFC7ThwaOHdeFKjVegkKMA1Jzjtq2A1DF6Uty5sNm82Hy5Ev8GO3l3bSV+6HKmBQXNGCvXWkQnNaaWS4CWNP8iWGwB4t7OrO7NbRhgrAbcI5WWk9U6ni+X97UvWYYn5U8nZ6UHKf4kRNRQUf29UbN/wh6/yW6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728813205; c=relaxed/simple;
	bh=UnjVHzXxbyrm6dBNgzmBWG95oOhZhEuahhTR4t6B0TM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrg+bN7XHo0aWkOODMxMmsOdLGJyPSGbcKYWBeU/3vVimD0C5ewUWGNxlr/7vJuXt4lwv5ypzhD4UxoM0hHxPD5sQqeJZKvSZmN7mNCahTJz+VTVPCPnPub3ylKeA21YY6DOXQKTCi6knEkWwDqPTzUgpM7WnH1M82Sre2xsUTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GK3LqFg6; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1728813204; x=1760349204;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UnjVHzXxbyrm6dBNgzmBWG95oOhZhEuahhTR4t6B0TM=;
  b=GK3LqFg6CzUOtEdmkZkm8bggwwp5F/d6uCksIBzCmIGg341ZL3dDxwbO
   k/ElD+EtVowitMEXuUJC2UtYmrdTXIh9cyYXc0msfvgov06J+NHt2wgGL
   EQtvbWH6/tSOHbhIXokijVSIyN5vl9tHQPiycNnYsOPIPB/+7zGBHVRwM
   ygu7Z2C9rCwkdn6FLRJ+AlP9atSnko3Uq73eEi7HVrPEA07BBHWIQhwNe
   kXAEQ7LKVOY1c0/0qBzYJCmk8HXZF+rRsMTTQYJXm2YV0r3eZk+4lPIWG
   EeZsaCWLmC1yBZ2NlaGpz51t07u7Cs1WdhNRPkbp8D1KRqthGlhZhCV0x
   w==;
X-CSE-ConnectionGUID: WbtJBVtfTFKCjrEfhWFFuQ==
X-CSE-MsgGUID: RTC9G46iT7KBEuwPZLnxug==
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="264005111"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Oct 2024 02:53:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 13 Oct 2024 02:52:36 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 13 Oct 2024 02:52:32 -0700
Date: Sun, 13 Oct 2024 09:52:31 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Simon Horman <horms@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn
	<andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
	<olteanv@gmail.com>, Richard Cochran <richardcochran@gmail.com>, Jiawen Wu
	<jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Carl Vanderlip
	<quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH net-next 1/3] net: dsa: microchip: copy string using
 strscpy
Message-ID: <20241013095231.qoy3aa5zvrftezso@DEN-DL-M70577>
References: <20241011-string-thing-v1-0-acc506568033@kernel.org>
 <20241011-string-thing-v1-1-acc506568033@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011-string-thing-v1-1-acc506568033@kernel.org>

> Prior to this patch ksz_ptp_msg_irq_setup() uses snprintf() to copy
> strings. It does so by passing strings as the format argument of
> snprintf(). This appears to be safe, due to the absence of format
> specifiers in the strings, which are declared within the same function.
> But nonetheless GCC 14 warns about it:
> 
> .../ksz_ptp.c:1109:55: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>  1109 |         snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
>       |                                                              ^~~~~~~
> .../ksz_ptp.c:1109:55: note: treat the string as an argument to avoid this
>  1109 |         snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
>       |                                                              ^
>       |                                                              "%s",
> 
> As what we are really dealing with here is a string copy, it seems make
> sense to use a function designed for this purpose. In this case null
> padding is not required, so strscpy is appropriate. And as the
> destination is an array, the 2-argument variant may be used.

.. is an array - and of fixed size.

> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/net/dsa/microchip/ksz_ptp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/microchip/ksz_ptp.c b/drivers/net/dsa/microchip/ksz_ptp.c
> index 050f17c43ef6..22fb9ef4645c 100644
> --- a/drivers/net/dsa/microchip/ksz_ptp.c
> +++ b/drivers/net/dsa/microchip/ksz_ptp.c
> @@ -1106,7 +1106,7 @@ static int ksz_ptp_msg_irq_setup(struct ksz_port *port, u8 n)
>         ptpmsg_irq->port = port;
>         ptpmsg_irq->ts_reg = ops->get_port_addr(port->num, ts_reg[n]);
> 
> -       snprintf(ptpmsg_irq->name, sizeof(ptpmsg_irq->name), name[n]);
> +       strscpy(ptpmsg_irq->name, name[n]);
> 
>         ptpmsg_irq->num = irq_find_mapping(port->ptpirq.domain, n);
>         if (ptpmsg_irq->num < 0)
> 
> --
> 2.45.2
>

This looks good to me.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>


