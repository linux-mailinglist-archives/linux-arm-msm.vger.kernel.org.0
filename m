Return-Path: <linux-arm-msm+bounces-51686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F287CA66D09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35157189F851
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D431EF374;
	Tue, 18 Mar 2025 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sr1P8L7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52517E1;
	Tue, 18 Mar 2025 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284563; cv=none; b=Bc1mJr+HVMBbfPjo6J/Zgtke7br04gIyCN5Z5bhC+qKbZ0Ooi8Hf4r5zC6CGBj/iS0BZtXF8qFJ0kXWunt+pBtbvk5TQ0kC4WAqcFmPYk78KHoL3MdkAod3liyrSLpEBzmo4tJhb2L1+WVJaKTsJLqAQKDPZE8ZYvg5UCWgQcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284563; c=relaxed/simple;
	bh=LtjsmPhSNisv7I5z84pcT0c3tUyrHI8gEhlKPZozsJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJYxKQ+YrVBBaaykE9bttNR/F6J06pDhiw1pRzVXUKW+uc3KzICmJZTwkTU5L8tQFXV4VyYNjqfy1myFqQPnHomE4nLBarYJjG8pJn+8xOr/AvwsAqzPNhCW7Vn2Cb99BjaRQwIZqweTLM8mb/j8xl588VT8hROSJqwzY5aFheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sr1P8L7s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21198C4CEDD;
	Tue, 18 Mar 2025 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284563;
	bh=LtjsmPhSNisv7I5z84pcT0c3tUyrHI8gEhlKPZozsJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sr1P8L7sxm7dCokDBaNlASRuyiiwrimV8VPr8U/+wda6RR6MQ4kdCL44tBGs2L8FV
	 ESAmxY+3mx5DXMXWwTWE4gOaAC8xN4Lnjp49rXvl3zyVpPafGNV5ZcKHoDmQqNRXYc
	 DXqN5528GxdBI5rB1cZmg3c7gWpW/vi8HV/m0qK1vTwO0pRGCn+4Lgz3RKGH5CqeVe
	 WBS1TbqAmwYozArJWE+f0ZtGrrdTZkPXPkFDXe+/AKOqYn16LD08EXeRg0wYe+5DU7
	 BagVlaCmP5ntnHCx+NcBJBrQ8SZer/LT+M/xafox9ODbTLTjTje0kjwrHZT9MPxI2h
	 DtX4hHEtyxoSQ==
Date: Tue, 18 Mar 2025 08:55:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>, 
	Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
	Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
Message-ID: <20250318-adventurous-cherubic-coua-eecbbc@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>

On Mon, Mar 17, 2025 at 07:44:37PM +0200, Dmitry Baryshkov wrote:
> Add DT schema for the MultiMedia SubSystem System FPB device, which
> provides several registers to control interface between multimedia
> devices (primarily display) and system busses.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++

Filename: qcom,apq8064-mmss-sfpb.yaml

>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
> @@ -0,0 +1,39 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm MultiMedia SubSystem System FPB
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +  - Rob Clark <robdclark@gmail.com>
> +
> +description:
> +  The SFPB provides several registers controlling the multimedia attachment to
> +  the system busses.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,apq8064-mmss-sfpb
> +      - const: syscon

Why this cannot be part of standard syscon bindings file? Looks simple
enough.

Best regards,
Krzysztof


