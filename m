Return-Path: <linux-arm-msm+bounces-22634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AF907AD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 20:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFC4F1F22E5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D0F14B082;
	Thu, 13 Jun 2024 18:16:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9101304BA;
	Thu, 13 Jun 2024 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718302593; cv=none; b=MZNESPVi6bN1INRy8V8md6sIg/so8s8gxANviaT1XOdX/0YLCdy3of1fEDSPoKkuzGR+Ujx+T9XTxIqfqQHreDVX+yo+r395bi7qIL1LJPyK0YYLhRZ8hLbvPWN+D0g/rAgUil7BcHokDUKzc1Am3dBpjrZMOYD+yJmA6hEimZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718302593; c=relaxed/simple;
	bh=Bud6/tN96FwTVDQ/6rcS6twlXO8rDH9+F12q1VbDBOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsFNeq0TPVXGyS5kJsRX7hwa/0SWtIGTDdoyXJaszQ4KIXJ/XKm9TXtTTNCgzI4SreNUgTMCyuz6nSSJLRRHhN1TZW0zrp8njhZJsovhNYCq5d+uEI92zXFV5I1TCNlmeIIhJ8/rbJx8oewwfCebRa6uXRKRbaq0lZn4SL1j4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7C4593EF1E;
	Thu, 13 Jun 2024 20:16:28 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:16:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <y2zzgi4m377rziplwtycijbbdqaaqgyenlrv6v43bpkkt6247y@2uen44jhbv5v>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-1-67a0116b5366@linaro.org>

On 2024-06-13 20:05:04, Dmitry Baryshkov wrote:
> Command mode panels provide TE signal back to the DSI host to signal
> that the frame display has completed and update of the image will not
> cause tearing. Usually it is connected to the first GPIO with the
> mdp_vsync function, which is the default. In such case the property can
> be skipped.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml       | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 1fa28e976559..e1cb3a1fee81 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -162,6 +162,22 @@ properties:
>                  items:
>                    enum: [ 0, 1, 2, 3 ]
>  
> +              qcom,te-source:
> +                $ref: /schemas/types.yaml#/definitions/string
> +                description:
> +                  Specifies the source of vsync signal from the panel used for
> +                  tearing elimination.
> +                default: mdp_vsync_p
> +                enum:
> +                  - mdp_vsync_p
> +                  - mdp_vsync_s
> +                  - mdp_vsync_e

When discussing that these should be renamed, was it also documented what the
suffix means?  I can only guess something like primary/secondary/e...?

Are the mdp_intfX variants missing here that you're handling in patch 7/8?

> +                  - timer0
> +                  - timer1
> +                  - timer2
> +                  - timer3
> +                  - timer4
> +
>      required:
>        - port@0
>        - port@1
> @@ -452,6 +468,7 @@ examples:
>                            dsi0_out: endpoint {
>                                     remote-endpoint = <&sn65dsi86_in>;
>                                     data-lanes = <0 1 2 3>;
> +                                   qcom,te-source = "mdp_vsync_e";
>                            };
>                    };
>             };
> 
> -- 
> 2.39.2
> 

