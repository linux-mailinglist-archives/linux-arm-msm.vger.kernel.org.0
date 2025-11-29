Return-Path: <linux-arm-msm+bounces-83877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFA1C94095
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 16:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 29CA4342339
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D28E1A9FB4;
	Sat, 29 Nov 2025 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbOyqfAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2101E50E;
	Sat, 29 Nov 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764429771; cv=none; b=tLGhwzVY2ZYdCdVzTwsMTI8U4fkH5O2oDh2ONyMJbvudjzFym2QnV5++C1+F1/KyQs+I8J3M3x6Vg686/w/y9UZjaQh3tVCLL/Eopp5ON/wNllxcRxyVN8YrtapBCOgePfa5cmlMvGPSGmtOt9DxsVi/gHAN3qhmzFn0F4CLjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764429771; c=relaxed/simple;
	bh=RfzZyrNDCnWJM4vEwdyob0uPBIIFELux1Gp3qGHDeGw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IKaW6LZAgWvtVh6c2Nb1gHR+p+O0GNOUtpueZmaZa1OADDEUMeOo0MdICGerhtYS/ahl/pATMT0cErt6Z3Q20VnT9JthZCJDNSdY+Dj/PBcm26N41/oYsaWswY4AMMvYJH8kKlKppqoHMrO+4BMgeFmQg4wgfHS/kWSmQoWwi+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbOyqfAb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBB8C4CEF7;
	Sat, 29 Nov 2025 15:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764429770;
	bh=RfzZyrNDCnWJM4vEwdyob0uPBIIFELux1Gp3qGHDeGw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kbOyqfAbUp+Mxoy/gEXMiJvo6ayZZhuGMMqrwHdHiSM9tHsYDs340ZTR5Jig4D200
	 RVlKR3A/CwW0hxPSTh9SbpLVJAJOM+t1oVcnPjeGROpcOEcqa3XPNQU3ldcWA73Erm
	 rMNfRXQZPjBw+RUSvEK43DYfHMS5J59DMwhJYo9sXmZuwxXE6uVy4WWfl8rzpSNTcF
	 kUPjyvRzo3Ftyzo3jVzwXi6cDuIfh8BzKvtlVrdk374Uaq6xMJ7nltlDgHU+mou6ME
	 CdyU9eD0U/XaA7S5pEZp8X1WmD5cxAr7e1cq4UZoXWPRS3muxIgprekVIlELfFnTnB
	 1tbodpE4EywPw==
Date: Sat, 29 Nov 2025 09:22:49 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, andersson@kernel.org, 
 linux-kernel@vger.kernel.org
To: Sudarshan Shetty <tessolveupstream@gmail.com>
In-Reply-To: <20251129142242.3661349-2-tessolveupstream@gmail.com>
References: <20251129142242.3661349-1-tessolveupstream@gmail.com>
 <20251129142242.3661349-2-tessolveupstream@gmail.com>
Message-Id: <176442976917.4054928.8877916591661919569.robh@kernel.org>
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: qcom: talos-evk: Add QCS615
 Talos EVK SMARC platform


On Sat, 29 Nov 2025 19:52:41 +0530, Sudarshan Shetty wrote:
> Add binding support for the Qualcomm Technologies, Inc. Talos EVK
> SMARC platform based on the QCS615 SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129142242.3661349-2-tessolveupstream@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


