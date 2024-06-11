Return-Path: <linux-arm-msm+bounces-22335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C3904394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 20:30:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A62F28747B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 18:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C351534FC;
	Tue, 11 Jun 2024 18:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j75RZ/Hu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7772D79B87;
	Tue, 11 Jun 2024 18:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130491; cv=none; b=s4WqPT2Oi2vtJrD/AbZ9IHCRzXm3ESChhEVdwrJyaons+M7QcFHu3rKziGdYHeIIWSe62iZXkJBn2auClqFsstPUrvWua0JG5V4tIm6i589rCOrdaWN/+Biinn5IiC0HQzhXpweAsiD3mYcfoQ/OztdofrJwTN6OUFXeI0oT8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130491; c=relaxed/simple;
	bh=D4w4ZP0/GTz/VDJqKxnsTk8kK2jryDAs9mlzgL6FVB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kULXZjk9yudDnu6CQvrollgS5tENqB17jPWzQ5LC2X/Fk+K7NSfaeMBNelWhKrlVDRVGLumV7wOk9dI65WG3su3FTCO6HPhPQAnwpxjfHBYKt4E1+khY1NwCTY8KVgpBiIe2sNtbTf8ZksTwL2oMU+s5AieDLRAir5dWuzbGNig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j75RZ/Hu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58D8EC32786;
	Tue, 11 Jun 2024 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718130491;
	bh=D4w4ZP0/GTz/VDJqKxnsTk8kK2jryDAs9mlzgL6FVB8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=j75RZ/HurQ9P4AxJc8kkzURnXQeiw7Ezs+/eNeMy5NIaOPw3Q6QE4uhl4M0R5HQsC
	 E2jajjUvqusRKcjHoCbimy6x5o3WOgPGW8VB11ATWTECqzvUct0JK0uzdnZczuGNXI
	 wxg0HgfQOV9CPToJ3rcJ5barwfqE4e9S8ntod/1nkydOW91bLrwAArXFlw6WbYltby
	 WdNe9rQSuW8rdR89Tc5SavfkUg9a7G2Hl/Xw7psKvs8tsoq4EIBvsfeaEJyBwSOLoh
	 yLcUEODFkGar9lUWaR17FQfyRygSRtG5FZRQnI0q+R0pXDnHyhW7jmDhZebmxSPvC0
	 yvq8H6tLHJeVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9A6C27C78;
	Tue, 11 Jun 2024 18:28:11 +0000 (UTC)
From: Unnathi Chalicheemala via B4 Relay <devnull+quic_uchalich.quicinc.com@kernel.org>
Date: Tue, 11 Jun 2024 11:27:58 -0700
Subject: [PATCH] firmware: qcom_scm: Mark get_wq_ctx() as atomic call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240611-get_wq_ctx_atomic-v1-1-9189a0a7d1ba@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAC2XaGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0ND3fTUkvjywvjkkor4xJL83Mxk3TTTVMu0lOQkI4NkcyWgvoKi1LT
 MCrCZ0bG1tQDA9q9DYwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@quicinc.com, Murali Nalajala <quic_mnalajal@quicinc.com>, 
 stable@vger.kernel.org, Unnathi Chalicheemala <quic_uchalich@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718130490; l=1410;
 i=quic_uchalich@quicinc.com; s=20240514; h=from:subject:message-id;
 bh=QPM5gffihWkOaIL9zSFsTYRKxIFHPtphhyZkYhX+Ffs=;
 b=9hQjvBsx/jp6tQrA7LLONkGrRz5JN4p4i4TRAzp626wY+PYtyQ1cy8k/VgK2zuXm+gooVO8X+
 4hFy51H4Y/5AqzFlJ0xAJxBiDj6Q9FbpYxoBNjBKULN4RyFKTNSqWeF
X-Developer-Key: i=quic_uchalich@quicinc.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Endpoint-Received: by B4 Relay for quic_uchalich@quicinc.com/20240514
 with auth_id=162
X-Original-From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Reply-To: quic_uchalich@quicinc.com

From: Murali Nalajala <quic_mnalajal@quicinc.com>

Currently get_wq_ctx() is wrongly configured as a standard call.
Here get_wq_ctx() must be an atomic call and can't be a standard
SMC call because get_wq_ctx() should not sleep again. This
situation lead to a deadlock. Hence mark get_wq_ctx() as
atomic call.

Fixes: 6bf325992236 ("firmware: qcom: scm: Add wait-queue handling logic")
Cc: stable@vger.kernel.org
Signed-off-by: Murali Nalajala <quic_mnalajal@quicinc.com>
Signed-off-by: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm-smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 16cf88acfa8e..0a2a2c794d0e 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -71,7 +71,7 @@ int scm_get_wq_ctx(u32 *wq_ctx, u32 *flags, u32 *more_pending)
 	struct arm_smccc_res get_wq_res;
 	struct arm_smccc_args get_wq_ctx = {0};
 
-	get_wq_ctx.args[0] = ARM_SMCCC_CALL_VAL(ARM_SMCCC_STD_CALL,
+	get_wq_ctx.args[0] = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,
 				ARM_SMCCC_SMC_64, ARM_SMCCC_OWNER_SIP,
 				SCM_SMC_FNID(QCOM_SCM_SVC_WAITQ, QCOM_SCM_WAITQ_GET_WQ_CTX));
 

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240611-get_wq_ctx_atomic-f5e9fdcb20c7

Best regards,
-- 
Unnathi Chalicheemala <quic_uchalich@quicinc.com>



