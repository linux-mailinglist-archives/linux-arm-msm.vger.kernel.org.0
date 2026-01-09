Return-Path: <linux-arm-msm+bounces-88179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B9D0720D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86D3930402A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE892DEA70;
	Fri,  9 Jan 2026 04:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1oKh+oI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866C2DFA5A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933264; cv=none; b=W5dtFJscTq72IdTufgET8c67UmzUcRtny55/hm/Ou/upgLRXEKUm/2gx295HL8vcEneLM8qUS792Ji8JgemfYyEF8GkKp6D987zeRRGfZBB7efb7EksOQDbFlWMKJckeTT3aI2z0TAKpy4QTplElt8uL9wDfmpe/Lxuhhili77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933264; c=relaxed/simple;
	bh=ZwYTrMAmnkdh8YdhuMQNkEVxOPy2CIPYNXYMB5yEdew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UcgTXFScKMVDMMo2LjJEki4rAL1yNgJLQe7tz9LlkVywB5HYU7JIwN5U8mQvNfXnEQo3x6dDUD+hey+3R40g4bCDa98vGjXy3x8D7UsG9HQU7Zd3yQG15cJX1GkyeM/PKR5N6Y/DVUTOrRJiFG1KIw+6muLTSmiK6rdiLUhnO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1oKh+oI; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3f551ad50d1so1494233fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933261; x=1768538061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05mvMiaCezgmzJYXVgjf/BCnZKgTJFkAHEvjQAEJ4/8=;
        b=R1oKh+oIOl3xPugr78RVmyt3j3lHMhsNrHM6F3CRSvKw0CoPjlcnHiL7buzNk4sP06
         sIsiDdWgVpeKPnYwwEbxyFjXjzcKvUBiF2lo1gxMp9XDBRP7z2aK5E0lDQCbfiT2Ipq1
         bLcG7tom6FeEKym8/b07ipWFV1dHQD7toqRVYiu3dLtwEX5s4RSRVpCSkEIOC3m3ItlQ
         fOyu+0J9NkahMSgRjJ+9tMOhoacuNO0k8vEiw3dXXkomg5KOIl0IeYhvmK2ArGDUuR05
         +Wfsez95HOzJerqVjdVdGjqo/3LyV61D+km0GcYCgsaE8JoYmQ9OjIi7Nft4fmYTgKzK
         51+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933261; x=1768538061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=05mvMiaCezgmzJYXVgjf/BCnZKgTJFkAHEvjQAEJ4/8=;
        b=LsGyEDTdsQP31s65Hon6FS0QlFGIc/rVzSqMm54x3a3Iynv7kRvpk6SkwiOOynLHS2
         gZA8zuZCOXmCQCCEHp0+WodfdfJUl5A+TgB07hCpT9cAc5bvE/z1pRed8W/tZ//++VLP
         kaa0RFtWOMQBS7/vJYit2CtzeEw7CVgkPydvO+YIx0ndfZfWMHbM/+AyhXejwVWW/Xi7
         6bv10Ts6Q7WXBHdf869IlgaX7S3/iOsgiE8OGpwCNUVxB+OIN83tZ487566FK7GNtM0K
         aNPKN1hGu/fIXvV6qG4hHCJPfAXEI/s6ywZeD76c//BVML4pwJ5mkBKyGcKwouBio0ml
         nJJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNiTdFY6lE6wxRof1+MlTPNdekbd7HyNT6qNr44Tck/5HhTDx/YGDnN+RNVmkriGVgZYIhYcFF9+bv2cQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzXq/8UusngMaOmzLpHHYrwDepswvfSnsjhMsZQy20xWfHVThIx
	EywxKnUI9Pmbuc6m71inO36+JtjgPM0ATCVRhxo/P/xcLNQgdJecx3ZT
