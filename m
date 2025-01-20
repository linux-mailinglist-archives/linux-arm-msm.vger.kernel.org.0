Return-Path: <linux-arm-msm+bounces-45609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCC5A16F0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3B5169047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCFB1E5702;
	Mon, 20 Jan 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjIGIDca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7211B4F02;
	Mon, 20 Jan 2025 15:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737385856; cv=none; b=eyWBcwk9kjcgyhN2fhw/68nUGqcS6W625/BX395RnrUOeHNMfIPhVdlKmR83uIqADmI8/fwPaEJFoRptWlIzs/5Tp8/G/ZRRlXxkOqMpVgxzzLfhTCv3EIzKlJxWHJKqhv1w2ux1l8w31nhqBixdPcwpmhlCFNUhW2Hx1alY3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737385856; c=relaxed/simple;
	bh=6ZwK+wzhierXb8EDYkagmDzg4l+1lODP+tkjuW0DeeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rHsbAarMgiPwOtpt3DpKgx3WNSVcE2jFW4s7ri3jIWFYMm+l8ttdlMSM8kiSlQf0KinfNjkB1l6R57Kf3DPv1OxJzxEYBR3e0jlP0mCyS49mP96iLwiYJJpRhaGalcK93H+546QVdSf1dyoHuOaLaBqB3mrAmoXt9jSs7DY8JKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjIGIDca; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D679C4CEDD;
	Mon, 20 Jan 2025 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737385856;
	bh=6ZwK+wzhierXb8EDYkagmDzg4l+1lODP+tkjuW0DeeI=;
	h=From:To:Cc:Subject:Date:From;
	b=bjIGIDcae9LEftF+M+GKAp5TOuPD5ZClv99hjZx3x/kKz+fMupdcqyEfw9BxLLv2N
	 ds4RHGDR8pvcdaX5/W7K50SjNBLSk6pOKepEAWBS7+cdlqUXouPONQNX5QiFyUWWyj
	 XnIvWOqBUU138mXoB/V9+kLNsd+IM7dEPCZvQ+h8F8vMes/RNgoSTKfcyn0NUnGCUq
	 Ze2B/JtqqBs0Ns0FOHGV3vbli0ljo7oW1pxaTOvElVaaCzZbJsOs5a1emxlCv4F/T0
	 cUCQSUrDPvLAJJ5oPbCHoQRCGY3gL+FmTljk6DxWnpoLd/GFVapZBJcazzAEiiJagm
	 tOh9skRMw2rpQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tZtQZ-000000003co-2IDx;
	Mon, 20 Jan 2025 16:11:00 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: qcom: uefisecapp: fix efivars registration race
Date: Mon, 20 Jan 2025 16:10:00 +0100
Message-ID: <20250120151000.13870-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the conversion to using the TZ allocator, the efivars service is
registered before the memory pool has been allocated, something which
can lead to a NULL-pointer dereference in case of a racing EFI variable
access.

Make sure that all resources have been set up before registering the
efivars.

Fixes: 6612103ec35a ("firmware: qcom: qseecom: convert to using the TZ allocator")
Cc: stable@vger.kernel.org	# 6.11
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

Note that commit 40289e35ca52 ("firmware: qcom: scm: enable the TZ mem
allocator") looks equally broken as it allocates the tzmem pool only
after qcom_scm_is_available() returns true and other driver can start
making SCM calls.

That one appears to be a bit harder to fix as qcom_tzmem_enable()
currently depends on SCM being available, but someone should definitely
look into untangling that mess.

Johan




 .../firmware/qcom/qcom_qseecom_uefisecapp.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 447246bd04be..98a463e9774b 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -814,15 +814,6 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 
 	qcuefi->client = container_of(aux_dev, struct qseecom_client, aux_dev);
 
-	auxiliary_set_drvdata(aux_dev, qcuefi);
-	status = qcuefi_set_reference(qcuefi);
-	if (status)
-		return status;
-
-	status = efivars_register(&qcuefi->efivars, &qcom_efivar_ops);
-	if (status)
-		qcuefi_set_reference(NULL);
-
 	memset(&pool_config, 0, sizeof(pool_config));
 	pool_config.initial_size = SZ_4K;
 	pool_config.policy = QCOM_TZMEM_POLICY_MULTIPLIER;
@@ -833,6 +824,15 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 	if (IS_ERR(qcuefi->mempool))
 		return PTR_ERR(qcuefi->mempool);
 
+	auxiliary_set_drvdata(aux_dev, qcuefi);
+	status = qcuefi_set_reference(qcuefi);
+	if (status)
+		return status;
+
+	status = efivars_register(&qcuefi->efivars, &qcom_efivar_ops);
+	if (status)
+		qcuefi_set_reference(NULL);
+
 	return status;
 }
 
-- 
2.45.2


