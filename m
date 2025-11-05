Return-Path: <linux-arm-msm+bounces-80411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49713C34A78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF7B446251C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5611C2ED866;
	Wed,  5 Nov 2025 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5rEvPgL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15C2ECD13;
	Wed,  5 Nov 2025 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333162; cv=none; b=UpziSOQt+WxOGMOgOltsoNI9MEeBAwmCptSpIPthFvAIc0DOXzamD2A+o+QnIy0pVOs4ImxsDzT3/oCTqmO4eDJ08x7PqM2AKoju4JBByUtJACCgkNm88bc4Ww55ks/4hBtTA2Hnh1cqsSSfjLIYTOWkCmD5TjYkYf9rToqnQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333162; c=relaxed/simple;
	bh=R+46XLhZWIOTOB+yJZKWT6BNdn0bZgAdYGeql5q9uo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9nX50q1MdzINLIx9wbFCxWfdNF+Sk215KhdJtnpp1pdKd9go2KY9v3Ac+0vp0rtD3DmeGyvchcmDqgyeXfOGCgepjK6bw1We+2JEhja4ggvZMQnFyO+ldx9CH3ib242hkH8HOn8dgBGfLtWyjqaLEs/cyTCZPe0VDc/tILpBjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5rEvPgL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293A8C4CEF8;
	Wed,  5 Nov 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762333161;
	bh=R+46XLhZWIOTOB+yJZKWT6BNdn0bZgAdYGeql5q9uo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5rEvPgLtiZgP6Drgj1xMpWAfIAzfKbYkr3fpk4qAAzc5VjqmLyczNxDurdaYR/K3
	 UksMDbqrw0cy3j6yrfRwu2kEZVAOCjh3E4e7Xz0xe0HNjZoiA0KoffiNfDeEl0v0JS
	 P9enYt94d8Esy5hI82o/52SjygMoJx+pBK7tqREk63xs+T2gwIhXavGj0kLQu30EYK
	 Y7KFegE+Bb+WRnALIf/Ms06M77X7F7h9WqmfCY+rN4AW8D7tBfAn7mLDWvZh7JGUJ8
	 qkT3MLdw24aIm4tSOC6Rc4494yEZDB6iTr95beNjt6mph5UWe3JS+4rJj1e1V7aPm7
	 bq71HEiRZjdRg==
Date: Wed, 5 Nov 2025 09:59:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-binding: arm: add CTCU device for hamoa
Message-ID: <20251105-proud-pearl-gorilla-8a40db@kuoka>
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-1-af552cfb902c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-enable-etr-and-ctcu-for-hamoa-v1-1-af552cfb902c@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 04:10:17PM +0800, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 460f38ddbd73..57dede7a90e9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -29,6 +29,7 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> +              - qcom,hamoa-ctcu

There is no such hunk. Dependency should be noted here, anyway, this
cannot be tested by tooling so no review. Please be sure your patches
can be actually tested.

Best regards,
Krzysztof


