Return-Path: <linux-arm-msm+bounces-56487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E4AA70AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A51BE17607E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 11:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E07222D4C8;
	Fri,  2 May 2025 11:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puzm0WPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BD1BEF77;
	Fri,  2 May 2025 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746185762; cv=none; b=IHjqMqB+Q40FtFNIjnnSnzFanS4A24FG+NrwCHv/rz0GDJa7NeJg2zjHhC/tsMdzI5YvwGTRya81yNdeRhyAlsF0TDYxqbP9//m/CSDA4v7kRRHL+DJ4AI+llMzeMACdeC6lYrV9yB7CnBNJxPC8TT4i7M/lXBYVpOa3NJugUTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746185762; c=relaxed/simple;
	bh=IC+tFmMgGc8gy+XWT7MuumYI16SywRq+USGzBe2YkhM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UjgXgAPI47W8SBALaZlqZmsMoJHMJpK4uWMPPm+GbjIpts6tZTtbgsRw7B48JZTdCGi8jwAMLSDK8jBxImIvVqd8GXcNmRN1HL0RYKd6EzU5I4ykGql3AYhzKGnUj+A/UKP0L+S5PzAz0OODtvkPbV5QAOkptvxqqgZBwU318FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puzm0WPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0716EC4CEEB;
	Fri,  2 May 2025 11:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746185761;
	bh=IC+tFmMgGc8gy+XWT7MuumYI16SywRq+USGzBe2YkhM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=puzm0WPUFl9KxGEZ1hy/8EHzZGrBQnl7zP3MluGp7vWlEzgGjHjRRCji2j1GWnfkh
	 R549rpDu2xN/MlxXHxKTemfaBYIKQi9IeEpRfwq8B9kXEG1L7l5eHMiK5CLF0q9WcO
	 v9+usY+wk8Fo7Mz6JRzsnSUZfoiwiPTXKFOsuFQSeHpCZ5tfExInO+ABBc064vgA7L
	 9+ZvnLJ8SOcjOijeqTDD0lbzy5vyYThlnA6ktDzc8tWovDVkWf0F4xTxZANnLF7/CB
	 P1G8at6YADbYBZxPrlYBaPgJ4ia44RGMEMmzQ62lUL0MaEk7kmL9938qph/IKfZDWV
	 xgnBrTlXCQJsQ==
Date: Fri, 02 May 2025 06:35:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com>
Message-Id: <174618575948.666955.12764440519077221270.robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC


On Fri, 02 May 2025 14:15:43 +0400, George Moussalem wrote:
> The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
> input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
> ethernet (50Mhz) clocks.
> 
> Unlike IPQ9574, the CMN PLL to the ethernet block needs to be enabled
> first in IPQ5018. Hence, add optional phandle to TCSR register space
> and offset to do so.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  | 11 ++++++++---
>  include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
>  2 files changed, 24 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml:55:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.example.dtb: clock-controller@9b000 (qcom,ipq9574-cmn-pll): 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250502-ipq5018-cmn-pll-v1-1-27902c1c4071@outlook.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


