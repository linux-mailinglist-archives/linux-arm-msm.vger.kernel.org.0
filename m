Return-Path: <linux-arm-msm+bounces-54829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAEBA94A93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 04:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D673AC032
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 02:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B48F255E22;
	Mon, 21 Apr 2025 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kaLLALIy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E11C3BE0;
	Mon, 21 Apr 2025 02:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201077; cv=none; b=Worg0sozcgPIjsvJN73ynzwezi+3TD9DZTo0+MAwi6OFI8/FHgEGS6dvoRcEOS2j/mwt963lJaI7cQYXsdLnEbdxfJsnJDKjSJfkwZo+KGqx90CAg+1iUyBKBunCN5r5IfomXY7ZpNcSbqF4Uz7PsM2s6B7rbzpso59m40eFTyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201077; c=relaxed/simple;
	bh=Z5F/IRyhSGy3SnY4Aw1tHc/iRR3BLwcPKmqDNWdLXSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ajpoLEoSHaCj8erT4W/pBGS+xwv4i6JDOQUAD6N9J+ab7tG7NJT1fHL37xe8qWbnGjo2VBSVYVoXGmhdoVvP1xVERMvwbfy83EYQF5q5mJscS21CuLpBa6XaCdQxQGGBzcPouIZy6snAZdB9obmvjnUIIS1OKwHOrQ1b5N+nHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kaLLALIy; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from [192.168.183.162] (254C255A.nat.pool.telekom.hu [37.76.37.90])
	by mail.mainlining.org (Postfix) with ESMTPSA id 98AEFBBAD2;
	Mon, 21 Apr 2025 02:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745201068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=poyMasgDHRwQyC9ZI5930pwJuSC2Bubt2Ot1brFMgMU=;
	b=kaLLALIyB/8/HJFC7IS9GVYqgFh40mLgomU6qQYefovzQPlDLOe+WuNQlD7K1m1UKC7PBx
	a0QJ83Qm6AW3fgekpqDZkFLjxDp9uKqBIT3FAsWOC+rUZ2of3S73Yu+GHS4D9fuCU1yPhV
	Kko6G09Gdzr39YTlPA7QwxxpkkXRPSZ8uoCPOmJyubP5WoIOF5Kdks2vOmT2tr3Ty3z2/V
	LydRQmigRlL5YtZxceKn6t0PhxJiwgopQN0RY3yQ9cV7tNz5hyFI33AjqKHMbd0k92S2yr
	nKZewWr/SKGMsfYE5oeJSVYtvnys5LAzcXE9q4C8yh99BEB7pWQyDVYuWUY0UA==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/2] Fix fallback qcom,ipc parse
Date: Mon, 21 Apr 2025 04:04:15 +0200
Message-Id: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJ+nBWgC/x2MQQqAIBAAvyJ7bqEVS+gr0UF0qz2YpRBB+Pek4
 zDMvFA4CxeY1AuZbymSjgbUKfC7OzZGCY1B93rojSZc5cHLp4glBrTjar0h44gctOTM3Py/m5d
 aP30Q4ateAAAA
X-Change-ID: 20250421-fix-qcom-smd-76f7c414a11a
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745201067; l=790;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=Z5F/IRyhSGy3SnY4Aw1tHc/iRR3BLwcPKmqDNWdLXSk=;
 b=4H5PYF4v345IusBtIJ/bKk5rCmiFEur8fXgWMQ3DU08ZbPXfLJoTGf4yKo6jv1NHikVpFi/Zi
 y9MkfCaKQGXBaGsBmYpvZlmeuF0k2D5WejN2RGPfBP/G/sEgEkdR4v+
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

mbox_request_channel() returning value was changed in case of error.
It uses returning value of of_parse_phandle_with_args().
It is returning with -ENOENT instead of -ENODEV when no mboxes property
exists.

ENODEV was checked before fallback to parse qcom,ipc property.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (2):
      rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
      soc: qcom: smp2p: Fix fallback to qcom,ipc parse

 drivers/rpmsg/qcom_smd.c | 2 +-
 drivers/soc/qcom/smp2p.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250421-fix-qcom-smd-76f7c414a11a

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


