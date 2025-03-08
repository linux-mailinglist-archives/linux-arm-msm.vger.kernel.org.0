Return-Path: <linux-arm-msm+bounces-50679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82CA57801
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 04:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CDE21706A0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 03:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FF11598F4;
	Sat,  8 Mar 2025 03:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqhLe0mO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467B13C8F3;
	Sat,  8 Mar 2025 03:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741405259; cv=none; b=MwUD0I3SzysM8Rp8wpA95pzzhYUrGpiYkCgPpDEj/Kk/wo20vLWcHqy3d8Umz8+prstXcwVCSD0SIcmVbQbJq9AOd7I9h/qH3r+i0AX+4mEjmocgBmIeoBHZQbkA7AYVVKSkw62HL8PDd/mTNL7rwfkwTkWF0niYEC6RddcAfxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741405259; c=relaxed/simple;
	bh=CCqCMfm7uIrXBJccBAhKXG4xiSYfKPpfhbIOJuEekGc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AqL9sd5VB2qbZ229eDcVUSxxHbdnfuvz93QCUVsyN6PgNsSd+ps6wJOX2xIbbVF+/nywUzHIcSxqjWPHoG0SQX6tKBBk+ue8sQ1wRrmWSHHpsNlecYrTreSxzeubLl8ne4cFyWx48DjqR5vCyg9GHZJ8A+Ncy3MaM8Stmda5pBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqhLe0mO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640CBC4CED1;
	Sat,  8 Mar 2025 03:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741405258;
	bh=CCqCMfm7uIrXBJccBAhKXG4xiSYfKPpfhbIOJuEekGc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tqhLe0mOBy7caKWCXS1NcpLSjl44jndUt+r2bH1GeauM3jkPVitwhIT2oiIhsGF/p
	 nFuYiEO+Mdo2LxpGZXtpPBIfZn2T31Eytu6DQp2rCrRgNkuWkvglLHJaLaAjwS0Z2W
	 fydWSEafeM/3u38ejG05vzO5ZsYWXtKoZL4Dfcmx9IvrTj8cRbcOVx50upXjdkvA0I
	 HiKx1aoa0taXazMAsAsFJtoxRMENtXBPZLrGXDWdi3jnNWBdCjDC88mqZiqg+SpmjI
	 DlI8RdAjF4rHOyPrMdCO2MRA9Q/2vjRWizeBYqWucpy6kGbTqCNx8YDYVoRarLAzEF
	 ToxYVbC+hy47g==
Date: Fri, 07 Mar 2025 21:40:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Jonathan Marek <jonathan@marek.ca>, Maxime Ripard <mripard@kernel.org>, 
 iommu@lists.linux.dev, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org>
Message-Id: <174140525677.1770282.3232695979994091275.robh@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P


On Sat, 08 Mar 2025 03:42:23 +0200, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Describe the Mobile Display SubSystem (MDSS) device present on the
> Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
> system level. SAR2130P features two DSI hosts and single DisplayPort
> controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++++++++++++
>  1 file changed, 445 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae94000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae96000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.example.dtb: dsi@ae96000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308-sar2130p-display-v1-5-1d4c30f43822@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


