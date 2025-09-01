Return-Path: <linux-arm-msm+bounces-71341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F66B3D7E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 05:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E9653BE08C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 03:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDA61F03D9;
	Mon,  1 Sep 2025 03:45:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6A6153BE9;
	Mon,  1 Sep 2025 03:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756698352; cv=none; b=Px7QQ5cJhZMvuXKn7qaAHC1Md5Jc61Clpt8C/2e6JBUIojm3IYUg89oZtInfkRbIel2VCx2lD9stFW5/lVjRBJUDkh6M9T+SXQjrdm8WtJ74Og1CrJ8SKND8J2XEhCAFXipbtPnXmsN9UN5zHVvs7bhDyMPyl1GkGu65TUpqEOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756698352; c=relaxed/simple;
	bh=sKgZOVb18ukU6gfr09NK//ApDL9iFlVCo9W1MECGjQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYahpyauH31GjqGE3NAgTro0AxZer32PkRquke1vT92C16TcErO9vRAqs/05U5HXFky8B8Dtd69yxjXtrFxlNIp44nNtBigG17YK3srTRTxW7e09NnJ7SiASJCsqAvk3ms7XpLqFmgukR5NyB4wzeAP/Ez4G3V5Juj0DUuWpCUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAEBC4CEF0;
	Mon,  1 Sep 2025 03:45:51 +0000 (UTC)
Date: Mon, 1 Sep 2025 05:45:49 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/9] dt-bindings: display/msm: dp-controller: fix
 fallback for SM6350
Message-ID: <20250901-arboreal-gay-wolf-bcaaec@kuoka>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-dp_mst_bindings-v7-2-2b268a43917b@oss.qualcomm.com>

On Fri, Aug 29, 2025 at 01:48:15AM +0300, Dmitry Baryshkov wrote:
> The SM6350 doesn't have MST support, as such it is not compatible with
> the SM8350 platform. Add new entry for SM6350 with fallback to SC7180
> (which belongs to the same generation and also doesn't have MST
> support).
> 
> Fixes: 39086151593a ("dt-bindings: display: msm: dp-controller: document SM6350 compatible")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml     | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aed3bafa67e3c24d2a876acd29660378b367603a..0f814aa6f51406fdbdd7386027f88dfbacb24392 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -31,13 +31,25 @@ properties:
>            - qcom,sm8650-dp
>        - items:
>            - enum:
> -              - qcom,sar2130p-dp
>                - qcom,sm6350-dp
> +          - const: qcom,sc7180-dp
> +
> +      # deprecated entry for compatibility with old DT
> +      - items:
> +          - enum:
> +              - qcom,sm6350-dp
> +          - const: qcom,sm8350-dp
> +        deprecated: true

If it is only about bindings then there is little benefit in keeping
this, just drop this case.  However you cannot drop it from DTS, so this
is a bit pointless.

Lack of MST support is not informative enough to claim it is not
compatible with 8350. For example if it was working fine via fallback,
then that statement is simply not correct.

And it HAD to work fine, because there is nothing binding to
qcom,sm6350-dp.

Best regards,
Krzysztof


