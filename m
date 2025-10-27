Return-Path: <linux-arm-msm+bounces-79040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53519C11C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 23:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15FCA1A65453
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 22:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D08D33A00C;
	Mon, 27 Oct 2025 22:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+nTJjix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD7339B49;
	Mon, 27 Oct 2025 22:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604508; cv=none; b=Aj8heF/idfx5scsIyumInojqIga4IFFwHSc2EcVb39+EGI43WNVW0VDWO+7bF5/XeRg7QYU77Bo+9BBXLT7eDgIscahs/CuIgwhfuh8ayYvNq1sANta8Ple5IVIVcri5EWau0ejQW77oi0K2UffgIPmX9C/R7E5YPs8bX9fRn6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604508; c=relaxed/simple;
	bh=sUJnu0HMVxS0cmV68m63eNjRh5vrO4SC/23vlgZA3iA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H58W0QlgaZEzwiR5A8NISk+YreiWGixgpUGzm1P/KrR6nJrNixPdbDNfmFDxjpCGl8SHp8sN+BQaxV1mFfolB2cvgTvd9Yh/rR0yVOZpLWCBqIEh96TJ0g1ZXxcEl5PMu6+wulq20H/jVb5Od473sB73KX5bTy0VYqqZCDmLmrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+nTJjix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CDAC116C6;
	Mon, 27 Oct 2025 22:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604505;
	bh=sUJnu0HMVxS0cmV68m63eNjRh5vrO4SC/23vlgZA3iA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h+nTJjix6Clz4Lnyh5Bl86rDMHrTWl4SydyVABX+e/P/S6KtZjqChNCZeA4+7MzqA
	 y6YxpT+EcoahqN1wbTPN4yzhOSHbcP5vcLcjF4KT/inLBhoPrDPm7kvwVDFKImTv4V
	 Zn6TWQx1OmmZC9VXX7m+Qvd1X9D5tH80PA1QI+Xgu7sJgxXpAz9GzAD6r46Tb6tkMX
	 khbb2dxNtdkBb38EslbTh2gQ9FoaI2I2Kzj/15yPwDdX8gHmo5r5+GiY12W3xKv6D2
	 1wi8UbE26bQG77Tb/asPNdcRxlvSkjk+1Wt2WM7gkGPAsIRq1tLrjEwEzy9PRJDmw6
	 9X6aCHE68rjLQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] phy: qcom: Introduce USB support for Kaanapali
Date: Mon, 27 Oct 2025 17:36:58 -0500
Message-ID: <176160465250.73268.6711945830373383552.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
References: <20251021-knp-usb-v2-0-a2809fffcfab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Oct 2025 23:50:26 -0700, Jingyi Wang wrote:
> Add support for the PHYs and controllers used for USB on Kaanapali SoCs.
> 
> The usb function depends on:
> https://lore.kernel.org/all/20250920032158.242725-1-wesley.cheng@oss.qualcomm.com/T/#mb2e1260cf266638a56c04bc793f5fe9ed1b3b79d - reviewed
> patch 4 was picked from:
> https://lore.kernel.org/linux-usb/20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com/ - reviewed
> 
> [...]

Applied, thanks!

[4/4] arm64: defconfig: Add M31 eUSB2 PHY config
      commit: f5474a34080ed199d3dff2a7b2cd912296376598

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

