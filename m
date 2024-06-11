Return-Path: <linux-arm-msm+bounces-22360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A289047AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 01:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F07A2284B92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 23:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EA91553BF;
	Tue, 11 Jun 2024 23:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okXRkvGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E667FBD2;
	Tue, 11 Jun 2024 23:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718148833; cv=none; b=iMOsVjUoBOEQxy7CZ+1mL+qUeOzMYH/SDkNOJN5pKWHDllcCIvOwHuJ2Rp8rwYaKRMs83imnkZ8W+IBFcJCfOM//uAtpVxeg+SmdXV4Nd5t6cs3svVa29U5J5T+N8+RtDk3Jiq7c/3WIV6MaMPPrk6CNDk0xsbZQyjAog1m4Vvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718148833; c=relaxed/simple;
	bh=PAJmKNOlaPn4rqZ+atyu5CwMxZWPwxMlxuC2B34gYBA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=TqclPGIESqc8yFEyrksGHF9RI6GnzS1rp0Tcoah7mZgORQteC8CNSyGzZ4hrJWCw0N5+Ig8D2LH0wXUoYAS+HD3pNEYFrJPVMQGLFhL2rSoTJNzEci1hw5NsS06MeNGqNM1we0NvmQZql18UViZrZhVHnwGa5MJOwckd8MnS2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okXRkvGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40878C2BD10;
	Tue, 11 Jun 2024 23:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718148832;
	bh=PAJmKNOlaPn4rqZ+atyu5CwMxZWPwxMlxuC2B34gYBA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=okXRkvGdCe1XdVvPJ/B3x/XBUJKvAc+c/+bwlGU9W54Ab5gmcbKJWX54Capoo60sJ
	 3QJpZ6tJLCd7givRILbxl7GVREwZBJF2P2jjEmADI+Vi1fGbX+C4Pz5QjmtFVx6LnR
	 tkSHlgGrGviOwJM8a+FTVMXUf2Vug5BgOkX9Hvya/CwSqYlg0+QF1+oBMP2Kj1vezv
	 KPd96BvLwpWBsrA/Lk4rZB1wgSSvy/p7HRu16yNadwVx6cQWnEQEr9GWv15M089tmr
	 JnypYQy2nt56nHqiJiWGGgY94FyfmXO6AQcp5MdIi/No12URTEXg+jLJC2MLOP1NwB
	 f9bkuf23XdKjw==
Date: Tue, 11 Jun 2024 17:33:51 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: tzimmermann@suse.de, konrad.dybcio@linaro.org, 
 dmitry.baryshkov@linaro.org, krzk+dt@kernel.org, mripard@kernel.org, 
 daniel@ffwll.ch, robdclark@gmail.com, dri-devel@lists.freedesktop.org, 
 quic_rmccann@quicinc.com, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, airlied@gmail.com, quic_abhinavk@quicinc.com, 
 sean@poorly.run, marijn.suijten@somainline.org, conor+dt@kernel.org, 
 swboyd@chromium.org, neil.armstrong@linaro.org, 
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, jonathan@marek.ca, 
 maarten.lankhorst@linux.intel.com
In-Reply-To: <20240611223743.113223-4-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-4-danila@jiaxyga.com>
Message-Id: <171814883103.3303009.2789653537051980409.robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: Add SM7150 DPU


On Wed, 12 Jun 2024 01:37:42 +0300, Danila Tikhonov wrote:
> Document the DPU hardware found on the Qualcomm SM7150 platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../bindings/display/msm/qcom,sm7150-dpu.yaml | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.example.dts:24:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
   24 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-dpu.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-4-danila@jiaxyga.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


