Return-Path: <linux-arm-msm+bounces-83918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24000C95925
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 03:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1559B4E05CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 02:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0D3146D53;
	Mon,  1 Dec 2025 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lxIgMAkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F95F33985;
	Mon,  1 Dec 2025 02:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764555448; cv=none; b=lkwzIvRPxPcL4NmrBDxSnt67MJCgh1rEWUcpBfv5LLVC+QV/X40ySl4oFxCFk9wBpZetoysYuSu1kb0NWix/MMhH65RttzCiS5jCGk6ZwJWT/fHpcpw2q7MVX79QPsz9etjXX9WfAux1h2ksjhFt79iZhuIEQ3YYsEQkTZEH4V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764555448; c=relaxed/simple;
	bh=NXE+KwdLHnlVDGJScFwIg24Gl2Nt5NedqUdIWzC++zI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=sFuxzKVeURUwg5c1qoC8m2zM7eFrrskRHe991tAfOkZ+ISlkQIiMBbF4VCqtG0JWfxqEpWL7qS8+0MIcWnN9Y40tUOPSugBEPvob80Xwh9pHK2YzIhiirBg5CmYa65rtZcHFVlZAydSPGG5njWCIKMTjtWwUMJdVCVq8ctkwFoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lxIgMAkn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5477C19421;
	Mon,  1 Dec 2025 02:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764555447;
	bh=NXE+KwdLHnlVDGJScFwIg24Gl2Nt5NedqUdIWzC++zI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lxIgMAknXqTnju52hZGNDrxGnTi251zMmyB8axhl2CRCFBz+JeM9s3v6quT3NLJtp
	 7AWTBCk4KH3IcMeZOwWhC4PX6h1Tmmev9RmYqwNdm7dsbo5POxkDNA6yBhobtA69X0
	 SozqpqzJ92HNdq0t4yW65iOQVvAl+Cy8SPA/Wxg1kIxLrBQEZxmSIwsGiBCT1ZgE2o
	 6cLmM4Utj7CA/CyOmxmfTQ5HQuDQlFjKpccEyHE9uTTtIGCKzbIMXPXoQUAb/orzyk
	 rDQlJld9odd17FyKD4rWIU23ZYuPZ9CLMCDyQj2/QJedftqweQAIXHaEzh3m7C5662
	 rvCWzz1xZ3WhA==
Date: Sun, 30 Nov 2025 20:17:26 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <20251201011457.17422-2-daleyo@gmail.com>
References: <20251201011457.17422-1-daleyo@gmail.com>
 <20251201011457.17422-2-daleyo@gmail.com>
Message-Id: <176455544510.1847568.3828451438734299102.robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: arm: qcom: Document Microsoft
 Surface Pro 11


On Mon, 01 Dec 2025 01:14:42 +0000, Dale Whinham wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add the compatible for the Qualcomm X1-based Microsoft Surface Pro 11,
> using its Denali codename.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251201011457.17422-2-daleyo@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


