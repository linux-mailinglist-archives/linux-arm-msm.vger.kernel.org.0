Return-Path: <linux-arm-msm+bounces-68393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A626B20D03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:06:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE7A17F0B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 15:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AC72DFA25;
	Mon, 11 Aug 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYHFpV0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F7C2DF3F2;
	Mon, 11 Aug 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924549; cv=none; b=lovPsJXW30LMxcM+DNktDYYmRu+lp+E3qC763zraIAaN2TI7xkf3Zmp/85QQD3v3bFbigGA5r4cOc44h9liqlsbfzAvQsz9856NskA+12YU/TeoTyHPAqe9SUFdtJiGKWlbrRC6RUyh0ywNGjTUeWHyWQ/CSEut7KAeH1h7fnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924549; c=relaxed/simple;
	bh=jJoLAVezPU1buWN29GzwKEGln1MoMx0OWBXK+R1plKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhTg/fsu/g1sky92JmDZ8dITsMzHYDXs9XFGNCDnNfMHH23mQHqY6YdkPwOF+LI7+esoTz+wYevMISFZF34TsJTASq1LDIwTazf1BHB5RJSTP3A0ymmDHhLDIbvrk5pDX2o7TjXVpDPApvJOHnNhbHJsP5AdwyuDDGkQ4o77JqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYHFpV0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B9DC4CEF5;
	Mon, 11 Aug 2025 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924549;
	bh=jJoLAVezPU1buWN29GzwKEGln1MoMx0OWBXK+R1plKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYHFpV0RvSYMCnQn8ztGXzou+dfcbniPNOGJxZFnBhU0Qc93aVjnInBNDqkkw6KXl
	 4e9IYdVCGcclZcx9zy5rtKM/3tTjseBuLGesNUCNsPP0XH2a3ICuMfzHXEBlT49rC5
	 48l1skQHcACrb0kmTKvsEDIHF+F46CBqVXBSk7K52RDza78b1C6EzphwvIu8FeDsf+
	 AMDm2/DPIMnmKd6rO5gFoRfxmqiZBx1nmefXjYV150TQi4RNXtmwKcn624CsUtm86v
	 4TsQRcSxSmxhJG0BNh9176dBY1QuVBRGTFM9/eM4oWGkN6SBm+Lkk6knYZ5j3SD4Ug
	 wyCH2mbMEKL+g==
Date: Mon, 11 Aug 2025 10:02:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: mani@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com, 
	bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, agross@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/4] dt-bindings: ufs: qcom: Document MCQ register
 space for UFS
Message-ID: <gcjyrmfxv7s2j7zkm5gcfn7bmuihq4lrm7cwjgpax6hnok7pxm@wanm5thogmzd>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
 <20250811143139.16422-2-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811143139.16422-2-quic_rdwivedi@quicinc.com>

On Mon, Aug 11, 2025 at 08:01:36PM +0530, Ram Kumar Dwivedi wrote:
> Document Multi-Circular Queue (MCQ) register space for
> Qualcomm UFS controllers.
> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml        | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 6c6043d9809e..daf681b0e23b 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -89,9 +89,13 @@ properties:
>      maxItems: 2
>  
>    reg-names:
> -    items:
> -      - const: std
> -      - const: ice
> +    oneOf:
> +      - items:
> +          - const: std
> +          - const: ice
> +      - items:
> +          - const: ufs_mem
> +          - const: mcq

So you can either "std" and "ice", or "ufs_mem" and "mcq".

Does this imply that "std" changes name to "ufs_mem"? Why?
Is MCQ incompatible with ICE?


Please use the commit message to document why this is.

Regards,
Bjorn

>  
>    required-opps:
>      maxItems: 1
> @@ -177,9 +181,9 @@ allOf:
>              - const: rx_lane1_sync_clk
>          reg:
>            minItems: 1
> -          maxItems: 1
> +          maxItems: 2
>          reg-names:
> -          maxItems: 1
> +          maxItems: 2
>  
>    - if:
>        properties:
> @@ -280,7 +284,7 @@ allOf:
>      then:
>        properties:
>          reg:
> -          maxItems: 1
> +          maxItems: 2
>          clocks:
>            minItems: 7
>            maxItems: 8
> -- 
> 2.50.1
> 

