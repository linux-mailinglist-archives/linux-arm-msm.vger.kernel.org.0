Return-Path: <linux-arm-msm+bounces-67195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879AB167A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 22:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62E4E1AA553C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B262063F3;
	Wed, 30 Jul 2025 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlcMn17K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCD23741;
	Wed, 30 Jul 2025 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753907480; cv=none; b=JmknpSZf/StGW/oNdYpB6ya4+CJmEf8D/SZ7a202MuONJCXUalX5boVRV/KWQlg/9+2N+4+aaqTrwxD8M7/0qUhV89+aGc/eBLfP/mYXOI1BBgPPaNb0EZGUy94XGO+whdblF8LNYhFvLr7cs7fz3pBQZ9wmJykjFaPAVNDJ2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753907480; c=relaxed/simple;
	bh=pzIlKTqc6PooF0HdTDP7xCXB+NOAd4uVr/p9iM+zgsc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IGi37Zi23wBOXk4dZsaSwxUWmyhx3ex4a7cTeKn9AF6R7rhI91+raqqb8VHR7h45nUO9i6s1eXVRGMGaLkGy/xeJSSMGubOXxdim+o7rUj62IyumCdL0sa4RKMOmEyONdLHbDHh5kZgwiH0HMSRZ6dCMiyxWerl+v8t3f/JnfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlcMn17K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BB3C4CEE3;
	Wed, 30 Jul 2025 20:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753907479;
	bh=pzIlKTqc6PooF0HdTDP7xCXB+NOAd4uVr/p9iM+zgsc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IlcMn17KsB3VwtN7o4M4reHgTOgUef9hT6mMZoXwt6rrDRNAfcbSkgPSpxKiHi7Gq
	 Kkgex52i4mOQIfIdDMJtb4EwV5EiHAXjrnxw27wd9ar1fmye86XJOThGTioOp7zisw
	 HNBrttKNorvrl2ZfO+kp+s64LUiuwcSV2cWDZqdVsmJfc6Q9qv79kMbHV2v+kPjV4d
	 dak18jPu0dhQtuS+j13SpN6tFgvshGwVoy06cjYTxsyLXNXlp4oLs7b/tx15KDaQ9D
	 1IGJK2j3QbaiOBoDvnYcph8ALn+RBmKXc0Vh8Z5t9NugxIEXUcFkqFB/a8EMw74Q7W
	 +u2BwlCPOoo7g==
Date: Wed, 30 Jul 2025 15:31:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 freedreno@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, David Airlie <airlied@gmail.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com>
Message-Id: <175390746243.1660386.11206814214268936734.robh@kernel.org>
Subject: Re: [PATCH v5 3/5] dt-bindings: display/msm: Document MDSS on
 QCS8300


On Wed, 30 Jul 2025 17:42:28 +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 284 +++++++++++++++++++++
>  1 file changed, 284 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible:0: 'qcom,qcs8300-edp-phy' is not one of ['qcom,sa8775p-edp-phy', 'qcom,sc7280-edp-phy', 'qcom,sc8180x-edp-phy', 'qcom,sc8280xp-dp-phy', 'qcom,sc8280xp-edp-phy', 'qcom,x1e80100-dp-phy']
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.example.dtb: phy@aec2a00 (qcom,qcs8300-edp-phy): compatible: ['qcom,qcs8300-edp-phy', 'qcom,sa8775p-edp-phy'] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250730-mdssdt_qcs8300-v5-3-bc8ea35bbed6@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


