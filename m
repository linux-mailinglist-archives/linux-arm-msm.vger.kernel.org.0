Return-Path: <linux-arm-msm+bounces-14406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FC87EBEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 16:19:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA681F217A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09734F88A;
	Mon, 18 Mar 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTU4kMZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C8F4F885;
	Mon, 18 Mar 2024 15:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775097; cv=none; b=JOSkgR0GtwzNeAJ2PvkH01jCKnBGBQHTTKaSsY0Z8oXWj/5hfjK2Z/UHpgxQDZZF+63pMaYxibLh+o2iBOhCAp/FW9fnuTFJ8G70lYGEV42PEpoUM7vM1rc+wjL8uMkcJ8q3da6iKeXejNiI9Wx5O1hPp1Dys+MvSN527oLExZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775097; c=relaxed/simple;
	bh=iLq0ODUVhWKAlhpOf2MZawBVWWPjQNgjV7L54rHwI6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQhEmUDNWSWZ9BImquUoNBel15Zb05yLOeuhx1ZkLfuo7HJMiWcgL0vVkoPbnH6x7MESqAr9ttxxHn6iS7RvTP9XPgo3oUw876SLifyNbzd9tW8r4odLv2yaxEgz3aGRguhSFv9nqKMvCZLF/E5mTdK3rUGqYrYnmLdmD53HUQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTU4kMZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3885C43609;
	Mon, 18 Mar 2024 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710775097;
	bh=iLq0ODUVhWKAlhpOf2MZawBVWWPjQNgjV7L54rHwI6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MTU4kMZ252OdiFrJouLBnkLBQBqWwpQRdM393y8ue4op0jUnajm/28qib4vzJ/ys5
	 tg9AJFJyfBHzY5sfymG+ilyOZ+E5SN4cXWIsiGiz95pOF+pq7wob84WkGEQrk3KmuJ
	 /6kjUBheZG6X11QrCxwnqRv9yyf4yv1zs5U1QOLluMKO1mJZOm3HsP332+SfCabS26
	 R6UoPCxQe+3ZTEoKAzX9JM3eIj97UUmqSWkv7G4bhOLH1VVt1qoALU4+uW+zgI/738
	 KenXDZFsu/Gwy6g7vb4c2erDNsXWuQqkb+gHePL2caFwdq0Rt92C/nAKhVSsHehuRu
	 uiZkaBcxX6uOw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Mar 2024 08:18:11 -0700
Subject: [PATCH 2/2] clk: qcom: Fix SM_GPUCC_8650 dependencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-fix-some-qcom-kconfig-deps-v1-2-ea0773e3df5a@kernel.org>
References: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org>
In-Reply-To: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org>
To: sboyd@kernel.org, andersson@kernel.org
Cc: konrad.dybcio@linaro.org, mturquette@baylibre.com, 
 bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=nathan@kernel.org;
 h=from:subject:message-id; bh=iLq0ODUVhWKAlhpOf2MZawBVWWPjQNgjV7L54rHwI6U=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKk/os2zGqz5JS8trb5R86xjG8MBU/kZQkt4/PsVw1jnh
 DlerF/eUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACby5iYjw5XqM83lsg/nn5y1
 znHDPIuGHwk3r58PvJrsmrJLtmXWwluMDF9O7F4coZyseZvxlry6sfKs2uBepVUq3zgfznbsmiH
 Izg4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

CONFIG_SM_GCC_8650 depends on ARM64 but it is selected by
CONFIG_SM_GPUCC_8650, which can be selected on ARM, resulting in a
Kconfig warning.

WARNING: unmet direct dependencies detected for SM_GCC_8650
  Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
  Selected by [y]:
  - SM_GPUCC_8650 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]

Add the same dependencies to CONFIG_SM_GPUCC_8650 to resolve the
warning.

Fixes: 8676fd4f3874 ("clk: qcom: add the SM8650 GPU Clock Controller driver")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b9ff32cab329..1bb51a058872 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1095,6 +1095,7 @@ config SM_GPUCC_8550
 
 config SM_GPUCC_8650
 	tristate "SM8650 Graphics Clock Controller"
+	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8650
 	help
 	  Support for the graphics clock controller on SM8650 devices.

-- 
2.44.0


