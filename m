Return-Path: <linux-arm-msm+bounces-48397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2193A3A207
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F5961767C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 16:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D4A26A1D5;
	Tue, 18 Feb 2025 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="b8Pxa+hl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5C19F10A;
	Tue, 18 Feb 2025 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894569; cv=none; b=BKOak3DSF2PZgnYJsHOA7TFbu1NScIkXXmTx+yKaQGxoSZh9eglUDlUVvUpHdGczBFURdVFPO/rp0WtFnFM3Yef4lmRmiEPuDgmqZ0BIQ2uoH9X0EeIwGsJehAKJJwUR6bdaLuHKy7q7CYuPM4yFxjJ1pG8Tom+xWTQ1ap3pXYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894569; c=relaxed/simple;
	bh=hoOLBsJ+hY29lEPbNQtE2/Tj6ycmvBXj4JoD/XOH1OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evTFz2fr5xLGU7ggpYMdlsXo7Gyw6PRs1STG0yjxgJ8lmOgEYHlSXjDPrh1cjrJ3VyMs4z642MHoIKWWZDt54dudpREjiwM5Agy1iUtFcdmO8KVf7Ql610fZa2J2VdyaieZWAboLnjvMXtJ+vEBDW29FosTo2dpFkiKRlcUOskM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=b8Pxa+hl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iZeu6krTMthi8CUDyl1NRXj5ixOnKRmLYoBYxiHjuLU=; b=b8Pxa+hlyS+/K78vlE0kqLbK8q
	cvWQ/hHvvOGNj3k8R2I3d7D9ijLWH+CfsbUUL4BAXb/CrtTOqp8QCdghSDwbzCpadN8mOvL1ml7d5
	8UyDbPy5u379laIruCH49wbxFBMCYuXPLAG/e/VBwOEoOno2uFaPP21gTtRut4MMJlwY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tkQ3D-00FLM1-RT; Tue, 18 Feb 2025 17:02:23 +0100
Date: Tue, 18 Feb 2025 17:02:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/3] net: stmmac: remove useless priv->flow_ctrl
Message-ID: <77f72c87-924d-4478-a9b2-0f14673e5481@lunn.ch>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
 <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tkKmI-004ObG-DL@rmk-PC.armlinux.org.uk>

On Tue, Feb 18, 2025 at 10:24:34AM +0000, Russell King (Oracle) wrote:
> priv->flow_ctrl is only accessed by stmmac_main.c, and the only place
> that it is read is in stmmac_mac_flow_ctrl(). This function is only
> called from stmmac_mac_link_up() which always sets priv->flow_ctrl
> immediately before calling this function.
> 
> Therefore, initialising this at probe time is ineffectual because it
> will always be overwritten before it's read. As such, the "flow_ctrl"
> module parameter has been useless for some time. Rather than remove
> the module parameter, which would risk module load failure, change the
> description to indicate that it is obsolete, and warn if it is set by
> userspace.
> 
> Moreover, storing the value in the stmmac_priv has no benefit as it's
> set and then immediately read stmmac_mac_flow_ctrl(). Instead, pass it
> as a parameter to this function..
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

