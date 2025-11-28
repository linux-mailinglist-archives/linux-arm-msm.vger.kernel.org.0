Return-Path: <linux-arm-msm+bounces-83712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D763C9167F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 10:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E895B34FD19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4388B302CB1;
	Fri, 28 Nov 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1K9bl8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1203F2D6E6C;
	Fri, 28 Nov 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321501; cv=none; b=LFDS270i2cu8CpMBNjuHRUlOuDcd2L1WruiKDwzqBqD3qh8i4agyjeeFJ5Sn3EMt6/S6QC5o1Gq6mAUx4UpZkc2kz2/NY6taiDjC9Fk34IDU2PBA3jg5qvuQa+5ouns7GOmMZ5boMqJEImU6XAFOzHWWv9vgwzHWkpzbvoDGYmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321501; c=relaxed/simple;
	bh=urA3vRbYJSA+ayDz/2OQFNPOIV3DQOqwUn+dvRPvpC8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XumaMGQVyouljZFfwETQgoofapYJDwRtGPqUdYIl0Urm83mkRKjAXYHj3r4dyZWDQN54Eds9EfTYOKtfcLGx0UsZcPbgh5PpTUsxKXVwEzfO+p+FQKPvnYwUKieNRb+/16SsMCbavMeKU5y4ZMmWT/BNjYvmQ3jNYX0VusBZXg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1K9bl8T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609E9C4CEF1;
	Fri, 28 Nov 2025 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764321500;
	bh=urA3vRbYJSA+ayDz/2OQFNPOIV3DQOqwUn+dvRPvpC8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m1K9bl8TyEG+7g5PnpRTmsTm7Utsewyo6extYMnT/J78ThcpBPZAgzs4WaqvHTCtG
	 gNfVS3tU+60JrGxv6w8m6hoR1QuLKDVVITv8yJBdfBlkaX6iSvhqRE5XCtbul7bvm3
	 ei0viYB76Rpkw28ENBCLaylLWQ2owhDRVFqmUgBp4fcBZssGKI1qzIizdI96AcQus7
	 DOmjo0qLgInkZaZzJ+np/pJkwgnQbSn1nHcgICyxKc5jpHo1lMqbqp6Lg996Si0AKo
	 asSSuc5q4cin6NaHu9LALKJkZ4T4TJ1BEtPrxEOEMpFLgBqJe7sC0xh3AUFHYk/lo1
	 35jPVq9N0OddQ==
Date: Fri, 28 Nov 2025 03:18:18 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, quic_kkumarcs@quicinc.com, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Luo Jie <quic_luoj@quicinc.com>, Stephen Boyd <sboyd@kernel.org>, 
 quic_linchen@quicinc.com, quic_pavir@quicinc.com, quic_leiwei@quicinc.com, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 quic_suruchia@quicinc.com, linux-kernel@vger.kernel.org
To: Luo Jie <jie.luo@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-2-55127ba85613@oss.qualcomm.com>
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-2-55127ba85613@oss.qualcomm.com>
Message-Id: <176432149887.1576904.17226304551804250283.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5332 SoC


On Fri, 28 Nov 2025 00:40:12 -0800, Luo Jie wrote:
> Add device tree bindings for the CMN PLL block in IPQ5332 SoC, which shares
> similarities with IPQ9574 but has different output clock frequencies.
> 
> Add a new header file to export CMN PLL output clock specifiers for IPQ5332
> SoC.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml          |  1 +
>  include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h      | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251128-qcom_ipq5332_cmnpll-v1-2-55127ba85613@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


