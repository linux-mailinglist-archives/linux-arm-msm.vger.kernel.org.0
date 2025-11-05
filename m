Return-Path: <linux-arm-msm+bounces-80443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42645C3556F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 12:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3A214F8FD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 11:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673A53101C0;
	Wed,  5 Nov 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmE1gds5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3187309EF9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 11:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341717; cv=none; b=nh11XAmMe+GbJRYZEljpDpgf+0xFzcCW2e8VhBBEyVoWaUh4GO6gJAA9/BbPQ9DpvQ0aMMpobtCkqf1Yq8ZtgoPSBBDT/E8RVfw3IBqztqqPgmxTdIcRtRDHvRJRq3r4ObvhybSJntMYx0KNPlc9E3R/UWCjD8UCfx4jSgJcnf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341717; c=relaxed/simple;
	bh=FNrJaRSuWPP0+80IFUuNsbxE+kHLaf+ZpsE+hL238yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ra1V/lPtBlW9E5aN69YN8GwG1aGvZtvVDbYeez61IKfBT8TMoBl8gvhAuVYFgy74mwfIP4DO37YZEljlhgkbGeWJDt/N6Klq3S+2IT8s1aIdaRLgp7hIoDxB52j3rTtB5qxtGZBrweLE13J6K4lR5uiiF8gHQRNshUpais3Q21o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmE1gds5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so51506015e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 03:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762341713; x=1762946513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pLNnnbL3rHvQzwwY3VC7rigAYhAoNQuK8omShAyWoA=;
        b=kmE1gds5txHh3bcNv0X1XBtAy4gzQQpwtP0cGffTbcwD5CbOS63QOQ5nYIS+U3yoAw
         KQLq/6aHkaQcVHhexaT1Yn+2aRIcdUw1DqEDfzFajcrX12dBEXnViXLP+lZgn4rs/OCd
         30mz6d9uWZHnku+OslvwivGSRL51VkpTA9ueg7XeGF7IAnxu3HNuQMxbEcdw9esC9rkk
         nK5XRHxh33naDn3AKG2KP6afo4JkOd7JqnwbSyK9qG+rUAoHn/4fVkKywNEq8rIRGDhW
         sflsgf9w1frh6NQkoFF3lKHsPj3e9A3Ojntz9OBPCs1N/CEYhEGuOticmoUFHyKUbvjV
         u0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341713; x=1762946513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pLNnnbL3rHvQzwwY3VC7rigAYhAoNQuK8omShAyWoA=;
        b=PRB2eU4kuTuCI4DRlVP8tgXwSlOsUPBfb7c1w+Jr4zzIEtUvF6kN6UM3VD3p+m4Rhh
         kZ7SQ/HRRhGjzp9js4A1qhL+7oxvkUdlcxp/XTPt1kwTBeC0Wp90RzF/ybRjPYEfY5+y
         oCv4LBDw8A9J85lRinB9rC84GbF7ctzDv6c+krjEEAhrqbX4hNCNyCMtsjVZtjNg6r++
         wkXKict18szF2K2cDspbpsJkMUpB7S7T1qdEa3isYegKsFz1hw6iXBp6rPSY1Ke9nAG2
         +F3Y/xCW3iD3FLh7WLadjqCfP5a8HGzar/WlFngUmd/A9Nn198EnRiylBYL98FWOgt/E
         djMw==
X-Forwarded-Encrypted: i=1; AJvYcCU1POY4Oskh1L23ajQC4XOGlfi+lB8n/C6xN5trqbJ+geoIomrL4EpbBlrq4PtV/eTaSzmM0zLBDJ5cp94K@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3h1JY+Ms6h6/lzqxNvDg/XMzQXdebJr4FQsh10I0NbtiVjoq
	j/kxsq6r5+b3dZLIFKXid6cFFyi4nyyitGhg0+zbWlTaGy66vWiSS34i
