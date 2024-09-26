Return-Path: <linux-arm-msm+bounces-32575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68962987407
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 15:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F7892849F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 13:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902FC79CD;
	Thu, 26 Sep 2024 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLvHCwrV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5975410F4;
	Thu, 26 Sep 2024 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727355685; cv=none; b=eHr0cEK2FZpNau45pv3m6rE9qitXV7xSDngw8KL8pNPK5Mbet/gsITdbbbdQ12fUoQbPfKbDC9NMH4CsAFf/nggUytkZ1RDhXhvqgn4gaC9SzfGLiMKqpovBR2vFsDNcAFE41GyboZbhsox/OxxV3Ac5JGJTJqDRFDos3Yxiywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727355685; c=relaxed/simple;
	bh=wVg3LFpoI3dcZZuI44b9iLIO8NVBSdW9lrHivsHReNQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=lzGgOXVZE+pCdms7f8zKW6GkmairSJxOuAF2uQQz8pKaeGMujVZGpBX7wkKh7bDwa4THSo8MdgsnsQbjcybmPs/T8qUKIwAI/leWi8vuqNYxExCd06Oi1LFEOP4IutCsvEGBn/nO/0/3elY6wbO87YZI246gunOwbC9DJFBBJrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLvHCwrV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C023FC4CEC5;
	Thu, 26 Sep 2024 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727355685;
	bh=wVg3LFpoI3dcZZuI44b9iLIO8NVBSdW9lrHivsHReNQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KLvHCwrV4jCnX9FXVtcz5clf82Nl1Z2WDpvo7lUcL+WF/5YiF6u5WzWK8rOpPA+QX
	 /UtSwknx36BH+ZshNmuonfAQg/b2Oo3BX4a8aHvcnO2RkaRIJboH007IrhieooJmyj
	 brEnomImMaHdhG8eZCLB2LoQ+S7MQKRaJClgFZChT+NWu8aQQj4FMqlyEAzr/fUWpU
	 JWKQsl3193yZ+L/0VDvPMjlCGwqf+yaLw1fKBavmr3xcAi36e921e0B105kLBEtHM/
	 bpqS+rn3mVjtXpAHlLUCvqJ0wZO3x0rnG7vPmvdnqeBG+hn2DOOdlm4qwrHoPvdmWz
	 RvE13yGCVHepg==
Date: Thu, 26 Sep 2024 08:01:23 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: danila@jiaxyga.com, andersson@kernel.org, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org, daniel@ffwll.ch, 
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
 quic_vpolimer@quicinc.com, conor+dt@kernel.org, tzimmermann@suse.de, 
 devicetree@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 robdclark@gmail.com, quic_jmadiset@quicinc.com, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, mripard@kernel.org, sean@poorly.run, 
 dmitry.baryshkov@linaro.org, bigfoot@classfun.cn, airlied@gmail.com, 
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org, 
 quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org, 
 mailingradian@gmail.com, quic_kalyant@quicinc.com
In-Reply-To: <20240926110137.2200158-2-quic_mahap@quicinc.com>
References: <20240926110137.2200158-1-quic_mahap@quicinc.com>
 <20240926110137.2200158-2-quic_mahap@quicinc.com>
Message-Id: <172735568239.2508021.3963412517463668613.robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Document MDSS on
 SA8775P


On Thu, 26 Sep 2024 16:31:33 +0530, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
> 
> [v2]
> - Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
> - Update bindings by fixing dt_binding_check tool errors (update includes in example),
>   adding proper spacing and indentation in binding example, dropping unused labels,
>   dropping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
> 
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 239 ++++++++++++++++++
>  1 file changed, 239 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^display-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^displayport-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dts:61.13-20: Warning (ranges_format): /example-0/display-subsystem@ae00000:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dts:61.13-20: Warning (ranges_format): /example-0/display-subsystem@ae00000:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: display-subsystem@ae00000: reg: [[0, 182452224], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('reg' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sa8775p-mdss.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240926110137.2200158-2-quic_mahap@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


