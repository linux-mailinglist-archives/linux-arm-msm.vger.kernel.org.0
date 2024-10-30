Return-Path: <linux-arm-msm+bounces-36455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E39B6434
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB2C1C2159D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676D41EF09F;
	Wed, 30 Oct 2024 13:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMEfGjrY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3251EABC2;
	Wed, 30 Oct 2024 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295238; cv=none; b=ShgzwU+uGFsbPGvX2TEqL/UDABbq/2zxRujZcAvyE2NAITmI0sX7M8QV9IEvciTK1BFL/0HJoLmWnR4Gl4xmFQdvjGh0ZmZnUz6pcyh56GJmm6VVd1Kk1aoL4c3WlR0Jhl4rUK/gNc8zxC0xstMc6zfR97hujFOp9hUmDjZHYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295238; c=relaxed/simple;
	bh=/cvXZtoD4i+tDRYaqDH//dLStWALZWK3Mc7BtM1vj3M=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=hSnixDequECTYxy2/e0EmCU30NpTJTrlyoVaKgYsD3IKB8hPUcarKioSis7F7Eo9rq2aOHb+KLcOdkoOKi4xuQhqmxB7vssbU7HTl2tw1ZNda15LDJKk7bYkDyxbj1VZksysibdABoVD9cIycmoMdAkILAIDMF3AJ+sQRo55TuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMEfGjrY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD86C4CEE3;
	Wed, 30 Oct 2024 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730295237;
	bh=/cvXZtoD4i+tDRYaqDH//dLStWALZWK3Mc7BtM1vj3M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JMEfGjrYQg7epbEgeDHvzfaRWdBILQYisYf8sdx5L45PLskSGK10T9FRdVHQBzZQl
	 H1IIwZOEtJ1detTOPV4noHHcpLl1PXDUvFOUy/QUldd2RJQE6lxGSxLwR/TlW1Ez5t
	 N01GELabGKN3Rg+HrKdn0xT3weGKvP2GTe8HtC3LT2mzKn4tMosNG/QReK9bCvdUi9
	 eWHYaAyHZGJgQWGng2TxfNFdCiEsuc4SsX9o95/eDPlwCAHKfPE2fldhVN6clN5b31
	 n3aMUa9A4TPlB+r0z4s+KdkUs28bjNH3n7pI8MvEvG5bGPrQ57zgTKrDFyiy2+l7mC
	 7Ani+xgRmOh0w==
Date: Wed, 30 Oct 2024 08:33:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241030-sar2130p-dt-v2-1-027364ca0e86@linaro.org>
References: <20241030-sar2130p-dt-v2-0-027364ca0e86@linaro.org>
 <20241030-sar2130p-dt-v2-1-027364ca0e86@linaro.org>
Message-Id: <173029523595.389190.16064407897855389566.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom-soc: extend to support
 SAR2130P platform


On Wed, 30 Oct 2024 13:50:54 +0200, Dmitry Baryshkov wrote:
> Extend the patterns in qcom-soc.yaml to support Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.example.dtb: remoteproc@30000000: compatible: ['qcom,sa8775p-adsp-pas'] is valid under each of {'items': [{'pattern': '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'pattern': '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sa8775p-gcc.example.dtb: clock-controller@100000: compatible: ['qcom,sa8775p-gcc'] is valid under each of {'items': [{'pattern': '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'pattern': '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.example.dtb: phy@8901000: compatible: ['qcom,sa8775p-dwmac-sgmii-phy'] is valid under each of {'items': [{'pattern': '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'pattern': '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.example.dtb: pinctrl@f000000: compatible: ['qcom,sa8775p-tlmm'] is valid under each of {'items': [{'pattern': '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'pattern': '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interconnect/qcom,sa8775p-rpmh.example.dtb: interconnect-aggre1-noc: compatible: ['qcom,sa8775p-aggre1-noc'] is valid under each of {'items': [{'pattern': '^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}, {'items': [{'pattern': '^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1e)[0-9]+(p|pro)?-.*$'}], 'type': 'array', 'minItems': 1, 'maxItems': 1}
	from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241030-sar2130p-dt-v2-1-027364ca0e86@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


