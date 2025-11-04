Return-Path: <linux-arm-msm+bounces-80195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D236BC2F0D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 04:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE3B43B1989
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 03:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3542571B8;
	Tue,  4 Nov 2025 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKESfiwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33C1F37D3;
	Tue,  4 Nov 2025 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225478; cv=none; b=myTjvWUSZSFGcx1k1ctiU3pc7XpoYY0MCrQQO6jna178Zx8DNWCTAihZztt6w2H1PWfbA4abLKv19Qi+Ak0c9oN6rPPUzWMKj1gCmHOfSpeXsKW0Hg29Dd1MexhMdLuR/7m9J423OUQ7arwZehIiRY9O8ROujWw88yOWk/zCKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225478; c=relaxed/simple;
	bh=ZlrAYcT8RP/bgBcBfF8bGO2Rd1/BQTXE1H4fj1wz00s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=li22/zFdr6tuNdWnjE3crebSPe/D7pyr0GkO6q/Tw1c4UrgJY0m+VVXsqVp+PBfQI9Lr0di+6uRb0kI4qoKLysdhWaa0z4wr4mvGDjHVKTzt02URMr/UVQ4C2s4tc3bxCl5B+DofJTQ+91/nmH+0M8LPqu7GtbMV65BOXTy+klU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKESfiwn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD56C4CEFD;
	Tue,  4 Nov 2025 03:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762225478;
	bh=ZlrAYcT8RP/bgBcBfF8bGO2Rd1/BQTXE1H4fj1wz00s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKESfiwnLJ6ikA/MjCzt7Ftb/R0x3Yck+4cw3QGFh2eMdY9BstQTxqGe8CQt58W3t
	 JxUPLLNQ2hdkRkEMui834cNUnYqFeDH5iqF7zTyTzaEwpcXodHPVtH9Pd1oU4SuzVr
	 BkTwPpIFSTu1UgxjvqgaaLwqwfhTI+Mo0ormO6XReaqfYgI0lufezJKzhBuSmNrEiS
	 nKrzlFa0GRwwiY9omxqrZvpgJakZ+5tOrsDB0lLojZmql9n20Aw63ublkth3z43h4u
	 wLsD5Yl8F+9ga9XF6xJDAsdzXGJvELtiP+nFJN8cAHOC3/ZgA5l0rREgEUmEt9dFsD
	 g7seOqFnRi3lA==
Date: Mon, 3 Nov 2025 21:08:09 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for
 DAI properties
Message-ID: <mrz254g4ujnwq2bsu63ajqxvgbtokbrwusbdydcj7nny3ctqv3@evj2xqqgiela>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>

On Tue, Oct 21, 2025 at 01:10:51PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044..08c273f707c1 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -198,6 +198,7 @@ allOf:
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> +        $ref: /schemas/sound/dai-common.yaml#
>          oneOf:
>            - required:
>                - aux-bus
> @@ -295,7 +296,7 @@ allOf:
>            minItems: 6
>            maxItems: 8
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.48.1
> 

