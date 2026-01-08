Return-Path: <linux-arm-msm+bounces-88016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31060D01C57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 10:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 482673058BD8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 08:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70D39A7F8;
	Thu,  8 Jan 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXmUBHf2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB1539A807;
	Thu,  8 Jan 2026 08:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859813; cv=none; b=Xi4I+oL9FJjOVa1vr9JHQVGcepam26jz+hRTlqbhoic/AUt0Txaxo16q/VaLEpkcpkY0TqNcTaWkpArKbHGlCRkjum/IGpmsThGFvaLzY4p6c4bqfoe3XzzZ+Se6zyF9QJ9uoCqkpJBICFWWxzqqX/K8HOo/gLrMmjwVs8HOhKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859813; c=relaxed/simple;
	bh=bqafzoBeyKCVtTt76rKmvJIsQoLDj2D0YeKz+fx6RN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMUqmk/88Ln3GVysCnfJxKpVA+pmw1bDlS+j1pjDc2FfvC1nNxZMCdnxzxLO7Bb+De2qJuw+w+6zWAMhZ/SKE8JytY05IVcbg7EWUeVsPg0cY6KJfZNkJZCFRYv9A28yj+ubScRT48tdvNrf/+4vyPHqbIQ0gaEYNH5I4RT/pgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXmUBHf2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA19C116C6;
	Thu,  8 Jan 2026 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767859809;
	bh=bqafzoBeyKCVtTt76rKmvJIsQoLDj2D0YeKz+fx6RN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXmUBHf2/weM2mMeh7utxAtVPNEQBs6I9CLEze7lVZFhNkJY1fG3mu7T0yDO+wXP6
	 I9PB8JX5uqXq7ZMr9iD8A2q5whBUSOuCVZ6XxFEYjmHB41H8sKMdLRbFxsKaB0v54n
	 t+IAMSZgvFazCNtVm4MHghKHyHK7V4nGSF0BydoJuS7+kTudbkLQm17+gQXsyAKYU+
	 xqqjLATZLvBCcf3z+jGUEbUP7v/R9T4cRPLIgkckkgwLh4qEJjeP1pdwM+Uudw6CyS
	 aKXIHsS4IH/BOrN7POYlj2xkxTxVZTBfrPNMK6o2YbDCrBArDUbnLkZlqNw3B7Emcw
	 uIJ4yopWg107w==
Date: Thu, 8 Jan 2026 09:10:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document
 M31 eUSB2 PHY for Kaanapali
Message-ID: <20260108-congenial-bonobo-of-lightning-5ceaec@quoll>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
 <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>

On Thu, Jan 08, 2026 at 10:54:59AM +0530, Krishna Kurapati wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
> fallback to indicate the compatibility of the M31 eUSB2 PHY on the
> Kaanapali with that on the SM8750.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> index 409803874c97..cd6b84213a7c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> @@ -19,6 +19,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-m31-eusb2-phy
> +              - qcom,kaanapali-m31-eusb2-phy

Huh? So you did not add new compatible? It's exactly the same code, so
the tag should have stayed. Really, do not overcomplicate things. There
is no need to poke people on multiple channels to ask them if EXACTLY
same patch retains the tag. It is already explained in submitting
patches.

Keep the previous ack.

Best regards,
Krzysztof


