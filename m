Return-Path: <linux-arm-msm+bounces-45706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED688A182C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 18:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4EE3ABEBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 17:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010C31F4E37;
	Tue, 21 Jan 2025 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GRXxJQ4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001371F4727;
	Tue, 21 Jan 2025 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737480054; cv=none; b=iaTKwdgS7o4HXuc4nyq8GvD6wIneXpi8ex3rpUM4LX5KhSLhySVoEtfsSIWQIq/qFDai5OQOHxTqAyfxl+QeUVvGf7ZtkDrBcSlYURiS6lLfForYRnywPmMPzevUg43YO3Y4Wozdv8ms+7Vt63+HUAd53FNRWJ8NzMLVrjQ+dNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737480054; c=relaxed/simple;
	bh=awQsp/zga7f9a/85M78VuqjOd6AVQILOYmdeMCjgkoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lj6envgAArS/ls1hqry5nPDsA4xjNrhXeaG6O3Zd6EtBBVR21W+L11vTsVgXb2rpIXR3uRBvoKCGO42tcTuBZduyj0eObhHRnkUKio1ic9sS4BaaShq4ngKQOPB5r4EdMTBVESgj5n+2rOMVQtvwh/Goj3mN0UckBg32Vb/WJfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GRXxJQ4L; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cfxHIP2j1h5TjSDYNb52YqchEUxPxLg0EzNjEnekIY0=; b=GRXxJQ4LdAcU77S49gb/McXylm
	wGu48QsKPDJ8A3s6VtzXXKTgxQbxucgXzN7JzcOtUs9RE17Yn75khm2QFbQAAry5YXLmqLYV+PIKk
	QdT4sOMZxW0v83+CJcFsiLPxF55e1E/elrHpvCHmimZjErMJ9ymcDd+SCNi9NSmNw1r4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taHvZ-006hXW-Kq; Tue, 21 Jan 2025 18:20:37 +0100
Date: Tue, 21 Jan 2025 18:20:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/4] net: stmmac: dwmac-qcom-ethqos: Mask PHY mode if
 configured with rgmii-id
Message-ID: <717d77d1-43a4-4914-8d7d-a70c89cb1822@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-dts_qcs615-v3-2-fa4496950d8a@quicinc.com>

On Tue, Jan 21, 2025 at 03:54:54PM +0800, Yijie Yang wrote:
> The Qualcomm board always chooses the MAC to provide the delay instead of
> the PHY, which is completely opposite to the suggestion of the Linux
> kernel. The usage of phy-mode in legacy DTS was also incorrect. Change the
> phy_mode passed from the DTS to the driver from PHY_INTERFACE_MODE_RGMII_ID
> to PHY_INTERFACE_MODE_RGMII to ensure correct operation and adherence to
> the definition.
> To address the ABI compatibility issue between the kernel and DTS caused by
> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
> code, as it is the only legacy board that mistakenly uses the 'rgmii'
> phy-mode.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2a5b38723635b5ef9233ca4709e99dd5ddf06b77..e228a62723e221d58d8c4f104109e0dcf682d06d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -401,14 +401,11 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev = &ethqos->pdev->dev;
> -	int phase_shift;
> +	int phase_shift = 0;
>  	int loopback;
>  
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */

Please think about this comment.

       Andrew

