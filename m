Return-Path: <linux-arm-msm+bounces-87462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24ECF40EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:14:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE418302EA16
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61B419E968;
	Mon,  5 Jan 2026 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rTl3YDMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897A145B3E;
	Mon,  5 Jan 2026 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622073; cv=none; b=ref7MjaQMbT7TEm8crkftOXixGXtYYE3+fwOwuB5XFIkbNN258C51dM1NfLyuq/p7qhepu67PpQ+yQzx1PUwdSgUDctcDREayvuCKlcR9REuV6jw5CcHlGzAiZSPslixTuwoi2R9Cyp1iHPVHFESuOPc2x1jk+pW76xVYoygGdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622073; c=relaxed/simple;
	bh=i8bZaPFlOf40SqEPngu3fEwOhlByKQgqUEY5qg8pNnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cnfSYYKuo7Tb1iWTi7uX4YPzS49r7hc0GWOKIXc6dZiv1zWfqjFRkyGkuIHX5aJw6x/XFbtH9RepweA3k9+SeGPQBJKSwBk+pcbeFjX3HN3qoZmdbpNr7h890BMqX18xNQf+w0fMhtja54LNoLxH7Vf3W8obmGAh7C0ZZUEr9Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rTl3YDMK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83CDC116D0;
	Mon,  5 Jan 2026 14:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622073;
	bh=i8bZaPFlOf40SqEPngu3fEwOhlByKQgqUEY5qg8pNnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rTl3YDMKaMXhCDNrAxarlVZLp/fyrNTHiyzL3gLZl9ww2gTmyW2b8QgQXWsHLLGH1
	 lCZZnDljTnpMxkU5KZoMTRmjYA9s1z+D3Tugx8Fs6UyWaqvl9X1idRoe4b9+qjZHHi
	 oDrfUR0d4XbI51kBbItjpINAv6PI3KxJQyKEsx1nYbE8NaQSNa80ES1Zx0OD3GtSMh
	 m0TBFwDk5gMOdluyzKTMUCHAAC4XkINEiI+ngW70YygLrj9qAvR82761fgWrHrGy9T
	 xU2h0ighbtX9dGPmGQxbshXDVyaFwWkhT/IU1FOz3ANYCkNkZWTS+v1mgDsbOA+ie+
	 gheb8comkaB3A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clocks
Date: Mon,  5 Jan 2026 08:07:09 -0600
Message-ID: <176762206421.2923194.528670029626982446.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251103-dts-qcom-x1e80100-fix-combo-ref-clks-v1-1-f395ec3cb7e8@linaro.org>
References: <20251103-dts-qcom-x1e80100-fix-combo-ref-clks-v1-1-f395ec3cb7e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Nov 2025 18:51:40 +0200, Abel Vesa wrote:
> It seems the USB combo SS1 and SS2 ref clocks have another gate, unlike
> the SS0. These gates are part of the TCSR clock controller.
> 
> At least on Dell XPS 13 (9345), if the ref clock provided by the TCSR
> clock controller for SS1 PHY is disabled on the clk_disable_unused late
> initcall, the PHY fails to initialize. It doesn't happen on the SS0 PHY
> and the SS2 is not used on this device.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clocks
      commit: 3af51501e2b8c87564b5cda43b0e5c316cf54717

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

