Return-Path: <linux-arm-msm+bounces-22363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E09F90480B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 02:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F42371C22E63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 00:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB08D10FA;
	Wed, 12 Jun 2024 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vONq4abH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CC6394;
	Wed, 12 Jun 2024 00:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718152446; cv=none; b=rtzf38vra4osJNruhXvKuaq2smXz7IVUJ47/Jz04BTw+rFoiWOIAMQ6Ixa5lvWo4nNyHQN0iM/nwHeCeSYMfZ/ImiWZqmkhI9yH4mA/RsRnIqrk/QOxotWyr9LA4MmCWTpdRc6ygkUTxoeKUu4aL0i0IXbkjraMMv51rEDz0FpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718152446; c=relaxed/simple;
	bh=5fRGuvJp6cBf5p4D5mJF23NkzpveK8jJGPPtUPoL47Y=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=qNMgf9HaGNJiNlJkxtmAYmAesmcbb9cADd52eDAyCSCuZDFqUYakrDs6ybvQQ2r0QsL96weFfjQ4YE7NJO0497xmTw3+hHKi8tQl3roZfg8to4fOepZBTNWvLV4vnW72Ofdh7hZ/y3wnzYiczlRryl/PdOkzV2AgOK9PD4z2EGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vONq4abH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92413C2BD10;
	Wed, 12 Jun 2024 00:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718152446;
	bh=5fRGuvJp6cBf5p4D5mJF23NkzpveK8jJGPPtUPoL47Y=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=vONq4abHtLrO1CV8n8jkL2JI7V/e8C71ZawuNB8izsThmZ7zeuBNf6L9pjUeYOb0L
	 ABkkhSjNK1tGGBdcEQHF+QGGr0Boc3xPaNH4pwF0gf7uFwWoYnPcQEaTuwdROGl5lG
	 76cXGQwCz2LHb0c4UDqX5k19r2FM7x0cdHoA/bq8tmU00FBoLSECTlNLrlhnxDsY9T
	 r3d6Cg7iQfrVsoDV0MeUpKPiEDPvkcurn31SYc7xAQeHoTGMoMgkG7JqfFzjBE13c9
	 4rM354UbjF2TpJsCOG0dG8Lou2GbSuhMEhWK4+EDi6nZHNJl1E9hEOfld92kQKqESx
	 eMMDN65Z+ALkg==
Date: Tue, 11 Jun 2024 18:34:04 -0600
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
Cc: jonathan@marek.ca, krzk+dt@kernel.org, quic_khsieh@quicinc.com, 
 linux-arm-msm@vger.kernel.org, quic_rmccann@quicinc.com, sean@poorly.run, 
 dmitry.baryshkov@linaro.org, tzimmermann@suse.de, mripard@kernel.org, 
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 daniel@ffwll.ch, freedreno@lists.freedesktop.org, 
 marijn.suijten@somainline.org, robdclark@gmail.com, conor+dt@kernel.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, devicetree@vger.kernel.org, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org
In-Reply-To: <20240611223743.113223-2-danila@jiaxyga.com>
References: <20240611223743.113223-1-danila@jiaxyga.com>
 <20240611223743.113223-2-danila@jiaxyga.com>
Message-Id: <171815244421.3448243.12009673117592867975.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Add SM7150 MDSS


On Wed, 12 Jun 2024 01:37:40 +0300, Danila Tikhonov wrote:
> Document the MDSS hardware found on the Qualcomm SM7150 platform.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  .../display/msm/qcom,sm7150-mdss.yaml         | 460 ++++++++++++++++++
>  1 file changed, 460 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dts:25:18: fatal error: dt-bindings/clock/qcom,sm7150-dispcc.h: No such file or directory
   25 |         #include <dt-bindings/clock/qcom,sm7150-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:427: Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1430: dt_binding_check] Error 2
make: *** [Makefile:240: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240611223743.113223-2-danila@jiaxyga.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


