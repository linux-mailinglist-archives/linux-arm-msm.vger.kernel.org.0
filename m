Return-Path: <linux-arm-msm+bounces-87551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BC0CF55AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 20:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EBB0313751C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 19:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A363346A02;
	Mon,  5 Jan 2026 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MszCB6hK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDBF343D8A;
	Mon,  5 Jan 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767640607; cv=none; b=WmUZAPOJNJ6PiTkuQtWMZDs4338+/ai+CVGGtK50OyGFm8xs5E5nWzyAYbyq1O3chW9PicZigSUC0hw26UaEVFgbkpz39Wj/V49p75mzfSw1W7kZuCI/gzq99UEYnUjPiEwE6Dqjr4vkQR0+daNChJwRmbUe890lLL7gS5Iwd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767640607; c=relaxed/simple;
	bh=gEzetTtPRkdjs0AbkDrFzFvvbTViM7nsfuigiPGZqDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W9Z8qzywSNASBjzU70CqJA51FFlX8836ASe1JhH7PVPN+HdqQQFSSLeB6QFCT3IHkEvOJREV15J25WqxavCsNaBj5iVZeXUrhH1Y6D/yilzpw+eE+7OAbOE1XM6q9FOhh6KJ3kWYD8Iyf8PFtpOwUQ4w0j/nR0wJg7gndatSUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MszCB6hK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9674AC116D0;
	Mon,  5 Jan 2026 19:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767640606;
	bh=gEzetTtPRkdjs0AbkDrFzFvvbTViM7nsfuigiPGZqDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MszCB6hKcGd7mDozZqVmh4HtUCMvZPINY+VOcARv2Zd4jp5JHIgQ003aCYJUUDInd
	 xmrZPFmTlNXzxF+/AdqOf6EtcpN9dQGsH6VgzbDVSCBVPtQAwIubr8SH77TXlRlU3v
	 VrgdQvqPH1vRcRf+KukhnQ5KRnO5eSgaPEZ+/xbcXvtTqABWGXoogFsP1KTfVvhEzH
	 QTjoeFvoGpbOdYHd3MA/dRZ3R7L5ioU8y8vARvQTaP1OIxewBDUKzRWFN14N1TqMgp
	 d/+A2hx+d32c8qAV44k0i2ZhCww9OSK8oUGfex3gtj3t29Jt4xKNAoMzFuF3eEVGaK
	 NF5Q36a7/1MRw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Eckelmann <longnoserob@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david@ixit.cz,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
Date: Mon,  5 Jan 2026 13:16:25 -0600
Message-ID: <176764058395.2961867.64794842436985626.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
References: <20260105-slpi-v4-0-e6e0abfad3a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 05 Jan 2026 22:31:50 +0900, Robert Eckelmann wrote:
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      commit: 2a7dac907be27bd0b86a6f2df3f5feedcb538263
[2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      commit: f4e6e3f827a0c53f38b3186335069d855ea9e9ff
[3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort
      commit: 5bde31dc7b17b668a02857c30359ac86c23c9e55

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

