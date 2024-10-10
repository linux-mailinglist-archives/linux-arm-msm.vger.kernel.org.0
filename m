Return-Path: <linux-arm-msm+bounces-33774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C705F997CE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 032371C2164D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 06:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082E51A01B8;
	Thu, 10 Oct 2024 06:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsNvJ4bh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5422AEFC;
	Thu, 10 Oct 2024 06:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728540858; cv=none; b=nZvUwikw9hENSIP4mVkoGelEUb+3EzFrPBUloBS1ek+9sBh07/UuuRy/NDcnnD3gJXIE2+ebADdN5sz42mOR9RSAdID19e5R/7YLlKkjFGmJqumUmFpzX5GQWzGV0ijV1E9thWEgttQun26u6XWxbXpNCutswMt9nHQVHZepoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728540858; c=relaxed/simple;
	bh=FxTECZqnW9pNr7u+VgkzICcIxD80UOH9F+iwyPfHBWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zn/mUKs7okNuSLAsJDdxWT02j/6HpstiG2bKOgelI8KAql0W2fbDHFWS7Rp20mLfnKFTcbSxes5cyqStNLmN6H48L1NzTrBNxoZbkEq+jY3AzByHaxbkh3ghp5iYeCG/0A2xlXI9jsdPJWYrVnqxRxXKcGqkBTaaa1w1Pt/uJU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsNvJ4bh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6721C4CEC5;
	Thu, 10 Oct 2024 06:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728540858;
	bh=FxTECZqnW9pNr7u+VgkzICcIxD80UOH9F+iwyPfHBWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsNvJ4bhqoaFr+qMoeKTOn/6ULa7o44aQovUhOImROdI6Dc4ImNyFTxO3UsladSdu
	 X6Z6nCbkBuEYKVgY/255faFJFC/Eqz1DN6An9/2Jz/QuD6w8fTMWFEpKiMvzNLwdYa
	 /a8NgJ1vhetoWpIHJqAyhMYWG/0/ISZ5EVMEdL25mYCV9GclIe23nDft5xa0oVXDxe
	 xrHYf+Nf1HAerGCIC5sD7FR2aCTOutaqxxU1QNWH5JoQmumX2WVAd4FoQGOI+1XzEF
	 MWxIHGAoDyFqhq8MPqKxkDpjb/krTiFGL7XvqvdzzSUFu8HlCw7Uw5rfNlWCHRrvU2
	 UtQpmzaoO39kQ==
Date: Thu, 10 Oct 2024 08:14:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com
Subject: Re: [PATCH 2/3] dt-bindings: phy: describe the Qualcomm SGMII PHY
Message-ID: <y4zt6si7j4qrbwmipzjehdq2ggcjr5dlfrraozxtt42n2643yw@6c7h7fkzsjm4>
References: <20241010-schema-v1-0-98b2d0a2f7a2@quicinc.com>
 <20241010-schema-v1-2-98b2d0a2f7a2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241010-schema-v1-2-98b2d0a2f7a2@quicinc.com>

On Thu, Oct 10, 2024 at 10:03:44AM +0800, Yijie Yang wrote:
> Describe the SGMII/SerDes PHY present on the qcs8300 platforms. Since
> qcs8300 shares the same SerDes as sa8775p, so it fallback to the
> compatible.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml      | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


