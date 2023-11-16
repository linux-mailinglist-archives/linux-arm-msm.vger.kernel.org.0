Return-Path: <linux-arm-msm+bounces-820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFC7EE5D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5371C209C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 17:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362EA35883;
	Thu, 16 Nov 2023 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Cymw9iWC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A308F101;
	Thu, 16 Nov 2023 09:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kK3KutISbyzM/gZLq4IFiwimjsmvHKjNrd1uA1A3zdk=; b=Cymw9iWCOK3pJBrbiAyPOtls8Y
	RFFPgN0hIKnaOnVu0b2o52K1veB+NB7Y5os8q3N+Ckf55ZTL9qZQWPMg5k5FBMNcaMX4XuT0Bfy9H
	2W/x9f6h+sD3gqaoJ+tnwhp7MsWCEspFf9oK0sx7AZKfHXZuGLTOyjDzBGsJEQd89F4g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3g2p-000NKU-Pf; Thu, 16 Nov 2023 18:20:47 +0100
Date: Thu, 16 Nov 2023 18:20:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 3/9] net: mdio: ipq4019: Enable GPIO reset for ipq5332
 platform
Message-ID: <dd2c3cfa-f7ee-4abb-9eff-2aac04fa914f@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-4-quic_luoj@quicinc.com>
 <e740a206-37af-49b1-a6b6-baa3c99165c0@lunn.ch>
 <33246b49-2579-4889-9fcb-babec5003a88@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33246b49-2579-4889-9fcb-babec5003a88@quicinc.com>

> FYI, here is the sequence to bring up qca8084.
> a. enable clock output to qca8084.
> b. do gpio reset of qca8084.
> c. customize MDIO address and initialization configurations.
> d. the PHY ID can be acquired.

This all sounds like it is specific to the qca8084, so it should be in
the driver for the qca8084.

Its been pointed out you can get the driver to load by using the PHY
ID in the compatible. You want the SoC clock driver to export a CCF
clock, which the PHY driver can use. The PHY driver should also be
able to get the GPIO. So i think the PHY driver can do all this.

     Andrew

