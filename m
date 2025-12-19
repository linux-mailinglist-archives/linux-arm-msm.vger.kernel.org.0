Return-Path: <linux-arm-msm+bounces-85774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EEBCCE75C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:36:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA1883090DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E8C2BDC2F;
	Fri, 19 Dec 2025 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHQgA1LB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AF4287510
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118885; cv=none; b=lcgMOqs6YUP2ltBfFngz6MgeH9DOA5mlur1ew9JQbGpo3lclbJ8dpvSV1RTxEZn9HsHWAwqveiXJNNu074xgg2NPl3JSnPS2U9VJ4Mf2MBkkToZES6JRZObDvL74APRxx+A43WoHrVZHLkGyIAcpbV3lAPMpLXMhGK3SRsFVlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118885; c=relaxed/simple;
	bh=u29hxsmwPhk1UQfB0/YVquWdqacle28E3i8SiHCXV3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbTKIlQVzmD8w9nkTxIbTgQAsWlI8W2hKDUP5GTcf2ZUV6PI5Dpr0ebKKa2sxApdpLUSHBzt0PLt1qAPJVqtHr5+XtPc97Digadzkav2aQLp04JLKPdYmnrZyHo/DxJwcSlauY50NvIbleHcEdKvbX8wKsxTzqv4OXcnr3IIKJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHQgA1LB; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6446704997cso1145594d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118882; x=1766723682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+vTKBtx//vjYt+XiBbUDqLER0bvuALHZQ3ubeKSjpI=;
        b=gHQgA1LBPot6Oz+dj0Msbmx4jbWkQVi8nS0DyltAg/lM0Pk73DMYcOYIhU/qQHynol
         64StaJFIzcfvHmwngk9A3oqKSD/6modJklfE0fq9AdEDLzGWQnA0Fki8gQ4GVan8ALnW
         PFfZLkzeqXmfHcRlKXBu6/DNT4KmzzOANI+BKEa82+hFrYDGApjM6EXMVlBccFLG7bu0
         NVyVIC5J4dD9l3RMmoK4NYjCXtsyhL4+uT7FdmE07VDJgE3k0jYWvIKf2zHk016K3U9I
         0GrkbOfp59C2fE8KwzVsthus79zgjfCx3QVguedxbpnma/IR0tSu04EaZcrYsZKlT4pJ
         yKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118882; x=1766723682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y+vTKBtx//vjYt+XiBbUDqLER0bvuALHZQ3ubeKSjpI=;
        b=YR1ysNpzDhvYXDFSA5EOzF3WMqWScgjPAFbfRVwstvg0+SdRriGwz6B+Re4QCbaOGP
         fohN+xFYRy60PzIdlBbuBx9K8ebc8gpt0I57PmxmomLkBlTWGz1rPLlJ7zhP8D1oUSK/
         BDSEkCxglBLuy+palFfahElAfEPcnm7cDnN/KONi6QS3ETyiVvxjhaZ38cfcBbqoiF5R
         JhfAN24ARfgXvmoccPMHfj5dTlE8nmvV00cWsLL75yz0BjT6dKCtMhGecTqw63ojZHzt
         szm23fEOFdgYS4ih+VF2OtXEL9q0+uzPwHhEoZcyD5M8hDLu6dQhrKM/KYWuja9S/NHH
         sslA==
X-Forwarded-Encrypted: i=1; AJvYcCVevptozwff9zP+gpGDeAEkK9/Wh74aBCx6qxNpC7gFhLz8Ccsgd3/cdXgKSZ+wQ/RUa3xVO0y2KuRzzHSj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyecf/ceMPLqsNJuYthMDfBzKVqtpAdYDnJkZk8ZXd82TaQZRas
	V8ARangAZcLx+7IdCEQ+9owfqFTgKnRxBNt/S4jhgrdmAxQF2qlo7uPl
