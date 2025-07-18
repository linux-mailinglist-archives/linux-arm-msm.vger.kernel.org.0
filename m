Return-Path: <linux-arm-msm+bounces-65589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD20B09C84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D92513BE83A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 07:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DFC22157B;
	Fri, 18 Jul 2025 07:26:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AA4221555;
	Fri, 18 Jul 2025 07:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752823599; cv=none; b=pHNF1PhiD19CQV/7h3HiwvnqqZIWF4koTdOBdGTN3KgR5TzXBGpUTczmYdiTIgOTfP+urVthEl0dhegHu/sh7xchSWBk6Wnucc3r4RBJ9YQYiDBjkWjN4y7hfzCa72PeaBpdVYrvutI0L1TsRnHPU6UPM5CkY9uG3uRazrswZPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752823599; c=relaxed/simple;
	bh=wLshPyNLp7hlT80Ks9V4q7iFhoOTGbu6EIpbRctb510=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvKSC07D611Ou4nxqZLtIAECUj+e0luXB28PAw2j6ELWBLqfEP8rtxyeCxKfiHQOftuEvyobMckiP65SY+9Wi46SfJnq4UD4MXMaUjp2rTYsffc5Jei8btUazjBp/Yx1Zm+xSptflepUwZk9iHRHhGS+TgZJcTpLYR4+LQL5scY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548CCC4CEF5;
	Fri, 18 Jul 2025 07:26:36 +0000 (UTC)
Date: Fri, 18 Jul 2025 09:26:34 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mahadevan <quic_mahap@quicinc.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Danila Tikhonov <danila@jiaxyga.com>, 
	cros-qcom-dts-watchers@chromium.org, Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <20250718-enigmatic-grumpy-worm-64fdd0@kuoka>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.

Then you need to rework if:. Don't use contains for the sm8350-dp, but
list the front compatibles supporting.

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index d8d94f62c102..2893f097df82 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -58,20 +58,28 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: AHB clock to enable register access
>        - description: Display Port AUX clock
>        - description: Display Port Link clock
>        - description: Link interface clock between DP and PHY
> -      - description: Display Port Pixel clock
> +      - description: Display Port stream 0 Pixel clock
> +      - description: Display Port stream 1 Pixel clock
> +      - description: Display Port stream 2 Pixel clock
> +      - description: Display Port stream 3 Pixel clock
>  
>    clock-names:
> +    minItems: 5
>      items:
>        - const: core_iface
>        - const: core_aux
>        - const: ctrl_link
>        - const: ctrl_link_iface
>        - const: stream_pixel
> +      - const: stream_1_pixel
> +      - const: stream_2_pixel
> +      - const: stream_3_pixel
>  
>    phys:
>      maxItems: 1
> @@ -173,6 +181,32 @@ allOf:
>        required:
>          - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sa8775p-dp
> +              - qcom,sc7280-dp
> +              - qcom,sc8180x-dp
> +              - qcom,sc8280xp-dp
> +              - qcom,sc8280xp-edp
> +              - qcom,sm8150-dp
> +              - qcom,sm8350-dp
> +              - qcom,sm8650-dp
> +              - qcom,x1e80100-dp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 8

This if is redundant, drop.

> +
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5

Only this part has an actual effect.

Best regards,
Krzysztof


