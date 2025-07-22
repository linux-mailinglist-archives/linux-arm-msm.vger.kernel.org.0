Return-Path: <linux-arm-msm+bounces-66149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7594BB0E386
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 20:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9E6416F1EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D041281526;
	Tue, 22 Jul 2025 18:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QmLSTXc1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EB11B808;
	Tue, 22 Jul 2025 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753209107; cv=none; b=KeEK5wnUoefbl3cvJV1aQJwSgk85MBvibpGr/yKWE0D2rQD2i00G5KfmXkW+2fpm1q/C7OOYLT8gD6ZGuAChKF+JneB/9Pz+2/YuNRJi7afjLYLbDeEYNZ9eQ6vsYVy+qCPo9XZ17X+FjCu85xdfZXFbjndC38+EzKkAjd3ErqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753209107; c=relaxed/simple;
	bh=Q/0E6JHsPi8XYLDrJkMZKXjLB1qJHoT/TNwskfXMQCg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=k0f3uPuaBHI+i/6lRoiHsSulAH2WqlD5KhQSe00lZ0gtKC5BMwi+VTY//gv2Zt6tsXcVXkzPAWaed4cfO/ZSikx5qqv/XFDK5KMBkBdRGDmgG5v39i+QS2HJsToinB3woj4IomEJFUw+bQwpSyT5FbqtzZZzQO0EJIP0HISpKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QmLSTXc1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540BFC4CEEB;
	Tue, 22 Jul 2025 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753209106;
	bh=Q/0E6JHsPi8XYLDrJkMZKXjLB1qJHoT/TNwskfXMQCg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QmLSTXc1GMykeDVdkpfMPcoCwHgVW9zIqYzyqIJ+ijo63BkcEtMHjYVeD/4Rf9uwj
	 NsYnTr3P8tKnEE5wZ9aC4f8Wedd04vdXqZn5KPGsl7mp4AvmcCEmfgYk46woOP99gS
	 5Xxc3WH6pMBagyfEQdhLr+T5fPkn6vQfKXWd5jIgd6++tiDlbdkI0rDn4g7QBC2QcS
	 6X3K8jVQhdXMNDwbF1riQGiwqfUfXz54Xc4xV6GLlw+qWz2qIlkW/j2ZH2NzRx2JLX
	 YUkuo8sDQU/2gyJckaH0lsf+rKa1iOaByR/hZQ0zPFFmemYl7HqcjiCBs6/j5JobAK
	 BVWLtw65SgXWQ==
Date: Tue, 22 Jul 2025 13:31:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: James.Bottomley@HansenPartnership.com, conor+dt@kernel.org, 
 martin.petersen@oracle.com, agross@kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, andersson@kernel.org, bvanassche@acm.org, 
 konradybcio@kernel.org, mani@kernel.org, krzk+dt@kernel.org, 
 linux-arm-msm@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com, 
 devicetree@vger.kernel.org
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-4-quic_rdwivedi@quicinc.com>
Message-Id: <175320910547.321086.3713659278575298880.robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: ufs: qcom: Document HS gear and rate
 limit properties


On Tue, 22 Jul 2025 21:41:03 +0530, Ram Kumar Dwivedi wrote:
> Add documentation for two new optional properties:
>   - limit-hs-gear
>   - limit-rate
> 
> These properties allow platforms to restrict the maximum high-speed
> gear and rate used by the UFS controller. This is required for
> certain automotive platforms with hardware constraints.
> 
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: limit-hs-gear: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml: limit-rate: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250722161103.3938-4-quic_rdwivedi@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


