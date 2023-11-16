Return-Path: <linux-arm-msm+bounces-818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DA97EE5AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8547281036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 17:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485F948CE3;
	Thu, 16 Nov 2023 17:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="un0jR6kz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E011A5;
	Thu, 16 Nov 2023 09:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=c8vB4X1wS0Xik8ZCY6EIC5iiaJP9c/o2MyPjwsHoYSU=; b=un0jR6kzNLHN8HHHdXQQeRZPJc
	ClsrvgXKK6nD+STDPtgygS+Fw3HzGDg+li6J3zv2FChj1AyP6jb9SUiKx1p/8FkAB9WNlWpIcO8b4
	7wMi4VjrWyfMwdVuwQ5X4zPlCWWjCm7y6tuGic/z305JaUFfmSYBv6fPCa+GJZ7cdNIk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3fqy-000NGp-TN; Thu, 16 Nov 2023 18:08:32 +0100
Date: Thu, 16 Nov 2023 18:08:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Robert Marko <robert.marko@sartura.hr>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
	andersson@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com
Subject: Re: [PATCH 8/9] net: mdio: ipq4019: add qca8084 configurations
Message-ID: <f5da6540-e532-4b83-890d-2ffdf4bf6fcc@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-9-quic_luoj@quicinc.com>
 <a1954855-f82d-434b-afd1-aa05c7a1b39b@lunn.ch>
 <cb4131d1-534d-4412-a562-fb26edfea0d1@linaro.org>
 <CA+HBbNGnEneK8S+dZM6iS+C8jFnEtg4Wpe2tBBoP+Y_H0ZmyWA@mail.gmail.com>
 <d677e73a-5ca2-4034-9b4b-1e6140601066@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d677e73a-5ca2-4034-9b4b-1e6140601066@quicinc.com>

> Yes, the clock driver of qca8084 is probed as the MDIO device, the
> configuration sequence here to lighten the qca8084 PHY need to
> be completed before the clock APIs available to call.

Please cleanly separate clock from MDIO. The MDIO driver should only
use the common clock framework API calls. If the clock driver is not
loaded yet, trying to get a clock should return -EPROBE_DEFER. The
MDIO driver should return that from its probe function. The driver
core will then try to probe the MDIO driver later, by which time the
clock driver should of loaded.

      Andrew

