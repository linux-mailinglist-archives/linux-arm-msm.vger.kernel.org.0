Return-Path: <linux-arm-msm+bounces-28287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B994E5C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 06:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C862B1F221EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 04:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD219148828;
	Mon, 12 Aug 2024 04:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFXKeW72"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE6637B;
	Mon, 12 Aug 2024 04:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437127; cv=none; b=q53is26qSxjz6zvINwWM27h4sWBDtDKVQhTz+WAbPIYPkWzBmJQYdfX8SunEhuYCcQkd734FhaHhWLVXsmz6WWnO4N/tDpR2qLU+2gtmD6D0rolQ5i2NboSbmeoL1iVJUd1bSMnTwP5Bytf9EnXnG3rUjV3Pxq4x7ICLDhhPr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437127; c=relaxed/simple;
	bh=+HgWClLtvqkoUhEH5Ehi7rghN3Mn9HrBXqqqtbQvMBQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=dDbaGmA//Ew+ho5TveQ93y6CMP//aB604YpYIe/6Rsxr96xjUSJvjOOdlBISauGXnzKxHvpGvUM4TpcGB5/d9v91CyCNygY8Gr7yRNA6xR5NOGWFRlV14J7+h4c0uqWtCmqBg8OOXv9I4wJQjuDWV0p95inVwVa1CVEnpTuGjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFXKeW72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A850CC32782;
	Mon, 12 Aug 2024 04:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723437127;
	bh=+HgWClLtvqkoUhEH5Ehi7rghN3Mn9HrBXqqqtbQvMBQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UFXKeW72KvOgDBRYX0XohQDJm7yywGC65ZDAhEpFPYSXqjiJp0267Apzlf4aa1TwA
	 1B8zYrndXeLtTbmDu6SGozUG//S6i935Ll2IRyaSy3IMEyEPhduvzg8mqVyXVbha1w
	 UuVI7/1NnTMNy5y9XYpnUadgy9FQ0nJ10CZFqSgVvQm5rVvL9wHeKq/jvC+p0NOMtE
	 bkMJtsGIaZPL5qmaUORt5784y72qZ1bUMYi+0kepSVetfFmV3VKYkh81xsQdIRZX4e
	 nHsOM0sw3tfYZ4vjXm1OQNnm+eeBq9DWgWaoXEUUNA5F4voJtJnK/dZTK7jJDeu+RI
	 uOvlmw4cmIPag==
Date: Sun, 11 Aug 2024 22:32:05 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-2-91f370d61ad2@quicinc.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-2-91f370d61ad2@quicinc.com>
Message-Id: <172343712517.3743264.8817773470742312591.robh@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: usb: Introduce qcom,snps-dwc3


On Sun, 11 Aug 2024 20:11:59 -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Qualcomm USB glue is not separate of the Synopsys DWC3 core and
> several of the snps,dwc3 properties (such as clocks and reset) conflicts
> in expectation with the Qualcomm integration.
> 
> Using the newly split out Synopsys DWC3 core properties, describe the
> Qualcomm USB block in a single block. The new binding is a copy of
> qcom,dwc3 with the needed modifications.
> 
> It would have been convenient to retain the two structures with the same
> compatibles, but as there exist no way to select a binding based on the
> absence of a subnode/patternProperty, a new generic compatible is
> introduced to describe this binding.
> 
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible. (Otherwise if the specific compatible matches during
> validation, the generic one must match as well)
> 
> Mark qcom,dwc3 deprecated, to favor expressing future platforms using
> the new combined binding.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |  13 +-
>  .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 608 +++++++++++++++++++++
>  2 files changed, 620 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.example.dtb: usb@a600000: False schema does not allow {'compatible': ['qcom,sdm845-dwc3', 'qcom,snps-dwc3'], 'reg': [[0, 174063616, 0, 1048576]], 'clocks': [[4294967295, 12], [4294967295, 141], [4294967295, 3], [4294967295, 145], [4294967295, 143]], 'clock-names': ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'], 'assigned-clocks': [[4294967295, 143], [4294967295, 141]], 'assigned-clock-rates': [19200000, 150000000], 'interrupts': [[0, 133, 4], [0, 130, 4], [0, 131, 4], [0, 489, 3], [0, 488, 3], [0, 486, 4]], 'interrupt-names': ['dwc_usb3', 'pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq', 'ss_phy_irq'], 'power-domains': [[4294967295, 4]], 'resets': [[4294967295, 15]], 'iommus': [[4294967295, 1856, 0]], 'snps,dis_u2_susphy_quirk': True, 'snps,dis_enblslpm_quirk': True, 'phys': [[4294967295], [4294967295]], 'phy-names': ['usb2-phy', 'usb3-phy'], '$nodename': ['usb@a600000']}
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.example.dtb: usb@a600000: Unevaluated properties are not allowed ('phy-names', 'phys', 'snps,dis_enblslpm_quirk', 'snps,dis_u2_susphy_quirk' were unexpected)
	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240811-dwc3-refactor-v2-2-91f370d61ad2@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


