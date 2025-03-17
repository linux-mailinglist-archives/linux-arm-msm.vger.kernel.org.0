Return-Path: <linux-arm-msm+bounces-51652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FC3A65E53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 20:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D88D19A05BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 19:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571B81EB1AD;
	Mon, 17 Mar 2025 19:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOa737wr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5A41EB1A0;
	Mon, 17 Mar 2025 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742240685; cv=none; b=H9RJYuqhX8giPQoJbrHo6AaaOS+Fq81FujEd2ZHCOQQ0LdDu3/8RWCfo0Xsnzhrq1uJgCV2pZ1QBqbWQuaGaMi8GkZFpP+T07Gn8E8D5PTm066T2k34IQx+n5J+zFnX7+LI+MAaIdRWW11vZcgJjuPJ/yY10AoHgmG/Z3YnkXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742240685; c=relaxed/simple;
	bh=OiQVuvTN1/XflXpR3RqcHCaJ640D1uHI1i9Ur7T7qKs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dn89yCGnX5PboUpDyPyi/BrCdDHFIR7prBIqn+tGT0Pcz43OHkUzZXex3NSIWh7fI+msyfLjms+mIlG8S2/1a+SWdHY29LFV7IS/WDolIr+M+H4+FvHR6bvBJsm9reX/JmjfwrGgxw51AzRa2lrL//iuaf/z/cJoCUpFvXuPT7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOa737wr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DB4C4CEE3;
	Mon, 17 Mar 2025 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742240684;
	bh=OiQVuvTN1/XflXpR3RqcHCaJ640D1uHI1i9Ur7T7qKs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LOa737wrjHepnbxep326FXIDSAcB2rL++PYLUj/AszMLNZHv7tdoRhUNrX9QZrleC
	 A0dKbD1XhZRR5Kv2Fi+eBXALlamDgHb3ExZfje4E09ZLXgLCzdM/CMLltD/YSV7Pql
	 e7ZJ5fJgFeVAZJVt/ZwuHnhroS4ZRwlm5COLLNnvU8vbZJXfoyHcuiETR0b9hB60XY
	 aFKci0gMNcgOLFIieuVYhfo08wg0yLhvo7tpxm4rMSU2JW1PuIIf5br0HavPhfuvHQ
	 PCMfyIH4pXJC7Kvc1Ss6nyRrHrpCcUm6EDHLoZdJDiFJf2sqKkQp++J2gbgdnaGf5p
	 pRfeDmX1+CpwQ==
Date: Mon, 17 Mar 2025 14:44:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Georgi Djakov <djakov@kernel.org>, James Clark <james.clark@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <andy.gross@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@linux.dev>, Andy Gross <agross@codeaurora.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 coresight@lists.linaro.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Heidelberg <david@ixit.cz>, 
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Kumar Gala <galak@codeaurora.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Message-Id: <174224068328.474126.11922746474259386307.robh@kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: arm:
 qcom,coresight-static-replicator: add optional clocks


On Mon, 17 Mar 2025 19:44:39 +0200, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks (or both). Document those optional clocks in the schema.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml: properties:clock-names: 'enum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


