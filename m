Return-Path: <linux-arm-msm+bounces-1065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 864257F0054
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 16:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78DF51C2048D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Nov 2023 15:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7067D10976;
	Sat, 18 Nov 2023 15:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Qj+1T3Y0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32134196;
	Sat, 18 Nov 2023 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lg2DVX+DTNx+HzFj1UmL3Pguh/3uet6WpCVMj8vb2sk=; b=Qj+1T3Y0gsC6Lx1YtsxOzYFsKq
	RkuHUX2ZCDtfKVW5p4cohpAQv90TMMxhnHf12shcnTY0CihPZ4UELi1Ux2qlAMnofLRGs9YLHmhTw
	rlUGKhsu3nCJCoC6hL72BUORx+Cb1d0a4/qA+tV/VXHQ1IWLxenrEtJpIo3swDfUCuNs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r4NNO-000Vqg-PS; Sat, 18 Nov 2023 16:36:54 +0100
Date: Sat, 18 Nov 2023 16:36:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 9/9] dt-bindings: net: ipq4019-mdio: Document ipq5332
 platform
Message-ID: <6e10604f-d463-499b-b00a-57ef22a936bb@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-10-quic_luoj@quicinc.com>
 <834cbb58-3a88-4ba6-8db6-10440a4d0893@linaro.org>
 <76e081ba-9d5a-41df-9c1b-d782e5656973@quicinc.com>
 <2a9bb683-da73-47af-8800-f14a833e8ee4@linaro.org>
 <386fcee0-1eab-4c0b-8866-a67821a487ee@quicinc.com>
 <77a194cd-d6a4-4c9b-87f5-373ed335528f@linaro.org>
 <de4fa95e-4bc7-438a-94bb-4b31b1b89704@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4fa95e-4bc7-438a-94bb-4b31b1b89704@quicinc.com>

> The clock arguments are provided in the later part as below. i will also
> provide more detail clock names for the new added clocks for the ipq5332
> platform in description.
> 
>   - if:
> 
>       properties:
> 
>         compatible:
> 
>           contains:
> 
>             enum:
> 
>               - qcom,ipq5332-mdio
> 
>     then:
> 
>       properties:
> 
>         clocks:
> 
>           items:
> 
>             - description: MDIO clock source frequency fixed to 100MHZ
> 
>             - description: UNIPHY0 AHB clock source frequency fixed to
> 100MHZ
>             - description: UNIPHY0 SYS clock source frequency fixed to 24MHZ
>             - description: UNIPHY1 AHB clock source frequency fixed to
> 100MHZ
>             - description: UNIPHY1 SYS clock source frequency fixed to 24MHZ

As i said before, the frequency of the clocks does not matter
here. That appears to be the drivers problem. I assume every board
design, with any sort of PHY, needs the same clock configuration?

      Andrew

