Return-Path: <linux-arm-msm+bounces-33063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C998FABE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 01:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292B71C21659
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 23:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CE461CF5C0;
	Thu,  3 Oct 2024 23:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiOkC1zb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F26C1CB308;
	Thu,  3 Oct 2024 23:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727998979; cv=none; b=OhUMj9L3EjFiPEJC6wOo3XIVhkbgZG4vSUvc0LbhJKcDejIbowQa2RBW2TfSU0fsoDqTTMzlmNsP5yE6zggI7687WUeT37EzscYy2zCOELv1sE8V5MtK4VTsgKD1wkuOZCfU2ndGnJ3b0uF4mnfyLHHjGpCPVrLuoc3nBWelemo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727998979; c=relaxed/simple;
	bh=M/19+YjrbzMQNuvvKNV9vc0WcA3QjMBGJW1OYQ/eqkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSaJ2PqKJVz3niFmN4Ay1tOGImcmit2kX98q5kE93PSAmFmEb7xsDf+oinGZ5UBFH6Ab5vHUwQ/zdKvvp7d3AQZ72sX93ahfL4O1g6GmRJc7M5tveBDmYjdSB/Yq4AoNv9piCGzwJ9BcDyaHifHrgxc9BtvnQnfWcmjQlpFeA5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiOkC1zb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6013C4CEC5;
	Thu,  3 Oct 2024 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727998979;
	bh=M/19+YjrbzMQNuvvKNV9vc0WcA3QjMBGJW1OYQ/eqkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZiOkC1zb3gbrPSUlUg1SbdXA4vCWKviRLtPuFy87GghYvn+oM8eMkKTnN2fWJ9smb
	 hR2ZhF+tWUSo8cByTeubsFAYGvKZvMQReb/GP3GnauYGuUbrfCV4Qng6JM7Wscucuf
	 3tnJka1PqHwTgx8ZR/aI00CiRkQ2MUj9onnDXfJykjmeZMOK385jBBKo4ZY0mSekvN
	 TVoZ/3e45AlDdLxn8oQgGld2RFQyM/VNh758xbX8kIZCX1+CU4VQAx+X9t6BotuO+d
	 5YogddsTPhkfmS9k6Xh05IUdY7/tZVDSAhEKfzpQMjs82wF0UKkRoCz31TN86x/x6q
	 TLKyCy12zYKVw==
Date: Thu, 3 Oct 2024 18:42:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	freedreno@lists.freedesktop.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH 4/5] dt-bindings: display/msm: merge SM8450 DPU into
 SC7280
Message-ID: <172799892217.1842244.9103312532953204323.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-4-91ab08fc76a2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-4-91ab08fc76a2@linaro.org>


On Thu, 03 Oct 2024 10:14:21 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SM8450, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   2 +
>  .../bindings/display/msm/qcom,sm8450-dpu.yaml      | 139 ---------------------
>  2 files changed, 2 insertions(+), 139 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