X-Gm-Gg: AY/fxX7+EAhpadQYxxvP4Fg7NwldJCetYoN4HEI4DOI1jRprSMAp4+4ZKBo7qcURobd
	gmCLA5qVRLKO1rNWZNaunP28qBzYnGRgPySFMG1ecqbtkO7dhP3aYrYvtdh8GGzvKMaIhPX3GAe
	yPgREPuyFWPwFnQji4gaO4elpzyOu9vBSGkqEwcq1aqkiTy3idEX2llfrZX5DlvNaLxQ/8DYxAT
	JETENPWBiw+eSPteKijug4Ol8Z2tP7Be0WPPPA8ky8jBbec85Kw7SrNW7e6FZA9o5bHeybBawzb
	DcGviReUdL4LemrCh3+OfxIRBuRv18p62jINjPiq7TnWIRdRxfF+szgvHkm35lDiWXgYp8oaqGq
	Ye/gtuDIq14+ZqVCuMgxqm8PngGaLL/+dsh05QC6xJvfafBNPfmjYBdoJfUZZDq9c4Y++pUt1Vu
	M1JMZoUgEMMbSTL+msYPVcld2b/yKCjTFP6rV/nV7cyJYEuw/iQLF72wNHb2z7SukClz2uGdJ/T
	UZEy0bBJB164YT4mlzlv22QpMfs
X-Google-Smtp-Source: AGHT+IG1tDqxMlHlyXUpMvdAU1tHnKILoSJHXFoLrENw914cxBK1DHdwCiFGlWBPuQgZrvuvRbIuDA==
X-Received: by 2002:a05:690e:1348:b0:63e:3b29:f1d7 with SMTP id 956f58d0204a3-6466a85e44dmr1325144d50.42.1766118882495;
        Thu, 18 Dec 2025 20:34:42 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:41 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Thu, 18 Dec 2025 22:34:15 -0600
Message-ID: <20251219043425.888585-7-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
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
 drivers/remoteproc/qcom_q6v5_wcss.c | 44 +++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index b62e97c92d058..265010c5c82cb 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -101,7 +101,8 @@ enum {
 };
 
 struct wcss_data {
-	const char *firmware_name;
+	const char *q6_firmware_name;
+	const char *m3_firmware_name;
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool aon_reset_required;
@@ -161,6 +162,7 @@ struct q6v5_wcss {
 	unsigned int crash_reason_smem;
 	u32 version;
 	bool requires_force_stop;
+	const char *m3_firmware_name;
 
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
@@ -922,11 +924,40 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
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
+		return 0;
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
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware,
 				    wcss->mem_region, wcss->mem_phys,
 				    wcss->mem_size, &wcss->mem_reloc);
@@ -1187,7 +1218,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	rproc = devm_rproc_alloc(&pdev->dev, pdev->name, desc->ops,
-				 desc->firmware_name, sizeof(*wcss));
+				 desc->q6_firmware_name, sizeof(*wcss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "failed to allocate rproc\n");
 		return -ENOMEM;
@@ -1198,6 +1229,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 
 	wcss->version = desc->version;
 	wcss->requires_force_stop = desc->requires_force_stop;
+	wcss->m3_firmware_name = desc->m3_firmware_name;
 
 	ret = q6v5_wcss_init_mmio(wcss, pdev);
 	if (ret)
@@ -1275,7 +1307,8 @@ static void q6v5_wcss_remove(struct platform_device *pdev)
 }
 
 static const struct wcss_data wcss_ipq8074_res_init = {
-	.firmware_name = "IPQ8074/q6_fw.mdt",
+	.q6_firmware_name = "IPQ8074/q6_fw.mdt",
+	.m3_firmware_name = "IPQ8074/m3_fw.mdt",
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
 	.wcss_q6_reset_required = true,
@@ -1284,7 +1317,8 @@ static const struct wcss_data wcss_ipq8074_res_init = {
 };
 
 static const struct wcss_data wcss_ipq9574_res_init = {
-	.firmware_name = "IPQ9574/q6_fw.mdt",
+	.q6_firmware_name = "IPQ9574/q6_fw.mdt",
+	.m3_firmware_name = "IPQ9574/m3_fw.mdt",
 	.version = WCSS_IPQ9574,
 	.crash_reason_smem = WCSS_CRASH_REASON,
 	.aon_reset_required = true,
@@ -1295,7 +1329,7 @@ static const struct wcss_data wcss_ipq9574_res_init = {
 
 static const struct wcss_data wcss_qcs404_res_init = {
 	.crash_reason_smem = WCSS_CRASH_REASON,
-	.firmware_name = "wcnss.mdt",
+	.q6_firmware_name = "wcnss.mdt",
 	.version = WCSS_QCS404,
 	.aon_reset_required = false,
 	.wcss_q6_reset_required = false,
-- 
2.45.1


