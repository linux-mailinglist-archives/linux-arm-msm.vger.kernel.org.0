Return-Path: <linux-arm-msm+bounces-78091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0832ABF4C98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB0474E9BEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE48023AB98;
	Tue, 21 Oct 2025 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHMaUTaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D6199D8;
	Tue, 21 Oct 2025 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030141; cv=none; b=NobA6mJ5HO32cokNyzTbwcvrIMBnc5YatqSqpx743j3EWx6VTrR3WD8OFXe/kIdR/q1drACfg2Fh5B1BGji1xbtmmLSiKug+ROzjcGuUzC4eVO3jnJ/F0uR28i6V5BGuDs/CvmRM5MXJTI9B/nryHLJwDIsk82TSWgcaDw7txhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030141; c=relaxed/simple;
	bh=+CuOcIy8l9Wxb3mYYyfLs1v0g1O8xn7/Uv9QbW1xMtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxspeum5QlaAHp7Q37r3FwfemQHzVeufVsr5W7RPvwfhb2n5sHlMjRniGshE8fdnMr1B9gDVbEmciYTgiPo+pP0KcQoZjxLx8SwtHqmF8UsZX72c0grQgxcmlddkjmAF4APAeAfaR7aszlEiRQDtZQm8AqkGzZvK7Ig8Q3xdpKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHMaUTaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EC3C4CEF1;
	Tue, 21 Oct 2025 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761030141;
	bh=+CuOcIy8l9Wxb3mYYyfLs1v0g1O8xn7/Uv9QbW1xMtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHMaUTaQXgNCwWOa329RDLxgKyGzzR8nA2M/bnRdG7LVugH0dJQiKmJcHcywRg4qY
	 tbOzCk0wYmGyTDFlBuKDq5fzZWHU7GXJNtasvkcKq2a8BP4dE5rbsat0y5qf+KHxxZ
	 kr403yn/DXfo68TTJCXLr4qfbIV/NG9uL4LndbRCO1bVfWzgHoAH7gXenCalb7k7N9
	 FIpPXxd6EvxDwY9APOiRqNWL2MDAY7h24jmrl9UVl2L6d6q8C5XMLojTQ4VPp+EOAh
	 MfQifSMkZvY/0xQayG1yyONaQoLGqF0NgEgqDrpj7cNR6HYeqax4rFQWozIDV4xUya
	 uoQH7AdF6rVog==
Date: Tue, 21 Oct 2025 09:02:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sram: qcom,imem: drop the IPQ5424 compatible
Message-ID: <20251021-quaint-hopping-tuna-0dade2@kuoka>
References: <20251015-ipq5424-imem-v1-1-ee1c1476c1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015-ipq5424-imem-v1-1-ee1c1476c1b6@oss.qualcomm.com>

On Wed, Oct 15, 2025 at 11:46:58AM +0530, Kathiravan Thirumoorthy wrote:
> Based on the recent discussion in the linux-arm-msm list[1], it is not
> appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD. Since
> there are no consumers of this compatible, drop it and move to
> mmio-sram.
> 
> While at it, add a comment to not to extend the list and move towards
> mmio-sram.
> 
> [1] https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..3147f3634a531514a670e714f3878e5375db7285 100644
> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> @@ -14,11 +14,10 @@ description:
>    transactions.
>  
>  properties:
> -  compatible:
> +  compatible: # Don't grow this list. Please use mmio-sram if possible
>      items:
>        - enum:
>            - qcom,apq8064-imem
> -          - qcom,ipq5424-imem

And where is qcom,ipq5424-imem added? This is supposed to be one patch.

Best regards,
Krzysztof


