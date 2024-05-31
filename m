Return-Path: <linux-arm-msm+bounces-21256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499718D5FC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67344B21C5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA24155A5D;
	Fri, 31 May 2024 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmIPKbMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBFF3DBB7;
	Fri, 31 May 2024 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151581; cv=none; b=dSv1i0S9BhMMIaivz2muCNSbiK53gCQj1SLwAhBC25qunl/GTBiCG9ZMNMe5DX4NXLxRXGRLxtB69VJUf6hvjSX0njwxbRg96vRDOckYe4XQwi09jm/Ll6xw47sKgxXKI1kacs3hpc0VDQmC6t81dyY4/CsWwHxYbu4lrYs/Q58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151581; c=relaxed/simple;
	bh=zS1pUrMFJYbBgJHf7inMI3R6nDBmusfMV1wVhQY5wE4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=GqU/NC3S3tiampSrVzI1BV06LJDpP7iUkFA3UpR7+7WtTwGU6tQ7pBsFhWA02MMfsXSIATLBUSJZPBclslTpUPMCMZ5eS51AYLNbreUMtJelORGF0a/jpq4A4GoLvItyLxS+K0aJ7IE31dmMOIy9+eR6B8LBw0OmzspYvr7WRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmIPKbMk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B15FC116B1;
	Fri, 31 May 2024 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717151580;
	bh=zS1pUrMFJYbBgJHf7inMI3R6nDBmusfMV1wVhQY5wE4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RmIPKbMkTl4jPWa7LwDnYhaXtpFK792OMWTGtvMq8hPunLB/AXqz1frtbHg4JTkIQ
	 dCxGWhGRo4msS7r+0cFQcwYMIAWOTnfN5nU5VfECJCAVZNuWs9M8VihVUTKRJJUBOk
	 CSigrA1woT9oMCZ1DUfCff+g/yUY0alMgH1VQ9EVcRca3MujEQdACR5pE3xfe8Hz0n
	 6pR1DH5p9B5Cp56Qr5agogcRnal+Ac2jiuzjKcCmKVrX3XnseGAXrDqs1NM2eux3Qh
	 q0h0PQ8365NmFFLH9AC+NwGTIttCCgqVVWGGl/FkqVYDeLu9qwVfCNv2TK107KkZ+6
	 5A56fjdzLZ/uQ==
Date: Fri, 31 May 2024 05:32:59 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20240531090249.10293-12-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-12-quic_tdas@quicinc.com>
Message-Id: <171715157923.946292.1937976037620674033.robh@kernel.org>
Subject: Re: [PATCH 11/13] dt-bindings: clock: qcom: Add SA8775P display
 controller


On Fri, 31 May 2024 14:32:47 +0530, Taniya Das wrote:
> Add device tree bindings for the display clock controller
> on Qualcomm SA8775P platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,sa8775p-dispcc.yaml   | 88 +++++++++++++++++++
>  .../dt-bindings/clock/qcom,sa8775p-dispcc.h   | 87 ++++++++++++++++++
>  2 files changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.example.dtb: /example-0/clock-controller@af00000: failed to match any schema with compatible: ['qcom,sa8755p-dispcc0']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240531090249.10293-12-quic_tdas@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


