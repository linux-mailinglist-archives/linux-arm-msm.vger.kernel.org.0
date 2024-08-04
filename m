Return-Path: <linux-arm-msm+bounces-27868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD6694702C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 19:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DD5D1C20810
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 17:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023E81384B3;
	Sun,  4 Aug 2024 17:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nhg/20Vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD71D137930;
	Sun,  4 Aug 2024 17:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722793921; cv=none; b=HxL6y0ZBFgDocvJubB4eg02vmWEl0ul1mt7WOUyjlJEXTzNEdB1RNRzwfZYzfCBofIDbZZutNhhsMI8IX7D9DyiPlDaOB+v5I9ewh7KDrrXzk46jYvVfjmhYT9mJhlTyNi5cc9oXn1MQ3RTtMJZqzG9jj+tuhxA3k2SL81LViY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722793921; c=relaxed/simple;
	bh=LzsWllR0cNKFmCtgZ+62TJcAW9upQukY3YNbc8VuYSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j1gz2631ghl0+2jNafMVRr/EV/c+Pm+bu27gpECZLWqJggLxvauTQrHPJZYDSrlEYw+aOodRGagtjbIOCDuufU59psxVvL1Y5kLVbkmxloxTirkxyktRt/0qZCJwIyn0yIdMPLbjSi+qhEH55PZ5+CFjvVEcOflfCcTlu0aD0+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nhg/20Vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF00C32786;
	Sun,  4 Aug 2024 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722793921;
	bh=LzsWllR0cNKFmCtgZ+62TJcAW9upQukY3YNbc8VuYSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nhg/20VcPr8vXI2iZvSu/LuSE+GTN0uGVgdjV3dvCu+piG84fEBOLDDRxoSz4kyLT
	 Wj/hSAC1UZVNc7mgMxDBWrdcT24ISci36taphUrFPQidaF80w8rdE6xmvTa9Zx7f8w
	 Afoh+l8QEmSNdA3IdthBlgJCEk6KyP40upkw4smFz8AXpH9m5hvqidUruUFs3v136r
	 s6yDTGzvS/a64jjngaf7ywhj9I/Sy4cKA6CLKUNbfnbpaClRhquSMNZWw4NbPS1ECL
	 LpBNKRdXCgaHGkybZ/RmG8GyrMivz6SGcKkeuOTh3R+E1qBwMrfCswq6bahp3wrkGG
	 Yu0TgDJq/Yk8g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
In-Reply-To: <20240801-x1e80100-phy-qmp-pcie-fix-config-v2-1-cdc0f22b4169@linaro.org>
References: <20240801-x1e80100-phy-qmp-pcie-fix-config-v2-1-cdc0f22b4169@linaro.org>
Subject: Re: [PATCH v2] phy: qcom: qmp-pcie: Fix X1E80100 PCIe Gen4 PHY
 initialisation
Message-Id: <172279391895.406224.15086845328782715859.b4-ty@kernel.org>
Date: Sun, 04 Aug 2024 23:21:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 01 Aug 2024 13:40:24 +0300, Abel Vesa wrote:
> Update the PCIe Gen4 PHY init sequence with the latest based on internal
> Qualcomm documentation.
> 
> 

Applied, thanks!

[1/1] phy: qcom: qmp-pcie: Fix X1E80100 PCIe Gen4 PHY initialisation
      commit: 0e8a0504da59041e775a95db3ebc1a6211423593

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>


