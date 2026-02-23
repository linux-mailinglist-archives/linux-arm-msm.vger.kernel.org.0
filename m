Return-Path: <linux-arm-msm+bounces-93665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FwpNDk7nGlCBgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:34:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 184AE175927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 12:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9CEF3052B8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02947361DC0;
	Mon, 23 Feb 2026 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jtvUPGtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F30036167D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846347; cv=pass; b=TwsPkkylitWDFMyqCCtM4Yll9y9+YTlqS4a+b6ey9pIk+/Aw0XO5rskTskh0TXYKeK0UtkCKKdHsgNLBFaNHGzNGGQuHfYIBI1aUQmpO9/3F4hNxf660sSw+5Wy+L8AI9gL+VNgb3FAW89AAa+yJuZ2sTkGRqEvQu/aZidX7Ojs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846347; c=relaxed/simple;
	bh=uHtxhZgqkvvhkDixZGvThzOeJrJuPZvcOjfb03f5dzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oV9VT6fsEwCtRn2MGKCBcBnvlEYTzb9/JiTrb116QDATfk3hPVNHRMaVC13P2/6MtoOf8J4jiqlOizUMfck06yvMHRDENaWHalTiIJD7G4+wYCCb9PUkQmmlF45m0OKXSyuMte++YpKax6GPaoQikKBa36A9SVTnwmgDsoelr6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jtvUPGtb; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-649df393c04so3535494d50.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 03:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846345; cv=none;
        d=google.com; s=arc-20240605;
        b=hpzITmdeUtgFNGpEaX35ug4mRG6ktkOa73WYTj3w63d0dI2T6EbSFrzB++9Aoqqwz+
         c4nBiobF6tCz3C29qUPs9fha0jbB0SFnuyxsvrSe6CQlLIh2d+S1xFHy8ZA+DJ2ra6Ve
         lT2ySzc2mxdZx65+2d1XHkdbsXF/hNS3v/FMTPEW00+0J7sVy7KuClziYHdP2/QoLhCy
         aI7uimXr8qKDusNcJURpxTs8P62eQ8Bo/rtUXAD/QaQ2bsvLBQ8JhD2eJiZagL4qZeCM
         0xhgi3iB1roM6VVqDoF2t7qwRIYFig3tfK1VPge3keFIF1GH1rtlv5OL0/aMwuD+xOhn
         Tgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        fh=WrmpnfomGSaO4h4QaTmHo7nY7ORBiy8PFdL8g8oISLI=;
        b=MTWd+15G6nuD1DHi/LOo7IHkcjx580zvzjTvv2SpMiIvarnP388h6llIpxCidolOkM
         74yqhrleUfp/LOHPzQCNGiqnEj3vow3ySoOiLZEdx73f9bC3ZTt5DqCiUY4bBDhYmwOB
         DjBIc1Qt+xhj/74/hZN4uNn6vExtlpbWKN6oO/6XiT5mW48mwibJ1GIkXicsTFdboED9
         HetybAw2EFrTjd3MkwEPBJO+vzV6lEYUn0ZcGQ8OcAcg0/QXFK8EwbvfN+E5dh7QRHIl
         ORADMtshOGf/msyZQnSaE0qwKGSpRfcAXlcAAe5lyzp7i/pWgz5CLTMnqWfH3CopDQIu
         QniA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1771846345; x=1772451145; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=jtvUPGtbU2Wj3IxSdHVfaI7AQSst6+thnd2ba2zTb/HK23eB0wcplM4TJf5noWT8j1
         ge8ldNisA1GAvbE06Pm7tTe59J+DICve1TZzAcm+hcDMBSbqidGhRGyoChKHP5qz0N94
         6lPKDePnGkuhwYSW4jfj5UxApMpW6AVdVO3pHkW3BdL8kRZ+nZu6JbCIi6Dg3KAfr9c1
         NteUpZJJ/x71K8cFUedwQDypq1yxKjEGLc4tOKm9MCsZYKOPt72K70b+vt9xb7x1CYy6
         SElcFIvERsf7RiLwck3t7NjFJolmQ3rbFhdthU0HhXs5EfxgOnQXYv/T53AlWotxAmvu
         y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846345; x=1772451145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=u+S3zAZrEYnB4YEuUbh7Mpo2nXnQv7Z4nPAqZMfP7vlpARzYFhATq28JTDF1v4Wzb5
         +RGcA6U/ruZNxnTBFmWc41DAisXe7LCoWFBVnL2EJdRyqAc2eMzt0yaKSUKWQHpLv6TH
         Bsiqqk7LxbAMc/0UP+GcRJ5OtVuGyDIOI9p0I6yVlnbKQctRq9oDMrEyTXUGOpQFiZmV
         QGwL3DorQ/zUvpgpSsHWwOpfiE9bLPEa7vaNkI2mp0jaxXFDSbcrOl1TEleegxlKCwwA
         Nt8ORYEca1uvnpPzPfpXNMTDD6zZ4QBMyBoD7Dus7X6pfhRVyvv2AczmYbz3w5KLXdnU
         kIog==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZgZGFgmkuFo8mo4P8PAcSVvM7sCe8py+Ub5U9J/8Ot03shtqnCdWgILvH5CeBUfEaOoxDY/XxLFarkvh@vger.kernel.org
