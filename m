Return-Path: <linux-arm-msm+bounces-51548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1785A636BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 18:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AD4E16B144
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 17:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12AD1A5BB1;
	Sun, 16 Mar 2025 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3igTbET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C694414293;
	Sun, 16 Mar 2025 17:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742145595; cv=none; b=N3+hWXvkEBpQschSY4f6XEto6knMLGHtT5dneFxLuweBDxbmhhJXmDQ+4tOzq6x0GfQjAJ85QspvtjYCBmrBBn2KHqXrowyFNMKCmnIu6dMDYI2pw9VfGGi8u6muJJbqXisYcJnBY/+O74LKd5Zx7nhhRFqy09oi0+mhfR4st3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742145595; c=relaxed/simple;
	bh=aU5p9VZBVUIRGQ24zw6cC9rVZr9NfS1kV/DgNW+x3HY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QUJEfWkIK63LOHVFUqLz12JsvhfW3S+INoVGaMvYp363GZ1HzhFBHsphzuGkYTrUJFxFkLS+Srpl/NkMCydykPKlIqIDnmDAbVsevJTEr99XaS/iiHWacMsZ8SL9bPVy+n9lxEhsD0dFUgTS8SPttp5I7sr6Z+JjS0DCRZc2+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3igTbET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 742FBC4CEDD;
	Sun, 16 Mar 2025 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742145595;
	bh=aU5p9VZBVUIRGQ24zw6cC9rVZr9NfS1kV/DgNW+x3HY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B3igTbEThuXfTKHdtACi9Er7XRwtqGPSEv09Eik8p7cCkQqzWHvwW8hlHYuKa+311
	 XBCN6pjCWUBebeW48wIcnsCi9L/eHAl7v0sKSin7m/3Us+uVr0R0/1/6eRHDURetQS
	 7kODqzoJhq/A4W/w/zNcoV32O88VawC2MbiUusn9koTS7tlc/MeKptNUxQBcI/RY54
	 BJFJ8EtvrdQSHmgziMmpNQMod2aA1F7eN3O7UpgZztJAmyME8AlGmz80uIMEe/ZTPz
	 O3YCeDl6nFL8x3z/mmM5TSXqn3CBEIyZ7m0bysLs+UgINDBlCppPCcwa3YeBb/hTeY
	 UX90o/5tX7hOw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nitheesh Sekar <quic_nsekar@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250314154915.4074980-1-arnd@kernel.org>
References: <20250314154915.4074980-1-arnd@kernel.org>
Subject: Re: [PATCH] phy: qcom: uniphy-28lp: add COMMON_CLK dependency
Message-Id: <174214559205.644495.6951036619496371457.b4-ty@kernel.org>
Date: Sun, 16 Mar 2025 22:49:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 14 Mar 2025 16:49:10 +0100, Arnd Bergmann wrote:
> In configurations without CONFIG_COMMON_CLK, the driver fails to build:
> 
> aarch64-linux-ld: drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.o: in function `qcom_uniphy_pcie_probe':
> phy-qcom-uniphy-pcie-28lp.c:(.text+0x200): undefined reference to `__clk_hw_register_fixed_rate'
> aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x238): undefined reference to `of_clk_hw_simple_get'
> phy-qcom-uniphy-pcie-28lp.c:(.text+0x238): dangerous relocation: unsupported relocation
> aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x240): undefined reference to `of_clk_hw_simple_get'
> aarch64-linux-ld: phy-qcom-uniphy-pcie-28lp.c:(.text+0x248): undefined reference to `devm_of_clk_add_hw_provider'
> 
> [...]

Applied, thanks!

[1/1] phy: qcom: uniphy-28lp: add COMMON_CLK dependency
      commit: be8f23cebdb9546beb30ad15ff59130b66c8f2ac

Best regards,
-- 
~Vinod



