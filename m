Return-Path: <linux-arm-msm+bounces-18731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F888B46E2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 17:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 541FA1F2236D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 15:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842165250;
	Sat, 27 Apr 2024 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyVaS4fC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60701259C
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 15:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714232299; cv=none; b=uQe/8jKowc8+Io16OtJG6MzcXlWnUyWbZqrbI4rSz2p4wboPMxQRAPQWORWNlFlFj3M0Mx9tMbC3gptycMD7ABTs9XbPEnmZa0Z5tU1M4wfeRlen11lVw3Dn9uxy7HpMRetmUdoliHYqF8ysSaq5krrpxxycJngdXcrC3iiTTQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714232299; c=relaxed/simple;
	bh=xYHFz5PHb+gJPbbg4YbjtDLs7Ib7KvY4tHDLECwPqQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dw79oGyhBhM8wrN5WVBn0JtzhgrA2h8YFFZOHn/XkF3bnraw3fwaibqzvE7Z8XJ+7o4IpZMbaCob9QYGcqVpSHb5GzrT5tzOJ0oPRfv7FVoQMq+mFe9bwFSxJswI9p0qxLoeQsTHxdV9W/enwzxRztZo+m5+TmN+mv9shN3HDw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyVaS4fC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CDBC113CE;
	Sat, 27 Apr 2024 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714232299;
	bh=xYHFz5PHb+gJPbbg4YbjtDLs7Ib7KvY4tHDLECwPqQg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kyVaS4fCLch3ZjaIjmXHr1bxuIUeesKlceXCYwkqQes7S6zM0Qxb8r2drayXWUwkQ
	 8T2CUXFoMjDhUDF86y7XCGbf2g8/cEZj1cT4mPqimkI09k5sjBvAXM4nVPJX2Z4jA1
	 H8NqkYh/bcX2Rm4KHXEiX4h5kw2+nJ0XFh8IEwoGUHKxqbkXyMthtSEP4yl/U9mkcV
	 zOwpw68Nro8lazWtHJ2bEU0C6FzB3rgmchGpH4LQj4RPcVJakw6BWGUVakGkbP9jXx
	 AX24T14+PrTgmGexxm9aCHTwyRm3G8Tp+8Zz3j6gx6D4B7dqU7wD0LDjjPRb4MX9Lt
	 jl6WAAjiUVJ8g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [GIT PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
Date: Sat, 27 Apr 2024 10:38:16 -0500
Message-ID: <20240427153817.1430382-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit ecda8309098402f878c96184f29a1b7ec682d772:

  arm64: dts: qcom: sc8180x: Fix ss_phy_irq for secondary USB controller (2024-04-12 12:21:47 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.9-2

for you to fetch changes up to 819fe8c96a5172dfd960e5945e8f00f8fed32953:

  arm64: dts: qcom: sa8155p-adp: fix SDHC2 CD pin configuration (2024-04-20 12:58:33 -0500)

----------------------------------------------------------------
One more Qualcomm Arm64 DeviceTree fix for v6.9

On ths SA8155P automotive platform, the wrong gpio controller is defined
for the SD-card detect pin, which depending on probe ordering of things
cause ethernet to be broken. The card detect pin reference is corrected
to solve this problem.

----------------------------------------------------------------
Volodymyr Babchuk (1):
      arm64: dts: qcom: sa8155p-adp: fix SDHC2 CD pin configuration

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

