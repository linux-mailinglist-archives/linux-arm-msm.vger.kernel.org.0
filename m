Return-Path: <linux-arm-msm+bounces-68392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC4B20CCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FF243BE673
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396E62DFF3F;
	Mon, 11 Aug 2025 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL+QTGJS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7382D3A86;
	Mon, 11 Aug 2025 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754924249; cv=none; b=cknNNkefEzjjMtcWMBTlI+EJFsVOMNsFRFr6W0yXBa4qB/M4+xRoXUEr3a8trUhvhYDVfZzN4fE+/5U2hzf/Qjy+TYGz8IbZjJmT8uK5E3Za77fSP8ahsb3YvH+NWIaV3SHOGkK79cZ9zb3dv0TgqyhAJZh42tDPdjozSLQBlII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754924249; c=relaxed/simple;
	bh=bqqyXefFRQ2sf/Z03Jt8iylLOvHmwcXSHPJvONjF/4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UlWjam8G4z6nd9irzpz3d6BYDSBgZgnlNdrFBFpqlum5+HeSil4LHwSWhnJ39HrucBQvOx56owmazOu4o51i5AIPqh8yZJvG7IlMnHXFSPpbDWMBAy7YFipT0XHZ2BaExZY5Xbks+PqDcw9M2ttidfBazYySLu8BuTEtWUjGJPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL+QTGJS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148D7C4CEF9;
	Mon, 11 Aug 2025 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754924248;
	bh=bqqyXefFRQ2sf/Z03Jt8iylLOvHmwcXSHPJvONjF/4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KL+QTGJSyFMLHogaSKqSXMYcVjLh17zk3lHD+6wpxHsHAb6BJqNhZ0jhraDm5xgIv
	 sPmCGh4dIp9103d2LOFIB5tezNOQgH2eIdEjrFhv6+bRaL4qepc3Ir2TpyeFWtc1ko
	 BbhlSMCvON8hxxjVDj2qgu7i+AWyx4kxOTy3GS3QfhZCs/WQX5seZxaR8cn4aTf3Jo
	 sGZm9fL8prA6VQFD22zYUWdh9FgeHXrGDK9afKc+LzGWTeVLQPnyveNwhUtlLjN6D5
	 mpgaqA0ngQ3JctpBf4wdUvc0+/hydYcfNJPaVHaUmRGAqhwor3NfXJGGHie6KlljFz
	 3fRgPm649yTXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@oss.qualcomm.com
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: Lemans platform refactor and EVK support
Date: Mon, 11 Aug 2025 09:57:22 -0500
Message-ID: <175492423745.121102.14526686904216945163.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 03 Aug 2025 16:31:04 +0530, Wasim Nazir wrote:
> This patch series introduces a comprehensive refactor and enhancement of
> the Qualcomm Lemans platform device tree files, aiming to improve
> clarity, modularity, and support for emerging IoT use cases. The
> motivation behind this work stems from the need to unify DTS naming
> conventions, streamline board support across multiple variants, and
> to detach from different product names for similar variants.
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: Rename sa8775p SoC to "lemans"
      commit: c7724332e0ac88168723f4140cef4c8ba92f87e0
[2/8] arm64: dts: qcom: lemans: Update memory-map for IoT platforms
      commit: 24dc241bddcde97f4099b5b8ebb3b211d5e7122c
[3/8] arm64: dts: qcom: lemans: Separate out ethernet card for ride & ride-r3
      commit: 4c0c97b95a9b05e3886c3453492a465507d5c09b
[4/8] arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on daughter cards
      commit: 76326da895b889f7f0b20e5ba5cc47b836521f44
[5/8] arm64: dts: qcom: lemans: Rename sa8775p-pmics.dtsi to lemans-pmics.dtsi
      commit: d39e1d737bdb0242e1d70345bb1ecfc8382289ce
[6/8] arm64: dts: qcom: lemans: Fix dts inclusion for IoT boards and update memory map
      commit: b4feac9e034fe1a609619cb7feb55217fd5d6583
[7/8] dt-bindings: arm: qcom: lemans: Add bindings for Lemans Evaluation Kit (EVK)
      commit: e9d84a1f8bfe85b6c406c4a088e537d4a5f83a87
[8/8] arm64: dts: qcom: Add lemans evaluation kit (EVK) initial board support
      commit: 99ea5a0d6bc820b15727cea006561ede7339bb79

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