X-Gm-Gg: ASbGncv2d9E7kV2cQM3hbB2Og544BX1WuRGgUpXSVyD58HScqamE+O63DCoJWzCUeIe
	a5Qb3NugL2nJkfP50C2jxpzUb7+5+itRG1EcydrSeSQCGvN37B7hD8DFC9JFgjpTBOYxKQKWoUv
	o6FT+R75AG9rxNMSrWtw36dNwEtHq7zeBe4bbFFr9Sqm384MeMgSnywQwN1w7rENPCvWQuu48r8
	5MOMBSyWpYM3vzybL775Dn9Bk5Kk7EmY4nb+94oNOnTnfCwYIFlxWzTCpvqmZ0tRd2gg0v8EPX+
	RLTG0Vzs7dyK9tGBRBP/KD1OaIP1z3mQdDM/kdm8rtT5dRuGzJdXQKBaEqHuA9G8a/g2HxfXjkm
	1zZKuLKF2y5+AtIXmOeAG8CKfVL9Q1t9X0bhv/ysYuFe47TABnimMUZkE4w1cPsolTewPds0vt0
	BLtn54wXnmTSEhWiZ2dYzdP0IbAJxPEA==
X-Google-Smtp-Source: AGHT+IHIgIQLMjyfsUy/DCWrg95x6zDlVpO8mQEr6nvagaJBa/yhqQLKmWsXV6I9BNH25BymBpPrSw==
X-Received: by 2002:a05:600c:348f:b0:46f:b43a:aee1 with SMTP id 5b1f17b1804b1-4775ce2c7eemr18402505e9.38.1762341712907;
        Wed, 05 Nov 2025 03:21:52 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429dc200878sm9829851f8f.45.2025.11.05.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:21:52 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 1/1] cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM
Date: Wed,  5 Nov 2025 12:21:34 +0100
Message-ID: <20251105112136.371376-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105112136.371376-1-ansuelsmth@gmail.com>
References: <20251105112136.371376-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
case for some Google devices (the OnHub family) that can't make use of
SMEM to detect the SoC ID (and socinfo can't be used either as it does
depends on SMEM presence).

To handle these specific case, check if the SMEM is not initialized (by
checking if the qcom_smem_get_soc_id returns -ENODEV) and fallback to
OF machine compatible checking to identify the SoC variant.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 35 ++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 3a8ed723a23e..be44a8965e3a 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -252,13 +252,22 @@ static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
 	return ret;
 }
 
+static const struct of_device_id qcom_cpufreq_ipq806x_match_list[] = {
+	{ .compatible = "qcom,ipq8062", .data = (const void *)QCOM_ID_IPQ8062 },
+	{ .compatible = "qcom,ipq8064", .data = (const void *)QCOM_ID_IPQ8064 },
+	{ .compatible = "qcom,ipq8065", .data = (const void *)QCOM_ID_IPQ8065 },
+	{ .compatible = "qcom,ipq8066", .data = (const void *)QCOM_ID_IPQ8066 },
+	{ .compatible = "qcom,ipq8068", .data = (const void *)QCOM_ID_IPQ8068 },
+	{ .compatible = "qcom,ipq8069", .data = (const void *)QCOM_ID_IPQ8069 },
+};
+
 static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,
 					     struct nvmem_cell *speedbin_nvmem,
 					     char **pvs_name,
 					     struct qcom_cpufreq_drv *drv)
 {
+	int msm_id = -1, ret = 0;
 	int speed = 0, pvs = 0;
-	int msm_id, ret = 0;
 	u8 *speedbin;
 	size_t len;
 
@@ -275,8 +284,30 @@ static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,
 	get_krait_bin_format_a(cpu_dev, &speed, &pvs, speedbin);
 
 	ret = qcom_smem_get_soc_id(&msm_id);
-	if (ret)
+	if (ret == -ENODEV) {
+		const struct of_device_id *match;
+		struct device_node *root;
+
+		root = of_find_node_by_path("/");
+		if (!root) {
+			ret = -ENODEV;
+			goto exit;
+		}
+
+		/* Fallback to compatible match with no SMEM initialized */
+		match = of_match_node(qcom_cpufreq_ipq806x_match_list, root);
+		of_node_put(root);
+		if (!match) {
+			ret = -ENODEV;
+			goto exit;
+		}
+
+		/* We found a matching device, get the msm_id from the data entry */
+		msm_id = (int)(uintptr_t)match->data;
+		ret = 0;
+	} else if (ret) {
 		goto exit;
+	}
 
 	switch (msm_id) {
 	case QCOM_ID_IPQ8062:
-- 
2.51.0


