Return-Path: <linux-arm-msm+bounces-29248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 880C395AF7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 09:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4CF31C21F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 07:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08E21537BF;
	Thu, 22 Aug 2024 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWxzIZ+0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5221531C0;
	Thu, 22 Aug 2024 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724312513; cv=none; b=eW7992OzbqiTd2ImfBd2F0o4v41zFvi2Pj9t75Ex5TE9ucVqWrGG88qruWb5tnR5pF3neZtncuL00hS1coAP3ybL3a20RC6r8OSuJJJdVHXjNnUZVHX0HnaXvvpCsjQ9qJlgut7loOc7eYDwxaKQDbwBQ1ZxMIT/ScxYWbGt7Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724312513; c=relaxed/simple;
	bh=5WCyoZZ1u5HCel8M4KWf0FwvGgNtE6rKDEdZns4j3Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmf4SEg4J3xs2Z4jIG40DIWzMMvuIv45gwmih26wOOrWWDlYZXkB8gUgWg/XAlNKGs/OyGD1tNVIY3Sm0XvX8/RPMuXW7lEaRtUHZeZe1BlQJxd9BEA6oHLVgC8Wj8bruVOd0GwHdJc42KQ8SAcQI//z3GFCw+JwT2YcWgYDwQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWxzIZ+0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC43CC4AF09;
	Thu, 22 Aug 2024 07:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724312513;
	bh=5WCyoZZ1u5HCel8M4KWf0FwvGgNtE6rKDEdZns4j3Uo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWxzIZ+0DS9/P7XsFM2wVLC2XP8F5S+5+Ac2BIBXv99iL78O8vMRoj3WiPIraQZ7b
	 en9FeH7PV72OHF2Oa29oMSm2J1w0ToN2jl20r2JSFSljAKQpYpRWaTJmKOs7NR1cav
	 m++rILEEuXC2zpFhjKXWQvy9MBW2f1wyTTyniAY+sjvHzlR//1k/3u0OtgwOujXaTV
	 Grz5ev3aOVBjbn1qkkUPw1TXz4iGUSb8nKdj6XYG1kmTZT7qLDBQDbagcx3NJiiS04
	 JkKYz/XSf6Y2x3BZXF7t5bD1E02xGtZVh2K4ty9SSS9pnf1hotGoAHwYw3iOwyjjMu
	 iWzI6rRsSMXbw==
Date: Thu, 22 Aug 2024 09:41:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add qcom,qmi-id for remote etm
Message-ID: <x45dqaramqjwqjmwf5fbagzsrzb4f4qaohpaaohrdfjkmq2oil@x3sz4jeqnmj5>
References: <20240822064122.5231-1-quic_jinlmao@quicinc.com>
 <20240822064122.5231-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822064122.5231-2-quic_jinlmao@quicinc.com>

On Wed, Aug 21, 2024 at 11:41:18PM -0700, Mao Jinlong wrote:
> qcom,qmi-id is the instance id used by qmi API to communicate with
> remote processor.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..27e5f18bfedf 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -20,6 +20,13 @@ properties:
>    compatible:
>      const: qcom,coresight-remote-etm
>  
> +  qcom,qmi-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This id is used by qmi API to communicate with remote processor for
> +      enabling and disabling remote etm. Each processor has its unique instance
> +      id.
> +
>    out-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      additionalProperties: false
> @@ -31,6 +38,7 @@ properties:
>  
>  required:
>    - compatible
> +  - qcom,qmi-id

That's an ABI break.

Best regards,
Krzysztof


