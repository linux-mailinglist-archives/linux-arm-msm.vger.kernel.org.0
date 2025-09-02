Return-Path: <linux-arm-msm+bounces-71503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA4BB3F5C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8148F205D0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB04C2E5429;
	Tue,  2 Sep 2025 06:44:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3EF2E06C9;
	Tue,  2 Sep 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795484; cv=none; b=qQItXyYYs5SW+ummgQWlFNJPPpzhzRw/ciALgQTlnR0EeH/WK/CDjLlQmOvAmNUbjLaH8S+sF3zPwhmMqjRlac3q4GaLC5g0SpIz02NwZ8L4oHE+kjEm9H4dedg8x8oB+AKs3Xn3V7/HNWWNz7dFUu2A6ILn5aMXQA2lp1UU2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795484; c=relaxed/simple;
	bh=fk+OzkC4BhovNz0xJglq9M+q6OOOPg8PO/HWfOaT4PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjmdV0Ys2c/w9x8TuJ8TTG6vK99vR8g0Xrax5KVgPW5iAW3KgfuxOwclSX3wfmLgicQ8qeiBehgl7vuaRAfPiH0FMXrKIofehR8Urt0IIrgNVHlx7XjLqMCcI0tOz50ePn/TlqvMmrswgVdYQ3vp6n5wpDM5RDIdXK0qZbzpTcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB0C4CEED;
	Tue,  2 Sep 2025 06:44:43 +0000 (UTC)
Date: Tue, 2 Sep 2025 08:44:41 +0200
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 7/9] dt-bindings: display/msm: expand to support MST
Message-ID: <20250902-fast-hissing-sturgeon-cafdac@kuoka>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
 <20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829-dp_mst_bindings-v7-7-2b268a43917b@oss.qualcomm.com>

On Fri, Aug 29, 2025 at 01:48:20AM +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On a vast majority of Qualcomm chipsets DisplayPort controller can
> support several MST streams (up to 4x). To support MST these chipsets
> use up to 4 stream pixel clocks for the DisplayPort controller and
> several extra register regions. Expand corresponding region and clock
> bindings for these platforms and fix example schema files to follow
> updated bindings.
> 
> Note: On chipsets that support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 91 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 26 +++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 10 ++-
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  3 +-
>  .../bindings/display/msm/qcom,sm7150-mdss.yaml     | 10 ++-
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 10 ++-
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 10 ++-
>  7 files changed, 138 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index afe01332d66c3c2e6e5848ce3d864079ce71f3cd..8282f3ca45c8b18f159670a7d8c4d9515cdb62ca 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -66,25 +66,37 @@ properties:
>        - description: link register block
>        - description: p0 register block
>        - description: p1 register block
> +      - description: p2 register block
> +      - description: p3 register block
> +      - description: mst2link register block
> +      - description: mst3link register block
>  
>    interrupts:
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

So this changes explain dependency in "Display enablement changes for
Qualcomm QCS8300 platform". Well, heh, I already marked other one as
changes requested. It's way too many  patches touching the same file.

>  
>    phys:
>      maxItems: 1
> @@ -166,7 +178,6 @@ required:
>  allOf:
>    # AUX BUS does not exist on DP controllers
>    # Audio output also is present only on DP output
> -  # p1 regions is present on DP, but not on eDP
>    - if:
>        properties:
>          compatible:
> @@ -195,11 +206,83 @@ allOf:
>        else:
>          properties:
>            aux-bus: false
> -          reg:
> -            minItems: 5
>          required:
>            - "#sound-dai-cells"
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              # these platforms support SST only
> +              - qcom,sc7180-dp
> +              - qcom,sc7280-dp
> +              - qcom,sc7280-edp
> +              - qcom,sc8180x-edp
> +              - qcom,sc8280xp-edp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 5
> +          maxItems: 5
> +        clocks:
> +          minItems: 5
> +          maxItems: 5

You need to restrict clock-names. Same in other places.

Best regards,
Krzysztof


