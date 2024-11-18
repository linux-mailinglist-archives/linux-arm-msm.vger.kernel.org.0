Return-Path: <linux-arm-msm+bounces-38195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0C9D0BE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 10:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38A67284D72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 09:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21F61925AE;
	Mon, 18 Nov 2024 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tj5S9db9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ECB19259F;
	Mon, 18 Nov 2024 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731922649; cv=none; b=DbGp9bKdEtoPmiK9ilFhyuoothIk/WN9YDdR7qvDTH7UixhwWpp83pBASDyjS0es8GvY/v93Y4sabgIhLHJ7f2wDt4mKS55TeuSqNVsanuHbPXkrrXSuJ4bm/YlQayah/2gCf8EcwSa+oFYpl9Kdgeg++oc9mqaNx1KmV5imFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731922649; c=relaxed/simple;
	bh=RQgVYHEPorJ+99MZGykNM934RDtHC2VNhtpWhmYDngE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=pcbP5XY94bjjSYzIsX0NY/D6wNCgJH+oXrqGSHuf6ofPHNb8H3FCsjmULPpwAHKjdV8wwQL/enW3MjiG87h2PXESJ8y6Aexh8ELwmDTnx0f0yGBFQOqn5GkQmMPWPME9yMPhb72wQAXqk1BIEGre/F8wufzp49iTrKtk0pcY4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tj5S9db9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE41FC4CED0;
	Mon, 18 Nov 2024 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731922649;
	bh=RQgVYHEPorJ+99MZGykNM934RDtHC2VNhtpWhmYDngE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Tj5S9db9Q4TOehcZaFU+gEWyP1/BX3Hz7ol6oIhBQw41zo4YWOm+YoD4V2trId6wX
	 F+CUO8HgnXawxMHao5lKg0w3PXs0g14Bx1CSaVm8+0XoCYLm6EKm2dq19IF1ccjdSe
	 JwxVOdmMPJTMaLFlrKpdYYrzZZDlfvT+mM8X06v3RF8aV1OjwGkQOJk0BtND4ptE2i
	 43yUn6NtewzY2NwBWgG9/McK6wf59GaH3Xr5nyJMXbK99P1LmPllZOH2rBDowbACF4
	 5jM9u8YasstS6uxNKjTDUjao6kVozzTXGU/QIC/13NF/1tXL99xpMRdEryzU0K6CMO
	 XwITIZJAkh0Mw==
Date: Mon, 18 Nov 2024 03:37:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, 
 quic_shashim@quicinc.com, kernel@quicinc.com, quic_tdas@quicinc.com, 
 quic_aiquny@quicinc.com, quic_qianyu@quicinc.com, quic_tingweiz@quicinc.com, 
 neil.armstrong@linaro.org, andersson@kernel.org, 
 linux-kernel@vger.kernel.org, kishon@kernel.org, 
 manivannan.sadhasivam@linaro.org, kw@linux.com, lpieralisi@kernel.org, 
 bhelgaas@google.com, linux-phy@lists.infradead.org, conor+dt@kernel.org, 
 konradybcio@kernel.org, 
 Krishna chaitanya chundru <quic_krichai@quicinc.com>, vkoul@kernel.org, 
 linux-arm-msm@vger.kernel.org, quic_kaushalk@quicinc.com
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <20241118082619.177201-4-quic_ziyuzhan@quicinc.com>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-4-quic_ziyuzhan@quicinc.com>
Message-Id: <173192264707.1449621.6365585789543415603.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: PCI: qcom: Document the QCS615 PCIe
 Controller


On Mon, 18 Nov 2024 16:26:17 +0800, Ziyue Zhang wrote:
> From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 
> Add dedicated schema for the PCIe controllers found on QCS615.
> A new compatible for qcs615 is needed, for we do not find the
> similar one which is ok to use.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> ---
>  .../bindings/pci/qcom,pcie-qcs615.yaml        | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.yaml: properties:resets: 'anyOf' conditional failed, one must be fixed:
	'minItems' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/reset.yaml#
Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.example.dts:24:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/pci/qcom,pcie-qcs615.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241118082619.177201-4-quic_ziyuzhan@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


