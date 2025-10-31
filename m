Return-Path: <linux-arm-msm+bounces-79896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E9CC25318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 14:10:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77EB44232AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 13:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C21C34B69B;
	Fri, 31 Oct 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8U+3tRc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DF2E6CA8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916131; cv=none; b=KFAESk9WkZj9lD3172EE5PR2MqPhIZfdwXHZi6y1mvBP/baFA1P6r686YN72xYGvJvvpvVrwHWKcTWJbUog+wkRI/E/adaD1GYWlro8PSES2rXvS0Y3mJ3UO6vNixMkfuWxr1YNXpq4FzVutDYO7roiJ2jJ7t93BDJIBWw062rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916131; c=relaxed/simple;
	bh=5T4we+04phvY12zd5z7NmT493Cbo+MC2XthOf+wVqB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTBYJem+XgVqrPVw6OSmEjTdLcoynR5svFWGqz7yk5meHTx1Qeg/6rnTnI6ho1bnMJpay/rupmJrOnA/aWJoDAP5pG2ZxOQeN3C5x6eq6kb58ctqUS3JpD1hCAyZ5NXQKHP7wueGKwBSLGWhFWOprj6exr7/MvgBKP8PHJOcMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8U+3tRc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso2064398f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 06:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761916128; x=1762520928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WlG3BHDYyP9oSQCZSrzDbxflKU5lSaGhHgoKQjGdBiQ=;
        b=M8U+3tRcWLvS5/krGTnFAjtk3+c9AFYqrpDXbxS/bw0RGwvA8GNBXg12gtijGNJwhc
         08dytg14s93Pybkl6AmVeDTPNUTOPqIVVKspSkMYZWTjuBnbWTv5v+1JFxLwqD/T/QBU
         1R2c5zO7kgs1IqXbMDSL+p9pddvhaBKNATQ5cwx/+9CRNyUHZGBPoL2iN33KZLFfpyVj
         X6czZVu2CIfJyNCfMzPttdsKgK+FHMELTMBpFS5FhJlOd4IOm0yDq7ptU7ViaT/FKU+i
         a67tFmkHVt0mGlHV+p6X8C3U3wiVPBfT9amWQfhLbTV2lcKyQc2N8+lXBO2Zj0tBzEit
         l9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916128; x=1762520928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlG3BHDYyP9oSQCZSrzDbxflKU5lSaGhHgoKQjGdBiQ=;
        b=HpObvrtu5OPB6oC62GqEKm1czfarn4XYlOlg5nqOSHvYr5IjHIlh+EPwgOAGSEpMBK
         3Aec1YGTgLSso4FF9UD+XQ/Kuc+8n5dPJY22Nbypi08QhQMPzCIC8tAQgLkfL8syfGE7
         n35BdEhzJCgIKk9xKrCTIVH4RT0D+adASEt5Wxizke8+8AmFUxhsU4jXmLkB8WDmQ5Pv
         20E/N1DmDk6M4BaJuZLBqgouTLQ33OaX4oGETdFGR+Usz+k86gyg9BUHYKHakDyoJyDo
         btKpfVkzMNBZz2viHrvDJlPMVN0Lg8v/BmCWHH4yKYNw4kNYd3zePTei4HuThMul2RCM
         IcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsgW1+pERQM0A8W+k+LHHyCmrNgpHpuJGWBkqAkeuGZjWjTpkJROkr3OIj7+pEzOwtAfVwNdAWdgyGZ51+@vger.kernel.org
X-Gm-Message-State: AOJu0YyMuVxzJgfERyy8GUoK9BcEcUa8UOfFaaqc1ciNN/oWBxFeNBWx
	E77a8MTYhndvzFzZVqEpppqq8fYNYnA30pNP7ia8iaJ7wqURASEiCixM
