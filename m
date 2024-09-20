Return-Path: <linux-arm-msm+bounces-32124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B8D97DA1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 22:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 281C11C21342
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 20:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51FE127E18;
	Fri, 20 Sep 2024 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtWt4N1o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776804963A;
	Fri, 20 Sep 2024 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726865279; cv=none; b=cXoqHW68P3USjo8/H12RPGSvg9ccXIM6aYSGgikoqHRbKmaWfZ1zEoLWt36MR00MlFjK7XGkq1GrOOnRH9JAdBAOCmBNpFXbbkGh5fu1Jr4vju2DtZyw4TsY5f4h8M+0NcXZRoeoT8Ecyy2/QDa6GYkrSRxK8seVpOWuL7bplJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726865279; c=relaxed/simple;
	bh=8OCDjN2C2KI6fYl48CNV2LTWXL6kQTFbRoaw5uoDF+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IjLtsbMBIU4z0ijanxng1O1JDEMZIx0VaPXehy4FJM0jxeqDLbMawrWSH5issmynZl5hJNq6Oh/Xhn+PHyJbj7apCt9+0pRrtnrsZBE4aOlf3gTKoLbi7tNTrqNS4rwQZk/N7fgnUTlLaNLghje2Z6/M0dnVhoBXbvSuv+qp0bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtWt4N1o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A2AC4CEC3;
	Fri, 20 Sep 2024 20:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726865278;
	bh=8OCDjN2C2KI6fYl48CNV2LTWXL6kQTFbRoaw5uoDF+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PtWt4N1ogh3FzN7mgsLUdZErSmozZ10riFJ8bpswHKMg3OFghlZA7lvc2jcsk0G7Z
	 I7F/1vX9yT4T6KUxJWYXeMCMTogyvg+ftBk50iEE44CmIjsDqlCEtEf4s+EFHXc8zw
	 e+tEZfQx4SxEPCAHA+kf7d4J4IYb8qCVCKh6IWzRkTEXH1Ikp5HfxdIOmMyxWsJGzo
	 4qoYM7vjef8WQMd8oNoH6vGPmE1aacN7EywxOeeunpzFUmtiYI0//8Qnsp6bQXRay7
	 L73hS1ECOP4jBzLXeuSaWmjc+ikZTl7b2B6YStp82e8n400F+mRBYjwLqYtsN8orOk
	 jnpu7OSXJrwzg==
Message-ID: <a8d0213c-1c7c-4a0a-a502-f1570b8ef396@kernel.org>
Date: Fri, 20 Sep 2024 22:47:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
To: jens.glathe@oldschoolsolutions.biz, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
 <20240920-jg-blackrock-for-upstream-v2-2-9bf2f1b2191c@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-2-9bf2f1b2191c@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.09.2024 7:47 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add compatible values for WDK2023 with its codename "blackrock"
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index f08e13b61172..cbff0313155e 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -812,6 +812,7 @@ properties:
>                - lenovo,thinkpad-x13s
>                - qcom,sc8280xp-crd
>                - qcom,sc8280xp-qrd
> +              - microsoft,blackrock

'm' < 'q'

Konrad

