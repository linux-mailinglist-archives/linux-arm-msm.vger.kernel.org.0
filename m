Return-Path: <linux-arm-msm+bounces-79013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0782C105F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 20:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79669560D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17308329C5D;
	Mon, 27 Oct 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPAJT9g/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF61121C160;
	Mon, 27 Oct 2025 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761591111; cv=none; b=CPjigFnGKsgi4KIfnx0VAK9ZcetWK6RWKC6bnty7BrNi0SiaYOIi4Z7u01MIvK578Rzb56TUu/PEimUjZuaE1kvBf1Xxx8B3FtvyLtrlulr6ruK/J3PL11CvWgFXEEuIB/E+E74lNQGCezo1wppWbLVoY5pNzJJ7SaG/x5uYlvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761591111; c=relaxed/simple;
	bh=9cXrx2C0wiBPVnpRJnsgqJdhF/scUoAfis75okK/eD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K01rB9biseJXlhMG7h6seUQO968bsIS4Bh2mW2JNbkmJo9dJ+EI0XD3F6FOZilA8aNUiCs/dWJXaGKi9h6mIzXpTARMhyJKfIO92CUFsmSvZ0c+07tOMVZHF5kPEN6FMbjyuKf89u6ZwnTRSaDmC5iTn0J3nxfclpFL9gc1ib3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPAJT9g/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FA8C4CEF1;
	Mon, 27 Oct 2025 18:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761591110;
	bh=9cXrx2C0wiBPVnpRJnsgqJdhF/scUoAfis75okK/eD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPAJT9g/3RK7KJ6fmq6ttMPk0n1PDOLiiZmlQ35lvKWG151nsGTCrl2X1xd42Dx+T
	 JbcXJ3WFeUvZDbGLDUxyR+Kzo5RuB2fWgjs6NaHpdZLbGFl3HhSIM2Z2mzZA/6Ox6K
	 qX3PqB9FN5nlxdBYRa8bj7WKCrcNE4Al+4UjVoFvvn2QIxH9uvT7eDEK/lIp6180+f
	 F8Pff0mGzGf36gjQvSYDrsCY7ukZeoBY3R/jk5AjvBJadKrQgrLj6jD16w8WtJRQ61
	 1vJ4vcH1Nvl/DMTs1UikheyU+vfUBNzCHkPZBp8PLW9CGDUPq6KUxsUl3k0VHc3rDX
	 tkqkZ2shWJ36A==
Date: Mon, 27 Oct 2025 13:54:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: xiangxu.yin@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>

On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 
> SM6150 uses the same DisplayPort controller as SM8150, which is already
> compatible with SM8350. Add the SM6150-specific compatible string and
> update the binding example accordingly.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
> @@ -51,6 +51,16 @@ patternProperties:
>        compatible:
>          const: qcom,sm6150-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm6150-dp
> +          - const: qcom,sm8150-dp

Perhaps I'm missing something, but if sm6150-dp is the same controller
as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
imply that sm6150-dp is the same as sm8350-dp and we could not mention
the sm8150-dp here?

Regards,
Bjorn

> +          - const: qcom,sm8350-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
> 
> -- 
> 2.34.1
> 
> 

