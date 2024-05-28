Return-Path: <linux-arm-msm+bounces-20779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA88D1E39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72AA3285DF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78FD316F8F1;
	Tue, 28 May 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/mLH8Uv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5B616F8E7;
	Tue, 28 May 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716905622; cv=none; b=r7R2IRE+rrvZFe9myZIUPMOijf3MokUyTS3jeIVxE2AyafcYBhN+pxTsJ4vyCfKJrEFyLvM9Yw+MdgCHdReXbCfYswbfYZwXAs4O5Qbn92m0zALbd4VHWdR3KnCRNhNlIitVCzXphT/WiVNGQk5pLMxRnTXDvVSlkY3LNeRkLnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716905622; c=relaxed/simple;
	bh=q3OS1zhUhFTVBXyzbvdGWgxbiiW070IglW+y4dWYsS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b2jBQC5ijcPlQYIYxy8Bd8DWe1rZqwPOb/LF0AFaWxKY9+ZuOPx80wLobjkLoZeolWoftZHxaHte2jk6sl+s6Ue7AvLHopX26lS4qBToWDvwOgFI+HTbwRhG7+2Dag/4tYoOmeu8recw1B3m/v61HRKf+JgZtE6duwZYTDuNMY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/mLH8Uv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61738C4AF0A;
	Tue, 28 May 2024 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716905621;
	bh=q3OS1zhUhFTVBXyzbvdGWgxbiiW070IglW+y4dWYsS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/mLH8UvuI2UIM1KwptIPPbL0GtiDcHegij+Sua45dG/ZgRp7IVXURysBUxvdPxRZ
	 QF6ixzUeBr5b7gLGi6Y02kT5MZ7KuawjENmoFDOLdb1ildBQqpswkDQH/V7Jkyet9k
	 ohVw1jicor3dCTEMG8EpvDk6Em6opqmaX+OfVhUq9gB/rZEuyNhLfX0/PtM8SANM6Q
	 AbwKJzmiBCCtgbZCtuiCg9y4wWEOpS5iSDUB25cKElDPQ6c7m9msfu4PMWv+jZ7YaM
	 VUnF7ljFBKLvkEsPIJMSQ4R7CvQae3MRNfk6sLtf2+2n8Y38gPT+m5RJbNo/5djhWH
	 bQ9lLmVn7C6Yg==
From: Bjorn Andersson <andersson@kernel.org>
To: konrad.dybcio@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND2 v5 0/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS
Date: Tue, 28 May 2024 09:13:36 -0500
Message-ID: <171690561219.535711.5025638361687702520.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527053826.294526-1-sumit.garg@linaro.org>
References: <20240527053826.294526-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 May 2024 11:08:23 +0530, Sumit Garg wrote:
> Add Schneider Electric HMIBSC board DTS. The HMIBSC board is an IIoT Edge
> Box Core board based on the Qualcomm APQ8016E SoC. For more information
> refer to the product page [1].
> 
> One of the major difference from db410c is serial port where HMIBSC board
> uses UART1 as the debug console with a default RS232 mode (UART1 mode mux
> configured via gpio99 and gpio100).
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Schneider Electric
      commit: 1fabbb0888c3d74366133de848228a899477aa34
[2/3] dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
      commit: 6cf67a2b51edfcef998b545f8aec18b9e8cefc80
[3/3] arm64: dts: qcom: apq8016: Add Schneider HMIBSC board DTS
      commit: cceb16d201bb129dc019bb7df6ec746bf12b398d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

