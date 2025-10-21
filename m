Return-Path: <linux-arm-msm+bounces-78117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE419BF5577
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 10:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3303335159C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 08:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D0531DDB7;
	Tue, 21 Oct 2025 08:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YRwpxmaY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8282DA775
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761036346; cv=none; b=saajtUIEQ7CrgXNgox8UYA9kZkOeFziCiUlGX7eyNR7ROXB3WxMISEU7FDGmB0GZ4RWF2b+Cz7/UpxezQ+rTRd6J7Rc+v6o3sFdtM+0gS3bgCUneEvf4DFyXJGbHiL4uXIUHGLLk2U/p4Afq056watXJkl83bkAYyKyNhuIGL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761036346; c=relaxed/simple;
	bh=e8OIztMbIriYuc5EqoSW+bjrlPbXrjnNXj6AVSTUj6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c6qDFLNM1qJ9epUXIXVmuFD1H/WQnZ/LX6odgm2LpeOQwsSUuiMrRfxfU0+QO5vTwqx5lURL5ylnaOt+5+Sq4G7V22RYnnYnkNBSCK/fgbp6UMpkZmRcMVwpZm8YIdbHEu3JfkxsUlelkrUqzelJ+NvbsgKEVI/Ilo8Ref+fegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YRwpxmaY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8IW6o028420
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Elhh+Em9NnvOSVsDt7zbpL
	za4b/6zrwnAqOm1QlEHSA=; b=YRwpxmaYCmY4Dzc2B7MSRRIeNjGn0+oipPBvt6
	cD51REKwRoGgWo4Oc1/e/w/XYVSbKXSGiMSt/Fv9MlkXV2077iN0Ju1k9trXaSqU
	I3CYBZQTSJSv8mS6u6heoulaTKGxOKtjAYrWEPJrFtwd0UuBBJQyltXiKij/ExMu
	+f2P/xB7gkSVshpRNgziOoaAQaQBzHJ1IFwR1hsbw3a9Hn6jbB1b0sYh3EP9A+eY
	piBlV8xAYNYM+VEBu08vy2cpsOgeNtz2hNfY01+gadvtQYGeUaZf1vHzYMxnzBPr
	TNYvMo8T45S/5zloZ+L27IwAYV0X1dDj4xHEhZs6xAqTyh3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pg68w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 08:45:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28eb14e3cafso107241975ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 01:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761036343; x=1761641143;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Elhh+Em9NnvOSVsDt7zbpLza4b/6zrwnAqOm1QlEHSA=;
        b=NHCY4DM4S5Hn9zMF3m7EFgjoIh1i1rx6LQujKiH6e40zc2hfcBzagGgL1DRspfs9dr
         VIn7oBKxss+PZSf3WsDMeBMlS/KQkzC7k6ag5U4w9+l5l3p4hJFUY1jwtpwp6pNnzsH8
         +OckWWoCLFABBjNTuwgsHtXhl8sDAbknhzqDgDhe2FtCn3okzoYPcpgc94U4lJ0xckic
         IOW1KTIc4YNPxhwIeLjsoB0Ma4CwkSqsLcj+HbwDcNtBtHjFq9mjwp+2qYJX6hvgw8n0
         tPqUEb0Qf0CdAGjNTH7TtLkGHH60r3oFIplt+y4NFpjT3e5NgyjD5qScoEU7Xx0PDe16
         rDaw==
X-Forwarded-Encrypted: i=1; AJvYcCVnfs3alOu6HTKZ2DitQQF2Z5FV5e0tIccUY/FG9kodAaDIQvsgZsHj7sNGy5QV3mOXteDt9xThGzNhVj3E@vger.kernel.org
X-Gm-Message-State: AOJu0YzmytbpXPqgqVjTPutj7jnfnwyxcL+Hc5+12yxzJcoNlH7C5OHr
	GnBgNL89aMjdV7a2T5Zxv/PGFUHa97fj5IDAvVYZzZE/SgUFf9fQi+UFgHc1DxmP/X/xujuQ/Un
	qdXO0un4r2B6pLDbrdekCtZPgknzUwlsP9N/ZqTXjF1Vb+ozrZaqo26MtgHuRZBRqwkS6
