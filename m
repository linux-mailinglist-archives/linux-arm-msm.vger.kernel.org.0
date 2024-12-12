Return-Path: <linux-arm-msm+bounces-41634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 101469EDD9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 03:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77BBD188AA6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BF3153BD9;
	Thu, 12 Dec 2024 02:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbvGIkul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0D13B5A0;
	Thu, 12 Dec 2024 02:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733970319; cv=none; b=UR9OkUKt2WY1ycrWi3thlto8JVfkG2soEf4AtifOnmDdU+/NOXuwIgIlsiXPi9DmZ24j+hJR0u1+UlbuAGwQrCbe09vudZiav5x4L/nt9q/xQhY8AvzhYnJ3VHuf2tCCT51l81zjsaB7tBevHMMPNyDlF2d/HxwrZP5BcSp54dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733970319; c=relaxed/simple;
	bh=x3A3sWK6jeF1GeYmuRVE1pvNZ97/UHBHpbylcxrw4NY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=T7+YDMvZHju3+/5I8+9m28PYXAu/xjzOKDWs0/mzbMEvCXB1nvmVSCbcbFFLO9Aqm1SUB3zKQpIxP34jcOBEvDZQgm43d5j7U7LMOP9nGKMFdRsLsYJ3dNPrtclq5svoohKHwX5tasyIIt6Ac8JO/9jeJnTRhA6r0TS4Ps98Vok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbvGIkul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52AD2C4CED2;
	Thu, 12 Dec 2024 02:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733970318;
	bh=x3A3sWK6jeF1GeYmuRVE1pvNZ97/UHBHpbylcxrw4NY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EbvGIkulveWXeLvCT6rzbsL6jrQvtoB3c7T3EmFoaZxuWjYZg1u569mPWIdMIDIWy
	 CMfHpQnNbZisNNxeroch+9iFvujgH8CG1KaO2hrPnQ+BxDmFsIbClA+0L9innsWtYm
	 vVhE73fjng1/GDuC5cGLoG0DdHB4Diwmy/NUNfLqdes0XzLIPQOQiH+CTBA0yQKdCp
	 axCJQytROg+n1XC1Ovnigwzg1UkJb0b58IaU4hsNOV3VkdJSpwNIedgv1Dd5L2PU5y
	 yiU7e1LI27ui6xisXhtmdi31oMxGXkeft2vl0fzO9rG6ZtsBJ3f4MBEHt58FPaRn7a
	 /YQFEftOgJNoA==
Date: Wed, 11 Dec 2024 20:25:16 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: broonie@kernel.org, dmitry.baryshkov@linaro.org, lgirdwood@gmail.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com, tiwai@suse.com, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 srinivas.kandagatla@linaro.org, conor+dt@kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz
To: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20241212004727.2903846-2-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-2-alexey.klimov@linaro.org>
Message-Id: <173397031583.639482.10713937471228797142.robh@kernel.org>
Subject: Re: [PATCH v2 01/14] ASoC: dt-bindings: qcom: Add SM6115 LPASS
 rxmacro and vamacro codecs


On Thu, 12 Dec 2024 00:47:14 +0000, Alexey Klimov wrote:
> Document compatibles for Qualcomm SM6115 SoC macro digital codecs
> (RX and VA).
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-rx-macro.yaml   | 19 +++++++++++++++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 17 +++++++++++++++++
>  2 files changed, 36 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.example.dtb: codec@3370000: clock-names:1: 'dcodec' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.example.dtb: codec@3370000: clock-names:2: 'npl' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212004727.2903846-2-alexey.klimov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


