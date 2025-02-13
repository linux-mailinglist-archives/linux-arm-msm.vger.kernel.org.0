Return-Path: <linux-arm-msm+bounces-47869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628CA339C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 09:15:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8CBE1646E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BA7204C36;
	Thu, 13 Feb 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uH9pm+n2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8141EDA14;
	Thu, 13 Feb 2025 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739434532; cv=none; b=ThCPxDkreviMwj9E+X1qDecPVDx5d/I3IePQzLXoJqarUVwz3cznEAsX8PO5LeydckERLSKA/Lv43eB5S+ooEOJ1SYTEBA25UAiVUXAGQcD8fnWHbJAibjHRLozgx3qq/Qe3sVWDJYXyPlf4S1xGzv3qmCQDdkXzOA5CKsX1jv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739434532; c=relaxed/simple;
	bh=2v/pOGLMpoIXSGKMumA04i2swPcylOs2VVsdgyIP3OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORW5SfdkZ5BAtlhVsyYhcLyDXHssMk9IWfYjgPwxPik/r5g6ZMYFk55z0fnOWqhfTnIlTWQlKbOZjZnYD+ViP0SN1/kuj6Aurq4AnJG1rotqpW6ML2k+knIt5Zkh6b/w+xYlwqlecHCd7J4V6ICUgHu2JfKRTqQBoq2+5PLFHgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uH9pm+n2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF888C4CED1;
	Thu, 13 Feb 2025 08:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739434530;
	bh=2v/pOGLMpoIXSGKMumA04i2swPcylOs2VVsdgyIP3OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uH9pm+n2lbHi2u1TMavoszUE4WhUdVJbBERJPgz4zxY9bn0dTpJq9hteUhz4SBLuq
	 Ek/9Gcvm6GF8UrSbMxfquTuDSur8dlajHyQfgfp9WctADkFEEtqKPUDrAz4NLbiILW
	 Baqbr0+SQR3Hsdrp8jpc9fyt8qzXxNi9k9wEp5QBmElSU82qt3fmI6saRUTgZRJIaW
	 Rgi5M1VmCyZZ4pCKeIBgdXQHBdhFQ6z01mfzkgCFW+VsGgjleJ0xCmu7vSO1M/cnyK
	 GVdAyJn4aKQgSGoSsHI73rjd+U/9rP23KiQTVaSbNMDALDBRlPKZCkV+EcnGDGMPLt
	 VZcDEQx5P63Sw==
Date: Thu, 13 Feb 2025 09:15:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
Message-ID: <20250213-banana-bullmastiff-of-fascination-dbb65b@krzk-bin>
References: <20250212-lpass_qcm6490_resets-v3-0-0b1cfb35b38e@quicinc.com>
 <20250212-lpass_qcm6490_resets-v3-1-0b1cfb35b38e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212-lpass_qcm6490_resets-v3-1-0b1cfb35b38e@quicinc.com>

On Wed, Feb 12, 2025 at 01:52:19PM +0530, Taniya Das wrote:
> @@ -130,6 +131,19 @@ allOf:
>          reg:
>            maxItems: 1
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,qcm6490-lpassaudiocc
> +
> +    then:

You need to constrain everything, also clocks. See all other examples.

Best regards,
Krzysztof


