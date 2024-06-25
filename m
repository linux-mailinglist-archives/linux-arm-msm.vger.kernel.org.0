Return-Path: <linux-arm-msm+bounces-24089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC7916134
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 10:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D889283FFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 08:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620F2148FEC;
	Tue, 25 Jun 2024 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHu4xP1f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA2148853;
	Tue, 25 Jun 2024 08:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719304183; cv=none; b=U3/DoiKu5oAWlruGsdw/amEwNX/eX8pm2H/YujmO7thiCMGJ9WWcFidlqDc8aptR70MHnXoLhPOfdGzx1hXxN8ggJ454B46elAVvkLOJdBpV1er3m4ty2J/dZVm1Nr00CHgh8J/suWweC+N2iGkkL2uPv1hmg+BLrqyR490Hzp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719304183; c=relaxed/simple;
	bh=jmxYxe636/BiZ693P1S0stgdVUD6CUIUfhLFVMiJmcU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Be3xx6esbYXGenoePu+ldbTCsG+4FXv+N9aKAifHwyATnfIbtcKfc9uVFjR6az/3Cq1K2s4m+3V1WBcVIIJ+cxvbWUdUjB2iTsVGQfT0pfOdtBMr67sSrO+c8Y/n3lpQd4TQ8q/KeD31HXok1HkFgIV0VjC2jCHHMgcGIgOO1l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHu4xP1f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DD2C32786;
	Tue, 25 Jun 2024 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719304182;
	bh=jmxYxe636/BiZ693P1S0stgdVUD6CUIUfhLFVMiJmcU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NHu4xP1fAgOTkdA/COgPuAKfp6H2M4ONNfdDc0gJNUxYQFrM8Tv+INxOmFSkbiNwh
	 /nEmidwPX313K/bndn2W7jE/9wf8PIUmD7FlW4K4ffHchE6cZguETn0z60BLyj1b/N
	 sztUFPE4wJBfznr1yY2r+3nZD/6FVTWjABw4k9iMsXblmeZylo7k/BuM5YtDBeWLZq
	 VBmTvMFOOcnsbjZhiZH6o8MUlFi/y7Thy23/+fsTssXI/fWROnpacThyTZlqYOn5Dm
	 8WNVZ/yqFHzpaMSrh2CYVyqH5QNarGfV5CjgyMp0Nuh5xnG5CVoX1ztMyZqJALcwSz
	 V+q5waUulGulQ==
Date: Tue, 25 Jun 2024 02:29:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: dmitry.baryshkov@linaro.org, netdev@vger.kernel.org, arnd@arndb.de, 
 krzk+dt@kernel.org, nfraprado@collabora.com, m.szyprowski@samsung.com, 
 neil.armstrong@linaro.org, konrad.dybcio@linaro.org, 
 linux-arm-msm@vger.kernel.org, conor+dt@kernel.org, sboyd@kernel.org, 
 linux-arm-kernel@lists.infradead.org, geert+renesas@glider.be, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, will@kernel.org, 
 andersson@kernel.org, mturquette@baylibre.com, u-kumar1@ti.com, 
 catalin.marinas@arm.com, richardcochran@gmail.com, 
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de
In-Reply-To: <20240625070536.3043630-5-quic_devipriy@quicinc.com>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-5-quic_devipriy@quicinc.com>
Message-Id: <171930418133.2076741.5571224940926459410.robh@kernel.org>
Subject: Re: [PATCH V4 4/7] dt-bindings: clock: Add ipq9574 NSSCC clock and
 reset definitions


On Tue, 25 Jun 2024 12:35:33 +0530, Devi Priya wrote:
> Add NSSCC clock and reset definitions for ipq9574.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Changes in V4:
> 	- Added GCC_NSSCC_CLK source to the clocks
> 	- Added support for interconnects and interconnect-names as the NoC
> 	  clocks are being enabled via interconnect.
> 
>  .../bindings/clock/qcom,ipq9574-nsscc.yaml    |  75 +++++++++
>  .../dt-bindings/clock/qcom,ipq9574-nsscc.h    | 152 ++++++++++++++++++
>  .../dt-bindings/reset/qcom,ipq9574-nsscc.h    | 134 +++++++++++++++
>  3 files changed, 361 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>  create mode 100644 include/dt-bindings/reset/qcom,ipq9574-nsscc.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dts:26.26-27 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240625070536.3043630-5-quic_devipriy@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


