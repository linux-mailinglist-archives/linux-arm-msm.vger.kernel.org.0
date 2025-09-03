Return-Path: <linux-arm-msm+bounces-71934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBA7B42B1A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 22:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A1C916EFCD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C12A2EA46F;
	Wed,  3 Sep 2025 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBFgbaBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CAB2DCF73;
	Wed,  3 Sep 2025 20:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756931971; cv=none; b=uMzsi2bTM+ieHpQJwXYDFEW84yHBz+g2ODARwR3ke47XXkFHUkfNXPu5LFL5FEZ013P/CbKwRwMwRBWinKaBmygtHBSXtebwLmIV3gKdMP29GtQkKxR9z71j225qJbwdT+gFlFMBJkVVh/otwbnR7LxECpHUcT9fewCs9wvhbwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756931971; c=relaxed/simple;
	bh=rGJu4bA2Dfozpo/XJl1d3k02MLlU4X3HlyiWNj2hz7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvG53nj8SartNCoJkaWNNIrE8TepKXCff3wFLsc7Fiak994ezSyfYcVYO1GLLxlCS/4MTyPvpQkuJe5uKR5qtxODC35fxn95Bc7WvMSEOWkGPdXnK6LNWQnN1a5cf4Q3JgSIysIxN+iISyoxpYWEBvh2X54nTpG83Fe8IHEe02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBFgbaBb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89CDEC4CEE7;
	Wed,  3 Sep 2025 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756931970;
	bh=rGJu4bA2Dfozpo/XJl1d3k02MLlU4X3HlyiWNj2hz7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBFgbaBbRRf9/BKzJBltT+NKCqzs2h3Tr03Fao6fxNyrvzoMtjOiwXr2HuFUnAcai
	 /+qq4Ly7XvMdrnE32UZZvEp4hiAXx/qjEFQ80ss5b94dlMuECVfF6FuNyn5nK6uQqj
	 MduW05aokCBN33sngZ3ZIikHGO3+/sHxsIxMpsJiRCLWid/JXCivjgAyWaVlc8R7Ra
	 WrWAqRfkpG2jgVTtri/4IIW0QVr7NtD9ZKWho5da9ZQRqg9lJYx+7sMuZNQoNQL8N8
	 Q/A0iRVlTMjZ/WdiYqgCb+7Hlk8UYakgmCTYZetK3EHLgqtIsRyAFtj9RVqdlynGRf
	 KW9OkJ0JdwBVg==
Date: Wed, 3 Sep 2025 15:39:28 -0500
From: Rob Herring <robh@kernel.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_nguyenb@quicinc.com,
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
Subject: Re: [PATCH V5 2/4] dt-bindings: mmc: controller: Add
 max-sd-hs-frequency property
Message-ID: <20250903203928.GA2663015-robh@kernel.org>
References: <20250903080404.3260135-1-quic_sartgarg@quicinc.com>
 <20250903080404.3260135-3-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903080404.3260135-3-quic_sartgarg@quicinc.com>

On Wed, Sep 03, 2025 at 01:34:02PM +0530, Sarthak Garg wrote:
> Some platforms may require limiting the maximum frequency used in SD
> High-Speed (HS) mode due to board-level hardware constraints. For
> example, certain boards may include level shifters or other components
> that cannot reliably operate at the default 50 MHz HS frequency.
> 
> Introduce a new optional device tree property max-sd-hs-frequency to
> limit the maximum frequency (in Hz) used for SD cards operating in
> High-Speed (HS) mode.
> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  .../devicetree/bindings/mmc/mmc-controller-common.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> index 9a7235439759..d6b785cb2bd9 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
> @@ -93,6 +93,14 @@ properties:
>      minimum: 400000
>      maximum: 384000000
>  
> +  max-sd-hs-hz:
> +    description: |
> +      Maximum frequency (in Hz) to be used for SD cards operating in
> +      High-Speed (HS) mode. This is useful for board-specific limitations,
> +      such as level shifters or others where the card cannot reliably
> +      operate at the default 50 MHz HS frequency.
> +    default: 50000000

Why doesn't max-frequency work for you? I would think frequency limits 
wouldn't really depend on the mode.

> +
>    disable-wp:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description:
> -- 
> 2.34.1
> 

