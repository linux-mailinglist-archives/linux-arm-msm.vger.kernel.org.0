Return-Path: <linux-arm-msm+bounces-79431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 113FCC1A044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 12:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ABCE334B554
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ADD334C25;
	Wed, 29 Oct 2025 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFu8AMRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E4255F28;
	Wed, 29 Oct 2025 11:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761737333; cv=none; b=l1QdeBzoRoQS1gQL2czmhNN+963HfGNULKvN5u19wsoPCOtUKXg14yc8bESzPQR/7xk9IVuulqyptaDkGqpylFN7z4D5jahOGIyU7fkeeTCUixxEykzUEF4yfYwnT8bueHkLEsYoy4HkpYGxMNbGkrShSmMA/wyuWdqnGT82r30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761737333; c=relaxed/simple;
	bh=LtODIgKzha+HT2a0mmvSUzhGTp/D/tLE7fNUQWKwLw8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=At6MMqyPfh04g2jBZReETLo5iStWaxqgygVB4xHK5Np9CGgy/nyljyv7qkGHWpRBTY028PwZz/0uUbFTBOxC36e1c/r6j+9rMJKHCUneQxH5GFlZET+LTemPFWTU4r5SwnrgO1Dj1vE61eyjETQQO2k0brq82jYbPhFVyl5NEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFu8AMRn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23904C4CEF7;
	Wed, 29 Oct 2025 11:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761737332;
	bh=LtODIgKzha+HT2a0mmvSUzhGTp/D/tLE7fNUQWKwLw8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KFu8AMRn4lzqeV7/QOSEXJOZtvvmNv3rrHKgtGxG11olRe95Lnmhxwc03DTmDtkFp
	 YIJ60Hwy49bC60/sga+quKuvfuGV4jBJ4YFsDfaVGQnrUioCVTkgYQzjZw+jGmMBtB
	 T4ABEVKnjgoNSdk3y/CqEbOhjijW4+kcccNAVAx13Lw9uOCS3V9XdgusJNVdsTOj4c
	 213V25ep/s/IZRuaRMkPLRfESSAe5I/52TquViWjfAzOA3rjo3oQuJtVJTJnwLl01O
	 QKiKrV2U+udgby3xkh8xzglK5ug4U1M58nsA2CRMIJjPBwqX/B/3zHT8BWeVDSw8I/
	 ZSknj+YGSH+lQ==
Date: Wed, 29 Oct 2025 06:28:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: yijie.yang@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, trilok.soni@oss.qualcomm.com, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, aiqun.yu@oss.qualcomm.com, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, tingwei.zhang@oss.qualcomm.com, 
 linux-remoteproc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-7-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
 <20251029-knp-remoteproc-v2-7-6c81993b52ea@oss.qualcomm.com>
Message-Id: <176173732646.226776.14225232798562469020.robh@kernel.org>
Subject: Re: [PATCH v2 7/7] dt-bindings: remoteproc: qcom,sm8550-pas:
 Document Glymur CDSP


On Wed, 29 Oct 2025 01:05:45 -0700, Jingyi Wang wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Document compatible for Qualcomm Glymur SoC CDSP which is fully compatible
> with Kaanapali CDSP. Also with the Linux Host running on EL2, the
> remoteprocs need to be hypervisor independent, the iommu property is
> mandatory to ensure proper functionality.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251029-knp-remoteproc-v2-7-6c81993b52ea@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


