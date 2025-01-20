Return-Path: <linux-arm-msm+bounces-45548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A40F7A16756
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 08:29:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB557164FD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 07:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 716F518FC83;
	Mon, 20 Jan 2025 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIli/PuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173C18FDA9;
	Mon, 20 Jan 2025 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358173; cv=none; b=tMojOiOIqbq4ce0z+AQX9XzXHE9vWeBZetzNAejSshkH9kLCS7X7hxnBFM9Cl3wlzDYIWzCfq0WsyhLGdLqb1phZWTF1WhFyFoKiAP/qKj2qVm+wDmZUdem9AEbUNPlijtIqQlORu5ufiXdXJAUs3pg51Kiv0aIdSZFnDLo0GoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358173; c=relaxed/simple;
	bh=QYLdcOf2omnC+tqf+1HFeg9aqbpCJGX+M3S2jzNrCQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGg3l0cehNKx85XzwW137iA3vYeVCodi9IEHdKCM6FArXHfmzjrhJZi4SF2mWGm6pMJJAsiwNnssj/nS3+ipiXVCIGIOp8n07667m6nnM/f9UF+w7QIsQ5f9eYmpWxvvrwYDEb/TepiABpMViXDxBJ23ljZ40I7/Goyyr9o5d58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIli/PuD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E89CC4CEDD;
	Mon, 20 Jan 2025 07:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737358173;
	bh=QYLdcOf2omnC+tqf+1HFeg9aqbpCJGX+M3S2jzNrCQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EIli/PuDTXfGXU+5D8nizOFQsN2ScphpfdASkjSpaIFqViocpmuNsPJHUWRigCbYk
	 maREfl2cMtpzeTgRcBiKk2Ev7n/NPajVuqX/gNEO8AKMiU5DUXpT/aaM/Pa3M++EsG
	 bKoRcTOA7BxlgMhzN4YVK418RBwhU+egttzvV36sjkW04rYaVqd3UWjyVuiJeJ0w0s
	 hFCjDHo7Wsx554dhm7rHjOjarfidtKhr+FiYyrTVsZvHGXFhN3X78uQbTpV37misfw
	 e/cBrEFH0mKLAJveNQfYRQ2erwCZc5AlRwpunKPx7oJ20ccveuBXM1a3CuzQQsoqIW
	 ILMRlJexxGdug==
Date: Mon, 20 Jan 2025 08:29:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <20250120-economic-sawfly-of-agreement-541c8a@krzk-bin>
References: <20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com>
 <20250120-mdssdt_qcs8300-v4-3-1687e7842125@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120-mdssdt_qcs8300-v4-3-1687e7842125@quicinc.com>

On Mon, Jan 20, 2025 at 11:49:20AM +0800, Yongxing Mou wrote:
> Document the MDSS hardware found on the Qualcomm QCS8300 platform.
> QCS8300 use the same DPU hardware version as SA8775P, so we reuse it's
> driver. But QCS8300 only have one DP controller, and offset is same with
> sm8650, so dp controller reuse the sm8650's driver.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>  1 file changed, 244 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


