Return-Path: <linux-arm-msm+bounces-46208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC3AA1D24F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 09:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AF81886B82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F72188733;
	Mon, 27 Jan 2025 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhCUgd5t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1957116F8E9;
	Mon, 27 Jan 2025 08:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737966394; cv=none; b=A8jLIIM9+kqUtaIVAbgKol+NhjoCjoPDRCya+EF8Tgno5Pg1UuDdf4f5qj0qq1rRCjwAbaEYxSnjNosWCrUu2MafIf6zv+ROSypG24kOcAXcMvgoT/P49RpNx85EFvYTDb/fckH/ALgFWga5SMm3kqzjL/+W+hi16q1N9DHCOrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737966394; c=relaxed/simple;
	bh=Tzcdn7Xb4jr56TaKPWnP/7cIRzGEgS+eCYpGj65P5OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwBbHpRxM8mNuoMn+lFm1zx3vrcLuaEhjvmZ8yWlmubEMo+wpoBmjPpncKzN+p8xLdOljSrvo9JMXa30xms3OETkSHeib8vJ9MvhxErGAfJt22WUigWR+LIlhhsRei0xvzz3rYoZks1Vy70kxynKEM2lnTiZ1MxVYlN7g/YbO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhCUgd5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E76C4CED2;
	Mon, 27 Jan 2025 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737966393;
	bh=Tzcdn7Xb4jr56TaKPWnP/7cIRzGEgS+eCYpGj65P5OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhCUgd5tBLRPHnbESmcSGdZfG0HsNpu5wLFqmifi9YfMmJ+njSApNps3zSdPvuWoe
	 uAka0m7W0Dp8fF1MbZqNDUNWmMC4+tTvysCJa7haqWR2oEQDNHS18C2yF8Pdwd8PF7
	 JzPY5ocwXrSbzdn3Fi6/uUekprfOtarP/TkWMQU1/PGMfBsGw1xJknTGHN10f3/RyN
	 S2lv6ujgocKW315OSnnqn1Anwg4YOsqzDijB3Pia69ETS2gKumD+666h8Q9iVgZm36
	 sqRXiqIyXUAEjcDS16+OGxzKBcg+pWLVgwb6yyO0OyoOM2rSbqrB5zC5VcYIl817ad
	 rMhH6YNEc0z9A==
Date: Mon, 27 Jan 2025 09:26:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] dt-bindings: phy: qcom,qmp-pcie: Drop reset number
 constraints
Message-ID: <20250127-hungry-bald-groundhog-4f7d4b@krzk-bin>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-2-02659a08b044@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250125-topic-x1p4_dts-v1-2-02659a08b044@oss.qualcomm.com>

On Sat, Jan 25, 2025 at 04:31:18AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> (Almost?) all QMP PHYs come with both a "full reset" ("phy") and a
> "retain certain registers" one ("phy_nocsr").
> 
> Drop the maxItems=1 constraint for resets and reset_names as we go
> ahead and straighten out the DT usage. After that's done (which
> will involve modifying some clock drivers etc.), we may set
> *min*Items to 2, bar some possible exceptions.

You drop minItems now, so that's a bit confusing. If all devices have
two resets, just change in top-level resets the minItems -> 2 now and
mention that it does not affect the ABI, because Linux will support
missing reset and it describes the hardware more accurately.

> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 24 ----------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index f1ffc3d5cae44b8a9c96cdcd749a6e54533c94f6..c42143bd139e30d1beabc9099d0dde17128413bf 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -204,30 +204,6 @@ allOf:
>          clock-names:
>            minItems: 7
>  
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sm8550-qmp-gen4x2-pcie-phy
> -              - qcom,sm8650-qmp-gen4x2-pcie-phy
> -              - qcom,x1e80100-qmp-gen4x2-pcie-phy
> -              - qcom,x1e80100-qmp-gen4x4-pcie-phy
> -              - qcom,x1e80100-qmp-gen4x8-pcie-phy
> -              - qcom,x1p42100-qmp-gen4x4-pcie-phy

You just added this line, so this patch should be #1.

Best regards,
Krzysztof


