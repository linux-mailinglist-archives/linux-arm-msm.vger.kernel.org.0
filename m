Return-Path: <linux-arm-msm+bounces-53118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F4A7A6F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 17:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18A051681A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 15:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39F32505C1;
	Thu,  3 Apr 2025 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7Zra+8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07DD188A3A;
	Thu,  3 Apr 2025 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694167; cv=none; b=t9bPHbTEgTDLSJJo1KWghFzV8Sr4SSuaGFx47bbw5raQiX/hCp9nmN8tlhl9ASBJak/ztseGfzulUpGbZXwouj4sfNaDm5H8D3cgq/ASAhUy6xZwRp3tmwmyGKbFzHVWCCY+uOhw7JVbWWT44yRiWBAtXfYcNbrO0ExqnG6tTaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694167; c=relaxed/simple;
	bh=Bgq41wO06U/uAv1x2bdgMUv74XXWVKv/4GQnQMRuXSM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hNqFIveRd6BPJr5QiSWewEHAIw005KMtf0Nact9Sby5AxpU8EmfVmZn2877O29DoWqAfPBuwv80Fg5dH0aklMwL+zjSOxEmfdxi2oZg1DVS/uwKyTvNY3+W6PmLfxJdY1DqQ75k+DX9t+JLJD3FhR0S0CXBGlv5gy8nd4UT19DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7Zra+8K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0976C4CEE3;
	Thu,  3 Apr 2025 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694167;
	bh=Bgq41wO06U/uAv1x2bdgMUv74XXWVKv/4GQnQMRuXSM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=i7Zra+8KODyTzoQfJUyH1kWy2yTZ61f20dK6Eqb25GYQq6h9Ak9jIQWMdpwHcThU3
	 Zln7ZWPtrsEna2ZvwDnef6Yqu5aon7pxRrgqBFOuKl/r684TyR+vU9vNnKbz91ygVS
	 xjoQT5wApv/lTcO+3JvK14/e3RrrPEvPl9iXfp5wFvovlnYwu26GV0/CUUgfs85llO
	 Nba2d61UvNrBo/5ZZMFE+R/97zZVg01lNcYbxkY5iEpFM9FpuqeL6yxs4Sh1XWYQDp
	 8iCE7WWlgEUvh0U5MBV2SzBNZOt6axEUlyky77eKmeZ0Rw/EUdtnyCWpLZkd8M+ktn
	 Zc9LSEPl557Gg==
Date: Thu, 03 Apr 2025 10:29:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: konradybcio@kernel.org, jarkko.nikula@linux.intel.com, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, andersson@kernel.org, conor+dt@kernel.org, 
 linux-i3c@lists.infradead.org, krzk+dt@kernel.org, 
 alexandre.belloni@bootlin.com
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
Message-Id: <174369416594.2973751.10281214414907199841.robh@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller


On Thu, 03 Apr 2025 19:16:42 +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml: properties:compatible: ['qcom,geni-i3c'] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml: properties:compatible: ['qcom,geni-i3c'] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/i3c/qcom,geni-i3c.example.dtb: /example-0/i3c@884000: failed to match any schema with compatible: ['qcom,geni-i3c']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250403134644.3935983-2-quic_msavaliy@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


