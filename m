Return-Path: <linux-arm-msm+bounces-35047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 995AA9A4820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58EEA285E6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75BE209F3E;
	Fri, 18 Oct 2024 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1rd9L3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD82071FD;
	Fri, 18 Oct 2024 20:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283607; cv=none; b=kptudpTYjD7DmyPurLLmG2vEF1YChRTZ+61ozoVzRSw8OicqI/NOA+cU4U21cXmo4802y8BjKL+ZCpKk7gv2UOSZPpXco4zqVbq5BydGyVDOFo5bh8cLrNHbvX3qbR5DUHvyFC2jBNRdiHTw1EWhqkqJTZpRNwDvg73JBPcj/ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283607; c=relaxed/simple;
	bh=gs3qwXar/TMZbhAt9kn557Uyg1jXLGIc8AuHgHBdg+M=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=tzZQNL5GFgALab4lbYZwT0R7Ea+4TXFSnAN1o+ezwFJIO9msKuJxHjWXcL0F/jzpiH2mIL1vs3CnjVYVg8lJWkZWkxIrmYKM4wqWln2ZasoR49KwRQuA3oAoXpds6iP6upZOXoP6IU5bZH9kJQOBYGQqTluYCQPmRIzjyjkVR5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1rd9L3Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FBBC4CEC3;
	Fri, 18 Oct 2024 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729283607;
	bh=gs3qwXar/TMZbhAt9kn557Uyg1jXLGIc8AuHgHBdg+M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q1rd9L3Qgx/c9sY2QC9wQMM7SZ+DctwfTyyTyfV92q/CBhit60gSLHwFaGz6oDc38
	 pYVgN4E894npEjMUuxjclJIgeUHh+g9655/HXQuz3yNHBv7Ml1ryYTPULvpJCdxfTf
	 GusD5HOzwJ86+tAEgVdr/DpGVcfkSMvL2CEUiwTyNp3LIpwdwka2giw/TIaJH/0aMP
	 /t2bbU6mHkqsIOROel+srielNxYuL8Qm21Cx43f3jR+YMjt4uTtzGM5+xzOQnQFFmk
	 oODork7age819H760hdt9AiVpXg99kGMkF/+m0G7gzImM4bbJzomSEZuDFl0UTLSyi
	 WO2vZJORjY6Ng==
Date: Fri, 18 Oct 2024 15:33:25 -0500
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
Cc: linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>, 
 linux-clk@vger.kernel.org, Will Deacon <will@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@codeaurora.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-5-4cfb96d779ae@quicinc.com>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-5-4cfb96d779ae@quicinc.com>
Message-Id: <172928360269.1569321.4486980811380259530.robh@kernel.org>
Subject: Re: [PATCH 05/11] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller


On Sat, 19 Oct 2024 00:45:41 +0530, Taniya Das wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241019-qcs615-mm-clockcontroller-v1-5-4cfb96d779ae@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


