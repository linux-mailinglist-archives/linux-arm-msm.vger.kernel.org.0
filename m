Return-Path: <linux-arm-msm+bounces-87497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88ACF4BDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91DCA303F99B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7944D33D4FA;
	Mon,  5 Jan 2026 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jR//tH8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D8333C53D;
	Mon,  5 Jan 2026 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767622129; cv=none; b=OHLwmYPhp8mNaFk5XFKTH+J43vLFl7q3s2wsdbMhIFifWyvf4LCwiVLNqf5Q+SLRbH4tebInUu0fVkQLUjo6Rli8TqgX5eBWJBDjiCEhNbwbPrVZO9EHriE7cz113e2774WmAJMOkn2qOg/inzps41L6ORC5nO96ZOevvd/AH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767622129; c=relaxed/simple;
	bh=yi7vxw7jVid5bTWBQkeZ48N8e/ROXCNyhJZCdao3DXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lre5bZUteluoasi/EuqKe60dB1ouhuvy7rjn7oVCyEHwicA5tir+RTUbn8afNt/Ap5Vuy8PPWssbsuLPDPC6EwzrOvWshbX4Nq1EgyRoYdxXFfU0sST8SKdAnj+R0DAkAdr5Y2F3woGHNsjNMh1a+n+w68xhSv0FX5npe2fAyN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jR//tH8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EF6C2BD00;
	Mon,  5 Jan 2026 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767622125;
	bh=yi7vxw7jVid5bTWBQkeZ48N8e/ROXCNyhJZCdao3DXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jR//tH8StmQZpQtesRTkJaySR9iUluwNJcs/6aiRFpBSipU6eekXEtOtzjg2Mpdr0
	 cZhEAPrABscbUhd5Sy0BrXuGV2niMiORnFPL+bhC6FFLXsyQfxHqJ5wkWsuK+Kxw/i
	 pTNbewoLaCbLIciosmsjsA+8RfYvhtiScJBXPfiPHbLnOtxaAxlma8fSUxLXDi+6PZ
	 eoCegKj03r7+gxTbFR6BVkxr//+vPdXimCULfj/iqyh+srrcGpajoIqZybfS480wsx
	 Klaj8wLwRcBiowP9QXxUa93fMOvH+xdRo+wEOh+/dfltRzbpFlklyePA82d5ZXsRBR
	 M8XijqbEeDhGQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: sm8550-qrd/hdk: correct S5K3M5 properties
Date: Mon,  5 Jan 2026 08:07:43 -0600
Message-ID: <176762206357.2923194.14421499687306297389.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
References: <20251222023834.3284370-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 22 Dec 2025 04:38:30 +0200, Vladimir Zapolskiy wrote:
> The changeset updates voltage regulator property names and removes
> an optional data-lanes property of Samsung S5K3M5 image sensor found
> on SM8550-QRD and SM8550-HDK with Rear Camera Card boards.
> 
> This reflects the changes in the dt binding documentation of the sensor:
> - https://lore.kernel.org/linux-media/20251203040241.71018-1-vladimir.zapolskiy@linaro.org
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
      commit: ff7cb4613b490cce4e213961b91f28b744d82ee1
[2/4] arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
      commit: 8cadf9f0bbfcccc639b412b21d347108eddbb58d
[3/4] arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
      commit: 4438d377f6d8bcaefe645dd436ab8f8617d815ec
[4/4] arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional property
      commit: 9494917da576038d754fbecd15b1f1bcd7b2e0ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

