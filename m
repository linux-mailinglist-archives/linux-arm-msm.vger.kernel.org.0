Return-Path: <linux-arm-msm+bounces-83944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A42AC96C34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 11:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CE7A4E1436
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 10:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D47304BD7;
	Mon,  1 Dec 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIk25cNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C82FE56C;
	Mon,  1 Dec 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586538; cv=none; b=i2Ed4ro3pEz+YxhKAAIT1pJxEvrKjYpro/+YeBxGtdvzZ9CVwkyOgXEioVWmIAryMZTjVq+odQDiJkKhRt+20roLwGJoIWzxvm8MGOnuBZZfdOdu++jOLg5HGafEEvNlCQVP4wAvu+le/1hb4S1qFqDaPvRdwivaGHDpPJ7bDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586538; c=relaxed/simple;
	bh=F/qnYED/j3TKo9SNxZAkbgiWgCRUXDUU/7PxaIo6XxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXEX3rXD94pd1qGz9D9RgrvxpP4hP2LPeKjIi6QRxBzzMudbBeocXBv9M5EygtFot2lw55bR3RHi9TdpdrKVP4b/JxVeQ1dOlPq/KfQoa1vmQ2iODZqZIalYXOBvXWm4Bpk360gANqBPa/AOPrWJIROw80HHtyodsRbIAOMz4JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIk25cNl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74D4C4CEF1;
	Mon,  1 Dec 2025 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764586537;
	bh=F/qnYED/j3TKo9SNxZAkbgiWgCRUXDUU/7PxaIo6XxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nIk25cNl9z/cNZ4GjzeUZpkli8kn13aRIO7O3yKiq2fbIEKKfh9l9AsTl3tu8+wXm
	 7uLT18RTepzp8OdUvag7rK1/DY5bF04ghPCJphDU3jBSenxvySQYJCO9bCa3oo9CCh
	 ryn2KimkgROfYQO8xRTTz6UmOdkUV4Mc77MbMH88RRYdfk+NhspqrKnWpZWO+CyCEQ
	 DY5qoVOIm2STEfLN3iZIxQS+zvG6dJ3u2nhYTyPYlcs5ZPEn1+EVSqBONJaAYB4OIO
	 NlLYbazBhbBzcKJ9GiUjv2u+35j1dvJN3jDm9rH6SS9xu0GyHOnIOxNgZvzWuZvbBQ
	 ZFxoI12exCw/g==
Date: Mon, 1 Dec 2025 04:55:36 -0600
From: Rob Herring <robh@kernel.org>
To: Gaurav Kohli <quic_gkohli@quicinc.com>, daniel.lezcano@linaro.org
Cc: amitk@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300
 compatible
Message-ID: <20251201105536.GA2605195-robh@kernel.org>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-2-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822042316.1762153-2-quic_gkohli@quicinc.com>

On Fri, Aug 22, 2025 at 09:53:15AM +0530, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS8300 platform.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 94311ebd7652..7c1f121fb417 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -54,6 +54,7 @@ properties:
>                - qcom,msm8996-tsens
>                - qcom,msm8998-tsens
>                - qcom,qcm2290-tsens
> +              - qcom,qcs8300-tsens

There's no tab here, but what's in linux-next has a tab character and
breaks 'make dt_binding_check'.


>                - qcom,sa8255p-tsens
>                - qcom,sa8775p-tsens
>                - qcom,sar2130p-tsens
> -- 
> 2.34.1
> 

