Return-Path: <linux-arm-msm+bounces-32576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC198740D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 15:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47A93B28E75
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 13:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D007A36B0D;
	Thu, 26 Sep 2024 13:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mcsan7IB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29442BCF5;
	Thu, 26 Sep 2024 13:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727355687; cv=none; b=tPMFLWv54uLJIc2ajAGYSFAZGWedjGdWb8m2Kwz/wH2HzVbymFy0hWniG+lxCbkLjetUI1Zyn08wJl0vuYemf2bHIdYHWNW+dtStn4c8sFfco9J+874LtNjYP/MgkMeIZ4KIQC/QnjEM5nRqRjVOiW4F6oiQ5kHM+Q9ECbcvlmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727355687; c=relaxed/simple;
	bh=BwTJiwEtdYGc5SQRFyysSRbLN3+Im70aKFyJ5UPbdSY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=Orj/e3916JKmwkVgX6PFudBAgYmzCDPB/NH9h+JdpYIJ3ghIbtluzQrSVz8u7QwYqCo70mCyVDC3nRPltvS31ZBSpqZt+5gkLHkOsf+GugY1RKg/QJ8RL+ufzTTbvxUWl+p36sJMswnsSFwnFpC+LKvklKxmM1Ep2Ny9XP+n0hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mcsan7IB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CCAC4CEC9;
	Thu, 26 Sep 2024 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727355686;
	bh=BwTJiwEtdYGc5SQRFyysSRbLN3+Im70aKFyJ5UPbdSY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Mcsan7IBu+odnsxxulayxjOCxt3pHhvQPxwWJi46vX1goks3hvD7Z8CvYbiRl0gzB
	 L35lh6VEHfKyMaALrLHTSbDiDYY1AO0S4+fUVk81H6l720MoD1yAE3rr5ouFCqV7dP
	 LEoQs/Gy6zXOM0gnOhma1Tek9CMUc/3Mt05tUtl2k/t+8lfb02F+sRkugQ0wjMyeRb
	 6ToLbnjyRG85/YvjLAtBZUDlCGxDtjU1ZMzIBtIjJ1fwVyUi4FrQXo7Nz9zqrywRvO
	 SUGZEE0bB02qkJVjn5JXtyNod3BRPp1LBjkjguSCReKmhDBwxioFTXKtiIoHcPwc7T
	 7wdmKmThl7EAQ==
Date: Thu, 26 Sep 2024 08:01:25 -0500
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
Cc: marijn.suijten@somainline.org, krzk+dt@kernel.org, danila@jiaxyga.com, 
 bigfoot@classfun.cn, tzimmermann@suse.de, mailingradian@gmail.com, 
 quic_jesszhan@quicinc.com, conor+dt@kernel.org, swboyd@chromium.org, 
 robdclark@gmail.com, andersson@kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, quic_kalyant@quicinc.com, 
 linux-arm-msm@vger.kernel.org, sean@poorly.run, 
 linux-kernel@vger.kernel.org, daniel@ffwll.ch, konrad.dybcio@linaro.org, 
 quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org, 
 neil.armstrong@linaro.org, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com, airlied@gmail.com, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, dmitry.baryshkov@linaro.org
In-Reply-To: <20240926110137.2200158-3-quic_mahap@quicinc.com>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-3-quic_mahap@quicinc.com>
Message-Id: <172735568394.2508535.1979405552416072556.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P


On Thu, 26 Sep 2024 16:31:34 +0530, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
> 
> [v2]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in binding example. [Dmitry, Rob]
> - Capitalize clock names in description. [Dmitry]
> 
> ---
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.example.dtb: display-controller@ae01000: reg: [[0, 182456320], [0, 585728], [0, 183173120], [0, 8200]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.example.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-dpu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240926110137.2200158-3-quic_mahap@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


