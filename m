Return-Path: <linux-arm-msm+bounces-45655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F28ABA179A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 09:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34149164799
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 08:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045671BAED6;
	Tue, 21 Jan 2025 08:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQyJN2kN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC65D19E968;
	Tue, 21 Jan 2025 08:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737449788; cv=none; b=dSVLkLqe1pHX/eVLcTIn2+raS93AbKpHSr4wpulOVVriI2GBZfi8EL7Xrea5oStwIKvDqCIi5frRnoU/doqo476Fg35a64a08VojpSkOizjhFTn5/aONMMzf0sdKupHxEgj229V25VkJiizmfyFqukEHBDIYOsBvRSgQCi7KpZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737449788; c=relaxed/simple;
	bh=/J6s1LPc2A+MK8K/dg/0nl/LSBtqgegJ1hbMkv85RD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diFHQrLyZ6V81lyfFl12WfDBBwnEBRp1tEELHC7mO0u4bx2LkV+wA1mTRg6iAsOFFXPgDNxnL3LuWKJdZ/dx5xda5CATlrzkUmBCRepq38VEO8TguVr8K8mLc9NDum//SmvOIP0SqaaCsA+dUQ9xv6lfkUZpvEJN5B7pP4AgsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQyJN2kN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A755C4CEDF;
	Tue, 21 Jan 2025 08:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737449788;
	bh=/J6s1LPc2A+MK8K/dg/0nl/LSBtqgegJ1hbMkv85RD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQyJN2kNdstDpvP79pHO5Kom+dwnM4QNbgqNRDTvx+HfQ8wWa/0EiA/xETBhP9CiH
	 o+Wr15OOGYWDQ7OkJTIy6ayF1l7fwiBkVGs5xzQfFBEDVoRb1Dwz3stsVwFNChqQaD
	 rlyGtiOGg1Rs04rKxHB8RCzq8Weu6ViGNlWyccMmtcV+zuCtZCrR3PnmkZCSYTPaut
	 kK/pbgZw5AXmwLPBGVrrNN8mqfQxScjzfc3vdW9tEuE+73ZD3B1pvw2fgdOE/9US4T
	 6JlaDCOXuOee4fci8vIyIlNqxJDVB6Hg9PzzgVFyvMEqYhUOCgRp2G0v8AHul7ziNh
	 241haYhAiu2MA==
Date: Tue, 21 Jan 2025 09:56:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: Update compatible for remote etm
Message-ID: <20250121-prudent-cornflower-owl-261faa@krzk-bin>
References: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
 <20250121063900.3211-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121063900.3211-2-quic_jinlmao@quicinc.com>

On Tue, Jan 21, 2025 at 02:38:59PM +0800, Mao Jinlong wrote:
> Use different compatible to distinguish between different remote
> etms.

Why?

Every second time for qcom. Don't say what, we see that easily.

> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/qcom,coresight-remote-etm.yaml       | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> index 4fd5752978cd..199f2ca4b8a9 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> @@ -18,7 +18,14 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,coresight-remote-etm
> +    contains:

No, you are now saying this is "qcom,pink-pony" as well...

Sorry, this change is neither explained, nor correct.

> +      enum:
> +        - qcom,coresight-modem-etm
> +        - qcom,coresight-wcn-etm
> +        - qcom,coresight-adsp-etm
> +        - qcom,coresight-sensor-etm
> +        - qcom,coresight-modem2-etma

And how anyone can understand the difference between modem and modem2?

NAK for entire patch in this form.

Best regards,
Krzysztof