X-Gm-Gg: ASbGnctjEoZsHPko9yz8vEBLUIpUhHN6iNNXrclkel5hq67bPe+j2lmbRiVLpLVJDGc
	NNkFySGRUC/Rx3r7B+qxXirZq7ZmDFWoU9OJ/Np3E/ThDaoJAp/VQmC+qMU5i53QnUHXKMLS3xc
	T2N1h+Bs9JGppfU/CVIGOm83egQ9oMW+cvpuCn71+DzeHC0qd/Rpc0UW46YOPAXbMhcveyf/STy
	LyORq1jZp8Rcv+cZ135euw3DQG/qnnhuzp5ObE6iJPnYkZYp/06r4FcaF5tLlmE0msPnMvTgNRD
	tw4M2dRDr7+xe9iE5szBcc7XO/fDDMo2hs0lOTQASdQvNp83xAWHIhb9QHPLQVYrvYfgViG7/Ez
	s6jMTeE7oUjg7LOe/L4xBQCdzjoBE26kdClGge2/P2EQEOXhgrmBOGhSCTJvuGDjyU14XFepw
X-Received: by 2002:a17:903:1a70:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290cbb49970mr225048605ad.41.1761036342673;
        Tue, 21 Oct 2025 01:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeDozYIzXs+r4izATtwH8K7/YDy4VBNwxTHm2BbitvyzgRq84sjpyhEpzvedomP6vHq4zULw==
X-Received: by 2002:a17:903:1a70:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290cbb49970mr225048285ad.41.1761036342226;
        Tue, 21 Oct 2025 01:45:42 -0700 (PDT)
Received: from xiaozhua-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5868sm102080565ad.60.2025.10.21.01.45.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Oct 2025 01:45:41 -0700 (PDT)
From: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 16:45:25 +0800
Subject: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACVI92gC/3XMwQ6CMAyA4VchOzvSTRDGyfcwhowyZYkwXWHRE
 N7dwckYvTT5m/abGRlvDbEqmZk3wZJ1Q4z9LmHY6eFquG1jMwkyFyCBX+yzNqOvLdFkOEgs4NA
 2WCrF4s/dm3iweadz7M7S6Pxr44NYt/+kILjgCqRuclEU0GRHR5Q+Jn1D1/dpHGwFg/xExDciI
 1ICZoAKNZb4A1mW5Q2ept5h9gAAAA==
X-Change-ID: 20251020-fix_etr_issue-02c706dbc899
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Linu Cherian <lcherian@marvell.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761036338; l=2039;
 i=xiaoqi.zhuang@oss.qualcomm.com; s=20251020; h=from:subject:message-id;
 bh=e8OIztMbIriYuc5EqoSW+bjrlPbXrjnNXj6AVSTUj6E=;
 b=CT4tBWJtsym3+buKoCXEL1VaPVn2qIEfnKDDcw+xbFgf4Cjd/HGjUjiQIXLmXeALYT5lZTIEC
 okfiW67jkeiDEiZE+7hTO57vbWDSIBB1DUtoq//7Vm8sQbfv9MBFpVZ
X-Developer-Key: i=xiaoqi.zhuang@oss.qualcomm.com; a=ed25519;
 pk=zuq+lkjngHYEDk6qmD41kiqDaQuURxgU/sjQuARnCrs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX3gOFW462TFyS
 alVk1W1p8reLlIaILJwCJnX69IBQkoRPYbfDoG1AObnAKz5T8CJLKIfOwDXyPEvtMOwYj2gYPyj
 OisHWBrsJp14RCVIEL7ViNpH66scAPJnmzR6DpBc7CBEk9XEfeV5Q4zbSiVwlxOUvvrR+4V6/tT
 QIsllj8T4ZI4nfbrT7eM033jPt0G0EgDjfVaHQSCQ27t7MDPIsktT4AYyGkYoxeZEiQue1et8Tn
 wOBs7vnA5G0ZQJ3gQPTpFNLD6h2U+9cv5YNlJoMt9kGwJmiuiePRLJnjg4evt+QkEY8ZCxdenPj
 jCQhswho4N1nTwvj35Uh4DqdplLMSYG6AdO2oL21A7ETS2l8k/c3P1uP2Nh2q/OXTWaz0Qh75HM
 k99NcPC8SqHHs7sFtaR/kU/1TyBeBw==
X-Proofpoint-GUID: 9juvu6Ho88A-YwtcngWzHUF0p5lGtPCp
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f74838 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oKJ9ntOD2-YCvPZDK-EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9juvu6Ho88A-YwtcngWzHUF0p5lGtPCp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
and enabled again, currently sysfs_buf will point to the newly
allocated memory(buf_new) and free the old memory(buf_old). But the
etr_buf that is being used by the ETR remains pointed to buf_old, not
updated to buf_new. In this case, it will result in a memory
use-after-free issue.

Fix this by checking ETR's mode before updating and releasing buf_old,
if the mode is CS_MODE_SYSFS, then skip updating and releasing it.

Fixes: bd2767ec3df2 ("coresight: Fix run time warnings while reusing ETR buffer")
Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
---
Changes in v3:
- Add a fix tag for the fix patch.
- Link to v2: https://lore.kernel.org/r/20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com

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


