Return-Path: <linux-arm-msm+bounces-30795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 206DB96C7E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68BF1F219C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 19:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0D81E0B7F;
	Wed,  4 Sep 2024 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7F1mgTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7508340C03
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725479309; cv=none; b=LbCuSIqSixGd+c8HB36FEdEXUhT2SglJzan0uTK2x3h2xvyVbwOTxhVfKQdZb9uyaJVwwD1ZgDvDzsqPuvMWK8TFbiVB5Y5Q32KLGqUORCpkVPAUiNu82PQawxmwJBtRlJNYPCj1TkYPa0w8KoW6NXQtLo275L9leozHKmo+3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725479309; c=relaxed/simple;
	bh=xsUoScYxpzbryo8iIoP5ta/J0lMeuRcpjTj8DGoTEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NpjPk7/wYdlL4kA1UamX9bhSh84pTWLYz1l3E2GMF9btTfrbdh2YcooZT4KBxDBZqkRoJFjdRFjc8F/nUR6TAGyJLgtMwg2nmqHJzZscP90h/88qgD5IHO7UAsU57NXtasEdaPsNwwJX0XEBslSu6YsoF9VKBPmpYit2uISjg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7F1mgTO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91834C4CEC2;
	Wed,  4 Sep 2024 19:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725479309;
	bh=xsUoScYxpzbryo8iIoP5ta/J0lMeuRcpjTj8DGoTEkg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=i7F1mgTOPB890DROpc3kKie4GXlWiZn7dJNiX9yBwyTdw6G6h+ZpfHWtborT42zre
	 lpSqxbW2hzMU7zAo1aZ52sUKTZpND9CCTqfhgkiXdmrpZbTmwPUFAIzf5I9MARuNyN
	 RzqkNnTIusy1sZw8zaHZOlfX46LkXVh3B1mr3Q4N6cbTcsyf4aJXS4EDEKL3GYapts
	 uxV2TSAzE9rU3YB4ml7lOR7/jqsAseZxCdZMXx6MdG6RkjjLFem3OhzXHmBK0Iu3fn
	 +gT7w8c66G/BkTgMHIOgrwz9K9/SArh+Czbkmi2Qrm7bYne4bBV+tiIJrDDP5ZMCq2
	 9bavCc/u0r/yA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.12
Date: Wed,  4 Sep 2024 14:48:26 -0500
Message-ID: <20240904194827.16766-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.12

for you to fetch changes up to 115c14ee54aae1d61d2405f9b31f67c1e8947f4e:

  arm64: defconfig: build CONFIG_REGULATOR_QCOM_REFGEN as module (2024-08-14 21:51:08 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.12

Enable the Qualcomm refgen regulator driver, being introduced in SM8350
for DSI, as a module.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: defconfig: build CONFIG_REGULATOR_QCOM_REFGEN as module

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

