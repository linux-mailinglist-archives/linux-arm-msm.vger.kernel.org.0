Return-Path: <linux-arm-msm+bounces-73192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F75B53F74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 02:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83F88682ED5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 00:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349E9DF76;
	Fri, 12 Sep 2025 00:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjqTNAxt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ED04C6E;
	Fri, 12 Sep 2025 00:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757636269; cv=none; b=NiEnJTuFB+Hobmt0OwjYipAol1WaCDy/OgKWRTTWMXnR0Ah/J7sgD7kR22tRhpCPnnqEGiQ6WJZGnC74R7mz444f035j/+xGUmUUQ160SjF9pk66tDn1p/woxNKGPAPlNYsQYSPzzQYqZo7vsnLyp4Vmpbc7JdYahzsxLcJLlfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757636269; c=relaxed/simple;
	bh=3RZx3B3a93+MI3rsd0ttOFCVaCC1U6RzL2JzBz1Jvjw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hAzU5x3DRjAgFrTVt602PQCQtLO2Q/TNkanAEyC3ui1cpwjxr//QpuMF6dY2yXdrLOixq+hEJI8Nu3rQCdyo78MDO//hdy4QMyZuUKq3jhaCqnHpqPMC0bUgPjLekMlvw+KqK/0lrJdrupRFLc4zNcMk7bgwmCRBcSDiI2wgxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjqTNAxt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3495CC4CEF0;
	Fri, 12 Sep 2025 00:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757636268;
	bh=3RZx3B3a93+MI3rsd0ttOFCVaCC1U6RzL2JzBz1Jvjw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OjqTNAxt50f5XtTfv85KO5HN1HlBi9MH3vAlSjjTkNouZX1gtx3eYnwtrPIsACsLu
	 PaLPic86LE5liewv0KeBq5pK4XMOBF9k4u04ssU4U54Ej6brnT+zMjDfg+xorxDAf5
	 azkVI7gCrlULUpw1x9Ul0SfI68rtMgabxaPQVVNcHLaKJOhAA7lf78EB2WV45HM1nA
	 Fiu5c+G2qeZXM3avcvel2ePz456eBokzP09UnfgacWwKEUSxNWCH7mFiV35/hPCNGW
	 7nL4mesiQ7t3FHDI2etHlqvQwuWTzWFBk+G4P1xUPQRH9BHDJ2d57Tfu7ySEphKYxT
	 ohfxeGuy2mEaA==
Date: Thu, 11 Sep 2025 19:17:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
Message-Id: <175763620749.1187186.12529943530682570245.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller


On Thu, 11 Sep 2025 15:28:50 +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,
> therefore being incompatible with all previous platforms.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[0, 183042048], [0, 512], [0, 183042560], [0, 512], [0, 183043072], [0, 1536], [0, 183046144], [0, 1024], [0, 183047168], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[0, 183042048], [0, 512], [0, 183042560], [0, 512], [0, 183043072], [0, 1536], [0, 183046144], [0, 1024], [0, 183047168], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250911-glymur-display-v1-3-d391a343292e@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


