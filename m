Return-Path: <linux-arm-msm+bounces-43317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 276939FC624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 18:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C9AF1882F8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 17:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE5E1946CC;
	Wed, 25 Dec 2024 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="y6TFPv/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740D11F602;
	Wed, 25 Dec 2024 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735148303; cv=none; b=ayQoMZMKuzMkkwUM99xn6Lb+UkBvG0qWXYjwPzKW+140hZXfyxsLFEuoYoM3PPIbm//9d5hCAUdyemUozW+0oFeSS3D2WWk2Y/vQDyKQSTHJ21JdvBwVvIPkLNoCd9DvVmJmdTow2TrKjHCyaLv96HROy9mLAbNlQteMXk7PHlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735148303; c=relaxed/simple;
	bh=BS4xAvRCSi+sKVKeaLNTDAm7a/dPDUXNTB+6zNU68VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H77Izltb6aOw6b7qvk8r0lvDCeDgLqjbiwM39MdVJrnQHuWqiYJjH2NTp5woC7EFPC+svQ7xbgHZEwJpAwQZaBm4M3O2ANZD3Fb6BkY98/+NhAjm6NoNPg/HldfjS2XHJlUGtuFhiZdg7uBlCFtVC/827ES5Voa/qyZEX2+u+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=y6TFPv/Q; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hvdB94uGuCDDuV6epOSyj5t+hu3BSU5GxftGA2HKkN8=; b=y6TFPv/QFV/2euxYDzjACJ+lfX
	4wWj+d17x+R3uO/CWPu8+vtFsTxKvShez12pG1jdB21OCavTShkwZXyQthYMLlbiDGC+7Aexi1Eg9
	9tEZGKslGYt3d1grb29EkB88MckIVtr9vvUGXOuMnoWHS3oJ1/88JIGPMy18515DCvJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQVKb-00G9ut-QF; Wed, 25 Dec 2024 18:38:01 +0100
Date: Wed, 25 Dec 2024 18:38:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable RX
 programmable swap on qcs615-ride
Message-ID: <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>

On Wed, Dec 25, 2024 at 06:04:47PM +0800, Yijie Yang wrote:
> The timing of sampling at the RX side for qcs615-ride needs adjustment.
> It varies from board to board.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -206,6 +206,7 @@ &ethernet {
>  	phy-handle = <&rgmii_phy>;
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
> +	qcom,rx-prog-swap;

I notice this board still has messed up rgmii delays, using phy-mode =
"rgmii", not "rgmii-id". How does com,rx-prog-swap interact with rgmii
delays? Is the sample point logic before or after the rgmii delay
logic in the MAC clock pipeline?

I think i also questioned max-speed = <1000>. Has this
arch/arm64/boot/dts/qcom/qcs615-ride.dts been merged?

	Andrew

