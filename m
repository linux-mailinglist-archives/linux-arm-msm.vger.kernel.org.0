Return-Path: <linux-arm-msm+bounces-88353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFF1D0DAD7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36EF0300CB65
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC9C2C178D;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcufQQN3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145D62494FF;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072297; cv=none; b=V1s+Dz5fo8P83X3dBPNrxI+fDziy6JXLFDeHuq5KPKt8wTFgYpaA1Q0frXYBEyx90wh5V7jhs+QElHR6o6ivxulrVJVRD/HONhmf+WIIBhbYWMCT6DEIlCukjSM7anGB2xVIr62bSoWXixn9tQzcJQlRJfXrQ4B4MPRri0D+OQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072297; c=relaxed/simple;
	bh=6knU8j8RpUaTrUqSesvcXMQWYFowka5N1OEBcVDfqHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAC0oOirHH6XC73VlnzYIxpXbzRi9FaViiP5IVclIO7hRKAE2JN1tRU7WUWXgBPVMH0pnbWbHfxE0+5trx3bCJRlrEv27T8OJO/P3SSxyGWnwPaUfN4QkgZdvu/N94C4yO5Yv//Kkp9WPr7GUq0g6PfzXqjjsuR2qh0xN+m0hfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcufQQN3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18B0C4CEF1;
	Sat, 10 Jan 2026 19:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768072296;
	bh=6knU8j8RpUaTrUqSesvcXMQWYFowka5N1OEBcVDfqHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YcufQQN3ewPhrRJDfv/QgfyyYTBUEUlv350fgG/rz0pHD86S9LwqVtid7t/91E1qP
	 7RNpSQWf6IHTkCr3OS5fLdGtkn9cQV9YOBFqiRDIFAbNTxP2FIJ+zpy892bxTTIalx
	 Kjq5hitioPQNgGyMBbBw/BkobjfXTf6zqi7TEdlpS8Y5d4tV2rsMa8rqc+mly9mYkZ
	 dNBi6VwDNF5UlC9IPeo55Fe83y7tOwlRAj73CFO3jwpEnFb26GwafguNJja2u5eG4u
	 agAjTRrZVXMeD67LPWIAtgWcF2i1N10/fABr/U//pWI/Zbx3m7hfqr6R5j2vp+D3DM
	 sZPorGDHDbdfw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on SPI11
Date: Sat, 10 Jan 2026 13:11:19 -0600
Message-ID: <176807228461.3708332.4071804289877122337.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
References: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 12 Nov 2025 13:12:09 +0530, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
> required SPI and TPM nodes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on SPI11
      commit: 54b5415739300c89cdd6b1db152bb5acf047ce40

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

