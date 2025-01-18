Return-Path: <linux-arm-msm+bounces-45474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 537A6A15D67
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 15:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA8C1887F7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 14:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5374418FDB1;
	Sat, 18 Jan 2025 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scEhG96P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA4C18BC20;
	Sat, 18 Jan 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211493; cv=none; b=MWnMqggyWBw2T5STubaH+UvwQmTA7be5salOR2k35dhCnfc/UYCcK3lsYpja0JONE/KM6pzRQHUzaNdtFOEyKlHlxXQKS28NRT3fwbUKBaroZdgsnlDfy0B33thpIKHnQkWek4dnqMnCBcShaPdJf5Z+CKOUycNGhQ/lqXzPikQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211493; c=relaxed/simple;
	bh=yzyYeRsnULL3tlm7okdtyouKJWANz7x87jxQKcldjnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYwQgb4zyCOt6hPKVjx3oAlH+Q3Aag+nfbTmUAFfAFCZ+WGBSNgjjoPI86UD+trMR3BT/pj+IcQ/JGEvFub0Lk4qD77vvESDYqKf86ihIjMD7L5D9fh97mLPkBC5x+7EECsWCJSR+ThPVBWmmyzoO/e6dZTCO+eFE1mzR86fCRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scEhG96P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04C0C4CED1;
	Sat, 18 Jan 2025 14:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737211492;
	bh=yzyYeRsnULL3tlm7okdtyouKJWANz7x87jxQKcldjnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scEhG96PAbqb49mM4Y/7uYqd2h3X5wx9lpS03Mw2SpwwZJPeiG9cDTIyK9BE/wU9g
	 WB7AznEvt4moVwwhcpqbXxCV7a8sGlpLc65OBKN1u2Wb0K01Z06AjLEInfn5TgywtB
	 Jwjo65AeQIqXA9CEEjEqDydchgMQi0G3KfGq+8c55d6R+wgduDyk6NA4qZRk6axbLk
	 TuPPgDe/s9G65CagDhOUbS37PVyZ7wmtji0B1H1eF+VLviAsYeG9j1R58RxGkN09LG
	 FERM5tRctvmm7hIMtPE65Ez45SF7vvwFFYBwiiLi3iYF8TKs2SFkvjRQTu0Q0H4WSG
	 X8wOBDFVyYdlQ==
Date: Sat, 18 Jan 2025 15:44:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document the SM8750 QMP UFS PHY
Message-ID: <20250118-uptight-crocodile-of-music-2becee@krzk-bin>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-1-b3774120eb8c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_ufs_master-v1-1-b3774120eb8c@quicinc.com>

On Mon, Jan 13, 2025 at 01:46:24PM -0800, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Document the QMP UFS PHY on the SM8750 Platform.

Pretty obvious commit msg, duplicating subject. Say something useful,
e.g. why this is not compatible with sm8650.

> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


