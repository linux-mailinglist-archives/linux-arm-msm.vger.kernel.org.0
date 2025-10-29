Return-Path: <linux-arm-msm+bounces-79520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A135AC1C4C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:58:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6638E624F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E406335091;
	Wed, 29 Oct 2025 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NgRt2n9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16A5325487;
	Wed, 29 Oct 2025 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755751; cv=none; b=VggXyK015Sk8oYIeXc0O5jAqJ4bDL/f2L/T17EaGjUoHLfZNJGgY/AFsJjLjoFrpiYzKI6/87WYroL68NokmbTTOo/6RiknBIdhOrDEukUkRIHUIV0YH4NuCO2WNIEsGStubcCq2A1YUOu5eoJ1vd0SngjcdW6mafy00HBrHITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755751; c=relaxed/simple;
	bh=0Q/PAlu4iZpIV82jD8k6dHiUKuoh4pHxPPcM4tcBUsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toPBgSj/XnrFUqJq7iTgQplxtQ8IkX7JxKNm3NQf2XOeq/PFyQ9n2hJLGsTB7HHfA+mbPyqpFuD7pVunvIaUimTOBK49cNeIHD6KTTJZnKtqK0ObnDTGM/OYSFszygbNR605p+0KdTvyrgxUY66L9FlAevNo7bt3byRdve/05yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NgRt2n9H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62C7C4CEF7;
	Wed, 29 Oct 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761755750;
	bh=0Q/PAlu4iZpIV82jD8k6dHiUKuoh4pHxPPcM4tcBUsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgRt2n9HgH0vRqHxYhz3Lr6TAKP7un3xcoHpbjA68R4zjHC13K1RpKfPjRcI5jkgH
	 OlAsl5JDVWs02TZVc+yFC3F6vE8zR/tk1TYtUewekNtDP7xy5R2hYHCEJ6DF5VjGiJ
	 4fBaTv0nhLlEW3uVCvERmjhi0B0SpoKuIoRu/5uwRWLB8q2c22nrnB3LSaG3u9ci4R
	 tski/s7RMLi4hlefwtjE6fvEsWnBP5qOi7WuL48ETkAC7S1gHu42GDlsZasAJIPilg
	 k8b41RLT4IQSn/2r3OliTsdYWOXJAGNEHkcXPw49wn9b305spnHbwwhYK1gSB4tATc
	 OM3mD/z5ozVhQ==
Date: Wed, 29 Oct 2025 11:38:53 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite
Message-ID: <bncdkcnbqnlz4rj5yhtgeey5d2ksuwpz7ms7kvkjci3p4gdtt4@e54svrukfobu>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
 <20251029-phy-qcom-edp-add-missing-refclk-v4-1-adb7f5c54fe4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-phy-qcom-edp-add-missing-refclk-v4-1-adb7f5c54fe4@linaro.org>

On Wed, Oct 29, 2025 at 03:31:30PM +0200, Abel Vesa wrote:
> On X Elite platform, the eDP PHY uses one more clock called ref.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> So attach the this ref clock to the PHY.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index eb97181cbb9579893b4ee26a39c3559ad87b2fba..bfc4d75f50ff9e31981fe602478f28320545e52b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -37,12 +37,15 @@ properties:
>        - description: PLL register block
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aux
>        - const: cfg_ahb
> +      - const: ref
>  
>    "#clock-cells":
>      const: 1
> @@ -64,6 +67,29 @@ required:
>    - "#clock-cells"
>    - "#phy-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,x1e80100-dp-phy

Don't we have the refclk on all the other targets as well?
I think we should proceed as you propose here, and if this is the case,
revisit the other targets.

Regards,
Bjorn

> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          minItems: 3
> +          maxItems: 3
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.48.1
> 

