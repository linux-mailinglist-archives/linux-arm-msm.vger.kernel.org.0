Return-Path: <linux-arm-msm+bounces-51821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECBA67CF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408CD3B2599
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73151DE884;
	Tue, 18 Mar 2025 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltrL79HP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797FE8F5A;
	Tue, 18 Mar 2025 19:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742325618; cv=none; b=spmZw08ekFtLF5GlTKbWSmPY48NtmFhM33ig8/1hl36l6kVTQfZTMvhq8M99Th7h45UqGrgOKPpx9ORVEC5IlE4jbfeFYI+SwZ6X3YoTrJPNBeIW3MoPIgC9/1rGd+oTk9DE2eELOcNPOMgfGizvlh2oR+DE6B06v2/5S7NMR5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742325618; c=relaxed/simple;
	bh=QHhWNBUKeZXNGzqxabBhxtwgC6jCs5xJ1yiht1yi+RA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=B5/7FM6bO34z+VF4i778jx2moRsYIMPCLiI6cTiBhbSi4V/OSO3rs3KgXZxVXWh6mi8uhfaK5ie9lmIedrbrk8J+PNGpmRTHENdxu+QBaiKe4WiunOhS8LN4Bk4c4DVusmRwrBYWVipzNeUqNrZ/aJEUvevehK8K2SFkji+e2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltrL79HP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA78C4CEDD;
	Tue, 18 Mar 2025 19:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742325616;
	bh=QHhWNBUKeZXNGzqxabBhxtwgC6jCs5xJ1yiht1yi+RA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ltrL79HPsg36aeuN1M/9cWiEukMV++3vqVORwbxydBl7mIvhfbypmO8U6qCY01UYB
	 XyJXjjhOsE+PCCSa3VkVguZrg/zH1ULCk60QN69KQEYsbBUiH5zp30/NuVXN//M59L
	 H2KM/rk+5FaWH6bA+clSqilkAxFQweSByA5zSJuXvQrSnjVTHQ7XiqwbtGRDr8K/8M
	 LGFhrSHj1eY3R4g0SkvFYOo3vx6z1Csw45fenlfXGRlse43TKucSfquOQIQocBSpaD
	 LIDtXZJB3VDof6Rx0k5W8LhcIzQjkZgi1yCAdsePi96b9gFu0FyNSagKOikq4hYlO/
	 +HKjKt4cPA30g==
Date: Tue, 18 Mar 2025 14:20:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Arnaud Vrac <avrac@freebox.fr>, Conor Dooley <conor+dt@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Marc Gonzalez <mgonzalez@freebox.fr>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org
To: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-1-cb36882ea9cc@oss.qualcomm.com>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-1-cb36882ea9cc@oss.qualcomm.com>
Message-Id: <174232561556.3517635.11714668111735399558.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: soc: qcom,rpmh-rsc: Limit
 power-domains requirement


On Tue, 18 Mar 2025 19:35:14 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain platforms (such as Chrome SDM845 and SC7180 with a TF-A running
> as secure firmware) do not have a OSI-mode capable PSCI implementation.
> 
> That in turn means the PSCI-associated power domain which represents the
> system's power state can't provide enough feedback to the RSC device.
> 
> Don't require power-domains on platforms where this may be the case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 24 ++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml:49:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml:50:11: [warning] wrong indentation: expected 12 but found 10 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250318-topic-more_dt_bindings_fixes-v1-1-cb36882ea9cc@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


