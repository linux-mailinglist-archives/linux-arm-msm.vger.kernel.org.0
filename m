Return-Path: <linux-arm-msm+bounces-78974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F705C0EF97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50E694F5C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31E530B512;
	Mon, 27 Oct 2025 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ewTWvf08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787432E1F08;
	Mon, 27 Oct 2025 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761578810; cv=none; b=r+V8jH3SFRbCyXDecYZysJirpIQ+iZgUeEgrsnslQ3rDeBTgG0jVAxbXFDVHAmfXGNd3rbo95yBWzfhOBS9ikmjAr6lN2ohzey915HgKtefxGT8GO4GbEJVEsSAjKVkw81WzFYWhLIBrL0xcmqzrO4sUw8Vz6OY+F/axBjXLoXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761578810; c=relaxed/simple;
	bh=LLeqFxQlwcNHcyNdLjEaMLU02aasDZzLQh1elihrQj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQcf4oUMp6+CCP0N+YgnE6jvpH5gwB9Brw1Cl2Kh2iAphvbdKf2aHPsTzI0YbuG+tEEXlYqKmrMg31ZlVmUtgxqYw4i4mYRb9oakcJsSOyab3vxjQZ6FKb5pSEbBWXZEKV6c/WnWvn7dLJ9fZs18qKtaVFh6qy+44MgIW1QGfgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ewTWvf08; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDEFC4CEF1;
	Mon, 27 Oct 2025 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761578810;
	bh=LLeqFxQlwcNHcyNdLjEaMLU02aasDZzLQh1elihrQj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewTWvf08kTww6b9ofFj7FobTTifLtQWp8rH/upYiwQp1xQCit/Tzv99J/No7P1Qy/
	 s1DWYqc38dyeu4K60fx3Pw3FhBOnVHc5RnPzpkJ8UBdyz/yqgouNGeoqoDMJV9MCtQ
	 FnOPv2z8szvdxD5P80ykkQVSpuWAft8TrdsxjU73fG5OkKkJfK77Oe55z8CkRgl7bG
	 /duDIxTtldSuuikx3YcxvmYFupFVD4ORmqofjiv2FxqrNJyvO8/fDaUusBeGrXQGzp
	 L7tp/VctoI6KGc96QTbvf+gwOuO3aZ8C/6AdY2ixNEeGxd+PGp0qCG+PJlCOm73kuf
	 I4zmw7rzeravA==
Date: Mon, 27 Oct 2025 10:26:47 -0500
From: Rob Herring <robh@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com,
	yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
Message-ID: <20251027152647.GA915648-robh@kernel.org>
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

On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin wrote:
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
> +          - const: qcom,sm8350-dp

The actual schema will check the order. Here, just:

compatible:
  contains:
    const: qcom,sm6150-dp


> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
> 
> -- 
> 2.34.1
> 

