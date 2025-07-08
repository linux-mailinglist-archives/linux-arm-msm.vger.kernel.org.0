Return-Path: <linux-arm-msm+bounces-63961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF71DAFC1E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04721AA521E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9073C01;
	Tue,  8 Jul 2025 05:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPzSo74+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14051D27E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751951733; cv=none; b=hmrB03KdYdCnVKAdVyEXdEvlVQ6XB4fg4QftpxqeCptmIfhJQV8zQ/cBngfO4K2BUj6TJyyrOs9e6M+AXVK7biJFF8fn3mbSNGMjjkaPHiNqRQVGONwRAZEscAbN9J+aXRp2+lcKuHda13AFP/uE1NcM47DOrXB6myV3c5yxQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751951733; c=relaxed/simple;
	bh=GUJSgzOY8x5DejKin8CVk3+3IlMrgKHiKe+11HLlue8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qWjkE6KsZRbsFVF5paUJTF8Jx2JS8kWhvXTcJh6Pvw0e0E7Pj+ndBhRnRQb0/C6HIN8JomyMbZWoQJe8CQNxWuoawLekeu7/D59UuOFO7lfb4VU3GIwSq5HNhHrrDzSod6CsO0+HYM0Ah/TR68+AI2pHabUmwtEa/ZfFYN8esfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPzSo74+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567J2GrG013543
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/HSqkRbY9szwwusjkZtKjQ
	6nKbk1f+svXsRXYI4M81U=; b=cPzSo74+nj/KGQ1378O/KfiHLuExkNFZ7Trk9G
	IQMfmkQnBTnxRTxSWuP86qxN5KwhUAYiLqoo6ZkQl5aqC7ltRerHhpZSl8S8rZXU
	7nkcujHVhgPQ/SeGqxqjj4GPegs2UJy57+/aXSumc6IAi5natgTGnIg5yNsPj8ox
	W1nOhdJHIkQxJMDV8LGx6MYvO1Qy75dvuyxTE8v5HUdOpX/gPaQJfaOOopobL3Kj
	rIh0DpDmQLzHVywhCbNyEtM+bJ/XrXHJMMBrsdo9O30/iP4qOuG5pYSl/T2hHjJr
	msBfIwIeHR3MdTnQYtkFSzlCinT5bAtVyhmJKdIiMuYAVeTg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkjhjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:15:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-748b4d5c045so3274681b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751951729; x=1752556529;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HSqkRbY9szwwusjkZtKjQ6nKbk1f+svXsRXYI4M81U=;
        b=X44CsOI082vgXaKU6ZEZ5pHuF2wcwoEtdGe6oj3T4ZuTRs2qUKfeyE+y37uIVbo5cI
         6saJcMIPxP9UBX7aePnza2zh1JVDMf5GS7rS/599Fpk1x30FD3Ou1eeBN4IXaVj4QrL5
         wGboNVveAU5BZle7iGxJIH1DZu46Nagpviv3ffja6LOt+SsANhftFplncS+x4ALAyVzz
         Z0KgnHKquFuIa7mDeLL0N7lJDAxOpv4mSVqKje9e9XMi5uMU2hauraBX26hwdS3l+JJE
         zia2OgmUzCWPNStE0+fCvaq92HNOY32VB2YX7siXwubjtxsEBVyhCvZsQUASv6NyUjdf
         oi+g==
X-Forwarded-Encrypted: i=1; AJvYcCVxgjuCbFBEkZeYRt33vFbX7rmrMW9+MIN0n5xC5CV/84P9yz797BLU5cM83W+I5xNdcPA0lx+7lx0zmTED@vger.kernel.org
X-Gm-Message-State: AOJu0YxqeluecXkl88O34LANl3hXefmcutXUByAU573Rg7Y7cD47jdsJ
	BSELDIKUGa7M46PELpbzelmzLv/Ofu/N8Dyj5vRS4puo8qv1vycHttkCCOaCCAjXlqC20e8rfql
	UhAb8WsewpSECmRXpE+yNSvvEO2v8z0H/U61SqwyKSUQNo5rstz4DUR+UQrGmXjVFUr5JmCncS4
	Ap
