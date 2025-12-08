Return-Path: <linux-arm-msm+bounces-84632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A25CAC3FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 07:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 56DB93004406
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 06:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A2D1E2606;
	Mon,  8 Dec 2025 06:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EN/KTtmz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEB26290;
	Mon,  8 Dec 2025 06:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765177145; cv=none; b=HbXJaHz48o01V3wo5gq49ov+lWf4D+uNYukt2/seG92N7MdmZTtAqtAtnJcmJ4Mgh3Wjb9nGzfrNbKIdHt2xCrA0BRbEOpCrPv4itDuckWi0gk4xcaEHZ0KEinfduWUVIsiuCiiJs1BrLwNukB+DgV6YNWFF4Oe+DM2I78PYbiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765177145; c=relaxed/simple;
	bh=EqTCNQc4QvTiyI9CW9lVd/JNW9HLwcKvOVV6Naa+Wq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbtWiYeoXthGthlhdU8DWWbtnS5ehRI5xeHkrAiHO/2NGv5o9M2AowjKHv5CqheNR/YhCXMSRWELBO/9QXJK82mmGb+wpMili10jPdERDk/W43wlgvff55OuXOgWWFPhzM9/zrZ8KIbtTSnrk/HYAyFBQM0pa5b9wGK3mmZtJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EN/KTtmz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D565DC116B1;
	Mon,  8 Dec 2025 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765177144;
	bh=EqTCNQc4QvTiyI9CW9lVd/JNW9HLwcKvOVV6Naa+Wq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EN/KTtmzxtMTe60SOavls8aSIW7edUsDgAI9W8gik9ATskUPQJ7kwlhyb5F1bSM5z
	 2ffaeP02RgVrtZO3q6LGMdQ++ukZUwwUbZhnm0BweT/dgEgHarpnMAmUY9idhVEDt6
	 keoeYwCKXj6+tdTIfK6hpEH2JEXAtQKP8vcvbwJOXeuRNIya3BQpU7qOcmoIzhWyYW
	 hPm+5EHFLPV2MsIx/LYDsicLPUf/4zTUd2a03NY2L8iD+Bn4XQW/0Kl059hunVf3v/
	 0E1iIo1SlLiv/WRmeYBl4dWlk2Wise7k8o0sQdQFkRgoDRfHB50m1NZmR67ibZOyA1
	 R+jdM1IWEe+dQ==
Date: Mon, 8 Dec 2025 07:59:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 01/10] dt-bindings: net: bluetooth: qualcomm: Fix WCN6855
 regulator names
Message-ID: <20251208-soft-beaver-of-justice-ae6fc4@quoll>
References: <20251205-topic-wcn6855_pmu_dtbdings-v1-0-165611f687c8@oss.qualcomm.com>
 <20251205-topic-wcn6855_pmu_dtbdings-v1-1-165611f687c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205-topic-wcn6855_pmu_dtbdings-v1-1-165611f687c8@oss.qualcomm.com>

On Fri, Dec 05, 2025 at 01:47:20PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
> for whatever reason.
> 
> The schematics footprint for this chip definitely says 7 on the input
> leg and the driver still expects 1p7. Bring it back.
> 
> Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

This will conflict with my series which (for whatever reason) are
waiting for 1.5 months now:
https://lore.kernel.org/all/20251029-dt-bindings-qcom-bluetooth-v2-9-dd8709501ea1@linaro.org/
(I wonder how many maintainers need to review them...)
... but I can rebase, no big deal.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


