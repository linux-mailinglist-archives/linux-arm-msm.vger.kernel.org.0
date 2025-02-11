Return-Path: <linux-arm-msm+bounces-47527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5BA30669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47E73A124E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 08:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386901F0E39;
	Tue, 11 Feb 2025 08:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gc320XyW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3FF1EE017;
	Tue, 11 Feb 2025 08:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264049; cv=none; b=iqcU6ivpjbFKuBc0KcKrECd9fGeYHUo0bAUC08zBtHhReHA04ywLguxT1qeHdfgsnNWeo2LeX5V4D3gVPf2zcQHxzd9UEmIopWk/x69a/rFNhTBLfz9mb8fLpKwobsmdlCz+Hn68MNc6l8ncUSM1JxhKNvfdo+D+7amjoxCnrIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264049; c=relaxed/simple;
	bh=+C6amrJDiC3M3krEsk9+H288OzeiweIZDJ5OeXrh2b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JOsU8CmW0nxG0jNzIg0axRnGMt0FgLkITsqiP5ucuIGl+GoiJX8KrLfe3PNBbyaYJaD38eEs6LP8WOWtwA42HUxTwe/XObj2qCxaUFfTx6KCYws6a5SqWVuB95/v1eMObafqN1WepPVUCx0yIEXBIwqyGjNQ+0S3sIvMRlg0Z6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gc320XyW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7398FC4CEDD;
	Tue, 11 Feb 2025 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739264048;
	bh=+C6amrJDiC3M3krEsk9+H288OzeiweIZDJ5OeXrh2b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gc320XyWw9k/uTNUhREzI2BFbx1rvPBJr/GylR3gGLm1XRHIY7QxuYt8nKH8wk9ud
	 Ez/kz9kYY47tPXAnt4fdrlSR2CpK7x4PXE6KX5396nbXeV8Ay/kHa+3f6qVf9X05be
	 zOw70qMIRoN2I4vdSDaOwFQJikYklGUovAMy61G4LjWD54vK70zCeC1IQFPuVZBH7q
	 Y3SbBtW5KwXJef/qTlbCnuQzeDhpf8plFBDLghTwO5yRBAEJWWFnDDat+h/BgePdz1
	 72cD2Fa5KzTwGpEyPBrtd3QqIAuK8UHgZ1svZBM0X+GwIdajA8px8ya+Kg6Q35VgKd
	 0U2Tu0cXSujXA==
Date: Tue, 11 Feb 2025 09:54:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: qcom,sm8550-mdss:
 explicitly document mdp0-mem and cpu-cfg interconnect paths
Message-ID: <20250211-fierce-prompt-heron-0bb46a@krzk-bin>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-1-54c96a9d2b7f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-1-54c96a9d2b7f@linaro.org>

On Mon, Feb 10, 2025 at 10:32:39AM +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 SoCs, and having maxItems=2
> makes the bindings not clear if mdp0-mem/mdp1-mem or mdp0-mem/cpu-cfg is
> required, so explicitly document the mdp0-mem/cpu-cfg interconnect and
> add the cpu-cfg path in the example.

Thanks, this also has the benefit of describing minItems explicitly.
Old code was dependant on dtschema interpretation.

> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml  | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


