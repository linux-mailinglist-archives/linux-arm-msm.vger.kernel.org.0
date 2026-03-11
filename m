Return-Path: <linux-arm-msm+bounces-97037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGE1Fv6ksWn4EAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:23:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD6267F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E711E3167B77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8AC304972;
	Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iI3/lJ1A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CE53009DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249496; cv=none; b=Q5J21qTh2x0Isc6urKvoHQLuuFO1EdpDGQ2MZCnWEg4r8qC53YTtTrFfH+ZpQOgDb1aNq6tuY/a19eCNmkiW5kHdGNqmdTXvKFaEOG3NfUohiQ8nYaFQADQnKvP0Bpwvzp9ZnaSERdk4PX6pVJKtLKsBQ5UbEwzi3EBX0ZDXnl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249496; c=relaxed/simple;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6yRtjiALppEsNOMIbTZ+dR8nIxyyvbz+HlEErGXQL11/ASwVZPXSlAMT6/qzN8OryicxBRlNT8MgaDjDxi0NHQJ879lpoMJ1xedtU9wYsFK1zKVYkh5c/lRCGHZct7aBu7RFwoR+SAA6oPQcUX3PNcdogb6dH1iFFlM6KSiBN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iI3/lJ1A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C15C19425
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249496;
	bh=OE84FjPfiUkC8JcC39aOGaWlIrdgv9W7fbDtR0GeE+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iI3/lJ1AQxBpOoKbjorbok0yM+cC5+ZfVtlCq8Wa75WAnPRUVxfTomE36pME1zAr7
	 r052TY9iZh0GoCqL2pamDmeFQJSjB2pwhuZY0PdNBAx3SrN2Wzw/lL0dQWtWJkjI9c
	 M2uaUbhYwnyiniJnKGa4WDW3lXldtWVxL5/qkk8VN9fA1kKRfUP3DZW7t+N4XIiPnr
	 r+c7hYYO3vf6H9EdlqOFqxu0kMl7CUhnoIKMWJ8pNfGLzvitoFUbQoAlOBtjzCJgAc
	 xmifdmJI6zK+T5101InfsaE8XXb3060UDCourC3gX1PEgUOWCxj+zVEN5sdEnAnJs9
	 zz0luOwBU3p3w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a1362c9a3cso184861e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:18:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3OEOO35Jd+ng6NaJxnNEsX6gx3ZeBVZgKxpiPX5kB3yoJEFLUGTFWdHdY4FWXrNPrCD+qQ1hiqNE1T6Wb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0c4MaOMVZXvBvRjgwF/Mo3rKQPSDvEsmrPNbHjV1wDQqPHcg
	R7psLz6cuL5tdbj3ikjDmmq9+5uJmmty4GQBmyzhOb/4XjHkGaYns67HSBQkLulb8k6mR4sOHd1
	1mQQWqAh0ZX0larwCGWBuI6X/HLywuZ2qrL2QXAu3zg==
X-Received: by 2002:a05:651c:1604:b0:38a:957:a125 with SMTP id
 38308e7fff4ca-38a67e1ba60mr11617111fa.18.1773249494042; Wed, 11 Mar 2026
 10:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
 <20260311-qcom-sa8255p-emac-v8-2-58227bcf1018@oss.qualcomm.com> <abGizL-uYnahlcEt@shell.armlinux.org.uk>
In-Reply-To: <abGizL-uYnahlcEt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 11 Mar 2026 18:18:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
X-Gm-Features: AaiRm52Tw2Qo9qa62t56mCoewk4vwmQ4zN4g67WY5ySxyBb-ueDnRqCKEIOABSM
Message-ID: <CAMRc=MdOXz6a4+-xNfmHD9insd+UcyF9xvZim7DtptKOj9B70Q@mail.gmail.com>
Subject: Re: [PATCH net-next v8 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97037-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,armlinux.org.uk:email,qualcomm.com:email,linaro.org:email]
X-Rspamd-Queue-Id: E1BD6267F80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 6:14=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Wed, Mar 11, 2026 at 06:03:37PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > In order to drop the dependency on CONFIG_OF, convert all device proper=
ty
> > getters from OF-specific to generic device properties and stop pulling
> > in any linux/of.h symbols.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> Please postpone this for the time being - I'm trying to get stmmac's
> pain-in-the-arse PCS support sorted, and I've patch series out there
> and pending that make a large number of changes to this driver. This
> is likely to conflict with my work.
>
> I'm limited by the rate at which patches can be applied to net-next
> and the rate at which Mohd can provide me feedback. On that, I notice
> you haven't Cc'd Mohd who is now in MAINTAINERS for qcom-ethqos.
>

Do these two changesets interact with each other a lot? Do you have a
WIP branch I could take a look at? This has been post-poned several
times already, there always seem to be some new changes coming in. :/

Bart

