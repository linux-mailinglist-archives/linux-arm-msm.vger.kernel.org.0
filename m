Return-Path: <linux-arm-msm+bounces-84991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED34CB4FAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 08:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41A47300724F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84227299929;
	Thu, 11 Dec 2025 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzOv7Bo8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D29946A;
	Thu, 11 Dec 2025 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765438025; cv=none; b=C5qutpej/fX7W1gGu5LcLxvTrzK3e8rPkfeu70NfsfbvlCCuhfrZmM17LgyrlpZSj2gZxb8jGQq1xUhBTevAKIElEJ8U9oSdu4rzu2KNtsVdfn5Wqv+H4ogShYcNsvQc5/RxPZDLEcCr1HBCGPwplVj7mLAPz6ZQiMK4PuRHwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765438025; c=relaxed/simple;
	bh=9Pn1TKGAFTdX+pqMnPKSN9bM9scXmjgHyEfUQ/iaBpQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lIPjgvsZRpnwPZpQPAuJfxxj885NRA1yjy1gSTKlTSPZg0oFR+FpZy7cTVgQbrG5NTJA1rhVXkrG/Qw1WrIXfv2+EGq06nNe4u6wMPhnqyu71eBRFgCIK0LntldpOo4NQ21krkN2kcHy5mzrdlbScWT3aQ89TXIFjWcg/FQ0ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzOv7Bo8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E775C4CEFB;
	Thu, 11 Dec 2025 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765438024;
	bh=9Pn1TKGAFTdX+pqMnPKSN9bM9scXmjgHyEfUQ/iaBpQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qzOv7Bo8Itdd1tUVpORjTIq8cHlEI4+LPTHdmUYoOGkJSVrDUD4sgJjOX3pn65GeJ
	 QquSGnlSOb8286INlggGzLdlV28KMasU9ELsKXyjQKTqK8zG3pL3fOi32N+WMGbAwP
	 Fidv8h4QB58Gwsabdfczuaxu78mvALZr9Iih74BLk6bbW1w4QkyHLE0KJQR+euzI7z
	 jSX3L7yjmGQ8XNgqvEn2gA9yWMYpcp/Md5j+LBGen9ZUsBCnsFhPNTJHMinRZRJEyL
	 M0ejpszuRqmBEchnnWeMh3tACjuhIat1v3FXoPFVtA6C2q+BbKrdYNQWIfr4nHCq83
	 lphQ8yTZbV9AA==
Date: Thu, 11 Dec 2025 01:27:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Suzuki K Poulose <suzuki.poulose@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
Message-Id: <176543802198.60924.10267408914731981420.robh@kernel.org>
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU


On Thu, 11 Dec 2025 14:10:44 +0800, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dts:36.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


