Return-Path: <linux-arm-msm+bounces-33728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D3E9975EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 21:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3F1284430
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 19:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282911C0DF3;
	Wed,  9 Oct 2024 19:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgYWqvgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C41714A4;
	Wed,  9 Oct 2024 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728503352; cv=none; b=ioZfj0+amwoDoHZrG18fqxXRU5VT28c+rQZCW2a82LyKDTgYJ2THcDj7vKKhASd6O5vktNcmyHpRqlWimfxt0Oyev9ZM6HPyj8xy7rWSay4STIBdckWTRzeeYOM2HEX3MFC7z3P87I30SgXkPww9h+dR7yCcCUZpmODHzmPcxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728503352; c=relaxed/simple;
	bh=F9BGAE9OW60KoeoxZ9Z+4Z9YHnBaUpS4zxZSCIhTRSU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=TsvznJraEUiRAJJoJk6YgQiELHS6zEIp7fMDDItdu283zEhhKgy8vXKd1jswRR7B22e2j9gdv7E7L3W26AP9Y8NYuLnDcn7QdVOcGv7UfsuKbKZokYoEyMqDAqDZs+NXRSwB8rCaFPQxeFz6bStCMQN156EGs+r2Zk/FlVDkbvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgYWqvgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692F1C4CEC3;
	Wed,  9 Oct 2024 19:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728503351;
	bh=F9BGAE9OW60KoeoxZ9Z+4Z9YHnBaUpS4zxZSCIhTRSU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bgYWqvgibNnLE6kSc/JDDf/5k2lv1jNW5RN3JMwx7sLzdtbIK2GbN7DIp3DsJ8LJh
	 h8qqdpEyXI1H3hDqHIsKOswzSUbeGCOEwWMXVPTChb8webRZcX/13nw7sBF5SCjQzi
	 5CYquBt51LnYP3ZMpx7uCJwFsFH8Q7JOpC4ywWYAuOWfqdy4WuO0/QT5SGo2kHKkhr
	 tolCnXVMP/lferUYhn9Zr4uaBPAmc1g3HswzPBGilM7uXFLWzLVPUsozLuLJWrGPAJ
	 EFb7+4H5gtBaMYRvkwRB0TcDVPF8FYG/62bpqKqC6oeajgAwqAXDPmcQQ4AVOgDxlF
	 Z7CinApC/19gw==
Date: Wed, 09 Oct 2024 14:49:10 -0500
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Kalyan Thota <quic_kalyant@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241009-patchv3_1-v4-2-cd683a9ca554@quicinc.com>
References: <20241009-patchv3_1-v4-0-cd683a9ca554@quicinc.com>
 <20241009-patchv3_1-v4-2-cd683a9ca554@quicinc.com>
Message-Id: <172850334962.570124.4608941912754535364.robh@kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P


On Wed, 09 Oct 2024 20:02:02 +0530, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: display-controller@ae01000: clock-names:0: 'nrt_bus' was expected
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: display-controller@ae01000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241009-patchv3_1-v4-2-cd683a9ca554@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


