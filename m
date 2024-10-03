Return-Path: <linux-arm-msm+bounces-33065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC798FAF4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 01:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 885CE28394A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 097CE1D0BA8;
	Thu,  3 Oct 2024 23:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlGzvtsk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16021CB308;
	Thu,  3 Oct 2024 23:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727999066; cv=none; b=iS+SsEwgP1du/Tqzw6WzjuWohV+fTSUUKsPlR7KACAOojiacrkRYks4S1BeeieDCAKMgQhvaN6uW+4asr06Uhxmk7TonBqE312ru1YUfeGdvraWD00IW70FBRfux5VcKrXUHedc373gzSHOF616/u8OtXRzihrMR2mJ6gDbIuUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727999066; c=relaxed/simple;
	bh=44T/LQEyEbWv3qViR62MlA1E48CLDHvz2GFtXMPk8pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+jsROZvDW0olLrUC9xSZ2Q0kvy0Jq2NIdJGuxj9MPYCMIjmXQHcdCL0jhMMrsMKuSeg9NOWsGdU1EX12o8TvhVYdI8srVvDPZr3idW1LfsBTuo/oJFapt25W172EPBMx/eNGfaal9NKsSNgKSySlZf7ni14U5MqxvcnYHDMqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlGzvtsk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4104BC4CEC5;
	Thu,  3 Oct 2024 23:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727999066;
	bh=44T/LQEyEbWv3qViR62MlA1E48CLDHvz2GFtXMPk8pI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BlGzvtskwYe/TRcheoHYxtJf6VDx935IjLJ19L02PqvMnFMx8vSMyP2jBTUJnX7zs
	 pbgeUlDPHCOKP1Z4PLdqsK66XNJlyb5pjhFg0ZBc0DjT9Kuvq8h1WAWUZBT+GhE9gN
	 N0iSozSIwVmL9f28X+BKR9tA+TR3dhtemcjtmNEN2ZXX2eJF9LBA0Ebk1smHhozATC
	 BrvEObBgGAto91I/Rttqq+n3Od9DfLUd+AYd1tcwxMiwgj+6Ey+CmjWkWLyi3pvCHw
	 JOj74WqfrjbyrrJhhJvLrw+MKHlRNHQE92Yc2nh+22LMayVZIv2HVOg+WblBotv9WW
	 xxWxla7xaHzow==
Date: Thu, 3 Oct 2024 18:44:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>
Subject: Re: [PATCH 5/5] dt-bindings: display/msm: merge SM8550 DPU into
 SC7280
Message-ID: <172799906304.1865895.9301789206572739030.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-5-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-5-91ab08fc76a2@linaro.org>


On Thu, 03 Oct 2024 10:14:22 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SM8550, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
>  .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 133 ---------------------
>  2 files changed, 2 insertions(+), 133 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


