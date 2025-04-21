Return-Path: <linux-arm-msm+bounces-54836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49226A94BFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 06:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0E316FC6D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 04:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066E6257422;
	Mon, 21 Apr 2025 04:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gda07qmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6CCD531;
	Mon, 21 Apr 2025 04:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745209709; cv=none; b=I5VCUmc2CXFuXnutg9ivdMzkbfsZCKxfl/6lhN991ejriVI7ftuOHUd0iHQIAvFBGDcuEp+p9cq1jmYLdJuvekNDhkt1X9i5Syyw5ioXXQf7uK57TgEEC8LyeS5r5KlzulqoCGFpRJpWLmk7MhDR6y7LwSf2FuFWiAYdubRZF40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745209709; c=relaxed/simple;
	bh=7RTjC413WFNTnsJ+sW8AYTWPri18G27NFZBUWSw+9jY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hmByGaEpCKvoCxre3IzL21zh2gTqDqWdlBoej7xGhYKJvUIA0YsZMiJc4eFZpKLd2I89Zi9Sv75IQdFs8sZHVkahy8tbraHEVV309HgV+zp3P08bXxnCdxmnMvuIzFj2Lu5rHnXF9XkqOdbT1bt60FUm2a00ysgKgHy6x0isjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gda07qmI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC41C4CEEB;
	Mon, 21 Apr 2025 04:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745209709;
	bh=7RTjC413WFNTnsJ+sW8AYTWPri18G27NFZBUWSw+9jY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gda07qmIq4zjbljH2XaqDeIlFaDNEcWJ94MEuYowVNAeWl2WSVru4XnzlYVwIntgT
	 i6ZPsySZnkqdfF782pC1R5Yl2KnMVu7+9WRXRmzBbMfP6V3i3/FsgFep3TVXz4/rwy
	 uEp5JRNE7DBD5vK625t9740OVCJnLlsVgaotWh/posQF1UwLJPNrdu5c5DTSHn6FgI
	 G6+yjEDVqLx6PzadoSvbxRRlPkuex+LeD3lSPMGozrwUC9tcxpkl7UfQMRTEyeW0U9
	 AzYApueuj4mdi6ndXGQ6Yfx6pdHr1doOT+QHcjkYFUinD4Gfp/qrAf5ZcpMM5yDqDx
	 oBRR/fO1tq8pg==
Date: Sun, 20 Apr 2025 23:28:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org>
References: <20250421-a5xx-schema-v1-0-7d96b889322a@mainlining.org>
 <20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org>
Message-Id: <174520970724.607579.8539771287232502050.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: Document clocks of
 Adreno 505/506/510


On Mon, 21 Apr 2025 05:09:21 +0200, Barnabás Czémán wrote:
> Adreno 505/506/510 have previously undocumented alwayson clock.
> Document clocks for them and enforce their order.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../devicetree/bindings/display/msm/gpu.yaml       | 83 +++++++++++++++++++++-
>  1 file changed, 82 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:1:then:properties:clock-names: {'items': [{'const': 'alt_mem_iface', 'description': 'GPU Alternative Memory Interface clock'}, {'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}], 'minItems': 6, 'maxItems': 6} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:1:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'alt_mem_iface', 'description': 'GPU Alternative Memory Interface clock'}, {'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too long
	[{'const': 'alt_mem_iface', 'description': 'GPU Alternative Memory Interface clock'}, {'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:2:then:properties:clock-names: {'items': [{'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem', 'description': 'GPU Memory clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}], 'minItems': 6, 'maxItems': 6} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/gpu.yaml: allOf:2:then:properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem', 'description': 'GPU Memory clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too long
	[{'const': 'alwayson', 'description': 'GPU Always-On clock'}, {'const': 'core', 'description': 'GPU Core clock'}, {'const': 'iface', 'description': 'GPU Interface clock'}, {'const': 'mem', 'description': 'GPU Memory clock'}, {'const': 'mem_iface', 'description': 'GPU Memory Interface clock'}, {'const': 'rbbmtimer', 'description': 'GPU RBBM Timer for Adreno 5xx series'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250421-a5xx-schema-v1-1-7d96b889322a@mainlining.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


