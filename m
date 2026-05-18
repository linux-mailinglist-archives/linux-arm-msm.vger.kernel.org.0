Return-Path: <linux-arm-msm+bounces-108271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MUVOPhjC2p5HAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:09:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEB572AAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AAA2301B3EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D963390CB0;
	Mon, 18 May 2026 19:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obDBykG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1oxX49O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E86D390C8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131298; cv=none; b=IEXC4lL3AHTBZQDbkngSTVR804SjiDfP//PXeHBe0khN9L8tsqEUrNhQ3Eal9wBZ/3ugFZiRXndQ/6/Jpjwf9y2zUjAtrPFJlSPdrWwRq+uh/fJK3Enu3Wivf5DW+Styqmk+Pbf/+s8GeZQFYsUAUZsQDbdyRRcWUwByqRO/0ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131298; c=relaxed/simple;
	bh=9I8fbZtieKCx/gmo5Zwh6/QipI3JStv4Oiuy+n8j+nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rm1tKFSgGqU+hPGWt6l1I8b/zj7ooVPyl8Lv6x3/1SvQ754vcSdzIpFfUNku1yePa40jSU2I9mdY/uCTp218dwNqwTqv6fwrzTYcFm7o2EwSPCzxErVgWkh67M9g4cOkYpRctSWItaIGcndXYpc/pTcZOVeEKAIgalfh6XNzB58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obDBykG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1oxX49O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICLCuI1890446
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M7rs8SEMK1L
	Qu/2/xiK9f0eSs0YeYPU7CAo4VX+afCA=; b=obDBykG51Tmw9P6mDKolMxrix7J
	xBiEB7C9CjZuuPVFYtXWUVjndJLAE6MdHZn2XqHR4bMRMPryksQBbjdlPJ3MKKmI
	Kj8QnxE/0e6XMI/iQwMXQYTHP05UI64gUVvJ8X5ZTdoOP1i1dl0MNbfVQymqWK7S
	4ePrkhPJ4p8hCWYv/NAO8mSXLh2EefgrECHmIzGsYEFGXL8kbGD9aPP0MQ9Eplpq
	Ijctdhl1742NTTkAvE6+CLsiSL7FeJOd4XYJZhTqqEUtswRXWJlMv/L6Qu1rZlh/
	i1ac5QTXXUDyNHnadXpnwuLWYFdB0lCCp91ziCBrTbAEgA18dXr6K9WRENA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82pw1k3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4654f9bb6so25906805ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131295; x=1779736095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7rs8SEMK1LQu/2/xiK9f0eSs0YeYPU7CAo4VX+afCA=;
        b=M1oxX49OKXscpyc4UI29Ivmi8xsn7AifetoPBF1uQczo9RZspFGfZ2RwbOz2gxvFx3
         A6ruFZiOI6XzY3rkZ9czjvD0B/EFVwXI7K8G3x2oTabOqL8hExluHl1ywMv8/CrcsTZr
         qOjdWpu3SLicv4t3huhgQQXQZ/QBCrz3lRl9UsDdaz9IWB+OHwgGGIy+8NtNZ8q8h9eZ
         lcRs/kFy1rX3M4LFJDLQljyxTFeMTjIMM44+A71+muUz5Ym8OacnKCmQuKmAnSLZkL2I
         9HImyTd1oeWH126zEQ83Nyo4aDZB7vIcZt6zXPFcTCveXcvVbM/E0IpAiFtFsQQz7A1J
         YICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131295; x=1779736095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7rs8SEMK1LQu/2/xiK9f0eSs0YeYPU7CAo4VX+afCA=;
        b=BasGfTXJ+fxRW8QBuCjrNLEqMY0KOX4pu5K4XCjPH0vQW2+7aEzM+/jf3ygzkaqTf+
         W3V6dgzqc5oZT5Qo+ziIFQpboLnQdlAqoO+ZIpdGsFtBlZFkUpZcBKUw3JCVzbX8QpWZ
         mpwG4beoFnBz3VcDxdJZao/umw0vgItnw5l9vj6KSbd9N70LpEmMPx8XcE0MP9R9UZ5l
         PixDvLrw0X1LYgbiI+yY8RL4dOx+tRib2ShbXZdXUqH1kPvVKT7H70KJPInZEf2WjSBW
         ftoyjCtS0wHvxkyYltpsAoott85OSigEqM/4Mi9xRt5zWlyRrdwjXgPyVODuoZbHGyoD
         u+xA==
X-Gm-Message-State: AOJu0YyaCyaC2GyWZdKfOKtCR6rslxCaSUxdD1ASRF5+Nby2NP1JZx3O
	o5Fif5kgp4t1IMOA8iYPd+uv0qNMMMSRBEkpI7csN181wVZ2D/R9SydC8ArpX9x2mYiLKQ4h7LG
	n50JBzficRL5migWeECorQkf3196P2Die+5KvqllMF66YO/OsnVoo2SIdv+818YUR5CWItUHauF
	jh
