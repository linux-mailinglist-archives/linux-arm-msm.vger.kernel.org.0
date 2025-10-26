Return-Path: <linux-arm-msm+bounces-78832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F919C0B5FE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 23:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A39E4E4733
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Oct 2025 22:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B956271476;
	Sun, 26 Oct 2025 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuQiCFa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB42248F59;
	Sun, 26 Oct 2025 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761518052; cv=none; b=p2wbsc7T9jBUjv3HVXQ33XPLy+h3i6Qn9XsmOicJCFg7NXSgvuPZzGgs4f5mFr1DgyqOJCo2jDLRPWE00uvuYZ4wEbwDy3j/wgWlMGBNuCGs90D0JLgh7HAuY3cXCbuFnridCHV9OcraaJf1Sjzd+tja7BQETyuva9fhZZWt2VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761518052; c=relaxed/simple;
	bh=LBZTOeQzkwEAtB+OTRZAwa0RyutEcg+dNryHY4Ipwrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI7djF0VWBMRZzTl63CdmtwnS5WM33x6qHo7gNhqpn3Uv+OYjtK1suuQonYbNYxHftHhYBY8/kDkMZ5/cD9mdyy2f8lyofOFyxsgrJ/8JgAYfBGZDkHDkipLu5xutT9uATCx1o/HysLvYPDo2+GEv05D+6m+nz2pj3OytLSfK8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuQiCFa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91A3C4CEE7;
	Sun, 26 Oct 2025 22:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761518051;
	bh=LBZTOeQzkwEAtB+OTRZAwa0RyutEcg+dNryHY4Ipwrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuQiCFa2Uh2PcSTOLJ1L5PL7m+mmvkGcjhcRwlEoojfKCnshek1AmFwxaVoHqv6tC
	 ru4L8as1G665sHXfJGfaKIwfEPC0RiUjENx6zLqcNisrKngEy38XkLA0TzgyE7GkQR
	 W1qr3Z/vdHJlYgulKiAIztztW2Rp/Tig/sEbfqof03g+Qy7H8UmOjOdOWRiM8J7mtA
	 noe1PzrjhwSCi32T+qPgtr/3+Q8E1yG+pppjv8clBq0lQRILKZ2i47M305MBEnjiXQ
	 r6j72mgW+Ev5hZwNmcY7WaXh6705A0UMhD+Ake4Cq/XFAip5aiVVnE7lVl/vUerK9p
	 8VHzzg9DWXm4A==
Date: Sun, 26 Oct 2025 17:34:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, simona@ffwll.ch, airlied@gmail.com,
	quic_khsieh@quicinc.com, lumag@kernel.org,
	marijn.suijten@somainline.org, aiqun.yu@oss.qualcomm.com,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, quic_mkrishn@quicinc.com,
	neil.armstrong@linaro.org, jonathan@marek.ca,
	robin.clark@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
	abhinav.kumar@linux.dev, freedreno@lists.freedesktop.org,
	yongxing.mou@oss.qualcomm.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
	mripard@kernel.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add
 Kaanapali
Message-ID: <176151804747.3053476.10366376472665121341.robh@kernel.org>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>


On Thu, 23 Oct 2025 16:06:06 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
> DPU and SM8750 have significant differences, including additions
> and removals of registers, as well as changes in register addresses.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


