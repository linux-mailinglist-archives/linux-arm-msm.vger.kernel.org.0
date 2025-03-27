Return-Path: <linux-arm-msm+bounces-52592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E81A72B41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5AC81746A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5EA620469B;
	Thu, 27 Mar 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7/NNwFk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFF2045AC;
	Thu, 27 Mar 2025 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743063507; cv=none; b=WaysRs1VKXnYNia9uL4p28GLtv6n6b5nxFVQDR40gut7s+bOq0HobXa0FYV2UWrQO53LDIvPlVM9TTK7vVkSwilqi+N/Q7FAMmVI8LwHjPxiIV6IRAL/Ff5796bs4Hs/ezUFEZh5c+VxnJAFksNgZADiY1EGnMW1Jn+Xj3z0leQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743063507; c=relaxed/simple;
	bh=jAZ1aKuhdSPivDH8Se4rgDcAqAGbxcmhAiCOummgWF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfE5lmP8QOF5UMoZJNT3EYkhgxCVC7KY96ibuZ95dFKdFjF6dYUq9zjtaHX7MBu29H0PTG24GfLz0ovaE39r8iAMbkWPjrDArxH1Q9AoEtz03bA+BX7pedwRYlLAZ4zup4+TLrAMTtFk5priwza8095Eey424sSLeL5dnvgdVqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7/NNwFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D72FC4CEDD;
	Thu, 27 Mar 2025 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743063507;
	bh=jAZ1aKuhdSPivDH8Se4rgDcAqAGbxcmhAiCOummgWF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7/NNwFk+7OT5vU/PYfWPBuoLXygjli9p5Bl8O/9+RFzdRsfdqosm5h5t4ecxubqG
	 tID34AUl1elZh8H43WnUFb2QSZJJrtDIPxgi+KEzwaYXFD4BW6i+mGt4WeLUvv2SBu
	 SJbN5nS0DZp2ah3y7bOVWPxNzsHuJC7KRtIOzfX8o6AU7CENuNItF4F7Etw08lOg7V
	 aAYVkK0UzuhvJsBrKk0z2XMY3DmV1uPhOiLAuB5NY08tHs+G0Lv5fVqZGG6tD4EKpu
	 izUfiKe2qgC8qKUO7Yp4/hAHdbe+kC30gL6RmRYVrrzIydAtYu+8aQKzUV3IuHXQIk
	 OhCiQhbqN28Mg==
Date: Thu, 27 Mar 2025 09:18:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Marc Gonzalez <mgonzalez@freebox.fr>, 
	Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>, 
	Sayali Lokhande <quic_sayalil@quicinc.com>, Xin Liu <quic_liuxin@quicinc.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: qcom,rpmh-rsc: Limit
 power-domains requirement
Message-ID: <20250327-noisy-dogfish-of-advertising-69bb05@krzk-bin>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-1-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-1-b763d958545f@oss.qualcomm.com>

On Thu, Mar 27, 2025 at 02:47:03AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Certain platforms (such as Chrome SDM845 and SC7180 with a TF-A running
> as secure firmware) do not have a OSI-mode capable PSCI implementation.
> 
> That in turn means the PSCI-associated power domain which represents the
> system's power state can't provide enough feedback to the RSC device.
> 
> Don't require power-domains on platforms where this may be the case.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/soc/qcom/qcom,rpmh-rsc.yaml           | 24 ++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


