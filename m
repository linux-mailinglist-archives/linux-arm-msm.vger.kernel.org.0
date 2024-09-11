Return-Path: <linux-arm-msm+bounces-31501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E01197511C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 298041F27433
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E005B187355;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H46FJy2G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E1B1537C9;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055610; cv=none; b=TqG/HTjCc0Q3krtTa+q7yVoSZOIpoOjm2KjtYpSq5jz90au84HlYf/D2bQRa/cagUFBJFgR1SInVYjsEPQo6Lg2gJMOwKF3QP049Rab/xm1R7U/aWlgOiDdU08R8yR3e6yA702k7G5SYHmuo0qhOEfX6TK69Lo9aHR6d0VAafKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055610; c=relaxed/simple;
	bh=ndmPR2xBHC9S4nFnS6LHLpBPLv5VG0nJMeYk0IDgd24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgj3UBL52IFWI8tz3QQbscGQeThnHtWMTr7ozpUIV/MY0PDMfbKRhC37WMqvm36QEU8vcm55J0Vo3JOnvie5U/uJ2jh/9HLlZMd9IiWuT7Qoki3aJsUkOPklK8fp7M1Wppfu2RvhLu03splWBj+S7HsaF7EZp/EFJdGWkPhxLnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H46FJy2G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72FA0C4CED0;
	Wed, 11 Sep 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726055610;
	bh=ndmPR2xBHC9S4nFnS6LHLpBPLv5VG0nJMeYk0IDgd24=;
	h=From:To:Cc:Subject:Date:From;
	b=H46FJy2GAzAc7WS6DQ38/LD+iUt3Ba3vJz2UUmJXgcn66hHZK4Wn+lkK8yp8fexBG
	 XyfrhS6XAzYggPyNGp5HagtJ5tb/9/4NFJon5xeZDEAVrDqgp7f89cvrQvUDJYFNLT
	 MySPxOPq5aeSAZCOT5bNTdp5L2pNhyQQXxJDkdetyWTdcThtKEAtY73PTjDOFuq2p8
	 cHVOsh9WUJckk0XW4p7FJmO6SibhxY08xl1xBeT0yvue87LFh59mwcVvXWDvzv6P4b
	 JytD9uGv/6oLm5Z+tI3/ihug798HIiX05eXX7PICKW36Xge2Hrm/vcYTkK2D/p6inP
	 GNWbhvznpQR3A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1soLuu-000000002rK-2Jdv;
	Wed, 11 Sep 2024 13:53:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/4] phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
Date: Wed, 11 Sep 2024 13:52:49 +0200
Message-ID: <20240911115253.10920-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When working on suspend support for Qualcomm platforms like x1e80100, I
ran into a NULL-pointer dereference in one of the QMP drivers. Turns out
this issue has since been reproduced in two more drivers.

Johan


Johan Hovold (4):
  phy: qcom: qmp-usb: fix NULL-deref on runtime suspend
  phy: qcom: qmp-usb-legacy: fix NULL-deref on runtime suspend
  phy: qcom: qmp-usbc: fix NULL-deref on runtime suspend
  phy: qcom: qmp-usb: move driver data initialisation earlier

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c      | 3 +--
 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c        | 1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c       | 1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.44.2


