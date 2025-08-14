Return-Path: <linux-arm-msm+bounces-69251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6401B26934
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FAB66030C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB69B189BB0;
	Thu, 14 Aug 2025 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvihKLFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA414A4F0;
	Thu, 14 Aug 2025 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181006; cv=none; b=g0uaraKc6KnIODwKykB4u2fbggrw6yUTgk5F5mpeCiah++2mahefvT1Xcxv4kJEkv2tpZH0JASH5bfpCrq4dgwnWmkNmqcBZW+PFKd5UFgRToAYPydep+DD0xQh89eynqStIWLrhnf2/uMA0PiHkXShHdDV9plPnWHUPuhEC6Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181006; c=relaxed/simple;
	bh=S7GgsxcKNtoORFbwkhFg/o2U/CGUU4Ner6zZ/evpaAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkuZKA5yPnUkqLi4/oAtgH7CyN6WcFhdAxITkUYjTAz+sFsVbjWYixs8kjgMFJk86J40TlFtZZW5XSVW5jFPxXtz/6nGqkcimfLyUbWHjOrsPvyccoctunoY7K2SCIFo8f+9EVQ0PnySEmelb0kZTDyOjTe/8EMjSyYwVsy/SdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvihKLFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C30C4CEEF;
	Thu, 14 Aug 2025 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755181005;
	bh=S7GgsxcKNtoORFbwkhFg/o2U/CGUU4Ner6zZ/evpaAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvihKLFO0reZ3355bGC3y/5Gq4H1ugK95PWcRDdlSxGJbhRdcR0O+V4/7Bh5WRptU
	 GV7EcxnYeZTVcDYJnqTPYlEy7bkxB10kCMBzJ4Zr0VRwrCygXo0CN1FnUlRkavnM08
	 jxldecqZWVvF95995uDgTIgI/IFXGl4RxGLnhyAFbFmyFWCa5BZQ+vBqOqD2vd4kTh
	 oCmFaeOUwBZzBSu54nhoPeBBT1J/tNUezQYn7X4sZUJngN9SplYGnBd4rILKQUfvT5
	 XTqU3y8pB4J+Tp7ze7yAftyrB5USXx4d2dZfaEmTs/CxVmFautbuxyfjjV5A9CTakd
	 spnRZK5r318EQ==
Date: Thu, 14 Aug 2025 09:16:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document SC7280 PCIe0 phy
Message-ID: <yncizuu6bhr3xvuzkb5xri4gh6mdjg4r4d4nkufgxxpquetyir@kiagpup6wqgx>
References: <20250812-sc7280-v2-0-814e36121af0@oss.qualcomm.com>
 <20250812-sc7280-v2-1-814e36121af0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-sc7280-v2-1-814e36121af0@oss.qualcomm.com>

On Tue, Aug 12, 2025 at 07:26:44PM +0530, Krishna Chaitanya Chundru wrote:
> SC7280 PCIe0 PHY is functionally compatible with the SM8250 Gen3 x1 PCIe
> PHY. To reflect this compatibility, update the binding schema to include
      ^--- I think here would be a good place to break for a new
           paragraph, to give separation between problem description and
	   solution description.

> qcom,sc7280-qmp-gen3x1-pcie-phy using enum within a oneOf block, while
> retaining qcom,sm8250-qmp-gen3x1-pcie-phy as a const.
> 

Isn't this the case for &pcie1 as well? If so, can you please fix both?


Also, before we do that, the fact that they are "functionally
compatible", can you confirm that these two platforms really has the
same PHY settings?

