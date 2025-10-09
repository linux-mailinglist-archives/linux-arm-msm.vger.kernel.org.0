Return-Path: <linux-arm-msm+bounces-76644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACEDBC9107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 14:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 11B9C4FB67B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 12:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFEF22E6CA0;
	Thu,  9 Oct 2025 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLPaI5z0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41A2E62D1;
	Thu,  9 Oct 2025 12:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013460; cv=none; b=PsAcxUsz+PqVDj5g33NfOXZUyiWhNPYuQaVoU+X8DetRZrJQ5CZHPQiE/XP/Ke8Hqv6NV+LRE3/nMkNJLepnJ1schaOP6vYQwrFOIyVGnAuOigJ0G5xIe3rYlYZRQ68bEKBSA3/452DKq4i2w57X+Jr/RFlkK2XhdeEkXuQWPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013460; c=relaxed/simple;
	bh=aBDQiL8M6tlhzQPRf36HvQHITXaP9VMPI3YdAfgTYjo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WWd+vtaupC/axiNuBFJCYebD7t9s0WqeY+ZTm8BtPJl/pVDwFEdolJ68ybJXlUISIkjolobHpnjTyMt7Mnsgv1r2lySy7JObf2FO6FLhlej2ppXmne4wqpRgJJFFtHcg9zDkJsJccs0o32n+DDp7ZskkN+J58uBA4c6pSraucHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLPaI5z0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DBEC4CEE7;
	Thu,  9 Oct 2025 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760013460;
	bh=aBDQiL8M6tlhzQPRf36HvQHITXaP9VMPI3YdAfgTYjo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uLPaI5z0H/AGqRbfnAY/6dZMqsExqSC/5Vy60ccYAF5DDtB+/obHLb3EEOmuTIAnv
	 srnQRecn8BcQ45g2HW+Twd1agmu4z00AAUn4EtLtDyWZqtHxw7Wj1e4y2o+DTGaWb1
	 Ny6+G7iX6eOtzMXgiTeGzVPvV6rB7SJVICUR/STfhDHIDDPm9yJizr6Lx15OGaiiUQ
	 iOdDZ9+ZUnflH307xWhlQ2Lh872oRoBGr38JFhsBw+ZA18QfR3/lL383VRq/FKeiEk
	 OPbmtWAnlRVbi51r4gph29hE+qZd7CJFF/DgH3q7NG9f9Yw5L+N9rMo7Xv/WskAX9b
	 BwVxTaax2ck8A==
Date: Thu, 09 Oct 2025 07:37:38 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: kishon@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 James.Bottomley@HansenPartnership.com, sean@poorly.run, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 abhinav.kumar@linux.dev, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, mripard@kernel.org, 
 marijn.suijten@somainline.org, tzimmermann@suse.de, lumag@kernel.org, 
 airlied@gmail.com, krzk+dt@kernel.org, jessica.zhang@oss.qualcomm.com, 
 maarten.lankhorst@linux.intel.com, linux-arm-msm@vger.kernel.org, 
 simona@ffwll.ch, quic_mahap@quicinc.com, linux-scsi@vger.kernel.org, 
 quic_vproddut@quicinc.com, mani@kernel.org, 
 cros-qcom-dts-watchers@chromium.org, robin.clark@oss.qualcomm.com, 
 dri-devel@lists.freedesktop.org, andersson@kernel.org, vkoul@kernel.org, 
 martin.petersen@oracle.com
To: Ritesh Kumar <quic_riteshk@quicinc.com>
In-Reply-To: <20251009071127.26026-2-quic_riteshk@quicinc.com>
References: <20251009071127.26026-1-quic_riteshk@quicinc.com>
 <20251009071127.26026-2-quic_riteshk@quicinc.com>
Message-Id: <176001310712.1845653.12786933655118707340.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add edp reference clock for
 qcom,edp-phy


On Thu, 09 Oct 2025 12:41:23 +0530, Ritesh Kumar wrote:
> Add edp reference clock for qcom,edp-phy which is required
> to be enabled before eDP PHY initialization.
> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[4294967295, 11], [4294967295, 1]] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb: phy@aec2a00 (qcom,sc7280-edp-phy): clocks: [[4294967295, 0], [4294967295, 183]] is too short
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251009071127.26026-2-quic_riteshk@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


