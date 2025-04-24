Return-Path: <linux-arm-msm+bounces-55279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AED3FA9A485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABDD916F3E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557BF1F2C56;
	Thu, 24 Apr 2025 07:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+YPQDwb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C8F1F1520;
	Thu, 24 Apr 2025 07:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480510; cv=none; b=GsSKWmqqq3DUMe/7IOh31LsY4Y8dRuYVvDd0CXv44bFTODpJyJZWkeux3EOz3MDPfPRU/Z2C8dvfXzRK40zj+X6NtV9LRvBcgvqfKJXi8Z8hw+AKZYHGAj8v6nF0zXEJ4bN1NV/ZYZGjHfIR10vIaLjmZPmc5FStdKNl+/WZ8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480510; c=relaxed/simple;
	bh=Rln/ecTqDzkn2EEImME3bcgjSb5k+IMJNatHEmwxhhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJ3cLSYLDh7FWQzXkyxOC/Uohzkco6AAqkLrdT8tHKw85ZatrQ4w3vOoaL8EOFNkRHRjMPRfaoU0D/iqRWG+KgFY0jFdXh3c82t+1tUSXLlATe3HMHZR286GWQKuJK7uhdcEv2O/BTpp1LdV+1NQEyhM5JOEsUCqpWY7Hj/cKuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+YPQDwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F70C4CEE3;
	Thu, 24 Apr 2025 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480509;
	bh=Rln/ecTqDzkn2EEImME3bcgjSb5k+IMJNatHEmwxhhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+YPQDwbVqC5K5izTZgCEhSQZwQUnGXEytAmw5w0nUsFCOAFXP2mgq9RrqjPIK+vj
	 ahE/34DnCkqikBp83aiuRXd/AVE0u8U322NaOawJqKEzA2UmQRfYTtvvDDWej4NivJ
	 qb8sztCer8fPMaT/OOy06bjvgSRFVcxKGu6Ss0SahT3Qz/QoT7ZR3gAgzKIqJu6fUM
	 /DPTSTGbrywzU9F3QPOnMTUG1ODHQLsNgf5hyJTHaXYH0tBZV5aoPQRbcKsy/uVLaG
	 jDOYKMJUFq1gvPxBML7gouZZofEjf2MHdOLKrTSVqRni1CHJk4/y4BzjM2VqParikq
	 0mwKjX/blylnw==
Date: Thu, 24 Apr 2025 09:41:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Songwei Chai <quic_songchai@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
Message-ID: <20250424-silky-wombat-of-chivalry-42cdff@kuoka>
References: <20250423101054.954066-1-quic_songchai@quicinc.com>
 <20250423101054.954066-2-quic_songchai@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423101054.954066-2-quic_songchai@quicinc.com>

On Wed, Apr 23, 2025 at 06:10:48PM GMT, Songwei Chai wrote:
> +  in-ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    additionalProperties: false
> +
> +    properties:
> +      port:
> +        description:
> +          The port mechanism here ensures the relationship between TGU and
> +          TPDM, as TPDM is one of the inputs for TGU. It will allow TGU to
> +          function as TPDM's helper and enable TGU when the connected
> +          TPDM is enabled.
> +        $ref: /schemas/graph.yaml#/properties/port
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names

You did not address my previous comment.

Best regards,
Krzysztof


