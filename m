Return-Path: <linux-arm-msm+bounces-78520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821EC00446
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5982C1890872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15550308F2C;
	Thu, 23 Oct 2025 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwq2+jfM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4838306D5E;
	Thu, 23 Oct 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761212094; cv=none; b=FKFa+qz0HSMRmRkdQ0Gyf870TFpsXafzcEZcyhF+SpLPEyiZephHM+sKc4gdPR80s3xCuBreWq1JWXR6eIP6jYIJqJ1/yBvs6N3AErwZZTp0ETpDMyt5ssykQ1fb151vdy4AiA247UhGw94CjZytVF+604Y8Jvh55LlO+o5xXJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761212094; c=relaxed/simple;
	bh=mR+72nkRkoEc8417A483lf3aWFt2rv61itovGOouSkc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CINi8PJ6mifjqMplnq6luH+GP1mp35DL4Jfk4n9Z5naBsGJXjNR0sPc9vcOjbOFb3JHxYS7ZQ5xtY/smc/YbPDHKM03yHIYlunEX1U8I5+3t/G3wf/IdNvg4/44ml1KnXeYjqvARKuhTBBUjX7s2wyP9QWa5VSVEcoKWYywnQQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwq2+jfM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1858DC4CEE7;
	Thu, 23 Oct 2025 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761212093;
	bh=mR+72nkRkoEc8417A483lf3aWFt2rv61itovGOouSkc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cwq2+jfM+P75EiiRBPiwHlS5M3ARNoJAG/N8ngNp1bP5L1+yEm+CEl6QFxtqVjsBt
	 QkNtNd8k2W7ZiQhn0AXObfuZ/ZDFgWkwRS+9lFMbVdex6IYH+NIrX6BJy3HjQwQuft
	 4NuuY1XHMFO5eD/l7OaDzkYZYZsNYDFJrbG2EgbQ8P92w8Zj3SOzdD5ickfSZEvbe6
	 NDlW5xt84pFiuc3v/i1/EfcBIbMGTjE8mHZoxOtF6SXR0V7MN0ccayfBu9gA1aKOKv
	 CiAqMdPoo6zjcDc6JlqgNsfDJcP+KGCylfOs4TbVqPkkXOQ84lCcRVJFsoI5GRc4S2
	 f99S155wS32YQ==
Date: Thu, 23 Oct 2025 04:34:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, simona@ffwll.ch, 
 devicetree@vger.kernel.org, tingwei.zhang@oss.qualcomm.com, 
 krzk+dt@kernel.org, freedreno@lists.freedesktop.org, 
 neil.armstrong@linaro.org, quic_mkrishn@quicinc.com, 
 linux-arm-msm@vger.kernel.org, lumag@kernel.org, airlied@gmail.com, 
 sean@poorly.run, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 jonathan@marek.ca, robin.clark@oss.qualcomm.com, quic_khsieh@quicinc.com, 
 conor+dt@kernel.org, yongxing.mou@oss.qualcomm.com
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
In-Reply-To: <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
Message-Id: <176121209123.1694835.2815069098750745260.robh@kernel.org>
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali


On Thu, 23 Oct 2025 16:17:36 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
>  1 file changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dts:26:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
   26 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1528: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


