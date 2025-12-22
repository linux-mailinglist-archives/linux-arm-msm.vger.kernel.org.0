Return-Path: <linux-arm-msm+bounces-86095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4DECD4A9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48C5A30010D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A03832720C;
	Mon, 22 Dec 2025 03:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByEwSWJC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0646327200;
	Mon, 22 Dec 2025 03:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766375472; cv=none; b=BC7Johr+F7tdMW7Fw64u9dMg94q6A9hcDuoj+T51Q8PYEKu4zn+0kB8R3LyIglA5vDIouyf9aHt02gURLIkRcbhVV/AS5SYf3v91FDVTUGnswKGzk96hba3n4n4UOHmOcUaZ3MtQqnEGTy65YNrtjk5bM3eML5an8ZnRHtAcHOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766375472; c=relaxed/simple;
	bh=bmZtYfujMFG4w/cR+R5ItWw4bZeevnK8Lo5r2PAD8ys=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Rflbvn8PXcV+YBn5h3H813LCFlp5WH5qWE4N/PgKb69yJ/VEsTHiig2MfV1qzDL/qGlJA1OHGnUb6lqynxhbByKDv8u/NUf2RUT/ajrGorp/gHhKHX3HIkRhm1BwET6Q2lETrfT/ZdB+qio2mJJuabCy66aR4HSZqKIiZbG1ywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByEwSWJC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B80C113D0;
	Mon, 22 Dec 2025 03:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766375471;
	bh=bmZtYfujMFG4w/cR+R5ItWw4bZeevnK8Lo5r2PAD8ys=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ByEwSWJCLdRrdAp6Sq/q2e9XkscSVPpC2fZlFw5EUGMSpfWcZ3VSPAwBHXiSb0L5M
	 89a3DqsLXrKohyzANQx1Lr62g6fLwMSRbn1c03iQu9pUYNim+88xyHmAlPjBEDJ7d/
	 WIW3Ppkp5N7yq9gVVw1vj5kezF7+dpUnpo8oXZAbrug/1a9sBDVbuGkem5QC5AFIch
	 AWgW1e5XN6jV7wog/DjsWXCFXYyo8KesHY7i1YeQOsvXt306TzyEhS2rcoEevV+J30
	 vglNciEiqSQx8BeAnyBtYG8s8vBts8jGFFV4CdxHoVT5O+kyi48hPm/ik79fqGkOy3
	 MarP4YHGoLz5w==
Date: Sun, 21 Dec 2025 21:51:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Martin Botka <martin.botka@somainline.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org>
Message-Id: <176637546768.2070916.15396482062955238978.robh@kernel.org>
Subject: Re: [PATCH v2 10/11] dt-bindings: display: panel: Describe Samsung
 ANA6707 DDIC


On Mon, 22 Dec 2025 00:32:16 +0100, Marijn Suijten wrote:
> The ANA6707 Display-Driver-IC is paired with the amb650yl01 panel in the
> Sony Xperia 1 III, Sony Xperia 1 IV and Sony Xperia V smartphones.  It
> uses Display Stream Compression 1.1 and requires dual DSI interfaces to
> satisfy the bandwidth requirements to run at 1644x3840 at 120Hz.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,ana6707.yaml    | 91 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 96 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'port' is a required property
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251222-drm-panels-sony-v2-10-82a87465d163@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


