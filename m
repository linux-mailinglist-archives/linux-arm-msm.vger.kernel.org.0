Return-Path: <linux-arm-msm+bounces-44780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA95BA0A271
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 10:52:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52E841889248
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 09:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4192C18CBFE;
	Sat, 11 Jan 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQs5mjEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD918BB8E;
	Sat, 11 Jan 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736589123; cv=none; b=EQpIhD0krl+50IVqp3Fv3i/8bnuQlGO6NvnyTVmb9QVVCLlb7QZP4OHZpBJP0oicvde4R4vAQyOWmfc8NxzuuuMYV1J9b9mV2xfOuKTP3rlqDsdjLcE1HY5TY6m3JoiY67gyCMfqmlHFew/CH2T/1bLajTodxOpPSrCtbFlfY28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736589123; c=relaxed/simple;
	bh=tGKSfvWlIMipvHYav8xp3Z6hEOUagetMjdcm0V8O+Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5i9DUq5kS9sSDQnYyomSnYfUiRCl1fGLgAS9ANUF1h1AzUrc6ePyy2QW5V+oD+6sMCyLidppymisHD+rau+kQifD+x+3b1oQjLKcKrAZQNk3IUVdezAE+Dpi49jZaMrk9QrQcBBJUjvTNA0lY0BoqQ/7p14bWgU2QwqQYbOia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQs5mjEp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0000DC4CED2;
	Sat, 11 Jan 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736589122;
	bh=tGKSfvWlIMipvHYav8xp3Z6hEOUagetMjdcm0V8O+Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UQs5mjEp8Equ5Bd7h0U5rypvCHcqAs/Ebpq1AO+cjDI+t+Qpyzm0FE/+Xdb2B/Ynq
	 nO5rjSneN80Bv3aZy62sqRtD7CkHwssDEU5hwAanpRx3kzRBscTYQwQMZKfDY4Sd+6
	 BfbMXv3ol4R9XLac0Z6ykAMG6eqTtb9yEggC3lEiG6IChJqPGoCum9WwymJLez3Rza
	 oAHZOYsb/44azfABVET3KmYCJXGYTxAhUVkNDgABq0muWesODI/MkhYqmEy5TJf06P
	 e/cr/Um7MI9fIvGp2dVgPHwgdwPId/FgRdGvEaNzqx2x/oKwAKJzARp3GVPJhiWgBj
	 7kZBIV85x/mIg==
Date: Sat, 11 Jan 2025 10:51:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 2/4] dt-bindings: power: qcom,rpmpd: add Turbo L5
 corner
Message-ID: <pwfbagd4fxhjwu5h23ztrpoghhdu7ia372rmlgivmzkxm6hu2m@jfzefdzvjrif>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-2-009e812b7f2a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-x1e-speedbin-b4-v1-2-009e812b7f2a@quicinc.com>

On Thu, Jan 09, 2025 at 04:12:39AM +0530, Akhil P Oommen wrote:
> Update the RPMH level definitions to include TURBO_L5 corner.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


