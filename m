Return-Path: <linux-arm-msm+bounces-24854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CC391ED59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 05:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22FF71C21157
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 03:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5222117C77;
	Tue,  2 Jul 2024 03:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLmhcnqK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF6E8F72
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 03:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719889918; cv=none; b=NZckxh9HZkyASe3O21uklO+0T/s9N76UZxjpUTj94hxCzRzKMcOvYLwZjHjwaBBWxzmtImWnmI5yMRiToIVkvkfwFuP5hzyCZ96fsQIolyd9oxs5FSX+B0Yzvon1jYVsK9a958T3xHA90DuqAvTgpH/4KNJBmEwMy7Q66hXkgoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719889918; c=relaxed/simple;
	bh=rQ9OFZQ4w+40SFlsEVI/V8sScA4vJb+vQGJa8mrgoEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnUV5UMXRBnrnj2z9TrIHNKi7u7Y2G470wWIbtcBsTLIU5T+ChaDakLkHHhXG4R2Fnl/PmeTimslrWoVRXej7aUpzTm/rtbX2StfU5xgMXH00KRerRTZgjgiqyts8niVYnr5pbj//gfW3uKRNUSd+9j50ZAXSNUYtE1Ud5wTI/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLmhcnqK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12330C116B1;
	Tue,  2 Jul 2024 03:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719889917;
	bh=rQ9OFZQ4w+40SFlsEVI/V8sScA4vJb+vQGJa8mrgoEg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=RLmhcnqKpM/NtO35OERsp+aqF9u9YLBU1qnodFiSC0Ir3lQvDJQz0e0nMQQrbTRL9
	 ufjltvDuMval78x3T1C0cTGoatVc2r5PwlDUI2v0OtAsd0CNhOFYaL8oh+HH86WXFt
	 n/MTVlIsdVJmsQwKcPPvRjAwpgrT/3QhmMMF69jEu7mdzystcY6qP9YMYZiKjYcePR
	 3WenT+GyanNSHP5ZW+2ey/IcZfG5+9XwdeB8cedqgNMGgpfQn4P5LwgNs5Ous89RQO
	 jYDoe2PllsYg/i8n4DUW7h3IrfmwWqokHzKvsvcqxc6fcdyoIb8ZFnYfVhk/6grR2x
	 6SayiX65gjnfA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [GIT PULL] Qualcomm driver fixes for v6.10
Date: Mon,  1 Jul 2024 22:11:56 -0500
Message-ID: <20240702031157.341031-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.10

for you to fetch changes up to e227c11179dfb6970360c95a8d7b007eb3b223d6:

  Revert "dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries" (2024-07-01 21:58:27 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.10

UCSI support is disabled on SC8280XP while being debugged, as it's
causing the system to crash. A recent LLCC QDU1000 binding change is
reverted, to allow expressing the LLCC memory regions.

----------------------------------------------------------------
Johan Hovold (1):
      soc: qcom: pmic_glink: disable UCSI on sc8280xp

Komal Bajaj (1):
      Revert "dt-bindings: cache: qcom,llcc: correct QDU1000 reg entries"

 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 +-
 drivers/soc/qcom/pmic_glink.c                          | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

