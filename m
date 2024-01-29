Return-Path: <linux-arm-msm+bounces-8914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A268F841583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 23:21:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E8EC1F256E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 22:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1529115A48D;
	Mon, 29 Jan 2024 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RaD7VShM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF63159590;
	Mon, 29 Jan 2024 22:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706566877; cv=none; b=DVEh722Q0kblthZOh6bosGbqzpc6gZNCXaj2LYXAmoZMdNoCILHE3SiYx1X5IpgHEHKG3YrJKvutcUGkI1G59H/D66Qkrtj87c2KzoqQgoJSkzbnzy5K8ZY0gheLfK0j64MdiRqZvQpHUYqpZgo8618o+JiARCqahViiYUGGxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706566877; c=relaxed/simple;
	bh=Np7VXFeHsaWAbHuauu+9/v6jV9Ji4B0SFAlgO2Wxr+g=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=jdF6Ut1nARnYj6NSFFp78vWofb/SAHxdgBtzDzru9LKNkZbWg+VPz7VW0c+OLxL5N1Q+oigJqgaJRWJ4NwVa5IxIvcMviJnKAKpbZKm7jTO53xQdFxbnZxBw3F17kp+b9FVTn1iBgJFrY1ZLv8GlZ9q3JTonngSoWN17M5Hr6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RaD7VShM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9E1C43390;
	Mon, 29 Jan 2024 22:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706566876;
	bh=Np7VXFeHsaWAbHuauu+9/v6jV9Ji4B0SFAlgO2Wxr+g=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=RaD7VShMaqfC8O3b/Ky2B4kghvdL7JOH1faSlj5T5OTa6DXzwKJIIxsWb6GjA0lhb
	 hrdGQB6tuTiOITf4xePcorSUd1hzs2hOdsWt/Cz25v4AC+5CUZvhyG0CCl/Awosgxs
	 Wm1ETS8I9CHtHy87lQuM5qYaKB/zKV+Znp/s5oN43G6Obv8PvQUMITn9m1pGpYCtn8
	 gZ8NNQCJC8ZUKX2c9pJYdDSmz5VsAsx9fJePgq/MZUOeSt9ZxQZp9RQM2UMVJ8jn3s
	 y7Z04NtBPUCE3X9PrLxZHHzm9Vel6F4n5by9Yz/UsFCe3Dj2GCZ8pgOUvBf0l4aduf
	 LUbmVnplXQANQ==
Date: Mon, 29 Jan 2024 16:21:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
In-Reply-To: <20240129-x1e80100-display-v1-1-0d9eb8254df0@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-1-0d9eb8254df0@linaro.org>
Message-Id: <170656679960.3080.8862777560461327943.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: document MDSS on
 X1E80100


On Mon, 29 Jan 2024 15:18:54 +0200, Abel Vesa wrote:
> Document the MDSS hardware found on the Qualcomm X1E80100 platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 249 +++++++++++++++++++++
>  1 file changed, 249 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dts:33.40-41 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240129-x1e80100-display-v1-1-0d9eb8254df0@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


