Return-Path: <linux-arm-msm+bounces-79535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19FC1D057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 20:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507E4188FEC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 19:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C7035970D;
	Wed, 29 Oct 2025 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s095q5B2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8401359703;
	Wed, 29 Oct 2025 19:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766462; cv=none; b=SOKvMvSlnI8X78nt55mXhJJitA749FcT0tCYaWQ9xojCB4hYDuexFBciJm5o+Wc5E2OaBKPiwK0GPlZKU/ODtfAwrUpydhG54ADNc8hnB6KQTKHLHPQ9i2y2b3+xHjhlSNVHFvn7idS6cVkkJvNnm1fNv3mxr4ZCR2jYiydQgnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766462; c=relaxed/simple;
	bh=ykDyK4OPipm6Fkqf2AaQ0Hw9WnFyStPdykondhC1Sug=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dQJn+SPz0zG09wlThbcevIjRk0RFjAS0IlJMMmHLUEm71wMENyi2ey6eVaS+5uMCAPzHm0xZlKGtxARB9lFm0pnNTc6WHVkxWWTPlSa7ijd0mjaCmTYc1xFo/P1E1ons/p329/jBZEmdU+rAt44C8mHCeEjd28g2Lq0C/ZCaoWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s095q5B2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB84C4CEF7;
	Wed, 29 Oct 2025 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761766461;
	bh=ykDyK4OPipm6Fkqf2AaQ0Hw9WnFyStPdykondhC1Sug=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=s095q5B2OPi9ZbBgFKTFgbGLbxOQoG9VyzdLDfMmN2xSUuvwuOncA4Qxcke8JAFGK
	 yEJJTEiohXXl9v53RI9jPLyDv2Y1iXA4VjasVBBU0BSsZI2xxEvdc4FRjjQHUoaQg5
	 PWHJfPGgiivBqZ8RugtYWDa4bxvZPV/2rPCht0STN8zBq2S1AYB/kKo89xIiOe5ZRk
	 /6C+AhGcPlacrxBmp2KDj7AjHLknlzszlOs266EBRiWH5AQWOtCrNsat3geMBFog9v
	 7fT/CLvIEaGlaE9RoetFZSKyHCkqoVE9BtL28SRY5zh2f29jTJrdsmFiz5BJ9NUwX9
	 rx3Ftcrwvb/hw==
Date: Wed, 29 Oct 2025 14:34:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tiwai@suse.com, alexey.klimov@linaro.org, broonie@kernel.org, 
 linux-sound@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 perex@perex.cz, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 srini@kernel.org, devicetree@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251029160101.423209-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20251029160101.423209-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251029160101.423209-5-srinivas.kandagatla@oss.qualcomm.com>
Message-Id: <176176645718.2481556.7862823985792459137.robh@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115
 LPASS VA


On Wed, 29 Oct 2025 16:01:01 +0000, Srinivas Kandagatla wrote:
> Add bindings for Qualcomm SM6115 SoC Low Power Audio SubSystem (LPASS)
> VA macro codec, which looks like compatible with SM8450, however one of
> the clocks macro is available in this SoC. So updated the bindings to
> allow min-clocks to be 3 to be able to use SM8450 compatible for
> SM6115.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.example.dtb: codec@3370000 (qcom,sm8250-lpass-va-macro): clock-names:1: 'dcodec' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.example.dtb: codec@3370000 (qcom,sm8250-lpass-va-macro): clock-names:2: 'npl' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029160101.423209-5-srinivas.kandagatla@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


