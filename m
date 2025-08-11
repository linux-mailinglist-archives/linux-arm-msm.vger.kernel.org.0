Return-Path: <linux-arm-msm+bounces-68585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB1B21925
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 01:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701F64626A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 23:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F119223DFF;
	Mon, 11 Aug 2025 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFfLarRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6423D2153E7;
	Mon, 11 Aug 2025 23:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954838; cv=none; b=QYy6ENfrFqLamB2swJIxIToPSnVQktfT7DR2lLbx3A0j9Co3hTQr5zKfEiiL7xVxpfz9gZEwa10j00HRZHVPlD5NMrXTQHgCfT0TMAx4wDIj7oTfUAsUKWYEiOYNCASqMelRDpRQslTlUQJjuckLXowY0KTSGtBYP8M2/WTd6XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954838; c=relaxed/simple;
	bh=sXAmVGnEN1TpbJkyuuToTNUDCrnsPkdQuGoTn+WbCA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFmo68oXOPe1ORu5RaICqA51Jkb1kHkLAdq7ifTxXpf5ch2xM5fREiQdlol0bxfk1qAvU48SBSBLGnzzLzXe9+VHn48VMVRmNkVAdvDVugcoLoKX4HkoliUvPgPvgmEh+rXpFR7b+QMQu3/1ABDB4yhjGjl1LrNOudKtWKTfUwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFfLarRM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5C3C116B1;
	Mon, 11 Aug 2025 23:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954838;
	bh=sXAmVGnEN1TpbJkyuuToTNUDCrnsPkdQuGoTn+WbCA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFfLarRMQcKvOdYdpAfIg7x+iN2IhEOOFNjGTTH1W9+0+rzMv90ZCJtN1Vw6nWLh/
	 xWDzwho/cWjqWg4kg/s5OEAIFXgBvmBwmeJZsdCwwljkTw3YwgCIdDRkUwdi37y/3m
	 TGzlKUqjykaLYnw8LjhUXUWf2IH5EJTFSfyeZU1KUphqS67B5uv/91bK9dB216sZr4
	 e6oifYpHB30FJSRv/1uURtpN1G3TMnhb2mCsvAtbHu8I6Cc499rw15L3o9t3X2/oi+
	 BApn3mJZ+x+mtOpTwYlNfHsVuhsbKiNcDK7MoMmnOLD3Wf8BpKqyCGJJZM9z7IxzyH
	 d18Bai0lrDqnA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Add CMN PLL clock controller support for IPQ5018
Date: Mon, 11 Aug 2025 18:26:54 -0500
Message-ID: <175495482437.157244.12960551735480282394.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721-ipq5018-cmn-pll-v5-0-4cbf3479af65@outlook.com>
References: <20250721-ipq5018-cmn-pll-v5-0-4cbf3479af65@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 21 Jul 2025 10:04:34 +0400, George Moussalem wrote:
> The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
> sleep at 32KHZ, and the ethernet block at 50MHZ.
> 
> This patch series extends the CMN PLL driver to support IPQ5018. It also
> adds the SoC specific header file to export the CMN PLL output clock
> specifiers for IPQ5018. A new table of output clocks is added for the
> CMN PLL of IPQ5018, which is acquired from the device according to the
> compatible.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: ipq5018: Add CMN PLL node
      commit: c006b249c54441dd8a3a493c7c87158f441f8178
[2/2] arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock
      commit: 5ca3d42384a66bcb66f91d75da16ec9e9f053aab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

