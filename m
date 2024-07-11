Return-Path: <linux-arm-msm+bounces-25925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884192E26B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 10:34:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 249F128749D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936A115DBB3;
	Thu, 11 Jul 2024 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+BFthFN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611FF158A07;
	Thu, 11 Jul 2024 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686685; cv=none; b=cc4MfBygCVfJx2gMxOvqG2PczQav/wtdov/IgiOH1iQqL/rWm/071lqLI2dR3oGlqBuuNWugqpPrusp/XzTo/ilvGRWOBA5NB05+W6EplWKEl/rkpOhitQUydIQm9kqloLE6Vvt5fu/hyz2ba0un03K9i9bhXQreHtToioHQ4ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686685; c=relaxed/simple;
	bh=CzpDF9rUCAKXfcLza4LnMhJrSgTVXHqETsPHBZ/ibwY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=X+czYegM7hm1HDIKgv4XTR3ald9a3+11DOHMRWMOAMP79T/bSP6Yxd+sfHxAz5pcawMgjpKz5AdBWzoEOcO8TEiEYrMAmgCZFtSnxKU79DoBYrKgqZAiBUy7kDlilgsPkU+oXp/a1QHNLb7S4CpLLPyJtUgwrWXp1kTEbXn1E9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+BFthFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD828C116B1;
	Thu, 11 Jul 2024 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720686684;
	bh=CzpDF9rUCAKXfcLza4LnMhJrSgTVXHqETsPHBZ/ibwY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=k+BFthFNbu5T/SoTxqOHIp1h8w7JUSrHdc7CYFGFDhiz0MW9gx4zkooZkpw2ZXchX
	 s9PpqtQpM/JEx9cMAvyvRg+B6YBlDR2n5a4U4i4qdXoiZSOsGaDyYG2H6bQ7T4LYc2
	 BitSbIuaMt0DpjnlATTMoQBV7qfl1ZEDNVafg55OWHkRRgrY32Zx+GcY+PAIa4wko9
	 dizQ2JiOv/tSnCZNh9dCpLlTCNYxEJ0kiOFCIiKVw0gZ9ggdIwaA0hD7/adG2GlPof
	 uAYSkvAzgNPqxsclW6vSpt3PzUXJR1nmgQ/xL+OS4shIApjQGjMU7b+N1hjQ2lt7M6
	 P7+RPW8N4M3SA==
Date: Thu, 11 Jul 2024 02:31:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, quic_kriskura@quicinc.com, 
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org, andersson@kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 konrad.dybcio@linaro.org, gregkh@linuxfoundation.org, 
 devicetree@vger.kernel.org, quic_wcheng@quicinc.com
In-Reply-To: <20240711065615.2720367-1-quic_varada@quicinc.com>
References: <20240711065615.2720367-1-quic_varada@quicinc.com>
Message-Id: <172068668209.928451.13962575882186553669.robh@kernel.org>
Subject: Re: [PATCH v0 1/2] dt-bindings: usb: qcom,dwc3: Add minItems for
 interrupt info


On Thu, 11 Jul 2024 12:26:14 +0530, Varadarajan Narayanan wrote:
> IPQ5332 has only three interrupts. Update min items
> accordingly for interrupt names to fix the following
> dt_binding_check errors.
> 
> 	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
> 
> Fixes: a5c7592366af ("dt-bindings: usb: qcom,dwc3: add SC8280XP binding")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml: allOf:12:then:properties:interrupt-names: {'minItems': 3, 'maxItems': 4, 'items': [{'const': 'pwr_event'}, {'const': 'dp_hs_phy_irq'}, {'const': 'dm_hs_phy_irq'}, {'const': 'ss_phy_irq'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240711065615.2720367-1-quic_varada@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


