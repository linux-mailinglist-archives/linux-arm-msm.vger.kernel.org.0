Return-Path: <linux-arm-msm+bounces-63917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F40AFB102
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 12:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A2A517F239
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 10:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC532957CE;
	Mon,  7 Jul 2025 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ujHeRRqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733E9295DA6
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883506; cv=none; b=kR32fkM/Xl2VpRoSUhXTJ0inNeAGvmXCFw4U/G8PUfMpumTDktS8T1ofGC3LN8pvV+rkQ+mn/DzmnjGum/p6I8zAXU8Hd907yc34EV93AKnsc5MMmn1G+3ZPAaO4oAtcFa0cnM13+aX+p3B2Qf++HfmtcmJaN3tXhibLCva8DNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883506; c=relaxed/simple;
	bh=DMbrTGn2oiFCand2994EbbGqOk9oOogjgoWe7AhWgh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NHr951B9avtFQl9HETVuG1G9RYga5Y2pytLCtMIAcK6eNDzHTyauc1oN9eFW/kzeS9d0nIM/2WsHqljlh09zjEDBfgIzCLatb80NkeSW7WFSaCV0Ven/eoa2dzHTEcJhJV8U8YZ+ri23pwwMAoFmDDZ2kPSOp1YWzPgwYrxtPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ujHeRRqj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso830473966b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751883503; x=1752488303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Ge20RgeK7ksHv2r52GDHh4NGxzRBjNBgwgR8RP7uA=;
        b=ujHeRRqjx7TAxZstrgVVcvw1/zIhsR484Brtb4OKIj3X8I5U8aN9LypKXPtMb89j98
         70a5LBBfyWuNs42IAaT4Q6LLTKW+DzxwXXut8WQGc2/t0K3y0xZkUj/cqf+OTF86aZbK
         1kxf7c0aR6Y9T6E2bL5CiR0XpOiAps+dW6ACGWwuYB5VeHlSfRyqc6ByDGCiGyI5rdwk
         1a3Cagj8XUeoIbVbom9B/ICGgbup3ymMVb3CmcsWXsEEcFfYhT52fWhev5/wRwwwDXwE
         u41aNEtmuGAktGDcN04lAdkv+VB1OPeDj/SwYzUwJJxm3Xv0+NYIswGuhPH98kt0cuEj
         Y0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883503; x=1752488303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8Ge20RgeK7ksHv2r52GDHh4NGxzRBjNBgwgR8RP7uA=;
        b=VX6XoxtVKAEbJR5ixyejKLZGGPl8nO2SERpehyaLE8UJqdhzMlmL7qI/h0YkBFsTTe
         YWfrkgP5RkBOTPViE0nMkalD9rA7FO6bZClAa4YcoTrbZmFuDsbEaaf2t3qwaq8t6hOv
         Nj/LdUO4zsK/D3UulcLftFPxIEquoFrECRucCwC9FV01nkFaG81WyAf5K8As8fwa5C2+
         8SWkeTf71jumc7VJWaldEl2zPXRT6367V6/9g6kxFxhzn0Lmhk+OjYMpzoZxudkD9F3J
         oVydJ0Fr04xsJ0/r9u7sPxM/C1YDVgOTXFqhfusxGZ0tjIST+uTykhoJ3ZJyDxdS2xw8
         Y1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW0a19AdMUzxKjkW5jZZ0mqA9gVhsb2CeF/RevW5pBiGMKSkvBMPhEAC6YYycH2M8kqMVRWveotHpXMVHAp@vger.kernel.org
X-Gm-Message-State: AOJu0YznCKUYeNZqknfF1dHAsiWQLPe+j6VCN1BwuD8KoeYkwaW+Aba+
	ZbIWIXy69g8YvdcDPewbN+vFwLa2wiDB1L8b+38ZYVXi0DW8esOzivFxTwiSa0uYNww=
X-Gm-Gg: ASbGncuTp/b832dfqfKIa9n2WBB5tyCULE4Zh0wF1merqPcaWs0GBCDrEr+RqAT8B1O
	nj7fKhbB/38ubs5/Jj2JcVZvk8dZT0IQOyGaecoUMnQqDMuCPfIym66mJLbvsznnhNw3M9LoNR9
	NwF+MZQMr9r4rXCDc4vrB9VtUhTEwTFSSAFrofwZih5vQkL3RsNIh4mI6UdXLjxu4cH51GMUw8R
	jpFZQHSM2bPnpY90CPmu+v6X1mnA8/Rf+y/VHcQsek6fJGYdJOYoc06pPHMxK2lbdVJxI9uT6UD
	c6OIuKUOJ3Hut3BI2S3LuHbk17rmnYGirOwPMOcHsk54Ii9qHaD7OqT2S/NPIT3pomMFHyzck+Z
	BY05uM4lSAYXjc3m606+jhShxbsqi7adZ
X-Google-Smtp-Source: AGHT+IGG3uIPzMF+00PNjI0EwVgYviZWA+kJ/1ai7rBTaIQlV6W7t19T5/X/FqCEc5TjKLQfSV9xng==
X-Received: by 2002:a17:907:d1c:b0:ae0:c1c4:645 with SMTP id a640c23a62f3a-ae3f830b8c0mr1056831866b.21.1751883502499;
        Mon, 07 Jul 2025 03:18:22 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm671711766b.180.2025.07.07.03.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:18:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 12:18:11 +0200
Subject: [PATCH v2 2/2] pmdomain: qcom: rpmhpd: Add Milos power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-rpmhpd-v2-2-b4aa37acb065@fairphone.com>
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
In-Reply-To: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751883500; l=1514;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DMbrTGn2oiFCand2994EbbGqOk9oOogjgoWe7AhWgh4=;
 b=XSqig1gqw6cfVF2o7Z7/eF5lh89rfbm1iux4bgA4bm5c0eWV+gPab1K/4ouMqwacD2UIW8onh
 eI1Xn9NWVtyCBxoKJIVmOn+JG8ROd7Oyu9UjQ+ZkkZ3+hoHgyRFenPP
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the power domains exposed by RPMH in the Qualcomm Milos platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 078323b85b5648e33dd89e08cf31bdc5ab76d553..e09552a469264f28952fc46c3ab8c125e87310da 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -217,6 +217,24 @@ static struct rpmhpd gmxc = {
 	.res_name = "gmxc.lvl",
 };
 
+/* Milos RPMH powerdomains */
+static struct rpmhpd *milos_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_EBI] = &ebi,
+	[RPMHPD_GFX] = &gfx,
+	[RPMHPD_LCX] = &lcx,
+	[RPMHPD_LMX] = &lmx,
+	[RPMHPD_MSS] = &mss,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+};
+
+static const struct rpmhpd_desc milos_desc = {
+	.rpmhpds = milos_rpmhpds,
+	.num_pds = ARRAY_SIZE(milos_rpmhpds),
+};
+
 /* SA8540P RPMH powerdomains */
 static struct rpmhpd *sa8540p_rpmhpds[] = {
 	[SC8280XP_CX] = &cx,
@@ -723,6 +741,7 @@ static const struct rpmhpd_desc qcs615_desc = {
 };
 
 static const struct of_device_id rpmhpd_match_table[] = {
+	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },
 	{ .compatible = "qcom,qcs8300-rpmhpd", .data = &qcs8300_desc },
 	{ .compatible = "qcom,qdu1000-rpmhpd", .data = &qdu1000_desc },

-- 
2.50.0


