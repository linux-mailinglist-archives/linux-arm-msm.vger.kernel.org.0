Return-Path: <linux-arm-msm+bounces-84106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D3C9C302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 17:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A4F203481D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 16:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DBE28640F;
	Tue,  2 Dec 2025 16:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzVgypLl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC53284684
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692793; cv=none; b=n9i33QgEqdTYeiCM5Z01P0TWa9Xnxq/+Wmw4KAQBCiVlf5rh+PbTeZ+8NAlF7sC2jQSD6xoliFeVTpNnh5B/Kd2PqeVsGoe4GkrQWSzpvC3VI4rbLAL0DDJHQDobjWBP+YLd2JB1ic+b0y+DXy2FyYbsZCXm+yJQi4LESvZKa8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692793; c=relaxed/simple;
	bh=fhg4EUNcQI+h03icAM99AhHg85JaUze1Gx4jiJBadm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcO9Q9j6gpTkKiHsZZuKp7PIzpkdEmYQSBa6nLw5887Hj21PiYOj29+7OoaWCk9aIaj9P9LRTgGgOiOs0V1h9wTNNCyZ20CNWasiUVcBHsqXIPr9Z0ZJD6FVxcBg4tW/ydwuI1Gizr6I0iho8gCDPLBdJ8KJxQKIdo6sBJtN15c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzVgypLl; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-657244ed2c2so1253565eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764692791; x=1765297591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AdDRYWEE0OARr2cNKLTuK1d26pNNoKSTEKsFGgRhUzo=;
        b=CzVgypLlW9VHiGTQX96kyLNoOoMjZsiqyH1C0uhrE/2yP+ghGrmBPxr4oAe+pgywfq
         AFj602ZbLdAq6HbvRVOQFou4FzmrI7noayztKSdFQNIPcT/z/+g71C5G4XV4JlzetheK
         4KpEPu/hgcn/KF6P60vWM2tHZDdtoVoIhWjsYDiqSurtstRaV7GbFiKH+0Y/D6dYJMfB
         Sn983q6B8kd2YdFNCwQf4Ype353Pa1nktHaF1yIAR1yCSMgf4F6H0wfWTX0mtaoGWM9O
         fM4+QrLSyZSmCEVojwWhUVFnp3jbFoCyUoG2ex7dhVsyvZqu4InoqZZVMesrFXo0FbXU
         kJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692791; x=1765297591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AdDRYWEE0OARr2cNKLTuK1d26pNNoKSTEKsFGgRhUzo=;
        b=s/wNmSu2+owkV9FxL0GwzPjpBpZgUyyVQHxQTgitrWz5NWqveKHYanka5fD1C/VBHE
         EKIDcalZk/u3tVdOQW47rzIBFVz5I4u6EQ38E9c5rkTg3475cBCG1jBOlJFZGQJhq2wJ
         Ug+CGHxc52GStCQRXwY5DidlE1TDbh7qvHNbfM9V/yeqMs8yx6jWSQ89QeOilP8YRtWf
         COa+r02ESc+FqioZfjdFDHVNU0zTYKau9hLfKZChtERc9Gav7FJLA9vxCcRBBecQbux5
         SQjLPaWiKBrF7lNKHuJ01bQNP/eVU1Nx76aFJJY/vGP4scBjcey6x8T7fSITHh3FvcuI
         SKaw==
X-Forwarded-Encrypted: i=1; AJvYcCXgg/NGKDBh1oPLs2W5u3p/2WHsC+P98zHojCvcz7LA099QF8B5ittYW3VU1+2lnmjSDwXNtHPaikSb2n8Z@vger.kernel.org
X-Gm-Message-State: AOJu0YytIGZ6qM0xXp9d04VZrGYnQJaJVawn4MOjXf6V9lN9yeGhY3Ar
	A8RasRycvwEjWKmS9bICyThefVomrm8kcBrXvVRg1MU/LRlKGZF4OAJA
