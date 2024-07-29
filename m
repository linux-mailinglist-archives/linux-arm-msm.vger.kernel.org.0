Return-Path: <linux-arm-msm+bounces-27174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBFA93EC37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 06:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63515281F95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 04:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4287F137905;
	Mon, 29 Jul 2024 03:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="goCk/Ivq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35E13774B;
	Mon, 29 Jul 2024 03:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225532; cv=none; b=WzAd1dc2b0i/0t/Bj7FuRzuvZ+jfEg9hYMcz+CaFZczKgg9RJznCz4y4/LG30typge/wKRudo2aWeuZGW5p8BHs/I1ZWnOZHmPGfkrvASsLpM70iFMJ073A8W9JA6Z84GKikTK5iKwWime+TX2SPYXz4azWCbCusfCD5nd7Ho34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225532; c=relaxed/simple;
	bh=Bc/hBMJ+lQFooYOF2TcG+dcTNSSr+5tFNBcsfoNlPkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q/0JyUkKlfgRUaQo6On2cjf4CIcza/KYmmVLK8ShcvAT67Aci2Q2kKNk/ukdsewr4WjHWWiV7qe92jijANO19rPphqNtdJKSkz5Wyxfv5tBkB8bT+fc3mRzNBPyVTJ67IIg24bjnw+dS+jdCR5KqtOtdN3aCs64ZV/rpVPkkYqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=goCk/Ivq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA2FC4AF07;
	Mon, 29 Jul 2024 03:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722225532;
	bh=Bc/hBMJ+lQFooYOF2TcG+dcTNSSr+5tFNBcsfoNlPkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=goCk/IvqKMS8e4faCtiBCT7BDdCIBQG9aWQV4WWfywOwQo8EdODDcPnl8T6Xz+1rP
	 A4QXecLnDCPkfnobiLbZkDYSb/qu2AJXlJPlRjccMkYIDobbMnzBGT36QUlCJ0rriA
	 f45j1/uDRYZqbVwYA9EX1cSgd2HHGfHy8dnAOqe5j0pZr0YSFtk64M/FQpe9Cznreg
	 M3OgqC9SBGHfJnTdXMbCpc3p5hV+vKOu3h35pv81zchYyzCh1M0kMPFLv1r2MpR5LX
	 lGlxMnabDRufoJx67Dm4RxmUWJe9zByXTpraKyrxUteJSvigOKjUOMNsv+FtE3EK/f
	 astr7Ab6YPQQw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: sm8[56]50: use the PMU to power up bluetooth
Date: Sun, 28 Jul 2024 22:58:18 -0500
Message-ID: <172222551311.175430.11797522159810417451.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-0-67b3755edf6a@linaro.org>
References: <20240716-topic-sm8x50-upstream-use-pmu-to-power-up-bt-v1-0-67b3755edf6a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 16 Jul 2024 11:45:09 +0200, Neil Armstrong wrote:
> Update DT of SM8550-QRD and SM865-HDK to use the PMU to power up bluetooth.
> 
> Based on the SM8650-QRD change at [1]
> 
> [1] https://lore.kernel.org/all/20240709-hci_qca_refactor-v3-6-5f48ca001fed@linaro.org/
> 
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8650-hdk: use the PMU to power up bluetooth
      commit: dd5f9b31bb1af9da835fd67def673eba9096b864
[2/2] arm64: dts: qcom: sm8550-qrd: use the PMU to power up bluetooth
      commit: af8f801f59ed6fbe490414fa61276287f7aca332

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

