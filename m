Return-Path: <linux-arm-msm+bounces-37326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5769C1619
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 06:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 158B4B22B09
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1491D0DC0;
	Fri,  8 Nov 2024 05:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfL29KIL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9631D097F;
	Fri,  8 Nov 2024 05:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731044791; cv=none; b=Wg5GVIvI5S3MalhhQmAqA+Y8efnpNv47HkwxaldBKWoZg7xjXOjsH4g9dfS2TF+zxcnrGJzer/JnjYlphhJzm6hyOh0zfZ66X4TI0PRxMOUYEfdoe3lppU0pYIEIgoprMmOTLg9n7AzpwHpT9Teii6blPXP+3+N+dhs9iYrC4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731044791; c=relaxed/simple;
	bh=88Rz3TmeWEqiX7bRX/GRaK1b2B87LDj6hFkEPHVeLAY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ddK42raaCZXOzInbNCPZ2TqpVV86Z2jxfNYShrtw9lBkPFS9wCfWVqmQpBy4zDcf2EfEVByUWxnvrU0bU0m+lQzc0o9ZRm5urzmEGHd4moxceMRcQH5YKyx1pscyLftvz84DjeQjtH0y96RnP+cAeZrgrWZX+pW7whhobp/G6Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfL29KIL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88754C4CECF;
	Fri,  8 Nov 2024 05:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731044790;
	bh=88Rz3TmeWEqiX7bRX/GRaK1b2B87LDj6hFkEPHVeLAY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FfL29KILvKvH/AIxvs6KGu3fX6ZxStnK5Zj8YZcjjnYBL6xVywzAjTTTt3tcnRGHq
	 QgI723lr9PV2mlUQ1DkynMm/a8xk42JXSKLKIDOxafyLsC6u5wl+IO88JNaVWPklxF
	 FCcL+s7/ly20DqQSB4vr2aknc+WwDFPo59xWLQbtE5VdHLfh/QgqcoQdylmmBTLcx+
	 eU8NEDBpOP6hznI33ebd0ftZFHB0xoic1TafjC3UJB+rLNHNnGbQR/akc9+WNM3cs3
	 cggJ11iq0qtkenTTmt6xGexWlNzu0A/EyM6KvIQ0cs0jXfEAK5lD45L5/ljT5SPZmI
	 20rDW/jj3U4qg==
Date: Thu, 07 Nov 2024 23:46:29 -0600
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
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-9-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-9-7d3b2d235fdf@quicinc.com>
Message-Id: <173104478624.565139.12495883590932168763.robh@kernel.org>
Subject: Re: [PATCH v3 09/11] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller


On Fri, 08 Nov 2024 09:39:26 +0530, Taniya Das wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-9-7d3b2d235fdf@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