X-Gm-Gg: ASbGncs8dIFDxdY8DZD04iVKa/Rj+dxxqXulI34HEGNJHrylWQ4hFoY5Huo4oyeJxfS
	cW5qbq0fVMEBAKBjILu4O5qKM1nQhdO/zfsM/zAga+Nb1lQAKVLqNLEJhpTWpuDcYDEV6tFezxn
	KS2+6IA8Om+7zyQI7tVsyH5FyjIk5UUctqPiM+x7E+vKjVbuIfFXcO6forxLkqGWRFUO51asAoD
	VZoQU9WE8nxRTnXxADUvAQYeI1H7DIQzKHg3czQthDFdFgE1YbttCd/tMkvATsUbU34GJtQzW8i
	VzXJQWyRZFrF7a46kWItsO+ya3rubFLjA6Fk+v4EE64yjno56r0=
X-Received: by 2002:a05:6a00:1143:b0:732:2923:b70f with SMTP id d2e1a72fcca58-74ce8aa78bemr21625650b3a.11.1751951728824;
        Mon, 07 Jul 2025 22:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWmkhsxSUYNC8evqge2XX3eLE+VkbL2hIvI1Ch/Jog1n3y7SXxAmFfLl7RWA3RYfevNd5ARg==
X-Received: by 2002:a05:6a00:1143:b0:732:2923:b70f with SMTP id d2e1a72fcca58-74ce8aa78bemr21625618b3a.11.1751951728323;
        Mon, 07 Jul 2025 22:15:28 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35ba014sm10372397b3a.19.2025.07.07.22.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:15:28 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 08 Jul 2025 10:45:22 +0530
Subject: [PATCH] pmdomain: governor: Consider CPU latency tolerance from
 pm_domain_cpu_gov
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-pmdomain_qos-v1-1-7c502f4c901a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGmpbGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3YLclPzcxMy8+ML8Yl0j0ySLlKQkMyPj1EQloJaCotS0zAqwcdG
 xtbUAmBocQl4AAAA=
X-Change-ID: 20250703-pmdomain_qos-25b8dbb623ea
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751951726; l=4135;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=GUJSgzOY8x5DejKin8CVk3+3IlMrgKHiKe+11HLlue8=;
 b=mjMF7cpCyuZ5q2iTEGjYPktKBSazU/v/OCu7h/vxnvASBk8RBnWtU/e/r+ChvS+CodjfoMc5Q
 QzxImPH7MO8A8o4nKEbKiX9O6jEuQ4f1I6x1DqX8JCUM1FqixtURsT3
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MCBTYWx0ZWRfXy5D7oU+TIXpl
 OgCNaNBm0v+MwMMrHDjxjO9ykFqu39j8G0Y54PHhrMH2/tmcKgRCmMc4VI6dv1iUMZnzFggeqeA
 alGn4HL6wliRHiOQbwYg246MrZEKGUVLM7GLTy6bMv9mX93rZ/m2JDOf6fn3ENKzgzAEGAZGc7r
 B4gl+UAvLSNvZNplFxm2lMqupouD5toAltWdLiT9TXkCJlYP+FqpVpv6nka1Spp/BaIAps+cT2E
 VaBqMKg10B5WO0U92iQ8+n6NEdswIW5thFdNogZuczeMCWKpZgCpKhXwiu97IK6HfJ5GGN5It2h
 Gjz47qX/x9hWnt58bCblytT1XTzKgVkWC434LbOaQRgI/0JG2PnqgXUCwbikXTBPDrmbQQFDuD8
 Hm/aL6A4hu/MMfXihhTGHtFP4g4Fswm0TRbLtD/t+a9EL6YeGnJvT4x+RvIVev/U26oZhsg9
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686ca972 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pR31FINYhqodxwX9k7wA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 120V-bclwbSWeRsw7Na812cy57gZK-o6
X-Proofpoint-GUID: 120V-bclwbSWeRsw7Na812cy57gZK-o6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080040

