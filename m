Return-Path: <linux-arm-msm+bounces-82948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F7C7CDAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 12:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 46B1535941A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 11:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29ADA2FDC53;
	Sat, 22 Nov 2025 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf36F0ab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC2027FD5D;
	Sat, 22 Nov 2025 11:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763809349; cv=none; b=nyyrVKCYeLQfhhI6+DiCzfp5pYSwZlUPSh4ymJld5zGeAaciiRaWB76J01THLlzPnzMO9giPW733LCIv0qwCkzklgL7AUERGwrmElDcKTtveg0AmBr4HVgDqNrJmGRlBvxmOHjGtFNNdl5FNOY7LunGCs/ZY60RudqctErRFgfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763809349; c=relaxed/simple;
	bh=u3vNlreaF3sMxKexlEEHR5h7DRPdDWRk4D1WoCuLwwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g6fvEbJWbLhGIU0G1pvZjrumG5N1kpHX40ygNS492+pWiFGTLtMDsPMjsY6090EO0ZVKFNpb+QPBuZBY6586f55ebnXSQ7kFdrI1WApsg/11KOuLevJmxOfiuopCR5o2ZmyYcW2MaTwJ4Tq4hcEYIjZ+4dhOqMhTcQ3AM8o4+Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf36F0ab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7C8C4CEF5;
	Sat, 22 Nov 2025 11:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763809348;
	bh=u3vNlreaF3sMxKexlEEHR5h7DRPdDWRk4D1WoCuLwwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kf36F0ab6hEphz4Iab5i/4rvEVv9WrLWboPUQ1huSj1p1I6juSFIGs/K08ew8f+FD
	 QLgwXMxCUmrsHFFIdo9CTJ2LcBMQuBu14iMMnBQ/masfc3OTyzoaW1Lq0Q1Y0t+Nw8
	 Q7aMyYl22QWIUrPP8mtpXh2aWcBO1FUXgZx/MdFBdZ/0VAFG2wxKSeuIp0x754KMyM
	 4rSlXx15zXN97HH5Eesb230NS4HNJXaK6BceA/wHnJjSwuWkxXZfPmfj3D0E1nOkCC
	 0GMoe6U4WQC80fcFfYgoyyRASDGXuEebCjb26JpnDLrFeaRbuRyYJZDOVTbLqoT4CV
	 h9MYyQxa8LnoA==
Date: Sat, 22 Nov 2025 12:02:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: display/msm: gpu: Document A612 GPU
Message-ID: <20251122-savvy-camouflaged-chinchilla-f600ce@kuoka>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-2-9f4d4c87f51d@oss.qualcomm.com>

On Sat, Nov 22, 2025 at 03:22:16AM +0530, Akhil P Oommen wrote:
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,adreno-612.0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GPU Core clock
> +
> +        clock-names:
> +          items:
> +            - const: core
> +
> +      required:
> +        - clocks
> +        - clock-names
> +
>      else:

I am pretty sure you break not only intention/logic behindi this else,
but actually cause real warnings to appear.

The else was intentional, right? So the pattern further will not match
some of devices defined in if:. Now else is for different part, so only
612 out of these devices is excluded.

There is a reason we do not want ever else:if: in bindings. If it
appeared, sure, maybe there is some benefit of it, but it means you need
to be more careful now.

>        if:
>          properties:
> 
> -- 
> 2.51.0
> 

