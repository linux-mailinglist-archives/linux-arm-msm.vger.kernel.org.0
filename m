Return-Path: <linux-arm-msm+bounces-26823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C0F93956A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 23:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA93A1C2185A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 21:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D934031A89;
	Mon, 22 Jul 2024 21:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uS7CaUtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F2F45945;
	Mon, 22 Jul 2024 21:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721683482; cv=none; b=aK/5N1fT/fmEBWFiz7DgzUIbCbxAV7KBCK1SqFcHGs2W2AQJ8eF3ImTuPpAKFsedernd9UyI8CYJU+Ankv8pnTLmx0eum1rLqC6Qua5/SoWdt/ASiuFD//AhHQtpFsYV6MBOmpvfyIFQbfeM2p2UPCUYUDmofcHXjYWlTmUYAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721683482; c=relaxed/simple;
	bh=Q826C5u5k4qn7p6QfqtajjTKEgM16wlAc29c0ljUYIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJjReYPaxdSZ4Q58AfF8Bc8od2SHlbmWSuiOu1WVuKKhClv21KNODUBitxECeISFqC1SIZJMBLEIGrrGcypTbU9iPf7VklWuRzkyFWni9t+sEVsGcLO7EY7vgVTXwJjSk3Hm2ii9EMDuuQ8irbouUOHD2dYxV/88SeY0zClTB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uS7CaUtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C30C4AF0A;
	Mon, 22 Jul 2024 21:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721683482;
	bh=Q826C5u5k4qn7p6QfqtajjTKEgM16wlAc29c0ljUYIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS7CaUtIPUfTWiu+mra/lBkTQL0IiRtc3eCNU1mf0wqu5fZMkjMsmx4DzleXasWV8
	 UYJL8clmsTuaHLA1uxzJbbX9xaNZoCuS73IdQSZkfrTDx2iCgV2yVKszDmElF6hcJl
	 9ZRj2h3UVsP4oKiI+YYCOLEHEEY9xUBtm7awDNY/ATCiEphM9gvxBJHunZlWsk+hti
	 7RsVATpcG983CZ3+R4yQpeIikznaxCIxAUlQvKN29HNI6M3DNk4ybm3sw9YiM875FC
	 HhSzM3Bjsz5QTbbW9BkWVev5zlxfRJbJ5fl3j/gLzRNtb0NYWhhiVvyAJsh/m+NStK
	 LXp66C/EFyDww==
Date: Mon, 22 Jul 2024 15:24:34 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen
 6
Message-ID: <20240722212434.GA112051-robh@kernel.org>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-1-d7d97fdebb28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719-topic-t14s_upstream-v1-1-d7d97fdebb28@linaro.org>

On Fri, Jul 19, 2024 at 10:16:36PM +0200, Konrad Dybcio wrote:
> Document the X1E78100-based ThinkPad.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index f08e13b61172..8af56b602de3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1038,6 +1038,12 @@ properties:
>                - qcom,sm8650-qrd
>            - const: qcom,sm8650
>  
> +      - items:
> +          - enum:
> +              - lenovo,thinkpad-t14s
> +          - const: qcom,x1e78100
> +          - const: qcom,x1e80100

Why 2 chip compatibles? Please explain in the commit msg.

> +
>        - items:
>            - enum:
>                - asus,vivobook-s15
> 
> -- 
> 2.45.2
> 

