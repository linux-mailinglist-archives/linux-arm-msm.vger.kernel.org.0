Return-Path: <linux-arm-msm+bounces-50979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA94A5C856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C05CC1887E51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 15:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9879225F782;
	Tue, 11 Mar 2025 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWZosL2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BED0255E37;
	Tue, 11 Mar 2025 15:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741707489; cv=none; b=LOt//dlhjOsy5L6FUbK3pkx4jdNzAkgX4RKjwAwQ0vdpUcvQAHTDP69k0td/4KSCoiMpl9cirA0L5E8xpbQIYTvmTRfrwLsfE3UVesPhxloDHW2TBhdJfY0fLDsfC0xqt41nzYvH1iYon+LJ0ypVH/aHDRGy2vTmcTGrb0bdEgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741707489; c=relaxed/simple;
	bh=PB9Mq++jsTAKdO+JKImimMFczZMMG9L2eYVvqsqLF1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+5oqpPMJk18QjOnsVtkcxojSspQ3LZADbl32i18IWGsDHf0iSFMOzUbPrSXIjIjX9SpDOP1VLnHVbwlQaDo8FFO62Sh8qj+RAFA9I5vroL1VXHJGdu0P2dTYS2H2FV8HwKkAlUJhYOQpCOKsNdmcvpaTz9XDl9qIQR4a9dKQss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWZosL2g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4B3C4CEF2;
	Tue, 11 Mar 2025 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741707489;
	bh=PB9Mq++jsTAKdO+JKImimMFczZMMG9L2eYVvqsqLF1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWZosL2gqQoJj0wJFIRePLznic6yfmw+osPKfGWLt31F4uIFVAKUg1bTRtWXPuJ1r
	 /8jfYw1pQ0GDxbQV1GPkt+58Z1OuR5OZURdm8RxRU1pjsV/6jSzQKTJ0cw7G7IAhz5
	 C6eEipxFW3qUPYB7sloyt5KLyeN9ArotueVvxyqq177lH8w6M9Ik+zTq1JsIhfWHl6
	 UEy+hcQTJcZkAvIRFnBARPD7g4MyxIAOYTnTJ8sNGJJCDOJxBZ8p93w2+PmkeT70pA
	 +izv0B4cy3hivlCLtLMXYV7IcdLhc1i9i15cFWKXOjZ36A/HUENO6FlnrPjAaqNcHv
	 2xINha2JgN8Jw==
Date: Tue, 11 Mar 2025 17:38:01 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
	marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 05/10] drm/msm/dsi: add DSI support for SA8775P
Message-ID: <hcfii7m4vevawchf2wzgzidgdimpsv2fpwvamj7f42vm4gzqpu@6irgcvfc3q7i>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-6-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-6-quic_amakhija@quicinc.com>

On Tue, Mar 11, 2025 at 05:54:40PM +0530, Ayushi Makhija wrote:
> Add DSI Controller v2.5.1 support for SA8775P SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 18 ++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>  2 files changed, 19 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry

