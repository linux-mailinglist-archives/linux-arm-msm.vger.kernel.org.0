Return-Path: <linux-arm-msm+bounces-24174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FBD91746A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 00:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C3E1C233DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 22:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1686E17FAA6;
	Tue, 25 Jun 2024 22:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mg532DEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D717FAA0;
	Tue, 25 Jun 2024 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719355890; cv=none; b=EIOAAoaL+v9NT89208SHE5JgJk4OiFFsYysWnZ40NG9yY7PTQxi1mVYkcA5DOtUwT2NOEzYIZTfja6PgCnbq1cqGX0SEZAJuii9T8lUnqE17UPUHfzkUA/PRJN8rax0GIEpIn/hT2acvovp2ksW2vzyh8yn1owSJ6wpBSgrlu6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719355890; c=relaxed/simple;
	bh=jmVxUGP2wgHlH5PGgGw/MkCtBLhGZ+aIfigrOSdtbbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/r8yeoJ0ACM0ww7HsfwMPxCsVFiDC0nEw6clZXt+maBgm2fC5g25pV3DbtzMM7/zZRWWONGcWpyzNQASKyJW0wPs3ik2WDzx+qv+jjTRmXPmQwwgZC7jPDe+VdXdOUQ4X+lH60CbHz2WtfsT5JajEb+p0YUs5PFxD5YZ+DAC1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mg532DEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115E8C4AF09;
	Tue, 25 Jun 2024 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719355889;
	bh=jmVxUGP2wgHlH5PGgGw/MkCtBLhGZ+aIfigrOSdtbbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mg532DEpIcDg24k1+ZRFtGIP14dLvDqfezYhlPBpCwOo/vYyJ6/+qh/utJzpDojON
	 +x6n0zqf55Wrt4hzU362RxbCZVI0O8fymXLbHsHoA2Tb4PmgQok6tFGExp7gSOuKcl
	 UoIBJoOazo6vMysvsMU0KylCDriqL+VDND8/T61UVa/YNBqJAQZMgBn1TLuyFuPGb6
	 Wn7xhD9Ezr+GZqTTw7ynPD4NC4HmAax/9PuzhduOh3gRyz6JF1/apKDenjYk6ExxEv
	 LIzRiyUqEb/vOpMCC5ggKsIHT7I7ccRq3f1bEGfzfs84/I7E9JOZNiDI/JPqKTCAbE
	 SGrvMOYhoyTZQ==
Date: Tue, 25 Jun 2024 16:51:27 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm/gmu: fix the schema being not
 applied
Message-ID: <20240625225127.GA361957-robh@kernel.org>
References: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>

On Sun, Jun 23, 2024 at 02:59:30PM +0200, Krzysztof Kozlowski wrote:
> dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for

That should be just since db9c05a08709 ("validator: Rework selecting 
schemas for validation") AKA the 6x speed up in v2024.04.

> given binding validation if the schema contains compatible list with
> pattern and a const fallback.  This leads to binding being a no-op - not
> being applied at all.  Issue should be fixed in the dtschema but for now
> add a work-around do the binding can be used against DTS validation.

The issue is we only look at the first compatible. I'm testing out a fix 
and will apply it tomorrow assuming no issues. With that, I don't think 
we should apply this patch.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/gmu.yaml         | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index b3837368a260..8d1b515f59ec 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -17,6 +17,18 @@ description: |
>    management and support to improve power efficiency and reduce the load on
>    the CPU.
>  
> +# dtschema does not select nodes based on pattern+const, so add custom select
> +# as a work-around:
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,adreno-gmu
> +          - qcom,adreno-gmu-wrapper
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      oneOf:
> -- 
> 2.43.0
> 

