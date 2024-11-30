Return-Path: <linux-arm-msm+bounces-39738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EFB9DF2C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 20:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B471328140B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 19:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8717A1AA1FB;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhhObjV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A41A9B42;
	Sat, 30 Nov 2024 19:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732993738; cv=none; b=bK3F8EJ1TaGmk7PQQ3YvGdR9keq1qlYInmHCD2kzFQDe0Pu8tLV5q9Iu91rxhd4mLp08B4FARnKOev6LU5rxybgrEKgLt0NFhzukIbKSWkIwMGTWNmom0zKtfdUfrMAydSAJDSJdetNQaQ5GAu/KFTCgxg+i2B1RVFixaFNvFgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732993738; c=relaxed/simple;
	bh=COLrg2AbV+4KaQRU2Xw2S5L8rp55JjS366Yv/REeB7o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0egbBPxmMdVDR7vg8PSz+a9wTYhNjQNA54jtWsZDCeXQ59JpdiJC3mTMfA8Hi3Q981vequa4Y5tjNTl7wZiPhFNMc1sf4mZr0MhsLBrwRDyi0rs5y3HPiLgAUFK5WJ1z5CGlJ818QpDgQ5kQh2q8nrKtdNqPlfu1UQjujEcCZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhhObjV8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEB97C4CED3;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732993737;
	bh=COLrg2AbV+4KaQRU2Xw2S5L8rp55JjS366Yv/REeB7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qhhObjV8Agq1RVuZLApCE5YRrxz9fbAaeoQ2nLXkG2I83MHph/tvlug3c38sU1Wrc
	 DPwmsZPujKtGymMvLTrP3qax+JASEGmXvH/+EvsOhLty/AlIePafDWhysPq9IkzZAI
	 s/QFQ4INuMpcwgRyzZTTlg6iv46pMDV+gTVNZJH1INXhOz4ZYfJ6ZYMNMbrXwsx/2D
	 tklmAM+NORuhfhbB6t9dlhAqvJEt/5sipsyZmPaMLS6NO/YtkQtLSuBo+BszOILE/P
	 0/ilD18MPrAA132NSGA5TDuQ6NE8zGFGIpq8oLJUNpL6ydx5POZGKulfFGlsOqfRYP
	 OSeyqMhpgUH1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4F3D7360D;
	Sat, 30 Nov 2024 19:08:57 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sat, 30 Nov 2024 20:08:53 +0100
Subject: [PATCH v2 2/4] firmware: qcom: scm: Allow QSEECOM for HP Omnibook
 X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241130-hp-omnibook-x14-v2-2-72227bc6bbf4@oldschoolsolutions.biz>
References: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
In-Reply-To: <20241130-hp-omnibook-x14-v2-0-72227bc6bbf4@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732993736; l=867;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=5Oq4MdNKXVyJJvjmJFPu8lXVv7qb44phd5FkFC6DLHc=;
 b=O6Ef9bMEZALmt1jprKWjgnFNVSDP0/hTLPL6W/T72hBmrwqMQ3G07oaSkY2M+d26So6K6bDeQ
 2jFkD5KRIILCK860mL8YHDMAzU6S8xex9f3XcEsEefotmwJ6ql6+zoN
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

add "hp,omnibook-x14" as compatible device for QSEECOM

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddcd969..2e148fb7167be 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1769,6 +1769,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.43.0



