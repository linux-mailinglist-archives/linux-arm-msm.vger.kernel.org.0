Return-Path: <linux-arm-msm+bounces-44971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36191A10155
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 08:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 645AA1886809
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 07:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F97243356;
	Tue, 14 Jan 2025 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMcW0/5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1A2237A2E;
	Tue, 14 Jan 2025 07:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736840076; cv=none; b=F+HQnVco/doymVTS3qV8IfJKLBqypK95MTmpB7WMhNPIgpJzJZBENaRfCu6bYaP8eO/e+DqRM6JGoM9tD5onP3y0w4lz7qiteAg0/gdiPVzbPybynlWUon9ca6eHNibNIUWVldqQLpYnTmbrDxwvHTE98bki++nhL78p3IEbS0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736840076; c=relaxed/simple;
	bh=YxrBUkBOC0+g4ghiLAUJPBhAPUwiWqR+8mCY9TKXTTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pwvy2dy/HqTm1ZW1ao1+aprbpaBK7mhIEhc1C+zxo2Klx0L5MO+xHrxw0iekwZIwNqROP0TKG7y5NZRyuPm9bEh+utAYGZTu+eYDdJLC99wNs+Xo43Z44rFVb5v9xvtXm72WHLCc9DQT4Y++CJloyw9E2+yJlLZh0NizaqvxZ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMcW0/5o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B318C4CEDD;
	Tue, 14 Jan 2025 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736840076;
	bh=YxrBUkBOC0+g4ghiLAUJPBhAPUwiWqR+8mCY9TKXTTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FMcW0/5owhNZEv7H6DT1smEvLGinXH+sRSZKsOvw7cqf6WeJJrCYbZI/QlDJ6tgKM
	 AFXxbSMo9K/PXcrfuO9w9h2YV2tSl+zwYbPuU21FltWOhm+OoQ+t2ETkKX8r0OniMW
	 yxPjF42av37lI333//E4cpgDkecvAlmNnTLfsqHj5rKHfyJUabJ2Ept2YuL0ZExO6r
	 VoWDHxHMsXJwVv32cK/NzPUqqCuPRbE9aBg3IIN8m/M+xSc+LUe3SsD3s4LgSM+Hwg
	 wak944NxtCrRU8pehD+Qoa1D8z7EL0S7tSgeE86Sk2D1OTZTkAfe2ZLnSGStjVIEdW
	 +w3IiDdmFm2WQ==
Date: Tue, 14 Jan 2025 08:34:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/7] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
Message-ID: <nrl67b3qrtib4v6bcgpdhomsihphkpkxtnmuwdrdfm26opbdwc@7urmkziycwqt>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
 <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_usb_master-v1-3-09afe1dc2524@quicinc.com>

On Mon, Jan 13, 2025 at 01:52:09PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
> to utilize the DWC3 QCOM and DWC3 core framework.

We see that from the diff. Say something which we do not see, e.g.
differences, why is it not compatible with older variant or why
interrupts are not fixed.

This comment applies to all the commits here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


