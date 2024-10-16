Return-Path: <linux-arm-msm+bounces-34611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E08289A0E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C4E1C2085C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4723A20E025;
	Wed, 16 Oct 2024 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNEuKOdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7B854720;
	Wed, 16 Oct 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729092735; cv=none; b=liH6QhK6YO8QJ0mBntY0AZSI34vKK1QXD4LPcTiqsiC2hUy+EmvMzJTlQQa3Y1LtAXSj1E3WhGGCM57z8VNfF0M8O8UrI+9LMOCxTTdCrryZ0jYjS4BaXRpq5jVZ0cmzJJR6uFnNcRvyijT0VoAuPm10LgU0IdXrmFmDinC5QaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729092735; c=relaxed/simple;
	bh=P2bJIamdJcbs7G92FX1fCfvsX7Wy+RgJgtcHLUEx4Ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhbqD8g35RwIX67qC6iUWNRRx8biKBzfMUawuNbyZdE01K2A0dKxi87R2pkdyacjc4dWdR7v7EfWqoVUX2egKAegTDPIRne63WaTvHaWBB93fWN2DPGvUj2JYq19pA3Ckou8Vr+kRFkpdafwNWKx7BlFYPH/sBM5utpklNbMdFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNEuKOdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3862C4CEC7;
	Wed, 16 Oct 2024 15:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729092734;
	bh=P2bJIamdJcbs7G92FX1fCfvsX7Wy+RgJgtcHLUEx4Ew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HNEuKOdp1TM0wRAGEF1959lizN5cVJz40TC86sm30YgSJgPtUKySzSAPyCMZPRUU6
	 z68pnOukzvCIW0q7g3hcfCBLNeK88lwGRgj/IOVvlU/4pV8ureyWvbbs/jJCGcV0mJ
	 NxIa67upO8S9i8CEPbhBpsznMBSrL63WYlEFsJDzBSe86870PQAlt4z6CdMfDaIvZb
	 GMgKkBSKAnAOtHQSfOM6X/DeJyDdFnL+5Q0/lgleEFN5hq5pWkp1VvrLC3C32kthe3
	 CPzZTEtu5JA0xOpgJLx4EfZfqVFTuAOs3JCX2/l/HahJNyMuaWowm8vhSJqm2AQxR+
	 E+vDsLA1Rf1rA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: qcom: x1e80100: Drop orientation-switch from USB SS[0-1] QMP PHYs
Date: Wed, 16 Oct 2024 10:32:11 -0500
Message-ID: <172909273715.703216.4493809252879170474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241014-x1e80100-dts-drop-orientation-switch-v1-0-26afa6d4afd9@linaro.org>
References: <20241014-x1e80100-dts-drop-orientation-switch-v1-0-26afa6d4afd9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Oct 2024 14:21:47 +0300, Abel Vesa wrote:
> The Slim 7X and Vivobook S15 are the only remaining X Elite platforms
> which still unnecessarily describe the orientation-switch in the USB
> SS0 and SS1 QMP PHYs. So drop these properties from the board specific
> dts as the SoC dtsi already describes them.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: x1e80100-slim7x: Drop orientation-switch from USB SS[0-1] QMP PHYs
      commit: eb2dd93d03b16ed0e8b09311f8d35cc5a691a9b7
[2/2] arm64: dts: qcom: x1e80100-vivobook-s15: Drop orientation-switch from USB SS[0-1] QMP PHYs
      commit: 27344eb70c8fd60fe7c570e2e12f169ff89d2c47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

