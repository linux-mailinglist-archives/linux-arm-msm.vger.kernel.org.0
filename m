Return-Path: <linux-arm-msm+bounces-44191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B57E9A046D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD8A01640FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A261FA25C;
	Tue,  7 Jan 2025 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYs7aGrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7C21F9AB6;
	Tue,  7 Jan 2025 16:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267968; cv=none; b=QW3hlTaiLdjEsAMCEnlzQBIaXXiTEVXKnyC9YFhRlmFJTsUfqYF7yRf1d/5/TQFoQ1i53INSMF4DdgT55ldPD6n6rdEZMQ7rwz6tqesVxKI9gok/ibq5oJIHimBUzY8sjIbeMdN5XOhcZ+x2rrRX8POTVi6RwNjE5nun9QJ0oMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267968; c=relaxed/simple;
	bh=naQFrRtHM/ZN+9PgFccmP8FZm10b6hEe/s/BQwFHfLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KnV1lXUYQTCB+934xWHPZarJvX53mAgzU79xXBQxnAnEiRX0NAJo3lDaenBmMz9tNxOWIfpRaJM4ofMda2rIwE4tn1EUdtPfN/LzKpcr/LELoZHtZt2zUx2kCrCfmrlAyhwSCTiVSx7QSrP8nAOzCBzLzNEohDBaQTPeQx3UlfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYs7aGrw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855FCC4CEE3;
	Tue,  7 Jan 2025 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267967;
	bh=naQFrRtHM/ZN+9PgFccmP8FZm10b6hEe/s/BQwFHfLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pYs7aGrwZ2qdasiWJ0KstXKKcTszq1o6DA1BLC6uvQAt6en/SYfr4+8V/ZwFmfglw
	 /qj6FUdqqnA1JIWF/rnLGQ+fPWj+w5HCiqMDHVCqcaNQ3xxKk+oEAksQWARWP/Bz0h
	 VmC/HYm4bWdUuNA8ic7z/osgQROnUS87qZFPVpHS6oeu0ID9A06+OGFXPl8DoXviWW
	 B6YM4HcIGXL9zwyon+JwEw8603bZlnT9Vd6XQ+CdsdhDH8Jhfp3iyPHcckkpuep282
	 MExOeqL1tA0VTIehK2SJ8yBeWRxsu4iR5vpnju9RDijlrzEoiacFNlcQ/1RWtUNlOZ
	 XIGhJP1aoi5Rg==
From: Bjorn Andersson <andersson@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: (subset) [PATCH 0/3] Add FSUSB42 USB switch and external DP for Qualcomm X1E80100 QCP
Date: Tue,  7 Jan 2025 10:38:55 -0600
Message-ID: <173626793409.69400.12426335984936890679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 12 Dec 2024 14:08:22 +0100, Stephan Gerhold wrote:
> The Qualcomm X1E80100 QCP has FSUSB42 USB switches on each of the USB-C
> ports that handle orientation switching for the SBU lines. This is needed
> to enable DisplayPort support for external displays.
> 
> Add the onnn,fsusb42 compatible to the existing gpio-sbu-mux binding and
> then describe all the necessary components in the x1e80100-qcp device tree
> to make external DP work correctly.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches
      commit: a07aea2174f2dfde580c6b67feb38a4e4c0df696
[3/3] arm64: dts: qcom: x1e80100-qcp: Enable external DP support
      commit: 5f440a7b003e16e0303ec46bc433fbdb3a334664

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

