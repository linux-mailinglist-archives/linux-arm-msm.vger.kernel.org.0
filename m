Return-Path: <linux-arm-msm+bounces-19590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 010138C1114
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 16:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2135283794
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 14:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A2615E1F8;
	Thu,  9 May 2024 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bigs+sLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750E8148302;
	Thu,  9 May 2024 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715264185; cv=none; b=p8hFM36gdkMxAyhGAav84G7ZcMjKZFVYa1shMsmkQPJ0C7tpaGRySRwB+XjZ9cNi2U5crl38PapFTl2IHXdOqhDV9G5T+8kiPoahxm5pl2bZQWbTZkQ3QqC+zlcj9IZwrzwr/aLPWlEYR38Mi7u8rEI1U6ggSj3frVaByDEo6zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715264185; c=relaxed/simple;
	bh=XRkJhCuiB3daIRYaL5K5rrnW8N4v9XFl7tzJSh3Ueno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJPGKg8Mrx7sQ5rwuMTT3WgogQTDPAnkQly1JbK0D7UOa0r4DfpwBOeZsUGnL0oFJs2CDX1kaeTL+IWWV45KL3X7bTUNNlruuH3ooBEAqIcQSJ20vUjw+tlR8w80FCtVM/0tU2DVp9OXJE+y7om4HdEZ2FElASO7NtJI7Mkb2Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bigs+sLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EA3C116B1;
	Thu,  9 May 2024 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715264185;
	bh=XRkJhCuiB3daIRYaL5K5rrnW8N4v9XFl7tzJSh3Ueno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bigs+sLbvRZM8JW3RtXJuMPnmNB6Oadc5ynxNDw1E7CQY2Tr6zQs+GfhaAWVvNoCr
	 JOyVBP1SchOgBF11dMR06BZebrvcMs8feHJ5TVF8vWSgPg1tRU74TuUKqx67UlpRVI
	 vidaeikXptqXixDPBMg0SgoreCa0fN+ILkeBc8z53ppleykDneqIjXjcXmVBo84p/C
	 7H1Yf4yjg3L0bOvYsZS26POI2U2CW+6EJFESagCqenHTXwFDDMzGfeAVb/oKQ0Myw8
	 JpCtwMXlamB7G/Y7/s+19msaetcddUY145Q41koyN4LO3uPICeQ8nsnJH62YoRHByD
	 ahShGo6fns6hw==
Date: Thu, 9 May 2024 09:16:23 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	David Wronek <davidwronek@gmail.com>,
	Andy Gross <andy.gross@linaro.org>,
	Evan Green <evgreen@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Iskren Chernev <me@iskren.info>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 03/13] dt-bindings: phy: qcom,usb-snps-femto-v2: use
 correct fallback for sc8180x
Message-ID: <20240509141623.GA1011543-robh@kernel.org>
References: <20240501-qcom-phy-fixes-v1-0-f1fd15c33fb3@linaro.org>
 <20240501-qcom-phy-fixes-v1-3-f1fd15c33fb3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-qcom-phy-fixes-v1-3-f1fd15c33fb3@linaro.org>

On Wed, May 01, 2024 at 07:19:29PM +0300, Dmitry Baryshkov wrote:
> The qcom,sc8180x-usb-hs-phy device uses qcom,usb-snps-hs-7nm-phy
> fallback. Correct the schema for this platform.
> 
> Fixes: 9160fb7c39a1 ("dt-bindings: phy: qcom,usb-snps-femto-v2: use fallback compatibles")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> index 0f200e3f97a9..fce7f8a19e9c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> @@ -15,9 +15,6 @@ description: |
>  properties:
>    compatible:
>      oneOf:
> -      - enum:
> -          - qcom,sc8180x-usb-hs-phy
> -          - qcom,usb-snps-femto-v2-phy

This is now listed as undocumented. You need to remove it from the 
driver as well or keep it here as deprecated.

>        - items:
>            - enum:
>                - qcom,sa8775p-usb-hs-phy
> @@ -26,6 +23,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sc7280-usb-hs-phy
> +              - qcom,sc8180x-usb-hs-phy
>                - qcom,sdx55-usb-hs-phy
>                - qcom,sdx65-usb-hs-phy
>                - qcom,sm6375-usb-hs-phy
> 
> -- 
> 2.39.2
> 

