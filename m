Return-Path: <linux-arm-msm+bounces-79745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2CC21B82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 19:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B3D14EC5BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 18:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6C132A3CF;
	Thu, 30 Oct 2025 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOyg7Txd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13352D6E71;
	Thu, 30 Oct 2025 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761847867; cv=none; b=rK0SC6Vm8Tq1LRMBnCItdDhvMCQrLTRwUyRFls9ALE1oBohICFgz+Ht4YLVe1FL42c/3u+ITCITJcohSiokEUi8UDzystOu0nVlqtqJDPB+TGTRY7mXWxsAsxRMLaVfTNDJOv5TWjBVJ39c3GOxEx0vv2q1ardlWx6DjEIND494=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761847867; c=relaxed/simple;
	bh=c0/M9ovtNL3eX2rkNYnGKmK/DaJBhek0H2vibY+mrQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bst6g5c/taAJ/5tfwDFscXsznDwb/qu+Gi2CCuMgnSkp7d4uNEjTxPzO58giPaAwBmvpd0Y8O6y3h4Kq9Jd6ZNvBy+hPvCCtp6UStSAQHoPfOgIH37CuKM5NKXZXOg/bmDKDUcNj+CMdVkQQm84vi1sbe3sg9IBRUkjs3hyX0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOyg7Txd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F4EC4CEF1;
	Thu, 30 Oct 2025 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761847864;
	bh=c0/M9ovtNL3eX2rkNYnGKmK/DaJBhek0H2vibY+mrQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOyg7TxdQAjGbtDruH3glel6T3hv71tTYYgRF14QwXkFCxk2LY9MRz05PnVjlz4/a
	 eF4Ff28Do0JtUN9yc+6lGCJMDd3/DYe1CxSmyApzMHFAIxksCZh1a+Ta9jUh4vaF3/
	 /WYh1n1rF9OiAKuu13FDyzl9hkZLG2Q/GFg0vDcqjqpnq1LSJYEaB2JShzrQaFOcwM
	 jbRu4aLhPaKX7Sw6WSPet+cDrrsln2n9D9QJ3++vWjbKuahxOcCoW4JkxI0dUVReel
	 VSAlhNzqdT7zF3/5NEYwYYNo6jrcywA8V85wVPI6J0J4wQRGI+/BG0JJzS48C45pp5
	 lzdYWfoEXgUrw==
Date: Thu, 30 Oct 2025 13:11:02 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
	srini@kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add sm6115
 LPASS TX
Message-ID: <20251030181102.GA128512-robh@kernel.org>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029160101.423209-3-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 04:00:59PM +0000, Srinivas Kandagatla wrote:
> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
> TX macro codec, which looks like compatible with SM8450.

Add? Looks like it was already added.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml       | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> index e5e65e226a02..8dd8005d73d6 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
> @@ -14,7 +14,6 @@ properties:
>      oneOf:
>        - enum:
>            - qcom,sc7280-lpass-tx-macro
> -          - qcom,sm6115-lpass-tx-macro
>            - qcom,sm8250-lpass-tx-macro
>            - qcom,sm8450-lpass-tx-macro
>            - qcom,sm8550-lpass-tx-macro
> @@ -26,6 +25,10 @@ properties:
>                - qcom,sm8750-lpass-tx-macro
>                - qcom,x1e80100-lpass-tx-macro
>            - const: qcom,sm8550-lpass-tx-macro
> +      - items:
> +          - enum:
> +              - qcom,sm6115-lpass-tx-macro
> +          - const: qcom,sm8450-lpass-tx-macro
>  
>    reg:
>      maxItems: 1
> -- 
> 2.51.0
> 

