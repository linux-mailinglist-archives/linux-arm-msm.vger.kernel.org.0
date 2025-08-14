Return-Path: <linux-arm-msm+bounces-69296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC2B2722C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62535E3F9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AD428467C;
	Thu, 14 Aug 2025 22:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzwUkoTq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693B283FD9;
	Thu, 14 Aug 2025 22:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755211574; cv=none; b=fM3YSMdI73ciNwqweI96E8dR26/OIw9DM8phIs2A4kXJ+dZJv/dp6s5EMaNg3gv1Vs0S1a39ojn5NjoccFrbiGY3ui++w/I9PLzqEDBhBBhDjn85vasrhaFb0+OlAR12w4GNjnuI14aLjdW3Uvb0NY6pOuhqgS2ckFIi0sg+1os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755211574; c=relaxed/simple;
	bh=eVKCvuZBdo7sTzDK9mufFyxVjNlpGmchq+d/D5GmycM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoBXP1Z0DBr+V9PZVQQ3TT6/6lmPjSlLydT6w3PPT22QcWP3aafAoDl5gMZm4AsaxWTzpnJH8yY1L2wBtV863oQu8J+da2G+x9cgkW/8CWTJTb0yoxD7yIXnPM6isZvDWQMyYsOLexCHnLaGygNddzh1Ka7GS9BNDaxqzs/41Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzwUkoTq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1540C4CEF1;
	Thu, 14 Aug 2025 22:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755211574;
	bh=eVKCvuZBdo7sTzDK9mufFyxVjNlpGmchq+d/D5GmycM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzwUkoTqwUMyNSWMdTnnC7kDdMAhoIBXxmxUvHpoKQ3lHJzR15QCFXYIkslS5771z
	 np5vqUeJLkSaucizKdOw+Qodlq6CX3ORVE1aeEDNZuZHAijeEhJGuUiJBXaPbAznRx
	 d3fPFHHjU8QmSiNrXeQ/yNn0dcLrAI+skVOImTGRxtwDMqHsyoOLLC7uhUVsHP+85M
	 bShH9tgKuPo1B+Xh4owWq1mKrO8fDgq7LEcHJHTYMehJZrFM0ntCtZo2FoH5nPUbFq
	 aWNUrZM2aw8YNuIW1VxjCFifU+QIbhfxh/EzqiwMFaApPX/RYxntHnC6rsP1gEgYfb
	 /Zdp9OI2Pw16w==
Date: Thu, 14 Aug 2025 17:46:13 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Mahadevan <quic_mahap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <20250814224613.GA4052689-robh@kernel.org>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
 <20250809-dp_mst_bindings-v5-5-b185fe574f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-dp_mst_bindings-v5-5-b185fe574f38@oss.qualcomm.com>

On Sat, Aug 09, 2025 at 12:16:19PM +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller. Expand
> corresponding clock bindings for these platforms and fix example
> schema files to follow updated bindings.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 72 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 20 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++-
>  5 files changed, 108 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 352824c245224d7b5e096770684795625fc9f146..0122592a3ef5fcfe5a5ff8364b2cb6540a37a8ab 100644
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
> @@ -187,6 +195,68 @@ allOf:
>          required:
>            - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-dp
> +              - qcom,sc7280-dp
> +              - qcom,sc7280-edp
> +              - qcom,sc8180x-edp
> +              - qcom,sc8280xp-edp
> +              - qcom,sm6350-dp
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +          maxItems: 5
> +    else:
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                # some of SA8775P DP controllers support 4 streams MST,
> +                # others just 2 streams MST
> +                - qcom,sa8775p-dp
> +      then:
> +        oneOf:
> +          - properties:
> +              clocks:
> +                minItems: 8
> +                maxItems: 8
> +          - properties:
> +              clocks:
> +                minItems: 6
> +                maxItems: 6

I don't really care if we catch someone putting in 7 clocks. So just 
do:

clocks:
  minItems: 6
  maxItems: 8

> +      else:
> +        if:
> +          properties:
> +            compatible:
> +              contains:
> +                enum:
> +                  # on these platforms some DP controllers support 2 streams
> +                  # MST, others are SST only
> +                  - qcom,sc8280xp-dp
> +                  - qcom,x1e80100-dp
> +        then:
> +          oneOf:
> +            - properties:
> +                clocks:
> +                  minItems: 6
> +                  maxItems: 6
> +            - properties:
> +                clocks:
> +                  minItems: 5
> +                  maxItems: 5

And here you really didn't need the oneOf.

> +        else:
> +          properties:
> +            clocks:
> +              minItems: 6
> +              maxItems: 6
> +
> +
>  additionalProperties: false
>  
>  examples:

