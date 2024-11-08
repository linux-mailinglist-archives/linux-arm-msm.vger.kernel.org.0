Return-Path: <linux-arm-msm+bounces-37324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D14229C1610
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 06:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CDE81F24358
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FDB191F66;
	Fri,  8 Nov 2024 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6yluCEG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF4D7464;
	Fri,  8 Nov 2024 05:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731044788; cv=none; b=f+MtacgCytO6/kXkZz13PDqeJHToi/gjNAhR5u8cnYkE9ddJ07yKzI74HOOEPurAaNSKRh9nEtQl/ODYsqB3DhXru716YCLLwrrIGIqsDhf7Se+LNiOIL/O7+z2NmEhMa9wBWmtHuUzwILkQq7ZKP3zXeEWvxzYlHdjOdWkaPg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731044788; c=relaxed/simple;
	bh=fYe34Z8q8HFUItI2/1zT7AhtmmSHkN+atBW4Rs8k2Do=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=IrARVBlNPq4+60txWmMweVq8FTM4iHA++kd2OHdCTvCnxZgSLYi+45eF+CNtwAqtAgOh5g2/jUgbiMXgTcZ8gxw3VtMwA8kWUPHvSCz4ujzV8II2j2A3OYeqkXvJGUR5Z3llsWW4xbk8PlovCAj0Bb96rhK6Iu9CtjjZNYI8gA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6yluCEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB31C4CECE;
	Fri,  8 Nov 2024 05:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731044788;
	bh=fYe34Z8q8HFUItI2/1zT7AhtmmSHkN+atBW4Rs8k2Do=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=T6yluCEGTpyaw75OItqW6JATdsXDp+WVy9JrdtECN16JUXJF8RiI3p1G4yljBlamJ
	 kUCdux0Fpw0D6AzV7cwJ4w3eLmiI1vIi3uJzyDVsqzZHFul1k/eSBeRbZM6LuDz0cr
	 MheZix/OIunz+bwZd0uPWwsHbpDBDpj3U8o/x3hsUpJYET+AQRf9fgN6akAd1cyMhX
	 +NaN4OSxFiLLA/xTcpB7YekkOQR/qUXRJOF0SZIVhms+qEQlLG21On49z8rswAjssd
	 g+/yiHBJiU7JQz5wOsNkXlcqTNaZzFOqwcER/MgAhECmRAulSbwL2o0R960pK5GSrr
	 lLbsYB2flBzQA==
Date: Thu, 07 Nov 2024 23:46:26 -0600
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
Cc: Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
Message-Id: <173104478441.565041.9851772057058427001.robh@kernel.org>
Subject: Re: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615
 Display clock controller


On Fri, 08 Nov 2024 09:39:22 +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
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
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