X-Gm-Gg: Acq92OFNdXw0O9sKgerBX5Uuym02InEA/rLsLq62RcbhOizwUsx6w/Q8MzPsEGA4uJH
	lEewThdubNXXKiYsDNj4daVLaQbSPyIapPBYBoIviKqUK8wvet5DTqNAhUrq3z4swVbfMaJwxhT
	iD4sGANoUG3PpvQ9c7M53/4B955QQW0e53JUFg7LVaYcqgbFezJQ5Tz30zvJOQ/ZgTmTnJvZAG4
	k6UNotOzk0nFlNSG9RrA9xpZdFjmJilZyWt+KsA/f/dWs1KZeul7pMpc8hWb68hIxskiQLWbuRA
	r0YgtrWjQYTrIq7hFHzQfAwWIHtoAMd3rxfUKPrhdXRHJHpdqRsKh1oGE6JyPpzs+sjmuHSxLvc
	hGSfzvFo0Rc7hrEb2XkK6Qkl7KEoHxeSqfU53DXeb3w8=
X-Received: by 2002:a17:903:24f:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2bd7e887498mr171542905ad.21.1779131295078;
        Mon, 18 May 2026 12:08:15 -0700 (PDT)
X-Received: by 2002:a17:903:24f:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2bd7e887498mr171542495ad.21.1779131294566;
        Mon, 18 May 2026 12:08:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11ce67sm162668925ad.74.2026.05.18.12.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:14 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 06/16] drm/msm: Add a6xx+ perfcntr tables
Date: Mon, 18 May 2026 12:06:33 -0700
Message-ID: <20260518190735.16236-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a6AAM0SF c=1 sm=1 tr=0 ts=6a0b639f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=tmZHKQuSfWdd6biKE2QA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfXxB2cpQsXO8KB
 jJa9Yn/P6mExALXzHvFg2Ei78a5ZZPWPbcfn+YuMc2R5BdEFq0fsi9fDo1MezbaQXQPCCVpgqtn
 0jsEWntPDWXdipL8/14LI1vIwKOajCTLtvLGeXllBR9UJFoI1/XFzfmlRNR5PbBU/BaNnw+x6Ia
 O8Mq5IGi3uePE1iJv+aV+I2PIMbQWsbiFYRa/3tNgVfzw1qHcEv2Fhs+R7dSjeF9Y7UzGwV/J0I
 ZT0iH3tNSUfRkvCIkQzdQhaMah3a7mphZzK7moY4CytY52JU0wZJlOav+SXCjOGRvnCtpv7kCDq
 ICWTWjBPjHmo82P9JGQMeEbOSUgTBuSHNFKtB1x1nW+ixBCIyf8rBoa+ge3z1k9/CTIw/fr5huX
 x9NrZvzUX9tMM0EtwBC+mDdn+5DNoXxX3LuR98S5z/id4UyK25RuuzrVx1RvY29eBtOURTscDa+
 svkkiLNgIZ8gonTGAIw==
X-Proofpoint-GUID: XE1TY_JcdG15cBmL5ksd6sbBM8cZ2HQ_
X-Proofpoint-ORIG-GUID: XE1TY_JcdG15cBmL5ksd6sbBM8cZ2HQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108271-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7ABEB572AAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire up the generated perfcntr tables for a6xx+.  The PERFCNTR_CONFIG
ioctl will use this information to assign counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         |  4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.h    |  9 +++++++++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e578417a4949..727281fbef36 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -5,6 +5,7 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 #include "msm_gpu_trace.h"
+#include "msm_perfcntr.h"
 #include "a6xx_gpu.h"
 #include "a6xx_gmu.xml.h"
 
@@ -2637,6 +2638,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu = &a6xx_gpu->base;
 	gpu = &adreno_gpu->base;
 
+	if ((ADRENO_6XX_GEN1 <= config->info->family) &&
+	    (config->info->family <= ADRENO_6XX_GEN4)) {
+		gpu->perfcntr_groups = a6xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a6xx_num_perfcntr_groups;
+	} else if ((ADRENO_7XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_7XX_GEN3)) {
+		gpu->perfcntr_groups = a7xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a7xx_num_perfcntr_groups;
+	} else if ((ADRENO_8XX_GEN1 <= config->info->family) &&
+		   (config->info->family <= ADRENO_8XX_GEN2)) {
+		gpu->perfcntr_groups = a8xx_perfcntr_groups;
+		gpu->num_perfcntr_groups = a8xx_num_perfcntr_groups;
+	}
+
 	mutex_init(&a6xx_gpu->gmu.lock);
 	spin_lock_init(&a6xx_gpu->aperture_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 78e1478669be..8c08dc065372 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -24,6 +24,7 @@ struct msm_gem_submit;
 struct msm_gem_vm_log_entry;
 struct msm_gpu_state;
 struct msm_context;
+struct msm_perfcntr_group;
 
 struct msm_gpu_config {
 	const char *ioname;
@@ -262,6 +263,9 @@ struct msm_gpu {
 	bool allow_relocs;
 
 	struct thermal_cooling_device *cooling;
+
+	const struct msm_perfcntr_group *perfcntr_groups;
+	unsigned num_perfcntr_groups;
 };
 
 static inline struct msm_gpu *dev_to_gpu(struct device *dev)
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 305dcde15c5e..64a5d29feba1 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,15 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
+extern const unsigned a6xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a7xx_perfcntr_groups[];
+extern const unsigned a7xx_num_perfcntr_groups;
+
+extern const struct msm_perfcntr_group a8xx_perfcntr_groups[];
+extern const unsigned a8xx_num_perfcntr_groups;
+
 #define GROUP(_name, _pipe, _counters, _countables) {                          \
       .name = _name,                                                           \
       .pipe = _pipe,                                                           \
-- 
2.54.0


