Return-Path: <linux-arm-msm+bounces-45063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AA9A116C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 02:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BBB188A34A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 01:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571D61E1A05;
	Wed, 15 Jan 2025 01:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8Lh7GUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C421DFE3C;
	Wed, 15 Jan 2025 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736905394; cv=none; b=PNRl3ozQeT2GiW12fDTaFWkYvazrRqU3JmAvbJC0jBWPp1SI4XN7zqv8E5iqLpOYO3sQOMUDojqAVnKC0xdhTv8FhMqu+11Zgy7jGU7yCfgu+HOcZy6l6ffkSCSH/sNhfeHFVt7wnzTxATer1729hXxIqbEAJz4PTDYcqsP+JBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736905394; c=relaxed/simple;
	bh=AFpuWoR+H4h6L6CgS9a6/3q2qLmvlTXqLE/3mM/02zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm67bjYI6qswdsSrRvnN545pn6x0rTn4FQezSinX0lmz3LAUaVu5oXrrts9UT7bICQE0AkTNjGo5TP21oPjnLf2IhVa7Nv/iBEazYu7FJvhRvL2m/wP3aW3hLUrknpkqnbwVnJV+Pqn/irpmPiIgMbOte/AjCF1DLc1lzZJ7bXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8Lh7GUi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B15C4CEDD;
	Wed, 15 Jan 2025 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736905393;
	bh=AFpuWoR+H4h6L6CgS9a6/3q2qLmvlTXqLE/3mM/02zY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8Lh7GUiWJCuDtQ0ROUa3mkx7VQADSl3dUt0KAHMT/4MT0ixzUIMN32g7LZVQ38FK
	 mPFnG9LpMZewxBBhVErr6r8TO+fSM6TNwnmx+hxQmVeBATo5EUwEUSnvo2lGBrdOXL
	 sUiWLt+mWMSDzEILobTCG0FqSiSSMKaJZnMoelpBNJgDiEjTo03tBSx9xpGrH84I43
	 HuZ3N1EhQ5f/eSVmY3KA43IelJdpTKLtxo4Ob8S9/TmF5KHgb/yHi4hKYUgNFyEjmV
	 bECi2vQ2LhLVP8XbuF4EqhPdIWupv1v1UMQJ7FxiHBC3c7GslDHVR9fFXSZMv96IRW
	 ScA0JIwCRxcRg==
Date: Tue, 14 Jan 2025 19:43:12 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH 5/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document the SM8750 ICE
Message-ID: <173690538767.2135382.8898942462773633610.robh@kernel.org>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
 <20250113-sm8750_crypto_master-v1-5-d8e265729848@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_crypto_master-v1-5-d8e265729848@quicinc.com>


On Mon, 13 Jan 2025 13:16:25 -0800, Melody Olvera wrote:
> From: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> 
> Document the Inline Crypto Engine (ICE) on the SM8750 Platform.
> 
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


