Return-Path: <linux-arm-msm+bounces-78098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 683A8BF4FE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C8F189A382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 07:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C27280024;
	Tue, 21 Oct 2025 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBRo6Aml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166827B32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761032175; cv=none; b=aoaq4ZCXueQCSiqEpYLpEJ6fZwH1XAbSxD1bxSvhE/S2NWv2iQPWN14CH12dAkL7LHGJ9YdEDJ1d3aZKk0pV97rS9Q6v04mr3Sb0MTMK3YJXO+lpFh/JBo251/o4vIyPAsV5Q1yqgodZgQXF0AvtMOFIHnwYjzCFirf5WOtoI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761032175; c=relaxed/simple;
	bh=vsKxbQW8zM4ci47zcvHfnvo686SJJwJBywX94n5Zr94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YK1SdGdktYc/yNyi2sqPpzFYxCxiTvQ4d+VFxqjn4F/ikT0AQ6n0EreK6eZ4olLba2soF5OAwXOBCMUUp8khLfxjEAwAVpurVFJPHQw77Bz182arHNdkiJffUcZheI3VtTB156IF3g5aXm8Z73mcsIQs+RdOlC3UjrHFHxBMVpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBRo6Aml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0rmr031065
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+RgsM21u4Yb9qsC3dMkzO2
	W/Hn8w58jn3yO6Xy5aEpE=; b=NBRo6Aml5Pjfk2fnMZiFUz4KUX9Sb3M+WuMP9w
	kQ0FRRpmx14akRn8SNN56nit8NToP4Tv+Z7TKootuJ2f2ABt1GdtYYDBl9rIEtWx
	2hyrlITycch2jWJw8iM6x76QQ0xFb55FKTD0GgS4Y8gUZ2+UJe0ByPAGscQf39Lg
	T3kXckH8IHSTaGfEzJPex+eg2W8YiwDr+2yMNQix/3XBiNiwrGSsIDXg+IL7fDEu
	xtt9I1n6xgCQIpFfLwc04zgOHc6GNZdDcLTTlYp8CrHE6+XimH0Zxu71j3bP9cgg
	X3RX1JIdIWFG7qSVFt0S0qwdJGCGr8TRt4ETc+b7BLxz1qXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k7eym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:36:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2909a67aed4so46080435ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 00:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761032172; x=1761636972;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RgsM21u4Yb9qsC3dMkzO2W/Hn8w58jn3yO6Xy5aEpE=;
        b=o4kyTOOe3/TowHn6eh2X2Z6WlsCfnFB3re3GJc/F2YIjnATmOCwjOUanLc35pkjF6n
         GhTJ2LlYVkJfLBtzptpq+r+arAnA2nBP7sl4MEADyP2j85JJ+91nY4Bf1VyTxkH5pSV4
         Kc+cn7LPIX2gcTW7EpR/LSMc9C2tYcUu3wzZzazu9PCUJ4lFxjk7uYLuXE8UBheiGn7z
         BDafQq4sXn3xAmBcuPKCC+nNpT9ynrxf/cM90euCNWgtf7lXme7145AU11nNIzDXZLB8
         FjFmN+f/O3/t5fCaV7Qw1e5s/P3yGUZew757niTZ7q8fUMOdAYBPJxwe1ACim+NbB7P5
         5mIw==
X-Forwarded-Encrypted: i=1; AJvYcCUogN7QVLBl6FAtXjAdcYJj9zAZcHseBm3O9sIwInXj/6KjNEBqzxq+BvorYbRHbPt5lgR77V8Cj72GSaXU@vger.kernel.org
X-Gm-Message-State: AOJu0YybjExsdJwa5qsv1V41jlmmWq4gfOXPxf5BRHBUwSIFte5ty7O5
	+Ih8GG49tOOZWODMA3Y8G1KHAiT4yBfT+Tvv21Eeeqi2wiwIUT1ob7muxJWB63xPd+OdAqYgeuO
	lvLgOoHQmAdamlzY9Ly/JWGSs6raohRhN+Bq8EG/wxUweJdcJb8FKzfN23ZeeOCKsgu/o
X-Gm-Gg: ASbGncvgBysbIk2jxRbu9mOKZdnmilGAXUsGQQ4aKDJVTSjR2JyWiJqrQBxzGwJscJa
	djr5T0yNItWs+tE8bxK7zkx+SUHlWHkpu9tEqqRmv/kBeYGz+ZDLgCXcM8773bV4o6cmuVaJPZn
	qtGOx1hGC1ew/bWJjM8+TQfQ4XJP+dcS/2sfIHPO6J4iJzRM+8OTfSMbfX0/SR3it8XY9qT8Y/n
	U8JbKazCJhtqEbU3B6I5eAg562MBGHIipEcyY/+WAXgbhE0miZAgJ91gG9j99+EaU0LwStrjzSK
	S5Nps82DKI4tz++yjss5tz4K9CV2J8dMYflzU5f48vle79wGKAlgBPkCsbdDXAenkUSG5hFevHE
	SGbOPFWQUJ3ECCi1bJolgFwZs4BtWBn6XPr/XGSEICz5yj+w7l0yREsYh2yQMA0ETlQ/Je6eW
