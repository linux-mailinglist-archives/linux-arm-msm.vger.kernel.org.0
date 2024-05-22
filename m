Return-Path: <linux-arm-msm+bounces-20238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692F38CC375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 16:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948351C203AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 14:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C096C7489;
	Wed, 22 May 2024 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGDVyM7Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E05442F;
	Wed, 22 May 2024 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716389147; cv=none; b=q4ct4RjH3E5T+m954A0Wgh82O3Bk+g9LAhuxr1J/ftM5TqBjEMb16hyf0MS7ievU7ciGoPsJzyAdZq8Ec+XG+GZ4OLtg9zNKP8e9J84YDpCXrj2PuuF9oDM00VYihytrX0cn3HXBwArRsgbThJ1vXAch3qI/fo7FVYq+mHMcp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716389147; c=relaxed/simple;
	bh=zOLj0B1mXhNR7COAnE/xY+vZVUvYeUNisjjhU/v/78g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqD1Y+7uFfbspadmwbIK9/eLKiZMBQcg+7bKJpv/ZZLGZpsyPse7bDw20gTVOqeRWt+IJJyo2pT9186b+MJrc9/8bGk9/I/8TY/UbgitOJKyBA41yJHhv4yhGF1YrEAxyK+uM7lO3Z17iMCq0b9PArvwZPYA/GmBLRZJoNsnoDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGDVyM7Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D54C2BBFC;
	Wed, 22 May 2024 14:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716389147;
	bh=zOLj0B1mXhNR7COAnE/xY+vZVUvYeUNisjjhU/v/78g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dGDVyM7ZQxZ3mpqoZ0uhm34b69z0buP3Izb2n9ZgDU3+feXDZN7rWMsfogNl/ivGd
	 ZkOAdNJ/Kvsxhp2jbQUCeHEVB77MA58eAIqHjgwvaKK4vyI7Ub5LuB9dqnNCF+DhwE
	 ovMWw1bpVyslIl/cA9hcyo1AA2jOwzt0Wj56GpgScEy5KJd6iMVTMavHx4ezyLckJE
	 9uhsM39ri9aB9l3ro4ikqpIw+EkV+pduVJRl10bDw81LjIpB+4U/KexmhpSUUvniZV
	 wfhM3c1ds+Dye2DNIyECRmbiYEQss2mYZ8gRrj1w7Gf0mFdkXkKX/aRWtnI96dXBzJ
	 C4GWk6Z2ruZYw==
Date: Wed, 22 May 2024 09:45:45 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <20240522144545.GA3271320-robh@kernel.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>

On Mon, May 20, 2024 at 03:12:43PM +0300, Dmitry Baryshkov wrote:
> Command mode panels provide TE signal back to the DSI host to signal
> that the frame display has completed and update of the image will not
> cause tearing. Usually it is connected to the first GPIO with the
> mdp_vsync function, which is the default. In such case the property can
> be skipped.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 1fa28e976559..c1771c69b247 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -162,6 +162,21 @@ properties:
>                  items:
>                    enum: [ 0, 1, 2, 3 ]
>  
> +              qcom,te-source:
> +                $ref: /schemas/types.yaml#/definitions/string
> +                description:
> +                  Specifies the source of vsync signal from the panel used for
> +                  tearing elimination. The default is mdp_gpio0.

default: mdp_gpio0

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

