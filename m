Return-Path: <linux-arm-msm+bounces-36734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C859B907D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 12:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CDD8282934
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B6D19E82A;
	Fri,  1 Nov 2024 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhzaQ5yb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BE419B586;
	Fri,  1 Nov 2024 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461342; cv=none; b=fCUr3kLDF+Zz1BdquZoBK/7tZEJm7op4NAYmve1sDSocHFCwumD6NsrzLTSv82u5MWpOHlL2A3PIy3/ZZVnmJkgHTniI42IE4GT82vZWC9keMXpNsV5dEkzAKrcuN9qpMWnIqWe5V0iqRzMtv0uIkwU3RpDbs3aQfuhKEQROiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461342; c=relaxed/simple;
	bh=bKQhNZTPEmk8K4/4hX6A5+BjPeSQ5IWyhVduxqcPwfA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=EXOthBTNSQAOBw9q0xPfjuUq04mBZ+8zhN5O0V1ttPN4YaGa6awoSe2t0fhxuD7ZaSI+DWTzzwMKjpfdUff6r65QTa4cbuMpsY3WslZLjrJTaXHTwp4WRKcLOR9S96wwN+oLMx1kGPvClrbqUk4oCdNmkcCEZLuUPp9+yFfillw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhzaQ5yb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051DFC4CECF;
	Fri,  1 Nov 2024 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730461342;
	bh=bKQhNZTPEmk8K4/4hX6A5+BjPeSQ5IWyhVduxqcPwfA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JhzaQ5ybUYLB2oHf4/2Z/D9etOS/kDCGWPxBJ7k+t22HdJdIiSmHwl09CDWVd7quJ
	 EoovQtlAT0jsLOQFuEXQj2mtulvbI7kWeSqh2NR8/du0VDPLiBORcokeAHk2CI3WzV
	 n7fYFbrXUVNtH7vQL423Qmz90Sh4RY7iBqWR4No03B/CIVayMmKTZ7ffK2dGvHki4i
	 hENyC7yNFg7+lJama3ucfcnr6UlyDZ2NIfdG7tX0Cxyon4OBUwKuVlIgvvVp3Dcxdt
	 Q6vbNu0mP6oGMKv3Jbf4Hztxg6Lxnimg9G+K4A8m5D6o1JtkXo+wj/8ThlmMsCLdJv
	 brCrojhIFNT/Q==
Date: Fri, 01 Nov 2024 06:42:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, linux-clk@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
 <20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com>
Message-Id: <173046133733.2741917.9488977607112926104.robh@kernel.org>
Subject: Re: [PATCH v2 09/11] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller


On Fri, 01 Nov 2024 16:08:21 +0530, Taniya Das wrote:
> Add DT bindings for the Video clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
>  2 files changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.example.dtb] Error 1

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241101-qcs615-mm-clockcontroller-v2-9-d1a4870a4aed@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


