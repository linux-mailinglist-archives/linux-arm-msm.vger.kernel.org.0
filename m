Return-Path: <linux-arm-msm+bounces-71075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 592AFB3958F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 09:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DAFD3632D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 07:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC7B2D7DF0;
	Thu, 28 Aug 2025 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cxc1DKcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB522D7801;
	Thu, 28 Aug 2025 07:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756366587; cv=none; b=X+iFDk2XMerPCu//ZqZMUlhtFyX8oheU6Ss+Jf99bn8dTogwuGacZXYjY84CriOrc3srXWesX2liUd6gV944+8PWx2RsHIWKi6KUDED5v579eSxeqZIU0xxW/xHpZjPKVvc8MJMb+X/C4DrT/BdaudE4CyYrHP1Qkn7+lAmL3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756366587; c=relaxed/simple;
	bh=1K/qVW1RZwXvUuErhJcM8fL6vinn6Fu+vGPXQZ7rDHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orzT3Vmbxyg4FTc9kemzXa3sX+w0ThXyAzTV9TGSy0PqjorQm3QHJDb7MQ7dfwJFil3HB+/17r51DEHn8P7Nv9ZBsjtjEvzBTXN/rHy80BTCMY7Iid+KsTzatEXXabG4rp2TEm7QTQhuOXYv/EY2B9D43I5pbFNscct0eVP6Dhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cxc1DKcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A01C4CEEB;
	Thu, 28 Aug 2025 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756366586;
	bh=1K/qVW1RZwXvUuErhJcM8fL6vinn6Fu+vGPXQZ7rDHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cxc1DKcpJi0l54c6FRSm68q8cn66LDFt0AY5deSnZZNDfuVIryNjMTQyOOde8HyaH
	 HJDxUqLmr9FnXjqqag6Vmbo717dy3KCJ3n1qr+utjH58r92T6YOHaQpJ7CY/DY4goL
	 GqT7iD0QPzaywYSiRo1HyKojV0QqNxL55SwycGKGmWRGS0O8CfFJJ4g8tM1PDI7rwz
	 hmC64KdU7u9DGGeHGW/izrqC0qncFNSksC7B/2zZov9VvkpqsNh6TLXvTCEhsmp0D1
	 OuePzMXkJS1gLb5HX0JC+/9eAhlPU3WG7+wrvynoWrkoBlbelrW/jUbxNsms0CMG3K
	 yI2o00Kf0wHqg==
Date: Thu, 28 Aug 2025 09:36:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <20250828-kind-crocodile-of-progress-6cbbb0@kuoka>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
 <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250825-qcs8300_mdss-v9-2-ebda1de80ca0@oss.qualcomm.com>

On Mon, Aug 25, 2025 at 11:34:21AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> that supports 4 MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 26 +++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..4da22a211442b7abe2dc18e769d8fd14d224eb40 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -179,6 +180,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -241,11 +243,25 @@ allOf:
>                minItems: 5
>                maxItems: 6
>          else:
> -          # Default to 2 streams MST
> -          properties:
> -            clocks:
> -              minItems: 6
> -              maxItems: 6
> +          if:

Please do not nest if:then:if:then. It gets unreadable very fast.

I don't even understand why you need this. The code does not exist in
the next, either. That does not help.

Best regards,
Krzysztof


