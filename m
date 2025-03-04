Return-Path: <linux-arm-msm+bounces-50090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0A4A4CFEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 01:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9863171D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2128C1E;
	Tue,  4 Mar 2025 00:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IB+jv4b/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F893234;
	Tue,  4 Mar 2025 00:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741048292; cv=none; b=tDe+ZjLso7iL9tTivk30H1DrlAIGAvhcHXZZ/HkI+/llyrSBiTANsMw6pwn68OeFXWcd6gKvfIZpsd7H7OlXNW2yreG7yTvXM0hGbENrs5U3OLVj3uu2MPpBlbsncoY9waB2WKKEl3dmEh57wa+fkjmILxY8gBA4hnjal4r/ng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741048292; c=relaxed/simple;
	bh=5r6idPmTwzP60SqUWhl564mBKyg6hOsj15HEbUlFjVs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qVzI0aSWInYA5kd5zhH5xEm6H0PLKn6NBXZsQ8+dXET6j4yMZg/zXMtf6THKmekk4bHGlcARhs3E+mSl11cG/BHHA+GZehtmDXFnGx8DfTdqBBwZGdZ+yk9McfF4EhOIKtFvi7s8K8CiqU7KqUXDihdQ9N1xxyrGSfAMJOFfLrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IB+jv4b/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CE9C4CEE4;
	Tue,  4 Mar 2025 00:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741048291;
	bh=5r6idPmTwzP60SqUWhl564mBKyg6hOsj15HEbUlFjVs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IB+jv4b/VpWHr3i2hdRSVKiov03lFmbUbLTYGFjpCWfnE3PYSZrJOrikkJ7X8EYzd
	 gkA+qyHDwAm2Qo7gFtZ+iJbY2u+00INa6ZtEoNd56neuX61eCtdga0D+BhSzJ/JgvX
	 I+GGaJhSkg0+jaa7gNPNauhK5+aCH9ob8Z4LcDVqNa7MHqbux8tNWXI0rGnS9ma9zf
	 vf2V8A1ynAG6ID/+q/Gk9/eMFZWEdXWq+YrJn0yrTKiLnposfMpswg2QmhZfEvarC9
	 98XFZ+mCJVWJhExmjXAzYOyZpqTQrOr8FX4mUHF54dFeIp0G2Uc1rrGGwHOuwwSjN3
	 9AOksb/cI9ZRg==
Date: Mon, 03 Mar 2025 18:31:29 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Taniya Das <quic_tdas@quicinc.com>, Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
Message-Id: <174104826596.3018989.9977459897261478346.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains


On Tue, 04 Mar 2025 00:55:20 +0200, Vladimir Zapolskiy wrote:
> During the tests it was unveiled and later it was confirmed that SM8550
> Camera Clock Controller shall enable both MXC and MMCX power domains.
> 
> Since power-domains property is not specific to MMCX anymore, its
> description is removed.
> 
> Fixes: 9cbc64745fc6 ("dt-bindings: clock: qcom: Add SM8550 camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,sm8450-camcc.yaml          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.example.dtb: clock-controller@ade0000: power-domains: [[4294967295, 6]] is too short
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.example.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250303225521.1780611-2-vladimir.zapolskiy@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


