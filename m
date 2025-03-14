Return-Path: <linux-arm-msm+bounces-51495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B29DAA61BBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 21:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0669E4218CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 20:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C64214810;
	Fri, 14 Mar 2025 20:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEiWUzHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC4F2147FC;
	Fri, 14 Mar 2025 20:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982516; cv=none; b=gnK74WqZ/O6rqL0SZYzsaQfbhzGp+KhRDqniS4XBVdIO8vu4J/KU3chulu/Oa24/gxLs7uR2eEZwvEcMMJBeE3gMqOPfW4kQkTI3+vmaWHoDjKLsMqamVEDOdMp3IrEPPtapUNB4Oipa1rZoH6hM37nIGMn9hCUemX55uL0AsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982516; c=relaxed/simple;
	bh=sprYGPdPGNDfqXxgx+FFcY+6W5e0DRAJPc2xDKovcRg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRlA964ieiCPMlBVi4dXn1GLZj5WG/lOXsLrIe4dBK6jzA8cUPeePhfIWINzUOuMHT4XS1H4U1+XStWM3GU7CKmiG1/ZQJQhPpdIaoe1qEu/nTDoWpbOY0ABoQfp0OFzjlnVm5X8bXYTMTZY7Dykvjnc94DZEL7KjpykhyfXHls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEiWUzHm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853A3C4CEF0;
	Fri, 14 Mar 2025 20:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982516;
	bh=sprYGPdPGNDfqXxgx+FFcY+6W5e0DRAJPc2xDKovcRg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kEiWUzHmkwNnTISGcAn0E1qFDY6uFOlGtLrKYCyvXgQwavlNmFmRrptveO6ZO0uv1
	 9itCT6Q74aCp8IhXqOZdtDSIVcBrjR2mldvw52O1tIkRhvq349AwdIa15/PxePZZMv
	 92y4pvGHh/r2+OiLqf1ABqeOLfMZa3+XTRZu9/Rlw2V0KQzK92c4nlmVKNJhdBw7N+
	 TSsGzmA5gMVMrAeqPlNSu1cVeqgCk1D66PWUIhLVW46LRdvcIelZjTv4J9gHgq9NC8
	 d6C0KSlInDhtOuv9WWj82bhLCDX24hkqWiPhR3W8t/CJ3G4VVBjqqiVbTQzg5dfWTG
	 +UIRFzkoFIfsw==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	dmitry.baryshkov@linaro.org,
	quic_srichara@quicinc.com,
	quic_varada@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Subject: Re: [PATCH v1] drivers: clk: qcom: ipq5424: fix the freq table of sdcc1_apps clock
Date: Fri, 14 Mar 2025 15:01:09 -0500
Message-ID: <174198247888.1604753.880832461804374805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
References: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Mar 2025 16:59:00 +0530, Manikanta Mylavarapu wrote:
> The divider values in the sdcc1_apps frequency table were incorrectly
> updated, assuming the frequency of gpll2_out_main to be 1152MHz.
> However, the frequency of the gpll2_out_main clock is actually 576MHz
> (gpll2/2).
> 
> Due to these incorrect divider values, the sdcc1_apps clock is running
> at half of the expected frequency.
> 
> [...]

Applied, thanks!

[1/1] drivers: clk: qcom: ipq5424: fix the freq table of sdcc1_apps clock
      commit: e9ed0ac3ccba65c17ed0d59c77a340a75abc317b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

