Return-Path: <linux-arm-msm+bounces-43212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 431CB9FBB6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B46A7A1351
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8667F1B4128;
	Tue, 24 Dec 2024 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0ZhTGZp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739E1B219D;
	Tue, 24 Dec 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033333; cv=none; b=a7Lc5XG/Sf7FdSeB/GQC0NY2T6Z/fRyxq2KMPhXXOZEe2jW6z0z4fDOqfrk5kfWGGVyT1Jjt8X2rBzKn6mQeyBxpPMD/ZN8v7MkMweR3jCdUFRaRJ/r0IOAaGloLvaxjji4NODzkNDzJVNJ5xH8mfEOBceUhsAmyTR1Od/l/kCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033333; c=relaxed/simple;
	bh=eORYMPFlfkjcADlXVIKLITSMDF92385TX9+KQYrpXa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eifhLGUvM8gpBqOcT9wJdjFbOw0mnuQ11QEAEPrlYXuNe0fmRhvE8ppZ3ZBGMCrYDSi5c4LSq3TIxA/cvepz7WygKohEVGWcqF29k8n4OCTPXpJJsXdsoz3h97jy5Zkoh3SHVR+Mv2EcSNfeYaxTTqZRF6/kZChGS8X3WljARJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0ZhTGZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D95CC4CED0;
	Tue, 24 Dec 2024 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735033332;
	bh=eORYMPFlfkjcADlXVIKLITSMDF92385TX9+KQYrpXa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0ZhTGZpIs3SJOPxrBRBBi+leFYed7g+11HoR5ErUN6yMzK6Cw5VvVFgcrzfjsod/
	 R41A/ZaiS1IHN0HaDwihkjKfYtdQVZFyP4kS1ZJ2CAA7DZpfc9Ksvk9sn74mXa2ITn
	 XEZTLZYen01SaDA4GeHiCvV563pr9nwny29u3+4ZEC3kmLrQFHolD3dLA1g1isQo/F
	 b4ANaHLQVs9VjoRIvU4RxygK26wDIuocwtBv2sul0ogv094i/iBOSlJAGuZI+RscGC
	 lzqAxhZ1E/oa3EX41FyTeNXVPtk/2cZS31NwU8e0t81CiZybuyvPe/FixgBZvudlcF
	 0OMKBdl0x7nrg==
Date: Tue, 24 Dec 2024 10:42:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_mmanikan@quicinc.com, 
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/4] dt-bindings: crypto: qcom,prng: document ipq9574,
 ipq5424 and ipq5322
Message-ID: <2irlpuqdsdk3qdmcfkepabaw3z6z4r2v3b2ug7nywqwynhzd5v@rarvfnyugmaj>
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
 <20241220070036.3434658-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220070036.3434658-2-quic_mdalam@quicinc.com>

On Fri, Dec 20, 2024 at 12:30:33PM +0530, Md Sadre Alam wrote:
> Document ipq9574, ipq5424 and ipq5322 compatible for the True Random Number
> Generator.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v2]
> 
> * Added device tree binding change
> 
> Change in [v1]
> 
> * This patch was not included in [v1]
> 
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> index 2c959162e428..7ca1db52bbc5 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -24,6 +24,9 @@ properties:
>                - qcom,sm8450-trng
>                - qcom,sm8550-trng
>                - qcom,sm8650-trng
> +              - qcom,ipq5332-trng
> +              - qcom,ipq5424-trng
> +              - qcom,ipq9574-trng

Do not add new entries to the end of lists. Keep sorting.

Best regards,
Krzysztof


