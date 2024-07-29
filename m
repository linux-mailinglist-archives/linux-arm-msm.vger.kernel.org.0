Return-Path: <linux-arm-msm+bounces-27254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631D93F537
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98141B21009
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F35E147C9B;
	Mon, 29 Jul 2024 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5/IL0hK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A071474BF;
	Mon, 29 Jul 2024 12:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722255812; cv=none; b=ooGdwEHc0r9g+zC9ZBcDfY71sLA1mWKP7NNr6amd8meJwyDCqW4aX+hmXMLfEKEcm5yFSa+WqO44Qeb84nNbm0v7/SL8tYbh20F7JLahMjGakmBJbWc86PGZ5v9UX8zZP9J6tvmBeNOrCpe9x1k5LrwzOSToEFwm5zW5w4Bjcqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722255812; c=relaxed/simple;
	bh=1N+ztFIlf30RwFKnrqwKSYju6X0Gb4F8KBDdvM6jD3M=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=JHS1F08xK7gc9XKaOGpJnSE2sIhHtITkKJvE0sSlMmZoavn1cOYUPViQjfmIUCg0Oduw92zVrSgMrh7uzA/QkoeAKnTQ5CxgGsLGGIc6Wh0KJplCs2Stk5VrgWugGp5FRNU9q8wKI0Kyz2AfOklxz/a5XPP1/XJ+ZWTXZ1pbfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5/IL0hK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F4EC32786;
	Mon, 29 Jul 2024 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722255811;
	bh=1N+ztFIlf30RwFKnrqwKSYju6X0Gb4F8KBDdvM6jD3M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=S5/IL0hKXN/3UiQR2cF9IqO9RK7He/LLqmltqft7Exes7d+2fFRAtJ4iFBFCNkdQU
	 i2DHaJJNx/2fPc+N4DOrOUWO0zp4G9HAvplP2NWeKe41P6MNyx6C2a3RnKbS+eomqe
	 pKaywOSD0E/DgPgl6t+u5AsLXPiW7Ey5/oN5AD/YIdxjpo5wMPqdGA30YOWkvDOfVm
	 Pesuui9BsOuh83nFO7uUxS5hLjZOs4NqFx0fX9/T3k7Q2lb49Cgo53Ev09qGT7WJ0v
	 oBrQ/rE0wnfjNj3dj36+m8Uv9/Dq7LmBDScGiSEI5yv8JFBZfm9WLq/xGHAxC2fx8f
	 g5LHaTa5UBNVQ==
Date: Mon, 29 Jul 2024 07:23:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240729-fix-smd-rpm-v1-1-99a96133cc65@linaro.org>
References: <20240729-fix-smd-rpm-v1-0-99a96133cc65@linaro.org>
 <20240729-fix-smd-rpm-v1-1-99a96133cc65@linaro.org>
Message-Id: <172225581057.232302.5916799518300911282.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: add generic
 compatible


On Mon, 29 Jul 2024 14:04:45 +0300, Dmitry Baryshkov wrote:
> Add generic compatible to all smd-rpm devices, they follow the same
> RPMSG protocol.
> 
> Fixes: bcabe1e09135 ("soc: qcom: smd-rpm: Match rpmsg channel instead of compatible")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 52 +++++++++++-----------
>  1 file changed, 27 insertions(+), 25 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.example.dtb: glink-edge: rpm-requests:compatible: ['qcom,rpm-msm8996'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rpm-edge.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.example.dtb: glink-edge: rpm-requests: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rpm-edge.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,glink-rpm-edge.example.dtb: rpm-requests: compatible: ['qcom,rpm-msm8996'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: remoteproc: smd-edge:rpm-requests:compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: smd-edge: rpm-requests:compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: rpm-requests: compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: remoteproc: glink-edge:rpm-requests:compatible: ['qcom,rpm-qcm2290'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: remoteproc: glink-edge:rpm-requests: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: glink-edge: rpm-requests:compatible: ['qcom,rpm-qcm2290'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rpm-edge.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: glink-edge: rpm-requests: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,glink-rpm-edge.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,rpm-proc.example.dtb: rpm-requests: compatible: ['qcom,rpm-qcm2290'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,smd.example.dtb: shared-memory: rpm:rpm-requests:compatible: ['qcom,rpm-msm8974'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,smd.example.dtb: shared-memory: rpm: Unevaluated properties are not allowed ('rpm-requests' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,smd.example.dtb: rpm-requests: compatible: ['qcom,rpm-msm8974'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.example.dtb: remoteproc: smd-edge:rpm-requests:compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,rpm-proc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.example.dtb: smd-edge: rpm-requests:compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.example.dtb: rpm-requests: compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,rpmcc.example.dtb: rpm-requests: compatible: ['qcom,rpm-msm8916'] is too short
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240729-fix-smd-rpm-v1-1-99a96133cc65@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


