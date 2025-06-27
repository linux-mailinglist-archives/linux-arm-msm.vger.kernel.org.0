Return-Path: <linux-arm-msm+bounces-62875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805CAEC039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26E01C6006A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8487220FA94;
	Fri, 27 Jun 2025 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQ1rcBXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5E6CA6F;
	Fri, 27 Jun 2025 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053209; cv=none; b=gyrH++avsTiD1io13pfFob+7SMPb393L33QGuIdJOyRJUoUekT7w8M0cyybz6kxsbYSCdwaYBLN1l+Fhkm326Yqpzrw1a36JimGnncQ52VlQdteTFIPLAN6Q7NU21a/F4mTybPQ3ZMGLsajE/Rmdq1gb3KVGsGAt1y9CP3rqoLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053209; c=relaxed/simple;
	bh=QBQ5PbKZcuWX1G/YfP/veVQZ4ZF54IS/+gFkJ/EWdDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9Axn4+2nve9rirFaJBDiuuDaMDCvsTWTRGvJZ1qabpcvEbGYr0xdjJamjnLynPFt95jbpNoiQDidnkYcz4Ns4ws3KJm6xzWPQwuvoJIiJ+HzSjzlDWXYeqj1L5a3YyfAB48MbxGTzMrhyWvUGFsxzk/+u1v0lR4QY3VmY0K9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQ1rcBXH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76E3C4CEE3;
	Fri, 27 Jun 2025 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751053208;
	bh=QBQ5PbKZcuWX1G/YfP/veVQZ4ZF54IS/+gFkJ/EWdDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ1rcBXHg3aw9LDgs/KzYu8roJFYuFH+VxcwSO/Mk0opubVEpt9SIZa30d1gbhdau
	 3Pt00B/ImQEwKkR6tyiHphSqGBlzwOaaemO1QoRnI4WadQ+BKRPiHY90HlQIumk/l2
	 qZ0+EApyeTZcPBg19qzQlNs0b1bjbi4wxSDylK3vS5GUqlR8oCdKCej3pLvqpJRd6w
	 2JPdL0tlzRu/WCv4UGHQmPaft6ht06WaD7HjToIk9HtiMGylnzwjWYs1WvqjohXNge
	 UzuoWaVzpju/jUiRxOCH1LLWyv1soBzqG0fKo8Xaf/0hZ8mc+MFkbNDkc/b7yqnYMN
	 E7no2SG8Ww+4Q==
Date: Fri, 27 Jun 2025 14:40:08 -0500
From: Rob Herring <robh@kernel.org>
To: Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] dt-bindings: mmc: Add sdhci compatible for qcs8300
Message-ID: <20250627194008.GA4055609-robh@kernel.org>
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
 <20250619070224.23428-3-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619070224.23428-3-quic_sayalil@quicinc.com>

On Thu, Jun 19, 2025 at 12:32:24PM +0530, Sayali Lokhande wrote:
> Document the sdhci compatible for Qualcomm qcs8300
> to support function for emmc on the Soc.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Bindings come before users.

> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 2b2cbce2458b..5ba2da8dbc7d 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -45,6 +45,7 @@ properties:
>                - qcom,qcm2290-sdhci
>                - qcom,qcs404-sdhci
>                - qcom,qcs615-sdhci
> +              - qcom,qcs8300-sdhci
>                - qcom,qdu1000-sdhci
>                - qcom,sar2130p-sdhci
>                - qcom,sc7180-sdhci
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 

