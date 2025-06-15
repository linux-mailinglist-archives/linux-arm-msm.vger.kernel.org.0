Return-Path: <linux-arm-msm+bounces-61324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD42ADA2A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 18:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA6B2188EF8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jun 2025 16:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895C427C863;
	Sun, 15 Jun 2025 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="httPnnPA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDA127C84F;
	Sun, 15 Jun 2025 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006332; cv=none; b=AEYXELd1M1j0mRGQGPudqqaIgWhNuAxd6d/lARXG9vpxw8JTKTx0rnbBEdSLTiSoW3ocEMRibXjKSy1RILvuFh60r5TJREbSTxQryNgx/FHg+wT97XJxMSjo1Bplu2H0P5eUKpNaynCxWu/P5b9ExEnc5jLuWJJ8hV4w5xly2sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006332; c=relaxed/simple;
	bh=mijlUDV/jgZDSVDW216PIW1ZCR6wyRfjOlPnIPkNLlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EpKYeU6cBvV52ij4I4cW9zwwFUvptfN0cdliO1qI9QSsyYddU9PX2HJRnG4KFsE87pH8kmGptgkEsUp6QfO2owroYNZQniWR2vyZ8phD5OLyN6tqp6XQ0rGcimP5ZBCptue9vS9l1caGSRNWeVeuAjyiFtlIPbAKgWXIP774Rmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=httPnnPA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93266C4CEE3;
	Sun, 15 Jun 2025 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006331;
	bh=mijlUDV/jgZDSVDW216PIW1ZCR6wyRfjOlPnIPkNLlg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=httPnnPAwmZoCek9wtrkG0ODf/wyRtOgr9hMWHFBhpVuR5rD/p8KJWHtp1su3YYZZ
	 HJSaXm20t/ywqqfHB8QtgYTiJsW6XI5wlwNaVIlblRZxmIX+3jHOhO7d0C8n3q6tb0
	 LDfJnknInLON+K89WRN/8kFFyn+7VeJGOQJ7SYk2WOFDWRW6O2MNkhsM/Dbko5BLCx
	 kE+Ru+Tylv3z/ZFS4TQNyNNKQxMIhmT97xz0FJ69hWQhvnGofdcvxCR4HAxnxwBHWg
	 zFcLifzeUTr5qBjp5f9o5y8XlAxX9dSYIE/I7QFiqcD4V5X5UhpmSsLOfPAdLpF5W4
	 CBkuxoc/kPa+g==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
In-Reply-To: <20250605-phy-subinit-v3-1-1e1e849e10cd@oss.qualcomm.com>
References: <20250605-phy-subinit-v3-1-1e1e849e10cd@oss.qualcomm.com>
Subject: Re: [PATCH v3] phy: use per-PHY lockdep keys
Message-Id: <175000632923.1180789.17293154013004418524.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 05 Jun 2025 14:25:49 +0300, Dmitry Baryshkov wrote:
> If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
> repeaters are represented as PHYs), then it would trigger the following
> lockdep splat because all PHYs use a single static lockdep key and thus
> lockdep can not identify whether there is a dependency or not and
> reports a false positive.
> 
> Make PHY subsystem use dynamic lockdep keys, assigning each driver a
> separate key. This way lockdep can correctly identify dependency graph
> between mutexes.
> 
> [...]

Applied, thanks!

[1/1] phy: use per-PHY lockdep keys
      commit: cf0233491b3a15933234a26efd9ecbc1c0764674

Best regards,
-- 
~Vinod



