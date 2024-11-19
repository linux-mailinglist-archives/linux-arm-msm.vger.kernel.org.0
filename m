Return-Path: <linux-arm-msm+bounces-38261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FA9D1D43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 02:27:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 020DB28260C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 01:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA932D047;
	Tue, 19 Nov 2024 01:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="E5aQF0UM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104A483CC1;
	Tue, 19 Nov 2024 01:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731979637; cv=none; b=JRbn/YqND/mu0cGXZcyUAeDbGUwD/Xw144+Gf1GNrVluxpvcM4Xfh+X5CP1agTSXIrL/C+3G0boEB7bKvwDQdODdreSeCAJAKaMgxKWHGNISEC2JdGtuISodNjb0TRNmB2ZnR9sT//VmwcGl/NwmpLbYdSyEhk1/j8P0T6pqNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731979637; c=relaxed/simple;
	bh=PE+v4tm16jnBLb+iJ8z174hx/xtzA5LTbTk+9E5XUQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQfS8z8uwvln0m80ZZlxvjRSFBwrbh+XkWx811IAnEmln/2P0WfNPbiGs3QUc+GU48tQ6ypg6GRf5MnsNVwpVyOHF1jrXN1rRhxovz+nZ4YHQIRT9UTzHmzyKq08u0SvXdVfVj3tVfTltUY4DjGg+2dotMep9FNbZiQUIkqcFCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=E5aQF0UM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6Y0+K3PqqIgBny+BhM9cv9Q9ohqYkiNfuQM6ZshMm7c=; b=E5aQF0UM3rjeAM9rCFCv9I6DHK
	LIRCilMCFArYAt4QFK4dDejXULJZwNLqVR8oayk3tqys3oU2aaxyFyAYwzns4mDYgLmCNMHqQCaQW
	1U8ZHxIZ5ULeTBfY0WJPMYTXYFctTfLJaSq+Or2zrLpvFVY58WvYB8cdcxhx+OROOFw4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDD1K-00DjJq-C1; Tue, 19 Nov 2024 02:27:10 +0100
Date: Tue, 19 Nov 2024 02:27:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
Message-ID: <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>

On Mon, Nov 18, 2024 at 02:44:02PM +0800, Yijie Yang wrote:
> Enable the ethernet node, add the phy node and pinctrl for ethernet.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 106 +++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..299be3aa17a0633d808f4b5d32aed946f07d5dfd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -5,6 +5,7 @@
>  /dts-v1/;
>  
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include "qcs615.dtsi"
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS615 Ride";
> @@ -196,6 +197,60 @@ vreg_l17a: ldo17 {
>  	};
>  };
>  
> +&ethernet {
> +	status = "okay";
> +
> +	pinctrl-0 = <&ethernet_defaults>;
> +	pinctrl-names = "default";
> +
> +	phy-handle = <&rgmii_phy>;
> +	phy-mode = "rgmii";

That is unusual. Does the board have extra long clock lines?

> +	max-speed = <1000>;

Why do you have this property? It is normally used to slow the MAC
down because of issues at higher speeds.

	Andrew

