Return-Path: <linux-arm-msm+bounces-39273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53289DA3CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A75A2836C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2C2183098;
	Wed, 27 Nov 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewpMAi6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA0413C816;
	Wed, 27 Nov 2024 08:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732695675; cv=none; b=WtukqwekgtQmGIfsT3sUos/J0yfLGfZAA2dW5UXHewT/5AKmZso84/uysx96T/hKWQEWkTFlTMN2hPnD7wvwbTlVGD/vvY44ZUkWfO9dVC51JtfBY8cowcpZiN62ThU1owsCQvG0Gen1k5V2tVl2Uii2SY5/nDvaR+6nBMkf+dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732695675; c=relaxed/simple;
	bh=id+aTLaJGkl5TLeYDuyrx5kMCJuL6YRs6MH/F+wlEOI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IxBBeTi81Pj2l+oHA/g9u5oelNNcyl32nyDm5jg9umJ5rG/OFt8mmN5WDg83ZSadNpLswUsHUHlOCnXI2WLxv104RMO3rs9WAoLZ+pYQZEiuyn9yaIKhTMtfMzdlRJuInSmGSPB4MI+vT7xIRldW4WY/1276V2KRFz0a64NlNwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewpMAi6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CE5C4CECC;
	Wed, 27 Nov 2024 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732695674;
	bh=id+aTLaJGkl5TLeYDuyrx5kMCJuL6YRs6MH/F+wlEOI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ewpMAi6MGGWdMkdebEubYl1DCfaacM++ANTuAZSa7N0oVKYmhw9hf/VLbvFPUp0V2
	 PG+KRKTyE8GuSrESVPfDLxO7uhKPNBTQAazlNDrO751JylvbyA6U6lv/dtX2a9m86w
	 vnf67ND7Or5ae7sTJoceHsYFLWOjmEK9Oaf5LJJN2KRO0FaqMMH0kb2cIIoIxHdp1b
	 DBQ+4q0GTQwPFAyv5kLuaIN4r6BS9ao/sSBozNeSAx2AyFfhxh38tISvolaidUXfbP
	 92Un52aKvvsriH1Qa7AAzHYkSniu1b4i1mT3RmsARtwEBCHxnyGS6oRHD3o3QTjnAW
	 MrKCIQH/mv4Hw==
Date: Wed, 27 Nov 2024 02:21:12 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
To: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
Message-Id: <173269567235.2233485.7286772244329561840.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300


On Wed, 27 Nov 2024 15:05:01 +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 239 +++++++++++++++++++++
>  1 file changed, 239 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dts:26:18: fatal error: dt-bindings/clock/qcom,qcs8300-gcc.h: No such file or directory
   26 |         #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