X-Gm-Gg: AY/fxX5FkYdwJOHloC4DcQq5sr+bdagnjqBC6HyjcrPyCnEVjt8G+p5AefEr31MO7I4
	9u5dmGp97nN15n+4rP/fV2PV1AjdmWv+/f4d5+a8b/Iqd72pZB/Sg8XDoSDCRXbVgZras2fB7p+
	koAm+ZbWRggasPyh/qPsGDC7K9xzw+vPlBauDY4H/Anyo6gEN1Uf+DQITewIa0M7FVPjtKc5gVE
	ia9ES5P2JBOorpemjptteLt/3aFqO5U+w73QLiRmRMrGQ7ARYpjotXxS4C4Jm+JV/RKD7lnRlPr
	8U0zUTLa9/Ew/C5oQZe5QT6zKy8QNSRIhp1NXqZlqLDUy3uKPdXmUDIhN/kkUWDFullLfClYGS4
	c5h8cwVdkmbkcjOz14OattDEZ6hLWufZC5zB2UOGyfaN0Esh0ptGiY58a9ynrp2yACdREBWW+Vg
	cpUEdRezraft6tjm1GEJnsqoRfhdARrpI5ApWmhnucV1+JJkSd/j3NC9XsgJNBIyVHqwEjbFns0
	hh1TIW4TqpCjNNJ80cDRpzC44LxAxFfQdmZH8c=
X-Google-Smtp-Source: AGHT+IFQMfD5BmYuMz67fv5qpmxGsSYuw3YF8lZjbLInnepHp8t3ZgfenUtKZ4QOFw08dY90b93PXw==
X-Received: by 2002:a05:6870:3353:b0:3f5:b004:314e with SMTP id 586e51a60fabf-3ffc0b5e85bmr4715058fac.46.1767933261550;
        Thu, 08 Jan 2026 20:34:21 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:20 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 8/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Thu,  8 Jan 2026 22:33:43 -0600
Message-ID: <20260109043352.3072933-9-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
to the q6 firmware. The firmware releases from qcom provide both q6
and m3 firmware for these SoCs. Support loading the m3 firmware image.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
 - Check for -ENOENT from q6v5_wcss_load_aux()
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 45 +++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index ccf5fbc5be66..2bb83e6afb6b 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -103,7 +103,8 @@ enum {
 };
 
 struct wcss_data {
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -160,6 +161,7 @@ struct q6v5_wcss {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	const char *m3_firmware_name;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
@@ -931,11 +933,41 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	return wcss->mem_region + offset;
 }
 
+static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char *fw_name)
+{
+	const struct firmware *extra_fw;
+	int ret;
+
+	dev_info(wcss->dev, "loading additional firmware image %s\n", fw_name);
+
+	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
+	if (ret)
+		return ret;
+
+	ret = qcom_mdt_load_no_init(wcss->dev, extra_fw, fw_name,
+				    wcss->mem_region, wcss->mem_phys,
+				    wcss->mem_size, &wcss->mem_reloc);
+
+	release_firmware(extra_fw);
+
+	if (ret)
+		dev_err(wcss->dev, "can't load %s\n", fw_name);
+
+	return ret;
+}
+
 static int q6v5_wcss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 	int ret;
 
+	if (wcss->m3_firmware_name) {
+		ret = q6v5_wcss_load_aux(wcss, wcss->m3_firmware_name);
+		/* Continue if M3 firmware does not exist */
+		if (ret && (ret != -ENOENT))
+			return ret;
+	}
+
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
 				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
@@ -1196,7 +1228,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-				 desc->firmware_name, sizeof(*wcss));
+				 desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1207,6 +1239,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1284,7 +1317,8 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1293,7 +1327,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_ipq9574_res_init = {
-	.firmware_name = "IPQ9574/q6_fw.mdt",
+	.q6_firmware_name = "IPQ9574/q6_fw.mdt",
+	.m3_firmware_name = "IPQ9574/m3_fw.mdt",
 	.version = WCSS_IPQ9574,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1304,7 +1339,7 @@ static const struct wcss_data wcss_ipq9574_res_init = {
 
 static const struct wcss_data wcss_qcs404_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
2.45.1


