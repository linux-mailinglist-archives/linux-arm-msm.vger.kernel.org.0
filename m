Return-Path: <linux-arm-msm+bounces-86093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E86AACD4A7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E84903004CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8485C3246FA;
	Mon, 22 Dec 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhAXZAHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564937260F;
	Mon, 22 Dec 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766375469; cv=none; b=APHou5DeSuz5P/rUj1MvBgQWZCbAFK8f+cs0ETGKxfmJxW2rFCQZEJS5FdETPnYa+gmwtYPRz0v5jzMkeAsiKoof6nP4ltmWENJMWu7rWO7uoaOKmpoZQ6jP6matabPN44vu2CPadf2gImeBDH2Ko59PAtbxBVznZdkVwtV+Iqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766375469; c=relaxed/simple;
	bh=MEeM6tsBj/3OM0kMlSaegn17vrVHhDO+vGFmkDp5jfI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=p61q36JJVtcdFiFY++mdUm8/ph4lco1hV9hP/S+yTHjDILs6cN7rphVmVS+vbA2vhr/ZQKZTmc9SkeKTUZcIA4KahDxndkbySKk6ZQKkDU6MC0Vnm3w3yRIYcB0hEZF/gGmLlfs+2aXhyMqxGA3bbfSVIJSO6paB3gSx8oZVKyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhAXZAHn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF00DC4CEF1;
	Mon, 22 Dec 2025 03:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766375468;
	bh=MEeM6tsBj/3OM0kMlSaegn17vrVHhDO+vGFmkDp5jfI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YhAXZAHn59YGF3vYDo9h4YGMPJPZb4FhTZtscifBLXf8G+eQUcp/djn3ybWpHEI8x
	 bN0LrzOM8HMviDlrA31rg8cgWZiCysgmXWgGUkPmuyZfksEnqoJhWqjn1MsjG5of6a
	 BcQo90YfbTnqDvE5SdwLiL0o6yc4iFd4rY6L+EQ7OCVR0fFI8StYaSMYqvWtg2XQ4Y
	 8TLJncqEwGZTJADQxeXpLd8fb4U3M8QJK90Wr3puK1hcTcarvYiRh8T0qM0aYc+7/V
	 mXpSrQfNWX073cpXsKPAf+oayxf1Rz3tEbfOuiJpvbmC7XTGTgdAGP3nORPG9Rk5xL
	 6nxUQQ6E20/cA==
Date: Sun, 21 Dec 2025 21:51:07 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Andy Gross <agross@kernel.org>, 
 devicetree@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 dri-devel@lists.freedesktop.org, Martin Botka <martin.botka@somainline.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
Message-Id: <176637546557.2070819.6982338294442639019.robh@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC


On Mon, 22 Dec 2025 00:32:12 +0100, Marijn Suijten wrote:
> Document the Samsung SOFEF03-M Display-Driver-IC and 1080x2520@120Hz DSI
> command-mode panels found in the Sony Xperia 5 II and Sony Xperia 5 III.
> It requires Display Stream Compression 1.1 which allows the panels to be
> driven at 120Hz, even though a 60Hz mode is available too.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,sofef03-m.yaml  | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0 (samsung,sofef01-m-amb609tc01): 'vci-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


