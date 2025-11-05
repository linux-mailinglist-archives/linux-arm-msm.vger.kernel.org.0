Return-Path: <linux-arm-msm+bounces-80404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF80C346F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 09:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7187A4662F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47319239E9D;
	Wed,  5 Nov 2025 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRAX053p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDF6142E83;
	Wed,  5 Nov 2025 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330658; cv=none; b=rjYpBFm6Pe9y6IlEh7x86xsV/bhdGrsat+kcjsFtXSAp7jeZmHkO6ZI+mGv4/6RnLj5eJRjQF2eG0SBl4lpmKVgt+m4COos7VHXQajhXioQjcAipaEDZcJOMAjVJSttilE2jYPdg2zs65cFq5DHLi0MhR8TTYJSPvZHc3tTIbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330658; c=relaxed/simple;
	bh=06k4jiJ4UrEXvHOJ4Ftew/dE8v3AQcvShbjYMBlJyaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9Ff9lIJ+gESrXkljizDKo79u+dQZNNC4vYBJJVRu724FcYjMiOQHA/yxpEr3pbzTqo1M7dVDmdWMioQPwvkX57oPlYiPKjtjcTeZTTZKrm6vmu7q3AYS9OaKmbokMKZCUgKSYU/Cu138LQ5hoa38ZotgdsPVz+4me2dMBa+ZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRAX053p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A795C4CEF8;
	Wed,  5 Nov 2025 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762330657;
	bh=06k4jiJ4UrEXvHOJ4Ftew/dE8v3AQcvShbjYMBlJyaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hRAX053pqlS/biqlxS55e7WkR1rnJD2Ll3kHwh3ho0yO8FdKLq8ayRWOsL1uOb2Dw
	 zgq7w2JbN/BivhMed+bG6PIb+g2X58+UN+hQpqC0yxZF99wdXMsrMCrApQlgjp87xG
	 kwX4l7yRP0czu03WkNU4T2VEIR9gu4us44IiI5HGUE/WOHdPOse8JdL+3K0L9fbZoM
	 uCa8GU/zMtaGemJiIezmBt2rQTVL+AAEE1dIKPJ8rf62ckcyZP/lgj6uA2TosgbQ8i
	 CHfur3vNK+3Unfqiogfw8Ln53N7PhyMkWtf2hTntTjZhfjfkntPy0N5gmOz7g7zIZf
	 cTivoQy8JqWdQ==
Date: Wed, 5 Nov 2025 09:17:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v7 1/4] dt-bindings: display: msm: sm6150-mdss: Add
 DisplayPort controller
Message-ID: <20251105-merry-liberal-macaw-ef387a@kuoka>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
 <20251104-add-displayport-support-to-qcs615-devicetree-v7-1-e51669170a6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-1-e51669170a6f@oss.qualcomm.com>

On Tue, Nov 04, 2025 at 09:33:23AM +0800, Xiangxu Yin wrote:
> SM6150 uses the same DisplayPort controller as SM8150, which is compatible
> with SM8350. Add SM6150-specific compatible string for the DisplayPort
> controller.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


