Return-Path: <linux-arm-msm+bounces-78994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3BBC0F85D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 509503A97B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 17:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1D630F929;
	Mon, 27 Oct 2025 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sROLKMoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F143054E4;
	Mon, 27 Oct 2025 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761584532; cv=none; b=FoEZN+G0ZcharC2g/zawbf9eh0gfyxDPDxWbJyLcY6kvum+h8ii/zUHd2rDU2JVQLDdLeygZtqIwNcHoiM9Jsqth39gjaq5fLLafdBD2rEdx9ZfTLh+iTlPG6ZODjKxrrJFQ/ihqZZ0lQiRG+oQgzoSxNU+RwigSMGPvlctgNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761584532; c=relaxed/simple;
	bh=aH66x+qi6wkGS5vlWmcbx+X2SNlXqg5IctaXAlPdLV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTvrnpqmzvMXaATyhhScfZjkLVyYWUg77vfCTE99JqKqQEKgKqg9qpAZfraf3Ra3dnk0Y5uGAn5GC0KNyy0EcYVn56W1kG46RYQxbTmguRDYwAsJz6NBjIrtYDdn3+0SLtiZqtSCSE6MQU5g8w9DGuGVsl1ia44JzzGjIJ540Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sROLKMoC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F54EC4CEF1;
	Mon, 27 Oct 2025 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761584530;
	bh=aH66x+qi6wkGS5vlWmcbx+X2SNlXqg5IctaXAlPdLV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sROLKMoC+Cbth9uUgf8fowYWiC9iEhAnTvvWbcCBA35ZofYUNrFH/umMZ+XEsL74i
	 yz2dSHQ7rHFb7P8HwAvMpdwmq0AuJHLdmddOyC2cQy3TRJ8BNgtYHs+vMXFFUnPiul
	 UMJkDjOjmuMtTKIvNKAR82PKp2z6mzKeL/p5brB61B3+qI5Z+punIJQIoKIRm1QHms
	 6K21l7qbO2zwDmwKhLHh3DKCwRqzauqUH6sfOWTDxMiaZ7D+U/tuu8uUFv73i9I7LB
	 JFmK2fvPdGrA7Azj5MMKTqRhU4vOEIbCMd52eRd+BX687XqITCvDPxuMpNNjChv8pp
	 f9tbifVHBK9lw==
Date: Mon, 27 Oct 2025 12:05:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_mahap@quicinc.com, 
	konradybcio@kernel.org, mani@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org, 
	cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add edp ref clk for
 sa8775p
Message-ID: <wai7uqe6bn6kcfp3gmgqvc7sfrs37vmpqh6cucc7mopwf5x76j@vkxbwvqiqlyz>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
 <20251013104806.6599-2-quic_riteshk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-2-quic_riteshk@quicinc.com>

On Mon, Oct 13, 2025 at 04:18:04PM +0530, Ritesh Kumar wrote:
> Add edp reference clock for sa8775p edp phy.

Perhaps the eDP ref clock was missed in the initial contribution,
perhaps it wasn't supposed to be described at the time, perhaps the
hardware changed...we can only speculate on the purpose of this patch...

You could change this however, by following
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
and start your commit message with an explanation of the problem you're
trying to solve...

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>

Please start using your oss.qualcomm.com 

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..b0e4015596de 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -73,6 +73,7 @@ allOf:
>          compatible:
>            enum:
>              - qcom,x1e80100-dp-phy
> +            - qcom,sa8775p-edp-phy
>      then:
>        properties:
>          clocks:
> -- 
> 2.17.1
> 

