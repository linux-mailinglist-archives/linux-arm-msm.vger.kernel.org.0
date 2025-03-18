Return-Path: <linux-arm-msm+bounces-51687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9768BA66CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC25F3B7290
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEEB1F872B;
	Tue, 18 Mar 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyTu0yHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BF1F180C;
	Tue, 18 Mar 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284609; cv=none; b=s+ckkdFLjD3iH+WPSzOGpDq0R0vfsbiZvqDi0SpZB2qdL0pl+NhacGTf8oPxpUopa4PN9I0ZQOVio44JXn8sAoB0BHu8o9+w82q3Ly4Sez2QrcMKYaKdjLbbz6AAZbnLxzux8nV/1FlTpNqNC61MifvbdfAGByFeyNthJN2FA5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284609; c=relaxed/simple;
	bh=PYexzvxuekgqLHatZlFwTRRdX07yMrz0UyQigczwDJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtTw5USrLPJQwQOxexGrN1/udgimLICQ93JzFEPA6n4UeBsFBbQIs59fjxlJFlVWZnAmMF8i9b2PDyR+h2dEbKgycUdB8dpXwHDHS6j33nlrtsVSDRbneFY8xCw7ZeT1PWFgC0cbVAOT7swfVJkoIAMHt3vIarbs3ZMyVJULEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyTu0yHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D20C4CEDD;
	Tue, 18 Mar 2025 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284609;
	bh=PYexzvxuekgqLHatZlFwTRRdX07yMrz0UyQigczwDJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyTu0yHpjLaLbKHHy1oBYw211KKL360J3Zo8yI7ETyJaJBKbn+Vs1enJVqm2EYwMh
	 NbRu3/jX1Neqtgl+/2MSX/yl/jcqAPI6bXks684f9G2NCQJKW3gyQYi02deDaLuNcE
	 N6dzclk1qoT0eo0efN1Qeo+MqlmCGGPQZpQpHI/ujmfBwF3IKWGLKZf/n70JiCAXzd
	 DmgEiR22g6ai2EC4hjqxudQR+SrcMyzQhxdZXJO4CGLuqkhyRpZJH0IxanUVe3P1rA
	 NSmerndGOAvd2/KJVD+SDW2e0VGHcVLn9nFPSf4NuOm5WyDncQKkaPCT90toW4pjQ7
	 06FIxy+InJqVw==
Date: Tue, 18 Mar 2025 08:56:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>, 
	Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
	Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: soc: qcom: add Smart Peripheral System
 Interrupt Controller
Message-ID: <20250318-dandelion-aardwolf-of-radiance-695fd9@krzk-bin>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-fix-nexus-4-v1-3-655c52e2ad97@oss.qualcomm.com>

On Mon, Mar 17, 2025 at 07:44:38PM +0200, Dmitry Baryshkov wrote:
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sps-sic.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,sps-sic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Smart Peripheral System Interrupt Controller

Interrupt controller should have interrupt-cells. Or this is not
interrupt controller...

Anyway same comments as for previous patch.

Best regards,
Krzysztof


