Return-Path: <linux-arm-msm+bounces-87329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA44CF03C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 062ED304B076
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B93F30DED4;
	Sat,  3 Jan 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nU3mchPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E1E25F98B;
	Sat,  3 Jan 2026 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767462715; cv=none; b=qyd6pYh6vVW/dBBPfTZLxp70KUXB4Sg7upU5rLpF2sVn19ShxF7c5G+OTdg0ZkqW+TMYUA7HStYWccbvHfbq0A1pIlzXabCloIs9HEbxekyI8ZyswgRkpdEUycvYef5L+8bYyyvEotnml3o5XvcHY+J/2fkzhHP7fbhd3Rds1Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767462715; c=relaxed/simple;
	bh=uuy5+iP0f6y7Zu+tTPzL4+AiIO1UEaUDosq0GKHc6ys=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=od3mo6NdimWprVV6hTMOoDe9h4gGO/7Em6P9TkfMYhJwem6ohQ8r9ZKEAdJs6T0FNswWAdkFL1Tsd0zANGYEFiH1Umwl9ZlJ8dj9PGNrEJPZPBNwzmoMBk/Yny/ho0jm/CMLGyKcR52Qd0xmOsIZDGIRRrkyNPqxm5Bzwvg/vL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nU3mchPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E2C19422;
	Sat,  3 Jan 2026 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767462715;
	bh=uuy5+iP0f6y7Zu+tTPzL4+AiIO1UEaUDosq0GKHc6ys=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nU3mchPbT12uAsDtdZ58fB1jyG/pblNIqpU46kDOcq2EHmSVdEoYJDnniY76QKlEe
	 xCVkqxz2QOrlkAsT1qH8CdDTzmVdvRavWTiyjTzkzx05E4C72phOynR9rS+H47l02c
	 B2ktqCdj7NQjLCloW/59YAQpN4sLaVIDkpGAewBDvOeiNKFFEw9RYWu8YdJpuvXko6
	 50cV0bbDyruNms5Ib29xOcVPSs8YzmgeX8qX1JkO8werizgk58OS1k6eE49swjM7bT
	 A/1Wbrhd7fFcv1G8HKXSObiQn5+Hmd0dsOzgzp4yzHLWemOR0n2yfAi5uoSiRKLHg7
	 1Mr/gowpMUFxA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/3] arm64: dts: qcom: Minor whitespace cleanup
Date: Sat,  3 Jan 2026 11:51:45 -0600
Message-ID: <176746270365.2648843.14020984366266419118.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152559.155703-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 23 Dec 2025 16:26:00 +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' and
> before '{' characters.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: Minor whitespace cleanup
      commit: 70101cb09c205e260df918ef367d9fe5098c464f
[2/3] arm64: dts: qcom: Use hyphen in node names
      commit: 3d9bebf804b72841c838ca77cf5b783a89b68e85
[3/3] arm64: dts: qcom: Use lowercase hex
      commit: 4df4b572802cac0b0d46ef15379d7319366f3038

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

