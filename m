Return-Path: <linux-arm-msm+bounces-79475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D91AC1AF33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328581AA691E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3218F29E11E;
	Wed, 29 Oct 2025 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkV/Gxeo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E950259CA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744821; cv=none; b=aV64ZKKgFHRAUgJXlYjXii3lthzR0+uq52oJNPxuLI1PuEhwWo9odAq1cN4wSpcK0UEaSnMVnHWCkpVB10szz3rwEhfE5SL1yURXFVJoNT2mtMoIH6IPlt7p9Iyg2hUUaBDQycs5+aNtYmdCQZ4NQdEpdT79kRinFnYUyYQWkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744821; c=relaxed/simple;
	bh=vXi16BNEwPDhB+DYxWaToOjAjArYvikCAmJrEk3ZCNE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beFGWxrtcQPma9E0dLK7nfCc+46AQ59C6zvidtmvD+74Xv913CXUozX+BX7sT1jtBOkp2f8yw3VFyKAxiwog8WITVWdLimaNza2/EZqELeV6+D8ucha7xgi7VyQTqObO91SHE0gstCxyMxVIC/7p3Mcmle/8S1DkanySYGw9JHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkV/Gxeo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47112a73785so46372125e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761744817; x=1762349617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejAKzCqfZfWu/e72WP9qMaUTCxYS6k1xLG7nI61sF1s=;
        b=AkV/Gxeox+PNQ+JrbWpNL7ok6ANGb1fsF+xD7qaGrFHYs2gIgLrmkDga57eEIZ5ey0
         MidumrXVyX1zsH4fd6ws40S5VZsE/tO/5+Pogfn6jioGpudAiW/33WnZYEZlILLGZisA
         PAtPkrXR9+MbP8Pv0jk4qWkE76h8QhZZ1fecm7mhHwPSGI+Z6qddAYjaE2hKbad/OeXO
         /yLeNx0pNoT6r+12tbUtYmoUPEvZXrY5ZIlLm1Snh8D/AO4N7fFlAQ734T9pbwfaHGnk
         NmGl8dQ9vKp0xOck6WNfv1D7BYHbI87eEwoB/TDil4MwX+IvuO7DgLWQAj/nWPMvXdMV
         pe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744817; x=1762349617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejAKzCqfZfWu/e72WP9qMaUTCxYS6k1xLG7nI61sF1s=;
        b=JOMpb1qFhj25Q4m8DdyBwxZFn5sEM/M1LoSeguicVq/wQDtsDTzMhZO3zLpubvDnEk
         tOpMrKjZ/DnK0xGfhQTsdvKHSUhulovZ5Lf+tRT+AsUumDAXaayrb+sgcyNYuNTH6thw
         vJAoyzchVM9eG8jLEu1kn0r1IOr2xri/RD7dz/qsEPEJnlQqrWJD3TYwZx0xjmjjEKa/
         1FLPbFdLTMH0orLRNT0k3bIfQ5jmzOaHtZlXKS8dU7I1oTmc79W65pK3VPyrHoZRTLYg
         xHVvkG3gMEtz6XOlx3kiUA2X6XoZN9HKq3Xj/icGXjnlKkjB8D4mTJVXn8kJlEXPxvo5
         /pXw==
X-Forwarded-Encrypted: i=1; AJvYcCW6uDHLGbFjCWnokmbrZsENERddJd8SeMrJtri+tchDOHyO2hoCKhpznIC3JUcxW6twYuNbcdghElQiKxVI@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHAzKPpAGMvVYsgBRI0hqiixrhFtG6Xznf8xPqA5T/vnTCMj1
	y5p9nLGf5vL4VGUz7RwwWqk1cApjPL6PKTwEuGkNRXFe7XV+GGkcK9qC
X-Gm-Gg: ASbGncumdFGvxK29ceezIQJEQbIPipS5XjzeVjbDxt5sUjLBfxiy0glImmGJB3nUSDG
	Kvp4cc2+TGXzwR7INhMdZ/OFLZ+w9fcPDsK+NxZKo5nP/MXh6bMjFQQmk8f2Nvv1w2OgEvsZ5m0
	FRQftUD1Bftx7I6Hpoq+VHuRtt5njPt9XDqHPYPsuM0DlKlBCaFDmIvFz18ZWwk/QtX6w/CQQ89
	0++HThr+ejyw5U/7kZ8KnS8vQttoW4VoWo3zswNmR+xdgfwNjlKyyhnbMssAg+/kVkEZI7BGpxP
	1yUvef8nPM8yroyOIn1o2l/P7Zk4Tok35QdVKcxajxezVwsGkFqNTk+m9SpumUIOYY0lYarBF8t
	ldhmMYkTccUBVapVvfl4ZbKZcPz3DVcN5eCsKRdbR4syR6WSb4MKFeX4UWgHSfFZvGLUyVxSAmn
	ZaqbKAd4zTv+JcMdgOBEEUlC43vEAhFnb9o7RNtP3Y
X-Google-Smtp-Source: AGHT+IG5nprewpaK7QE0B0Udbvr55RWv4aB/ijDliukEsohwdJEsjj4f9YaWPAudLvQV2KfTtvDreQ==
X-Received: by 2002:a05:600c:4e8e:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-4771e333a2amr25410075e9.15.1761744817126;
        Wed, 29 Oct 2025 06:33:37 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4771e387a14sm47955195e9.3.2025.10.29.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:33:35 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ilia Lin <ilia.lin@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] cpufreq: qcom-nvmem: add compatible fallback for ipq806x for no SMEM
Date: Wed, 29 Oct 2025 14:33:21 +0100
Message-ID: <20251029133323.24565-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029133323.24565-1-ansuelsmth@gmail.com>
References: <20251029133323.24565-1-ansuelsmth@gmail.com>
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
are normally defined with the specific one following the generic SoC.
(for example compatible = "qcom,ipq8065", "qcom,ipq8064")

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 3a8ed723a23e..c88a79a177b1 100644
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
-		goto exit;
+	if (ret) {
+		if (ret != -ENODEV)
+			goto exit;
+
+		/* Fallback to compatible match with no SMEM initialized */
+		if (of_machine_is_compatible("qcom,ipq8062"))
+			msm_id = QCOM_ID_IPQ8062;
+		else if (of_machine_is_compatible("qcom,ipq8065") ||
+			 of_machine_is_compatible("qcom,ipq8069"))
+			msm_id = QCOM_ID_IPQ8065;
+		else if (of_machine_is_compatible("qcom,ipq8064") ||
+			 of_machine_is_compatible("qcom,ipq8066") ||
+			 of_machine_is_compatible("qcom,ipq8068"))
+			msm_id = QCOM_ID_IPQ8064;
+	}
 
 	switch (msm_id) {
 	case QCOM_ID_IPQ8062:
-- 
2.51.0


