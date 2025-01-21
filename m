Return-Path: <linux-arm-msm+bounces-45705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6FA18299
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 18:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCEDB3A11D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 17:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B161F4E40;
	Tue, 21 Jan 2025 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qmQUQ2NA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3E1F4727;
	Tue, 21 Jan 2025 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737479424; cv=none; b=MBNu/vYAckMaZCLRvnQiQhMm2ieBFBkWjAOz9g9ip48o6lXyqOxLMZPnMfULQoeyPoJtZv0b9akqU6yByKqB9xnOZLDgRJ32QpV1PEyK6Km2+paUXnQgmwzV+DgSLLMG4CMEKtN2LotN1Cb1fxKmkPvhvgzGsjxRA363XCaAtsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737479424; c=relaxed/simple;
	bh=7KLqRXRtMpr5AnWCzUsc49VsnLV6+/Ya1LYZn3o+X+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB7YDeZH3z3u0LFM2aqx3E3yW9upekbJQcHQtKGDjenRy4Q+XIT473ybCvSKqoP84EVbPP8ABYezrR4UoFy0ziJIHiFfjbIZNX65UjMS3zMC+ZbC5TK0bJ7oXISlgUhnWSWuyGvIcNmTUlz1z2EkGeUQn5OUNYoTjKYK97K5YJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qmQUQ2NA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=mvXQbcqOWygs/VwootWLBvcI0ZEs6gJWfjd2kJrIlyU=; b=qmQUQ2NAHWeZVwh3xqOrkfTZvj
	yprXEINu8P2IOI6rjQdad5/dUMsBqMAdq6cCOtYFah+JRTp2FLP2i5oRuWAVob33pd9O+FCQhSoCH
	fEk2z7/apymzPOiQLQziaXnJG0ht92ACKoorlOm8CZTEU/+eihGM2wJSPvO3GM4nc4/g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taHlS-006hNS-3y; Tue, 21 Jan 2025 18:10:10 +0100
Date: Tue, 21 Jan 2025 18:10:10 +0100
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
Message-ID: <bf45ec15-d430-499a-ba30-825611369402@lunn.ch>
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

> To address the ABI compatibility issue between the kernel and DTS caused by
> this change, handle the compatible string 'qcom,qcs404-evb-4000' in the
> code, as it is the only legacy board that mistakenly uses the 'rgmii'
> phy-mode.

Are you saying every other board DT got this correct? How do you know
that? Was this SoC never shipped to anybody, so the only possible
board is the QCOM RDK which never left the lab?

I doubt this is true, so you are probably breaking out of tree
boards. We care less about out of tree boards, but we also don't
needlessly break them.

	Andrew

