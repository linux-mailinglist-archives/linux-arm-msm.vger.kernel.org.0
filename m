Return-Path: <linux-arm-msm+bounces-43316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B889FC605
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 17:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF654163427
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Dec 2024 16:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDFE13C8F3;
	Wed, 25 Dec 2024 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="54rP/aYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810632F22;
	Wed, 25 Dec 2024 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735143508; cv=none; b=FQg0FsUW37c+ICg+GbgtM7crKdifgtnN7YRBTsqMRjznm8q+v+MlFV1D8yMzc2NaY01TzqNbb9bcBZ90+dLZwXTX3I2EKtawhJJJfZQRpf4ejysLbBg0R9KvEfa+GOQaw6sJsT0MqRrm/rc//NKQDose0UHYnTnyAcfJj309I2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735143508; c=relaxed/simple;
	bh=lYfy70MFOiBlMAhT6eFoBKDQJZXSLFUoDj/b06PP9c8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WJPvdhOA3c6Oq2rNvgjJvY6IANiighq7YQrOCsCfuhDoVT8h5ywNTxeSsENtbldRWPjSskO3mDlJy7K7IsBVUHlAbI7yyJuDQWW3dJTBLAXr2DeUpeU+sfwfldzEPL1SeDUdDLEVII36EeP3nO1H25L/F8bopP39O+2KXguReD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=54rP/aYG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=01kBf3ZtYZAZFdW30J7jiQp5pkxNM+rlULdLXVbsmjE=; b=54rP/aYGBYh8A8aCGPa5oma5ks
	W1mmnUrePT7UYznxMeofwh5KUQe+EKmTZbiP73w3lOAyCBboknBoPgwAV0zk/vis8auWd9+HRTJdH
	ZrI8szYrO5oHeVcSuKJ5bjwxM4ShRpkibJg9KzL0/hj8iVg++6QGMhrmppBDJ2aHywOc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQU57-00G958-AA; Wed, 25 Dec 2024 17:17:57 +0100
Date: Wed, 25 Dec 2024 17:17:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
Message-ID: <c0bcf78f-409c-4992-99de-5e91a8f134e5@lunn.ch>
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
 <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
 <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f68524de-7a56-4cc6-a9ab-13dbae0ee0e5@quicinc.com>

On Wed, Dec 25, 2024 at 04:58:20PM +0800, Yijie Yang wrote:
> 
> 
> On 2024-12-24 17:02, Krzysztof Kozlowski wrote:
> > On 24/12/2024 04:07, Yijie Yang wrote:
> > > The core version of EMAC on qcs615 has minor differences compared to that
> > > on sm8150. During the bring-up routine, the loopback bit needs to be set,
> > > and the Power-On Reset (POR) status of the registers isn't entirely
> > > consistent with sm8150 either.
> > > Therefore, it should be treated as a separate entity rather than a
> > > fallback option.
> > 
> > ... and explanation of ABI impact? You were asked about this last time,
> > so this is supposed to end up here.
> 
> I actually replied to this query last time, but maybe it wasn't clear.
> Firstly, no one is using Ethernet on this platform yet. Secondly, the
> previous fallback to sm8150 is incorrect and causes packet loss. Instead, it
> should fall back to qcs404.

One of the purposes of the commit message is to answer questions
reviews might have. You were even asked this question, so that should
of been a clue to include the answer in the commit message.

	Andrew

