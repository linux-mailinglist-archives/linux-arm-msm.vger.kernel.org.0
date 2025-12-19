Return-Path: <linux-arm-msm+bounces-85778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8DFCCE8C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 06:37:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CDA8F300EAE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A8192D062F;
	Fri, 19 Dec 2025 05:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8NsrceV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3778728641F;
	Fri, 19 Dec 2025 05:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766122669; cv=none; b=O+Dd5R9Gpo1r04sA45uqXg/HwYHTldcBbjjEJTpYxgph/sPOLfXCwiw3Gg42kPDvchhrYm1oWaAVz+IRUToahawYto8LiX8wPxxXP1s8CBeFqFqP1lYXpfI2A5ypMVWqrIDBlWRhrdKkYOhFxKXC9WX4sutSGu/yEkZzDjZEJM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766122669; c=relaxed/simple;
	bh=kqPBYCpOgXTvxxSHCVpOwQFHcphqRIEEiHlgEBAv11U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=c5MPoeiYGAeAuBak2QgZeA/5WKAq33LBeuLVuq51u8ERG8idwIgBqTtZ+BMD/LiCkYNJh9be5XIE99l2tXwBktKFSL+6fSt3yL94KNj/lDw3oAQwR4+dToaVvPwNAqFVF9xPQqUkChJ+AUDC6TA5Gvx2jRYtE7mgaq1eNDSZ4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8NsrceV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68251C4AF09;
	Fri, 19 Dec 2025 05:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766122668;
	bh=kqPBYCpOgXTvxxSHCVpOwQFHcphqRIEEiHlgEBAv11U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=U8NsrceVRjglPKRlDjEuyNkd3iLTbU0iewBcnZcz4zFkFS0Lu0rxqCJjVvtMqz6lZ
	 keLrn8me0xN92cMsN9ul5Wz0P5eQFQjRnAhcBgRDneaFZxwzvj1FzF8/9zeH2t+ID2
	 VOKWLotBETeInFUkuVLkgql09dLKIdPhtclK4hutatidOg7/qKDvEqijBEOUlQxwZr
	 /PJ1+ulUByIP5ntDKqd9tB+pZ9n8oNpCpRpHH4HnYRUjezf/Kw2AIypyTKwc95nVGR
	 tvzVPjGC5ti0YUR+Md99rVVJlwouRLqwdsMkzquZl1SnIRiCnjxnll7O2MVJAKorHL
	 MRmBwPVc0TbrQ==
Date: Thu, 18 Dec 2025 23:37:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
 andersson@kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
In-Reply-To: <20251219043425.888585-2-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-2-mr.nuke.me@gmail.com>
Message-Id: <176612266639.1689224.7230344487195576447.robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image
 loader


On Thu, 18 Dec 2025 22:34:10 -0600, Alexandru Gagniuc wrote:
> Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> enabled by the host in non-PAS mode, and are not optional. Add an
> example that uses the "qcom,ipq9574-wcss-pil" binding.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 115 +++++++++++++++++-
>  1 file changed, 113 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:49.28-51 Unexpected 'GCC_ANOC_WCSS_AXI_M_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:50.28-42 Unexpected 'GCC_Q6_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:51.28-44 Unexpected 'GCC_Q6_AHB_S_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:52.28-43 Unexpected 'GCC_Q6_AXIM_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:53.28-45 Unexpected 'GCC_Q6SS_BOOT_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:54.28-50 Unexpected 'GCC_MEM_NOC_Q6_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:55.28-52 Unexpected 'GCC_SYS_NOC_WCSS_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:56.28-45 Unexpected 'GCC_WCSS_ACMT_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:57.28-46 Unexpected 'GCC_WCSS_ECAHB_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:58.28-47 Unexpected 'GCC_WCSS_Q6_TBU_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:59.28-46 Unexpected 'GCC_WCSS_AHB_S_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:60.28-44 Unexpected 'GCC_Q6_AXIM2_CLK'
Lexical error: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dts:61.28-46 Unexpected 'GCC_WCSS_AXI_M_CLK'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251219043425.888585-2-mr.nuke.me@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


