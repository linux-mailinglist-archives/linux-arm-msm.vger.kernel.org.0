Return-Path: <linux-arm-msm+bounces-76739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB5BCACAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B7254E4375
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB2626E6FB;
	Thu,  9 Oct 2025 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orz/AtsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83549212549;
	Thu,  9 Oct 2025 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041261; cv=none; b=QijXRbR1cVEnmBs69t0WOqcXvShuTh3JrxIBd4NUqM0b2j4N0ARR5VsUikrWyRF9Et0nXI5d1lhZbogvyrMDAUI6IQrxsVsIlveyfwsOmX3W5w4r/Tuh2PqpeyrST2NC4L/JSgjhwlvj6c+YtuwIw527+VpZDCwpy35Po/X44NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041261; c=relaxed/simple;
	bh=aGXv2Pk1gOljG1ekFh588VDqSTo56s2dZdKfJW6cPzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3xrPPuU8a7sHJVXnstZoGvMfTgEg0e4CHWXtVyBF4JUZ500JOZN/k4Y1cljAFvMA51LcC614wp3PpWh1hB3XDx5FxMJtbAjD+5bZa1pQuvfzkyerB7pLOgStxpEDycNKMUM1w/rBo9rUTEaYculbITYa5zrHhmMp130lzApU10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orz/AtsG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D65C4CEE7;
	Thu,  9 Oct 2025 20:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760041261;
	bh=aGXv2Pk1gOljG1ekFh588VDqSTo56s2dZdKfJW6cPzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orz/AtsGM6gEQLKwHfX7n60y9MSGapSc45ur62ZtGrZGEq9iATmok6hqinw33rPER
	 KzCFSX8p0uMsP6AP4XaT6JmfxdOvwNLAC+18qsJXqAKr0jLU4I4J8rWa7zQ2OuFVWS
	 N9MxhXC+aHPI01Zsy47EyXyIecCP7FVvYybMPPdYvnhrs5a8A7YPL16KgVXVJ9ogDP
	 ltM1yqLBKLoDbvHJc18WhUg2HiU3PsnlY6cT0xnqs1wg8RRJQkDJKKO584KCJIB5xd
	 PwrBS/sg0ylF2vrPxuNQ/vNretFKYnjN+YebTr5aaeuW3bUratIC4DmQPPATNrxO3C
	 /TD7E8U9212VA==
Date: Thu, 9 Oct 2025 15:21:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add
 mode-switch
Message-ID: <176004125928.3290331.16433221750974859532.robh@kernel.org>
References: <20251006-topic-sm8x50-qmp-combo-allow-mode-switch-v1-1-3d79e7ea6824@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-topic-sm8x50-qmp-combo-allow-mode-switch-v1-1-3d79e7ea6824@linaro.org>


On Mon, 06 Oct 2025 15:51:53 +0200, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY can work in 3 modes:
> - DisplayPort Only
> - USB3 Only
> - USB3 + DisplayPort Combo mode
> 
> In order to switch between those modes, the PHY needs to receive
> Type-C events, allow marking to the phy with the mode-switch
> property in order to allow the PHY to receive Type-C events.
> 
> Referencing usb-switch.yaml lookkied like as a simpler way to allow
> the mode-switch property instead of duplicating the property
> definition but it causes some issues with the ports definitions.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on:
> [1] https://lore.kernel.org/all/20251006-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v2-1-3249e511013b@linaro.org/
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


