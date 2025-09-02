Return-Path: <linux-arm-msm+bounces-71501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 91815B3F5AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 08:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 462CC4E3523
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 06:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36362E3AF5;
	Tue,  2 Sep 2025 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJYL3Zxq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC8202F93;
	Tue,  2 Sep 2025 06:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756795105; cv=none; b=m5ukhL8FBe3VEzLFk7O9rS17fC9wPoH7ICSDR9SOnwxbri9mr0Auqo3pLI03FFzEynux3SZaAMjkbo2NfrTJ0I3AXwh+4YX9RpIR8T9xRfTgG++SLsSnuBmnyOMvsnwjjPB4FOumlwPAUF8sGrYL7IojCIn+su4aGZ3dJo8+pZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756795105; c=relaxed/simple;
	bh=y+KwSI21zIY/J9GHDXq5VKNRciMqhOzsq5iKLOeZwE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCwyJhNz8dlxhowVoI/Tryhasb393CCiD7UsqebyVxcWb2YdiJJczGoxa2nYdTdQlcNyFftlQTMwvsFjQYhfRjW8/pQXJo5B/Wy3I0tXemWrECTgqysFLrt+sgdGYGeHhyG9fL6riIs9WuRPtDCzyAkUiegna58bV7h/z4UdnDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJYL3Zxq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B14CC4CEED;
	Tue,  2 Sep 2025 06:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756795105;
	bh=y+KwSI21zIY/J9GHDXq5VKNRciMqhOzsq5iKLOeZwE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJYL3ZxqIlgu8oiq4zv/Z3l+Z6ZlSDoILhccVWVAK7W0ZudUYz0lGxgvjjoCKfHNg
	 Tcah2MvFYbZ4MLAbA4Q+E/LHk5lJAh3H8TW97irv8Dk5uy5M8XOD+qXPPZwIws1V2t
	 u0JGMDE2uf6XyLWcFAwOuCkQ5q4b1pj+a6hZ4Jv492D15pW4cY7MTSm1ipYGpggfV/
	 54eo0apGUdT5vUVVY/HCDX5nLGoASO32IhqQWi4rOjaVMW2PejGEj1/+vvveaxPgtJ
	 twNpA5RP9UI/hqBgyMZWNPaRQ6aq1/bJykc59SoYo03zVyypAJk/3oJ93T6+23hc4X
	 hLsm746sqY2PQ==
Date: Tue, 2 Sep 2025 08:38:22 +0200
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
Subject: Re: [PATCH v10 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <20250902-speedy-overjoyed-dove-edf2ee@kuoka>
References: <20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com>
 <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250901-qcs8300_mdss-v10-2-87cab7e48479@oss.qualcomm.com>

On Mon, Sep 01, 2025 at 05:57:30PM +0800, Yongxing Mou wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              # QCS8300 only has one DP controller that supports 4
> +              # streams MST.
> +              - qcom,qcs8300-dp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +        clocks:
> +          minItems: 8
> +          maxItems: 8

Clocks have only five items, reg has 5. At least in my next from few
days ago.

Nothing explains any patchset dependencies, so this makes reviewing more
difficult than it should be.

Best regards,
Krzysztof


