Return-Path: <linux-arm-msm+bounces-30073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B443964E66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 21:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B30291F21B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E39F1B8EB0;
	Thu, 29 Aug 2024 19:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usRpcfiK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C871B8EA2;
	Thu, 29 Aug 2024 19:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958338; cv=none; b=N5cwj9WD9jHmmqSiq46G3HXjZydVMby5EtjMAlXqTYWmMouJ3x4gdaXrf9uOX0AftSA1lmk2xtJgEl3RMLgGAC6xzh1nr9I6PhWEmq3HlCggAEtbjQvWqJF3Y+PB6hitMom8QaZLyvsGgomQaaSx0DRYjyPu0+2q2Q8d0w0UaXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958338; c=relaxed/simple;
	bh=MpnuUdKQNVAmcPif4oi/37Z3FKjtcDApW7eyDZ0ImU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nc2F/kQocbIi5rorYeXmGhEPNCyriN94pS06ibW97xssOmzbH1g7f4yLqU4usStrKhVoUktPcB4Pb1/24O97OkHt1WW9rMfGH1mANhYF/UfViq6JQOwxl/TpAHah7h//dHvumERBR6i38//2Es8UutwIaV2NIKGHW2Eu1tNDqnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usRpcfiK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F50C4CEC6;
	Thu, 29 Aug 2024 19:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724958337;
	bh=MpnuUdKQNVAmcPif4oi/37Z3FKjtcDApW7eyDZ0ImU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=usRpcfiKqE+lIT3H0R1NYyGzY8Tw+yexoiSMQgOENbHW/jjOHVEfQBw5Bn9TduuRF
	 AFFn2AiDypTb1EhMiAgf7MHA5F86xgJBgOL+5WSR6QaZiGE0DA5i1s40Mw/sAVNKca
	 OnEBXR/xb1vf3keFNvzuvRPbD5cMfpSu5xNlLgFKYGTN3L4isBpkG8rLQAdX8H3qOw
	 eO4H1D1/3nQ5E4y8X2ih9jwPUODGbCdyGFKKyBvCk+wxi+7ggTBivwyWh2lo0ic9IP
	 kk05JijMPCCk15N1D4VSQ/xWa8Z+LjrD1TT/GJ8YfyriS1tM1MPpFFLvs2Pk/DFLy5
	 VJnEko7ut7sfQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>
In-Reply-To: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
References: <20240823-x1e80100-phy-add-gen4x4-v3-0-b7765631ca01@linaro.org>
Subject: Re: [PATCH v3 0/2] phy: qcom: qmp-pcie: Add support for Gen4
 4-lane mode for X1E80100
Message-Id: <172495833400.405683.4328817324548517864.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 00:35:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 23 Aug 2024 10:04:14 +0300, Abel Vesa wrote:
> On all X Elite boards currently supported upstream, the NVMe sits
> on the PCIe 6. Until now that has been configured in dual lane mode
> only. The schematics reveal that the NVMe is actually using 4 lanes.
> So add support for the 4-lane mode and document the compatible for it.
> 
> This patchset depends on:
> https://lore.kernel.org/all/20240805-phy-qcom-qmp-pcie-write-all-tbls-second-port-v3-1-6967c6bf61d1@linaro.org/
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Document the X1E80100 QMP PCIe PHY Gen4 x4
      commit: 0c5f4d23f77631f657b60ef660676303f7620688
[2/2] phy: qcom: qmp-pcie: Add Gen4 4-lanes mode for X1E80100
      commit: 9dab00ee95447b286ebb0ada3a5edc00beab3750

Best regards,
-- 
~Vinod



