Return-Path: <linux-arm-msm+bounces-86094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24429CD4A8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E27A3006460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A184E326951;
	Mon, 22 Dec 2025 03:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aygTOXkt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737EE326946;
	Mon, 22 Dec 2025 03:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766375470; cv=none; b=l7jqPP0xs6VKiz2gzZpgxvfEgPSoY1jpYTVfGuxJt/HE0rAGxMVm2/rtrmC0YTT6IFAgke5E2LmDhbLR2LDc4/KT+SuObkIF3uxEC5BUWrMBuLAl2fDfkAmU06R9kT0dkz/CWfMIKgN8TgBKYzwf9EAOGbd1hgsrjSdG7K5bT/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766375470; c=relaxed/simple;
	bh=nBw4PryBF6Gkq2ZTd+pa+4krsc8cXuhOR+oVgs3t3nQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=F4FlV75qRZ7Kr3P0UIGkPSk33Kt2Vr1qN9uCwAt4eF/BR1TQ39xRr8SAu5O27a1UVrPa8CM3rOagctk6bniVst+kTlrELcB90e/cSGwEgz3iE4s8VEP+vmImMIzd+HWN6FVsTWC7gUeSUym2wHxg3NyTztzpgWbY2AzoR7EljYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aygTOXkt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9189C2BC86;
	Mon, 22 Dec 2025 03:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766375470;
	bh=nBw4PryBF6Gkq2ZTd+pa+4krsc8cXuhOR+oVgs3t3nQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aygTOXktrIzznVoXoMNBvAg3QKFh5l+Hh6nAr5udJIcDly4x4hAcJInuwpLBVooFr
	 gR/BQD3k8YX+FLjljPDmd3pRWQd8rw6Thcmzs7VrMTTDlr8+LeZd6/WUCNlZ8bCuBW
	 RnAbv/A3SQxg1dbcENo42hfMuYDx3kRkr7kIY0GegdgfTv0JAvwrcbeFtK6X4rCV8M
	 pLMWGSM7EDSrZzGKRrg/3aHIEAJU11QCB/inWfMaWHcczeX1GUkBwJm6ciYD9DbksX
	 EjdZQoYvDnu+dBzZjZIDDIq6Xn57CI/18B5dw1yafhwq6mGIhAZviA+FpXzK/C9tvp
	 hyhE15gS8GRMQ==
Date: Sun, 21 Dec 2025 21:51:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, David Airlie <airlied@gmail.com>, 
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
 Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Martin Botka <martin.botka@somainline.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org>
Message-Id: <176637546656.2070861.2818143516982857920.robh@kernel.org>
Subject: Re: [PATCH v2 08/11] dt-bindings: display: panel: Describe Samsung
 SOUXP00-A DDIC


On Mon, 22 Dec 2025 00:32:14 +0100, Marijn Suijten wrote:
> Document the Samsung SOUXP00-A Display-Driver-IC and 11644x3840@60Hz
> 6.5" DSI command-mode panels found in the Sony Xperia 1 with amb650wh01
> panel and Sony Xperia 1 II with amb650wh07 panel. It requires Display
> Stream Compression 1.1.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,souxp00-a.yaml  | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251222-drm-panels-sony-v2-8-82a87465d163@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