X-Gm-Gg: ASbGnctEnpA+85Zu4Hscs7jiLnhPSOkaEwJ69c4kJMVvYyAw4Uh4x36fzTVjRI3/IUQ
	XB9+V5BVf3Lii8L84HLUs2RPUDDQwlQELTFVG9Eoh+5FRqVdQbYSUX+ZdSZmWbAEjsJRTe++bDM
	S2oPyE0Lg+U6jyX4xIVPMt6SRhHySIRRwUJg/2sCoakdcn3FztxA54jZgHjynEdvEf+OZSTj4+f
	P+BRCs0vDjEVX95IQMW+k0o1vUnvhVQ0SGzXIY7uTITo1nuVn8M0Q4sbpwwp57aq1iHAS1dKcF/
	48eNxy7gRr41TcuCje6XEQmpvFm02HxymVUdksDvWfEt2UFbG/eWy04kW3yMjKF/Wq5VjDkuiof
	H5Es0D+S5DecefsIgEZuobyb71d9Lw9LEntlX6YzdhDoFhUYQLhfxpqMSyUD83zevnNX/ZXMlsd
	+Bcy+li0t6K2JysbecOL9IG3UnIJZCrw==
X-Google-Smtp-Source: AGHT+IH8raCMnV70Ei/zEAHR7NrPRko7JMAHoJpdiWkA2AmfdFMM4hloOB2l6vAj+ebL2RRZr6OFhA==
X-Received: by 2002:a05:6000:1aca:b0:3e9:ad34:2b2e with SMTP id ffacd0b85a97d-429bd6a9412mr3217291f8f.46.1761916127667;
        Fri, 31 Oct 2025 06:08:47 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477289adc18sm98339815e9.6.2025.10.31.06.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:08:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM
Date: Fri, 31 Oct 2025 14:08:34 +0100
Message-ID: <20251031130835.7953-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031130835.7953-1-ansuelsmth@gmail.com>
References: <20251031130835.7953-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some IPQ806x SoC SMEM might be not initialized by SBL. This is the
case for some Google devices (the OnHub family) that can't make use of
SMEM to detect the SoC ID.

To handle these specific case, check if the SMEM is not initialized (by
checking if the qcom_smem_get_soc_id returns -ENODEV) and fallback to
OF machine compatible checking to identify the SoC variant.

Notice that the checking order is important as the machine compatible
are normally defined with the specific one following the generic SoC
(for example compatible = "qcom,ipq8065", "qcom,ipq8064").

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 3a8ed723a23e..5a9bd780a4f3 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -257,8 +257,8 @@ static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,
 					     char **pvs_name,
 					     struct qcom_cpufreq_drv *drv)
 {
+	int msm_id = -1, ret = 0;
 	int speed = 0, pvs = 0;
-	int msm_id, ret = 0;
 	u8 *speedbin;
 	size_t len;
 
@@ -275,8 +275,21 @@ static int qcom_cpufreq_ipq8064_name_version(struct device *cpu_dev,
 	get_krait_bin_format_a(cpu_dev, &speed, &pvs, speedbin);
 
 	ret = qcom_smem_get_soc_id(&msm_id);
-	if (ret)
+	if (ret == -ENODEV) {
+		/* Fallback to compatible match with no SMEM initialized */
+		ret = 0;
+		if (of_machine_is_compatible("qcom,ipq8062"))
+			msm_id = QCOM_ID_IPQ8062;
+		else if (of_machine_is_compatible("qcom,ipq8065") ||
+			 of_machine_is_compatible("qcom,ipq8069"))
+			msm_id = QCOM_ID_IPQ8065;
+		else if (of_machine_is_compatible("qcom,ipq8064") ||
+			 of_machine_is_compatible("qcom,ipq8066") ||
+			 of_machine_is_compatible("qcom,ipq8068"))
+			msm_id = QCOM_ID_IPQ8064;
+	} else if (ret) {
 		goto exit;
+	}
 
 	switch (msm_id) {
 	case QCOM_ID_IPQ8062:
-- 
2.51.0


