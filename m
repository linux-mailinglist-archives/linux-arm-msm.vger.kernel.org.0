Return-Path: <linux-arm-msm+bounces-14405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEF487EBEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 16:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBC0A1C2132F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC784F606;
	Mon, 18 Mar 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvLY8Zqy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301AF4F21F;
	Mon, 18 Mar 2024 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775097; cv=none; b=Qp/NKSxPw55s0jcBc1fG7N8kLQ0SrINyvWazzEcsBM2HEsnRl33Nv8FlAtUbf5j6qOHUH2keYEaHErrk3lpYtumVosyCp4hhZLbfyWz98qE7kEbh2pZxAM+k3cb0odMycdE0CxWz/0bIM5kBR4b9el13v+KgeyHREW+WQZZS+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775097; c=relaxed/simple;
	bh=H26MWfO5jVgxjJ1B98g+ecZU2nTEJ0XuYXpLUHFC5QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l/s4pEOCxYjYFM6hRjmUaXh4VjgmWtR1DVoJK+VyoiATgkVZtrcZWRbpwJ4PbCv0JlfyD1nkQMa3CMdhyiXTzf8rh0jagcmokBfW7wYUjErHSyQ4ioGn2oOrH6UmFGDBNw8fb1jusHOkQe55Ud3MdTHo0RasHs5hcpMN0INxkZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvLY8Zqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BDDC433A6;
	Mon, 18 Mar 2024 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710775096;
	bh=H26MWfO5jVgxjJ1B98g+ecZU2nTEJ0XuYXpLUHFC5QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LvLY8ZqySLCT+pOxVbkrxjFD3vNzHeKdU/rjQcUT8qSPkwnW7ZgY+hz6IEKBjND7J
	 4otHIlbmg18L7yKRWyJL0Oi4Z4RTw9Da1QwHj9NR5zAUz4IN5XskX2PWyl2ZnoAFwr
	 8a4y6bL/5MeOnlanI60DNWid0mrEs++LDNyoqV0Ab886YizV6DtGX5wFLEyIiYK0aT
	 Kmw5aktKLMLN4EzfADsyP02VDx+6vYgAbJNEh7s7I4zYUje78Mpj/1gyw8AN22hkRW
	 +lrGR05YQ5fZv/WTNChDlW5Z1biKtCjdYdZbZ6QYwhjnurCqXmxIXAMW/2mIhhoaEi
	 5REqK+OvuyMPA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Mar 2024 08:18:10 -0700
Subject: [PATCH 1/2] clk: qcom: Fix SC_CAMCC_8280XP dependencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-fix-some-qcom-kconfig-deps-v1-1-ea0773e3df5a@kernel.org>
References: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org>
In-Reply-To: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org>
To: sboyd@kernel.org, andersson@kernel.org
Cc: konrad.dybcio@linaro.org, mturquette@baylibre.com, 
 bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=nathan@kernel.org;
 h=from:subject:message-id; bh=H26MWfO5jVgxjJ1B98g+ecZU2nTEJ0XuYXpLUHFC5QQ=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKk/os2kFD9PORA9jfdb2rffLCvnfuOa/WdjjrD+LcvSB
 fsnzlyo2VHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmcmYWw//aian5PtUf9kel
 GH94euTIhZ0r61tTL2pYpDTUyc31sMxg+B/X+evj4VVHovccm8tww/3FlbbPm2Y2f+SZ2tTWGS9
 uysQPAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

CONFIG_SC_GCC_8280XP depends on ARM64 but it is selected by
CONFIG_SC_CAMCC_8280XP, which can be selected on ARM, resulting in a
Kconfig warning.

WARNING: unmet direct dependencies detected for SC_GCC_8280XP
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
  Selected by [y]:
  - SC_CAMCC_8280XP [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

Add the same dependencies to CONFIG_SC_CAMCC_8280XP to resolve the
warning.

Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8ab08e7b5b6c..b9ff32cab329 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -474,6 +474,7 @@ config SC_CAMCC_7280
 
 config SC_CAMCC_8280XP
 	tristate "SC8280XP Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8280XP
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc

-- 
2.44.0