X-Received: by 2002:a17:902:f687:b0:283:f19a:bffe with SMTP id d9443c01a7336-290c67e9f75mr194051455ad.7.1761032172344;
        Tue, 21 Oct 2025 00:36:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Jd3Fwhj+0wgMIpqBH9gZpoDWshHJV452Fhw9BKS/fFPQoNGM3uAe2MakD4MiwPTdvVpr5A==
X-Received: by 2002:a17:902:f687:b0:283:f19a:bffe with SMTP id d9443c01a7336-290c67e9f75mr194051275ad.7.1761032171919;
        Tue, 21 Oct 2025 00:36:11 -0700 (PDT)
Received: from xiaozhua-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471feb99sm101000285ad.87.2025.10.21.00.36.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Oct 2025 00:36:11 -0700 (PDT)
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 15:35:48 +0800
Subject: [PATCH v2] coresight: ETR: Fix ETR buffer use-after-free issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANQ392gC/3WMwQ6CMBBEf4Xs2ZJtI1Y8+R+GECirbCIUu0A0p
 P9u5e5lkjeZeRsIBSaBS7ZBoJWF/ZjAHDJwfTM+SHGXGAyaQqNBded3TXOoWWQhhcZZPHWtO5c
 lpM8UKA12361K3LPMPnx2/ap/7T/TqpVWJZqmLbS12B6vXiR/Lc3T+WHIU0AVY/wCO1FPUbEAA
 AA=
X-Change-ID: 20251020-fix_etr_issue-02c706dbc899
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761032168; l=1803;
 i=xiaoqi.zhuang@oss.qualcomm.com; s=20251020; h=from:subject:message-id;
 bh=vsKxbQW8zM4ci47zcvHfnvo686SJJwJBywX94n5Zr94=;
 b=tuXOXoZoKs5M/Tf7VVaAmQja/s+Lt+rCK6BhRdp2KfH843mUZ+mtol/D9/0deHAw6sCBdZLfh
 WHmWEsPdYctB5mRTCCoOIOkNe4Kh7qVtJ/uMviKm+0sYysQ0VaZSbrZ
X-Developer-Key: i=xiaoqi.zhuang@oss.qualcomm.com; a=ed25519;
 pk=zuq+lkjngHYEDk6qmD41kiqDaQuURxgU/sjQuARnCrs=
X-Proofpoint-GUID: F-4V3qjgHQ0NeGE--SkVBmnHNIM1Lc9S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXz8OYw01IgNFK
 i4OJoAN+RB1WexmD4TgyXWWIr5JOyVurHQIDpK4OdtChu3tQdLHVikBz65u7WkuGN31aqcz7JL0
 W4waXE+s1d9QQglOgFqzgKUIOh8AozYYLuzNyfzjo8H1ts4EAvLZo9q5geCABuUw9glQyoU7y/B
 n2eTB1H5G97ysMOZL1QJmovDB32XrqhLyzR40ahibRLDRpxpSkGYYVGURNI0kHXCfZlKX5R0aR7
 g1vyps4gFMJTsjy8pcAcnWY9LUE+YGCnxEpay5slgsx+n4DM+BEsJvogllaY5xNrb6CHyhRpJ5Y
 F97TvN6EdZCTQ+gx8Zo6PxoK7/UV0CZYgMJmWbr539qOBCfJgAvbT3lvy96azykX7+luTmPcvbK
 eYbcuwLAgnXXgtI+lHej1f4E5JAonA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f737ed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oKJ9ntOD2-YCvPZDK-EA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: F-4V3qjgHQ0NeGE--SkVBmnHNIM1Lc9S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
and enabled again, currently sysfs_buf will point to the newly
allocated memory(buf_new) and free the old memory(buf_old). But the
etr_buf that is being used by the ETR remains pointed to buf_old, not
updated to buf_new. In this case, it will result in a memory
use-after-free issue.

Fix this by checking ETR's mode before updating and releasing buf_old,
if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
---
Changes in v2:
- Exit earlier to avoid allocating memory unnecessarily.
- Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..800be06598c1 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 	 * with the lock released.
 	 */
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	/*
+	 * If the ETR is already enabled, continue with the existing buffer.
+	 */
+	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
+		goto out;
+
 	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
 	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
 		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);

---
base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
change-id: 20251020-fix_etr_issue-02c706dbc899

Best regards,
-- 
Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>


