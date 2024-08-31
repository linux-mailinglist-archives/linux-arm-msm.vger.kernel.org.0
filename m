Return-Path: <linux-arm-msm+bounces-30334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3190966F10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 05:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92163284EC4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Aug 2024 03:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB7715218A;
	Sat, 31 Aug 2024 03:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbwwhjMz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331615099B;
	Sat, 31 Aug 2024 03:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725074342; cv=none; b=a6jCOJSlpz8+YPmLl/gA38NJ1kA090iApQi2n/4NYkhJ5wD1VF5qfw/cAfOuGZlJCj+QoU91SMmOFgwUCqiJKzYJjAsMPwxbJd9oihVrviKZMzBbHHiVmg3WXZ1lfU1St6gKbSDfQWmU6toTiRlTh2keYsJXBBT1zS53VTw5T1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725074342; c=relaxed/simple;
	bh=5kqkv/ugR787P9kdnCA7zm68moBGkdjT1thqiI5O07Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hauDE1chV4QuP4Fw9C6FWRkhsf3n1K0+vYuA/2fB40y7F/aMv7z33Q4rc41bw6jOyQe2a0/bUSccBfC73okSRVUMkZnhRfwx9bZW4Y7Y4sj1RZm8rnuRFt1gA3oW5YagbuUjASVePtSXRDhbPygChlFMNP7rwghq8nzbFOvwxpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbwwhjMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F2AC4CECB;
	Sat, 31 Aug 2024 03:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725074342;
	bh=5kqkv/ugR787P9kdnCA7zm68moBGkdjT1thqiI5O07Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbwwhjMzdaj2wBwQ2aHAE7gYG9bIaRazlgb0ME8nXAu0eZDM6ex0TRVw6ccHupSAR
	 TUWVw4rAP3KHlP6BgWjWQzD4wzSaMg5wq45YpY/jgEneSWHLGniaJiWGcS7pc7qI2x
	 WdfnmnU1+/UZyHQfGYihmpW1J3f5wEbELapFjhCtEzV9UKjiEpkTajdFLUqWx4eFLI
	 ycF6ITDzKD1zxTYPsG+n8DVKcgjW72dsfKUKRjiKFH1eTask3fhGg9+MHq4y+L2qu2
	 /H8SG0i/W4g1cIJ2M9ouKJ4vHgDa7o0vemYjwHI5jZeeD8Sd3FjqBmMKXnfxQF918S
	 T8KHbUcZrM8WQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/5] X1E Surface Laptop 7 support
Date: Fri, 30 Aug 2024 22:18:40 -0500
Message-ID: <172507431829.12792.8251923480882156974.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
References: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 Aug 2024 16:37:49 +0200, Konrad Dybcio wrote:
> This series brings support for X Elite-based Surface Laptop 7 devices.
> 
> See patch 4 for a more detailed status explanation
> 
> 

Applied, thanks!

[1/5] dt-bindings: arm: qcom: Add Surface Laptop 7 devices
      commit: 2538d0689cfe0a3c45c1fbed54d14cd56df8781c
[3/5] arm64: dts: qcom: x1e80100-pmics: Add PMC8380C PWM
      commit: 02a1bfb34ca8607fc0ed5b5155fd81b7574e931e
[4/5] arm64: dts: qcom: x1e80100: Add UART2
      commit: ecbdce2041ee09cb3a046fd2b7d000fa5e333773
[5/5] arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices
      commit: 09d77be56093b9fc7daa14c9c745e77ae3a56492

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

