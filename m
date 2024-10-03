Return-Path: <linux-arm-msm+bounces-32994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2D98EACC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 09:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9522F1C21A51
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00D981AB6;
	Thu,  3 Oct 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCnGOKWI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3639823DF;
	Thu,  3 Oct 2024 07:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727941909; cv=none; b=GvHC2J5xjl98Og82z0ZZx9mC4T1wQDUFHGHbSMvtAZFvpOdzpmIJPdVVsIhKp1uCx1K5GfoZIsZaNaGQiNfLNCk8O5J3wabGjlePjxLMarL/b4CMLKzrZs6hyUPU7ChuuAIxc9Wgrw9yVGaXYe7SfQKTqPCgNuSpiFKP47qCp2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727941909; c=relaxed/simple;
	bh=h3gDerIqhEHrLd9A8maFTkUycSICkmGIMj11lwfndDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbRluAposKJxO48SMdgUr+6TYvDMBhn10w7TOyyviP59dZZ7RWoW5uVS/7JWtWDao1sUex93WI0f/1R5mMO6sB5n3465Oa/gqzAkRPq212mieNF8Ha2saS7J79keD+upPSwtQjpMHyk9onlX82iT3Yfiw5xpR00pCPa7+YCl4YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCnGOKWI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B68C4CEC7;
	Thu,  3 Oct 2024 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727941909;
	bh=h3gDerIqhEHrLd9A8maFTkUycSICkmGIMj11lwfndDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCnGOKWIhyeBlaysqqlEXbeYeNYHqolt7U01wdMU50/8k/6WVlAoA8rYR/s0N+Q0V
	 iL/xS8iEDiFoAshH56/aOuCIyD3oPgrpMLHZpjYN1hnLhClorm392459I/fVT+SzcJ
	 IkYIDuPtqg8jXYTvN2IkDuoXjSAygiTojn6ZvIbzk5N4ymKwdh5VzYOcUjfvOWwN2b
	 brY3CLEvnJQjLV0RiPoOswxFaR/T8GY+4kf0DlwiLZdpxevP6OCIpVa3xAYMFfENxC
	 O7G1BD8HHcRB2+5KiRUddFuQ1T7iVNoruXJ0nS7qF4tBFs684rXnZ7Gw9DJp6bfgwv
	 iGDrPiIfb+J6A==
Date: Thu, 3 Oct 2024 09:51:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Message-ID: <wgvg77uag5hmnr6ld2l6bdsl2ebzyuchziafd6merfqtma73jx@kou2ntscsku3>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>

On Tue, Oct 01, 2024 at 12:11:36PM +0530, Mahadevan wrote:
> Document the MDSS hardware found on the Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 241 +++++++++++++++++++++
>  1 file changed, 241 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