Regards,
Bjorn

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 69 ++++++++++++----------
>  1 file changed, 37 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index a1ae8c7988c891a11f6872e58d25e9d04abb41ce..1e08e26892f7b769b75bb905377d30a301e6631c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -15,38 +15,43 @@ description:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,qcs615-qmp-gen3x1-pcie-phy
> -      - qcom,qcs8300-qmp-gen4x2-pcie-phy
> -      - qcom,sa8775p-qmp-gen4x2-pcie-phy
> -      - qcom,sa8775p-qmp-gen4x4-pcie-phy
> -      - qcom,sar2130p-qmp-gen3x2-pcie-phy
> -      - qcom,sc8180x-qmp-pcie-phy
> -      - qcom,sc8280xp-qmp-gen3x1-pcie-phy
> -      - qcom,sc8280xp-qmp-gen3x2-pcie-phy
> -      - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> -      - qcom,sdm845-qhp-pcie-phy
> -      - qcom,sdm845-qmp-pcie-phy
> -      - qcom,sdx55-qmp-pcie-phy
> -      - qcom,sdx65-qmp-gen4x2-pcie-phy
> -      - qcom,sm8150-qmp-gen3x1-pcie-phy
> -      - qcom,sm8150-qmp-gen3x2-pcie-phy
> -      - qcom,sm8250-qmp-gen3x1-pcie-phy
> -      - qcom,sm8250-qmp-gen3x2-pcie-phy
> -      - qcom,sm8250-qmp-modem-pcie-phy
> -      - qcom,sm8350-qmp-gen3x1-pcie-phy
> -      - qcom,sm8350-qmp-gen3x2-pcie-phy
> -      - qcom,sm8450-qmp-gen3x1-pcie-phy
> -      - qcom,sm8450-qmp-gen4x2-pcie-phy
> -      - qcom,sm8550-qmp-gen3x2-pcie-phy
> -      - qcom,sm8550-qmp-gen4x2-pcie-phy
> -      - qcom,sm8650-qmp-gen3x2-pcie-phy
> -      - qcom,sm8650-qmp-gen4x2-pcie-phy
> -      - qcom,x1e80100-qmp-gen3x2-pcie-phy
> -      - qcom,x1e80100-qmp-gen4x2-pcie-phy
> -      - qcom,x1e80100-qmp-gen4x4-pcie-phy
> -      - qcom,x1e80100-qmp-gen4x8-pcie-phy
> -      - qcom,x1p42100-qmp-gen4x4-pcie-phy
> +    oneOf:
> +      - items:
> +          - const: qcom,sc7280-qmp-gen3x1-pcie-phy
> +          - const: qcom,sm8250-qmp-gen3x1-pcie-phy
> +      - items:
> +          - enum:
> +              - qcom,qcs615-qmp-gen3x1-pcie-phy
> +              - qcom,qcs8300-qmp-gen4x2-pcie-phy
> +              - qcom,sa8775p-qmp-gen4x2-pcie-phy
> +              - qcom,sa8775p-qmp-gen4x4-pcie-phy
> +              - qcom,sar2130p-qmp-gen3x2-pcie-phy
> +              - qcom,sc8180x-qmp-pcie-phy
> +              - qcom,sc8280xp-qmp-gen3x1-pcie-phy
> +              - qcom,sc8280xp-qmp-gen3x2-pcie-phy
> +              - qcom,sc8280xp-qmp-gen3x4-pcie-phy
> +              - qcom,sdm845-qhp-pcie-phy
> +              - qcom,sdm845-qmp-pcie-phy
> +              - qcom,sdx55-qmp-pcie-phy
> +              - qcom,sdx65-qmp-gen4x2-pcie-phy
> +              - qcom,sm8150-qmp-gen3x1-pcie-phy
> +              - qcom,sm8150-qmp-gen3x2-pcie-phy
> +              - qcom,sm8250-qmp-gen3x1-pcie-phy
> +              - qcom,sm8250-qmp-gen3x2-pcie-phy
> +              - qcom,sm8250-qmp-modem-pcie-phy
> +              - qcom,sm8350-qmp-gen3x1-pcie-phy
> +              - qcom,sm8350-qmp-gen3x2-pcie-phy
> +              - qcom,sm8450-qmp-gen3x1-pcie-phy
> +              - qcom,sm8450-qmp-gen4x2-pcie-phy
> +              - qcom,sm8550-qmp-gen3x2-pcie-phy
> +              - qcom,sm8550-qmp-gen4x2-pcie-phy
> +              - qcom,sm8650-qmp-gen3x2-pcie-phy
> +              - qcom,sm8650-qmp-gen4x2-pcie-phy
> +              - qcom,x1e80100-qmp-gen3x2-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x2-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x4-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x8-pcie-phy
> +              - qcom,x1p42100-qmp-gen4x4-pcie-phy
>  
>    reg:
>      minItems: 1
> 
> -- 
> 2.34.1
> 

