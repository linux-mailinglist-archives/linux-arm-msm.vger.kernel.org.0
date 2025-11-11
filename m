Return-Path: <linux-arm-msm+bounces-81232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5C7C4D6CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 12:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A2944F4029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB163570BF;
	Tue, 11 Nov 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bdk4nOGU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7F351FAC;
	Tue, 11 Nov 2025 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762860757; cv=none; b=iv1PCbpph9n/nHqtuZKFPHpW581icu5RqOxfasM3Z1L8xRloDwsOsz2Ry9kEmNRXeIpMzJG1s8ICZC1jgpda6cKrGTqayXTbNhjmmhUF5uzDk3NGLqVIXWU8W0Vaxrxi11o6wmtGF+40O8JikoV1t/f0aNg09kse3Rk4GdTQfy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762860757; c=relaxed/simple;
	bh=V/R/fkJJkItwm+6N2Ddx4DMHXtmIlw1DhrCfor2usuM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dZVdSsCZte/qlzhDuDxOQUFhg9hcL0tpqmc3mF0Q0pnrK1zIUlxmC56D9iRSY2oD9S6PKBzvyszRRUSeBnKj29mLprHQo3I63e3aUALV5YdMP0Vz3QFhzPlpgJObd/3PboQq2KfEC9dtad3A81mjK2C2yjfsrD6niD8He1ch/WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bdk4nOGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C110C16AAE;
	Tue, 11 Nov 2025 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762860756;
	bh=V/R/fkJJkItwm+6N2Ddx4DMHXtmIlw1DhrCfor2usuM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Bdk4nOGUCUwSAM84sqwYyE7Q+6AQUWMimRfqEJnsSVvmNhMoK5F4qfMM2gNwFj6Gt
	 vTM1zTLJHSH94YN/aF3BeZv8MNEpJ90J6oxUOmwQEy9q7LE95rfnyTe2qoNm1+JtM8
	 PVTeeDqK8tWiau5MAChMXTScXOUyvQBzKo47uFHyYBlonqn7dq1DeQ7gvnuDe0lCb+
	 9kw1qFSsoRdQ+ndLmgMKpjIc8WM0DbCJrN53a6kFIfpwJ17dv5L9dTbhzf2RmqIsZV
	 DtScx3NlLx0tgwHAB2617s4mUriDGz1/nJx1tjSflMl+xjmpAkllxGAflX6/o3ZeBH
	 H12e/83S1N44g==
Date: Tue, 11 Nov 2025 05:32:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
To: Sudarshan Shetty <tessolveupstream@gmail.com>
In-Reply-To: <20251111104245.3420041-1-tessolveupstream@gmail.com>
References: <20251111104245.3420041-1-tessolveupstream@gmail.com>
Message-Id: <176286075476.2360625.8458719015985662424.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add waveshare MIPI-DSI
 panels support


On Tue, 11 Nov 2025 16:12:44 +0530, Sudarshan Shetty wrote:
> Device tree bindings for Waveshare MIPI-DSI panels
> of various sizes (5.0, 5.5, 7.0, 8.0, and 10.1).
> These panels require proper power sequencing via an external
> regulator and a backlight node for brightness control.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  .../display/panel/waveshare,dsi-panel.yaml    | 84 +++++++++++++++++++
>  ...waveshare,touchscreen-panel-regulator.yaml | 72 ++++++++++++++++
>  2 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.example.dts:23.16-34.7: Warning (unit_address_vs_reg): /i2c@980000: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.example.dtb: /: '#gpio-cells' is a dependency of 'gpio-controller'
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.example.dtb: /: gpio-controller: 'oneOf' conditional failed, one must be fixed:
	True was expected
	{'compatible': ['test,gpio'], '#gpio-cells': 2, 'phandle': 2} is not of type 'boolean'
	{'compatible': ['test,gpio'], '#gpio-cells': 2, 'phandle': 2} is not of type 'null'
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.example.dtb: /: i2c@980000: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.example.dtb: /: 'compatible' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.example.dtb: /: 'model' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml
Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.example.dts:20.21-37.11: Warning (unit_address_vs_reg): /example-0/dsi@ae94000: node has a unit name, but no reg or ranges property

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251111104245.3420041-1-tessolveupstream@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


