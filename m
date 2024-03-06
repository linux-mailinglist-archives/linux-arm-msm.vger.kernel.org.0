Return-Path: <linux-arm-msm+bounces-13394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF2872D77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 04:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 785091F2105F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 03:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBDC125CC;
	Wed,  6 Mar 2024 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CrQrIftF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B915A11CAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709695282; cv=none; b=YqrW9ZcnySfdVaEvQVdcir2obq/wSZUQdcMxtOHyMqIhKudATiD6vEARkj1I+0fHKOz4FqK++fW/57Mx2FM2bsANDww8CzpChx/IjtPIcJoCsQHeNsFWx7V/yQmjHVa8iSOr5wlVtEKDLXtTiW6DHxNMOF+ui59z3VRHSCUHXCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709695282; c=relaxed/simple;
	bh=E5zxXMhNbVOuKkoMUrPi24dzKJhgYiBdLiPwr2w2eZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KtKizMRSkrD0C32fjXPIpBdupQxtSmE4I7EZ1PsiUeS69I7mmt1fEPiGtWTPERMuS8kw81rOjByDuOzQxu8G+9r5pru6JRkvU2O0s23PjNFAXKz+KnILj9xt57Vo7krf2z9m987L6MQGxqGqz1U9iXC6bUwwTSL9LK2pW5Ypu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CrQrIftF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D22C433C7;
	Wed,  6 Mar 2024 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709695282;
	bh=E5zxXMhNbVOuKkoMUrPi24dzKJhgYiBdLiPwr2w2eZg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=CrQrIftFP2vfxDzbe83FigYnsWdtsFLK0teNGYDP75eLLHcBvY83PPrggWXiynPgW
	 4Vw7xJnxC9+lps5zII09BB6wTUDJNRkS1i7he7tBgYhnrWxFTieLJZLjN1Qu/rOOrg
	 DPfI4420rulajTSvAHGUmKWqnZ7ygLml2JsksGcAC0sH6dIzOdUXQ77sIuWJO3PeGX
	 SupB+Yv23QSWOxFXnISxITTw7A0XqNf4SaKBx+1qz5NL4z9rS3EC6PBwxc8H2mAylP
	 ODyFuTWiwzs4bgkI3HV8XDosu/22amiunXIQJBtw5kni71W1CztJRz9Oo1iqHlOfmY
	 xPegK06aFA00A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] A few Qualcomm driver fixes for v6.9
Date: Tue,  5 Mar 2024 21:21:19 -0600
Message-ID: <20240306032120.5036-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit aa05f47474c02d38d88c32c633a551911c6fdc40:

  dt-bindings: soc: qcom: qcom,saw2: add msm8226 l2 compatible (2024-02-18 22:52:55 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.9-2

for you to fetch changes up to 9f378a62164cfe218b5a355696464d93b132edfb:

  soc: qcom: aoss: add missing kerneldoc for qmp members (2024-03-03 20:01:51 -0800)

----------------------------------------------------------------
A few Qualcomm driver fixes for v6.9

This fixes a "defined but not used"-warning in SPM driver when kernel is
built without regulator support, and corrects a couple of kernel-doc
issues in aoss and geni-se drivers.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: qcom: spm: fix building with CONFIG_REGULATOR=n

Krzysztof Kozlowski (2):
      soc: qcom: geni-se: drop unused kerneldoc struct geni_wrapper param
      soc: qcom: aoss: add missing kerneldoc for qmp members

 drivers/soc/qcom/qcom-geni-se.c |  1 -
 drivers/soc/qcom/qcom_aoss.c    |  2 ++
 drivers/soc/qcom/spm.c          | 12 ++++--------
 3 files changed, 6 insertions(+), 9 deletions(-)

