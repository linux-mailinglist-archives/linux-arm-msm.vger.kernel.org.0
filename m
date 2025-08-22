Return-Path: <linux-arm-msm+bounces-70247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B845B30F4E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 08:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7101CE5040
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 06:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5FCB2E5B15;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPerhmzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A282E5B01;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755845057; cv=none; b=alwRguJIfvevXWosfwvit+Gu22lOXrGPhm+aKQMSFazv/xg+/hwQPUf6pqMrIAx7S4hMKX1POU+UJusHSdMAC1HcQlLT/s7Vy0aSbw9z5kF+2Fv0bGJI4fr4wJlrpxes/dQYDvP9laHMtWp2Mfl0rLUbEHvf39C4jn27LG1hZi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755845057; c=relaxed/simple;
	bh=wWJSMe4mTNkFQJtPuNMErOaR9Hcax6akq527grewDaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DVJNfXw/ZK8leYxUYPobPT74Pj2PEDFsrVnkqbAJ7Fw6TKfELxOLsZhv7sr7rw7a9cnxURsi6f01bGjqaXel41WwgjeqWauB2rt7i6LppkUJdNOfUh6uJasITz1WCItt4dxkuloy+yoTzIP+If0taOv3MgMKFerzcIeRQcGzcqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPerhmzw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42721C4CEF4;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755845057;
	bh=wWJSMe4mTNkFQJtPuNMErOaR9Hcax6akq527grewDaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uPerhmzw/qm3AUhprM6KK4EJVJ+ylMl3UAceBLyt49EFzDcdcxAozJjKgixeXurrB
	 pHlsWQzfrBtOV04vkWdEFgmew0RCeS1Fn7l08TJqRiwDQ3Zfr3RixGCXcBllFIkm0q
	 E8CXU9hsemkNxbK2HTQ3grWZGo4TBomnn45rOmjRxKweTr/Z9hhiIjNfuuDdK7VrxF
	 I11/ad97gw3niDgK82nskOSOJZCZyVEYe+AC6WVW3PK9V2BsZAbNhRnpcarLb19zhr
	 wSzoYqHeSUozBY0+iRP/Wher18GrUjZ4YXhqT3Qr1WjbuWtrxuLgjGJU7C5IqpkTpi
	 ajcc1rWq/Qxdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346A1CA0FE7;
	Fri, 22 Aug 2025 06:44:17 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 22 Aug 2025 08:44:11 +0200
Subject: [PATCH v12 2/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-tb16-dt-v12-2-bab6c2986351@oldschoolsolutions.biz>
References: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
In-Reply-To: <20250822-tb16-dt-v12-0-bab6c2986351@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755845055; l=938;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=nAcBj2eAxxIhxFJdMW6aj0QHBCBVvicxAb6Q+N6TBBo=;
 b=IjotK5DT0hqXrCvbhX64eIJAkG+QW7hFKx4sOLn90kpy251SE87aEBtjr+rv0OEw44uSGjGHq
 OXQ8s4uu/K5BHNCWZ12bztIw26fKN5NQ2B8yOug7K/wuX9pSxstQRu7
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Allow particular machine accessing eg. efivars.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index edeae6cdcf311228ae4b193cc37d0ce9414606ba..6a0184e49114e2e32a76490e90f3cc971dd6999a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1999,6 +1999,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
+	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },

-- 
2.48.1



