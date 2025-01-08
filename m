Return-Path: <linux-arm-msm+bounces-44380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2076FA05CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FA183A4D19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBBE1FC10A;
	Wed,  8 Jan 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV7hB7Uk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4C1FC0FF;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343572; cv=none; b=l9EXY+jqd0dfwfyI+WuBCIjhzKlfzVF30AooQY/3XNib9nL6u+Nv1Nxz6OqLnk0xk05zWkt+lw8E4tDpl70qAeQvZHq8guL1I/Mwg8ih61aOFK/hhzLe/ZrmkGYfiCadqCq8cAv8RXHfzao7pqe6UKbvMyZ50OZEthQ+76a38fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343572; c=relaxed/simple;
	bh=4r45CBYevJCU4R4Er9l1ZcNs5c3/H5PCLL4UP6si+F8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LqdxcqOCHgMLWD68Acvlb6cJ6h1PhLjDrS/vCJ0KZNJVstiaTsDMYix4x/r8DejXhfxv81Wbu18uwu5OpJnY8e7uS+xSPhKDG73pgwtZA+gtG5ThjJlou/jvLJKnFW4A4kU0hCcnPLr+7JYDt3d8VoZS4Vq+qNcxUbs6NVpz/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV7hB7Uk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8092DC4CEDD;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736343571;
	bh=4r45CBYevJCU4R4Er9l1ZcNs5c3/H5PCLL4UP6si+F8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LV7hB7UkYIm+wgwgDKgPiE+A0k6myqy6oYURTt9EYEghPTcCW+Gl2g+7IRTcFFbbu
	 x5LncWJX9pwS7QUMWanMIPPo6WomnZcMBZlnFqTXCLbJq7MoXOzixFqIIcgLOjrx0Q
	 aCs50sFfnrtmYlXuyaEpRY2A0to5wC4o0PnvUKF6sHK/sZfzp8lvsiwdRh8H/qqkch
	 Zvjlt4JK6XiYc8SBJX8skCaR1UKC4CfM9TMHZwJCsx7WUplY+hYC64ZXp2DQJC3wE0
	 0RwokyWTK9ps+FS41+A4waQAP585mqUgVUEqrmkDM96PGdqF3zV/zIeArEay2bMOWK
	 jiQ0nLkdCgImw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2EDE77188;
	Wed,  8 Jan 2025 13:39:31 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/2] bus: mhi: host: pci_generic: Couple of recovery fixes
Date: Wed, 08 Jan 2025 19:09:26 +0530
Message-Id: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6AfmcC/x2MQQqAIBAAvxJ7TtCisr4SEWFr7iGNFaQI/550n
 IGZFyIyYYSpeoExUaTgC6i6AuM2f6CgvTA0sumkklqcjlZGExLys1q6xaZtO6he21EZKNnFWPS
 /nJecP/3Spx5iAAAA
To: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=4r45CBYevJCU4R4Er9l1ZcNs5c3/H5PCLL4UP6si+F8=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkivaxCM+1ymbOnoteVZ+B2xnzGu/UEGFasDQh3SJ6Usf
 MTjeTCpk9GYhYGRi0FWTJElfamzVqPH6RtLItSnwwxiZQKZwsDFKQATcS9l/6ctxylhqf7W8uu8
 RDFdWQ6+PNvt1UydlflLNrP8ZDxqqX9kuUFN1XFrndCgrflNBhx/TDaLGnQ1HPvNVv/TJSs8Y7n
 thYMxolZL1LessPhsbWujY69tKnm9ccEuj5pLbctPb1daYrj/9ibB13dlbk0w3iZeX/ZqWsGd6R
 5Xck0XrFvtUOfNem9SZEwBZ8TGiibHL6eWHPM7eLpLiaNKtPhysols64aG+uqbF43VuN9ZeTpxd
 fXxHpNLMXp2utHrQVUrv2Cx2dYy00Km9qmZaRuUIjnPTvMPmvrvz0btloOHBHYZP5Hz4I3YvNpT
 TUB9pTTjghcvb6bNL1sZmBnhtbh4IYtblcAX6dev+a4BAA==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

Hi,

This series fixes a couple of issues reported by Johan in [1]. First one fixes
a deadlock that happens during shutdown and suspend. Second one fixes the
driver's PM behavior.

[1] https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (2):
      bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock
      bus: mhi: host: pci_generic: Recover the device synchronously from mhi_pci_runtime_resume()

 drivers/bus/mhi/host/pci_generic.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)
---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20250108-mhi_recovery_fix-a8f37168f91c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



