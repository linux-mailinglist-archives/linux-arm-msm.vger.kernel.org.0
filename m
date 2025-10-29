Return-Path: <linux-arm-msm+bounces-79430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F50C1A0A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC79D501403
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0CA334372;
	Wed, 29 Oct 2025 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+kgSAuy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E7331A42;
	Wed, 29 Oct 2025 11:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737330; cv=none; b=WQtTS2xR4vP8hgoxBr7RlP5yprR9Nv7+w82KzP9+7fLcbIgM+dFCGJ/SRX67IXm22kcIBoOyzsPH4aQ4xqsUoJ50xkk3VjO5/fZpNx9jXrpT93RF0dMVttXwHc5h01QhNk49UD0qHWUGypm9Qrg0e7NcAI4rerZ5CHae2hOR26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737330; c=relaxed/simple;
	bh=yKwZ5FZStRiYD457LdryuLiRVnBJeB9bpsbPZmZB1K8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=u+x2AisepyYffWTahzECrOMusP7J89y103nMcJ7NIf2ZBij+Je8UnmmEggEhi4t+L43/3khz/n5qPvdh8YPOSAS4ApN8GMf/nHduXasqxtksSdr6eXUJwxIDERRuzqCiX/UhfOOq6rBTJZse7zfzZGSWooQuuXyxb2ReaO3Uqgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+kgSAuy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2375DC4CEF7;
	Wed, 29 Oct 2025 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761737330;
	bh=yKwZ5FZStRiYD457LdryuLiRVnBJeB9bpsbPZmZB1K8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=L+kgSAuy0SJ/WjwCC5/QFW7VC0nIh+fyAB708JnGGng2gM3oU8sfcmDEaukgqUo60
	 bIt6m7l98Qxz26DBVvfJB4FXZkU4NMHvyY9ZfkNppLzr5Lrj9mpp0vw9glI7j7NrUo
	 9QBTfcb0hjo6ExMpcMPw/zBAd+mU7hChii2I+nXZoe7wcW4VVKbzw6Zp9Rq/98AOBn
	 A8dZvQw+u4YR1sW7xUqwt2Jq/0nPjfPQakgr8ex0zNn5zjG1qYKX35kVJab3T4f48i
	 daAv3CGaZrN3jIyMUS68YvhWSMInzBZBaJS1d1NbZ/FdBX+SLd0qwIwZIunj4Pntbu
	 rtrrIfiVJ04Kw==
Date: Wed, 29 Oct 2025 06:28:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, trilok.soni@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com, 
 Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com>
Message-Id: <176173731982.226626.9507898846111869097.robh@kernel.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: remoteproc: qcom,sm8550-pas:
 Document Glymur ADSP


On Wed, 29 Oct 2025 01:05:44 -0700, Jingyi Wang wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Document compatible for Qualcomm Glymur SoC ADSP which is fully compatible
> with SM8750 ADSP. Also with the Linux Host running on EL2, the remoteprocs
> need to be hypervisor independent, the iommu property is mandatory to
> ensure proper functionality.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029-knp-remoteproc-v2-6-6c81993b52ea@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


