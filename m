Return-Path: <linux-arm-msm+bounces-37788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8689C70B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B198F28806E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277481E04B3;
	Wed, 13 Nov 2024 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJqt32Th"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157617C68;
	Wed, 13 Nov 2024 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504751; cv=none; b=MFDEJA5Kn2pL6m2Ll8NGJ7wpURWBndFvjvHJeyMm8jWshA4tGMdWgB+k0Vd0UYKtBx2sQIksKiPCtduP0T2yqStennslvhdgWTzTpu0hNi7OoHWnAUq/FOtVXykPi1eFxCnPOOhEnFAp4HiVspngz3OxHgszJexq6cUMQhB0nIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504751; c=relaxed/simple;
	bh=gfCmgl3jagwHGldFjUB4K2gH4J6eJxXe8/I/qAemYJk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lgr8EQQ0A/D6S9sWiQ7VeATMs2W2T+mf5J3jwD+n2jgTXhRFUYy1VmwwIvQhFTYKoQEI3/m694PCua7THFFMn/o6JWNDlwWCJ7Y93BEQ0DjLFjQOOsfoVC3RF37gD79AvZFENhO4GDkl8lPuN3MsVEVmWDnFzkZLtQ429Yv+LPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJqt32Th; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCE1C4CECD;
	Wed, 13 Nov 2024 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731504750;
	bh=gfCmgl3jagwHGldFjUB4K2gH4J6eJxXe8/I/qAemYJk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ZJqt32ThN/8+imW4Kgw6RaW3o7K6lP9reDKy572Iu31gEfEj6vKcOiUy7grZrUrLV
	 4oBs8fS3SxU1SQ+2fzOLAygB+gwDSMU5s+kNXqO+5Dyi4GE0ZH+7Dd65HlNCwkHUMS
	 UJUml5PZhst1zmCxBZigJFzCJVlLCXEnqukzdPvRpR0hcrrIU78SWJIPeIFwsSt8hu
	 XyGPX7fYzyWSIL3eJ4brqSOtqTpPtGMC7+PZPxV3vdCK+WDTgwRigx0RartzZVT9fZ
	 t2XT8pFt1mMkHRHxP6fqE28qR4UvBY82U4ZazE/zOIT4jWBOP/GDRE00uSRJ80/ZxB
	 5MV5X6EP7fI3w==
Date: Wed, 13 Nov 2024 07:32:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Li Liu <quic_lliu6@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Fange Zhang <quic_fangez@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com>
Message-Id: <173150474841.4106927.5975815443901282337.robh@kernel.org>
Subject: Re: [PATCH v2 3/9] dt-bindings: display/msm: Add QCS615 MDSS & DPU


On Wed, 13 Nov 2024 19:51:45 +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm QCS615 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs615-dpu.yaml      | 118 ++++++++++
>  .../bindings/display/msm/qcom,qcs615-mdss.yaml     | 252 +++++++++++++++++++++
>  2 files changed, 370 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,qcs615-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs615-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113-add-display-support-for-qcs615-platform-v2-3-2873eb6fb869@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


