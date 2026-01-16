Return-Path: <linux-arm-msm+bounces-89392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984ED30E77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 618F03004604
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF4935FF77;
	Fri, 16 Jan 2026 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Yq6g3Fe6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC3436999F;
	Fri, 16 Jan 2026 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565480; cv=none; b=Kqdn8RrJDGSPyUKRhKfyGGQpSBLWD6O4m/cBOteWuB4x2RsKDFBqJaw999+Jxhl7GyD1SqSIQeL3OB004lHzc5f7JDb2D+W38tJZXBegC/qwuvFEYLupNfz1qL9eWEaGUt33wFsRL4dW3cIwX7iT5+66agKM8icmjkmJ2XUWhsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565480; c=relaxed/simple;
	bh=JeYsGnBqI4rsShjUji13LbgxLfruguyIt5sLmFYQBHU=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=o6uPHzyIVzJBx/rJ8QEKwMx8q5Ty06K2aHWUGrY3fPTJKzoHb8PVmtHAKccVSf7NF3z8zOBcBdBHPR2++WPtPw174ZqjTkcH7T+QxHAJCwkAy+aLOLmL/S7sk7x78gUZkiNklIn1PpiMWhM+vhKeSiy8oyX0tt6r+5AvT1uAOco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Yq6g3Fe6; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768565466; bh=ZviFdkB5B2jcwkXMko84pHOtKmpHHi/oV2lb0iyQntI=;
	h=From:Date:Subject:To:Cc;
	b=Yq6g3Fe6FP7mwpEUKTf8QHjBwyhKzuYecsjKbrK16xG1y23llt9QPSNc/uMMwevHu
	 NjL20gBLvfDt0bJPncCy6HsJ6d8PsBQ5M2IJadqmX3YbjGwSjGTbuPtaqRjt/2KLn9
	 kuKTEbyB5guj7ZXcWBeIe1FEHY4FTLSAsVXJluXg=
Received: from junjungu-PC.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
	id 2C484E1A; Fri, 16 Jan 2026 20:11:04 +0800
X-QQ-mid: xmsmtpt1768565464ta2c92man
Message-ID: <tencent_EDC2253D3B1C22217E1259E07765D269100A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XeimErcYCMkUVSh+iCuha4LszamX22IE6Xzp5ZKCir94gB24cnA
	 wcmc2KPIao9+2m0pNiUqF0JEfz1XzRhNZd1RPilEbd1XIcmAzFtjYMgKMEi0UK9dfgogN0UKBZeu
	 nR3mcGlchHKXnpY/vKEBTJya+FLaa4LCnq3EppKTEAf2yaLiHZd5sxw7Fid3ENX8fHCUI9Rq2WzC
	 tat+OegS2wLudswGTOeNyKSuwxVMnTuxRJ1gHqY9/Yj9IW3m4hf2/8mEJ1fqtJTacL37VMLDJaXH
	 jLGKJjd+JsV+krZRnmbJBBAg9ejOi4IPZvLeaF6XnXaxMGfVuW7RRRGcLMrQKnEghFwWJf3CJNJG
	 ZXdHNLj84yOdpCf0Q2GAyWIV/xNirY6kXdxgMpe3P7EuEOUC6NOCYBKOQwD1BuaY20aksce8JuQd
	 uRMQoyZQMNiDSfsYvOLkCJSxkEXa6DHEN55VyKstw3C0rpNOmDcuaT84bVwrbOFm0dEvmcXLySiP
	 bUm4NrytbzDQRBs/NLqodgQt1Qvl6Xtce0ez61zMKXcbLJD4tOpJ6rHTER5odRZhC8FPklQCyrjg
	 pg3yQb2yKwXv0MNzaCer9Q7rw1ZbZVHlx5oFcMymCfSSCRcZe/hiTQPEVt2636/6h9MiDVOaSeGf
	 MqZzcDhnjpfElVgmtE0dKSuYHpHXYXQR4557PBtx64cSyx13e17iNPfi9CpCX02BqNF7SS5evdh0
	 5jbaLsur/dFfsAlu/frM2O+mZG3evyzNpOz7vJ+uvMSqhNqmj5jCx/By9g0vkxS7RhT+I3LMI02u
	 XEokZB7gHcQcL9nHwTnjWXpFGptGJJb0om7T6q+C3yluoOmcAWywecmAyaLXXhrnY8jgm7/45o8A
	 Z5VHNNpPubq35BBYiDTr8ALe0BnhJKXiZqsGvd4Bf0eJeRV3K1QHnVsX0MO/uOFnhkKVd3kbe+rX
	 ec94RKBaf1DgJmNIvIwgVc6jtUt0PvOdetGlEAU2TP4ZMyQ/ZMv6hvLJmC5bY34WUHyRiMpwlMWG
	 ApG+3K5+WoBDuUkgljWfL61i4iGQjYz3FvNyPulFw3g0M6iMy0RNrd3SUaJrdiARy1+iB2gE/uMH
	 Vzgq8CWK79qPo2mlSoT+pmRHai1GlBi/gYuDhZ7IAdHrPP4lOguwAu2laM6wZmBS6jd65c
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Felix Gu <gu_0233@qq.com>
Date: Fri, 16 Jan 2026 20:11:03 +0800
Subject: [PATCH] remoteproc: qcom_q6v5_adsp: Fix reference leak for device
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260116-qcom_q6v5-v1-1-af93f32b2c72@qq.com>
X-B4-Tracking: v=1; b=H4sIANYqamkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mz3cLk/Nz4QrMyU11DU4PENDOj5BQjAzMloPqCotS0zAqwWdGxtbU
 ASY1JNlsAAAA=
X-Change-ID: 20260116-qcom_q6v5-150af62cd206
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768565464; l=1022;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=JeYsGnBqI4rsShjUji13LbgxLfruguyIt5sLmFYQBHU=;
 b=+UML0C5ENin31KdzG7OHplzyWBaOKO/XNzkOqU1NRNTy42LIKpS0KiB6Q1Y62rF1gBWTYs/qv
 Qm+Qu0AXFEiD0W66J7Goirm83KIfIOjFLvDsN/cAVXfRDR+1ASSIlGb
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In adsp_map_carveout, it does not release the reference.

Fixes: f22eedff28af ("remoteproc: qcom: Add support for memory sandbox")
Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index b5c8d6d38c9c..c81e6c33c747 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -355,6 +355,7 @@ static int adsp_map_carveout(struct rproc *rproc)
 		return ret;
 
 	sid = args.args[0] & SID_MASK_DEFAULT;
+	of_node_put(args.np);
 
 	/* Add SID configuration for ADSP Firmware to SMMU */
 	iova =  adsp->mem_phys | (sid << 32);

---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260116-qcom_q6v5-150af62cd206

Best regards,
-- 
Felix Gu <gu_0233@qq.com>


