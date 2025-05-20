Return-Path: <linux-arm-msm+bounces-58589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFB8ABCD75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4813D1B6504A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B3B256C9D;
	Tue, 20 May 2025 02:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfK2tGrd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D7256C95
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 02:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709481; cv=none; b=IyEmri2oSjoXq5VxghFe70/919zWi/QX7eDBAPf8q3AbZ1NDzd4jgI676NTGMpCXZy1FRw3nLL0v+KDcDmTmCh7XHSespqOCxMio6OgI7m52MD9xDFS5ao9kAL7mKkyn9sdv4rFVNSJsMQvBWQSVsi2VXRufy5B888ksEih3iro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709481; c=relaxed/simple;
	bh=kg0UYLoDLGn0kLuXPSoezYQoD1VnTY7WDm8SYnPDd2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqT9WwARU5j/5UUvbDJk7vC6JJMWFNsAHQFeZ7XnPY/n7AwlG6oqW9yS4rQ6z2/Mc9tYi9o0cRkxNa+UxYoAMotw0abrLXZdH43/88ohhK2gD8kI8R4bzEDbBla+Pc+CFZsMT9pb+NgJI2NuTJ54AVoLve+J+Gd+41IUHVlHQcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfK2tGrd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D6C4CEED;
	Tue, 20 May 2025 02:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747709481;
	bh=kg0UYLoDLGn0kLuXPSoezYQoD1VnTY7WDm8SYnPDd2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=VfK2tGrdS9n21qxpoc/YdKOwpQDLsbCske6AL3olMAaMl/8rUrEbzivN9OBVoCgXe
	 iJ6OnfSwV7HSTyAH2O3tI5Aga/Ys3QqPxlJ6a6NU5tHaf4eNpYN03lBNXJmsgfh+ZU
	 gm0gx8MmBRBfg/Vr0QoPY/8stMlAPxVerz2pM6qvKlmMhiT7hE1ZTp3BSuKx0xIRNE
	 NSj9GM7RrFYIGc33vHjgwty5QREPJwP8ZPVxX+SRS3/5J9EcHe5hCBQW+sfCSEKTPb
	 oljE3UGHJA3ZTv7ipQZYvHp9rTrrXVww6bkePVN3vlxUaT5FVLh/M3l9q8hZMWccU9
	 FAxWAU7jQMe6w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Subject: [GIT PULL] One more Qualcomm Arm64 defconfig update for v6.16
Date: Mon, 19 May 2025 21:51:18 -0500
Message-ID: <20250520025119.40021-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-defconfig-for-6.16-2

for you to fetch changes up to 4b77122818239bcc05995d0234491b91c8cd477f:

  arm64: defconfig: Enable IPQ5424 RDP466 base configs (2025-04-15 21:32:24 -0500)

----------------------------------------------------------------
One more Qualcomm Arm64 defconfig update for v6.16

Enable global clock controller and TLMM pinctrl drivers for IPQ5424 to
make this boot.

----------------------------------------------------------------
Sricharan Ramabadhran (1):
      arm64: defconfig: Enable IPQ5424 RDP466 base configs

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

