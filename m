Return-Path: <linux-arm-msm+bounces-68837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB208B23A6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 23:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4E19584EA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 21:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A049429BDAE;
	Tue, 12 Aug 2025 21:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClQcM5DB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E46274B29;
	Tue, 12 Aug 2025 21:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755033238; cv=none; b=kxkGi1CH8LKl+9OQVmywNLNdWueP7/dO07ONdIRVMN06Dm+jQfxSOvrkoO9ETXhQ7g3FDRkztKizmsga3294TKbVIiCnVRSST8EaPfgZOAm4lQZLYrRaMr8d1w3bk3kcCMcZVUm8T1EgdtXxuf3Ysz41CmraG0guBXqN7St0g+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755033238; c=relaxed/simple;
	bh=t2yvPIyQrSu/Yj7SxKAikIoYXbSAhrjohg0w9UZgD1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9dN4jSeoB6QJo4NFEq5XSPCCCOLJiToyuZ10p0SNT6HIEM7gc7BgongOlTx9ZZMSjWk8HEF1tPl5gqtD0Sz8+L6JFN0+jOS2Gbk3sRnwXIql9/I2/t7BMS+CBV5R6pUMMDoxDLVGIzxyPdW5hQbGpq6LXTIxlbLkgD5wLhfElk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClQcM5DB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A25CC4CEF0;
	Tue, 12 Aug 2025 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755033238;
	bh=t2yvPIyQrSu/Yj7SxKAikIoYXbSAhrjohg0w9UZgD1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClQcM5DBWy4nWu0q+P0IGq76Rg3atDcobEpHUTpSDoHBm5e+tLBRHMu5Le+J2HnXn
	 M6fpQ2NJrKB8Ep9ym+p6g/PJ+PCOtR3RJYz9kcSTGdKQoJRN9ttSUkq4S3W1sH4V5u
	 RPvlZFL/iqChMWy9EIxTNic9Uv/OcQIAu9XW/6zZNauC+qIfn/qQqTCwptINmYsxp+
	 UTpdFLveBSXCrUf2StulHG54xbzMAyvsG3Drrg5YxDApg4hfrRH9qpP5eJUxDT/mVt
	 orez5uxELYZst7Hw8Z94addWOnoUj0BgeA4tXRhJvAUKDKX317GaIZFA15a9HI7ts/
	 Xr3O767Xe/XXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] arm64: dts: qcom: sc7280: Add the MDSS_CORE reset
Date: Tue, 12 Aug 2025 16:13:42 -0500
Message-ID: <175503322844.231048.5066604932416440449.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Aug 2025 22:11:32 -0500, Bjorn Andersson wrote:
> The version of bootloader found e.g. in the Particle Tachyon configures
> the display subsystem to the point that Linux isn't recovering the
> state (currently hits one or more iommu faults which results in a panic,
> still debugging this).
> 
> Introduce the MDSS reset, like we've done on other platforms, to allow
> the OS to clear the bootloader state.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss
      commit: 9cdb77e3103a449ee54f397d29321a5d4157bcb7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

