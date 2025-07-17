Return-Path: <linux-arm-msm+bounces-65355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2772CB083E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 06:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6986E160A26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 04:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E8121A454;
	Thu, 17 Jul 2025 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDLziw87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F353214A6A;
	Thu, 17 Jul 2025 04:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752726687; cv=none; b=iJX5Uo8FdbgKU2Qx5uJ4Em/AzRISv2JwDInUbJlkQMwmtO2px1AfBfeRG4dP/j1b7jkDEMXk4V4nzfXHuLMPfrTSwhuKhSl/r0f1Gn0ky2wEIH6jA5bz6gsA4dCH9diiITLzd3K7y27Xeq7M9bfqmK040syd3fekcXtrNB0nKd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752726687; c=relaxed/simple;
	bh=H1F325ayWXzCzrEwJ9BQEhaV071R0PlGb1/03/FikBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fAO50MTjdBnLR/TKUT8FDkQgaIIncIDOn3ZqUVJS8KGdREwnAmEH3TzNKy9Ciac4RquXXmerXHgM3BwaoATmjqfS5GGyfo08dNsRZ7+INEk7wqpuv/M9epmUL1pYavWGBXwMq2o5dLJrl/k4o1TswBlknwMAigNsTmomp55WkR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDLziw87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF91C4CEF8;
	Thu, 17 Jul 2025 04:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752726687;
	bh=H1F325ayWXzCzrEwJ9BQEhaV071R0PlGb1/03/FikBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDLziw87u2RjATAcTWq2Ao1NtHRN/HJq9WD6RP2TtfK42njWvbD4IB67hPHD2Vh4y
	 fcKhIdshxqtGS8R5H5HXLpIRzlpA3wE848mpukXk/O1pWXKnvAxJLiBbKNDbyNVvd1
	 WhY8kNsESEf5/nLka+M/N5EDlJD15/EFURUEQmZ3CHdPAVds6QLG6hX5qFUiPcjiRw
	 drdgLwiIW84YUyDVepc/aMcjprtSuLiWOQw7XG1AdNQ4CF/mCUXD8N4CEvA4upp1Hd
	 KtSfaYzXijE+F04MlHDaUXP9Pua3Y4aelqItGWuCywPEeWTxhyKHqgcxd5xrz7G5Bu
	 DmH2PaHwvYpwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Max Shevchenko <wctrl@proton.me>,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH v2 0/5] Add support for Sony Xperia SP
Date: Wed, 16 Jul 2025 23:31:01 -0500
Message-ID: <175272667105.130869.3006233699621516206.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 22 Jun 2025 18:26:36 +0000, Antony Kurniawan Soemardi wrote:
> This patch series adds initial support for the Sony Xperia SP (codename:
> sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC. The
> MSM8960T is a variant of the MSM8960 featuring an upgraded GPU (Adreno
> 320 instead of Adreno 225) and a slightly overclocked CPU (1.7GHz
> instead of 1.5GHz).
> 
> The following changes are included:
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: qcom: msm8960: add sdcc3 pinctrl states
      commit: b538c2f893cf72773132cfc2beae8d08a8e06543
[2/5] ARM: dts: qcom: msm8960: add gsbi8 and its serial configuration
      commit: 12d17b6bc4ac3d322360b13072da9eeaeacd7970
[3/5] ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes in msm8960 dtsi
      commit: cee2575e2de8816fe3dca047c3fc6dcf25dd0a94
[4/5] dt-bindings: arm: qcom: add Sony Xperia SP
      commit: 82322c7cef16091e646b7e8a227ef1e4f8a3b287
[5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
      commit: 7dabe771b072f7f6c09358d72ccc3d08266d7a34

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

