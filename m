Return-Path: <linux-arm-msm+bounces-722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1787EC85E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 17:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F06211C20B28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 16:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E004A381C4;
	Wed, 15 Nov 2023 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dEs/btBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C73433A3;
	Wed, 15 Nov 2023 16:20:49 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E5383;
	Wed, 15 Nov 2023 08:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HjMGtAWlI6NNP5jROiIoyiKMD75XVpPi+x0nNdZtPXw=; b=dEs/btBKekmWJLlAvxYc66JX0I
	/uuyW+cTiW/O8WA3+ByGQZHqgB817T2KuBqW5itSaLH4WqpGKmKLg+R4Fs/fvFcwTWLyZSjEALKfZ
	Jh28DZfUqD+kyHvDZxFSZ7Ckxj+KqwiWEDWxpNOpfYSoJ1AUFaQVPB1jAjMAxe1xe4X4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3Id6-000GKx-GG; Wed, 15 Nov 2023 17:20:40 +0100
Date: Wed, 15 Nov 2023 17:20:40 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 8/9] net: mdio: ipq4019: add qca8084 configurations
Message-ID: <a1954855-f82d-434b-afd1-aa05c7a1b39b@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-9-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115032515.4249-9-quic_luoj@quicinc.com>

On Wed, Nov 15, 2023 at 11:25:14AM +0800, Luo Jie wrote:
> The PHY & PCS clocks need to be enabled and the reset
> sequence needs to be completed to make qca8084 PHY
> probeable by MDIO bus.

Is all this guaranteed to be the same between different boards? Can
the board be wired differently and need a different configuration?

    Andrew

