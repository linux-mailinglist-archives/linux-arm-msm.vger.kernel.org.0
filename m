Return-Path: <linux-arm-msm+bounces-49195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFACA42D71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 21:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89C018928A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 20:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F135F20D4ED;
	Mon, 24 Feb 2025 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhejBRhZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6826AFB;
	Mon, 24 Feb 2025 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740427872; cv=none; b=fpW6HxxOSgbAw1YE3ZQD123mr3jF1pLCAwFi4HuG3CGoISvJCtDLkm4GQ1vnpp7DB2bgAI+OthFz7SZemCFLs/E64o42u64B0u26koMGuLmRnr4Ec2yUbc+wVVFwoUCrDsNDHSJknnpFhqfyO/5k5GZWFy/62OrGngt4aPmYFJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740427872; c=relaxed/simple;
	bh=hmPRRm5TU7zSe0ZLAYyVWI+iQurIqSNyPJmAulL2arM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaqq3bPaWh7Ki4yBAcZeekBPIkxswDYygm6HCIpCHDC7nr3eOxL1WsnSdzjDK+OJKN1xtintcpQOfWqsyMt988VwuftAqJXpy1ul4b6Esw51TVRq6UNkXHaQm371S6b459ajmxJvE5Ov8773O//99AU1AlgAjTBPzj7PHttDVM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhejBRhZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBCEC4CED6;
	Mon, 24 Feb 2025 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427872;
	bh=hmPRRm5TU7zSe0ZLAYyVWI+iQurIqSNyPJmAulL2arM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhejBRhZy29sHDeX4jylv9XDV2KG2FduQsPL3D/A/q0NWHuL8u3cTxyMqSKyO6Q7h
	 je8BgDkebXulycIpUkITcKrYk3VC3aVKXYMiC/awYArDOvpLbVlKG4cMX04H/Cf6MD
	 yM2yZHTYyvcct2AMeoCSlDatZqp1RTs+DzRNaS8Fj8tQ5SVzKXDLIr09LEsXp9t3nT
	 kEpyyt1UaMw9KolgsVvWZPOq53kxTnFchbY/ZAQZWEOxj6g3X0kQnlWiloT02u9mCz
	 UMgo+NNIvFK7+jqIR2G2XHFwGfH4KNFMmYldhKQErAqy0L6rpeibQfNkoqt54jaIPh
	 vxeqyiBCzJ6dQ==
Date: Mon, 24 Feb 2025 14:11:10 -0600
From: Rob Herring <robh@kernel.org>
To: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: qcom,prng: document QCS615
Message-ID: <20250224201110.GA4022997-robh@kernel.org>
References: <20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com>
 <20250224-enable-trng-for-qcs615-v1-1-3243eb7d345a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-enable-trng-for-qcs615-v1-1-3243eb7d345a@quicinc.com>

On Mon, Feb 24, 2025 at 03:20:08PM +0530, Abhinaba Rakshit wrote:
> Document QCS615 compatible for True Random Number Generator.
> 
> Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> index 5e6f8b6425454d6440a8653567235380d934cc2c..fa22bd42b25009b557cb2b195ca45c0dec73b8b5 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,prng-ee  # 8996 and later using EE
>        - items:
>            - enum:
> +              - qcom,qcs615-trng

Keep alphabetical order please.

>                - qcom,ipq5332-trng
>                - qcom,ipq5424-trng
>                - qcom,ipq9574-trng
> 
> -- 
> 2.34.1
> 

