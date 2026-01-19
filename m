Return-Path: <linux-arm-msm+bounces-89745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C017D3B767
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB72301AE3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541412D978B;
	Mon, 19 Jan 2026 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8P5r7kN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8D81DF987;
	Mon, 19 Jan 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851488; cv=none; b=Iu1uelOt5LEGHHF+XZi7/icbzeRe4u9EOZ3g87LGJQAGQqudJX1/1B5ngAiuwCUvD77Q2pKgyvfBxkpnqSuFyNi8R9xUyoBRbe2aaOhmF2+0NfpM8KWV8tan/8X4chp1+2AZyeJiObs23XALBfhBrMKWj4PntDMK21HBXd9bC3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851488; c=relaxed/simple;
	bh=FLrPm7zsFV+yX4Xhn4nI/GYSI+1XDBlel+KuBQu2hOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DAOgPw3cDMKozaTfHJxLToMwmBBXtIl3jyZ6kgtCZrGNXFhanuJhp9MbFor8RBN2wJrCPGpRx99bF0PEEgR/ptZzXPmV58Va1ldoo1skxQ9QCPIIfOUN8n7TR0BlYL+Vs1pm6LRDEtGO5auQ40i2alxOz8jEjLB6iBmgR5nSx14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8P5r7kN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02FDC116C6;
	Mon, 19 Jan 2026 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768851487;
	bh=FLrPm7zsFV+yX4Xhn4nI/GYSI+1XDBlel+KuBQu2hOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8P5r7kN+crbt5ArXjg1zaCWV4KjGM+iprRXXofeTZQho+BwScXENhVk2qCItFMWf
	 4kHnIr4y4U4szATf31Av5ybZGpye2wUPaxSRVTqW+m5O3+Z6wEHgZxgevPaIFTeowA
	 UlW5Hi/Z7VOy6222WYI0OH//qpzxAYMy4rwZwMhBz4Lhk7hQDLhB+G3doi/e7RDNoE
	 EGtAnZdsP1LC5o3g0hrn4u1Ilmngz5NUD+ZAs1EF6158fMMjM4bfRAa2PSH28iVaXu
	 OCWQNWaOFZUHKu3viLyPj2y3IYKQYliU6Mef27oWfXMtvDCOnaZFszsLNB/lzCzqMz
	 wwU7WS5c3/5nA==
Date: Mon, 19 Jan 2026 13:38:04 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/10] dt-bindings: net: bluetooth: qualcomm: Fix WCN6855
 regulator names
Message-ID: <5w7tocv5tciidh3ms6l267cw5rj5yvyvphmyjy3kp5xf36cavp@5g2vpi6vefzy>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
 <20251205-topic-wcn6855_pmu_dtbdings-v1-1-165611f687c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-1-165611f687c8@oss.qualcomm.com>

On Fri, Dec 05, 2025 at 01:47:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
> for whatever reason.
> 
> The schematics footprint for this chip definitely says 7 on the input
> leg and the driver still expects 1p7. Bring it back.
> 
> Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

@Luiz, this would conflict with the change in your tree, so I can't take
it together with the dts changes. Can you please pick this binding
patch, so that I then can pick up the related dts changes?

Regards,
Bjorn

> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml         | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> index 45630067d3c8..0beda26ae8bb 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> @@ -50,9 +50,6 @@ properties:
>      description: VDD_RFA_1P7 supply regulator handle
>      deprecated: true
>  
> -  vddrfa1p8-supply:
> -    description: VDD_RFA_1P8 supply regulator handle
> -
>    vddrfacmn-supply:
>      description: VDD_RFA_CMN supply regulator handle
>  
> @@ -68,7 +65,7 @@ required:
>    - vddbtcmx-supply
>    - vddrfa0p8-supply
>    - vddrfa1p2-supply
> -  - vddrfa1p8-supply
> +  - vddrfa1p7-supply
>    - vddrfacmn-supply
>    - vddwlcx-supply
>    - vddwlmx-supply
> @@ -91,7 +88,7 @@ examples:
>              vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
>              vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>              vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -            vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>              vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
>              vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>              vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> 
> -- 
> 2.52.0
> 

