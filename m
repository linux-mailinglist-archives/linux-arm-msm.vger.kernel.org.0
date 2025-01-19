Return-Path: <linux-arm-msm+bounces-45505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC652A16177
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 12:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 486BB1886410
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772111C68BE;
	Sun, 19 Jan 2025 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrMWPgRg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364691A23AE;
	Sun, 19 Jan 2025 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737287597; cv=none; b=uBBY0nxPaPuke2nYBvr6xSaIlzm1R3beLZ5jnff1Ay7AdkrYPHCYkPdhchiwNNLSqCRpxY9QCdLbi+ZIf8foOKZOi4P2RjASvIBajdoU7BswjQe3lR/Ck1kkM4irvt9K1BszDiEWLPIx1kCEf/0z/7RmIPvDn+9qj/ZFs/OCOXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737287597; c=relaxed/simple;
	bh=znXODcQmwuEL/SkGHOkL4tLYQxUWE1ug+unvCFT44tc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rdhPunofZqXD0gjRwFeA1P0Bnt4mv/eTkI38jlIbCu3Sw33VZLJywFw2tievk6ZBSF0XXYfUNoGu9+OZXeGJp1pj573TJ/clSBJ6BCe7XQcsLVEqnTFPl1VwD688tOc0K9Ni+sdpBftxaMgz2IUhJK9OXoatA41GPoEmaA7Tyys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrMWPgRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7B8C4CEE2;
	Sun, 19 Jan 2025 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737287594;
	bh=znXODcQmwuEL/SkGHOkL4tLYQxUWE1ug+unvCFT44tc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=PrMWPgRgJBbxNykUx2yP3iiOvlnBFW3ZTUclxKyydzxvw9f8f9ZysEwhVzElqxEHl
	 Kn3u5Cdj6N1suQBw9G/orhQAN0Re7znWjW4ktkZMm/mE885jJ17AD+uBe84XYTptKc
	 WDC96+OCWvuuYhsYlt4nwY5keukxaiNJPWTpxn+MeitTXmkeJKGtEarTGPFv9Om4rK
	 dPNA5SyzikhhJIVyNrXHEg01v5GmTnYkb03rn+x2SPMPvgAlcyEh2y8wldgNwgXa3N
	 r68cEcBjK1LK+gvpvgl6tpUG6Q50Z88yFToeNbYiZqScfNmB1Oo/xktkc6OrG97SbM
	 NIxSsWqgqaJVg==
Date: Sun, 19 Jan 2025 05:53:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Will Deacon <will@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com>
Message-Id: <173728731976.808036.168078560019330137.robh@kernel.org>
Subject: Re: [PATCH v4 04/10] dt-bindings: clock: Add Qualcomm QCS615
 Display clock controller


On Sun, 19 Jan 2025 15:52:58 +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>  2 files changed, 125 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
make: *** [Makefile:251: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