X-Gm-Gg: ASbGnct2f0w8H5aGujPglIznz0XcbKXOyRRxlStwxzzakU2Les9uOzXjFG59rNvd9zg
	qYsOEBVYUtUyGJcVcqy+qYgGPo9PM/I894QNb3SjClYoi2/UBiFnTarKM3p+t+yViiHYn5aKL96
	7sjIdUOTwhJAywnJI456XWJ1KDTD36329hRmrevDzvor72TDwAB3kXnCEibSQmnnPjrboQU2+KD
	PYNanldIWC97R8ea8JpUixWsAwZVmCZZw5wb3fk+cWHrmKl3A64ee1BSAQo1ProBOv2hSTzhAGB
	PUOdTYTra++Fn1mttEQhQzb8l8x8wM2zHZuy/U+GXagzophrm7loBasfuNwWDQ8nt5uOXD1pJwF
	vqsnagsYt3zUPbKs3pwnHZGMT3W+lG3xJ+K+QaVEaMVpbTHBBMvikrPCmmrxYsXhjPrRaVzLRKg
	zLHbbQgsYucLU1Qb+7o3xULe/uGFAwgeCWuEspeuiT/jDacb9p0Kl0WnrVbGWt7SYt6IVfFMUog
	Pj+PYOk2C3G03lTI49AR2jRO5C9
X-Google-Smtp-Source: AGHT+IF/sy7yPP+CI2l/uUn/o+fGA9nCYyc6iCafzp24kWIYvKonqBG6WGQyb+BLgFvDegxwappYZw==
X-Received: by 2002:a05:6820:180d:b0:653:6c32:6fe9 with SMTP id 006d021491bc7-659704245acmr103901eaf.2.1764692790870;
        Tue, 02 Dec 2025 08:26:30 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-659332e1480sm4236722eaf.7.2025.12.02.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:26:30 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	p.zabel@pengutronix.de,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_wcss: drop redundant wcss_q6_bcr_reset
Date: Tue,  2 Dec 2025 10:26:25 -0600
Message-ID: <20251202162626.1135615-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
References: <20251202162626.1135615-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The wcss_q6_bcr_reset used on QCS404, and wcss_q6_reset used on IPQ
are the same. "BCR reset" is redundant, and likely a mistake. Use the
documented "wcss_q6_reset" instead. Drop ".wcss_q6_reset_required"
from the descriptor, since all targets now need it.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - rework change to unify wcss_q6_bcr_reset and wcss_q6_reset

 drivers/remoteproc/qcom_q6v5_wcss.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 23ec87827d4f8..465119201c345 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -96,7 +96,6 @@ struct wcss_data {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
-	bool wcss_q6_reset_required;
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
@@ -134,7 +133,6 @@ struct q6v5_wcss {
 	struct reset_control *wcss_aon_reset;
 	struct reset_control *wcss_reset;
 	struct reset_control *wcss_q6_reset;
-	struct reset_control *wcss_q6_bcr_reset;
 
 	struct qcom_q6v5 q6v5;
 
@@ -309,7 +307,7 @@ static int q6v5_wcss_qcs404_power_on(struct q6v5_wcss *wcss)
 		return ret;
 
 	/* Remove reset to the WCNSS QDSP6SS */
-	reset_control_deassert(wcss->wcss_q6_bcr_reset);
+	reset_control_deassert(wcss->wcss_q6_reset);
 
 	/* Enable Q6SSTOP_AHBFABRIC_CBCR clock */
 	ret = clk_prepare_enable(wcss->ahbfabric_cbcr_clk);
@@ -803,18 +801,10 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *wcss,
 		return PTR_ERR(wcss->wcss_reset);
 	}
 
-	if (desc->wcss_q6_reset_required) {
-		wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
-		if (IS_ERR(wcss->wcss_q6_reset)) {
-			dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
-			return PTR_ERR(wcss->wcss_q6_reset);
-		}
-	}
-
-	wcss->wcss_q6_bcr_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_bcr_reset");
-	if (IS_ERR(wcss->wcss_q6_bcr_reset)) {
-		dev_err(wcss->dev, "unable to acquire wcss_q6_bcr_reset\n");
-		return PTR_ERR(wcss->wcss_q6_bcr_reset);
+	wcss->wcss_q6_reset = devm_reset_control_get_exclusive(dev, "wcss_q6_reset");
+	if (IS_ERR(wcss->wcss_q6_reset)) {
+		dev_err(wcss->dev, "unable to acquire wcss_q6_reset\n");
+		return PTR_ERR(wcss->wcss_q6_reset);
 	}
 
 	return 0;
@@ -1066,7 +1056,6 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 	.firmware_name = "IPQ8074/q6_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
-	.wcss_q6_reset_required = true,
 	.ops = &q6v5_wcss_ipq8074_ops,
 	.requires_force_stop = true,
 };
@@ -1076,7 +1065,6 @@ static const struct wcss_data wcss_qcs404_res_init = {
 	.firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
-	.wcss_q6_reset_required = false,
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
-- 
2.45.1


