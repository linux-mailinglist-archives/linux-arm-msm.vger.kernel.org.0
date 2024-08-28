Return-Path: <linux-arm-msm+bounces-29708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60225961F94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 08:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14DC01F25832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 06:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E83159598;
	Wed, 28 Aug 2024 06:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/QPLBsP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572FF159217;
	Wed, 28 Aug 2024 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724825982; cv=none; b=n6L+hlZtUhaThgYG79tpCbmRG/kPJSblSnVKg0xK8CfWCtKmufvQWiGDfgjAFZG0MIiaMDYZ+gK3bm4Wef2yl+w4Rr0BaFp7ntH79Mfk7OwlhY/WQobe5Qj240SEs8K5VvSQbuK8REcxKoamwMSaOlAezQaOjYTSXaZg5a45mvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724825982; c=relaxed/simple;
	bh=aU4gyBsny6IrrUpfPEazxXaLn0QqsPUZFJya+AVYBjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3TsOp82NEDKaCnPJ/VY2kE1AdTXs8oaqR+AqD8gNk0IYkNMG3g3zIbgKRag7pU4GFKsVQCC+VSPXe4ZaULmqLlpjKjKkfNJhmY70sOX1Qt5l6w9EBamZGGIEH48J6Ark1iil39Ppd0awhvSvBpozIXyw2vJW1rY5RZFOAyHD/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N/QPLBsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397D2C4FE9F;
	Wed, 28 Aug 2024 06:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724825981;
	bh=aU4gyBsny6IrrUpfPEazxXaLn0QqsPUZFJya+AVYBjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/QPLBsP8s6VJSJ+g+gvRF5MfWN6r5lKGB7A9b7gS0Zv8jKX+UMttCT0FzFb9AXCg
	 cu+wQMJg+SLZvgNyBr8R0JVO468XdiXuSAFg1Sazu9Dkr610lNeRLbQWim+td9SMT5
	 UKKqMIbwf/2kwetPqn7EGEIrlc+0QwjsEXr7XoMO66bBBD+MBpI4MWsD2DCwXKq+pI
	 kGWoMQ59Fw4XXlgvgNbm+R/jaBxmTnyGX9JzWMyUeUU/GQxWsXlopMKPD3rotjv+jN
	 ugScZT09rguV4XcTcpelo7ddfyrzpBrNI+q6KZMvEVqI2weO9yBENdcZ8wwqtCKmol
	 9PWj/CfC0Wbjw==
Date: Wed, 28 Aug 2024 08:19:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: arm: qcom,ids: add SoC ID for QCS615
Message-ID: <2uw6hiwwtlcqywnzqoijqplpg2ldgsgy4knnvx3mgx75gnvswp@5e562mjhmcnr>
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-3-5599869ea10f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240828-add_initial_support_for_qcs615-v1-3-5599869ea10f@quicinc.com>

On Wed, Aug 28, 2024 at 10:02:13AM +0800, Lijuan Gao wrote:
> Add the ID for the Qualcomm QCS615 SoC.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index 8332f8d82f96..73a69fc535f6 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -278,6 +278,7 @@
>  #define QCOM_ID_IPQ5321			650
>  #define QCOM_ID_QCS8300			674
>  #define QCOM_ID_QCS8275			675
> +#define QCOM_ID_QCS615			680

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


