Return-Path: <linux-arm-msm+bounces-79067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13063C11D73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95ACA4FCEA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F8E134D4F1;
	Mon, 27 Oct 2025 22:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phz1arbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58034D4E2;
	Mon, 27 Oct 2025 22:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604535; cv=none; b=KzJgk4HRG9ewIG9unxYc6bHWrfcOBpzmdJ/1q5Sbjyg/jTSECi5TfWy9/Q6U/hirfaA3cErI/upP3OH3TRkxjOqHzAxWUj12aZccckJefJoW/cS+6lqegfhjDBo6MRwiiLpomxN0vZdZJyRuWTwYV83w/rh7kvXtQnXEjHN5RB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604535; c=relaxed/simple;
	bh=W23InTCQLvQRk4okzOjT4JER6BZmLFImk/QEVoOGZI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOmpoUg6kMQr/viCvaXy42+cVehqjL1DMoAdXPpE45+V0EpUWavymohfRVPACBSNVG3/DbdWnx4g+a6IrJpbhH+89PT/mlXWvlO26f+D6qJ1wrj1HNr7/mk1rAY1BL4qytOgcUcmYFMeamiCegcIviUiWQx/U4JIfgrdwcB4g4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phz1arbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326A7C4CEF1;
	Mon, 27 Oct 2025 22:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604535;
	bh=W23InTCQLvQRk4okzOjT4JER6BZmLFImk/QEVoOGZI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=phz1arbv6oKEcZlw5VpK9BwvhuG6i574o3GW/y6wCfiFKhEbHENa3bnmHbDqNqEid
	 92jxQWMgSZfMqFtJLJmdP26o4M1v2BwI1HwGwYbDfPuQYz9SpnGfIp7oJd8B2bQCOE
	 pURXa1y5d24VI3WTYz459b9CUwZpkwhcgxxIgpV1FlRPq7fwmVkuCsg+b2GkJFzAmH
	 bU/DYpxP84X4ISEsyEP7OlqVuqElISU/vAVjlUm1gFlKG5+IIKMqT3Rj7MciGsbm32
	 ODSn0u7/FcoV3GvbdVuG8Dsd82jEbATTkpT4PuxJzVnZyfCU1rFD32+XgXxS5HtQRZ
	 kSwKdbWqxrtdg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	Val Packett <val@packett.cool>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-dell-thena: Add missing pinctrl for eDP HPD
Date: Mon, 27 Oct 2025 17:37:27 -0500
Message-ID: <176160465216.73268.6424962079991608353.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012224706.14311-1-val@packett.cool>
References: <20251012224706.14311-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 Oct 2025 19:40:08 -0300, Val Packett wrote:
> The commit a41d23142d87 ("arm64: dts: qcom: x1e80100-dell-xps13-9345:
> Add missing pinctrl for eDP HPD") has applied this change to a very
> similar machine, so apply it here too.
> 
> This allows us not to rely on the boot firmware to set up the pinctrl
> for the eDP HPD line of the internal display.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1-dell-thena: Add missing pinctrl for eDP HPD
      commit: 1bdfe3edd4c862f97ac65b60da1db999981fc52a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

