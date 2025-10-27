Return-Path: <linux-arm-msm+bounces-78971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E5C0EE7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 428693B17FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D5F2F25F6;
	Mon, 27 Oct 2025 15:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYhVnaCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB23283FE5;
	Mon, 27 Oct 2025 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761577964; cv=none; b=hkLjhIDdxGxpvPxC+BOVlaX4ZWT+77uGg9ttO2Vcgsd6Hn/wXdEatnsnxL3mJiSp+A9P5WIn5BHg/8DpwWbMVfyfmZlSXRINr+eulQWimSMdNiuJ9kqUQ/JvtnNAEFzoSHHiYJh8deVf+9WjXu9UQxp9O9X3Nk+xoQ2n0IseFlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761577964; c=relaxed/simple;
	bh=Yuf62+vsNEYIGHU7qdiXEvN44cNtqtGLtjxwCQO14nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dExJ9sIHeitvQPNJnH8jvpdN0FD2Zw2yEn5FFvBx8PvYPRC+XFvRXRFqL1udeQlmjRtQLagKYVRWD1Ul8GUMrUmZyX4xFEvYoY0/s4Woei/aPm/4LxpfpVxvX2BxzI8/KUGVz99skza8iPDRlmiULIjnLw+E9wRnN3SF5AmbnfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYhVnaCN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC4BC4CEF1;
	Mon, 27 Oct 2025 15:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761577963;
	bh=Yuf62+vsNEYIGHU7qdiXEvN44cNtqtGLtjxwCQO14nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PYhVnaCNQJppJbs1m33EOMJSII6FXJ54Q46WVqlhXycChK5DLlI8YfUIU9QAZwurz
	 4BEqIJvZdZ4SnKzNRp8Te8UCAa3mT0A1Mswt9AYhJ6jkGbEBeFsqfuXkoXXADqbNUU
	 2kVQbL2lmjYguuUGX3IF2MMD/oU/Vrvu0Dc13F0En3GT878JM3VomK87D2JkaadUby
	 6zkZ6EyXnqhh8nQ2mniuhnmFEfcEpfhSISYGxw1hGztu22f7MBn+J7f1yOuJlV+h8D
	 xdIdloucDWhxWGHTB+ilVpI7hBC2M3p3HdJt9h+SaylotYOK9ZA/mIDuK9NsnR8YTy
	 pSAW+22lO/dGA==
Date: Mon, 27 Oct 2025 10:15:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Jie Gan <quic_jiegan@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: add CTCU device for QCS8300
Message-ID: <nvrjy4mqhuyngmm44l6lcst3kz7qejijvrflom2a56keqtr7zd@tu337zwgl3td>
References: <20251013-enable-ctcu-for-qcs8300-v3-0-611e6e0d3085@oss.qualcomm.com>
 <20251013-enable-ctcu-for-qcs8300-v3-1-611e6e0d3085@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-enable-ctcu-for-qcs8300-v3-1-611e6e0d3085@oss.qualcomm.com>

On Mon, Oct 13, 2025 at 04:34:37PM +0800, Jie Gan wrote:
> The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
> SA8775p.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..460f38ddbd73 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -26,8 +26,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,sa8775p-ctcu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-ctcu
> +          - const: qcom,sa8775p-ctcu
> +      - enum:
> +          - qcom,sa8775p-ctcu
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.34.1
> 

