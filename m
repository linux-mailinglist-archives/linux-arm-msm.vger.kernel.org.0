Return-Path: <linux-arm-msm+bounces-31588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA7976479
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 10:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4001F24651
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 08:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF2018A6A9;
	Thu, 12 Sep 2024 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWdnb8CX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2AE1A28D;
	Thu, 12 Sep 2024 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129790; cv=none; b=sSOPctaP/oVa/Y2SvCffzSAOhmPxOHdDcEgl2UXEg1YVVDHhYH3HTJ/oS0i7bKHWnA76hFe5v6TTxXCwSg4SZRzzsvYnaSt4rDixXpRJCI+zuf4z5DIsBbT0+s4vSM4gO+I6XoHZ/yMuky7JJgzo+fVXrYZCts2PI8wh8Z04GIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129790; c=relaxed/simple;
	bh=vVZSVYNNMpsxf/Mtb1DzmqrGNnMqIEIm+Nt2IKnA8hA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=DlQhBSrkoFVCGjg5aWFAQ3AHJ8MCXTLcoE/P0PS+4H3NxoQCDYLFsiKY87OVL7SCStCsB101+5qyg7Fzug53ymVK/dpN5AUlAyF9PP4AwTfX1u2h00gNrSIgDFVSojIkNFnKzoj/WnxJTgfIp7cIFRpTTiiSdM8Ig9fIGsVr5aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWdnb8CX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCFEC4CEC3;
	Thu, 12 Sep 2024 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726129790;
	bh=vVZSVYNNMpsxf/Mtb1DzmqrGNnMqIEIm+Nt2IKnA8hA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sWdnb8CXle8EwZQtK4FF2OPZiO4WYQ+RQ0yo731sacd6+s9mXxQkLvJR41dZJLHR5
	 ku1BzgEoYxHHcVg9eIRn9Z0MrgaYViDkjpaq3AQLvODziVTMB+jfMBOz45mNR4JbpC
	 hIVnQqQx54h9mSjhfscWiRH4TVXlV9xw1ffrSWIXtARfD/oabDu/C6rhGUsCco9iYn
	 8OgavysBhYcM677c8qTtpjdsvUGDcLOlJLauSgOfdo2XwN7IAVWVoYnnRVVPrF8Pz7
	 3ebkCbIpvxUv7Rp50WELU2xHRUrEXQ9wUhklmQODO6Fawg2QlY1TkzbGMHH/ud68Wf
	 014aV9hnrDymQ==
Date: Thu, 12 Sep 2024 03:29:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: andersson@kernel.org, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com, 
 neil.armstrong@linaro.org, swboyd@chromium.org, mailingradian@gmail.com, 
 quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org, 
 danila@jiaxyga.com, quic_kalyant@quicinc.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, mripard@kernel.org, 
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
 marijn.suijten@somainline.org, robdclark@gmail.com, krzk+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com, 
 conor+dt@kernel.org, airlied@gmail.com, bigfoot@classfun.cn
In-Reply-To: <20240912071437.1708969-2-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-2-quic_mahap@quicinc.com>
Message-Id: <172612978700.2592228.2560116576416075874.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on SA8775P


On Thu, 12 Sep 2024 12:44:33 +0530, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++++++++++++
>  1 file changed, 225 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^display-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^displayport-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,sa8775p-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:442: Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1432: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240912071437.1708969-2-quic_mahap@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


