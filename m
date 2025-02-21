Return-Path: <linux-arm-msm+bounces-48885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB090A3F5BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 14:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37AB3427829
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6296420D4E0;
	Fri, 21 Feb 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHv6vEql"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352161E87B;
	Fri, 21 Feb 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740143683; cv=none; b=BFHuijO31Mfj/fNBlEIcOpCOBxryW71omIRUh9Y4jd4nicrPw3kPxoCCrne7FZEaUVE+evHGlomEiXccIzYuWAzuJU1dIL0lvEyCP/1SSN38WFwCeFXIIJSIlslXty7EgRHp8hbM7RmJKV1J8TDf+o4Q+53EWyFotdWDqAjqQtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740143683; c=relaxed/simple;
	bh=4SLtRVzYW2Epxvc52iwU1nHpJqyBgABkLoe0js9iRpY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UZnmBKI9OgNH1ipCFdFi1xelV6dkj++Ex3HkhFkye3f+unK0wvNsAxs079RC2MCHOBCrc1M5Qj8FpXZCmFn8DLEAJpANIjUhtbXb0zgJdznbkTflHpNz+oqf01wbu91eNP76wq9Phw+tkQPGP/NRuDBrJw75YjiNG+HvgHt5Ppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHv6vEql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A0AC4CED6;
	Fri, 21 Feb 2025 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740143683;
	bh=4SLtRVzYW2Epxvc52iwU1nHpJqyBgABkLoe0js9iRpY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QHv6vEqlf4x8hZS5I+CDOVG3hd40C8YTA1T31EuW2WH+Zwxu0iOHsnm0MI6i2bw9H
	 G41CnL0ZNSu0pkhn8f9l7dpDwt1mRxAx62WaNNfik6I0cv6qj4rcKYjAFu/FDpHoKb
	 DC8jYuf/04RfmmI2qtsW1Be230JkMM9QdLsTkqm8HJfT1YaEHAYyTN/x6QhIN61R13
	 jpioxmZ/xEnywpf7MKN7VTQ3YmYeTlx5ah79rNC0RUXEeb1tpCUums5S7vneDClZNL
	 H62wHgckTdom1N+PDY6w/xRoJDw5UcZHRJ18B4KbudH82/GEYCOu7cOMUKvDRZ4BsR
	 S0j8JDnDVYVrA==
Date: Fri, 21 Feb 2025 07:14:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Clark <robdclark@gmail.com>, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mahadevan <quic_mahap@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250221121703.72230-1-krzysztof.kozlowski@linaro.org>
References: <20250221121703.72230-1-krzysztof.kozlowski@linaro.org>
Message-Id: <174014368122.2668239.11304901481263017777.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Add
 missing eDP phy


On Fri, 21 Feb 2025 13:17:03 +0100, Krzysztof Kozlowski wrote:
> The Qualcomm SA8775p MDSS display block comes with eDP phy, already used
> in DTS and already documented in phy/qcom,edp-phy.yaml binding.  Add the
> missing device node in the binding and extend example to silence
> dtbs_check warnings like:
> 
>   sa8775p-ride.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('phy@aec2a00', 'phy@aec5a00' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 32 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: phy@aec2a00: reg: [[0, 183249408], [0, 512], [0, 183247360], [0, 208], [0, 183248384], [0, 208], [0, 183246848], [0, 456]] is too long
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250221121703.72230-1-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