X-Gm-Message-State: AOJu0YwyLHoZcFzqtKEvg8yGIg+8UUjllZSvyDAol4MH9998hAwjVIOA
	zqWUOa8UWFSQLCMqreW/l0n0dRajYk2Zn/Mx2Wj62IyCcrnazRTWrFw4BCq6e9XBjfnuH2KQoJB
	wxL9duf9Y71+yT8ppD3FBpXIFYvk8ALgIfv7VDH8+CQ==
X-Gm-Gg: ATEYQzy71+2hyhK6+WNjggB4EvmirfZAZiQ0or3WKNilcZnqhiphiRqeuOuCvUDHuRl
	QZRkZvW47qdy+dCaKgOWGmjpWcRV13uQWHFG5sLOzQ+VLMYUBIyPt2f0XMY6o02a+ArzYRkbs5p
	Ukqv9aym82EP+k1efoHBXbNm7pxG/xGBATab/1eex6NgW6cXcOkhtTxu2UfkjuK6oHlBVwndTGB
	yiDEMqkMH385PW886+in64oYdecBDZx1F6WVC+oaiivMyjAt0Lmpd2FSGuiBCdtXld8n4tpjpWU
	ryPHeZAl/Ueqgo5G+E3bkX2ErTI4bmfflIY5jQ==
X-Received: by 2002:a05:690e:1601:b0:63f:a7dc:5661 with SMTP id
 956f58d0204a3-64c789c7e4dmr4751859d50.12.1771846345547; Mon, 23 Feb 2026
 03:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com> <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Feb 2026 11:32:11 +0000
X-Gm-Features: AaiRm53g18kb_D8a8Rz5gsK9_gN4L3-bPSeoZhzvicFe1V_X2f1sAQaShwQ_SAw
Message-ID: <CAPY8ntDgMHgjX65ZW8dFvo5jb+yZDUQq6cEJuw=zP6DddmTPrQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93665-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,raspberrypi.com:email,raspberrypi.com:dkim]
X-Rspamd-Queue-Id: 184AE175927
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 09:07, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

When used alongside [PATCH v2 01/12] i2c: allow setting the parent
device and OF node through the adapter struct:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>         snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
>                  of_node_full_name(pdev->dev.of_node));
>         adap->algo = &bcm2835_i2c_algo;
> -       adap->dev.parent = &pdev->dev;
> -       adap->dev.of_node = pdev->dev.of_node;
> +       adap->parent = &pdev->dev;
> +       adap->of_node = pdev->dev.of_node;
>         adap->quirks = of_device_get_match_data(&pdev->dev);
>
>         /*
>
> --
> 2.47.3
>
>

