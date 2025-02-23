Return-Path: <linux-arm-msm+bounces-49053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD7A40EA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2CF03A8ED0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 11:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF6F205AA4;
	Sun, 23 Feb 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI+ElpLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1891FC7FA;
	Sun, 23 Feb 2025 11:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311648; cv=none; b=By40woD1Vg2BdGt3y4omTzqxubOlms7YD3mDy/P9gecd9sXsFVPxo4Al8dVmSGxecKsuvI2TxcWxSY1G/XscoEYHtOEQ20jOsITtf++6uvvlu7F7ZsMpM3W/KJtCjyc7Cuewy1bs4mrFiMICYLDWnCUIGFnvu2PN9heiBCNg2G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311648; c=relaxed/simple;
	bh=0rnegyoPhqtqI/UJ60gCJqaehQ7iPihQkGs6eKBlSN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG8LUcyDvQQvgu9aDKxQTAIQ3w5DXDdKJqjes0qHX4De/Mo2AO0/O6ECWtDmXG/fP1VPLU+/89MhGRnMtIAbw4vQUXJYShH833jAuFmRMTWWUYjfgy3WME8mBpSDXCyvRRykCcClNw38WjwHjcPHu5aI+LGR7ZoWbFoHPrXunus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI+ElpLL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE79CC4CEDD;
	Sun, 23 Feb 2025 11:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740311647;
	bh=0rnegyoPhqtqI/UJ60gCJqaehQ7iPihQkGs6eKBlSN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cI+ElpLL/qJfgJxNnUNOmBczNjq9lWIGYZFthMAmWkmcpI6GHvhelbY6hqi9j7kKI
	 20IeqTzUQSxtDfSqL77T1rvXI2EiULA0ZuzsuVJPU/SrvDG7T7qcxXY0gMT9YF3BKb
	 CsWooQguIOtQ/nh3DZfCjIKXbT4vgR1+v/3hjjtXrUUwSlJWKXmp+79zj8VSRtpKX7
	 U0lENZofBwmErHzIckb61qmMripfXj6WLG8o+N1KM/S+aXoU687ZXq1bI/JwFsWrt8
	 5WSJ79xhqaIgbjAHvZZ8BZgq+B/JzNUST+yHbGikHkZRzE/O2l5CIzNuY8k2BAMUlD
	 KDgYPe9YXBQhg==
Date: Sun, 23 Feb 2025 12:54:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <20250223-tricky-saffron-rattlesnake-aaad63@krzk-bin>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>

On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel from DJN using it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83112B-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca@lucaweiss.eu>
> +
> +description:
> +  The Himax HX83112B is a generic DSI Panel IC used to control
> +  LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: djn,fairphone-fp3-panel

Why no himax,hx83112b fallback?

Best regards,
Krzysztof