pm_domain_cpu_gov is selecting a cluster idle state but does not consider
latency tolerance of child CPUs. This results in deeper cluster idle state
whose latency does not meet latency tolerance requirement.

Select deeper idle state only if global and device latency tolerance of all
child CPUs meet.

Test results on SM8750 with 300 usec PM-QoS on CPU0 which is less than
domain idle state entry (2150) + exit (1983) usec latency mentioned in
devicetree, demonstrate the issue.

	# echo 300 > /sys/devices/system/cpu/cpu0/power/pm_qos_resume_latency_us

Before: (Usage is incrementing)
======
	# cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
	State          Time Spent(ms) Usage      Rejected   Above      Below
	S0             29817          537        8          270        0

	# cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
	State          Time Spent(ms) Usage      Rejected   Above      Below
	S0             30348          542        8          271        0

After: (Usage is not incrementing due to latency tolerance)
======
	# cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
	State          Time Spent(ms) Usage      Rejected   Above      Below
	S0             39319          626        14         307        0

	# cat /sys/kernel/debug/pm_genpd/power-domain-cluster0/idle_states
	State          Time Spent(ms) Usage      Rejected   Above      Below
	S0             39319          626        14         307        0

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pmdomain/governor.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/governor.c b/drivers/pmdomain/governor.c
index c1e148657c873a6b5b4d9c0f058d54cb020c56e2..d5ac4c1b5b5a432f0072209d17379e58ec891202 100644
--- a/drivers/pmdomain/governor.c
+++ b/drivers/pmdomain/governor.c
@@ -8,6 +8,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_qos.h>
 #include <linux/hrtimer.h>
+#include <linux/cpu.h>
 #include <linux/cpuidle.h>
 #include <linux/cpumask.h>
 #include <linux/ktime.h>
@@ -349,6 +350,8 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 	struct cpuidle_device *dev;
 	ktime_t domain_wakeup, next_hrtimer;
 	ktime_t now = ktime_get();
+	struct device *device;
+	s64 cpu_constraint, global_constraint;
 	s64 idle_duration_ns;
 	int cpu, i;
 
@@ -359,6 +362,7 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 	if (!(genpd->flags & GENPD_FLAG_CPU_DOMAIN))
 		return true;
 
+	global_constraint = cpu_latency_qos_limit();
 	/*
 	 * Find the next wakeup for any of the online CPUs within the PM domain
 	 * and its subdomains. Note, we only need the genpd->cpus, as it already
@@ -372,8 +376,16 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 			if (ktime_before(next_hrtimer, domain_wakeup))
 				domain_wakeup = next_hrtimer;
 		}
+
+		device = get_cpu_device(cpu);
+		if (device) {
+			cpu_constraint = dev_pm_qos_read_value(device, DEV_PM_QOS_RESUME_LATENCY);
+			if (cpu_constraint < global_constraint)
+				global_constraint = cpu_constraint;
+		}
 	}
 
+	global_constraint *= NSEC_PER_USEC;
 	/* The minimum idle duration is from now - until the next wakeup. */
 	idle_duration_ns = ktime_to_ns(ktime_sub(domain_wakeup, now));
 	if (idle_duration_ns <= 0)
@@ -389,8 +401,10 @@ static bool cpu_power_down_ok(struct dev_pm_domain *pd)
 	 */
 	i = genpd->state_idx;
 	do {
-		if (idle_duration_ns >= (genpd->states[i].residency_ns +
-		    genpd->states[i].power_off_latency_ns)) {
+		if ((idle_duration_ns >= (genpd->states[i].residency_ns +
+		    genpd->states[i].power_off_latency_ns)) &&
+		    (global_constraint >= (genpd->states[i].power_on_latency_ns +
+		    genpd->states[i].power_off_latency_ns))) {
 			genpd->state_idx = i;
 			genpd->gd->last_enter = now;
 			genpd->gd->reflect_residency = true;

---
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250703-pmdomain_qos-25b8dbb623ea

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


