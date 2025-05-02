Return-Path: <linux-arm-msm+bounces-56451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B900AA6AD7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 08:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02746981660
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2126265624;
	Fri,  2 May 2025 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+vtIvnA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933171E260D;
	Fri,  2 May 2025 06:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168228; cv=none; b=KWRH2DxmwCz+clBTH0j6GUL8BfSjzLQt8LNDyQfwqPoufRlLhE9cqFMrX7pJ00X+e206nOCLbptv/kNq0lFob3Y6kYqbMLgScySxrYkJvPZWEFsjq3x1PLDR8YsAIs1Q5ziDCY7C4eLFcA7pVcvlChddhht0X9IcbE/Zje1bnW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168228; c=relaxed/simple;
	bh=BNeIriVD+Uk78B5K73mGwjQJ3XL7k7AuZMqD6Ps9t6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXh7x4agZs+y1bNX1iymS/wj049mGdMOm78WEqSq9Knj3dNnGT3wotQvId84vkBBCRBDHfnPlh/4vZXO73tnRAXv4enfggdoBMarc0aPNo+YOve26/mgYGxIXxF39CI3n9j9SsEOLdZqB3ZAGzZXKtYH/v3896DlbL1MSEqtnDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+vtIvnA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B57C4CEE4;
	Fri,  2 May 2025 06:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746168228;
	bh=BNeIriVD+Uk78B5K73mGwjQJ3XL7k7AuZMqD6Ps9t6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+vtIvnAfYip84JAymD4Mblyrfer/CJjrWWSEtCM38NzLGkdsCsXWoTLXtYwt9vlx
	 FfdZoVHxtUDjrXMvm6etjr0pMbqoiHnK6iW+RBfZP9Om0aB2zny/n1hu1U9xFUKcVG
	 3taFqslrWueauTtmSNlqPEQOENTlIokoPiTtb23TXQ/peM2oi2lOgDeP26RSlIDJEG
	 nFP1mqrGgEyoxpLqF1rlSB4lvVcWGJYtTWnycfawUv8fi9U5Bvr+rWICxCa9cPhbEN
	 HWRL29bb/UuXooS+EN9PplCVfagwIZmoiYhIlxTQd0mguZdnzoyRWqiksW0H0Q7Hus
	 R1GhC/EEbNSOw==
Date: Fri, 2 May 2025 08:43:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: Add Qualcomm extended CTI
Message-ID: <20250502-notorious-granite-gibbon-1abf15@kuoka>
References: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
 <20250429071841.1158315-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429071841.1158315-2-quic_jinlmao@quicinc.com>

On Tue, Apr 29, 2025 at 12:18:40AM GMT, Mao Jinlong wrote:
> Add Qualcomm extended CTI support in CTI binding file. Qualcomm
> extended CTI supports up to 128 triggers.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2d5545a2b49c..1aa27461f5bc 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -84,7 +84,9 @@ properties:
>            - const: arm,coresight-cti
>            - const: arm,primecell
>        - items:
> -          - const: arm,coresight-cti-v8-arch
> +          - enum:
> +              - arm,coresight-cti-v8-arch
> +              - qcom,coresight-cti-extended

cpu phandle is not required? Or not even valid?

Best regards,
Krzysztof


