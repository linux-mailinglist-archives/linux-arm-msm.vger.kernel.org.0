Return-Path: <linux-arm-msm+bounces-57165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A67AAE2F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C7718847C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC2A21D5A7;
	Wed,  7 May 2025 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rKlEdAv9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6B623;
	Wed,  7 May 2025 14:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627839; cv=none; b=KF/nwreA+r0ZLUAYx4O/VMgMZBSxNvuERbQ83yMYcI/9oUGq3cIKpFOCtPIcVVqo/wHZC4k8DoRKLsYM2u3JLbU4Bibu9t+0nT33duVPhUhu581riVmTRYs6l/aAhjc8mJf2qJCKRu/OWUQmOWnJW7sHtr9ogKbz7yINydWW3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627839; c=relaxed/simple;
	bh=Uv0EcW7glq4I2xOqbyY8pJU9J0d/EtIXL20dRyfGk7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3CoCxRMpmcIow7mfm/WIT+ZynN7pXmonn/LPN/tBfELk1+TGYtUxvYBo7BhCbGbcFEXZAwRJkXo2ew8+80ZZyYtVVNLQ3QzJuTclZvdCCje6XyrD3DYWy0DOQLyM9kZSQH3td1GR6EMJfb3wd21STFNu7YGBW9CqStdwPrsksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rKlEdAv9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZYAy8h3huPEqHikgnxaieN04K7WhSCqt1OYSqSWNRlE=; b=rKlEdAv9rte4tbESf+4ajtYyGO
	pATDuP6V8vr/V+uSDUo/e0JB1BezeHdUqzDGYjZn1q/NtDJNp9LnqErexEXf1sLKWbQvMx5SwhK91
	NrnF1ryuC8HUGCACQbdP7jEQ9Q33dVADukzJM3nsrsCZ5C42JHvCCoxLNzBB5Pg5li1c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uCfge-00BtPO-Nq; Wed, 07 May 2025 16:23:52 +0200
Date: Wed, 7 May 2025 16:23:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kernel@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sa8775p: Add ethernet card for
 ride & ride-r3
Message-ID: <c445043d-2289-455d-af62-b18704bab749@lunn.ch>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
 <20250507065116.353114-4-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507065116.353114-4-quic_wasimn@quicinc.com>

> +&ethernet0 {
> +	phy-handle = <&sgmii_phy0>;
> +	phy-mode = "sgmii";
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <1000>;

SGMII can only go up to 1000, so why is this property needed?

> +&ethernet0 {
> +	phy-handle = <&hsgmii_phy0>;
> +	phy-mode = "2500base-x";
> +
> +	pinctrl-0 = <&ethernet0_default>;
> +	pinctrl-names = "default";
> +
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,ps-speed = <1000>;

This looks odd. 2500Base-X, yet 1000?

	Andrew

