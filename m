Return-Path: <linux-arm-msm+bounces-36091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C590B9B20B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 22:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542E01C20852
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 21:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C4117DFF1;
	Sun, 27 Oct 2024 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEldmhSe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEABF1DFE8;
	Sun, 27 Oct 2024 21:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730063414; cv=none; b=nwnh/hVlPOelcPFVWTouFEeoqx4zEUUbnIDhG6TZDhx9fjBq/T52i03wBgLaZVs3Zrcy8wkr82lFtcy8MW9DHxep1shOl9DHnatZwnGkKPxTT5EJHAOF077jj1AFnt6a6jNf3hECsooisE2Mjg74AcQC9vmIAOnAaRVyC8tEDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730063414; c=relaxed/simple;
	bh=FHPod0TcGB1+Z8/HScnJyv0wJJKMmlBsJCMaVTNArIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWuG5WUv8rR4En9HatxsOhkbPtM2SsMMkE3Ep6zG/R3OtHP7/CJP4gSB/G4QxpaWdRd2ZH6DlLMXc08Q4VCKsncFfzVNGB26UPpXCcgon0l9ig8IR2ywdpmknAwThYO0aiPA1tRoqX/PeniW0FXTgfvvGB7IP582ajYCxI9taZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEldmhSe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D504DC4CEC3;
	Sun, 27 Oct 2024 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730063413;
	bh=FHPod0TcGB1+Z8/HScnJyv0wJJKMmlBsJCMaVTNArIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEldmhSeVYdk2X5Zg6UjyWmakQKS3DJ7+pyIuuCjltSh1HBvIhsjEIQW3vDE1+4CM
	 mFu0dXL74Mfc6fpF4aMnzRw6O/RP/zepuTbvYGE4W5lEtlzcmeZT/+nRt1cYw4H5WJ
	 sCaOoG5K+qD3yQGjGP6a0ULCLcKnVsNMVAEXgNkTnhMu2vLze46xmWhRpFwapV10dU
	 XNd+5aY3T3d7fXZucocp7HiQuaZQuSY1NlbA0hstKl5tZ2dVAJl4VjXbBp8v+P58GY
	 pMqH28XtmrD5Z2C+lPTlZPT11+YVTpILR5FFhQvgfPxzU2nWTFhxfKfGztbqcw4XQ/
	 5d6Nei2h1YH/Q==
Date: Sun, 27 Oct 2024 22:10:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: add QAR2130P board
Message-ID: <xiqgif6a3nb6ab6nwpiir333jf4vmcn734ks2hjq7mlybgxl6f@lh3o6ca5t2lf>
References: <20241027-sar2130p-dt-v1-0-739d36d31c33@linaro.org>
 <20241027-sar2130p-dt-v1-2-739d36d31c33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241027-sar2130p-dt-v1-2-739d36d31c33@linaro.org>

On Sun, Oct 27, 2024 at 03:24:04AM +0200, Dmitry Baryshkov wrote:
> Add the Qualcomm QAR2130P development board using the Qualcomm AR2 Gen1
> aka SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 0f18cb35c774aec48967eddbef4b4480dbc8edbe..02b2379ccf7741a0fba345d83d0ce7db731a3772 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -52,6 +52,7 @@ description: |
>          sa8155p
>          sa8540p
>          sa8775p
> +        sar2130p
>          sc7180
>          sc7280
>          sc8180x
> @@ -407,6 +408,12 @@ properties:
>                - qcom,qru1000-idp
>            - const: qcom,qru1000
>  
> +      - description: Qualcomm AR2 Gen1 platform
> +        items:
> +          - enum:
> +              - qcom,qar2130p
> +          - const: qcom,sar2130p

That's a tricky different to spot.

You need to update qcom-soc.yaml with new pattern.

Best regards,
Krzysztof


