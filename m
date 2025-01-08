Return-Path: <linux-arm-msm+bounces-44299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3814A0523C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 05:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE5AA7A2BD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 04:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DFA1A073F;
	Wed,  8 Jan 2025 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0tQEHwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1291A3A8F;
	Wed,  8 Jan 2025 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736311434; cv=none; b=LViIQajLQBfUR08FYa8Em89oIL4c5gFZ+tL3psZBu+kUIfPH9wRtttmC8nIpoMFDBhmanXEJm5juHHddYeg+nXLy8Ey0EHGOFxqUjhdrecuisDcKvEvZ+oTOVmhoJyrgdBMMghzne+B1/CctVT6YE8clZTRiTZVxk+ddxvG60c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736311434; c=relaxed/simple;
	bh=/mV7wH7LOMq7MCH8cH9ae72/1BoyFaiEHE7/iGDin2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S36htAt9j+r8bSpoUaXKlh1GYpPNIRgy+Dwv+u/rc26YfFgHdu8COm5Q3w6lLYJRx3DAn05LeXTwdcbGSasI8utVoC6xI8cKgqYnmA1zEgMX1a2Mmr45xijgutBx7n6orSRiHK/Wz+jTXlH4h0MathMKTCpi37uMtUfqaeO5LSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0tQEHwQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366B6C4CEDD;
	Wed,  8 Jan 2025 04:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311434;
	bh=/mV7wH7LOMq7MCH8cH9ae72/1BoyFaiEHE7/iGDin2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n0tQEHwQMyRBv1ZkdEIyczcnBERy1sWANseSDlSiUG0Iujcsia52vIhYr/3pO8tjl
	 G3eCOtSxU/WgZwwgVRBJWC1+Ik+nGRLqQfErZkIseVoCA9wp4bVFhbjnFdE/03euaK
	 k0heRncyrsPB+ZGTd7bztzan/nLsDgxbJhPr0JQKatzln/jGcSi6MwbVvTX+CWyJ9w
	 /ehKVm/EYP4lERGDzuHiZNt3KRxeqAQYOI0Eo6LB7aumlef/7w2x+N9qzpGikowCu1
	 6q3rjRCLU/YGIU2R0XhCyu2KYiJ/R+MjCMelcOD0aVMcWfMKwqfUXut5wE/sJP8y0T
	 9ls+leud6dNPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Tue,  7 Jan 2025 22:43:43 -0600
Message-ID: <173631142067.110881.6694902504537302147.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
References: <20240927095413.15278-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 27 Sep 2024 02:54:09 -0700, Mao Jinlong wrote:
> Change since V4:
> 1. Use ^ete(-[0-9]+)?$ for the pattern of node name -- comments from Krzysztof Kozlowski <krzk@kernel.org>
> 2. Update commit message --- comments from Rob Herring <robh@kernel.org>
> 
> Change since V3:
> 1. Use ^ete-[0-9]+$ for the pattern of node name -- comments from Rob Herring
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sm8450: Add coresight nodes
      commit: 6e8637db89bf138a0533b5442d9a0b02afa5e3e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

