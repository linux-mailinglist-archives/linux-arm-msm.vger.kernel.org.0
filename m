Return-Path: <linux-arm-msm+bounces-79256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE38C1625F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCB121C254E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879913491CD;
	Tue, 28 Oct 2025 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4/Mxo6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DE24291E;
	Tue, 28 Oct 2025 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761672551; cv=none; b=jrngebjpkpygCDAzGAuHmzfGLkKpt2k6m/gExWudNI4ilDoJN33EKxOSdBwHy2LeIceESqhHcBSlS4zSkTPVblr7/2mG5jtcgHcgLYkaO1PDMlRxjQOOtUzcEdZXxusUxrcyA5pN1usO9R3NTiX4bKlEMzTVyHPAHKg2KjxxUfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761672551; c=relaxed/simple;
	bh=Wom80ZT67YTITNTpVsdfLNCY3yfm9u1godoIz9kWvXU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=fUFoH7Zc8/5EHGROHGZCisev0gtSzu2ITJIEL+nUbjN4+8VNXDq2mBRRf+GWTEEGobdiqYNNireqJEXQu+MvcjQeUVi1zbkRj9tqYEJPaKYGAR30pEIW/xh0gRflY0y4+w0aNfCCrGSb5RAXEI3VWG2psjsDKMklKODWBbJ/2Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4/Mxo6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B14C4CEE7;
	Tue, 28 Oct 2025 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761672549;
	bh=Wom80ZT67YTITNTpVsdfLNCY3yfm9u1godoIz9kWvXU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=U4/Mxo6TSNgTJk3Guhyp2Zp5E0KA7wpH46VQs+P5cZAM/Ssw5jXYf15LjemYcSJXI
	 iqJLvNJsB9aE76D4mae8Wpq5sOfnUZPt9lrCR86d+iN1ecVhpHmCo0StQ5dmFCXFFI
	 Lmkb6VJUxKRbycbhcQOsCwjP7jAfTV8TKWgZCIySXdV7SgW/0p8ay3SaltoRRZrFaU
	 o0aIKST9UaiwOMH/rq7rPeBgpmi7a6RU+lPCxhk/xInylQhgs4XJJKQrrv2X/FSYvO
	 Vjd/9p2zA3sdHerImuTTDCqUhVhkUY6dCSCs0FzPlN42Tuwna1nvvBVIrlYir4qXZi
	 4+FHV4oLLOTiw==
Date: Tue, 28 Oct 2025 12:29:07 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-bluetooth@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Marcel Holtmann <marcel@holtmann.org>, Rocky Liao <quic_rjliao@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251028-dt-bindings-qcom-bluetooth-v1-2-524a978e3cda@linaro.org>
References: <20251028-dt-bindings-qcom-bluetooth-v1-0-524a978e3cda@linaro.org>
 <20251028-dt-bindings-qcom-bluetooth-v1-2-524a978e3cda@linaro.org>
Message-Id: <176167254303.2794634.13957368391979283059.robh@kernel.org>
Subject: Re: [PATCH 02/12] dt-bindings: bluetooth: qcom,qca2066-bt: Split
 to separate schema


On Tue, 28 Oct 2025 16:31:51 +0100, Krzysztof Kozlowski wrote:
> One big Qualcomm Bluetooth schema is hardly manageable: it lists all
> possible properties (19 supplies).  Split common part and
> qcom,qca2066-bt to separate bindings, so each schema will be easier to
> read/maintain and list only relevant properties.
> 
> The existing bindings do not mention interrupts, but
> am335x-sancloud-bbe-extended-wifi.dts already defines such.  This issue
> is not being fixed here.
> 
> Existing binding also did not mention any supplies (which do exist as
> confirmed in datasheet) and Linux driver does not ask for any, thus keep
> this state unchanged.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Expected warnings:
> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> ---
>  .../net/bluetooth/qcom,bluetooth-common.yaml       | 25 +++++++++++
>  .../bindings/net/bluetooth/qcom,qca2066-bt.yaml    | 49 ++++++++++++++++++++++
>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 24 -----------
>  MAINTAINERS                                        |  1 +
>  4 files changed, 75 insertions(+), 24 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts:53.42-58 Unexpected 'GPIO_ACTIVE_HIGH'
Lexical error: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dts:54.42-58 Unexpected 'GPIO_ACTIVE_HIGH'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1528: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251028-dt-bindings-qcom-bluetooth-v1-2-524a978e3cda@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


