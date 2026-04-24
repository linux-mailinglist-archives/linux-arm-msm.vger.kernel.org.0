Return-Path: <linux-arm-msm+bounces-104479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzhBaiI62n8NwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F9460A0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 38D253043D70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C9A370D56;
	Fri, 24 Apr 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+KbAfzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vw2Oot0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA62BE7B6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043534; cv=none; b=S/NcuyxyDVXl4eMRj3cfnqHiw8ufleiVvYdBmZTrqeHQ02ac1LiRHwpx7ePwn/GobVI0n0qnvcayPZNlfQXG+9s5HruPGHEe7k0iZ+QV8bqSYRr/2RllLbldfp/By5EU/nzjaoUjZ6lwyq2hkOEs64AKfznqHGa93eAyPLuZnHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043534; c=relaxed/simple;
	bh=ellkL+88Qjtr4mQ4gbWIkkCODJSh7ZpSTSpguXorIzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uG093RQjHegIkTKhg20XxvnVVKsZSpLDEkti4vDxswJwxSAqwktj7uLCXgOpSnphNiS1YqipbF/MPGiV7q7S1CzuoeLuuJkvzQ4SXOeXHakngl/00uqw6OFin5c4IDerAe88QD2gfm6aNxEmEki+FKOwCGc4csg07htoQvx2GQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+KbAfzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vw2Oot0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OF2Sou4012133
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YBMNNwjkmrc
	l5YYqO4Z2jkhlpSzPBwO2d9QQK0QCxPs=; b=b+KbAfzIwtThmlbYjqBMqi6TXii
	g68QSWzCJ8kLUcKmTYTsg4FwzlBfO1KpKXnf6kc4+Z5+bYhXJWO1r98zkZ3a6E+9
	YtpMgU0omqt5iRxRHS7IQZYDBvvIlK3SXchHZCnVJj252C+ajYBx7nDsbJGXceQe
	VLueiP033Q8nkAnaXy3xxP3aZMy/8sjkXmlGvhqOwPJQFA+m9MghTJgCQEf0sxMN
	paoGkjrId1rJ6VZ9zJtZt4nkzn5He8DD+tvNQpvwpMZCZl7akIt+LDcToMFk/tkJ
	PdJHqG3rPjbFuEdxuNs7pSN2Ilw2LsUMTwlzTmpw4+10gnhe39o/HA/PVcg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9w01m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:11:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c799a65bad2so4570922a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043518; x=1777648318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBMNNwjkmrcl5YYqO4Z2jkhlpSzPBwO2d9QQK0QCxPs=;
        b=Vw2Oot0jPmgU3zjRHKEjFEkL5aa4fksZXdGVnyu9jZgD0Xbk8jwSS8xl6Qy0eXrTtv
         HsDyu1ww3kx0lJ30+9RQLQvZJz1+kHy73AikLSTRDDkz2xeN86Lr73cFtF7dTGrar1G+
         5RkzgAJ+8WbChhRRZEfoI2Ya+Mdck/5KLI36krWVhAJgAswWQgflvT8ZBiuAYm21xKw5
         WggKI6c/OffmSSgLUCNoZmkp7CdEQbDtbqLfJBdxdEE0n7ZNoQ8gJwePveJQ4R6go58Y
         DG6AVz1eWpRdDQhPgsMn8K74Zr0Ezs9vB7BXuF6XWUMwQy1f17wsM9zyjPPcsfdbIGH3
         BiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043518; x=1777648318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YBMNNwjkmrcl5YYqO4Z2jkhlpSzPBwO2d9QQK0QCxPs=;
        b=n66Af2j07irE48d9b606FHdG1Y+INGkmqFAqwwgIogzDlXPAzMiq4FEgFC0mnWiR/q
         YU3C4XJuFelAZnEyHlbXuxSTzlwG89rces781Ci7FEvzOEx6NXLnGI9XXx4NK1Cctbcl
         6k3LYWgaYRUkXUx8BduEYAMooIK/bT16K7Buezs0i8SrO9L7cYL5O6hRFJFc3eAtFY8t
         ZcDbNVwuxUWNhqM/6CN/cUibBHyl+F+5qKQCjy/yugc8pa+nZrLi7W7g8DDvlrY4X/Hw
         J39QJldx7rfBXapJ+NvkNlWmG8oGa2tUHDwmj8RYlhNIwoYRlKotjXdI3QJ9rJBaTHRp
         a8xg==
X-Gm-Message-State: AOJu0YxERlJFX3ItK2YJNsHYGvqErVtf0tjO7zi1TJofTdulNgI//K5u
	G+yjnzlZeU+ascmrKiW5PViU2jQz/IiRGXcSiklDIAO7MhhwRM6Fxi5AvyY0D9CLY/mCnJHHAmX
	AhgEftKFhuAZCAj8EHhdxEGTV0xSWbjJrkhThw4fvMnLflqqmdahr4KDhod9FMYjl+b8c
X-Gm-Gg: AeBDietKbz1dEeoCHlqdE2wickSQIYWuhqES8RDavUm8Ieo33CG2pnXrMk/kiMPmkCA
	WGGY5/WCRpb4tNHB6O2JZTTJzaI/7W41HJxX/6uRnvpxw5wpzE4Q42U/tWtMnfTyGpjwOCA9DXs
	+WaB+8/6cHcHwosunIKclsM/ecwzoSeuAVTk3zfKEbfFujENqBNlOhSgxSnfOlfDd8NeFAa30pp
	RS6Y5rnaaQrjXrZE9NBMnjb4I5vHhtfHztgeSxf/YKRvdjwnTN2FStJTlbLTyACRHiTQJf/W8ou
	wjfmnv2Ws2WLqNZphx5qTHA+OCVjnknTpscShWnbrv04UHjCDFy+xrAeTi7lpbxS+0A1qy06ar9
	sUc5LyAays3yQmjZsn3U/hVFQmKnxv+MXpFsbG5d40kE=
X-Received: by 2002:a05:6a20:7fa8:b0:39b:8ed1:eb4f with SMTP id adf61e73a8af0-3a08d7a2695mr35676901637.24.1777043516702;
        Fri, 24 Apr 2026 08:11:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa8:b0:39b:8ed1:eb4f with SMTP id adf61e73a8af0-3a08d7a2695mr35676829637.24.1777043515663;
        Fri, 24 Apr 2026 08:11:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f4e8sm18112720a12.1.2026.04.24.08.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:11:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 03/16] drm/msm/adreno: Sync registers from mesa
Date: Fri, 24 Apr 2026 08:10:38 -0700
Message-ID: <20260424151140.104093-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX1T2mK0PVdL18
 O1JPb7Ve0Aydn6ZbQGEF7ZAlxkRkE3P6RebL+o3d1uSfMCNzW7/uQp3fl9lnzRby1npoiyKxKUe
 XQdJMZm/A03bYH+0tOeFEplOcJmmNLfTQ7cB6OsdQRlED5F4C2vlW7PhqZEAQPKxJKsNDzUT43R
 FQ50nk2WN83yswZgE2Gh5BZyMSUNseDsGeOg2Ek0edjRMpodPkq14a8YcZmUzoNFu4c7OsaB+tX
 8w4Gjv430z4dM/PIxy7+nFMGvlyDayVkpVhhc+ZE43f0LXRidvyTaYpgd9IrmpcjtbQP+kbXlsT
 b8SeWj0lrirTdpLEM8mvPWPeLpMKLzOc7jn6brHmT7PvYirMi5TkkEKNfRxGstpA79JDCtb05na
 E9Z1kTHtDwaa+lGXhhaDG5vCCFPpe7WvW5md9TKKamf9+u2WitkLDLCPfb9+FFi5N2AKF02ZUMW
 m7zVpkq7SXi3lGaDj2A==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb883f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8 a=SSmOFEACAAAA:8 a=EUspDBNiAAAA:8
 a=vMjXctBndKc6M4jOp94A:9 a=-YkrfQbNLgtqXKMw:21 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: KW7qIN1CD0g74qIS_93BEqhmQfXpFLoq
X-Proofpoint-ORIG-GUID: KW7qIN1CD0g74qIS_93BEqhmQfXpFLoq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: A50F9460A0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104479-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Most of the churn is just reworking the usage attribute on the mesa
side.

Sync from mesa commit 4d4a951ac622 ("fd: add a8xx perfcntr countables").

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1300 +++++------
 .../msm/registers/adreno/a6xx_descriptors.xml |   71 +-
 .../drm/msm/registers/adreno/a6xx_enums.xml   |    3 +
 .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
 .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++++
 .../msm/registers/adreno/adreno_common.xml    |   42 +
 .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
 10 files changed, 2846 insertions(+), 810 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 79acae11154a..9a03684288d3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -752,17 +752,13 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
 
 	/* Disable L2 bypass in the UCHE */
-	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
-	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
-	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
-	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write64(gpu, REG_A5XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+	gpu_write64(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
 
 	/* Set the GMEM VA range (0 to gpu->gmem) */
-	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
-	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_HI, 0x00000000);
-	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_LO,
+	gpu_write64(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN, 0x00100000);
+	gpu_write64(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX,
 		0x00100000 + adreno_gpu->info->gmem - 1);
-	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MAX_HI, 0x00000000);
 
 	if (adreno_is_a505(adreno_gpu) || adreno_is_a506(adreno_gpu) ||
 	    adreno_is_a508(adreno_gpu) || adreno_is_a510(adreno_gpu)) {
@@ -1217,9 +1213,7 @@ static void a5xx_rbbm_err_irq(struct msm_gpu *gpu, u32 status)
 
 static void a5xx_uche_err_irq(struct msm_gpu *gpu)
 {
-	uint64_t addr = (uint64_t) gpu_read(gpu, REG_A5XX_UCHE_TRAP_LOG_HI);
-
-	addr |= gpu_read(gpu, REG_A5XX_UCHE_TRAP_LOG_LO);
+	uint64_t addr = gpu_read64(gpu, REG_A5XX_UCHE_TRAP_LOG);
 
 	dev_err_ratelimited(gpu->dev->dev, "UCHE | Out of bounds access | addr=0x%llX\n",
 		addr);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
index 6717abc0a897..09c9606fc3e1 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
@@ -1330,11 +1330,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	</reg32>
 	<reg32 offset="0x22c5" name="SP_VS_CTRL_REG1">
 		<bitfield name="CONSTLENGTH" low="0" high="9" type="uint"/>
-		<!--
-			not sure about full vs half const.. I can't get blob generate
-			something with a mediump/lowp uniform.
-		 -->
-		<bitfield name="CONSTFOOTPRINT" low="10" high="19" type="uint"/>
+		<bitfield name="CONSTMAXID" low="10" high="19" type="uint"/>
 		<bitfield name="INITIALOUTSTANDING" low="24" high="30" type="uint"/>
 	</reg32>
 	<reg32 offset="0x22c6" name="SP_VS_PARAM_REG">
@@ -1420,7 +1416,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	</reg32>
 	<reg32 offset="0x22e1" name="SP_FS_CTRL_REG1">
 		<bitfield name="CONSTLENGTH" low="0" high="9" type="uint"/>
-		<bitfield name="CONSTFOOTPRINT" low="10" high="19" type="uint"/>
+		<bitfield name="CONSTMAXID" low="10" high="19" type="uint"/>
 		<bitfield name="INITIALOUTSTANDING" low="20" high="23" type="uint"/>
 		<bitfield name="HALFPRECVAROFFSET" low="24" high="30" type="uint"/>
 	</reg32>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a5xx.xml b/drivers/gpu/drm/msm/registers/adreno/a5xx.xml
index bd8df5945166..4af76b3750f7 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a5xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a5xx.xml
@@ -1418,8 +1418,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="HEIGHT" low="9" high="16" shr="5" type="uint"/>
 		<!-- b17 maybe BYPASS like RB_CNTL, but reg not written for bypass -->
 	</reg32>
-	<reg32 offset="0x0bc3" name="VSC_SIZE_ADDRESS_LO"/>
-	<reg32 offset="0x0bc4" name="VSC_SIZE_ADDRESS_HI"/>
+	<reg64 offset="0x0bc3" name="VSC_SIZE_ADDRESS" type="waddress"/>
 	<reg32 offset="0x0bc5" name="UNKNOWN_0BC5"/> <!-- always 00000000? -->
 	<reg32 offset="0x0bc6" name="UNKNOWN_0BC6"/> <!-- always 00000000? -->
 	<array offset="0x0bd0" name="VSC_PIPE_CONFIG" stride="1" length="16">
@@ -1498,12 +1497,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	</reg32>
 	<reg32 offset="0x0d01" name="PC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
 	<reg32 offset="0x0d02" name="PC_MODE_CNTL"/> <!-- always 0000001f? -->
-	<reg32 offset="0x0d04" name="PC_INDEX_BUF_LO"/>
-	<reg32 offset="0x0d05" name="PC_INDEX_BUF_HI"/>
+	<reg64 offset="0x0d04" name="PC_INDEX_BUF" type="waddress"/>
 	<reg32 offset="0x0d06" name="PC_START_INDEX"/>
 	<reg32 offset="0x0d07" name="PC_MAX_INDEX"/>
-	<reg32 offset="0x0d08" name="PC_TESSFACTOR_ADDR_LO"/>
-	<reg32 offset="0x0d09" name="PC_TESSFACTOR_ADDR_HI"/>
+	<reg64 offset="0x0d08" name="PC_TESSFACTOR_ADDR" type="waddress"/>
 	<reg32 offset="0x0d10" name="PC_PERFCTR_PC_SEL_0" type="a5xx_pc_perfcounter_select"/>
 	<reg32 offset="0x0d11" name="PC_PERFCTR_PC_SEL_1" type="a5xx_pc_perfcounter_select"/>
 	<reg32 offset="0x0d12" name="PC_PERFCTR_PC_SEL_2" type="a5xx_pc_perfcounter_select"/>
@@ -1555,20 +1552,14 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x0e80" name="UCHE_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
 	<reg32 offset="0x0e81" name="UCHE_MODE_CNTL"/>
 	<reg32 offset="0x0e82" name="UCHE_SVM_CNTL"/>
-	<reg32 offset="0x0e87" name="UCHE_WRITE_THRU_BASE_LO"/>
-	<reg32 offset="0x0e88" name="UCHE_WRITE_THRU_BASE_HI"/>
-	<reg32 offset="0x0e89" name="UCHE_TRAP_BASE_LO"/>
-	<reg32 offset="0x0e8a" name="UCHE_TRAP_BASE_HI"/>
-	<reg32 offset="0x0e8b" name="UCHE_GMEM_RANGE_MIN_LO"/>
-	<reg32 offset="0x0e8c" name="UCHE_GMEM_RANGE_MIN_HI"/>
-	<reg32 offset="0x0e8d" name="UCHE_GMEM_RANGE_MAX_LO"/>
-	<reg32 offset="0x0e8e" name="UCHE_GMEM_RANGE_MAX_HI"/>
+	<reg64 offset="0x0e87" name="UCHE_WRITE_THRU_BASE" type="waddress"/>
+	<reg64 offset="0x0e89" name="UCHE_TRAP_BASE" type="waddress"/>
+	<reg64 offset="0x0e8b" name="UCHE_GMEM_RANGE_MIN" type="waddress"/>
+	<reg64 offset="0x0e8d" name="UCHE_GMEM_RANGE_MAX" type="waddress"/>
 	<reg32 offset="0x0e8f" name="UCHE_DBG_ECO_CNTL_2"/>
 	<reg32 offset="0x0e90" name="UCHE_DBG_ECO_CNTL"/>
-	<reg32 offset="0x0e91" name="UCHE_CACHE_INVALIDATE_MIN_LO"/>
-	<reg32 offset="0x0e92" name="UCHE_CACHE_INVALIDATE_MIN_HI"/>
-	<reg32 offset="0x0e93" name="UCHE_CACHE_INVALIDATE_MAX_LO"/>
-	<reg32 offset="0x0e94" name="UCHE_CACHE_INVALIDATE_MAX_HI"/>
+	<reg64 offset="0x0e91" name="UCHE_CACHE_INVALIDATE_MIN" type="address"/>
+	<reg64 offset="0x0e93" name="UCHE_CACHE_INVALIDATE_MAX" type="address"/>
 	<reg32 offset="0x0e95" name="UCHE_CACHE_INVALIDATE"/>
 	<reg32 offset="0x0e96" name="UCHE_CACHE_WAYS"/>
 	<reg32 offset="0x0ea0" name="UCHE_PERFCTR_UCHE_SEL_0" type="a5xx_uche_perfcounter_select"/>
@@ -1583,8 +1574,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x0ea9" name="UCHE_POWERCTR_UCHE_SEL_1"/>
 	<reg32 offset="0x0eaa" name="UCHE_POWERCTR_UCHE_SEL_2"/>
 	<reg32 offset="0x0eab" name="UCHE_POWERCTR_UCHE_SEL_3"/>
-	<reg32 offset="0x0eb1" name="UCHE_TRAP_LOG_LO"/>
-	<reg32 offset="0x0eb2" name="UCHE_TRAP_LOG_HI"/>
+	<reg64 offset="0x0eb1" name="UCHE_TRAP_LOG" type="waddress"/>
 
 	<reg32 offset="0x0ec0" name="SP_DBG_ECO_CNTL"/>
 	<reg32 offset="0x0ec1" name="SP_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
@@ -1923,8 +1913,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		invalidates the LRZ buffer?  (Or just the covered positions?
 		 -->
 	</reg32>
-	<reg32 offset="0xe101" name="GRAS_LRZ_BUFFER_BASE_LO"/>
-	<reg32 offset="0xe102" name="GRAS_LRZ_BUFFER_BASE_HI"/>
+	<reg64 offset="0xe101" name="GRAS_LRZ_BUFFER_BASE" type="waddress"/>
 	<!--
 	lzr pitch is depth pitch (in pixels) / 8 (aligned to 32)..
 	 -->
@@ -1933,8 +1922,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		is also divided by 8 (ie. covers 8x8 pixels)
 	</doc>
 	<reg32 offset="0xe103" name="GRAS_LRZ_BUFFER_PITCH" shr="5" type="uint"/>
-	<reg32 offset="0xe104" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE_LO"/>
-	<reg32 offset="0xe105" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE_HI"/>
+	<reg64 offset="0xe104" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE" type="waddress"/>
 
 	<reg32 offset="0xe140" name="RB_CNTL">
 		<bitfield name="WIDTH" low="0" high="7" shr="5" type="uint"/>
@@ -2035,8 +2023,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 		 -->
 		<reg32 offset="0x3" name="PITCH" shr="6" type="uint"/>
 		<reg32 offset="0x4" name="ARRAY_PITCH" shr="6" type="uint"/>
-		<reg32 offset="0x5" name="BASE_LO"/>
-		<reg32 offset="0x6" name="BASE_HI"/>
+		<reg64 offset="0x5" name="BASE" type="waddress"/>
 	</array>
 	<reg32 offset="0xe1a0" name="RB_BLEND_RED">
 		<bitfield name="UINT" low="0" high="7" type="hex"/>
@@ -2089,8 +2076,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	<reg32 offset="0xe1b2" name="RB_DEPTH_BUFFER_INFO">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a5xx_depth_format"/>
 	</reg32>
-	<reg32 offset="0xe1b3" name="RB_DEPTH_BUFFER_BASE_LO"/>
-	<reg32 offset="0xe1b4" name="RB_DEPTH_BUFFER_BASE_HI"/>
+	<reg64 offset="0xe1b3" name="RB_DEPTH_BUFFER_BASE" type="waddress"/>
 	<reg32 offset="0xe1b5" name="RB_DEPTH_BUFFER_PITCH" shr="6" type="uint">
 		<doc>stride of depth/stencil buffer</doc>
 	</reg32>
@@ -2119,8 +2105,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	<reg32 offset="0xe1c1" name="RB_STENCIL_INFO">
 		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
 	</reg32>
-	<reg32 offset="0xe1c2" name="RB_STENCIL_BASE_LO"/>
-	<reg32 offset="0xe1c3" name="RB_STENCIL_BASE_HI"/>
+	<reg64 offset="0xe1c2" name="RB_STENCIL_BASE" type="waddress"/>
 	<reg32 offset="0xe1c4" name="RB_STENCIL_PITCH" shr="6" type="uint"/>
 	<reg32 offset="0xe1c5" name="RB_STENCIL_ARRAY_PITCH" shr="6" type="uint"/>
 	<reg32 offset="0xe1c6" name="RB_STENCILREFMASK" type="adreno_rb_stencilrefmask"/>
@@ -2163,8 +2148,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 		            also for gmem->mem preserving tiling
 	-->
 	</reg32>
-	<reg32 offset="0xe214" name="RB_BLIT_DST_LO"/>
-	<reg32 offset="0xe215" name="RB_BLIT_DST_HI"/>
+	<reg64 offset="0xe214" name="RB_BLIT_DST" type="waddress"/>
 	<reg32 offset="0xe216" name="RB_BLIT_DST_PITCH" shr="6" type="uint"/>
 	<!-- array-pitch is size of layer -->
 	<reg32 offset="0xe217" name="RB_BLIT_DST_ARRAY_PITCH" shr="6" type="uint"/>
@@ -2235,25 +2219,22 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 
 
 	</doc>
-	<reg32 offset="0xe240" name="RB_DEPTH_FLAG_BUFFER_BASE_LO"/>
-	<reg32 offset="0xe241" name="RB_DEPTH_FLAG_BUFFER_BASE_HI"/>
+	<reg64 offset="0xe240" name="RB_DEPTH_FLAG_BUFFER_BASE" type="waddress"/>
 	<reg32 offset="0xe242" name="RB_DEPTH_FLAG_BUFFER_PITCH">
 	</reg32>
 	<array offset="0xe243" name="RB_MRT_FLAG_BUFFER" stride="4" length="8">
-		<reg32 offset="0" name="ADDR_LO"/>
+		<reg64 offset="0" name="ADDR" type="waddress"/>
 		<reg32 offset="1" name="ADDR_HI"/>
 		<reg32 offset="2" name="PITCH" shr="6" type="uint"/>
 		<!-- array-pitch is size of layer -->
 		<reg32 offset="3" name="ARRAY_PITCH" shr="6" type="uint"/>
 	</array>
-	<reg32 offset="0xe263" name="RB_BLIT_FLAG_DST_LO"/>
-	<reg32 offset="0xe264" name="RB_BLIT_FLAG_DST_HI"/>
+	<reg64 offset="0xe263" name="RB_BLIT_FLAG_DST" type="waddress"/>
 	<reg32 offset="0xe265" name="RB_BLIT_FLAG_DST_PITCH" shr="6" type="uint"/>
 	<!-- array-pitch is size of layer -->
 	<reg32 offset="0xe266" name="RB_BLIT_FLAG_DST_ARRAY_PITCH" shr="6" type="uint"/>
 
-	<reg32 offset="0xe267" name="RB_SAMPLE_COUNT_ADDR_LO"/>
-	<reg32 offset="0xe268" name="RB_SAMPLE_COUNT_ADDR_HI"/>
+	<reg64 offset="0xe267" name="RB_SAMPLE_COUNT_ADDR" type="waddress"/>
 
 	<reg32 offset="0xe280" name="VPC_CNTL_0">
 		<doc>
@@ -2357,13 +2338,11 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 		<bitfield name="B_EN" pos="23" type="boolean"/>
 	</reg32>
 	<array offset="0xe2a7" name="VPC_SO" stride="7" length="4">
-		<reg32 offset="0" name="BUFFER_BASE_LO"/>
-		<reg32 offset="1" name="BUFFER_BASE_HI"/>
+		<reg64 offset="0" name="BUFFER_BASE" type="waddress"/>
 		<reg32 offset="2" name="BUFFER_SIZE"/>
 		<reg32 offset="3" name="NCOMP"/>  <!-- component count -->
 		<reg32 offset="4" name="BUFFER_OFFSET"/>
-		<reg32 offset="5" name="FLUSH_BASE_LO"/>
-		<reg32 offset="6" name="FLUSH_BASE_HI"/>
+		<reg64 offset="5" name="FLUSH_BASE" type="waddress"/>
 	</array>
 
 	<reg32 offset="0xe384" name="PC_PRIMITIVE_CNTL">
@@ -2423,8 +2402,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	<reg32 offset="0xe408" name="VFD_INDEX_OFFSET"/>
 	<reg32 offset="0xe409" name="VFD_INSTANCE_START_OFFSET"/>
 	<array offset="0xe40a" name="VFD_FETCH" stride="4" length="32">
-		<reg32 offset="0x0" name="BASE_LO"/>
-		<reg32 offset="0x1" name="BASE_HI"/>
+		<reg64 offset="0x0" name="BASE" type="address"/>
 		<reg32 offset="0x2" name="SIZE" type="uint"/>
 		<reg32 offset="0x3" name="STRIDE" type="uint"/>
 	</array>
@@ -2475,7 +2453,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 		<bitfield name="VARYING" pos="16" type="boolean"/>
 		<bitfield name="PIXLODENABLE" pos="20" type="boolean"/>
 		<!-- seems to be nesting level for flow control:.. -->
-		<bitfield name="BRANCHSTACK" low="25" high="31" type="uint"/>
+		<bitfield name="BRANCHSTACK" low="24" high="31" type="uint"/>
 	</bitset>
 	<!-- assuming things appear in same relative order as a4xx: -->
 	<!-- duplicated exactly w/ corresponding HLSQ_ regs starting at 0xe78b.. -->
@@ -2516,8 +2494,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 		</reg32>
 	</array>
 	<reg32 offset="0xe5ab" name="UNKNOWN_E5AB"/>
-	<reg32 offset="0xe5ac" name="SP_VS_OBJ_START_LO"/>
-	<reg32 offset="0xe5ad" name="SP_VS_OBJ_START_HI"/>
+	<reg64 offset="0xe5ac" name="SP_VS_OBJ_START" type="address"/>
 
 	<bitset name="a5xx_sp_xs_pvt_mem_param" inline="yes">
 		<bitfield name="MEMSIZEPERITEM" low="0" high="7" shr="9">
@@ -2538,8 +2515,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	<reg32 offset="0xe5b1" name="SP_VS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
 	<reg32 offset="0xe5c0" name="SP_FS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
 	<reg32 offset="0xe5c2" name="UNKNOWN_E5C2"/>
-	<reg32 offset="0xe5c3" name="SP_FS_OBJ_START_LO"/>
-	<reg32 offset="0xe5c4" name="SP_FS_OBJ_START_HI"/>
+	<reg64 offset="0xe5c3" name="SP_FS_OBJ_START" type="address"/>
 	<reg32 offset="0xe5c5" name="SP_FS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
 	<reg64 offset="0xe5c6" name="SP_FS_PVT_MEM_ADDR" type="waddress" align="32"/>
 	<reg32 offset="0xe5c8" name="SP_FS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
@@ -2577,8 +2553,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	<reg32 offset="0xe5db" name="UNKNOWN_E5DB"/>
 	<reg32 offset="0xe5f0" name="SP_CS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
 	<reg32 offset="0xe5f2" name="UNKNOWN_E5F2"/>
-	<reg32 offset="0xe5f3" name="SP_CS_OBJ_START_LO"/>
-	<reg32 offset="0xe5f4" name="SP_CS_OBJ_START_HI"/>
+	<reg64 offset="0xe5f3" name="SP_CS_OBJ_START" type="address"/>
 	<reg32 offset="0xe5f5" name="SP_CS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
 	<reg64 offset="0xe5f6" name="SP_CS_PVT_MEM_ADDR" type="waddress" align="32"/>
 	<reg32 offset="0xe5f8" name="SP_CS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
@@ -2587,22 +2562,19 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 
 	<reg32 offset="0xe600" name="SP_HS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
 	<reg32 offset="0xe602" name="UNKNOWN_E602"/>
-	<reg32 offset="0xe603" name="SP_HS_OBJ_START_LO"/>
-	<reg32 offset="0xe604" name="SP_HS_OBJ_START_HI"/>
+	<reg64 offset="0xe603" name="SP_HS_OBJ_START" type="address"/>
 	<reg32 offset="0xe605" name="SP_HS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
 	<reg64 offset="0xe606" name="SP_HS_PVT_MEM_ADDR" type="waddress" align="32"/>
 	<reg32 offset="0xe608" name="SP_HS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
 	<reg32 offset="0xe610" name="SP_DS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
 	<reg32 offset="0xe62b" name="UNKNOWN_E62B"/>
-	<reg32 offset="0xe62c" name="SP_DS_OBJ_START_LO"/>
-	<reg32 offset="0xe62d" name="SP_DS_OBJ_START_HI"/>
+	<reg64 offset="0xe62c" name="SP_DS_OBJ_START" type="address"/>
 	<reg32 offset="0xe62e" name="SP_DS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
 	<reg64 offset="0xe62f" name="SP_DS_PVT_MEM_ADDR" type="waddress" align="32"/>
 	<reg32 offset="0xe631" name="SP_DS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
 	<reg32 offset="0xe640" name="SP_GS_CTRL_REG0" type="a5xx_sp_xs_ctrl_reg0"/>
 	<reg32 offset="0xe65b" name="UNKNOWN_E65B"/>
-	<reg32 offset="0xe65c" name="SP_GS_OBJ_START_LO"/>
-	<reg32 offset="0xe65d" name="SP_GS_OBJ_START_HI"/>
+	<reg64 offset="0xe65c" name="SP_GS_OBJ_START" type="address"/>
 	<reg32 offset="0xe65e" name="SP_GS_PVT_MEM_PARAM" type="a5xx_sp_xs_pvt_mem_param"/>
 	<reg64 offset="0xe65f" name="SP_GS_PVT_MEM_ADDR" type="waddress" align="32"/>
 	<reg32 offset="0xe661" name="SP_GS_PVT_MEM_SIZE" type="a5xx_sp_xs_pvt_mem_size"/>
@@ -2615,8 +2587,7 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
 	</reg32>
 	<!-- either blob is doing it wrong, or this is not per-stage anymore: -->
-	<reg32 offset="0xe706" name="TPL1_TP_BORDER_COLOR_BASE_ADDR_LO"/>
-	<reg32 offset="0xe707" name="TPL1_TP_BORDER_COLOR_BASE_ADDR_HI"/>
+	<reg64 offset="0xe706" name="TPL1_TP_BORDER_COLOR_BASE_ADDR" type="address"/>
 
 	<!--
 	so these have the same info that is normally in the CP_LOAD_STATE
@@ -2628,35 +2599,23 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	<reg32 offset="0xe702" name="TPL1_DS_TEX_COUNT" type="uint"/>
 	<reg32 offset="0xe703" name="TPL1_GS_TEX_COUNT" type="uint"/>
 
-	<reg32 offset="0xe722" name="TPL1_VS_TEX_SAMP_LO"/>
-	<reg32 offset="0xe723" name="TPL1_VS_TEX_SAMP_HI"/>
-	<reg32 offset="0xe724" name="TPL1_HS_TEX_SAMP_LO"/>
-	<reg32 offset="0xe725" name="TPL1_HS_TEX_SAMP_HI"/>
-	<reg32 offset="0xe726" name="TPL1_DS_TEX_SAMP_LO"/>
-	<reg32 offset="0xe727" name="TPL1_DS_TEX_SAMP_HI"/>
-	<reg32 offset="0xe728" name="TPL1_GS_TEX_SAMP_LO"/>
-	<reg32 offset="0xe729" name="TPL1_GS_TEX_SAMP_HI"/>
-
-	<reg32 offset="0xe72a" name="TPL1_VS_TEX_CONST_LO"/>
-	<reg32 offset="0xe72b" name="TPL1_VS_TEX_CONST_HI"/>
-	<reg32 offset="0xe72c" name="TPL1_HS_TEX_CONST_LO"/>
-	<reg32 offset="0xe72d" name="TPL1_HS_TEX_CONST_HI"/>
-	<reg32 offset="0xe72e" name="TPL1_DS_TEX_CONST_LO"/>
-	<reg32 offset="0xe72f" name="TPL1_DS_TEX_CONST_HI"/>
-	<reg32 offset="0xe730" name="TPL1_GS_TEX_CONST_LO"/>
-	<reg32 offset="0xe731" name="TPL1_GS_TEX_CONST_HI"/>
+	<reg64 offset="0xe722" name="TPL1_VS_TEX_SAMP" type="address"/>
+	<reg64 offset="0xe724" name="TPL1_HS_TEX_SAMP" type="address"/>
+	<reg64 offset="0xe726" name="TPL1_DS_TEX_SAMP" type="address"/>
+	<reg64 offset="0xe728" name="TPL1_GS_TEX_SAMP" type="address"/>
+
+	<reg64 offset="0xe72a" name="TPL1_VS_TEX_CONST" type="address"/>
+	<reg64 offset="0xe72c" name="TPL1_HS_TEX_CONST" type="address"/>
+	<reg64 offset="0xe72e" name="TPL1_DS_TEX_CONST" type="address"/>
+	<reg64 offset="0xe730" name="TPL1_GS_TEX_CONST" type="address"/>
 
 	<reg32 offset="0xe750" name="TPL1_FS_TEX_COUNT" type="uint"/>
 	<reg32 offset="0xe751" name="TPL1_CS_TEX_COUNT" type="uint"/>
 
-	<reg32 offset="0xe75a" name="TPL1_FS_TEX_SAMP_LO"/>
-	<reg32 offset="0xe75b" name="TPL1_FS_TEX_SAMP_HI"/>
-	<reg32 offset="0xe75c" name="TPL1_CS_TEX_SAMP_LO"/>
-	<reg32 offset="0xe75d" name="TPL1_CS_TEX_SAMP_HI"/>
-	<reg32 offset="0xe75e" name="TPL1_FS_TEX_CONST_LO"/>
-	<reg32 offset="0xe75f" name="TPL1_FS_TEX_CONST_HI"/>
-	<reg32 offset="0xe760" name="TPL1_CS_TEX_CONST_LO"/>
-	<reg32 offset="0xe761" name="TPL1_CS_TEX_CONST_HI"/>
+	<reg64 offset="0xe75a" name="TPL1_FS_TEX_SAMP" type="address"/>
+	<reg64 offset="0xe75c" name="TPL1_CS_TEX_SAMP" type="address"/>
+	<reg64 offset="0xe75e" name="TPL1_FS_TEX_CONST" type="address"/>
+	<reg64 offset="0xe760" name="TPL1_CS_TEX_CONST" type="address"/>
 
 	<reg32 offset="0xe764" name="TPL1_TP_FS_ROTATION_CNTL"/>
 
@@ -2809,25 +2768,21 @@ bit 7 for RECTLIST (clear) when z32s8 (used for clear of depth32?  not set
 	</bitset>
 
 	<reg32 offset="0x2107" name="RB_2D_SRC_INFO" type="a5xx_2d_surf_info"/>
-	<reg32 offset="0x2108" name="RB_2D_SRC_LO"/>
-	<reg32 offset="0x2109" name="RB_2D_SRC_HI"/>
+	<reg64 offset="0x2108" name="RB_2D_SRC" type="address"/>
 	<reg32 offset="0x210a" name="RB_2D_SRC_SIZE">
 		<bitfield name="PITCH" low="0" high="15" shr="6" type="uint"/>
 		<bitfield name="ARRAY_PITCH" low="16" high="31" shr="6" type="uint"/>
 	</reg32>
 
 	<reg32 offset="0x2110" name="RB_2D_DST_INFO" type="a5xx_2d_surf_info"/>
-	<reg32 offset="0x2111" name="RB_2D_DST_LO"/>
-	<reg32 offset="0x2112" name="RB_2D_DST_HI"/>
+	<reg64 offset="0x2111" name="RB_2D_DST" type="address"/>
 	<reg32 offset="0x2113" name="RB_2D_DST_SIZE">
 		<bitfield name="PITCH" low="0" high="15" shr="6" type="uint"/>
 		<bitfield name="ARRAY_PITCH" low="16" high="31" shr="6" type="uint"/>
 	</reg32>
-	<reg32 offset="0x2140" name="RB_2D_SRC_FLAGS_LO"/>
-	<reg32 offset="0x2141" name="RB_2D_SRC_FLAGS_HI"/>
+	<reg64 offset="0x2140" name="RB_2D_SRC_FLAGS" type="address"/>
         <reg32 offset="0x2142" name="RB_2D_SRC_FLAGS_PITCH" shr="6" type="uint"/>
-	<reg32 offset="0x2143" name="RB_2D_DST_FLAGS_LO"/>
-	<reg32 offset="0x2144" name="RB_2D_DST_FLAGS_HI"/>
+	<reg64 offset="0x2143" name="RB_2D_DST_FLAGS" type="address"/>
         <reg32 offset="0x2145" name="RB_2D_DST_FLAGS_PITCH" shr="6" type="uint"/>
 	<reg32 offset="0x2180" name="GRAS_2D_BLIT_CNTL"/> <!-- same as 0x2100 -->
 	<!-- looks same as 0x2107: -->
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2309870f5031..3349c01646e1 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -10,19 +10,24 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 <import file="adreno/a8xx_enums.xml"/>
 <import file="adreno/a6xx_perfcntrs.xml"/>
 <import file="adreno/a7xx_perfcntrs.xml"/>
+<import file="adreno/a8xx_perfcntrs.xml"/>
 <import file="adreno/a6xx_descriptors.xml"/>
 <import file="adreno/a8xx_descriptors.xml"/>
 
 <!--
 Each register that is actually being used by driver should have "usage" defined,
 currently there are following usages:
+- "init" - registers written (in ib1 generally, or ambles) to get the
+		GPU into a known state.
 - "cmd" - the register is used outside of renderpass and blits,
 		roughly corresponds to registers used in ib1 for Freedreno
-- "rp_blit" - the register is used inside renderpass or blits
-		(ib2 for Freedreno)
+- "draw" - used by 3d draw cmds
+- "compute" - used by compute cmds
+- "blit" - used by CP_BLIT cmds
+- "resolve" - used by CCU_RESOLVE (resolve/unresolve/clear) events
 
-It is expected that register with "cmd" usage may be written into only at
-the start of the command buffer (ib1), while "rp_blit" usage indicates that register
+It is expected that register with "cmd" and "init" usage may be written into only at
+the start of the command buffer (ib1), while other usages indicates that register
 is either overwritten by renderpass/blit (ib2) or not used if not overwritten
 by a particular renderpass/blit.
 -->
@@ -1321,7 +1326,7 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x0c00" name="VSC_DBG_ECO_CNTL"/>
 	<reg32 offset="0x0df0" name="VSC_KMD_DBG_ECO_CNTL" variants="A8XX-"/>
-	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" usage="rp_blit" variants="A6XX-A7XX">
+	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" usage="cmd" variants="A6XX-A7XX">
 		<bitfield name="BINW" low="0" high="7" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="16" shr="4" type="uint"/>
 	</reg32>
@@ -1331,13 +1336,13 @@ by a particular renderpass/blit.
 		<bitfield name="BINH" low="16" high="26" shr="4" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" type="a8xx_bin_size" usage="rp_blit" variants="A8XX"/>
+	<reg32 offset="0x0c02" name="VSC_BIN_SIZE" type="a8xx_bin_size" usage="cmd" variants="A8XX"/>
 	<reg64 offset="0x0c03" name="VSC_SIZE_BASE" type="waddress" usage="cmd"/>
-	<reg32 offset="0x0c06" name="VSC_EXPANDED_BIN_CNTL" usage="rp_blit">
+	<reg32 offset="0x0c06" name="VSC_EXPANDED_BIN_CNTL" usage="cmd">
 		<bitfield name="NX" low="1" high="10" type="uint"/>
 		<bitfield name="NY" low="11" high="20" type="uint"/>
 	</reg32>
-	<array offset="0x0c10" name="VSC_PIPE_CONFIG" stride="1" length="32" usage="rp_blit">
+	<array offset="0x0c10" name="VSC_PIPE_CONFIG" stride="1" length="32" usage="cmd">
 		<reg32 offset="0x0" name="REG">
 			<doc>
 				Configures the mapping between VSC_PIPE buffer and
@@ -1370,7 +1375,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0c36" name="VSC_PIPE_DATA_DRAW_STRIDE" usage="cmd"/>
 	<reg32 offset="0x0c37" name="VSC_PIPE_DATA_DRAW_LENGTH" usage="cmd"/>
 
-	<array offset="0x0c38" name="VSC_CHANNEL_VISIBILITY" stride="1" length="32" usage="rp_blit">
+	<array offset="0x0c38" name="VSC_CHANNEL_VISIBILITY" stride="1" length="32" usage="cmd">
 		<doc>
 			Seems to be a bitmap of which tiles mapped to the VSC
 			pipe contain geometry.
@@ -1381,7 +1386,7 @@ by a particular renderpass/blit.
 		<reg32 offset="0x0" name="REG"/>
 	</array>
 
-	<array offset="0x0c58" name="VSC_PIPE_DATA_PRIM_SIZE" stride="1" length="32" variants="A6XX" usage="rp_blit">
+	<array offset="0x0c58" name="VSC_PIPE_DATA_PRIM_SIZE" stride="1" length="32" variants="A6XX" usage="cmd">
 		<doc>
 			Has the size of data written to corresponding VSC_PRIM_STRM
 			buffer.
@@ -1389,7 +1394,7 @@ by a particular renderpass/blit.
 		<reg32 offset="0x0" name="REG"/>
 	</array>
 
-	<array offset="0x0c78" name="VSC_PIPE_DATA_DRAW_SIZE" stride="1" length="32" variants="A6XX" usage="rp_blit">
+	<array offset="0x0c78" name="VSC_PIPE_DATA_DRAW_SIZE" stride="1" length="32" variants="A6XX" usage="cmd">
 		<doc>
 			Has the size of data written to corresponding VSC pipe, ie.
 			same thing that is written out to VSC_SIZE_BASE
@@ -1397,7 +1402,7 @@ by a particular renderpass/blit.
 		<reg32 offset="0x0" name="REG"/>
 	</array>
 
-	<reg32 offset="0x0d08" name="VSC_UNKNOWN_0D08" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0x0d08" name="VSC_UNKNOWN_0D08" variants="A7XX-" usage="cmd"/>
 
 	<reg32 offset="0x0e10" name="UCHE_UNKNOWN_0E10" variants="A7XX" usage="init"/>
 	<reg32 offset="0x0e10" name="UCHE_VARB_IDLE_TIMEOUT" variants="A8XX-"/>
@@ -1428,29 +1433,22 @@ by a particular renderpass/blit.
 		<bitfield name="PERSP_DIVISION_DISABLE" pos="9" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x8000" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8200" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8000" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8200" name="GRAS_CL_CNTL" type="a6xx_gras_cl_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_xs_clip_cull_distance" inline="yes">
 		<bitfield name="CLIP_MASK" low="0" high="7"/>
 		<bitfield name="CULL_MASK" low="8" high="15"/>
 	</bitset>
-	<reg32 offset="0x8001" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
-	<reg32 offset="0x8002" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
-	<reg32 offset="0x8003" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A6XX-A7XX" />
-	<reg32 offset="0x8004" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="rp_blit" variants="A6XX-A7XX" />
-
-	<reg32 offset="0x8201" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A8XX" />
-	<reg32 offset="0x8202" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A8XX" />
-	<reg32 offset="0x8203" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="rp_blit" variants="A8XX" />
-	<reg32 offset="0x8204" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="rp_blit" variants="A8XX" />
-
-	<reg32 offset="0x8228" name="GRAS_UNKNOWN_8228" variants="A8XX-"/>
-	<reg32 offset="0x8229" name="GRAS_UNKNOWN_8229" variants="A8XX-"/>
-	<reg32 offset="0x822a" name="GRAS_UNKNOWN_822A" variants="A8XX-"/>
-	<reg32 offset="0x822b" name="GRAS_UNKNOWN_822B" variants="A8XX-"/>
-	<reg32 offset="0x822c" name="GRAS_UNKNOWN_822C" variants="A8XX-"/>
-	<reg32 offset="0x822d" name="GRAS_UNKNOWN_822D" variants="A8XX-"/>
+	<reg32 offset="0x8001" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="draw" variants="A6XX-A7XX" />
+	<reg32 offset="0x8002" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="draw" variants="A6XX-A7XX" />
+	<reg32 offset="0x8003" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="draw" variants="A6XX-A7XX" />
+	<reg32 offset="0x8004" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="draw" variants="A6XX-A7XX" />
+
+	<reg32 offset="0x8201" name="GRAS_CL_VS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="draw" variants="A8XX" />
+	<reg32 offset="0x8202" name="GRAS_CL_DS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="draw" variants="A8XX" />
+	<reg32 offset="0x8203" name="GRAS_CL_GS_CLIP_CULL_DISTANCE" type="a6xx_gras_xs_clip_cull_distance" usage="draw" variants="A8XX" />
+	<reg32 offset="0x8204" name="GRAS_CL_ARRAY_SIZE" low="0" high="10" type="uint" usage="draw" variants="A8XX" />
 
 	<bitset name="a6xx_gras_cl_interp_cntl" inline="yes">
 		<!-- see also RB_INTERP_CNTL -->
@@ -1465,16 +1463,16 @@ by a particular renderpass/blit.
 		<bitfield name="UNK11" pos="11" type="boolean" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x8005" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8080" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8005" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8080" name="GRAS_CL_INTERP_CNTL" type="a6xx_gras_cl_interp_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_cl_guardband_clip_adj" inline="true">
 		<bitfield name="HORZ" low="0" high="8" type="uint"/>
 		<bitfield name="VERT" low="10" high="18" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x8006" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8205" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8006" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8205" name="GRAS_CL_GUARDBAND_CLIP_ADJ" type="a6xx_gras_cl_guardband_clip_adj" variants="A8XX-" usage="draw"/>
 
 	<!-- the scale/offset is per view, with up to 6 views -->
 	<bitset name="a6xx_gras_bin_foveat" inline="yes">
@@ -1499,33 +1497,48 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<reg32 offset="0x8008" name="GRAS_BIN_FOVEAT" type="a6xx_gras_bin_foveat" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0x8206" name="GRAS_BIN_FOVEAT" type="a6xx_gras_bin_foveat" variants="A8XX-" usage="cmd"/>
+	<reg32 offset="0x8206" name="GRAS_BIN_FOVEAT" type="a6xx_gras_bin_foveat" variants="A8XX-" usage="cmd">
+		<bitfield name="FDM_OFFSET_EN" pos="7" type="boolean"/>
+	</reg32>
 
-	<reg32 offset="0x8009" name="GRAS_BIN_FOVEAT_OFFSET_0" variants="A7XX-" usage="cmd">
+	<reg32 offset="0x8009" name="GRAS_BIN_FOVEAT_OFFSET_0" variants="A7XX" usage="cmd">
 		<bitfield name="XOFFSET_0" low="0" high="9" shr="2" type="uint"/>
 		<bitfield name="XOFFSET_1" low="10" high="19" shr="2" type="uint"/>
 		<bitfield name="XOFFSET_2" low="20" high="29" shr="2" type="uint"/>
 	</reg32>
-	<reg32 offset="0x800a" name="GRAS_BIN_FOVEAT_OFFSET_1" variants="A7XX-" usage="cmd">
+	<reg32 offset="0x800a" name="GRAS_BIN_FOVEAT_OFFSET_1" variants="A7XX" usage="cmd">
 		<bitfield name="XOFFSET_3" low="0" high="9" shr="2" type="uint"/>
 		<bitfield name="XOFFSET_4" low="10" high="19" shr="2" type="uint"/>
 		<bitfield name="XOFFSET_5" low="20" high="29" shr="2" type="uint"/>
 	</reg32>
-	<reg32 offset="0x800b" name="GRAS_BIN_FOVEAT_OFFSET_2" variants="A7XX-" usage="cmd">
+	<reg32 offset="0x800b" name="GRAS_BIN_FOVEAT_OFFSET_2" variants="A7XX" usage="cmd">
 		<bitfield name="YOFFSET_0" low="0" high="9" shr="2" type="uint"/>
 		<bitfield name="YOFFSET_1" low="10" high="19" shr="2" type="uint"/>
 		<bitfield name="YOFFSET_2" low="20" high="29" shr="2" type="uint"/>
 	</reg32>
-	<reg32 offset="0x800c" name="GRAS_BIN_FOVEAT_OFFSET_3" variants="A7XX-" usage="cmd">
+	<reg32 offset="0x800c" name="GRAS_BIN_FOVEAT_OFFSET_3" variants="A7XX" usage="cmd">
 		<bitfield name="YOFFSET_3" low="0" high="9" shr="2" type="uint"/>
 		<bitfield name="YOFFSET_4" low="10" high="19" shr="2" type="uint"/>
 		<bitfield name="YOFFSET_5" low="20" high="29" shr="2" type="uint"/>
 	</reg32>
 
+	<bitset name="a8xx_bin_foveat_xy" inline="yes">
+		<bitfield name="XOFFSET" low="0" high="13" type="uint"/>
+		<bitfield name="YOFFSET" low="16" high="29" type="uint"/>
+	</bitset>
+
+	<array offset="0x8220" name="GRAS_BIN_FOVEAT_XY" stride="1" length="6" variants="A8XX-" usage="cmd">
+		<reg32 offset="0" name="OFFSET" type="a8xx_bin_foveat_xy"/>
+	</array>
+
+	<array offset="0x8228" name="GRAS_BIN_FOVEAT_XY_FDM" stride="1" length="6" variants="A8XX-" usage="cmd">
+		<reg32 offset="0" name="OFFSET" type="a8xx_bin_foveat_xy"/>
+	</array>
+
 	<!-- <reg32 offset="0x80f0" name="GRAS_UNKNOWN_80F0" type="a6xx_reg_xy"/> -->
 
 	<!-- 0x8006-0x800f invalid -->
-	<array offset="0x8010" name="GRAS_CL_VIEWPORT" stride="6" length="16" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x8010" name="GRAS_CL_VIEWPORT" stride="6" length="16" variants="A6XX-A7XX" usage="draw">
 		<reg32 offset="0" name="XOFFSET" type="float"/>
 		<reg32 offset="1" name="XSCALE" type="float"/>
 		<reg32 offset="2" name="YOFFSET" type="float"/>
@@ -1534,7 +1547,7 @@ by a particular renderpass/blit.
 		<reg32 offset="5" name="ZSCALE" type="float"/>
 	</array>
 
-	<array offset="0x82d0" name="GRAS_CL_VIEWPORT" stride="6" length="16" variants="A8XX-" usage="rp_blit">
+	<array offset="0x82d0" name="GRAS_CL_VIEWPORT" stride="6" length="16" variants="A8XX-" usage="draw">
 		<reg32 offset="0" name="XOFFSET" type="float"/>
 		<reg32 offset="1" name="XSCALE" type="float"/>
 		<reg32 offset="2" name="YOFFSET" type="float"/>
@@ -1543,16 +1556,16 @@ by a particular renderpass/blit.
 		<reg32 offset="5" name="ZSCALE" type="float"/>
 	</array>
 
-	<array offset="0x8070" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x8070" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A6XX-A7XX" usage="draw">
 		<reg32 offset="0" name="MIN" type="float"/>
 		<reg32 offset="1" name="MAX" type="float"/>
 	</array>
-	<array offset="0x80c0" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A8XX-" usage="rp_blit">
+	<array offset="0x80c0" name="GRAS_CL_VIEWPORT_ZCLAMP" stride="2" length="16" variants="A8XX-" usage="draw">
 		<reg32 offset="0" name="MIN" type="float"/>
 		<reg32 offset="1" name="MAX" type="float"/>
 	</array>
 
-	<bitset name="a6xx_gras_su_cntl" varset="chip">
+	<bitset name="a6xx_gras_su_cntl" inline="yes">
 		<bitfield name="CULL_FRONT" pos="0" type="boolean"/>
 		<bitfield name="CULL_BACK" pos="1" type="boolean"/>
 		<bitfield name="FRONT_CW" pos="2" type="boolean"/>
@@ -1572,17 +1585,18 @@ by a particular renderpass/blit.
 			TODO: what about gen2 (a640)?
 		-->
 		<bitfield name="MULTIVIEW_ENABLE" pos="17" type="boolean"/>
-		<bitfield name="RENDERTARGETINDEXINCR" pos="18" type="boolean" variants="A6XX-A7XX"/>
-		<bitfield name="VIEWPORTINDEXINCR" pos="19" type="boolean" variants="A6XX-A7XX"/>
-		<bitfield name="UNK20" low="20" high="22" variants="A6XX-A7XX"/>
 	</bitset>
-	<reg32 offset="0x8090" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8209" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A8XX-" usage="rp_blit"/>
-
-	<!-- Fields moved from GRAS_SU_CNTL on earlier gens: -->
-	<reg32 offset="0x820c" name="GRAS_SU_STEREO_CNTL" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0x8090" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A6XX-A7XX" usage="draw">
 		<bitfield name="RENDERTARGETINDEXINCR" pos="18" type="boolean"/>
 		<bitfield name="VIEWPORTINDEXINCR" pos="19" type="boolean"/>
+		<bitfield name="UNK20" low="20" high="22"/>
+	</reg32>
+	<reg32 offset="0x8209" name="GRAS_SU_CNTL" type="a6xx_gras_su_cntl" variants="A8XX-" usage="draw"/>
+
+	<!-- Fields moved from GRAS_SU_CNTL on earlier gens: -->
+	<reg32 offset="0x820c" name="GRAS_SU_STEREO_CNTL" variants="A8XX-" usage="draw">
+		<bitfield name="RENDERTARGETINDEXINCR" pos="0" type="boolean"/>
+		<bitfield name="VIEWPORTINDEXINCR" pos="1" type="boolean"/>
 	</reg32>
 
 	<bitset name="a6xx_gras_su_point_minmax" inline="yes">
@@ -1590,49 +1604,49 @@ by a particular renderpass/blit.
 		<bitfield name="MAX" low="16" high="31" type="ufixed" radix="4"/>
 	</bitset>
 
-	<reg32 offset="0x8091" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x820a" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8091" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x820a" name="GRAS_SU_POINT_MINMAX" type="a6xx_gras_su_point_minmax" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x8092" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x820b" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8092" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x820b" name="GRAS_SU_POINT_SIZE" low="0" high="15" type="fixed" radix="4" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_su_depth_cntl" inline="yes">
 		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x8114" name="GRAS_SU_DEPTH_CNTL" variants="A6XX-A7XX" type="a6xx_gras_su_depth_cntl" usage="rp_blit"/>
-	<reg32 offset="0x8086" name="GRAS_SU_DEPTH_CNTL" variants="A8XX-" type="a6xx_gras_su_depth_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8114" name="GRAS_SU_DEPTH_CNTL" variants="A6XX-A7XX" type="a6xx_gras_su_depth_cntl" usage="draw"/>
+	<reg32 offset="0x8086" name="GRAS_SU_DEPTH_CNTL" variants="A8XX-" type="a6xx_gras_su_depth_cntl" usage="draw"/>
 
 	<bitset name="a6xx_gras_su_stencil_cntl" inline="yes">
 		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x8115" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8087" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8115" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8087" name="GRAS_SU_STENCIL_CNTL" type="a6xx_gras_su_stencil_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_su_render_cntl" inline="yes">
 		<bitfield name="FS_DISABLE" pos="7" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x8116" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8088" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8116" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x8088" name="GRAS_SU_RENDER_CNTL" type="a6xx_gras_su_render_cntl" variants="A8XX-" usage="draw"/>
 
 	<!-- 0x8093 invalid -->
 	<bitset name="a6xx_depth_plane_cntl" inline="yes">
 		<bitfield name="Z_MODE" low="0" high="1" type="a6xx_ztest_mode"/>
 	</bitset>
 
-	<reg32 offset="0x8094" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8089" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8094" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8089" name="GRAS_SU_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x8095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A6XX-A7XX"  usage="rp_blit"/>
-	<reg32 offset="0x808a" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A8XX-"  usage="rp_blit"/>
+	<reg32 offset="0x8095" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A6XX-A7XX"  usage="draw"/>
+	<reg32 offset="0x808a" name="GRAS_SU_POLY_OFFSET_SCALE" type="float" variants="A8XX-"  usage="draw"/>
 
-	<reg32 offset="0x8096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A6XX-A7XX"  usage="rp_blit"/>
-	<reg32 offset="0x808b" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A8XX-"  usage="rp_blit"/>
+	<reg32 offset="0x8096" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A6XX-A7XX"  usage="draw"/>
+	<reg32 offset="0x808b" name="GRAS_SU_POLY_OFFSET_OFFSET" type="float" variants="A8XX-"  usage="draw"/>
 
-	<reg32 offset="0x8097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x808c" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8097" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x808c" name="GRAS_SU_POLY_OFFSET_OFFSET_CLAMP" type="float" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_depth_buffer_info" inline="yes">
 		<bitfield name="DEPTH_FORMAT" low="0" high="2" type="a6xx_depth_format"/>
@@ -1640,8 +1654,8 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<!-- duplicates RB_DEPTH_BUFFER_INFO: -->
-	<reg32 offset="0x8098" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x808d" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8098" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x808d" name="GRAS_SU_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_su_conservative_ras_cntl" inline="yes">
 		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
@@ -1667,19 +1681,19 @@ by a particular renderpass/blit.
 		<bitfield name="WRITES_LAYER" pos="0" type="boolean"/>
 		<bitfield name="WRITES_VIEW" pos="1" type="boolean"/>
 	</bitset>
-	<reg32 offset="0x809b" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x809c" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x809d" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x809b" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x809c" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x809d" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
 
-	<reg32 offset="0x820e" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="rp_blit"/>
-	<reg32 offset="0x820f" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="rp_blit"/>
-	<reg32 offset="0x8210" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x820e" name="GRAS_SU_VS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="draw"/>
+	<reg32 offset="0x820f" name="GRAS_SU_GS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="draw"/>
+	<reg32 offset="0x8210" name="GRAS_SU_DS_SIV_CNTL" type="a6xx_gras_us_xs_siv_cntl" variants="A8XX" usage="draw"/>
 
 	<bitset name="a6xx_rast_cntl" inline="yes">
 		<bitfield name="MODE" low="0" high="1" type="a6xx_polygon_mode"/>
 	</bitset>
 
-	<reg32 offset="0x8211" name="GRAS_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8211" name="GRAS_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="draw"/>
 
 	<enum name="a6xx_sequenced_thread_dist">
 		<value value="0x0" name="DIST_SCREEN_COORD"/>
@@ -1738,10 +1752,10 @@ by a particular renderpass/blit.
 		<bitfield name="EARLYVIZOUTEN" pos="12" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x80a0" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A6XX-A7XX" usage="rp_blit">
+	<reg32 offset="0x80a0" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A6XX-A7XX" usage="draw">
 		<bitfield name="CCUSINGLECACHELINESIZE" low="0" high="2" variants="A6XX-A7XX"/>
 	</reg32>
-	<reg32 offset="0x8230" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8230" name="GRAS_SC_CNTL" type="a6xx_gras_sc_cntl" variants="A8XX-" usage="draw"/>
 
 	<enum name="a6xx_render_mode">
 		<value value="0x0" name="RENDERING_PASS"/>
@@ -1778,7 +1792,7 @@ by a particular renderpass/blit.
 		<bitfield name="FORCE_LRZ_DIS" pos="27" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x80a1" name="GRAS_SC_BIN_CNTL" type="a6xx_bin_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x80a1" name="GRAS_SC_BIN_CNTL" type="a6xx_bin_cntl" variants="A6XX-A7XX" usage="cmd"/>
 
 	<!-- Common fields for RB_CNTL and GRAS_SC_BIN_CNTL -->
 	<bitset name="a8xx_bin_cntl" inline="yes">
@@ -1795,7 +1809,7 @@ by a particular renderpass/blit.
 		<bitfield name="FORCE_LRZ_WRITE_DIS" pos="31" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x8231" name="GRAS_SC_BIN_CNTL" type="a8xx_bin_cntl" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0x8231" name="GRAS_SC_BIN_CNTL" type="a8xx_bin_cntl" variants="A8XX-" usage="cmd">
 		<bitfield name="CONS_VIS_IN_BINNING" pos="10" type="boolean"/>
 		<bitfield name="FORCE_BI_DIR_LRZ_DISABLE" pos="14" type="boolean"/>
 		<bitfield name="FORCE_LRZ_DIS" pos="15" type="boolean"/>
@@ -1808,16 +1822,16 @@ by a particular renderpass/blit.
 		<bitfield name="UNK3" pos="3"/>
 	</bitset>
 
-	<reg32 offset="0x80a2" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8232" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80a2" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8232" name="GRAS_SC_RAS_MSAA_CNTL" type="a6xx_gras_sc_ras_msaa_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_sc_dest_msaa_cntl" inline="yes">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x80a3" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8233" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80a3" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x8233" name="GRAS_SC_DEST_MSAA_CNTL" type="a6xx_gras_sc_dest_msaa_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_msaa_sample_pos_cntl" inline="yes">
 		<bitfield name="UNK0" pos="0"/>
@@ -1835,15 +1849,15 @@ by a particular renderpass/blit.
 		<bitfield name="SAMPLE_3_Y" low="28" high="31" radix="4" type="fixed"/>
 	</bitset>
 
-	<reg32 offset="0x80a4" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x80a5" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x80a6" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x80a4" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x80a5" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x80a6" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A6XX-A7XX" usage="draw"/>
 
-	<reg32 offset="0x8237" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8238" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8239" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x823a" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_2" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x823b" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_3" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8237" name="GRAS_SC_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x8238" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x8239" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x823a" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_2" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x823b" name="GRAS_SC_PROGRAMMABLE_MSAA_POS_3" type="a6xx_programmable_msaa_pos" variants="A8XX-" usage="draw"/>
 
 	<reg32 offset="0x80a7" name="GRAS_ROTATION_CNTL" variants="A7XX" usage="cmd"/>
 	<reg32 offset="0x8207" name="GRAS_ROTATION_CNTL" variants="A8XX-" usage="cmd"/>
@@ -1860,30 +1874,53 @@ by a particular renderpass/blit.
 		<bitfield name="Y" low="16" high="31" type="uint"/>
 	</bitset>
 
-	<array offset="0x80b0" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x80b0" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="draw">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
 
-	<array offset="0x8240" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" variants="A8XX-" usage="rp_blit">
+	<array offset="0x8240" name="GRAS_SC_SCREEN_SCISSOR" stride="2" length="16" variants="A8XX-" usage="draw">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
 
-	<array offset="0x80d0" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x80d0" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A6XX-A7XX" usage="draw">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
-	<array offset="0x8270" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A8XX-" usage="rp_blit">
+	<array offset="0x8270" name="GRAS_SC_VIEWPORT_SCISSOR" stride="2" length="16" variants="A8XX-" usage="draw">
 		<reg32 offset="0" name="TL" type="a6xx_scissor_xy"/>
 		<reg32 offset="1" name="BR" type="a6xx_scissor_xy"/>
 	</array>
 
-	<reg32 offset="0x80f0" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x80f1" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x829f" name="GRAS_SC_WINDOW_INV_SCISSOR_CNTL" variants="A8XX-">
+		<bitfield name="INCLUSION" pos="0" type="boolean"/> <!-- if not set, EXCLUSION -->
+		<bitfield name="VP0_INV_SCISSOR_0_EN" pos="4" type="boolean"/>
+		<bitfield name="VP0_INV_SCISSOR_1_EN" pos="5" type="boolean"/>
+		<bitfield name="VP1_INV_SCISSOR_0_EN" pos="6" type="boolean"/>
+		<bitfield name="VP1_INV_SCISSOR_1_EN" pos="7" type="boolean"/>
+		<bitfield name="VP2_INV_SCISSOR_0_EN" pos="8" type="boolean"/>
+		<bitfield name="VP2_INV_SCISSOR_1_EN" pos="9" type="boolean"/>
+		<bitfield name="VP3_INV_SCISSOR_0_EN" pos="10" type="boolean"/>
+		<bitfield name="VP3_INV_SCISSOR_1_EN" pos="11" type="boolean"/>
+		<bitfield name="VP4_INV_SCISSOR_0_EN" pos="12" type="boolean"/>
+		<bitfield name="VP4_INV_SCISSOR_1_EN" pos="13" type="boolean"/>
+		<bitfield name="VP5_INV_SCISSOR_0_EN" pos="14" type="boolean"/>
+		<bitfield name="VP5_INV_SCISSOR_1_EN" pos="15" type="boolean"/>
+	</reg32>
+
+	<array offset="0x82a0" name="GRAS_SC_WINDOW_VP" stride="4" length="6" variants="A8XX-">
+		<reg32 offset="0" name="INV_SCISSOR_0_TL" type="a6xx_scissor_xy"/>
+		<reg32 offset="1" name="INV_SCISSOR_0_BR" type="a6xx_scissor_xy"/>
+		<reg32 offset="2" name="INV_SCISSOR_1_TL" type="a6xx_scissor_xy"/>
+		<reg32 offset="3" name="INV_SCISSOR_1_BR" type="a6xx_scissor_xy"/>
+	</array>
 
-	<reg32 offset="0x8235" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8236" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80f0" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x80f1" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="draw"/>
+
+	<reg32 offset="0x8235" name="GRAS_SC_WINDOW_SCISSOR_TL" type="a6xx_reg_xy" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x8236" name="GRAS_SC_WINDOW_SCISSOR_BR" type="a6xx_reg_xy" variants="A8XX-" usage="draw"/>
 
 	<enum name="a6xx_fsr_combiner">
 		<value value="0" name="FSR_COMBINER_OP_KEEP"/>
@@ -1893,45 +1930,59 @@ by a particular renderpass/blit.
 		<value value="4" name="FSR_COMBINER_OP_MUL"/>
 	</enum>
 
-	<bitset name="a6xx_gras_vrs_config">
+	<enum name="a6xx_fsr_combiner_clamp_mode">
+		<value value="0" name="FSR_COMBINER_CLAMP_4x4"/>
+		<value value="1" name="FSR_COMBINER_CLAMP_2x2"/>
+		<!-- gen8 and later, reserved on earlier gens: -->
+		<value value="2" name="FSR_COMBINER_CLAMP_16_SAMP"/>
+	</enum>
+
+	<bitset name="a6xx_gras_vrs_config" inline="yes">
 		<bitfield name="PIPELINE_FSR_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="FRAG_SIZE_X" low="1" high="2" type="uint"/>
 		<bitfield name="FRAG_SIZE_Y" low="3" high="4" type="uint"/>
 		<bitfield name="COMBINER_OP_1" low="5" high="7" type="a6xx_fsr_combiner"/>
 		<bitfield name="COMBINER_OP_2" low="8" high="10" type="a6xx_fsr_combiner"/>
+		<bitfield name="COMBINER_CLAMP_MODE" low="11" high="12" type="a6xx_fsr_combiner_clamp_mode"/>
 		<bitfield name="ATTACHMENT_FSR_ENABLE" pos="13" type="boolean"/>
 		<bitfield name="PRIMITIVE_FSR_ENABLE" pos="20" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x80f4" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8208" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80f4" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A7XX" usage="draw">
+		<bitfield name="QUALITY_BUFFER_SHIFT_X" low="14" high="15" type="uint"/>
+		<bitfield name="QUALITY_BUFFER_SHIFT_Y" low="16" high="17" type="uint"/>
+	</reg32>
+	<reg32 offset="0x8208" name="GRAS_VRS_CONFIG" type="a6xx_gras_vrs_config" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_gras_quality_buffer_info" inline="yes">
 		<bitfield name="LAYERED" pos="0" type="boolean"/>
 		<bitfield name="TILE_MODE" low="1" high="2" type="a6xx_tile_mode"/>
 	</bitset>
 
-	<reg32 offset="0x80f5" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x808e" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80f5" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x808e" name="GRAS_QUALITY_BUFFER_INFO" type="a6xx_gras_quality_buffer_info" variants="A8XX-" usage="draw">
+		<bitfield name="QUALITY_BUFFER_SHIFT_X" low="4" high="5" type="uint"/>
+		<bitfield name="QUALITY_BUFFER_SHIFT_Y" low="6" high="7" type="uint"/>
+	</reg32>
 
 	<bitset name="a6xx_gras_quality_buffer_dimension" inline="yes">
 		<bitfield name="WIDTH" low="0" high="15" type="uint"/>
 		<bitfield name="HEIGHT" low="16" high="31" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x80f6" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x808f" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80f6" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x808f" name="GRAS_QUALITY_BUFFER_DIMENSION" type="a6xx_gras_quality_buffer_dimension" variants="A8XX-" usage="draw"/>
 
-	<reg64 offset="0x80f8" name="GRAS_QUALITY_BUFFER_BASE" variants="A7XX" type="waddress" usage="rp_blit"/>
-	<reg64 offset="0x8090" name="GRAS_QUALITY_BUFFER_BASE" variants="A8XX-" type="waddress" usage="rp_blit"/>
+	<reg64 offset="0x80f8" name="GRAS_QUALITY_BUFFER_BASE" variants="A7XX" type="waddress" usage="draw"/>
+	<reg64 offset="0x8090" name="GRAS_QUALITY_BUFFER_BASE" variants="A8XX-" type="waddress" usage="draw"/>
 
 	<bitset name="a6xx_gras_quality_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" shr="6" low="0" high="7" type="uint"/>
 		<bitfield name="ARRAY_PITCH" shr="6" low="10" high="28" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x80fa" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8092" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x80fa" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x8092" name="GRAS_QUALITY_BUFFER_PITCH" type="a6xx_gras_quality_buffer_pitch" variants="A8XX-" usage="draw"/>
 
 	<enum name="a6xx_lrz_dir_status">
 		<value value="0x1" name="LRZ_DIR_LE"/>
@@ -1966,24 +2017,23 @@ by a particular renderpass/blit.
 		<bitfield name="Z_FUNC" low="11" high="13" type="adreno_compare_func" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="rp_blit" variants="A6XX">
+	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="draw" variants="A6XX">
 		<bitfield name="FC_ENABLE" pos="3" type="boolean" variants="A6XX"/>
 		<bitfield name="DISABLE_ON_WRONG_DIR" pos="9" type="boolean" variants="A6XX"/>
 	</reg32>
-	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="rp_blit" variants="A7XX"/>
-	<reg32 offset="0x8212" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="rp_blit" variants="A8XX-"/>
+	<reg32 offset="0x8100" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="draw" variants="A7XX"/>
+	<reg32 offset="0x8212" name="GRAS_LRZ_CNTL" type="a6xx_gras_lrz_cntl" usage="draw" variants="A8XX-"/>
 
-	<reg32 offset="0x8007" name="GRAS_LRZ_CB_CNTL" variants="A7XX" usage="rp_blit">
+	<bitset name="a7xx_gras_lrz_cb_cntl" inline="yes">
 		<doc>
 			The total size of the LRZ image array (not including
 			fast clear buffer), used as a stride for double
 			buffering used with concurrent binning.
 		</doc>
-		<bitfield name="DOUBLE_BUFFER_STRIDE" low="8" high="31" shr="8"/>
-	</reg32>
-	<reg32 offset="0x8101" name="GRAS_LRZ_CB_CNTL" usage="rp_blit" variants="A8XX-">
 		<bitfield name="DOUBLE_BUFFER_PITCH" low="8" high="31" shr="8"/>
-	</reg32>
+	</bitset>
+	<reg32 offset="0x8007" name="GRAS_LRZ_CB_CNTL" type="a7xx_gras_lrz_cb_cntl" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x8101" name="GRAS_LRZ_CB_CNTL" type="a7xx_gras_lrz_cb_cntl" variants="A8XX-" usage="draw"/>
 
 	<enum name="a6xx_fragcoord_sample_mode">
 		<value value="0" name="FRAGCOORD_CENTER"/>
@@ -1995,28 +2045,28 @@ by a particular renderpass/blit.
 		<bitfield name="FRAGCOORDSAMPLEMODE" low="1" high="2" type="a6xx_fragcoord_sample_mode"/>
 	</bitset>
 
-	<reg32 offset="0x8101" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="rp_blit" variants="A6XX-A7XX"/>
-	<reg32 offset="0x8102" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="rp_blit" variants="A8XX-"/>
+	<reg32 offset="0x8101" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="draw" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8102" name="GRAS_LRZ_PS_INPUT_CNTL" type="a6xx_gras_lrz_ps_input_cntl" usage="draw" variants="A8XX-"/>
 
 	<bitset name="a6xx_gras_lrz_mrt_buffer_info_0" inline="yes">
 		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
 	</bitset>
 
-	<reg32 offset="0x8102" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="rp_blit" variants="A6XX-A7XX"/>
-	<reg32 offset="0x8103" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="rp_blit" variants="A8XX-"/>
+	<reg32 offset="0x8102" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="draw" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8103" name="GRAS_LRZ_MRT_BUFFER_INFO_0" type="a6xx_gras_lrz_mrt_buffer_info_0" usage="draw" variants="A8XX-"/>
 
-	<reg64 offset="0x8103" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit" variants="A6XX-A7XX"/>
-	<reg64 offset="0x8104" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="rp_blit" variants="A8XX-"/>
+	<reg64 offset="0x8103" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="draw" variants="A6XX-A7XX"/>
+	<reg64 offset="0x8104" name="GRAS_LRZ_BUFFER_BASE" align="256" type="waddress" usage="draw" variants="A8XX-"/>
 
 	<bitset name="a6xx_gras_lrz_buffer_pitch" inline="yes">
-		<bitfield name="PITCH" low="0" high="7" shr="5" type="uint"/>
+		<bitfield name="PITCH" low="0" high="7" shr="6" type="uint"/>
 		<bitfield name="ARRAY_PITCH" low="10" high="28" shr="8" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x8105" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="rp_blit" variants="A6XX-A7XX"/>
-	<reg32 offset="0x8108" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="rp_blit" variants="A8XX-"/>
+	<reg32 offset="0x8105" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="draw" variants="A6XX-A7XX"/>
+	<reg32 offset="0x8108" name="GRAS_LRZ_BUFFER_PITCH" type="a6xx_gras_lrz_buffer_pitch" usage="draw" variants="A8XX-"/>
 
-	<reg32 offset="0x810e" name="GRAS_LRZ_BUFFER_STRIDE" usage="rp_blit" low="0" high="16" shr="12" variants="A8XX-"/>
+	<reg32 offset="0x810e" name="GRAS_LRZ_BUFFER_STRIDE" usage="draw" low="0" high="16" shr="12" variants="A8XX-"/>
 
 	<!--
 	The LRZ "fast clear" buffer is initialized to zero's by blob, and
@@ -2048,8 +2098,8 @@ by a particular renderpass/blit.
 	increases beyond 1 page.  Not sure if that is an actual limit or
 	not.
 	 -->
-	<reg64 offset="0x8106" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE" align="64" type="waddress" usage="rp_blit"/>
-	<reg32 offset="0x8109" name="GRAS_LRZ_PS_SAMPLEFREQ_CNTL" usage="rp_blit">
+	<reg64 offset="0x8106" name="GRAS_LRZ_FAST_CLEAR_BUFFER_BASE" align="64" type="waddress" usage="resolve"/>
+	<reg32 offset="0x8109" name="GRAS_LRZ_PS_SAMPLEFREQ_CNTL" usage="draw">
 		<bitfield name="PER_SAMP_MODE" pos="0" type="boolean"/>
 	</reg32>
 	<!--
@@ -2066,14 +2116,14 @@ by a particular renderpass/blit.
 		<bitfield name="BASE_MIP_LEVEL" low="28" high="31" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0x810b" name="GRAS_LRZ_CNTL2" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0x810b" name="GRAS_LRZ_CNTL2" variants="A7XX-" usage="draw">
 		<bitfield name="DISABLE_ON_WRONG_DIR" pos="0" type="boolean"/>
 		<bitfield name="FC_ENABLE" pos="1" type="boolean"/>
 	</reg32>
 
 	<!-- 0x810c-0x810f invalid -->
 
-	<reg32 offset="0x8110" name="GRAS_LRZ_BUFFER_SLICE_PITCH" low="0" high="31" shr="8" type="uint" variants="A8XX-"/>
+	<reg32 offset="0x8110" name="GRAS_LRZ_BUFFER_SLICE_PITCH" low="8" high="31" shr="8" type="uint" variants="A8XX-"/>
 
 	<reg32 offset="0x8110" name="GRAS_MODE_CNTL" low="0" high="1" variants="A6XX-A7XX" usage="cmd"/>
 	<reg32 offset="0x8213" name="GRAS_MODE_CNTL" low="0" high="1" variants="A8XX-" usage="cmd"/>
@@ -2082,8 +2132,8 @@ by a particular renderpass/blit.
 	<reg32 offset="0x8111" name="GRAS_LRZ_DEPTH_CLEAR" type="float" variants="A7XX"/>
 	<reg32 offset="0x810d" name="GRAS_LRZ_DEPTH_CLEAR" type="float" variants="A8XX-"/>
 
-	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x810f" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x8113" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x810f" name="GRAS_LRZ_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A8XX" usage="draw"/>
 
 	<doc>LUT used to convert quality buffer values to HW shading rate values. An array of 4-bit values.</doc>
 	<array offset="0x8120" name="GRAS_LRZ_QUALITY_LOOKUP_TABLE" variants="A7XX" stride="1" length="2"/>
@@ -2128,32 +2178,32 @@ by a particular renderpass/blit.
 		<bitfield name="COPY" pos="30" type="boolean" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x8400" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_blt_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x8400" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_blt_cntl" variants="A6XX-A7XX" usage="blit"/>
 	<!-- note: the low 8 bits for src coords are valid, probably fixed point
 	     it would be a bit weird though, since we subtract 1 from BR coords
 	     apparently signed, gallium driver uses negative coords and it works?
 	 -->
-	<reg32 offset="0x8401" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8402" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8403" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8404" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8405" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8406" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x8407" name="GRAS_2D_UNKNOWN_8407" low="0" high="31"/>
-	<reg32 offset="0x8408" name="GRAS_2D_UNKNOWN_8408" low="0" high="31"/>
-	<reg32 offset="0x8409" name="GRAS_2D_UNKNOWN_8409" low="0" high="31"/>
-	<reg32 offset="0x840a" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x840b" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="rp_blit"/>
-
-	<reg32 offset="0x8500" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_blt_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8501" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8502" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8503" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8504" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8505" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8506" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8507" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x8508" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8401" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x8402" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x8403" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x8404" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x8405" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x8406" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x8407" name="GRAS_A2D_UNKNOWN_8407" low="0" high="31" variants="A6XX" usage="blit"/>
+	<reg32 offset="0x8408" name="GRAS_A2D_UNKNOWN_8408" low="0" high="31" variants="A6XX" usage="blit"/>
+	<reg32 offset="0x8409" name="GRAS_A2D_UNKNOWN_8409" low="0" high="31" variants="A6XX" usage="blit"/>
+	<reg32 offset="0x840a" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="blit"/>
+	<reg32 offset="0x840b" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A6XX-A7XX" usage="blit"/>
+
+	<reg32 offset="0x8500" name="GRAS_A2D_BLT_CNTL" type="a6xx_a2d_blt_cntl" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8501" name="GRAS_A2D_SRC_XMIN" low="8" high="24" type="int" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8502" name="GRAS_A2D_SRC_XMAX" low="8" high="24" type="int" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8503" name="GRAS_A2D_SRC_YMIN" low="8" high="24" type="int" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8504" name="GRAS_A2D_SRC_YMAX" low="8" high="24" type="int" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8505" name="GRAS_A2D_DEST_TL" type="a6xx_reg_xy" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8506" name="GRAS_A2D_DEST_BR" type="a6xx_reg_xy" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8507" name="GRAS_A2D_SCISSOR_TL" type="a6xx_reg_xy" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0x8508" name="GRAS_A2D_SCISSOR_BR" type="a6xx_reg_xy" variants="A8XX-" usage="blit"/>
 
 	<!-- always 0x880 ? (and 0 in a640/a650 traces?) -->
 	<reg32 offset="0x8600" name="GRAS_DBG_ECO_CNTL" usage="init" variants="A6XX-A7XX">
@@ -2180,10 +2230,10 @@ by a particular renderpass/blit.
 	-->
 
 	<!-- same as GRAS_BIN_CONTROL, but without bit 27: -->
-	<reg32 offset="0x8800" name="RB_CNTL" variants="A6XX-A7XX" type="a6xx_bin_cntl" usage="rp_blit"/>
-	<reg32 offset="0x8800" name="RB_CNTL" variants="A8XX-" type="a8xx_bin_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8800" name="RB_CNTL" variants="A6XX-A7XX" type="a6xx_bin_cntl" usage="cmd"/>
+	<reg32 offset="0x8800" name="RB_CNTL" variants="A8XX-" type="a8xx_bin_cntl" usage="cmd"/>
 
-	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A6XX" usage="draw">
 		<bitfield name="CCUSINGLECACHELINESIZE" low="3" high="5"/>
 		<bitfield name="EARLYVIZOUTEN" pos="6" type="boolean"/>
 		<bitfield name="FS_DISABLE" pos="7" type="boolean"/>
@@ -2197,7 +2247,7 @@ by a particular renderpass/blit.
 		<!-- bitmask of MRTs using UBWC flag buffer: -->
 		<bitfield name="FLAG_MRTS" low="16" high="23"/>
 	</reg32>
-	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0x8801" name="RB_RENDER_CNTL" variants="A7XX-" usage="draw">
 		<bitfield name="EARLYVIZOUTEN" pos="6" type="boolean"/>
 		<bitfield name="FS_DISABLE" pos="7" type="boolean"/>
 		<bitfield name="RASTER_MODE" pos="8" type="a6xx_raster_mode"/>
@@ -2206,26 +2256,26 @@ by a particular renderpass/blit.
 		<bitfield name="INNERCONSERVATIVERASEN" pos="12" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x8802" name="RB_RAS_MSAA_CNTL" usage="rp_blit">
+	<reg32 offset="0x8802" name="RB_RAS_MSAA_CNTL" usage="draw">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="UNK2" pos="2"/>
 		<bitfield name="UNK3" pos="3"/>
 	</reg32>
-	<reg32 offset="0x8803" name="RB_DEST_MSAA_CNTL" usage="rp_blit">
+	<reg32 offset="0x8803" name="RB_DEST_MSAA_CNTL" usage="draw">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x8804" name="RB_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" usage="rp_blit"/>
-	<reg32 offset="0x8805" name="RB_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
-	<reg32 offset="0x8806" name="RB_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="rp_blit"/>
-	<reg32 offset="0x8807" name="RB_PROGRAMMABLE_MSAA_POS_2" type="a6xx_programmable_msaa_pos" usage="rp_blit" variants="A8XX-"/>
-	<reg32 offset="0x8808" name="RB_PROGRAMMABLE_MSAA_POS_3" type="a6xx_programmable_msaa_pos" usage="rp_blit" variants="A8XX-"/>
+	<reg32 offset="0x8804" name="RB_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" usage="draw"/>
+	<reg32 offset="0x8805" name="RB_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" usage="draw"/>
+	<reg32 offset="0x8806" name="RB_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="draw"/>
+	<reg32 offset="0x8807" name="RB_PROGRAMMABLE_MSAA_POS_2" type="a6xx_programmable_msaa_pos" usage="draw" variants="A8XX-"/>
+	<reg32 offset="0x8808" name="RB_PROGRAMMABLE_MSAA_POS_3" type="a6xx_programmable_msaa_pos" usage="draw" variants="A8XX-"/>
 	<!--
 	note: maybe not actually called RB_RENDER_CONTROLn (since RB_RENDER_CNTL
 	name comes from kernel and is probably right)
 	 -->
-	<reg32 offset="0x8809" name="RB_INTERP_CNTL" usage="rp_blit">
+	<reg32 offset="0x8809" name="RB_INTERP_CNTL" usage="draw">
 		<!-- see also GRAS_CL_INTERP_CNTL -->
 		<bitfield name="IJ_PERSP_PIXEL" pos="0" type="boolean"/>
 		<bitfield name="IJ_PERSP_CENTROID" pos="1" type="boolean"/>
@@ -2236,7 +2286,7 @@ by a particular renderpass/blit.
 		<bitfield name="COORD_MASK" low="6" high="9" type="hex"/>
 		<bitfield name="INTERP_EN" pos="10" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x880a" name="RB_PS_INPUT_CNTL" usage="rp_blit">
+	<reg32 offset="0x880a" name="RB_PS_INPUT_CNTL" usage="draw">
 		<!-- enable bits for various FS sysvalue regs: -->
 		<bitfield name="SAMPLEMASK" pos="0" type="boolean"/>
 		<bitfield name="POSTDEPTHCOVERAGE" pos="1" type="boolean"/>
@@ -2248,16 +2298,16 @@ by a particular renderpass/blit.
 		<bitfield name="FOVEATION" pos="8" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x880b" name="RB_PS_OUTPUT_CNTL" usage="rp_blit">
+	<reg32 offset="0x880b" name="RB_PS_OUTPUT_CNTL" usage="draw">
 		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="FRAG_WRITES_Z" pos="1" type="boolean"/>
 		<bitfield name="FRAG_WRITES_SAMPMASK" pos="2" type="boolean"/>
 		<bitfield name="FRAG_WRITES_STENCILREF" pos="3" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x880c" name="RB_PS_MRT_CNTL" usage="rp_blit">
+	<reg32 offset="0x880c" name="RB_PS_MRT_CNTL" usage="draw">
 		<bitfield name="MRT" low="0" high="3" type="uint"/>
 	</reg32>
-	<reg32 offset="0x880d" name="RB_PS_OUTPUT_MASK" usage="rp_blit">
+	<reg32 offset="0x880d" name="RB_PS_OUTPUT_MASK" usage="draw">
 		<bitfield name="RT0" low="0" high="3"/>
 		<bitfield name="RT1" low="4" high="7"/>
 		<bitfield name="RT2" low="8" high="11"/>
@@ -2277,7 +2327,7 @@ by a particular renderpass/blit.
 		<bitfield name="DITHER_MODE_MRT6" low="12" high="13" type="adreno_rb_dither_mode"/>
 		<bitfield name="DITHER_MODE_MRT7" low="14" high="15" type="adreno_rb_dither_mode"/>
 	</reg32>
-	<reg32 offset="0x880f" name="RB_SRGB_CNTL" usage="rp_blit">
+	<reg32 offset="0x880f" name="RB_SRGB_CNTL" usage="draw">
 		<!-- Same as SP_SRGB_CNTL -->
 		<bitfield name="SRGB_MRT0" pos="0" type="boolean"/>
 		<bitfield name="SRGB_MRT1" pos="1" type="boolean"/>
@@ -2289,11 +2339,11 @@ by a particular renderpass/blit.
 		<bitfield name="SRGB_MRT7" pos="7" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x8810" name="RB_PS_SAMPLEFREQ_CNTL" usage="rp_blit">
+	<reg32 offset="0x8810" name="RB_PS_SAMPLEFREQ_CNTL" usage="draw">
 		<bitfield name="PER_SAMP_MODE" pos="0" type="boolean"/>
 	</reg32>
 	<reg32 offset="0x8811" name="RB_MODE_CNTL" low="4" high="6" usage="cmd"/>
-	<reg32 offset="0x8812" name="RB_BUFFER_CNTL" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0x8812" name="RB_BUFFER_CNTL" variants="A7XX-" usage="draw">
 		<bitfield name="Z_SYSMEM" pos="0" type="boolean"/>
 		<bitfield name="S_SYSMEM" pos="1" type="boolean"/>
 		<bitfield name="RT0_SYSMEM" pos="2" type="boolean"/>
@@ -2316,7 +2366,7 @@ by a particular renderpass/blit.
 		<bitfield name="RT7_FULL_IN_GMEM" pos="19" type="boolean" variants="A8XX-"/>
 	</reg32>
 
-	<reg32 offset="0x8816" name="RB_RESOLVE_CR_CNTL" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x8816" name="RB_RESOLVE_CR_CNTL" variants="A8XX-" usage="resolve"/>
 
 	<!-- 0x8813-0x8817 invalid -->
 	<!-- always 0x0 ? -->
@@ -2330,12 +2380,12 @@ by a particular renderpass/blit.
 	<reg32 offset="0x881e" name="RB_UNKNOWN_881E" usage="cmd"/>
 
 	<!-- Duplicates fields from SP_PS_CNTL_0 -->
-	<reg32 offset="0x881f" name="RB_PS_CNTL" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0x881f" name="RB_PS_CNTL" variants="A8XX-" usage="draw">
 		<bitfield name="PIXLODENABLE" pos="0" type="boolean"/>
 		<bitfield name="LODPIXMASK" pos="1" type="boolean"/>
 	</reg32>
 
-	<array offset="0x8820" name="RB_MRT" stride="8" length="8" usage="rp_blit">
+	<array offset="0x8820" name="RB_MRT" stride="8" length="8" usage="draw">
 		<reg32 offset="0x0" name="CONTROL">
 			<bitfield name="COLOR_BLEND_EN" pos="0" type="boolean"/>
 			<bitfield name="ALPHA_BLEND_EN" pos="1" type="boolean"/>
@@ -2383,16 +2433,16 @@ by a particular renderpass/blit.
 		<reg32 offset="0x7" name="BASE_GMEM" low="12" high="31" shr="12"/>
 	</array>
 
-	<reg32 offset="0x8860" name="RB_BLEND_CONSTANT_RED_FP32" type="float" usage="rp_blit"/>
-	<reg32 offset="0x8861" name="RB_BLEND_CONSTANT_GREEN_FP32" type="float" usage="rp_blit"/>
-	<reg32 offset="0x8862" name="RB_BLEND_CONSTANT_BLUE_FP32" type="float" usage="rp_blit"/>
-	<reg32 offset="0x8863" name="RB_BLEND_CONSTANT_ALPHA_FP32" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8860" name="RB_BLEND_CONSTANT_RED_FP32" type="float" usage="draw"/>
+	<reg32 offset="0x8861" name="RB_BLEND_CONSTANT_GREEN_FP32" type="float" usage="draw"/>
+	<reg32 offset="0x8862" name="RB_BLEND_CONSTANT_BLUE_FP32" type="float" usage="draw"/>
+	<reg32 offset="0x8863" name="RB_BLEND_CONSTANT_ALPHA_FP32" type="float" usage="draw"/>
 	<reg32 offset="0x8864" name="RB_ALPHA_TEST_CNTL" usage="cmd">
 		<bitfield name="ALPHA_REF" low="0" high="7" type="hex"/>
 		<bitfield name="ALPHA_TEST" pos="8" type="boolean"/>
 		<bitfield name="ALPHA_TEST_FUNC" low="9" high="11" type="adreno_compare_func"/>
 	</reg32>
-	<reg32 offset="0x8865" name="RB_BLEND_CNTL" usage="rp_blit">
+	<reg32 offset="0x8865" name="RB_BLEND_CNTL" usage="draw">
 		<!-- per-mrt enable bit -->
 		<bitfield name="BLEND_READS_DEST" low="0" high="7"/>
 		<bitfield name="INDEPENDENT_BLEND" pos="8" type="boolean"/>
@@ -2401,12 +2451,12 @@ by a particular renderpass/blit.
 		<bitfield name="ALPHA_TO_ONE" pos="11" type="boolean"/>
 		<bitfield name="SAMPLE_MASK" low="16" high="31"/>
 	</reg32>
-	<reg32 offset="0x8866" name="RB_LB_PARAM_LIMIT" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0x8866" name="RB_LB_PARAM_LIMIT" variants="A8XX-" usage="draw">
 		<bitfield name="PRIMALLOCTHRESHOLD" low="0" high="2" type="uint"/>
 	</reg32>
-	<reg32 offset="0x8870" name="RB_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" usage="rp_blit"/>
+	<reg32 offset="0x8870" name="RB_DEPTH_PLANE_CNTL" type="a6xx_depth_plane_cntl" usage="draw"/>
 
-	<reg32 offset="0x8871" name="RB_DEPTH_CNTL" usage="rp_blit">
+	<reg32 offset="0x8871" name="RB_DEPTH_CNTL" usage="draw">
 		<bitfield name="Z_TEST_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="Z_WRITE_ENABLE" pos="1" type="boolean"/>
 		<bitfield name="ZFUNC" low="2" high="4" type="adreno_compare_func"/>
@@ -2422,23 +2472,23 @@ by a particular renderpass/blit.
 	</reg32>
 
 	<!-- duplicates GRAS_SU_DEPTH_BUFFER_INFO: -->
-	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A6XX" type="a6xx_depth_buffer_info" usage="rp_blit"/>
+	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" variants="A6XX" type="a6xx_depth_buffer_info" usage="draw"/>
 	<!-- first 4 bits duplicates GRAS_SU_DEPTH_BUFFER_INFO -->
-	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0x8872" name="RB_DEPTH_BUFFER_INFO" type="a6xx_depth_buffer_info" variants="A7XX-" usage="draw">
 		<bitfield name="PRT" low="3" high="4"/>
 		<bitfield name="TILEMODE" low="5" high="6" type="a6xx_tile_mode"/>
 		<bitfield name="LOSSLESSCOMPEN" pos="7" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x8873" name="RB_DEPTH_BUFFER_PITCH" low="0" high="13" shr="6" type="uint" usage="rp_blit"/>
-	<reg32 offset="0x8874" name="RB_DEPTH_BUFFER_ARRAY_PITCH" low="0" high="27" shr="6" type="uint" usage="rp_blit"/>
-	<reg64 offset="0x8875" name="RB_DEPTH_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8877" name="RB_DEPTH_GMEM_BASE" low="12" high="31" shr="12" usage="rp_blit"/>
+	<reg32 offset="0x8873" name="RB_DEPTH_BUFFER_PITCH" low="0" high="13" shr="6" type="uint" usage="draw"/>
+	<reg32 offset="0x8874" name="RB_DEPTH_BUFFER_ARRAY_PITCH" low="0" high="27" shr="6" type="uint" usage="draw"/>
+	<reg64 offset="0x8875" name="RB_DEPTH_BUFFER_BASE" type="waddress" align="64" usage="draw"/>
+	<reg32 offset="0x8877" name="RB_DEPTH_GMEM_BASE" low="12" high="31" shr="12" usage="draw"/>
 
-	<reg32 offset="0x8878" name="RB_DEPTH_BOUND_MIN" type="float" usage="rp_blit"/>
-	<reg32 offset="0x8879" name="RB_DEPTH_BOUND_MAX" type="float" usage="rp_blit"/>
+	<reg32 offset="0x8878" name="RB_DEPTH_BOUND_MIN" type="float" usage="draw"/>
+	<reg32 offset="0x8879" name="RB_DEPTH_BOUND_MAX" type="float" usage="draw"/>
 	<!-- 0x887a-0x887f invalid -->
-	<reg32 offset="0x8880" name="RB_STENCIL_CNTL" usage="rp_blit">
+	<reg32 offset="0x8880" name="RB_STENCIL_CNTL" usage="draw">
 		<bitfield name="STENCIL_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="STENCIL_ENABLE_BF" pos="1" type="boolean"/>
 		<!--
@@ -2458,39 +2508,39 @@ by a particular renderpass/blit.
 		<bitfield name="ZFAIL_BF" low="29" high="31" type="adreno_stencil_op"/>
 	</reg32>
 
-	<reg32 offset="0x8881" name="RB_STENCIL_BUFFER_INFO" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0x8881" name="RB_STENCIL_BUFFER_INFO" variants="A6XX" usage="draw">
 		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
 		<bitfield name="UNK1" pos="1" type="boolean"/>
 	</reg32>
-	<reg32 offset="0x8881" name="RB_STENCIL_BUFFER_INFO" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0x8881" name="RB_STENCIL_BUFFER_INFO" variants="A7XX-" usage="draw">
 		<bitfield name="SEPARATE_STENCIL" pos="0" type="boolean"/>
 		<bitfield name="UNK1" pos="1" type="boolean"/>
 		<bitfield name="TILEMODE" low="2" high="3" type="a6xx_tile_mode"/>
 	</reg32>
-	<reg32 offset="0x8882" name="RB_STENCIL_BUFFER_PITCH" low="0" high="11" shr="6" type="uint" usage="rp_blit"/>
-	<reg32 offset="0x8883" name="RB_STENCIL_BUFFER_ARRAY_PITCH" low="0" high="23" shr="6" type="uint" usage="rp_blit"/>
-	<reg64 offset="0x8884" name="RB_STENCIL_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8886" name="RB_STENCIL_GMEM_BASE" low="12" high="31" shr="12" usage="rp_blit"/>
-	<reg32 offset="0x8887" name="RB_STENCIL_REF_CNTL" usage="rp_blit">
+	<reg32 offset="0x8882" name="RB_STENCIL_BUFFER_PITCH" low="0" high="11" shr="6" type="uint" usage="draw"/>
+	<reg32 offset="0x8883" name="RB_STENCIL_BUFFER_ARRAY_PITCH" low="0" high="23" shr="6" type="uint" usage="draw"/>
+	<reg64 offset="0x8884" name="RB_STENCIL_BUFFER_BASE" type="waddress" align="64" usage="draw"/>
+	<reg32 offset="0x8886" name="RB_STENCIL_GMEM_BASE" low="12" high="31" shr="12" usage="draw"/>
+	<reg32 offset="0x8887" name="RB_STENCIL_REF_CNTL" usage="draw">
 		<bitfield name="REF" low="0" high="7"/>
 		<bitfield name="BFREF" low="8" high="15"/>
 	</reg32>
-	<reg32 offset="0x8888" name="RB_STENCIL_MASK" usage="rp_blit">
+	<reg32 offset="0x8888" name="RB_STENCIL_MASK" usage="draw">
 		<bitfield name="MASK" low="0" high="7"/>
 		<bitfield name="BFMASK" low="8" high="15"/>
 	</reg32>
-	<reg32 offset="0x8889" name="RB_STENCIL_WRITE_MASK" usage="rp_blit">
+	<reg32 offset="0x8889" name="RB_STENCIL_WRITE_MASK" usage="draw">
 		<bitfield name="WRMASK" low="0" high="7"/>
 		<bitfield name="BFWRMASK" low="8" high="15"/>
 	</reg32>
 	<!-- 0x888a-0x888f invalid -->
-	<reg32 offset="0x8890" name="RB_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x8890" name="RB_WINDOW_OFFSET" type="a6xx_reg_xy" usage="cmd"/>
 	<reg32 offset="0x8891" name="RB_SAMPLE_COUNTER_CNTL" usage="cmd">
 		<bitfield name="DISABLE" pos="0" type="boolean"/>
 		<bitfield name="COPY" pos="1" type="boolean"/>
 	</reg32>
 	<!-- 0x8892-0x8897 invalid -->
-	<reg32 offset="0x8898" name="RB_LRZ_CNTL" usage="rp_blit">
+	<reg32 offset="0x8898" name="RB_LRZ_CNTL" usage="draw">
 		<bitfield name="ENABLE" pos="0" type="boolean"/>
 	</reg32>
 	<reg32 offset="0x8899" name="RB_LRZ_CNTL2" variants="A7XX-" usage="cmd">
@@ -2498,41 +2548,41 @@ by a particular renderpass/blit.
 	</reg32>
 	<!-- 0x8899-0x88bf invalid -->
 	<!-- clamps depth value for depth test/write -->
-	<reg32 offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MIN" type="float" usage="rp_blit" variants="A6XX-A7XX"/>
-	<reg32 offset="0x88c1" name="RB_VIEWPORT_ZCLAMP_MAX" type="float" usage="rp_blit" variants="A6XX-A7XX"/>
+	<reg32 offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MIN" type="float" usage="draw" variants="A6XX-A7XX"/>
+	<reg32 offset="0x88c1" name="RB_VIEWPORT_ZCLAMP_MAX" type="float" usage="draw" variants="A6XX-A7XX"/>
 
 <!-- todo allow type="float" on an <array/> -->
-	<array offset="0x88b0" name="RB_VIEWPORT_ZCLAMP_MIN" stride="1" length="16" usage="rp_blit" variants="A8XX-">
+	<array offset="0x88b0" name="RB_VIEWPORT_ZCLAMP_MIN" stride="1" length="16" usage="draw" variants="A8XX-">
 		<reg32 offset="0" name="REG" type="float"/>
 	</array>
-	<array offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MAX" stride="1" length="16" usage="rp_blit" variants="A8XX-">
+	<array offset="0x88c0" name="RB_VIEWPORT_ZCLAMP_MAX" stride="1" length="16" usage="draw" variants="A8XX-">
 		<reg32 offset="0" name="REG" type="float"/>
 	</array>
 
 	<!-- 0x88c2-0x88cf invalid-->
-	<reg32 offset="0x88d0" name="RB_RESOLVE_CNTL_0" usage="rp_blit">
+	<reg32 offset="0x88d0" name="RB_RESOLVE_CNTL_0" usage="resolve">
 		<bitfield name="UNK0" low="0" high="12"/>
 		<bitfield name="UNK16" low="16" high="26"/>
 	</reg32>
-	<reg32 offset="0x88d1" name="RB_RESOLVE_CNTL_1" type="a6xx_reg_xy" usage="rp_blit"/>
-	<reg32 offset="0x88d2" name="RB_RESOLVE_CNTL_2" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0x88d1" name="RB_RESOLVE_CNTL_1" type="a6xx_reg_xy" usage="resolve"/>
+	<reg32 offset="0x88d2" name="RB_RESOLVE_CNTL_2" type="a6xx_reg_xy" usage="resolve"/>
 	<!-- weird to duplicate other regs from same block?? -->
-	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" variants="A6XX-A7XX" usage="rp_blit">
+	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" variants="A6XX-A7XX" usage="resolve">
 		<bitfield name="BINW" low="0" high="5" shr="5" type="uint"/>
 		<bitfield name="BINH" low="8" high="14" shr="4" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x88f0" name="RB_RESOLVE_CNTL_4" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x88f1" name="RB_RESOLVE_CNTL_5" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x88d3" name="RB_RESOLVE_CNTL_3" type="a8xx_bin_size" variants="A8XX-" usage="resolve"/>
+	<reg32 offset="0x88f0" name="RB_RESOLVE_CNTL_4" variants="A8XX-" usage="resolve"/>
+	<reg32 offset="0x88f1" name="RB_RESOLVE_CNTL_5" variants="A8XX-" usage="resolve"/>
 
-	<reg32 offset="0x88d4" name="RB_RESOLVE_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
-	<reg32 offset="0x88d5" name="RB_RESOLVE_GMEM_BUFFER_INFO" usage="rp_blit">
+	<reg32 offset="0x88d4" name="RB_RESOLVE_WINDOW_OFFSET" type="a6xx_reg_xy" usage="resolve"/>
+	<reg32 offset="0x88d5" name="RB_RESOLVE_GMEM_BUFFER_INFO" usage="resolve">
 		<bitfield name="SAMPLES" low="3" high="4" type="a3xx_msaa_samples"/>
 	</reg32>
-	<reg32 offset="0x88d6" name="RB_RESOLVE_GMEM_BUFFER_BASE" low="12" high="31" shr="12" usage="rp_blit"/>
+	<reg32 offset="0x88d6" name="RB_RESOLVE_GMEM_BUFFER_BASE" low="12" high="31" shr="12" usage="resolve"/>
 	<!-- s/DST_FORMAT/DST_INFO/ probably: -->
-	<reg32 offset="0x88d7" name="RB_RESOLVE_SYSTEM_BUFFER_INFO" usage="rp_blit">
+	<reg32 offset="0x88d7" name="RB_RESOLVE_SYSTEM_BUFFER_INFO" usage="resolve">
 		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
 		<bitfield name="FLAGS" pos="2" type="boolean"/>
 		<bitfield name="SAMPLES" low="3" high="4" type="a3xx_msaa_samples"/>
@@ -2541,23 +2591,23 @@ by a particular renderpass/blit.
 		<bitfield name="UNK15" pos="15" type="boolean"/>
 		<bitfield name="MUTABLEEN" pos="16" type="boolean" variants="A7XX-"/>
 	</reg32>
-	<reg64 offset="0x88d8" name="RB_RESOLVE_SYSTEM_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x88da" name="RB_RESOLVE_SYSTEM_BUFFER_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
+	<reg64 offset="0x88d8" name="RB_RESOLVE_SYSTEM_BUFFER_BASE" type="waddress" align="64" usage="resolve"/>
+	<reg32 offset="0x88da" name="RB_RESOLVE_SYSTEM_BUFFER_PITCH" low="0" high="15" shr="6" type="uint" usage="resolve"/>
 	<!-- array-pitch is size of layer -->
-	<reg32 offset="0x88db" name="RB_RESOLVE_SYSTEM_BUFFER_ARRAY_PITCH" low="0" high="28" shr="6" type="uint" usage="rp_blit"/>
-	<reg64 offset="0x88dc" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
+	<reg32 offset="0x88db" name="RB_RESOLVE_SYSTEM_BUFFER_ARRAY_PITCH" low="0" high="28" shr="6" type="uint" usage="resolve"/>
+	<reg64 offset="0x88dc" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_BASE" type="waddress" align="64" usage="resolve"/>
 
 	<bitset name="a6xx_flag_buffer_pitch" inline="yes">
 		<bitfield name="PITCH" low="0" high="10" shr="6" type="uint"/>
 		<bitfield name="ARRAY_PITCH" low="11" high="28" shr="7" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x88de" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" usage="rp_blit"/>
+	<reg32 offset="0x88de" name="RB_RESOLVE_SYSTEM_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" usage="resolve"/>
 
-	<reg32 offset="0x88df" name="RB_RESOLVE_CLEAR_COLOR_DW0" usage="rp_blit"/>
-	<reg32 offset="0x88e0" name="RB_RESOLVE_CLEAR_COLOR_DW1" usage="rp_blit"/>
-	<reg32 offset="0x88e1" name="RB_RESOLVE_CLEAR_COLOR_DW2" usage="rp_blit"/>
-	<reg32 offset="0x88e2" name="RB_RESOLVE_CLEAR_COLOR_DW3" usage="rp_blit"/>
+	<reg32 offset="0x88df" name="RB_RESOLVE_CLEAR_COLOR_DW0" usage="resolve"/>
+	<reg32 offset="0x88e0" name="RB_RESOLVE_CLEAR_COLOR_DW1" usage="resolve"/>
+	<reg32 offset="0x88e1" name="RB_RESOLVE_CLEAR_COLOR_DW2" usage="resolve"/>
+	<reg32 offset="0x88e2" name="RB_RESOLVE_CLEAR_COLOR_DW3" usage="resolve"/>
 
 	<enum name="a6xx_blit_event_type">
 		<value value="0x0" name="BLIT_EVENT_STORE"/>
@@ -2567,7 +2617,7 @@ by a particular renderpass/blit.
 	</enum>
 
 	<!-- seems somewhat similar to what we called RB_CLEAR_CNTL on a5xx: -->
-	<reg32 offset="0x88e3" name="RB_RESOLVE_OPERATION" usage="rp_blit">
+	<reg32 offset="0x88e3" name="RB_RESOLVE_OPERATION" usage="resolve">
 		<bitfield name="TYPE" low="0" high="1" type="a6xx_blit_event_type"/>
 		<bitfield name="SAMPLE_0" pos="2" type="boolean"/> <!-- takes sample 0 instead of averaging -->
 		<bitfield name="DEPTH" pos="3" type="boolean"/> <!-- z16/z32/z24s8/x24x8 clear or resolve? -->
@@ -2595,7 +2645,7 @@ by a particular renderpass/blit.
 		<value value="0x0" name="CLEAR_MODE_SYSMEM"/>
 		<value value="0x1" name="CLEAR_MODE_GMEM"/>
 	</enum>
-	<reg32 offset="0x88e4" name="RB_CLEAR_TARGET" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0x88e4" name="RB_CLEAR_TARGET" variants="A7XX-" usage="resolve">
 			<bitfield name="CLEAR_MODE" pos="0" type="a7xx_blit_clear_mode"/>
 	</reg32>
 
@@ -2637,17 +2687,17 @@ by a particular renderpass/blit.
 		<bitfield name="DEPTH_CACHE_SIZE" low="30" high="31" type="a6xx_ccu_cache_size"/>
 	</reg32>
 
-	<reg32 offset="0x88e6" name="RB_RESOLVE_GMEM_BUFFER_CNTL" variants="A8XX-">
+	<reg32 offset="0x88e6" name="RB_RESOLVE_GMEM_BUFFER_CNTL" variants="A8XX-" usage="resolve">
 		<bitfield name="FULL_IN_GMEM" pos="0" type="boolean"/>
 	</reg32>
 
 	<!-- always 0x0 ? -->
-	<reg32 offset="0x88f0" name="RB_UNKNOWN_88F0" low="0" high="11" variants="A6XX" usage="cmd"/>
+	<reg32 offset="0x88f0" name="RB_UNKNOWN_88F0" low="0" high="11" variants="A6XX" usage="resolve"/>
 	<!-- could be for separate stencil? (or may not be a flag buffer at all) -->
 	<reg64 offset="0x88f1" name="RB_UNK_FLAG_BUFFER_BASE" type="waddress" align="64" variants="A6XX"/>
 	<reg32 offset="0x88f3" name="RB_UNK_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" variants="A6XX"/>
 
-	<reg32 offset="0x88f4" name="RB_VRS_CONFIG" usage="rp_blit">
+	<reg32 offset="0x88f4" name="RB_VRS_CONFIG" usage="draw">
 		<bitfield name="UNK2" pos="2" type="boolean"/>
 		<bitfield name="PIPELINE_FSR_ENABLE" pos="4" type="boolean"/>
 		<bitfield name="ATTACHMENT_FSR_ENABLE" pos="5" type="boolean"/>
@@ -2656,16 +2706,25 @@ by a particular renderpass/blit.
 	<reg32 offset="0x88f5" name="RB_BIN_FOVEAT" variants="A7XX-" usage="cmd">
 		<bitfield name="BINSCALEEN" pos="6" type="boolean"/>
 	</reg32>
+
+	<array offset="0x8950" name="RB_BIN_FOVEAT_XY" stride="1" length="6" variants="A8XX-" usage="cmd">
+		<reg32 offset="0" name="OFFSET" type="a8xx_bin_foveat_xy"/>
+	</array>
+
+	<array offset="0x8960" name="RB_BIN_FOVEAT_XY_FDM" stride="1" length="6" variants="A8XX-" usage="cmd">
+		<reg32 offset="0" name="OFFSET" type="a8xx_bin_foveat_xy"/>
+	</array>
+
 	<!-- 0x88f6-0x88ff invalid -->
-	<reg64 offset="0x8900" name="RB_DEPTH_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8902" name="RB_DEPTH_FLAG_BUFFER_PITCH" usage="rp_blit">
+	<reg64 offset="0x8900" name="RB_DEPTH_FLAG_BUFFER_BASE" type="waddress" align="64" usage="draw"/>
+	<reg32 offset="0x8902" name="RB_DEPTH_FLAG_BUFFER_PITCH" usage="draw">
 		<bitfield name="PITCH" low="0" high="6" shr="6" type="uint"/>
 		<!-- TODO: actually part of array pitch -->
 		<bitfield name="UNK8" low="8" high="10"/>
 		<bitfield name="ARRAY_PITCH" low="11" high="27" shr="7" type="uint"/>
 	</reg32>
 
-	<array offset="0x8903" name="RB_COLOR_FLAG_BUFFER" stride="3" length="8" usage="rp_blit">
+	<array offset="0x8903" name="RB_COLOR_FLAG_BUFFER" stride="3" length="8" usage="draw">
 		<reg64 offset="0" name="ADDR" type="waddress" align="64"/>
 		<reg32 offset="2" name="PITCH" type="a6xx_flag_buffer_pitch"/>
 	</array>
@@ -2683,7 +2742,8 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x8813" name="RB_DEPTH_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-"/>
 	<reg32 offset="0x8814" name="RB_STENCIL_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-"/>
-	<reg32 offset="0x8815" name="RB_RESOLVE_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-"/>
+	<reg32 offset="0x8815" name="RB_RESOLVE_GMEM_DIMENSION" type="a8xx_gmem_dimension" variants="A8XX-" usage="resolve"/>
+	<reg32 offset="0x88af" name="RB_RESOLVE_GMEM_PARTITION" variants="A8XX-" usage="resolve"/>
 
 	<array offset="0x8930" name="RB_MRT_GMEM_DIMENSION" variants="A8XX-" stride="1" length="8">
 		<reg32 offset="0" name="REG" type="a8xx_gmem_dimension"/>
@@ -2693,13 +2753,13 @@ by a particular renderpass/blit.
 		These show up in a6xx gen3+ but so far haven't found an example of
 		blob writing non-zero:
 	 -->
-	<reg32 offset="0x8a00" name="RB_UNKNOWN_8A00" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0x8a10" name="RB_UNKNOWN_8A10" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0x8a20" name="RB_UNKNOWN_8A20" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0x8a30" name="RB_UNKNOWN_8A30" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0x8a00" name="RB_UNKNOWN_8A00" variants="A6XX" usage="draw"/>
+	<reg32 offset="0x8a10" name="RB_UNKNOWN_8A10" variants="A6XX" usage="draw"/>
+	<reg32 offset="0x8a20" name="RB_UNKNOWN_8A20" variants="A6XX" usage="draw"/>
+	<reg32 offset="0x8a30" name="RB_UNKNOWN_8A30" variants="A6XX" usage="draw"/>
 
-	<reg32 offset="0x8c00" name="RB_A2D_BLT_CNTL" type="a6xx_a2d_blt_cntl" usage="rp_blit"/>
-	<reg32 offset="0x8c01" name="RB_A2D_PIXEL_CNTL" low="0" high="31" usage="rp_blit"/>
+	<reg32 offset="0x8c00" name="RB_A2D_BLT_CNTL" type="a6xx_a2d_blt_cntl" usage="blit"/>
+	<reg32 offset="0x8c01" name="RB_A2D_PIXEL_CNTL" low="0" high="31" usage="blit"/>
 
 	<bitset name="a6xx_a2d_src_texture_info" inline="yes">
 		<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
@@ -2731,28 +2791,28 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<!-- 0x8c02-0x8c16 invalid -->
-	<reg32 offset="0x8c17" name="RB_A2D_DEST_BUFFER_INFO" type="a6xx_a2d_dest_buffer_info" usage="rp_blit"/>
-	<reg64 offset="0x8c18" name="RB_A2D_DEST_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8c1a" name="RB_A2D_DEST_BUFFER_PITCH" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
+	<reg32 offset="0x8c17" name="RB_A2D_DEST_BUFFER_INFO" type="a6xx_a2d_dest_buffer_info" usage="blit"/>
+	<reg64 offset="0x8c18" name="RB_A2D_DEST_BUFFER_BASE" type="waddress" align="64" usage="blit"/>
+	<reg32 offset="0x8c1a" name="RB_A2D_DEST_BUFFER_PITCH" low="0" high="15" shr="6" type="uint" usage="blit"/>
 	<!-- this is a guess but seems likely (for NV12/IYUV): -->
-	<reg64 offset="0x8c1b" name="RB_A2D_DEST_BUFFER_BASE_1" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8c1d" name="RB_A2D_DEST_BUFFER_PITCH_1" low="0" high="15" shr="6" type="uint" usage="rp_blit"/>
-	<reg64 offset="0x8c1e" name="RB_A2D_DEST_BUFFER_BASE_2" type="waddress" align="64" usage="rp_blit"/>
+	<reg64 offset="0x8c1b" name="RB_A2D_DEST_BUFFER_BASE_1" type="waddress" align="64" usage="blit"/>
+	<reg32 offset="0x8c1d" name="RB_A2D_DEST_BUFFER_PITCH_1" low="0" high="15" shr="6" type="uint" usage="blit"/>
+	<reg64 offset="0x8c1e" name="RB_A2D_DEST_BUFFER_BASE_2" type="waddress" align="64" usage="blit"/>
 
-	<reg64 offset="0x8c20" name="RB_A2D_DEST_FLAG_BUFFER_BASE" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8c22" name="RB_A2D_DEST_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" usage="rp_blit"/>
+	<reg64 offset="0x8c20" name="RB_A2D_DEST_FLAG_BUFFER_BASE" type="waddress" align="64" usage="blit"/>
+	<reg32 offset="0x8c22" name="RB_A2D_DEST_FLAG_BUFFER_PITCH" type="a6xx_flag_buffer_pitch" usage="blit"/>
 	<!-- this is a guess but seems likely (for NV12 with UBWC): -->
-	<reg64 offset="0x8c23" name="RB_A2D_DEST_FLAG_BUFFER_BASE_1" type="waddress" align="64" usage="rp_blit"/>
-	<reg32 offset="0x8c25" name="RB_A2D_DEST_FLAG_BUFFER_PITCH_1" low="0" high="7" shr="6" type="uint" usage="rp_blit"/>
+	<reg64 offset="0x8c23" name="RB_A2D_DEST_FLAG_BUFFER_BASE_1" type="waddress" align="64" usage="blit"/>
+	<reg32 offset="0x8c25" name="RB_A2D_DEST_FLAG_BUFFER_PITCH_1" low="0" high="7" shr="6" type="uint" usage="blit"/>
 
 	<!-- TODO: 0x8c26-0x8c33 are all full 32-bit registers -->
 	<!-- unlike a5xx, these are per channel values rather than packed -->
-	<reg32 offset="0x8c2c" name="RB_A2D_CLEAR_COLOR_DW0" usage="rp_blit"/>
-	<reg32 offset="0x8c2d" name="RB_A2D_CLEAR_COLOR_DW1" usage="rp_blit"/>
-	<reg32 offset="0x8c2e" name="RB_A2D_CLEAR_COLOR_DW2" usage="rp_blit"/>
-	<reg32 offset="0x8c2f" name="RB_A2D_CLEAR_COLOR_DW3" usage="rp_blit"/>
+	<reg32 offset="0x8c2c" name="RB_A2D_CLEAR_COLOR_DW0" usage="blit"/>
+	<reg32 offset="0x8c2d" name="RB_A2D_CLEAR_COLOR_DW1" usage="blit"/>
+	<reg32 offset="0x8c2e" name="RB_A2D_CLEAR_COLOR_DW2" usage="blit"/>
+	<reg32 offset="0x8c2f" name="RB_A2D_CLEAR_COLOR_DW3" usage="blit"/>
 
-	<reg32 offset="0x8c34" name="RB_UNKNOWN_8C34" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0x8c34" name="RB_A2D_UNKNOWN_8C34" variants="A7XX-" usage="blit"/>
 
 	<!-- 0x8c35-0x8dff invalid -->
 
@@ -2821,7 +2881,7 @@ by a particular renderpass/blit.
 	<!-- 0x8e26-0x8e27 invalid -->
 
 	<reg32 offset="0x8f00" name="RB_CMP_NC_MODE_CNTL" variants="A8XX-"/>
-	<reg32 offset="0x8f01" name="RB_RESOLVE_PREFETCH_CNTL" variants="A8XX-"/>
+	<reg32 offset="0x8f01" name="RB_RESOLVE_PREFETCH_CNTL" variants="A8XX-" usage="resolve"/>
 	<reg32 offset="0x8f02" name="RB_CMP_DBG_ECO_CNTL" variants="A8XX-"/>
 
 	<reg32 offset="0x8f03" name="RB_UNSLICE_STATUS" variants="A8XX-"/>
@@ -2847,7 +2907,7 @@ by a particular renderpass/blit.
 
 	<!-- 0x9000-0x90ff invalid -->
 
-	<reg32 offset="0x9100" name="VPC_GS_PARAM" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0x9100" name="VPC_GS_PARAM" variants="A6XX" usage="draw">
 		<bitfield name="LINELENGTHLOC" low="0" high="7" type="uint"/>
 	</reg32>
 
@@ -2860,17 +2920,17 @@ by a particular renderpass/blit.
 		<bitfield name="CLIP_DIST_03_LOC" low="8" high="15" type="uint"/>
 		<bitfield name="CLIP_DIST_47_LOC" low="16" high="23" type="uint"/>
 	</bitset>
-	<reg32 offset="0x9101" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9102" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9103" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9101" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9102" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9103" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="draw"/>
 
-	<reg32 offset="0x9307" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="rp_blit"/>
-	<reg32 offset="0x9308" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="rp_blit"/>
-	<reg32 offset="0x9309" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x9307" name="VPC_VS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="draw"/>
+	<reg32 offset="0x9308" name="VPC_GS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="draw"/>
+	<reg32 offset="0x9309" name="VPC_DS_CLIP_CULL_CNTL" type="a6xx_vpc_xs_clip_cntl" variants="A8XX" usage="draw"/>
 
-	<reg32 offset="0x9311" name="VPC_VS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9312" name="VPC_GS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9313" name="VPC_DS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9311" name="VPC_VS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9312" name="VPC_GS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9313" name="VPC_DS_CLIP_CULL_CNTL_V2" type="a6xx_vpc_xs_clip_cntl" variants="A6XX-A7XX" usage="draw"/>
 
 	<bitset name="a6xx_vpc_xs_siv_cntl" inline="yes">
 		<bitfield name="LAYERLOC" low="0" high="7" type="uint"/>
@@ -2878,17 +2938,17 @@ by a particular renderpass/blit.
 		<bitfield name="SHADINGRATELOC" low="16" high="23" type="uint" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x9104" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9105" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9106" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9104" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9105" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9106" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
 
-	<reg32 offset="0x930a" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x930b" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x930c" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x930a" name="VPC_VS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x930b" name="VPC_GS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x930c" name="VPC_DS_SIV_CNTL" type="a6xx_vpc_xs_siv_cntl" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9314" name="VPC_VS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9315" name="VPC_GS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9316" name="VPC_DS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9314" name="VPC_VS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9315" name="VPC_GS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9316" name="VPC_DS_SIV_CNTL_V2" type="a6xx_vpc_xs_siv_cntl" variants="A6XX-A7XX" usage="draw"/>
 
 	<bitset name="a6xx_vpc_rast_stream_cntl" inline="yes">
 		<!-- which stream to send to GRAS -->
@@ -2897,19 +2957,19 @@ by a particular renderpass/blit.
 		<bitfield name="DISCARD" pos="2" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x9980" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0x9107" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x930d" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x9317" name="VPC_RAST_STREAM_CNTL_V2" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9980" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A6XX" usage="draw"/>
+	<reg32 offset="0x9107" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x930d" name="VPC_RAST_STREAM_CNTL" type="a6xx_vpc_rast_stream_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x9317" name="VPC_RAST_STREAM_CNTL_V2" type="a6xx_vpc_rast_stream_cntl" variants="A7XX" usage="draw"/>
 
-	<reg32 offset="0x9107" name="VPC_UNKNOWN_9107" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0x9107" name="VPC_UNKNOWN_9107" variants="A6XX" usage="draw">
 		<!-- this mirrors VPC_RAST_STREAM_CNTL::DISCARD, although it seems it's unused -->
 		<bitfield name="RASTER_DISCARD" pos="0" type="boolean"/>
 		<bitfield name="UNK2" pos="2" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0x9108" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x930e" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9108" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x930e" name="VPC_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="draw"/>
 	<bitset name="a6xx_pc_cntl" inline="yes">
 		<bitfield name="PRIMITIVE_RESTART" pos="0" type="boolean"/>
 		<bitfield name="PROVOKING_VTX_LAST" pos="1" type="boolean"/>
@@ -2949,14 +3009,14 @@ by a particular renderpass/blit.
 		<bitfield name="VIEWS" low="2" high="6" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0x9109" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x930f" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x910a" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x90c0" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x910b" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x90c1" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x910c" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x931a" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9109" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x930f" name="VPC_PC_CNTL" type="a6xx_pc_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x910a" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x90c0" name="VPC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x910b" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x90c1" name="VPC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x910c" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x931a" name="VPC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A8XX-" usage="draw"/>
 
 	<enum name="a6xx_varying_interp_mode">
 		<value value="0" name="INTERP_SMOOTH"/>
@@ -2973,20 +3033,20 @@ by a particular renderpass/blit.
 	</enum>
 
 	<!-- 0x9109-0x91ff invalid -->
-	<array offset="0x9200" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x9200" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" variants="A6XX-A7XX" usage="draw">
 		<doc>Packed array of a6xx_varying_interp_mode</doc>
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
-	<array offset="0x9208" name="VPC_VARYING_REPLACE_MODE" stride="1" length="8" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x9208" name="VPC_VARYING_REPLACE_MODE" stride="1" length="8" variants="A6XX-A7XX" usage="draw">
 		<doc>Packed array of a6xx_varying_ps_repl_mode</doc>
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
 
-	<array offset="0x9240" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" variants="A8XX-" usage="rp_blit">
+	<array offset="0x9240" name="VPC_VARYING_INTERP_MODE" stride="1" length="8" variants="A8XX-" usage="draw">
 		<doc>Packed array of a6xx_varying_interp_mode</doc>
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
-	<array offset="0x9248" name="VPC_VARYING_REPLACE_MODE" stride="1" length="8" variants="A8XX-" usage="rp_blit">
+	<array offset="0x9248" name="VPC_VARYING_REPLACE_MODE" stride="1" length="8" variants="A8XX-" usage="draw">
 		<doc>Packed array of a6xx_varying_ps_repl_mode</doc>
 		<reg32 offset="0x0" name="MODE"/>
 	</array>
@@ -2995,12 +3055,12 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9210" name="VPC_UNKNOWN_9210" low="0" high="31" variants="A6XX" usage="cmd"/>
 	<reg32 offset="0x9211" name="VPC_UNKNOWN_9211" low="0" high="31" variants="A6XX" usage="cmd"/>
 
-	<array offset="0x9212" name="VPC_VARYING_LM_TRANSFER_CNTL" stride="1" length="4" variants="A6XX-A7XX" usage="rp_blit">
+	<array offset="0x9212" name="VPC_VARYING_LM_TRANSFER_CNTL" stride="1" length="4" variants="A6XX-A7XX" usage="draw">
 		<!-- one bit per varying component: -->
 		<reg32 offset="0" name="DISABLE"/>
 	</array>
 
-	<array offset="0x9252" name="VPC_VARYING_LM_TRANSFER_CNTL" stride="1" length="4" variants="A8XX-" usage="rp_blit">
+	<array offset="0x9252" name="VPC_VARYING_LM_TRANSFER_CNTL" stride="1" length="4" variants="A8XX-" usage="draw">
 		<!-- one bit per varying component: -->
 		<reg32 offset="0" name="DISABLE"/>
 	</array>
@@ -3034,8 +3094,8 @@ by a particular renderpass/blit.
 		<bitfield name="RESET" pos="16" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x9216" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9180" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9216" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9180" name="VPC_SO_MAPPING_WPTR" type="a6xx_vpc_so_mapping_wptr" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_vpc_so_mapping_port" inline="yes">
 		<bitfield name="A_BUF" low="0" high="1" type="uint"/>
@@ -3047,8 +3107,8 @@ by a particular renderpass/blit.
 	</bitset>
 
 	<!-- special register, write multiple times to load SO program (not readable) -->
-	<reg32 offset="0x9217" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9181" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9217" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9181" name="VPC_SO_MAPPING_PORT" type="a6xx_vpc_so_mapping_port" variants="A8XX-" usage="draw"/>
 
 	<reg64 offset="0x9218" name="VPC_SO_QUERY_BASE" type="waddress" align="32" variants="A6XX-A7XX" usage="cmd"/>
 	<reg64 offset="0x9182" name="VPC_SO_QUERY_BASE" type="waddress" align="32" variants="A8XX-" usage="cmd"/>
@@ -3097,13 +3157,13 @@ by a particular renderpass/blit.
 		</bitfield>
 	</bitset>
 
-	<reg32 offset="0x9301" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9302" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9303" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9301" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9302" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9303" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
 
-	<reg32 offset="0x9300" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x9301" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x9302" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9300" name="VPC_VS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x9301" name="VPC_GS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x9302" name="VPC_DS_CNTL" type="a6xx_vpc_xs_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_vpc_ps_cntl" inline="yes">
 		<bitfield name="NUMNONPOSVAR" low="0" high="7" type="uint"/>
@@ -3124,8 +3184,8 @@ by a particular renderpass/blit.
 		</bitfield>
 	</bitset>
 
-	<reg32 offset="0x9304" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9303" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9304" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9303" name="VPC_PS_CNTL" type="a6xx_vpc_ps_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_vpc_so_cntl" inline="yes">
 		<!--
@@ -3138,21 +3198,21 @@ by a particular renderpass/blit.
 		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
 	</bitset>
 
-	<reg32 offset="0x9305" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9304" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9305" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9304" name="VPC_SO_CNTL" type="a6xx_vpc_so_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_so_override" inline="yes">
 		<bitfield name="DISABLE" pos="0" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x9306" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9305" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9306" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9305" name="VPC_SO_OVERRIDE" type="a6xx_so_override" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9807" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b0a" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9807" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x9b0a" name="PC_DGEN_SO_OVERRIDE" type="a6xx_so_override" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9307" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9306" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9307" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9306" name="VPC_PS_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX-" usage="draw"/>
 
 	<reg32 offset="0x9308" name="VPC_ATTR_BUF_GMEM_SIZE" variants="A7XX" type="uint" usage="cmd"/>
 	<reg32 offset="0x9309" name="VPC_ATTR_BUF_GMEM_BASE" variants="A7XX" type="hex" usage="cmd"/>
@@ -3172,10 +3232,10 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9b17" name="PC_POS_BUF_GMEM_SIZE" variants="A8XX-" type="uint" usage="cmd"/>
 	<reg32 offset="0x9b18" name="PC_BV_POS_BUF_GMEM_SIZE" variants="A8XX-" type="uint" usage="cmd"/>
 
-	<reg32 offset="0x930a" name="VPC_UNKNOWN_930A" variants="A7XX"/>
+	<reg32 offset="0x930a" name="VPC_UNKNOWN_CNTL" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x9313" name="VPC_UNKNOWN_CNTL" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9313" name="VPC_UNKNOWN_9313" variants="A8XX-"/>
-	<reg32 offset="0x9e17" name="PC_UNKNOWN_9E17" variants="A8XX-"/>
+	<reg32 offset="0x9e17" name="PC_UNKNOWN_9E17" variants="A8XX-" usage="draw"/>
 
 	<reg32 offset="0x960a" name="VPC_FLATSHADE_MODE_CNTL" variants="A7XX"/>
 	<reg32 offset="0x9741" name="VPC_FLATSHADE_MODE_CNTL" variants="A8XX-"/>
@@ -3204,47 +3264,47 @@ by a particular renderpass/blit.
 
 	<reg32 offset="0x980b" name="PC_UNKNOWN_980B" variants="A8XX-"/>
 
-	<reg32 offset="0x9800" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b10" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9800" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b10" name="PC_HS_PARAM_0" low="0" high="5" type="uint" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_pc_hs_param_1" inline="yes">
 		<bitfield name="SIZE" low="0" high="10" type="uint"/>
 		<bitfield name="UNK13" pos="13"/>
 	</bitset>
 
-	<reg32 offset="0x9801" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b11" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9801" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b11" name="PC_HS_PARAM_1" type="a6xx_pc_hs_param_1" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_pc_ds_param" inline="yes">
 		<bitfield name="SPACING" low="0" high="1" type="a6xx_tess_spacing"/>
 		<bitfield name="OUTPUT" low="2" high="3" type="a6xx_tess_output"/>
 	</bitset>
 
-	<reg32 offset="0x9802" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b12" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9802" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b12" name="PC_DS_PARAM" type="a6xx_pc_ds_param" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9803" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b15" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9803" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b15" name="PC_RESTART_INDEX" low="0" high="31" type="uint" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9804" name="PC_MODE_CNTL" low="0" high="7" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b00" name="PC_MODE_CNTL" low="0" high="14" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x9804" name="PC_MODE_CNTL" low="0" high="7" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b00" name="PC_MODE_CNTL" low="0" high="14" variants="A8XX" usage="draw"/>
 
-	<reg32 offset="0x9805" name="PC_POWER_CNTL" low="0" high="2" usage="rp_blit"/>
+	<reg32 offset="0x9805" name="PC_POWER_CNTL" low="0" high="2" variants="A6XX" usage="draw"/>
 
 	<bitset name="a6xx_pc_ps_cntl" inline="yes">
 		<bitfield name="PRIMITIVEIDEN" pos="0" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0x9806" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b06" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9806" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b06" name="PC_PS_CNTL" type="a6xx_pc_ps_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_pc_dgen_so_cntl" inline="yes">
 		<bitfield name="STREAM_ENABLE" low="15" high="18" type="hex"/>
 	</bitset>
 
 	<!-- New in a6xx gen3+ -->
-	<reg32 offset="0x9808" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b0b" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9808" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b0b" name="PC_DGEN_SO_CNTL" type="a6xx_pc_dgen_so_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_pc_dgen_su_conservative_ras_cntl" inline="yes">
 		<bitfield name="CONSERVATIVERASEN" pos="0" type="boolean"/>
@@ -3253,7 +3313,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0x980a" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_pc_dgen_su_conservative_ras_cntl" variants="A6XX-A7XX"/>
 	<reg32 offset="0x9b08" name="PC_DGEN_SU_CONSERVATIVE_RAS_CNTL" type="a6xx_pc_dgen_su_conservative_ras_cntl" variants="A8XX-"/>
 
-	<reg32 offset="0x9b0c" name="PC_VS_INPUT_CNTL" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0x9b0c" name="PC_VS_INPUT_CNTL" variants="A8XX-" usage="draw">
 		<bitfield name="INSTR_CNT" low="0" high="5" type="uint"/>
 		<bitfield name="SIDEBAND_CNT" low="6" high="8" type="uint"/>
 	</reg32>
@@ -3287,9 +3347,12 @@ by a particular renderpass/blit.
 
 	<!-- 0x9843-0x997f invalid -->
 
-	<reg32 offset="0x9981" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0x9809" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9812" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX" usage="rp_blit"/>
+	<reg32 offset="0x9981" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A6XX" usage="draw"/>
+	<reg32 offset="0x9809" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A7XX" usage="draw"/>
+	<reg32 offset="0x9812" name="PC_DGEN_RAST_CNTL" type="a6xx_rast_cntl" variants="A8XX" usage="draw"/>
+
+	<reg32 offset="0x9884" name="PC_HS_PATCH_SIZE" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0x9813" name="PC_HS_PATCH_SIZE" variants="A8XX-" usage="cmd"/>
 
 	<!-- Both are a750+.
 	     Probably needed to correctly overlap execution of several draws.
@@ -3304,8 +3367,8 @@ by a particular renderpass/blit.
 
 	<!-- 0x9982-0x9aff invalid -->
 
-	<reg32 offset="0x9b00" name="PC_CNTL" type="a6xx_pc_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b01" name="PC_CNTL" type="a6xx_pc_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b00" name="PC_CNTL" type="a6xx_pc_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b01" name="PC_CNTL" type="a6xx_pc_cntl" variants="A8XX-" usage="draw"/>
 
 	<bitset name="a6xx_pc_xs_cntl" inline="yes">
 		<doc>
@@ -3324,31 +3387,31 @@ by a particular renderpass/blit.
 		<bitfield name="SHADINGRATE" pos="24" type="boolean" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0x9b01" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b02" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b03" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b04" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
+	<reg32 offset="0x9b01" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b02" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b03" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b04" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A6XX-A7XX" usage="draw"/>
 
-	<reg32 offset="0x9b02" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x9b03" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x9b04" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0x9b05" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b02" name="PC_VS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x9b03" name="PC_GS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x9b04" name="PC_HS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="draw"/>
+	<reg32 offset="0x9b05" name="PC_DS_CNTL" type="a6xx_pc_xs_cntl" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9b05" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b13" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b05" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b13" name="PC_GS_PARAM_0" type="a6xx_gs_param_0" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0x9b06" name="PC_PRIMITIVE_CNTL_6" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0x9b06" name="PC_PRIMITIVE_CNTL_6" variants="A6XX" usage="draw">
 		<doc>
 		  size in vec4s of per-primitive storage for gs. TODO: not actually in VPC
 		</doc>
 		<bitfield name="STRIDE_IN_VPC" low="0" high="10" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0x9b07" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b09" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b07" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b09" name="PC_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" variants="A8XX-" usage="draw"/>
 	<!-- mask of enabled views, doesn't exist on A630 -->
-	<reg32 offset="0x9b08" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0x9b0d" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0x9b08" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0x9b0d" name="PC_STEREO_RENDERING_VIEWMASK" type="hex" low="0" high="15" variants="A8XX-" usage="draw"/>
 	<!-- 0x9b09-0x9bff invalid -->
 	<reg32 offset="0x9c00" name="PC_2D_EVENT_CMD">
 		<!-- special register (but note first 8 bits can be written/read) -->
@@ -3426,18 +3489,18 @@ by a particular renderpass/blit.
 	<reg32 offset="0x9e63" name="PC_CONTEXT_SWITCH_GFX_PREEMPTION_MODE" variants="A8XX-"/>
 	<reg32 offset="0x9e64" name="PC_CONTEXT_SWITCH_STABILIZE_CNTL_1" variants="A8XX-"/>
 
-	<reg32 offset="0xa000" name="VFD_CNTL_0" usage="rp_blit">
+	<reg32 offset="0xa000" name="VFD_CNTL_0" usage="draw">
 		<bitfield name="FETCH_CNT" low="0" high="5" type="uint"/>
 		<bitfield name="DECODE_CNT" low="8" high="13" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa001" name="VFD_CNTL_1" usage="rp_blit">
+	<reg32 offset="0xa001" name="VFD_CNTL_1" usage="draw">
 		<bitfield name="REGID4VTX" low="0" high="7" type="a3xx_regid"/>
 		<bitfield name="REGID4INST" low="8" high="15" type="a3xx_regid"/>
 		<bitfield name="REGID4PRIMID" low="16" high="23" type="a3xx_regid"/>
 		<!-- only used for VS in non-multi-position-output case -->
 		<bitfield name="REGID4VIEWID" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa002" name="VFD_CNTL_2" usage="rp_blit">
+	<reg32 offset="0xa002" name="VFD_CNTL_2" usage="draw">
 		<bitfield name="REGID_HSRELPATCHID" low="0" high="7" type="a3xx_regid">
 			<doc>
 				This is the ID of the current patch within the
@@ -3450,20 +3513,20 @@ by a particular renderpass/blit.
 		</bitfield>
 		<bitfield name="REGID_INVOCATIONID" low="8" high="15" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa003" name="VFD_CNTL_3" usage="rp_blit">
+	<reg32 offset="0xa003" name="VFD_CNTL_3" usage="draw">
 		<bitfield name="REGID_DSPRIMID" low="0" high="7" type="a3xx_regid"/>
 		<bitfield name="REGID_DSRELPATCHID" low="8" high="15" type="a3xx_regid"/>
 		<bitfield name="REGID_TESSX" low="16" high="23" type="a3xx_regid"/>
 		<bitfield name="REGID_TESSY" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa004" name="VFD_CNTL_4" usage="rp_blit">
-		<bitfield name="UNK0" low="0" high="7" type="a3xx_regid"/>
+	<reg32 offset="0xa004" name="VFD_CNTL_4" usage="draw">
+		<bitfield name="REGID_DSVIEWID" low="0" high="7" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa005" name="VFD_CNTL_5" usage="rp_blit">
+	<reg32 offset="0xa005" name="VFD_CNTL_5" usage="draw">
 		<bitfield name="REGID_GSHEADER" low="0" high="7" type="a3xx_regid"/>
-		<bitfield name="UNK8" low="8" high="15" type="a3xx_regid"/>
+		<bitfield name="REGID_GSVIEWID" low="8" high="15" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa006" name="VFD_CNTL_6" usage="rp_blit">
+	<reg32 offset="0xa006" name="VFD_CNTL_6" usage="draw">
 		<!--
 			True if gl_PrimitiveID is read via the FS
 		-->
@@ -3474,7 +3537,7 @@ by a particular renderpass/blit.
 		<bitfield name="RENDER_MODE" low="0" high="2" type="a6xx_render_mode"/>
 	</reg32>
 
-	<reg32 offset="0xa008" name="VFD_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" usage="rp_blit"/>
+	<reg32 offset="0xa008" name="VFD_STEREO_RENDERING_CNTL" type="a6xx_stereo_rendering_cntl" usage="draw"/>
 	<reg32 offset="0xa009" name="VFD_MODE_CNTL" usage="cmd">
 		<!-- add VFD_INDEX_OFFSET to REGID4VTX -->
 		<bitfield name="VERTEX" pos="0" type="boolean"/>
@@ -3482,14 +3545,14 @@ by a particular renderpass/blit.
 		<bitfield name="INSTANCE" pos="1" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0xa00e" name="VFD_INDEX_OFFSET" usage="rp_blit"/>
-	<reg32 offset="0xa00f" name="VFD_INSTANCE_START_OFFSET" usage="rp_blit"/>
-	<array offset="0xa010" name="VFD_VERTEX_BUFFER" stride="4" length="32" usage="rp_blit">
+	<reg32 offset="0xa00e" name="VFD_INDEX_OFFSET" usage="draw"/>
+	<reg32 offset="0xa00f" name="VFD_INSTANCE_START_OFFSET" usage="draw"/>
+	<array offset="0xa010" name="VFD_VERTEX_BUFFER" stride="4" length="32" usage="draw">
 		<reg64 offset="0x0" name="BASE" type="address" align="1"/>
 		<reg32 offset="0x2" name="SIZE" type="uint"/>
 		<reg32 offset="0x3" name="STRIDE" low="0" high="11" type="uint"/>
 	</array>
-	<array offset="0xa090" name="VFD_FETCH_INSTR" stride="2" length="32" usage="rp_blit">
+	<array offset="0xa090" name="VFD_FETCH_INSTR" stride="2" length="32" usage="draw">
 		<reg32 offset="0x0" name="INSTR">
 			<!-- IDX and byte OFFSET into VFD_VERTEX_BUFFER -->
 			<bitfield name="IDX" low="0" high="4" type="uint"/>
@@ -3502,14 +3565,14 @@ by a particular renderpass/blit.
 		</reg32>
 		<reg32 offset="0x1" name="STEP_RATE" type="uint"/>
 	</array>
-	<array offset="0xa0d0" name="VFD_DEST_CNTL" stride="1" length="32" usage="rp_blit">
+	<array offset="0xa0d0" name="VFD_DEST_CNTL" stride="1" length="32" usage="draw">
 		<reg32 offset="0x0" name="INSTR">
 			<bitfield name="WRITEMASK" low="0" high="3" type="hex"/>
 			<bitfield name="REGID" low="4" high="11" type="a3xx_regid"/>
 		</reg32>
 	</array>
 
-	<reg32 offset="0xa0f8" name="VFD_POWER_CNTL" low="0" high="2" usage="rp_blit"/>
+	<reg32 offset="0xa0f8" name="VFD_POWER_CNTL" low="0" high="2" variants="A6XX" usage="draw"/>
 
 	<reg32 offset="0xa600" name="VFD_DBG_ECO_CNTL" variants="A7XX-" usage="init"/>
 
@@ -3549,10 +3612,12 @@ by a particular renderpass/blit.
 		 -->
 		<bitfield name="HALFREGFOOTPRINT" low="1" high="6" type="uint"/>
 		<bitfield name="FULLREGFOOTPRINT" low="7" high="12" type="uint"/>
-		<!-- could it be a low bit of branchstack? -->
-		<bitfield name="UNK13" pos="13" type="boolean"/>
 		<!-- seems to be nesting level for flow control:.. -->
-		<bitfield name="BRANCHSTACK" low="14" high="19" type="uint"/>
+		<bitfield name="BRANCHSTACK" low="13" high="19" type="uint"/>
+
+		<!-- gen8: -->
+		<bitfield name="FULLREGFOOTPRINT_LSB" pos="27" type="uint" variants="A8XX-"/>
+		<bitfield name="HALFREGFOOTPRINT_LSB" pos="30" type="uint" variants="A8XX-"/>
 	</bitset>
 
 	<bitset name="a6xx_sp_xs_config" inline="yes">
@@ -3580,7 +3645,7 @@ by a particular renderpass/blit.
 		<bitfield name="OUT" low="0" high="5" type="uint"/>
 	</bitset>
 
-	<reg32 offset="0xa800" name="SP_VS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
+	<reg32 offset="0xa800" name="SP_VS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="draw">
 		<!--
 		This field actually controls all geometry stages. TCS, TES, and
 		GS must have the same mergedregs setting as VS.
@@ -3607,8 +3672,8 @@ by a particular renderpass/blit.
 	     bit N corresponds to brac.N -->
 	<reg32 offset="0xa801" name="SP_VS_BOOLEAN_CF_MASK" type="hex"/>
 	<!-- # of VS outputs including pos/psize -->
-	<reg32 offset="0xa802" name="SP_VS_OUTPUT_CNTL" type="a6xx_sp_xs_output_cntl" usage="rp_blit"/>
-	<array offset="0xa803" name="SP_VS_OUTPUT" stride="1" length="16" usage="rp_blit">
+	<reg32 offset="0xa802" name="SP_VS_OUTPUT_CNTL" type="a6xx_sp_xs_output_cntl" usage="draw"/>
+	<array offset="0xa803" name="SP_VS_OUTPUT" stride="1" length="16" usage="draw">
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
 			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
@@ -3623,7 +3688,7 @@ by a particular renderpass/blit.
 	an extra varying after, but with a lower OUTLOC position.  If present,
 	psize is last, preceded by position.
 	 -->
-	<array offset="0xa813" name="SP_VS_VPC_DEST" stride="1" length="8" usage="rp_blit">
+	<array offset="0xa813" name="SP_VS_VPC_DEST" stride="1" length="8" usage="draw">
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
 			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
@@ -3712,20 +3777,20 @@ by a particular renderpass/blit.
 		<!-- seen 0x400, 0xc00, 0x1000, 0x1c00, 0x1000, 0x2000, 0x3000 -->
 	</bitset>
 
-	<reg32 offset="0xa81b" name="SP_VS_PROGRAM_COUNTER_OFFSET" type="uint" usage="rp_blit"/>
-	<reg64 offset="0xa81c" name="SP_VS_BASE" type="address" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa81e" name="SP_VS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
-	<reg64 offset="0xa81f" name="SP_VS_PVT_MEM_BASE" type="waddress" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa821" name="SP_VS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
-	<reg32 offset="0xa822" name="SP_VS_TSIZE" low="0" high="7" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa823" name="SP_VS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
-	<reg32 offset="0xa824" name="SP_VS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa825" name="SP_VS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa81b" name="SP_VS_PROGRAM_COUNTER_OFFSET" type="uint" usage="draw"/>
+	<reg64 offset="0xa81c" name="SP_VS_BASE" type="address" align="32" usage="draw"/>
+	<reg32 offset="0xa81e" name="SP_VS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="draw"/>
+	<reg64 offset="0xa81f" name="SP_VS_PVT_MEM_BASE" type="waddress" align="32" usage="draw"/>
+	<reg32 offset="0xa821" name="SP_VS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="draw"/>
+	<reg32 offset="0xa822" name="SP_VS_TSIZE" low="0" high="7" type="uint" usage="draw"/>
+	<reg32 offset="0xa823" name="SP_VS_CONFIG" type="a6xx_sp_xs_config" usage="draw"/>
+	<reg32 offset="0xa824" name="SP_VS_INSTR_SIZE" low="0" high="27" type="uint" usage="draw"/>
+	<reg32 offset="0xa825" name="SP_VS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="draw"/>
 	<reg32 offset="0xa826" name="SP_VS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX"/>
 	<reg32 offset="0xa826" name="SP_VS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-"/>
 	<reg32 offset="0xa82d" name="SP_VS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
-	<reg32 offset="0xa830" name="SP_HS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
+	<reg32 offset="0xa830" name="SP_HS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="draw">
 		<!-- There is no mergedregs bit, that comes from the VS. -->
 		<bitfield name="EARLYPREAMBLE" pos="20" type="boolean"/>
 	</reg32>
@@ -3735,32 +3800,32 @@ by a particular renderpass/blit.
 	the maximum size of local storage should be:
 	 64 (wavesize) * 64 (SP_HS_CNTL_1) * 4 = 16k
 	-->
-	<reg32 offset="0xa831" name="SP_HS_CNTL_1" low="0" high="7" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa832" name="SP_HS_BOOLEAN_CF_MASK" type="hex" usage="rp_blit"/>
+	<reg32 offset="0xa831" name="SP_HS_CNTL_1" low="0" high="7" type="uint" usage="draw"/>
+	<reg32 offset="0xa832" name="SP_HS_BOOLEAN_CF_MASK" type="hex" usage="draw"/>
 
 	<!-- TODO: exact same layout as 0xa81b-0xa825 -->
-	<reg32 offset="0xa833" name="SP_HS_PROGRAM_COUNTER_OFFSET" type="uint" usage="rp_blit"/>
-	<reg64 offset="0xa834" name="SP_HS_BASE" type="address" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa836" name="SP_HS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
-	<reg64 offset="0xa837" name="SP_HS_PVT_MEM_BASE" type="waddress" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa839" name="SP_HS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
-	<reg32 offset="0xa83a" name="SP_HS_TSIZE" low="0" high="7" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa83b" name="SP_HS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
-	<reg32 offset="0xa83c" name="SP_HS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa83d" name="SP_HS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa833" name="SP_HS_PROGRAM_COUNTER_OFFSET" type="uint" usage="draw"/>
+	<reg64 offset="0xa834" name="SP_HS_BASE" type="address" align="32" usage="draw"/>
+	<reg32 offset="0xa836" name="SP_HS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="draw"/>
+	<reg64 offset="0xa837" name="SP_HS_PVT_MEM_BASE" type="waddress" align="32" usage="draw"/>
+	<reg32 offset="0xa839" name="SP_HS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="draw"/>
+	<reg32 offset="0xa83a" name="SP_HS_TSIZE" low="0" high="7" type="uint" usage="draw"/>
+	<reg32 offset="0xa83b" name="SP_HS_CONFIG" type="a6xx_sp_xs_config" usage="draw"/>
+	<reg32 offset="0xa83c" name="SP_HS_INSTR_SIZE" low="0" high="27" type="uint" usage="draw"/>
+	<reg32 offset="0xa83d" name="SP_HS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="draw"/>
 	<reg32 offset="0xa83e" name="SP_HS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX"/>
 	<reg32 offset="0xa83e" name="SP_HS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-"/>
 	<reg32 offset="0xa82f" name="SP_HS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
-	<reg32 offset="0xa840" name="SP_DS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
+	<reg32 offset="0xa840" name="SP_DS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="draw">
 		<!-- There is no mergedregs bit, that comes from the VS. -->
 		<bitfield name="EARLYPREAMBLE" pos="20" type="boolean"/>
 	</reg32>
 	<reg32 offset="0xa841" name="SP_DS_BOOLEAN_CF_MASK" type="hex"/>
 
 	<!-- TODO: exact same layout as 0xa802-0xa81a -->
-	<reg32 offset="0xa842" name="SP_DS_OUTPUT_CNTL" type="a6xx_sp_xs_output_cntl" usage="rp_blit"/>
-	<array offset="0xa843" name="SP_DS_OUTPUT" stride="1" length="16" usage="rp_blit">
+	<reg32 offset="0xa842" name="SP_DS_OUTPUT_CNTL" type="a6xx_sp_xs_output_cntl" usage="draw"/>
+	<array offset="0xa843" name="SP_DS_OUTPUT" stride="1" length="16" usage="draw">
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
 			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
@@ -3768,7 +3833,7 @@ by a particular renderpass/blit.
 			<bitfield name="B_COMPMASK" low="24" high="27" type="hex"/>
 		</reg32>
 	</array>
-	<array offset="0xa853" name="SP_DS_VPC_DEST" stride="1" length="8" usage="rp_blit">
+	<array offset="0xa853" name="SP_DS_VPC_DEST" stride="1" length="8" usage="draw">
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
 			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
@@ -3778,24 +3843,24 @@ by a particular renderpass/blit.
 	</array>
 
 	<!-- TODO: exact same layout as 0xa81b-0xa825 -->
-	<reg32 offset="0xa85b" name="SP_DS_PROGRAM_COUNTER_OFFSET" type="uint" usage="rp_blit"/>
-	<reg64 offset="0xa85c" name="SP_DS_BASE" type="address" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa85e" name="SP_DS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
-	<reg64 offset="0xa85f" name="SP_DS_PVT_MEM_BASE" type="waddress" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa861" name="SP_DS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
-	<reg32 offset="0xa862" name="SP_DS_TSIZE" low="0" high="7" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa863" name="SP_DS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
-	<reg32 offset="0xa864" name="SP_DS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa865" name="SP_DS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa85b" name="SP_DS_PROGRAM_COUNTER_OFFSET" type="uint" usage="draw"/>
+	<reg64 offset="0xa85c" name="SP_DS_BASE" type="address" align="32" usage="draw"/>
+	<reg32 offset="0xa85e" name="SP_DS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="draw"/>
+	<reg64 offset="0xa85f" name="SP_DS_PVT_MEM_BASE" type="waddress" align="32" usage="draw"/>
+	<reg32 offset="0xa861" name="SP_DS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="draw"/>
+	<reg32 offset="0xa862" name="SP_DS_TSIZE" low="0" high="7" type="uint" usage="draw"/>
+	<reg32 offset="0xa863" name="SP_DS_CONFIG" type="a6xx_sp_xs_config" usage="draw"/>
+	<reg32 offset="0xa864" name="SP_DS_INSTR_SIZE" low="0" high="27" type="uint" usage="draw"/>
+	<reg32 offset="0xa865" name="SP_DS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="draw"/>
 	<reg32 offset="0xa866" name="SP_DS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX"/>
 	<reg32 offset="0xa866" name="SP_DS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-"/>
 	<reg32 offset="0xa868" name="SP_DS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
-	<reg32 offset="0xa870" name="SP_GS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
+	<reg32 offset="0xa870" name="SP_GS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="draw">
 		<!-- There is no mergedregs bit, that comes from the VS. -->
 		<bitfield name="EARLYPREAMBLE" pos="20" type="boolean"/>
 	</reg32>
-	<reg32 offset="0xa871" name="SP_GS_CNTL_1" low="0" high="7" type="uint" usage="rp_blit">
+	<reg32 offset="0xa871" name="SP_GS_CNTL_1" low="0" high="7" type="uint" usage="draw">
 		<doc>
 			Normally the size of the output of the last stage in
 			dwords. It should be programmed as follows:
@@ -3809,14 +3874,14 @@ by a particular renderpass/blit.
 			doesn't matter in practice.
 		</doc>
 	</reg32>
-	<reg32 offset="0xa872" name="SP_GS_BOOLEAN_CF_MASK" type="hex" usage="rp_blit"/>
+	<reg32 offset="0xa872" name="SP_GS_BOOLEAN_CF_MASK" type="hex" usage="draw"/>
 
 	<!-- TODO: exact same layout as 0xa802-0xa81a -->
-	<reg32 offset="0xa873" name="SP_GS_OUTPUT_CNTL" type="a6xx_sp_xs_output_cntl" usage="rp_blit">
+	<reg32 offset="0xa873" name="SP_GS_OUTPUT_CNTL" type="a6xx_sp_xs_output_cntl" usage="draw">
 		<!-- FLAGS_REGID only for GS -->
 		<bitfield name="FLAGS_REGID" low="6" high="13" type="a3xx_regid"/>
 	</reg32>
-	<array offset="0xa874" name="SP_GS_OUTPUT" stride="1" length="16" usage="rp_blit">
+	<array offset="0xa874" name="SP_GS_OUTPUT" stride="1" length="16" usage="draw">
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="A_REGID" low="0" high="7" type="a3xx_regid"/>
 			<bitfield name="A_COMPMASK" low="8" high="11" type="hex"/>
@@ -3825,7 +3890,7 @@ by a particular renderpass/blit.
 		</reg32>
 	</array>
 
-	<array offset="0xa884" name="SP_GS_VPC_DEST" stride="1" length="8" usage="rp_blit">
+	<array offset="0xa884" name="SP_GS_VPC_DEST" stride="1" length="8" usage="draw">
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="OUTLOC0" low="0" high="7" type="uint"/>
 			<bitfield name="OUTLOC1" low="8" high="15" type="uint"/>
@@ -3835,15 +3900,15 @@ by a particular renderpass/blit.
 	</array>
 
 	<!-- TODO: exact same layout as 0xa81b-0xa825 -->
-	<reg32 offset="0xa88c" name="SP_GS_PROGRAM_COUNTER_OFFSET" type="uint" usage="rp_blit"/>
-	<reg64 offset="0xa88d" name="SP_GS_BASE" type="address" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa88f" name="SP_GS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
-	<reg64 offset="0xa890" name="SP_GS_PVT_MEM_BASE" type="waddress" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa892" name="SP_GS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
-	<reg32 offset="0xa893" name="SP_GS_TSIZE" low="0" high="7" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa894" name="SP_GS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
-	<reg32 offset="0xa895" name="SP_GS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
-	<reg32 offset="0xa896" name="SP_GS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa88c" name="SP_GS_PROGRAM_COUNTER_OFFSET" type="uint" usage="draw"/>
+	<reg64 offset="0xa88d" name="SP_GS_BASE" type="address" align="32" usage="draw"/>
+	<reg32 offset="0xa88f" name="SP_GS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="draw"/>
+	<reg64 offset="0xa890" name="SP_GS_PVT_MEM_BASE" type="waddress" align="32" usage="draw"/>
+	<reg32 offset="0xa892" name="SP_GS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="draw"/>
+	<reg32 offset="0xa893" name="SP_GS_TSIZE" low="0" high="7" type="uint" usage="draw"/>
+	<reg32 offset="0xa894" name="SP_GS_CONFIG" type="a6xx_sp_xs_config" usage="draw"/>
+	<reg32 offset="0xa895" name="SP_GS_INSTR_SIZE" low="0" high="27" type="uint" usage="draw"/>
+	<reg32 offset="0xa896" name="SP_GS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="draw"/>
 	<reg32 offset="0xa897" name="SP_GS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX"/>
 	<reg32 offset="0xa897" name="SP_GS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-"/>
 	<reg32 offset="0xa899" name="SP_GS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
@@ -3859,7 +3924,7 @@ by a particular renderpass/blit.
 
 	<!-- TODO: 4 unknown bool registers 0xa8c0-0xa8c3 -->
 
-	<reg32 offset="0xa980" name="SP_PS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="rp_blit">
+	<reg32 offset="0xa980" name="SP_PS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="draw">
 		<bitfield name="THREADSIZE" pos="20" type="a6xx_threadsize"/>
 		<bitfield name="UNK21" pos="21" type="boolean"/>
 		<bitfield name="VARYING" pos="22" type="boolean"/>
@@ -3878,16 +3943,15 @@ by a particular renderpass/blit.
 				and so one pixel's value is always unused.
 			</doc>
 		</bitfield>
-		<bitfield name="UNK27" pos="27" type="boolean"/>
 		<bitfield name="EARLYPREAMBLE" pos="28" type="boolean"/>
 		<bitfield name="MERGEDREGS" pos="31" type="boolean"/>
 	</reg32>
 	<reg32 offset="0xa981" name="SP_PS_BOOLEAN_CF_MASK" type="hex"/>
-	<reg32 offset="0xa982" name="SP_PS_PROGRAM_COUNTER_OFFSET" type="uint" usage="rp_blit"/>
-	<reg64 offset="0xa983" name="SP_PS_BASE" type="address" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa985" name="SP_PS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="rp_blit"/>
-	<reg64 offset="0xa986" name="SP_PS_PVT_MEM_BASE" type="waddress" align="32" usage="rp_blit"/>
-	<reg32 offset="0xa988" name="SP_PS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="rp_blit"/>
+	<reg32 offset="0xa982" name="SP_PS_PROGRAM_COUNTER_OFFSET" type="uint" usage="draw"/>
+	<reg64 offset="0xa983" name="SP_PS_BASE" type="address" align="32" usage="draw"/>
+	<reg32 offset="0xa985" name="SP_PS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="draw"/>
+	<reg64 offset="0xa986" name="SP_PS_PVT_MEM_BASE" type="waddress" align="32" usage="draw"/>
+	<reg32 offset="0xa988" name="SP_PS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="draw"/>
 
 	<bitset name="a6xx_sp_blend_cntl" inline="yes">
 		<!-- per-mrt enable bit -->
@@ -3897,12 +3961,12 @@ by a particular renderpass/blit.
 		<bitfield name="ALPHA_TO_COVERAGE" pos="10" type="boolean"/>
 	</bitset>
 
-	<reg32 offset="0xa989" name="SP_BLEND_CNTL" type="a6xx_sp_blend_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0xa989" name="SP_BLEND_CNTL" type="a6xx_sp_blend_cntl" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0xa989" name="SP_BLEND_CNTL" type="a6xx_sp_blend_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0xa989" name="SP_BLEND_CNTL" type="a6xx_sp_blend_cntl" variants="A8XX-" usage="draw">
 		<bitfield name="ALPHA_TO_ONE" pos="11" type="boolean" variants="A8XX-"/>
 	</reg32>
 
-	<reg32 offset="0xa98a" name="SP_SRGB_CNTL" usage="rp_blit">
+	<reg32 offset="0xa98a" name="SP_SRGB_CNTL" usage="draw">
 		<!-- Same as RB_SRGB_CNTL -->
 		<bitfield name="SRGB_MRT0" pos="0" type="boolean"/>
 		<bitfield name="SRGB_MRT1" pos="1" type="boolean"/>
@@ -3913,7 +3977,7 @@ by a particular renderpass/blit.
 		<bitfield name="SRGB_MRT6" pos="6" type="boolean"/>
 		<bitfield name="SRGB_MRT7" pos="7" type="boolean"/>
 	</reg32>
-	<reg32 offset="0xa98b" name="SP_PS_OUTPUT_MASK" usage="rp_blit">
+	<reg32 offset="0xa98b" name="SP_PS_OUTPUT_MASK" usage="draw">
 		<bitfield name="RT0" low="0" high="3"/>
 		<bitfield name="RT1" low="4" high="7"/>
 		<bitfield name="RT2" low="8" high="11"/>
@@ -3923,17 +3987,17 @@ by a particular renderpass/blit.
 		<bitfield name="RT6" low="24" high="27"/>
 		<bitfield name="RT7" low="28" high="31"/>
 	</reg32>
-	<reg32 offset="0xa98c" name="SP_PS_OUTPUT_CNTL" usage="rp_blit">
+	<reg32 offset="0xa98c" name="SP_PS_OUTPUT_CNTL" usage="draw">
 		<bitfield name="DUAL_COLOR_IN_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="DEPTH_REGID" low="8" high="15" type="a3xx_regid"/>
 		<bitfield name="SAMPMASK_REGID" low="16" high="23" type="a3xx_regid"/>
 		<bitfield name="STENCILREF_REGID" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa98d" name="SP_PS_MRT_CNTL" usage="rp_blit">
+	<reg32 offset="0xa98d" name="SP_PS_MRT_CNTL" usage="draw">
 		<bitfield name="MRT" low="0" high="3" type="uint"/>
 	</reg32>
 
-	<array offset="0xa98e" name="SP_PS_OUTPUT" stride="1" length="8" usage="rp_blit">
+	<array offset="0xa98e" name="SP_PS_OUTPUT" stride="1" length="8" usage="draw">
 		<doc>per MRT</doc>
 		<reg32 offset="0x0" name="REG">
 			<bitfield name="REGID" low="0" high="7" type="a3xx_regid"/>
@@ -3941,7 +4005,7 @@ by a particular renderpass/blit.
 		</reg32>
 	</array>
 
-	<array offset="0xa996" name="SP_PS_MRT" stride="1" length="8" usage="rp_blit">
+	<array offset="0xa996" name="SP_PS_MRT" stride="1" length="8" usage="draw">
 		<reg32 offset="0" name="REG">
 			<bitfield name="COLOR_FORMAT" low="0" high="7" type="a6xx_format"/>
 			<bitfield name="COLOR_SINT" pos="8" type="boolean"/>
@@ -3950,7 +4014,7 @@ by a particular renderpass/blit.
 		</reg32>
 	</array>
 
-	<reg32 offset="0xa99e" name="SP_PS_INITIAL_TEX_LOAD_CNTL" usage="rp_blit">
+	<reg32 offset="0xa99e" name="SP_PS_INITIAL_TEX_LOAD_CNTL" usage="draw">
 		<bitfield name="COUNT" low="0" high="2" type="uint"/>
 		<bitfield name="IJ_WRITE_DISABLE" pos="3" type="boolean"/>
 		<doc>
@@ -3967,7 +4031,7 @@ by a particular renderpass/blit.
 		<!-- Blob never uses it -->
 		<bitfield name="CONSTSLOTID4COORD" low="16" high="24" type="uint" variants="A7XX-"/>
 	</reg32>
-	<array offset="0xa99f" name="SP_PS_INITIAL_TEX_LOAD" stride="1" length="4" variants="A6XX" usage="rp_blit">
+	<array offset="0xa99f" name="SP_PS_INITIAL_TEX_LOAD" stride="1" length="4" variants="A6XX" usage="draw">
 		<reg32 offset="0" name="CMD" variants="A6XX">
 			<bitfield name="SRC" low="0" high="6" type="uint"/>
 			<bitfield name="SAMP_ID" low="7" high="10" type="uint"/>
@@ -3981,7 +4045,7 @@ by a particular renderpass/blit.
 			<bitfield name="CMD" low="29" high="31" type="a6xx_tex_prefetch_cmd"/>
 		</reg32>
 	</array>
-	<array offset="0xa99f" name="SP_PS_INITIAL_TEX_LOAD" stride="1" length="4" variants="A7XX-" usage="rp_blit">
+	<array offset="0xa99f" name="SP_PS_INITIAL_TEX_LOAD" stride="1" length="4" variants="A7XX-" usage="draw">
 		<reg32 offset="0" name="CMD" variants="A7XX-">
 			<bitfield name="SRC" low="0" high="6" type="uint"/>
 			<bitfield name="SAMP_ID" low="7" high="9" type="uint"/>
@@ -3993,21 +4057,21 @@ by a particular renderpass/blit.
 			<bitfield name="CMD" low="26" high="29" type="a6xx_tex_prefetch_cmd"/>
 		</reg32>
 	</array>
-	<array offset="0xa9a3" name="SP_PS_INITIAL_TEX_INDEX" stride="1" length="4" usage="rp_blit">
+	<array offset="0xa9a3" name="SP_PS_INITIAL_TEX_INDEX" stride="1" length="4" usage="draw">
 		<reg32 offset="0" name="CMD">
 			<bitfield name="SAMP_ID" low="0" high="15" type="uint"/>
 			<bitfield name="TEX_ID" low="16" high="31" type="uint"/>
 		</reg32>
 	</array>
-	<reg32 offset="0xa9a7" name="SP_PS_TSIZE" low="0" high="7" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xa9a7" name="SP_PS_TSIZE" low="0" high="7" type="uint" usage="draw"/>
 	<reg32 offset="0xa9a8" name="SP_UNKNOWN_A9A8" low="0" high="16" usage="cmd"/> <!-- always 0x0 ? -->
-	<reg32 offset="0xa9a9" name="SP_PS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="rp_blit"/>
+	<reg32 offset="0xa9a9" name="SP_PS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="draw"/>
 	<reg32 offset="0xa9ab" name="SP_PS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX"/>
 	<reg32 offset="0xa9ab" name="SP_PS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-"/>
 
 	<!-- TODO: unknown bool register at 0xa9aa, likely same as 0xa8c0-0xa8c3 but for FS -->
 
-	<reg32 offset="0xa9b0" name="SP_CS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="cmd">
+	<reg32 offset="0xa9b0" name="SP_CS_CNTL_0" type="a6xx_sp_xs_cntl_0" usage="compute">
 		<bitfield name="THREADSIZE" pos="20" type="a6xx_threadsize"/>
 		<!-- seems to make SP use less concurrent threads when possible? -->
 		<bitfield name="UNK21" pos="21" type="boolean"/>
@@ -4025,7 +4089,7 @@ by a particular renderpass/blit.
 	</enum>
 
 	<!-- set for compute shaders -->
-	<reg32 offset="0xa9b1" name="SP_CS_CNTL_1" usage="cmd">
+	<reg32 offset="0xa9b1" name="SP_CS_CNTL_1" usage="compute">
 		<bitfield name="SHARED_SIZE" low="0" high="4" type="uint">
 			<doc>
 				If 0 - all 32k of shared storage is enabled, otherwise
@@ -4045,29 +4109,29 @@ by a particular renderpass/blit.
 		</bitfield>
 		<bitfield name="ALT_LM_ENCODE" pos="26" type="boolean"/>
 	</reg32>
-	<reg32 offset="0xa9b2" name="SP_CS_BOOLEAN_CF_MASK" type="hex" usage="cmd"/>
-	<reg32 offset="0xa9b3" name="SP_CS_PROGRAM_COUNTER_OFFSET" type="uint" usage="cmd"/>
-	<reg64 offset="0xa9b4" name="SP_CS_BASE" type="address" align="32" usage="cmd"/>
-	<reg32 offset="0xa9b6" name="SP_CS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="cmd"/>
-	<reg64 offset="0xa9b7" name="SP_CS_PVT_MEM_BASE" type="waddress" align="32" usage="cmd"/>
-	<reg32 offset="0xa9b9" name="SP_CS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="cmd"/>
-	<reg32 offset="0xa9ba" name="SP_CS_TSIZE" low="0" high="7" type="uint" usage="cmd"/>
-	<reg32 offset="0xa9bb" name="SP_CS_CONFIG" type="a6xx_sp_xs_config" usage="cmd"/>
-	<reg32 offset="0xa9bc" name="SP_CS_INSTR_SIZE" low="0" high="27" type="uint" usage="cmd"/>
-	<reg32 offset="0xa9bd" name="SP_CS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="cmd"/>
-	<reg32 offset="0xa9be" name="SP_CS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX"/>
-	<reg32 offset="0xa9be" name="SP_CS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-"/>
+	<reg32 offset="0xa9b2" name="SP_CS_BOOLEAN_CF_MASK" type="hex" usage="compute"/>
+	<reg32 offset="0xa9b3" name="SP_CS_PROGRAM_COUNTER_OFFSET" type="uint" usage="compute"/>
+	<reg64 offset="0xa9b4" name="SP_CS_BASE" type="address" align="32" usage="compute"/>
+	<reg32 offset="0xa9b6" name="SP_CS_PVT_MEM_PARAM" type="a6xx_sp_xs_pvt_mem_param" usage="compute"/>
+	<reg64 offset="0xa9b7" name="SP_CS_PVT_MEM_BASE" type="waddress" align="32" usage="compute"/>
+	<reg32 offset="0xa9b9" name="SP_CS_PVT_MEM_SIZE" type="a6xx_sp_xs_pvt_mem_size" usage="compute"/>
+	<reg32 offset="0xa9ba" name="SP_CS_TSIZE" low="0" high="7" type="uint" usage="compute"/>
+	<reg32 offset="0xa9bb" name="SP_CS_CONFIG" type="a6xx_sp_xs_config" usage="compute"/>
+	<reg32 offset="0xa9bc" name="SP_CS_INSTR_SIZE" low="0" high="27" type="uint" usage="compute"/>
+	<reg32 offset="0xa9bd" name="SP_CS_PVT_MEM_STACK_OFFSET" type="a6xx_sp_xs_pvt_mem_stack_offset" usage="compute"/>
+	<reg32 offset="0xa9be" name="SP_CS_HYSTERESIS" type="a6xx_sp_xs_hysteresis" variants="A6XX-A7XX" usage="compute"/>
+	<reg32 offset="0xa9be" name="SP_CS_HYSTERESIS" type="a8xx_sp_xs_hysteresis" variants="A8XX-" usage="compute"/>
 	<reg32 offset="0xa9c5" name="SP_CS_VGS_CNTL" variants="A7XX-" usage="cmd"/>
 
 	<!-- new in a6xx gen4, matches SP_CS_CONST_CONFIG_0 -->
-	<reg32 offset="0xa9c2" name="SP_CS_WIE_CNTL_0" usage="cmd">
+	<reg32 offset="0xa9c2" name="SP_CS_WIE_CNTL_0" usage="compute">
 		<bitfield name="WGIDCONSTID" low="0" high="7" type="a3xx_regid"/>
 		<bitfield name="WGSIZECONSTID" low="8" high="15" type="a3xx_regid"/>
 		<bitfield name="WGOFFSETCONSTID" low="16" high="23" type="a3xx_regid"/>
 		<bitfield name="LOCALIDREGID" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
 	<!-- new in a6xx gen4, matches SP_CS_WGE_CNTL -->
-	<reg32 offset="0xa9c3" name="SP_CS_WIE_CNTL_1" variants="A6XX" usage="cmd">
+	<reg32 offset="0xa9c3" name="SP_CS_WIE_CNTL_1" variants="A6XX" usage="compute">
 		<!-- gl_LocalInvocationIndex -->
 		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
 		<!-- a650 has 6 "SP cores" (but 3 "SP"). this makes it use only
@@ -4090,7 +4154,7 @@ by a particular renderpass/blit.
 		<value value="0x1" name="WORKITEMRASTORDER_TILED"/>
 	</enum>
 
-	<reg32 offset="0xa9c3" name="SP_CS_WIE_CNTL_1" variants="A7XX-" usage="cmd">
+	<reg32 offset="0xa9c3" name="SP_CS_WIE_CNTL_1" variants="A7XX-" usage="compute">
 		<!-- gl_LocalInvocationIndex -->
 		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
 		<!-- Must match SP_CS_CTRL -->
@@ -4104,10 +4168,10 @@ by a particular renderpass/blit.
 
 	<!-- TODO: two 64kb aligned addresses at a9d0/a9d2 -->
 
-	<reg64 offset="0xa9e0" name="SP_PS_SAMPLER_BASE" type="address" align="16" usage="rp_blit"/>
-	<reg64 offset="0xa9e2" name="SP_CS_SAMPLER_BASE" type="address" align="16" usage="cmd"/>
-	<reg64 offset="0xa9e4" name="SP_PS_TEXMEMOBJ_BASE" type="address" align="64" usage="rp_blit"/>
-	<reg64 offset="0xa9e6" name="SP_CS_TEXMEMOBJ_BASE" type="address" align="64" usage="cmd"/>
+	<reg64 offset="0xa9e0" name="SP_PS_SAMPLER_BASE" type="address" align="16" usage="draw"/>
+	<reg64 offset="0xa9e2" name="SP_CS_SAMPLER_BASE" type="address" align="16" usage="compute"/>
+	<reg64 offset="0xa9e4" name="SP_PS_TEXMEMOBJ_BASE" type="address" align="64" usage="draw"/>
+	<reg64 offset="0xa9e6" name="SP_CS_TEXMEMOBJ_BASE" type="address" align="64" usage="compute"/>
 
 	<enum name="a6xx_bindless_descriptor_size">
 		<doc>
@@ -4118,13 +4182,13 @@ by a particular renderpass/blit.
 		<value value="3" name="BINDLESS_DESCRIPTOR_64B"/>
 	</enum>
 
-	<array offset="0xa9e8" name="SP_CS_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="cmd">
+	<array offset="0xa9e8" name="SP_CS_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="compute">
 		<reg64 offset="0" name="DESCRIPTOR" variants="A6XX">
 			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
 			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
 		</reg64>
 	</array>
-	<array offset="0xa9e8" name="SP_CS_BINDLESS_BASE" stride="2" length="8" variants="A7XX-" usage="cmd">
+	<array offset="0xa9e8" name="SP_CS_BINDLESS_BASE" stride="2" length="8" variants="A7XX-" usage="compute">
 		<reg64 offset="0" name="DESCRIPTOR" variants="A7XX-">
 			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
 			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
@@ -4134,9 +4198,9 @@ by a particular renderpass/blit.
 	<!--
 	UAV state for compute shader:
 	 -->
-	<reg64 offset="0xa9f2" name="SP_CS_UAV_BASE" type="address" align="16" variants="A6XX"/>
-	<reg64 offset="0xa9f8" name="SP_CS_UAV_BASE" type="address" align="16" variants="A7XX-"/>
-	<reg32 offset="0xaa00" name="SP_CS_USIZE" low="0" high="6" type="uint"/>
+	<reg64 offset="0xa9f2" name="SP_CS_UAV_BASE" type="address" align="16" variants="A6XX" usage="compute"/>
+	<reg64 offset="0xa9f8" name="SP_CS_UAV_BASE" type="address" align="16" variants="A7XX-" usage="compute"/>
+	<reg32 offset="0xaa00" name="SP_CS_USIZE" low="0" high="6" type="uint" usage="compute"/>
 
 	<!-- Correlated with avgs/uvgs usage in FS -->
 	<reg32 offset="0xaa01" name="SP_PS_VGS_CNTL" type="uint" variants="A7XX-" usage="cmd"/>
@@ -4192,7 +4256,7 @@ by a particular renderpass/blit.
 		<value value="0x2" name="ISAMMODE_GL"/>
 	</enum>
 
-	<reg32 offset="0xab00" name="SP_MODE_CNTL" usage="rp_blit">
+	<reg32 offset="0xab00" name="SP_MODE_CNTL" usage="draw">
 	  <!--
 	  When set, half register loads from the constant file will
 	  load a 32-bit value (so hc0.y loads the same value as c0.y)
@@ -4203,26 +4267,26 @@ by a particular renderpass/blit.
 	  -->
 		<bitfield name="CONSTANT_DEMOTION_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="ISAMMODE" low="1" high="2" type="a6xx_isam_mode"/>
-		<bitfield name="SHARED_CONSTS_ENABLE" pos="3" type="boolean"/> <!-- see SP_SHARED_CONSTANT -->
+		<bitfield name="SHARED_CONSTS_ENABLE" pos="3" type="boolean"/> <!-- see HLSQ_SHARED_CONSTS -->
 	</reg32>
 
 	<reg32 offset="0xab01" name="SP_UNKNOWN_AB01" variants="A7XX-" usage="cmd"/>
 	<reg32 offset="0xab02" name="SP_HLSQ_MODE_CNTL" variants="A7XX-" usage="cmd">
-		<bitfield name="SHARED_CONSTS_ENABLE" pos="0" type="boolean"/> <!-- see SP_SHARED_CONSTANT -->
+		<bitfield name="SHARED_CONSTS_ENABLE" pos="0" type="boolean"/> <!-- see HLSQ_SHARED_CONSTS -->
 	</reg32>
 
-	<reg32 offset="0xab04" name="SP_PS_CONFIG" type="a6xx_sp_xs_config" usage="rp_blit"/>
-	<reg32 offset="0xab05" name="SP_PS_INSTR_SIZE" low="0" high="27" type="uint" usage="rp_blit"/>
+	<reg32 offset="0xab04" name="SP_PS_CONFIG" type="a6xx_sp_xs_config" usage="draw"/>
+	<reg32 offset="0xab05" name="SP_PS_INSTR_SIZE" low="0" high="27" type="uint" usage="draw"/>
 
-	<reg32 offset="0xab06" name="SP_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0xab06" name="SP_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="cmd"/>
 
-	<array offset="0xab10" name="SP_GFX_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="rp_blit">
+	<array offset="0xab10" name="SP_GFX_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="draw">
 		<reg64 offset="0" name="DESCRIPTOR" variants="A6XX">
 			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
 			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
 		</reg64>
 	</array>
-	<array offset="0xab0a" name="SP_GFX_BINDLESS_BASE" stride="2" length="8" variants="A7XX-" usage="rp_blit">
+	<array offset="0xab0a" name="SP_GFX_BINDLESS_BASE" stride="2" length="8" variants="A7XX-" usage="draw">
 		<reg64 offset="0" name="DESCRIPTOR" variants="A7XX-">
 			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
 			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
@@ -4259,8 +4323,8 @@ by a particular renderpass/blit.
 		<bitfield name="MASK" low="12" high="15"/>
 	</bitset>
 
-	<reg32 offset="0xacc0" name="SP_A2D_OUTPUT_INFO" type="a6xx_sp_a2d_output_info" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xa9bf" name="SP_A2D_OUTPUT_INFO" type="a6xx_sp_a2d_output_info" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xacc0" name="SP_A2D_OUTPUT_INFO" type="a6xx_sp_a2d_output_info" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xa9bf" name="SP_A2D_OUTPUT_INFO" type="a6xx_sp_a2d_output_info" variants="A7XX-" usage="blit"/>
 
 	<reg32 offset="0xae00" name="SP_DBG_ECO_CNTL" usage="init"/>
 	<reg32 offset="0xae01" name="SP_ADDR_MODE_CNTL" pos="0" type="a5xx_address_mode" variants="A6XX"/>
@@ -4268,7 +4332,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0xae02" name="SP_NC_MODE_CNTL">
 		<!-- TODO: valid bits 0x3c3f, see kernel -->
 	</reg32>
-	<reg32 offset="0xae03" name="SP_CHICKEN_BITS" usage="init"/>
+	<reg32 offset="0xae03" name="SP_CHICKEN_BITS" usage="init">
+		<doc>
+			When this bit is enabled, new waves may be unlocked once
+			all invocations have signaled they don't need local
+			memory anymore using (eolm)nop.
+		</doc>
+		<bitfield name="EOLM_ENABLE" pos="1" type="boolean"/>
+	</reg32>
 	<reg32 offset="0xae04" name="SP_NC_MODE_CNTL_2" usage="init">
 		<bitfield name="F16_NO_INF" pos="3" type="boolean"/>
 	</reg32>
@@ -4333,7 +4404,7 @@ by a particular renderpass/blit.
 	<reg64 offset="0xae3c" name="SP_SW_DEBUG_ADDR" variants="A7XX-"/>
 	<reg64 offset="0xae3e" name="SP_ISDB_DEBUG_ADDR" variants="A7XX-"/>
 
-	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2_0" stride="1" length="6" variants="A7XX-"/>
+	<array offset="0xaec0" name="SP_PERFCTR_HLSQ_SEL_2" stride="1" length="6" variants="A7XX-"/>
 
 	<!--
 	The downstream kernel calls the debug cluster of registers
@@ -4347,39 +4418,39 @@ by a particular renderpass/blit.
 	<reg32 offset="0xb190" name="SP_UNKNOWN_B190"/>
 	<reg32 offset="0xb191" name="SP_UNKNOWN_B191"/>
 
-	<reg32 offset="0xb2d6" name="TPL1_A2D_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
-	<reg32 offset="0xb2d7" name="TPL1_A2D_FILTER_CNTL" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2d6" name="TPL1_A2D_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="cmd"/>
+	<reg32 offset="0xb2d7" name="TPL1_A2D_FILTER_CNTL" variants="A8XX-" usage="blit"/>
 
-	<reg32 offset="0xb300" name="TPL1_RAS_MSAA_CNTL" usage="rp_blit">
+	<reg32 offset="0xb300" name="TPL1_RAS_MSAA_CNTL" usage="draw">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="UNK2" low="2" high="3"/>
 	</reg32>
-	<reg32 offset="0xb301" name="TPL1_DEST_MSAA_CNTL" usage="rp_blit">
+	<reg32 offset="0xb301" name="TPL1_DEST_MSAA_CNTL" usage="draw">
 		<bitfield name="SAMPLES" low="0" high="1" type="a3xx_msaa_samples"/>
 		<bitfield name="MSAA_DISABLE" pos="2" type="boolean"/>
 	</reg32>
 
 	<!-- looks to work in the same way as a5xx: -->
 	<reg64 offset="0xb302" name="TPL1_GFX_BORDER_COLOR_BASE" type="address" align="128" usage="cmd"/>
-	<reg32 offset="0xb304" name="TPL1_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A6XX-A7XX" usage="rp_blit"/>
-	<reg32 offset="0xb305" name="TPL1_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" usage="rp_blit" variants="A6XX-A7XX" />
-	<reg32 offset="0xb306" name="TPL1_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="rp_blit" variants="A6XX-A7XX" />
-	<reg32 offset="0xb307" name="TPL1_WINDOW_OFFSET" type="a6xx_reg_xy" usage="rp_blit"/>
+	<reg32 offset="0xb304" name="TPL1_MSAA_SAMPLE_POS_CNTL" type="a6xx_msaa_sample_pos_cntl" variants="A6XX-A7XX" usage="draw"/>
+	<reg32 offset="0xb305" name="TPL1_PROGRAMMABLE_MSAA_POS_0" type="a6xx_programmable_msaa_pos" usage="draw" variants="A6XX-A7XX" />
+	<reg32 offset="0xb306" name="TPL1_PROGRAMMABLE_MSAA_POS_1" type="a6xx_programmable_msaa_pos" usage="draw" variants="A6XX-A7XX" />
+	<reg32 offset="0xb307" name="TPL1_WINDOW_OFFSET" type="a6xx_reg_xy" usage="cmd"/>
 
-	<reg32 offset="0xb304" name="TPL1_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0xb304" name="TPL1_BIN_SIZE" type="a8xx_bin_size" variants="A8XX-" usage="cmd"/>
 
 	<enum name="a6xx_coord_round">
 		<value value="0" name="COORD_TRUNCATE"/>
 		<value value="1" name="COORD_ROUND_NEAREST_EVEN"/>
+		<value value="2" name="ROUND_FLOAT_TO_INT"/> <!-- only ARRAYCOORDROUNDMODE -->
 	</enum>
 
 	<enum name="a6xx_nearest_mode">
 		<value value="0" name="ROUND_CLAMP_TRUNCATE"/>
 		<value value="1" name="CLAMP_ROUND_TRUNCATE"/>
-		<value value="2" name="ROUND_FLOAT_TO_INT"/> <!-- only ARRAYCOORDROUNDMODE -->
 	</enum>
 
-	<reg32 offset="0xb309" name="TPL1_MODE_CNTL" usage="cmd">
+	<bitset name="a6xx_tpl1_mode_cntl" inline="yes">
 		<bitfield name="ISAMMODE" low="0" high="1" type="a6xx_isam_mode"/>
 		<bitfield name="TEXCOORDROUNDMODE" pos="2" type="a6xx_coord_round"/>
 		<bitfield name="ARRAYCOORDROUNDMODE" low="3" high="4" type="a6xx_coord_round"/>
@@ -4387,6 +4458,11 @@ by a particular renderpass/blit.
 		<bitfield name="SAMPLEREPLICATE" pos="6" type="boolean"/>
 		<bitfield name="DESTDATATYPEOVERRIDE" pos="7" type="boolean"/>
 		<bitfield name="PACK_SAMP_REDUCED_PRECISION" pos="8" type="boolean"/>
+	</bitset>
+
+	<reg32 offset="0xb309" name="TPL1_MODE_CNTL" usage="cmd" type="a6xx_tpl1_mode_cntl" variants="A6XX-A7XX"/>
+	<reg32 offset="0xb309" name="TPL1_MODE_CNTL" usage="cmd" type="a6xx_tpl1_mode_cntl" variants="A8XX-">
+		<bitfield name="CLAMP_DISABLE" pos="12" type="boolean"/>
 	</reg32>
 	<reg32 offset="0xb310" name="SP_UNKNOWN_B310" variants="A7XX-" usage="cmd"/>
 
@@ -4395,24 +4471,26 @@ by a particular renderpass/blit.
 	badly named or the functionality moved in a6xx.  But downstream kernel
 	calls this "a6xx_sp_ps_tp_2d_cluster"
 	 -->
-	<reg32 offset="0xb4c0" name="TPL1_A2D_SRC_TEXTURE_INFO" type="a6xx_a2d_src_texture_info" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb4c1" name="TPL1_A2D_SRC_TEXTURE_SIZE" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb4c0" name="TPL1_A2D_SRC_TEXTURE_INFO" type="a6xx_a2d_src_texture_info" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4c1" name="TPL1_A2D_SRC_TEXTURE_SIZE" variants="A6XX" usage="blit">
 		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
 		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
 	</reg32>
-	<reg64 offset="0xb4c2" name="TPL1_A2D_SRC_TEXTURE_BASE" type="address" align="16" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb4c4" name="TPL1_A2D_SRC_TEXTURE_PITCH" variants="A6XX" usage="rp_blit">
+	<reg64 offset="0xb4c2" name="TPL1_A2D_SRC_TEXTURE_BASE" type="address" align="16" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4c4" name="TPL1_A2D_SRC_TEXTURE_PITCH" variants="A6XX" usage="blit">
 		<bitfield name="UNK0" low="0" high="8"/>
 		<bitfield name="PITCH" low="9" high="23" shr="6" type="uint"/>
 	</reg32>
 
-	<reg32 offset="0xb2c0" name="TPL1_A2D_SRC_TEXTURE_INFO" type="a6xx_a2d_src_texture_info" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xb2c1" name="TPL1_A2D_SRC_TEXTURE_SIZE" variants="A7XX-">
+	<reg32 offset="0xb2c0" name="TPL1_A2D_SRC_TEXTURE_INFO" type="a6xx_a2d_src_texture_info" variants="A7XX-" usage="blit"/>
+	<reg32 offset="0xb2c1" name="TPL1_A2D_SRC_TEXTURE_SIZE" variants="A7XX-" usage="blit">
 		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
 		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
 	</reg32>
-	<reg64 offset="0xb2c2" name="TPL1_A2D_SRC_TEXTURE_BASE" type="address" align="16" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xb2c4" name="TPL1_A2D_SRC_TEXTURE_PITCH" variants="A7XX-">
+	<reg64 offset="0xb2c2" name="TPL1_A2D_SRC_TEXTURE_BASE" type="address" align="16" variants="A7XX" usage="blit"/>
+	<!-- gen8 can use an unaligned base for IMG_BUFFER: -->
+	<reg64 offset="0xb2c2" name="TPL1_A2D_SRC_TEXTURE_BASE" type="address" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0xb2c4" name="TPL1_A2D_SRC_TEXTURE_PITCH" variants="A7XX-" usage="blit">
 		<!--
 		Bits from 3..9 must be zero unless 'TPL1_A2D_BLT_CNTL::TYPE'
 		is A6XX_TEX_IMG_BUFFER, which allows for lower alignment.
@@ -4421,41 +4499,45 @@ by a particular renderpass/blit.
 	</reg32>
 
 	<!-- planes for NV12, etc. (TODO: not tested) -->
-	<reg64 offset="0xb4c5" name="TPL1_A2D_SRC_TEXTURE_BASE_1" type="address" align="16" variants="A6XX"/>
-	<reg32 offset="0xb4c7" name="TPL1_A2D_SRC_TEXTURE_PITCH_1" low="0" high="11" shr="6" type="uint" variants="A6XX"/>
-	<reg64 offset="0xb4c8" name="TPL1_A2D_SRC_TEXTURE_BASE_2" type="address" align="16" variants="A6XX"/>
-
-	<reg64 offset="0xb2c5" name="TPL1_A2D_SRC_TEXTURE_BASE_1" type="address" align="16" variants="A7XX-"/>
-	<reg32 offset="0xb2c7" name="TPL1_A2D_SRC_TEXTURE_PITCH_1" low="0" high="11" shr="6" type="uint" variants="A7XX-"/>
-	<reg64 offset="0xb2c8" name="TPL1_A2D_SRC_TEXTURE_BASE_2" type="address" align="16" variants="A7XX-"/>
-
-	<reg64 offset="0xb4ca" name="TPL1_A2D_SRC_TEXTURE_FLAG_BASE" type="address" align="16" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb4cc" name="TPL1_A2D_SRC_TEXTURE_FLAG_PITCH" low="0" high="7" shr="6" type="uint" variants="A6XX" usage="rp_blit"/>
-
-	<reg64 offset="0xb2ca" name="TPL1_A2D_SRC_TEXTURE_FLAG_BASE" type="address" align="16" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xb2cc" name="TPL1_A2D_SRC_TEXTURE_FLAG_PITCH" low="0" high="7" shr="6" type="uint" variants="A7XX-" usage="rp_blit"/>
-
-	<reg32 offset="0xb4cd" name="SP_PS_UNKNOWN_B4CD" low="6" high="31" variants="A6XX"/>
-	<reg32 offset="0xb4ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A6XX"/>
-	<reg32 offset="0xb4cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A6XX"/>
-	<reg32 offset="0xb4d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb4d1" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A6XX" usage="rp_blit"/>
-
-	<reg32 offset="0xb2cd" name="SP_PS_UNKNOWN_B4CD" low="6" high="31" variants="A7XX"/>
-	<reg32 offset="0xb2ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A7XX"/>
-	<reg32 offset="0xb2cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A7XX"/>
-	<reg32 offset="0xb2d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A7XX"/>
-	<reg32 offset="0xb2d1" name="TPL1_A2D_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX-"/>
-	<reg32 offset="0xb2d2" name="TPL1_A2D_BLT_CNTL" variants="A7XX-" usage="rp_blit">
+	<reg64 offset="0xb4c5" name="TPL1_A2D_SRC_TEXTURE_BASE_1" type="address" align="16" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4c7" name="TPL1_A2D_SRC_TEXTURE_PITCH_1" low="0" high="11" shr="6" type="uint" variants="A6XX" usage="blit"/>
+	<reg64 offset="0xb4c8" name="TPL1_A2D_SRC_TEXTURE_BASE_2" type="address" align="16" variants="A6XX" usage="blit"/>
+
+	<reg64 offset="0xb2c5" name="TPL1_A2D_SRC_TEXTURE_BASE_1" type="address" align="16" variants="A7XX-" usage="blit"/>
+	<reg32 offset="0xb2c7" name="TPL1_A2D_SRC_TEXTURE_PITCH_1" low="0" high="11" shr="6" type="uint" variants="A7XX-" usage="blit"/>
+	<reg64 offset="0xb2c8" name="TPL1_A2D_SRC_TEXTURE_BASE_2" type="address" align="16" variants="A7XX-" usage="blit"/>
+
+	<reg64 offset="0xb4ca" name="TPL1_A2D_SRC_TEXTURE_FLAG_BASE" type="address" align="16" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4cc" name="TPL1_A2D_SRC_TEXTURE_FLAG_PITCH" low="0" high="7" shr="6" type="uint" variants="A6XX" usage="blit"/>
+
+	<reg64 offset="0xb2ca" name="TPL1_A2D_SRC_TEXTURE_FLAG_BASE" type="address" align="16" variants="A7XX-" usage="blit"/>
+	<reg32 offset="0xb2cc" name="TPL1_A2D_SRC_TEXTURE_FLAG_PITCH" low="0" high="7" shr="6" type="uint" variants="A7XX-" usage="blit"/>
+
+	<reg32 offset="0xb4cd" name="SP_PS_UNKNOWN_B4CD" low="6" high="31" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A6XX" usage="blit"/>
+	<reg32 offset="0xb4d1" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A6XX" usage="cmd"/>
+
+	<reg32 offset="0xb2cd" name="SP_PS_UNKNOWN_B4CD" low="6" high="31" variants="A7XX" usage="blit"/>
+	<reg32 offset="0xb2ce" name="SP_PS_UNKNOWN_B4CE" low="0" high="31" variants="A7XX" usage="blit"/>
+	<reg32 offset="0xb2cf" name="SP_PS_UNKNOWN_B4CF" low="0" high="30" variants="A7XX" usage="blit"/>
+	<reg32 offset="0xb2d0" name="SP_PS_UNKNOWN_B4D0" low="0" high="29" variants="A7XX" usage="blit"/>
+	<reg32 offset="0xb2d1" name="TPL1_A2D_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX-" usage="cmd"/>
+	<bitset name="a7xx_tpl1_a2d_blt_cntl" inline="yes">
 		<bitfield name="RAW_COPY" pos="0" type="boolean"/>
-		<bitfield name="START_OFFSET_TEXELS" low="16" high="21"/>
 		<bitfield name="TYPE" low="29" high="31" type="a6xx_tex_type"/>
+	</bitset>
+	<reg32 offset="0xb2d2" name="TPL1_A2D_BLT_CNTL" type="a7xx_tpl1_a2d_blt_cntl" variants="A7XX" usage="blit">
+		<bitfield name="START_OFFSET_TEXELS" low="16" high="21"/>
 	</reg32>
-	<reg32 offset="0xab21" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0xab07" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A8XX-" usage="rp_blit"/>
+	<reg32 offset="0xb2d2" name="TPL1_A2D_BLT_CNTL" type="a7xx_tpl1_a2d_blt_cntl" variants="A8XX-" usage="blit"/>
+	<reg32 offset="0xab21" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A7XX" usage="cmd"/>
+	<reg32 offset="0xab07" name="SP_WINDOW_OFFSET" type="a6xx_reg_xy" variants="A8XX-" usage="cmd"/>
 
-	<!-- always 0x100000 or 0x1000000? -->
-	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="init"/>
+	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" usage="init">
+		<bitfield name="LINEAR_MIPMAP_FALLBACK_IN_BLOCKS" pos="25" type="boolean" variants="A6XX-A7XX"/>
+	</reg32>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode" variants="A6XX"/>
 	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="init">
 		<!-- Affects UBWC in some way, if BLIT_OP_SCALE is done with this bit set
@@ -4496,17 +4578,17 @@ by a particular renderpass/blit.
 		<bitfield name="READ_IMM_SHARED_CONSTS" pos="9" type="boolean" variants="A7XX-"/>
 	</bitset>
 
-	<reg32 offset="0xb800" name="SP_VS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb801" name="SP_HS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb802" name="SP_DS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb803" name="SP_GS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb800" name="SP_VS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb801" name="SP_HS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb802" name="SP_DS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb803" name="SP_GS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="draw"/>
 
-	<reg32 offset="0xa827" name="SP_VS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa83f" name="SP_HS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa867" name="SP_DS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa898" name="SP_GS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa827" name="SP_VS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="draw"/>
+	<reg32 offset="0xa83f" name="SP_HS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="draw"/>
+	<reg32 offset="0xa867" name="SP_DS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="draw"/>
+	<reg32 offset="0xa898" name="SP_GS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="draw"/>
 
-	<reg32 offset="0xa9aa" name="SP_RENDER_CNTL" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9aa" name="SP_RENDER_CNTL" variants="A7XX-" usage="draw">
 		<bitfield name="FS_DISABLE" pos="0" type="boolean"/>
 	</reg32>
 
@@ -4521,16 +4603,18 @@ by a particular renderpass/blit.
 		<bitfield name="DITHER_MODE_MRT7" low="14" high="15" type="adreno_rb_dither_mode"/>
 	</reg32>
 
-	<reg32 offset="0xa9ad" name="SP_VRS_CONFIG" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9ad" name="SP_VRS_CONFIG" variants="A7XX-" usage="draw">
 		<bitfield name="PIPELINE_FSR_ENABLE" pos="0" type="boolean"/>
 		<bitfield name="ATTACHMENT_FSR_ENABLE" pos="1" type="boolean"/>
 		<bitfield name="PRIMITIVE_FSR_ENABLE" pos="3" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0xa9ae" name="SP_PS_CNTL_1" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9ae" name="SP_PS_CNTL_1" variants="A7XX-" usage="draw">
 		<bitfield name="SYSVAL_REGS_COUNT" low="0" high="7" type="uint"/>
 		<bitfield name="DEFER_WAVE_ALLOC_DIS" pos="8" type="boolean"/>
 		<bitfield name="EVICT_BUF_MODE" low="9" high="10"/>
+		<bitfield name="WAVE_PAIR_MODE" low="11" high="12"/>
+		<bitfield name="NUM_TOTAL_VAR" low="13" high="20"/>
 	</reg32>
 
 	<reg32 offset="0xb820" name="HLSQ_LOAD_STATE_GEOM_CMD"/>
@@ -4562,71 +4646,71 @@ by a particular renderpass/blit.
 		<bitfield name="FOVEATIONQUALITYREGID" low="8" high="15" type="a3xx_regid"/>
 	</bitset>
 
-	<reg32 offset="0xb980" type="a6xx_sp_ps_wave_cntl" name="SP_PS_WAVE_CNTL" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb981" name="HLSQ_UNKNOWN_B981" pos="0" type="boolean" variants="A6XX"/> <!-- never used by blob -->
-	<reg32 offset="0xb982" name="SP_LB_PARAM_LIMIT" low="0" high="2" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb980" type="a6xx_sp_ps_wave_cntl" name="SP_PS_WAVE_CNTL" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb981" name="HLSQ_UNKNOWN_B981" pos="0" type="boolean" variants="A6XX" usage="draw"/> <!-- never used by blob -->
+	<reg32 offset="0xb982" name="SP_LB_PARAM_LIMIT" low="0" high="2" variants="A6XX" usage="draw">
 		<!-- Sets the maximum number of primitives allowed in one FS wave minus one, similarly to the
 				 A3xx field, except that it's not necessary to set it to anything but the maximum, since
 				 the hardware will simply emit smaller waves when it runs out of space.	-->
 		<bitfield name="PRIMALLOCTHRESHOLD" low="0" high="2" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb983" name="SP_REG_PROG_ID_0" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb983" name="SP_REG_PROG_ID_0" variants="A6XX" usage="draw">
 		<bitfield name="FACEREGID" low="0" high="7" type="a3xx_regid"/>
 		<!-- SAMPLEID is loaded into a half-precision register: -->
 		<bitfield name="SAMPLEID" low="8" high="15" type="a3xx_regid"/>
 		<bitfield name="SAMPLEMASK" low="16" high="23" type="a3xx_regid"/>
 		<bitfield name="CENTERRHW" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xb984" type="a6xx_sp_reg_prog_id_1" name="SP_REG_PROG_ID_1" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb985" type="a6xx_sp_reg_prog_id_2" name="SP_REG_PROG_ID_2" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb986" type="a6xx_sp_reg_prog_id_3" name="SP_REG_PROG_ID_3" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb987" name="SP_CS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="cmd"/>
-	<reg32 offset="0xa9c6" type="a6xx_sp_ps_wave_cntl" name="SP_PS_WAVE_CNTL" variants="A7XX" usage="rp_blit"/>
-	<reg32 offset="0xa9c6" name="SP_PS_WAVE_CNTL" variants="A8XX-" usage="rp_blit">
+	<reg32 offset="0xb984" type="a6xx_sp_reg_prog_id_1" name="SP_REG_PROG_ID_1" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb985" type="a6xx_sp_reg_prog_id_2" name="SP_REG_PROG_ID_2" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb986" type="a6xx_sp_reg_prog_id_3" name="SP_REG_PROG_ID_3" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xb987" name="SP_CS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="compute"/>
+	<reg32 offset="0xa9c6" type="a6xx_sp_ps_wave_cntl" name="SP_PS_WAVE_CNTL" variants="A7XX" usage="draw"/>
+	<reg32 offset="0xa9c6" name="SP_PS_WAVE_CNTL" variants="A8XX-" usage="draw">
 		<bitfield name="VARYINGS" pos="1" type="boolean"/>
 	</reg32>
-	<reg32 offset="0xa9c7" name="SP_LB_PARAM_LIMIT" low="0" high="2" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9c7" name="SP_LB_PARAM_LIMIT" low="0" high="2" variants="A7XX-" usage="draw">
 		<bitfield name="PRIMALLOCTHRESHOLD" low="0" high="2" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9c8" name="SP_REG_PROG_ID_0" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9c8" name="SP_REG_PROG_ID_0" variants="A7XX-" usage="draw">
 		<bitfield name="FACEREGID" low="0" high="7" type="a3xx_regid"/>
 		<!-- SAMPLEID is loaded into a half-precision register: -->
 		<bitfield name="SAMPLEID" low="8" high="15" type="a3xx_regid"/>
 		<bitfield name="SAMPLEMASK" low="16" high="23" type="a3xx_regid"/>
 		<bitfield name="CENTERRHW" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xa9c9" type="a6xx_sp_reg_prog_id_1" name="SP_REG_PROG_ID_1" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa9ca" type="a6xx_sp_reg_prog_id_2" name="SP_REG_PROG_ID_2" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa9cb" type="a6xx_sp_reg_prog_id_3" name="SP_REG_PROG_ID_3" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa9cd" name="SP_CS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="cmd"/>
+	<reg32 offset="0xa9c9" type="a6xx_sp_reg_prog_id_1" name="SP_REG_PROG_ID_1" variants="A7XX-" usage="draw"/>
+	<reg32 offset="0xa9ca" type="a6xx_sp_reg_prog_id_2" name="SP_REG_PROG_ID_2" variants="A7XX-" usage="draw"/>
+	<reg32 offset="0xa9cb" type="a6xx_sp_reg_prog_id_3" name="SP_REG_PROG_ID_3" variants="A7XX-" usage="draw"/>
+	<reg32 offset="0xa9cd" name="SP_CS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="compute"/>
 
 	<!-- TODO: what does KERNELDIM do exactly (blob sets it differently from turnip) -->
-	<reg32 offset="0xb990" name="SP_CS_NDRANGE_0" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb990" name="SP_CS_NDRANGE_0" variants="A6XX" usage="compute">
 		<bitfield name="KERNELDIM" low="0" high="1" type="uint"/>
 		<!-- localsize is value minus one: -->
 		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
 		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
 		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb991" name="SP_CS_NDRANGE_1" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb991" name="SP_CS_NDRANGE_1" variants="A6XX" usage="compute">
 		<bitfield name="GLOBALSIZE_X" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb992" name="SP_CS_NDRANGE_2" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb992" name="SP_CS_NDRANGE_2" variants="A6XX" usage="compute">
 		<bitfield name="GLOBALOFF_X" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb993" name="SP_CS_NDRANGE_3" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb993" name="SP_CS_NDRANGE_3" variants="A6XX" usage="compute">
 		<bitfield name="GLOBALSIZE_Y" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb994" name="SP_CS_NDRANGE_4" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb994" name="SP_CS_NDRANGE_4" variants="A6XX" usage="compute">
 		<bitfield name="GLOBALOFF_Y" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb995" name="SP_CS_NDRANGE_5" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb995" name="SP_CS_NDRANGE_5" variants="A6XX" usage="compute">
 		<bitfield name="GLOBALSIZE_Z" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb996" name="SP_CS_NDRANGE_6" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb996" name="SP_CS_NDRANGE_6" variants="A6XX" usage="compute">
 		<bitfield name="GLOBALOFF_Z" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xb997" name="SP_CS_CONST_CONFIG_0" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb997" name="SP_CS_CONST_CONFIG_0" variants="A6XX" usage="compute">
 		<!-- these are all vec3. first 3 need to be high regs
 		     WGSIZECONSTID is the local size (from SP_CS_NDRANGE_0)
 		     WGOFFSETCONSTID is WGIDCONSTID*WGSIZECONSTID
@@ -4636,7 +4720,7 @@ by a particular renderpass/blit.
 		<bitfield name="WGOFFSETCONSTID" low="16" high="23" type="a3xx_regid"/>
 		<bitfield name="LOCALIDREGID" low="24" high="31" type="a3xx_regid"/>
 	</reg32>
-	<reg32 offset="0xb998" name="SP_CS_WGE_CNTL" variants="A6XX" usage="rp_blit">
+	<reg32 offset="0xb998" name="SP_CS_WGE_CNTL" variants="A6XX" usage="compute">
 		<!-- gl_LocalInvocationIndex -->
 		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
 		<!-- a650 has 6 "SP cores" (but 3 "SP"). this makes it use only
@@ -4648,40 +4732,40 @@ by a particular renderpass/blit.
 		<bitfield name="THREADSIZE_SCALAR" pos="10" type="boolean"/>
 	</reg32>
 	<!--note: vulkan blob doesn't use these -->
-	<reg32 offset="0xb999" name="SP_CS_KERNEL_GROUP_X" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb99a" name="SP_CS_KERNEL_GROUP_Y" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xb99b" name="SP_CS_KERNEL_GROUP_Z" variants="A6XX" usage="rp_blit"/>
+	<reg32 offset="0xb999" name="SP_CS_KERNEL_GROUP_X" variants="A6XX" usage="compute"/>
+	<reg32 offset="0xb99a" name="SP_CS_KERNEL_GROUP_Y" variants="A6XX" usage="compute"/>
+	<reg32 offset="0xb99b" name="SP_CS_KERNEL_GROUP_Z" variants="A6XX" usage="compute"/>
 
 	<!-- TODO: what does KERNELDIM do exactly (blob sets it differently from turnip) -->
-	<reg32 offset="0xa9d4" name="SP_CS_NDRANGE_0" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9d4" name="SP_CS_NDRANGE_0" variants="A7XX-" usage="compute">
 		<bitfield name="KERNELDIM" low="0" high="1" type="uint"/>
 		<!-- localsize is value minus one: -->
 		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
 		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
 		<bitfield name="LOCALSIZEZ" low="22" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9d5" name="SP_CS_NDRANGE_1" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9d5" name="SP_CS_NDRANGE_1" variants="A7XX-" usage="compute">
 		<bitfield name="GLOBALSIZE_X" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9d6" name="SP_CS_NDRANGE_2" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9d6" name="SP_CS_NDRANGE_2" variants="A7XX-" usage="compute">
 		<bitfield name="GLOBALOFF_X" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9d7" name="SP_CS_NDRANGE_3" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9d7" name="SP_CS_NDRANGE_3" variants="A7XX-" usage="compute">
 		<bitfield name="GLOBALSIZE_Y" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9d8" name="SP_CS_NDRANGE_4" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9d8" name="SP_CS_NDRANGE_4" variants="A7XX-" usage="compute">
 		<bitfield name="GLOBALOFF_Y" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9d9" name="SP_CS_NDRANGE_5" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9d9" name="SP_CS_NDRANGE_5" variants="A7XX-" usage="compute">
 		<bitfield name="GLOBALSIZE_Z" low="0" high="31" type="uint"/>
 	</reg32>
-	<reg32 offset="0xa9da" name="SP_CS_NDRANGE_6" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9da" name="SP_CS_NDRANGE_6" variants="A7XX-" usage="compute">
 		<bitfield name="GLOBALOFF_Z" low="0" high="31" type="uint"/>
 	</reg32>
 	<!--note: vulkan blob doesn't use these -->
-	<reg32 offset="0xa9dc" name="SP_CS_KERNEL_GROUP_X" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa9dd" name="SP_CS_KERNEL_GROUP_Y" variants="A7XX-" usage="rp_blit"/>
-	<reg32 offset="0xa9de" name="SP_CS_KERNEL_GROUP_Z" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xa9dc" name="SP_CS_KERNEL_GROUP_X" variants="A7XX-" usage="compute"/>
+	<reg32 offset="0xa9dd" name="SP_CS_KERNEL_GROUP_Y" variants="A7XX-" usage="compute"/>
+	<reg32 offset="0xa9de" name="SP_CS_KERNEL_GROUP_Z" variants="A7XX-" usage="compute"/>
 
 	<enum name="a7xx_cs_yalign">
 		<value name="CS_YALIGN_1" value="8"/>
@@ -4690,7 +4774,7 @@ by a particular renderpass/blit.
 		<value name="CS_YALIGN_8" value="1"/>
 	</enum>
 
-	<reg32 offset="0xa9db" name="SP_CS_WGE_CNTL" variants="A7XX-" usage="rp_blit">
+	<reg32 offset="0xa9db" name="SP_CS_WGE_CNTL" variants="A7XX-" usage="compute">
 		<!-- gl_LocalInvocationIndex -->
 		<bitfield name="LINEARLOCALIDREGID" low="0" high="7" type="a3xx_regid"/>
 		<!-- Must match SP_CS_CTRL -->
@@ -4711,7 +4795,7 @@ by a particular renderpass/blit.
 		<bitfield name="WGTILEHEIGHT" low="26" high="31"/>
 	</reg32>
 
-	<reg32 offset="0xa9df" name="SP_CS_NDRANGE_7" variants="A7XX-" usage="cmd">
+	<reg32 offset="0xa9df" name="SP_CS_NDRANGE_7" variants="A7XX-" usage="compute">
 		<!-- The size of the last workgroup. localsize is value minus one: -->
 		<bitfield name="LOCALSIZEX" low="2" high="11" type="uint"/>
 		<bitfield name="LOCALSIZEY" low="12" high="21" type="uint"/>
@@ -4723,7 +4807,7 @@ by a particular renderpass/blit.
 	<reg32 offset="0xb9a3" name="HLSQ_LOAD_STATE_FRAG_DATA"/>
 
 	<!-- mirror of SP_CS_BINDLESS_BASE -->
-	<array offset="0xb9c0" name="HLSQ_CS_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="rp_blit">
+	<array offset="0xb9c0" name="HLSQ_CS_BINDLESS_BASE" stride="2" length="5" variants="A6XX" usage="compute">
 		<reg64 offset="0" name="DESCRIPTOR">
 			<bitfield name="DESC_SIZE" low="0" high="1" type="a6xx_bindless_descriptor_size"/>
 			<bitfield name="ADDR" low="2" high="63" shr="2" type="address"/>
@@ -4731,7 +4815,7 @@ by a particular renderpass/blit.
 	</array>
 
 	<!-- new in a6xx gen4, mirror of SP_CS_CNTL_1? -->
-	<reg32 offset="0xb9d0" name="HLSQ_CS_CTRL_REG1" variants="A6XX" usage="cmd">
+	<reg32 offset="0xb9d0" name="HLSQ_CS_CTRL_REG1" variants="A6XX" usage="compute">
 		<bitfield name="SHARED_SIZE" low="0" high="4" type="uint"/>
 		<bitfield name="CONSTANTRAMMODE" low="5" high="6" type="a6xx_const_ram_mode"/>
 	</reg32>
@@ -4750,7 +4834,7 @@ by a particular renderpass/blit.
 		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
 	</reg32>
 
-	<reg32 offset="0xbb08" name="SP_UPDATE_CNTL" variants="A6XX" usage="cmd">
+	<reg32 offset="0xbb08" name="SP_UPDATE_CNTL" variants="A6XX" usage="cmd,compute">
 		<doc>
 			This register clears pending loads queued up by
 			CP_LOAD_STATE6. Each bit resets a particular kind(s) of
@@ -4790,7 +4874,7 @@ by a particular renderpass/blit.
 		<bitfield name="EVENT" low="0" high="6" type="vgt_event_type"/>
 	</reg32>
 
-	<reg32 offset="0xab1f" name="SP_UPDATE_CNTL" variants="A7XX" usage="cmd">
+	<reg32 offset="0xab1f" name="SP_UPDATE_CNTL" variants="A7XX" usage="cmd,compute">
 		<doc>
 			This register clears pending loads queued up by
 			CP_LOAD_STATE6. Each bit resets a particular kind(s) of
@@ -4813,7 +4897,7 @@ by a particular renderpass/blit.
 		<bitfield name="GFX_BINDLESS" low="17" high="24" type="hex"/>
 	</reg32>
 
-	<reg32 offset="0xab1f" name="SP_UPDATE_CNTL" variants="A8XX" usage="cmd">
+	<reg32 offset="0xab1f" name="SP_UPDATE_CNTL" variants="A8XX" usage="cmd,compute">
 		<doc>
 			This register clears pending loads queued up by
 			CP_LOAD_STATE6. Each bit resets a particular kind(s) of
@@ -4829,16 +4913,16 @@ by a particular renderpass/blit.
 		<bitfield name="CS_STATE" pos="5" type="boolean"/>
 	</reg32>
 
-	<reg32 offset="0xa9c0" name="SP_CS_BINDLESS_INVALIDATE"/>
-	<reg32 offset="0xab08" name="SP_GFX_BINDLESS_INVALIDATE"/>
+	<reg32 offset="0xa9c0" name="SP_CS_BINDLESS_INVALIDATE" usage="compute"/>
+	<reg32 offset="0xab08" name="SP_GFX_BINDLESS_INVALIDATE" usage="draw"/>
 
-	<reg32 offset="0xbb10" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="rp_blit"/>
-	<reg32 offset="0xab03" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="rp_blit"/>
+	<reg32 offset="0xbb10" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A6XX" usage="draw"/>
+	<reg32 offset="0xab03" name="SP_PS_CONST_CONFIG" type="a6xx_xs_const_config" variants="A7XX-" usage="draw"/>
 
-	<array offset="0xab40" name="SP_SHARED_CONSTANT_GFX" stride="1" length="64" variants="A7XX"/>
-	<array offset="0xab30" name="SP_SHARED_CONSTANT_GFX" stride="1" length="128" variants="A8XX-"/>
+	<array offset="0xab40" name="SP_SHARED_CONSTANT_GFX" stride="1" length="64" variants="A7XX" usage="draw"/>
+	<array offset="0xab30" name="SP_SHARED_CONSTANT_GFX" stride="1" length="128" variants="A8XX-" usage="draw"/>
 
-	<reg32 offset="0xbb11" name="HLSQ_SHARED_CONSTS" variants="A6XX" usage="cmd">
+	<reg32 offset="0xbb11" name="HLSQ_SHARED_CONSTS" variants="A6XX" usage="cmd,compute">
 		<doc>
 			Shared constants are intended to be used for Vulkan push
 			constants. When enabled, 8 vec4's are reserved in the FS
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
index 56cfaff614a4..08bc37f29a6f 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_descriptors.xml
@@ -45,19 +45,21 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="3" name="3"/>
 </domain>
 
-<domain name="A6XX_TEX_CONST" width="32" varset="chip">
+<domain name="A6XX_TEX_MEMOBJ" width="32" varset="desctype">
 	<doc>Texture constant dwords</doc>
 	<reg32 offset="0" name="0">
 		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
 		<bitfield name="SRGB" pos="2" type="boolean"/>
-		<bitfield name="SWIZ_X" low="4" high="6" type="a6xx_tex_swiz"/>
-		<bitfield name="SWIZ_Y" low="7" high="9" type="a6xx_tex_swiz"/>
-		<bitfield name="SWIZ_Z" low="10" high="12" type="a6xx_tex_swiz"/>
-		<bitfield name="SWIZ_W" low="13" high="15" type="a6xx_tex_swiz"/>
-		<bitfield name="MIPLVLS" low="16" high="19" type="uint"/>
+		<bitfield name="SWIZ_X" low="4" high="6" type="a6xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="SWIZ_Y" low="7" high="9" type="a6xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="SWIZ_Z" low="10" high="12" type="a6xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="SWIZ_W" low="13" high="15" type="a6xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="MIPLVLS" low="16" high="19" type="uint" variants="DESC_SINGLE_PLANE DESC_BUFFER DESC_WEIGHT"/>
+
 		<!-- overlaps with MIPLVLS -->
-		<bitfield name="CHROMA_MIDPOINT_X" pos="16" type="boolean"/>
-		<bitfield name="CHROMA_MIDPOINT_Y" pos="18" type="boolean"/>
+		<bitfield name="CHROMA_MIDPOINT_X" pos="16" type="boolean" variants="DESC_MULTI_PLANE"/>
+		<bitfield name="CHROMA_MIDPOINT_Y" pos="18" type="boolean" variants="DESC_MULTI_PLANE"/>
+
 		<bitfield name="SAMPLES" low="20" high="21" type="a3xx_msaa_samples"/>
 		<bitfield name="FMT" low="22" high="29" type="a6xx_format"/>
 		<!--
@@ -68,9 +70,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="SWAP" low="30" high="31" type="a3xx_color_swap"/>
 	</reg32>
 	<reg32 offset="1" name="1">
-		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
-		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
-		<bitfield name="MUTABLEEN" pos="31" type="boolean" variants="A7XX-"/>
+		<bitfield name="WIDTH" low="0" high="14" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="NUM_ELEMENTS" low="0" high="29" type="uint" variants="DESC_BUFFER"/>
+		<bitfield name="MUTABLEEN" pos="31" type="boolean"/> <!-- a7xx+ -->
 	</reg32>
 	<reg32 offset="2" name="2">
 		<!--
@@ -78,13 +81,13 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 			PITCH/PITCHALIGN when TYPE is A6XX_TEX_BUFFER.
 		 -->
 		<doc> probably for D3D structured UAVs, normally set to 1 </doc>
-		<bitfield name="STRUCTSIZETEXELS" low="4" high="15" type="uint"/>
-		<bitfield name="STARTOFFSETTEXELS" low="16" high="21" type="uint"/>
+		<bitfield name="STRUCTSIZETEXELS" low="4" high="15" type="uint" variants="DESC_BUFFER"/>
+		<bitfield name="STARTOFFSETTEXELS" low="16" high="21" type="uint" variants="DESC_BUFFER"/>
 
 		<!-- minimum pitch (for mipmap levels): log2(pitchalign / 64) -->
-		<bitfield name="PITCHALIGN" low="0" high="3" type="uint"/>
+		<bitfield name="PITCHALIGN" low="0" high="3" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
 		<doc>Pitch in bytes (so actually stride)</doc>
-		<bitfield name="PITCH" low="7" high="28" type="uint"/>
+		<bitfield name="PITCH" low="7" high="28" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
 		<bitfield name="TYPE" low="29" high="31" type="a6xx_tex_type"/>
 	</reg32>
 	<reg32 offset="3" name="3">
@@ -94,15 +97,15 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		layer size at the point that it stops being reduced moving to
 		higher (smaller) mipmap levels
 		 -->
-		<bitfield name="ARRAY_PITCH" low="0" high="22" shr="12" type="uint"/>
-		<bitfield name="MIN_LAYERSZ" low="23" high="26" shr="12"/>
+		<bitfield name="ARRAY_PITCH" low="0" high="22" shr="12" type="uint" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/>
+		<bitfield name="MIN_LAYERSZ" low="23" high="26" shr="12" variants="DESC_SINGLE_PLANE"/>
 		<!--
 		by default levels with w < 16 are linear
 		TILE_ALL makes all levels have tiling
 		seems required when using UBWC, since all levels have UBWC (can possibly be disabled?)
 		 -->
-		<bitfield name="TILE_ALL" pos="27" type="boolean"/>
-		<bitfield name="FLAG" pos="28" type="boolean"/>
+		<bitfield name="TILE_ALL" pos="27" type="boolean" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="FLAG" pos="28" type="boolean" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
 	</reg32>
 	<!-- for 2-3 plane format, BASE is flag buffer address (if enabled)
 	     the address of the non-flag base buffer is determined automatically,
@@ -113,30 +116,42 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	</reg32>
 	<reg32 offset="5" name="5">
 		<bitfield name="BASE_HI" low="0" high="16"/>
-		<bitfield name="DEPTH" low="17" high="29" type="uint"/>
+		<bitfield name="DEPTH" low="17" high="29" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
 	</reg32>
 	<reg32 offset="6" name="6">
 		<!-- overlaps with PLANE_PITCH -->
-		<bitfield name="MIN_LOD_CLAMP" low="0" high="11" type="ufixed" radix="8"/>
+		<bitfield name="MIN_LOD_CLAMP" low="0" high="11" type="ufixed" radix="8" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE"/>
 		<!-- pitch for plane 2 / plane 3 -->
-		<bitfield name="PLANE_PITCH" low="8" high="31" type="uint"/>
+		<bitfield name="PLANE_PITCH" low="8" high="31" type="uint" variants="DESC_MULTI_PLANE"/>
+
+		<!-- QCOM_image_filtering sample weights descriptor fields, overlapping the others. -->
+		<bitfield name="LOG2_PHASES" low="0" high="2" type="uint" variants="DESC_WEIGHT"/>
+		<bitfield name="DILATION" low="8" high="11" type="uint" variants="DESC_WEIGHT"/>
 	</reg32>
 	<!-- 7/8 is plane 2 address for planar formats -->
 	<reg32 offset="7" name="7">
-		<bitfield name="FLAG_LO" low="5" high="31" shr="5"/>
+		<bitfield name="FLAG_LO" low="5" high="31" shr="5" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="BASE_U_LO" low="5" high="31" shr="5" variants="DESC_MULTI_PLANE"/>
 	</reg32>
 	<reg32 offset="8" name="8">
-		<bitfield name="FLAG_HI" low="0" high="16"/>
+		<bitfield name="FLAG_HI" low="0" high="16" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="BASE_U_HI" low="0" high="16" variants="DESC_MULTI_PLANE"/>
+		<bitfield name="FILTER_SIZE_X" low="17" high="23" variants="DESC_WEIGHT"/>
+		<bitfield name="FILTER_SIZE_Y" low="24" high="30" variants="DESC_WEIGHT"/>
 	</reg32>
 	<!-- 9/10 is plane 3 address for planar formats -->
 	<reg32 offset="9" name="9">
-		<bitfield name="FLAG_BUFFER_ARRAY_PITCH" low="0" high="16" shr="4" type="uint"/>
+		<bitfield name="FLAG_BUFFER_ARRAY_PITCH" low="0" high="16" shr="4" type="uint" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="BASE_V_LO" low="5" high="31" shr="5" variants="DESC_MULTI_PLANE"/>
 	</reg32>
 	<reg32 offset="10" name="10">
-		<bitfield name="FLAG_BUFFER_PITCH" low="0" high="6" shr="6" type="uint"/>
+		<bitfield name="FLAG_BUFFER_PITCH" low="0" high="6" shr="6" type="uint" variants="DESC_SINGLE_PLANE"/>
 		<!-- log2 size of the first level, required for mipmapping -->
-		<bitfield name="FLAG_BUFFER_LOGW" low="8" high="11" type="uint"/>
-		<bitfield name="FLAG_BUFFER_LOGH" low="12" high="15" type="uint"/>
+		<bitfield name="FLAG_BUFFER_LOGW" low="8" high="11" type="uint" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="FLAG_BUFFER_LOGH" low="12" high="15" type="uint" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="BASE_V_HI" low="0" high="16" variants="DESC_MULTI_PLANE"/>
+		<bitfield name="FILTER_OFFSET_X" low="17" high="22" variants="DESC_WEIGHT"/>
+		<bitfield name="FILTER_OFFSET_Y" low="23" high="28" variants="DESC_WEIGHT"/>
 	</reg32>
 	<reg32 offset="11" name="11"/>
 	<reg32 offset="12" name="12"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
index 81538831dc19..b44946f36fae 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_enums.xml
@@ -328,6 +328,9 @@ to upconvert to 32b float internally?
 	<value value="0x2"  name="R2D_SNORM8"/>
 	<value value="0x1"  name="R2D_UNORM8_SRGB"/>
 	<value value="0x0"  name="R2D_UNORM8"/>
+
+	<!-- Not a hw enum, used internally in driver -->
+	<value value="0xff" name="R2D_NONE"/>
 </enum>
 
 <enum name="a6xx_tex_type">
diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml b/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml
index edcbdb3b6921..d119d021446c 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_descriptors.xml
@@ -39,76 +39,92 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="3" name="3"/>
 </domain>
 
-<domain name="A8XX_TEX_MEMOBJ" width="32" varset="chip">
+<domain name="A8XX_TEX_MEMOBJ" width="32" varset="desctype">
 	<doc>Texture memobj dwords</doc>
 	<reg32 offset="0" name="0">
-		<bitfield name="BASE_LO" low="6" high="31" shr="6"/>
+		<bitfield name="BASE_LO" low="6" high="31" shr="6" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<doc>for type TEX_BUFFER</doc>
+		<bitfield name="INSTANCE_DESC_BASE_LO" low="0" high="31" variants="DESC_BUFFER"/>
 	</reg32>
 	<reg32 offset="1" name="1">
-		<bitfield name="BASE_HI" low="0" high="16"/>
+		<bitfield name="BASE_HI" low="0" high="16" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="INSTANCE_DESC_BASE_HI" low="0" high="16" variants="DESC_BUFFER"/>
 		<bitfield name="TYPE" low="17" high="19" type="a6xx_tex_type"/>
-		<bitfield name="DEPTH" low="20" high="31" type="uint"/>
+		<bitfield name="DEPTH" low="20" high="31" type="uint" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/>
+		<doc> for type TEX_BUFFER, probably for D3D structured UAVs, normally set to 1 </doc>
+		<bitfield name="STRUCTSIZETEXELS" low="20" high="31" type="uint" variants="DESC_BUFFER"/>
 	</reg32>
 	<reg32 offset="2" name="2">
-		<bitfield name="WIDTH" low="0" high="14" type="uint"/>
-		<bitfield name="HEIGHT" low="15" high="29" type="uint"/>
-		<bitfield name="SAMPLES" low="30" high="31" type="a3xx_msaa_samples"/>
+		<bitfield name="WIDTH" low="0" high="14" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="HEIGHT" low="15" high="29" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="SAMPLES" low="30" high="31" type="a3xx_msaa_samples" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/>
+		<bitfield name="NUM_ELEMENTS" low="0" high="31" type="uint" variants="DESC_BUFFER"/>
 	</reg32>
 	<reg32 offset="3" name="3">
 		<bitfield name="FMT" low="0" high="7" type="a6xx_format"/>
 		<bitfield name="SWAP" low="8" high="9" type="a3xx_color_swap"/>
-		<bitfield name="SWIZ_X" low="10" high="12" type="a8xx_tex_swiz"/>
-		<bitfield name="SWIZ_Y" low="13" high="15" type="a8xx_tex_swiz"/>
-		<bitfield name="SWIZ_Z" low="16" high="18" type="a8xx_tex_swiz"/>
-		<bitfield name="SWIZ_W" low="19" high="21" type="a8xx_tex_swiz"/>
+		<bitfield name="SWIZ_X" low="10" high="12" type="a8xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="SWIZ_Y" low="13" high="15" type="a8xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="SWIZ_Z" low="16" high="18" type="a8xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
+		<bitfield name="SWIZ_W" low="19" high="21" type="a8xx_tex_swiz" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_BUFFER"/>
 	</reg32>
 	<reg32 offset="4" name="4">
-		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode"/>
-		<bitfield name="FLAG" pos="2" type="boolean"/>
-		<bitfield name="PRT_EN" pos="3" type="boolean"/>
-		<bitfield name="TILE_ALL" pos="4" type="boolean"/>
+		<bitfield name="TILE_MODE" low="0" high="1" type="a6xx_tile_mode" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="FLAG" pos="2" type="boolean" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
+		<bitfield name="PRT_EN" pos="3" type="boolean" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/>
+		<bitfield name="TILE_ALL" pos="4" type="boolean" variants="DESC_SINGLE_PLANE"/>
 		<bitfield name="SRGB" pos="5" type="boolean"/>
-		<bitfield name="FLAG_LO" low="6" high="31" shr="6"/>
+		<bitfield name="FLAG_LO" low="6" high="31" shr="6" variants="DESC_SINGLE_PLANE"/>
 		<!-- For multiplanar: -->
-		<bitfield name="BASE_U_LO" low="6" high="31" shr="6"/>
+		<bitfield name="BASE_U_LO" low="6" high="31" shr="6" variants="DESC_MULTI_PLANE"/>
 	</reg32>
 	<reg32 offset="5" name="5">
-		<bitfield name="FLAG_HI" low="0" high="16"/>
+		<bitfield name="FLAG_HI" low="0" high="16" variants="DESC_SINGLE_PLANE"/>
 		<!-- For multiplanar: -->
-		<bitfield name="BASE_U_HI" low="0" high="16"/>
-		<bitfield name="FLAG_BUFFER_PITCH" low="17" high="24" shr="6" type="uint"/>
-		<bitfield name="ALL_SAMPLES_CENTER" pos="29" type="boolean"/>
-		<bitfield name="MUTABLEEN" pos="31" type="boolean"/>
+		<bitfield name="BASE_U_HI" low="0" high="16" variants="DESC_MULTI_PLANE"/>
+		<bitfield name="FLAG_BUFFER_PITCH" low="17" high="24" shr="6" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE"/>
+		<bitfield name="ALL_SAMPLES_CENTER" pos="29" type="boolean" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="MUTABLEEN" pos="31" type="boolean" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/>
+
+		<!-- QCOM_image_filtering sample weights descriptor fields, overlapping the others. -->
+		<bitfield name="FILTER_SIZE_X" low="0" high="6" type="uint" variants="DESC_WEIGHT"/>
+		<bitfield name="FILTER_SIZE_Y" low="7" high="13" type="uint" variants="DESC_WEIGHT"/>
+		<bitfield name="FILTER_OFFSET_X" low="19" high="24" type="uint" variants="DESC_WEIGHT"/>
+		<bitfield name="FILTER_OFFSET_Y" low="25" high="30" type="uint" variants="DESC_WEIGHT"/>
 	</reg32>
 	<reg32 offset="6" name="6">
-		<bitfield name="TEX_LINE_OFFSET" low="0" high="23" type="uint"/> <!-- PITCH -->
-		<bitfield name="MIN_LINE_OFFSET" low="24" high="27" type="uint"/> <!-- PITCHALIGN -->
-		<bitfield name="MIPLVLS" low="28" high="31" type="uint"/>
+		<bitfield name="TEX_LINE_OFFSET" low="0" high="23" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/> <!-- PITCH -->
+		<bitfield name="MIN_LINE_OFFSET" low="24" high="27" type="uint" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/> <!-- PITCHALIGN -->
+		<bitfield name="MIPLVLS" low="28" high="31" type="uint" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/>
 	</reg32>
 	<reg32 offset="7" name="7">
-		<bitfield name="ARRAY_SLICE_OFFSET" low="0" high="22" shr="12" type="uint"/> <!-- ARRAY_PITCH -->
-		<bitfield name="ASO_UNIT" pos="23"/> <!-- 4KB or 32B ? -->
-		<bitfield name="MIN_ARRAY_SLIZE_OFFSET" low="24" high="27" shr="12"/> <!-- MIN_LAYERSZ -->
-		<bitfield name="GMEM_TILING_FALLBACK_EN" pos="28" type="boolean"/>
-		<bitfield name="CORNER_BASED_EN" pos="30" type="boolean"/>
-		<bitfield name="GMEM_FULL_SURF" pos="31" type="boolean"/>
+		<bitfield name="ARRAY_SLICE_OFFSET" low="0" high="22" shr="12" type="uint" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/> <!-- ARRAY_PITCH -->
+		<bitfield name="ASO_UNIT" pos="23" variants="DESC_SINGLE_PLANE DESC_WEIGHT"/> <!-- 4KB or 32B ? -->
+		<bitfield name="MIN_ARRAY_SLIZE_OFFSET" low="24" high="27" shr="12" variants="DESC_SINGLE_PLANE"/> <!-- MIN_LAYERSZ -->
+		<bitfield name="GMEM_TILING_FALLBACK_EN" pos="28" type="boolean" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="CORNER_BASED_EN" pos="30" type="boolean" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE"/>
+		<bitfield name="GMEM_FULL_SURF" pos="31" type="boolean" variants="DESC_SINGLE_PLANE DESC_MULTI_PLANE DESC_WEIGHT"/>
 		<!-- For multiplanar.  This overlaps other single-planar fields: -->
-		<bitfield name="UV_OFFSET_H" low="24" high="25" type="ufixed" radix="2"/> <!-- CHROMA_MIDPOINT_X -->
-		<bitfield name="UV_OFFSET_V" low="26" high="27" type="ufixed" radix="2"/> <!-- CHROMA_MIDPOINT_Y -->
+		<bitfield name="UV_OFFSET_H" low="24" high="25" type="ufixed" radix="2" variants="DESC_MULTI_PLANE"/> <!-- CHROMA_MIDPOINT_X -->
+		<bitfield name="UV_OFFSET_V" low="26" high="27" type="ufixed" radix="2" variants="DESC_MULTI_PLANE"/> <!-- CHROMA_MIDPOINT_Y -->
+
+		<!-- QCOM_image_filtering sample weights descriptor fields, overlapping the others. -->
+		<bitfield name="DILATION" low="24" high="27" type="uint" variants="DESC_WEIGHT"/>
+		<bitfield name="LOG2_PHASES" low="28" high="30" type="uint" variants="DESC_WEIGHT"/>
 	</reg32>
 	<reg32 offset="8" name="8">
-		<bitfield name="FLAG_ARRAY_PITCH" low="0" high="14" shr="12" type="uint"/> <!-- FLAG_BUFFER_ARRAY_PITCH -->
+		<bitfield name="FLAG_ARRAY_PITCH" low="0" high="14" shr="12" type="uint" variants="DESC_SINGLE_PLANE"/> <!-- FLAG_BUFFER_ARRAY_PITCH -->
 		<!-- log2 size of the first level, required for mipmapping -->
-		<bitfield name="FLAG_BUFFER_LOGW" low="24" high="27" type="uint"/>
-		<bitfield name="FLAG_BUFFER_LOGH" low="28" high="31" type="uint"/>
+		<bitfield name="FLAG_BUFFER_LOGW" low="24" high="27" type="uint" variants="DESC_SINGLE_PLANE"/>
+		<bitfield name="FLAG_BUFFER_LOGH" low="28" high="31" type="uint" variants="DESC_SINGLE_PLANE"/>
 		<!-- For multiplanar.  This overlaps other single-planar fields: -->
-		<bitfield name="BASE_V_LO" low="6" high="31" shr="6"/>
+		<bitfield name="BASE_V_LO" low="6" high="31" shr="6" variants="DESC_MULTI_PLANE"/>
 	</reg32>
 	<reg32 offset="9" name="9">
-		<bitfield name="MIN_LOD_CLAMP" low="19" high="30" type="ufixed" radix="8"/>
+		<bitfield name="MIN_LOD_CLAMP" low="19" high="30" type="ufixed" radix="8" variants="DESC_SINGLE_PLANE"/>
 		<!-- For multiplanar, this overlaps other fields: -->
-		<bitfield name="BASE_V_HI" low="0" high="16"/>
-		<bitfield name="UV_PITCH" low="17" high="26"/> <!-- PLANE_PITCH -->
+		<bitfield name="BASE_V_HI" low="0" high="16" variants="DESC_MULTI_PLANE"/>
+		<bitfield name="UV_PITCH" shr="6" low="17" high="26" variants="DESC_MULTI_PLANE"/> <!-- PLANE_PITCH -->
 	</reg32>
 	<reg32 offset="10" name="10"/>
 	<reg32 offset="11" name="11"/>
diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml
new file mode 100644
index 000000000000..a5bb44f76956
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml
@@ -0,0 +1,1929 @@
+<?xml version="1.0" encoding="UTF-8"?>
+<database xmlns="http://nouveau.freedesktop.org/"
+xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
+xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
+<import file="freedreno_copyright.xml"/>
+<import file="adreno/adreno_common.xml"/>
+<import file="adreno/adreno_pm4.xml"/>
+
+<enum name="a8xx_cp_perfcounter_select">
+	<value value="0" name="A8XX_PERF_CP_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_CP_ALWAYS_COUNT"/>
+	<value value="2" name="A8XX_PERF_CP_BUSY_GFX_CORE_IDLE"/>
+	<value value="3" name="A8XX_PERF_CP_BUSY_CYCLES"/>
+	<value value="4" name="A8XX_PERF_CP_NUM_PREEMPTIONS"/>
+	<value value="5" name="A8XX_PERF_CP_PREEMPTION_REACTION_DELAY"/>
+	<value value="6" name="A8XX_PERF_CP_PREEMPTION_SWITCH_OUT_TIME"/>
+	<value value="7" name="A8XX_PERF_CP_PREEMPTION_SWITCH_IN_TIME"/>
+	<value value="8" name="A8XX_PERF_CP_DEAD_DRAWS_IN_BIN_RENDER"/>
+	<value value="9" name="A8XX_PERF_CP_PREDICATED_DRAWS_KILLED"/>
+	<value value="10" name="A8XX_PERF_CP_MODE_SWITCH"/>
+	<value value="11" name="A8XX_PERF_CP_ZPASS_DONE"/>
+	<value value="12" name="A8XX_PERF_CP_CONTEXT_DONE"/>
+	<value value="13" name="A8XX_PERF_CP_CACHE_FLUSH"/>
+	<value value="14" name="A8XX_PERF_CP_LONG_PREEMPTIONS"/>
+	<value value="15" name="A8XX_PERF_CP_SQE_I_CACHE_STARVE"/>
+	<value value="16" name="A8XX_PERF_CP_SQE_IDLE"/>
+	<value value="17" name="A8XX_PERF_CP_SQE_PM4_STARVE_RB"/>
+	<value value="18" name="A8XX_PERF_CP_SQE_PM4_STARVE_IB1"/>
+	<value value="19" name="A8XX_PERF_CP_SQE_PM4_STARVE_IB2"/>
+	<value value="20" name="A8XX_PERF_CP_SQE_PM4_STARVE_IB3"/>
+	<value value="21" name="A8XX_PERF_CP_SQE_PM4_STARVE_FSDT"/>
+	<value value="22" name="A8XX_PERF_CP_SQE_PM4_STARVE_SDS"/>
+	<value value="23" name="A8XX_PERF_CP_SQE_MRB_STARVE"/>
+	<value value="24" name="A8XX_PERF_CP_SQE_RRB_STARVE"/>
+	<value value="25" name="A8XX_PERF_CP_SQE_VSD_STARVE"/>
+	<value value="26" name="A8XX_PERF_CP_VSD_DECODE_STARVE"/>
+	<value value="27" name="A8XX_PERF_CP_SQE_PIPE_OUT_STALL"/>
+	<value value="28" name="A8XX_PERF_CP_SQE_SYNC_STALL"/>
+	<value value="29" name="A8XX_PERF_CP_SQE_PM4_WFI_STALL"/>
+	<value value="30" name="A8XX_PERF_CP_SQE_SYS_WFI_STALL"/>
+	<value value="31" name="A8XX_PERF_CP_WAIT_ON_OTHER_PIPE"/>
+	<value value="32" name="A8XX_PERF_CP_OUTPUT_BLOCKED"/>
+	<value value="33" name="A8XX_PERF_CP_SQE_T4_EXEC"/>
+	<value value="34" name="A8XX_PERF_CP_SQE_LOAD_STATE_EXEC"/>
+	<value value="35" name="A8XX_PERF_CP_SQE_SAVE_SDS_STATE"/>
+	<value value="36" name="A8XX_PERF_CP_SQE_DRAW_EXEC"/>
+	<value value="37" name="A8XX_PERF_CP_SQE_CTXT_REG_BUNCH_EXEC"/>
+	<value value="38" name="A8XX_PERF_CP_SQE_EXEC_PROFILED"/>
+	<value value="39" name="A8XX_PERF_CP_MEMORY_POOL_EMPTY"/>
+	<value value="40" name="A8XX_PERF_CP_MEMORY_POOL_SYNC_STALL"/>
+	<value value="41" name="A8XX_PERF_CP_MEMORY_POOL_ABOVE_THRESH"/>
+	<value value="42" name="A8XX_PERF_CP_MEMORY_POOL_BELOW_THRESH"/>
+	<value value="43" name="A8XX_PERF_CP_AHB_WR_STALL_PRE_DRAWS"/>
+	<value value="44" name="A8XX_PERF_CP_AHB_STALL_SQE_GMU"/>
+	<value value="45" name="A8XX_PERF_CP_AHB_STALL_SQE_WR_OTHER"/>
+	<value value="46" name="A8XX_PERF_CP_AHB_STALL_SQE_RD_OTHER"/>
+	<value value="47" name="A8XX_PERF_CP_CLUSTER_FE_U_EMPTY"/>
+	<value value="48" name="A8XX_PERF_CP_CLUSTER_FE_S_EMPTY"/>
+	<value value="49" name="A8XX_PERF_CP_CLUSTER_SP_VS_EMPTY"/>
+	<value value="50" name="A8XX_PERF_CP_CLUSTER_VPC_US_EMPTY"/>
+	<value value="51" name="A8XX_PERF_CP_CLUSTER_VPC_VS_EMPTY"/>
+	<value value="52" name="A8XX_PERF_CP_CLUSTER_GRAS_EMPTY"/>
+	<value value="53" name="A8XX_PERF_CP_CLUSTER_SP_PS_EMPTY"/>
+	<value value="54" name="A8XX_PERF_CP_CLUSTER_VPC_PS_EMPTY"/>
+	<value value="55" name="A8XX_PERF_CP_CLUSTER_PS_EMPTY"/>
+	<value value="56" name="A8XX_PERF_CP_PM4_DATA"/>
+	<value value="57" name="A8XX_PERF_CP_PM4_HEADERS"/>
+	<value value="58" name="A8XX_PERF_CP_VBIF_READ_BEATS"/>
+	<value value="59" name="A8XX_PERF_CP_VBIF_WRITE_BEATS"/>
+	<value value="60" name="A8XX_PERF_CP_SQE_INSTR_COUNTER"/>
+	<value value="61" name="A8XX_PERF_CP_CLUSTER_FE_US_FULL"/>
+	<value value="62" name="A8XX_PERF_CP_CLUSTER_FE_S_FULL"/>
+	<value value="63" name="A8XX_PERF_CP_CLUSTER_SP_VS_FULL"/>
+	<value value="64" name="A8XX_PERF_CP_CLUSTER_VPC_US_FULL"/>
+	<value value="65" name="A8XX_PERF_CP_CLUSTER_VPC_VS_FULL"/>
+	<value value="66" name="A8XX_PERF_CP_CLUSTER_GRAS_FULL"/>
+	<value value="67" name="A8XX_PERF_CP_CLUSTER_SP_PS_FULL"/>
+	<value value="68" name="A8XX_PERF_CP_CLUSTER_VPC_PS_FULL"/>
+	<value value="69" name="A8XX_PERF_CP_CLUSTER_PS_FULL"/>
+	<value value="70" name="A8XX_PERF_CP_ICACHE_MISSES"/>
+	<value value="71" name="A8XX_PERF_CP_ICACHE_HITS"/>
+	<value value="72" name="A8XX_PERF_CP_ICACHE_STALL"/>
+	<value value="73" name="A8XX_PERF_CP_DCACHE_MISSES"/>
+	<value value="74" name="A8XX_PERF_CP_DCACHE_HITS"/>
+	<value value="75" name="A8XX_PERF_CP_DCACHE_STALLS"/>
+	<value value="76" name="A8XX_PERF_CP_AQE_SQE_STALL"/>
+	<value value="77" name="A8XX_PERF_CP_SQE_AQE_STARVE"/>
+	<value value="78" name="A8XX_PERF_CP_ISR_CYCLES"/>
+	<value value="79" name="A8XX_PERF_CP_SQE_MD8_STALL_CYCLES"/>
+	<value value="80" name="A8XX_PERF_CP_SQE_MESH_EXEC_CYCLES"/>
+	<value value="81" name="A8XX_PERF_CP_AQE_NUM_AS_CHUNKS"/>
+	<value value="82" name="A8XX_PERF_CP_AQE_NUM_MS_CHUNKS"/>
+	<value value="83" name="A8XX_PERF_CP_S_SKEW_BUFFER_FULL"/>
+	<value value="84" name="A8XX_PERF_CP_S_SKEW_BUFFER_ABOVE_THRESH"/>
+	<value value="85" name="A8XX_PERF_CP_ECACHE_HITS"/>
+	<value value="86" name="A8XX_PERF_CP_ECACHE_KILLS"/>
+	<value value="87" name="A8XX_PERF_CP_ECACHE_REQS"/>
+	<value value="88" name="A8XX_PERF_CP_ECACHE_EVEN_REQS"/>
+	<value value="89" name="A8XX_PERF_CP_ECACHE_STALLS_RAP"/>
+	<value value="90" name="A8XX_PERF_CP_ECACHE_BUSY"/>
+</enum>
+
+<enum name="a8xx_rbbm_perfcounter_select">
+	<value value="0" name="A8XX_PERF_RBBM_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_RBBM_US_ALWAYS_COUNT"/>
+	<value value="2" name="A8XX_PERF_RBBM_US_ALWAYS_ON"/>
+	<value value="3" name="A8XX_PERF_RBBM_US_STATUS_MASKED"/>
+	<value value="4" name="A8XX_PERF_RBBM_US_PC_BUSY"/>
+	<value value="5" name="A8XX_PERF_RBBM_US_COM_BUSY"/>
+	<value value="6" name="A8XX_PERF_RBBM_US_DCOM_BUSY"/>
+	<value value="7" name="A8XX_PERF_RBBM_US_VBIF_BUSY"/>
+	<value value="8" name="A8XX_PERF_RBBM_US_VSC_BUSY"/>
+	<value value="9" name="A8XX_PERF_RBBM_US_UCHE_BUSY"/>
+	<value value="10" name="A8XX_PERF_RBBM_US_HLSQ_BUSY"/>
+	<value value="11" name="A8XX_PERF_RBBM_S_HLSQ_BUSY"/>
+	<value value="12" name="A8XX_PERF_RBBM_S_PC_BUSY"/>
+	<value value="13" name="A8XX_PERF_RBBM_S_TESS_BUSY"/>
+	<value value="14" name="A8XX_PERF_RBBM_S_TSEFE_BUSY"/>
+	<value value="15" name="A8XX_PERF_RBBM_S_TSEBE_BUSY"/>
+	<value value="16" name="A8XX_PERF_RBBM_S_RAS_BUSY"/>
+</enum>
+
+<enum name="a8xx_pc_perfcounter_select">
+	<value value="0" name="A8XX_PERF_PC_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_PC_US_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_PC_US_WORKING_CYCLES"/>
+	<value value="3" name="A8XX_PERF_PC_US_UCHE_OUTSTANDING_TRANS"/>
+	<value value="4" name="A8XX_PERF_PC_US_PASS1_TF_STALL_CYCLES"/>
+	<value value="5" name="A8XX_PERF_PC_US_STARVE_CYCLES_FOR_INDEX"/>
+	<value value="6" name="A8XX_PERF_PC_US_STARVE_CYCLES_FOR_TF"/>
+	<value value="7" name="A8XX_PERF_PC_US_STARVE_CYCLES_FOR_VIZ_STREAM"/>
+	<value value="8" name="A8XX_PERF_PC_US_STARVE_CYCLES_DI"/>
+	<value value="9" name="A8XX_PERF_PC_US_VIS_STREAMS_LOADED"/>
+	<value value="10" name="A8XX_PERF_PC_US_INSTANCES"/>
+	<value value="11" name="A8XX_PERF_PC_US_DEAD_PRIM"/>
+	<value value="12" name="A8XX_PERF_PC_US_SLICE_LIVE_PRIM"/>
+	<value value="13" name="A8XX_PERF_PC_US_3D_DRAWCALLS"/>
+	<value value="14" name="A8XX_PERF_PC_US_2D_DRAWCALLS"/>
+	<value value="15" name="A8XX_PERF_PC_US_NON_DRAWCALL_GLOBAL_EVENTS"/>
+	<value value="16" name="A8XX_PERF_PC_US_MESH_DRAWS"/>
+	<value value="17" name="A8XX_PERF_PC_US_MESH_DEAD_DRAWS"/>
+	<value value="18" name="A8XX_PERF_PC_US_MESH_MVIS_EN_DRAWS"/>
+	<value value="19" name="A8XX_PERF_PC_US_MESH_DEAD_PRIM"/>
+	<value value="20" name="A8XX_PERF_PC_US_MESH_LIVE_PRIM"/>
+	<value value="21" name="A8XX_PERF_PC_US_MESH_PA_EN_PRIM"/>
+	<value value="22" name="A8XX_PERF_PC_US_STARVE_CYCLES_FOR_MVIS_STREAM"/>
+	<value value="23" name="A8XX_PERF_PC_US_STARVE_CYCLES_PREDRAW"/>
+	<value value="24" name="A8XX_PERF_PC_US_STALL_CYCLES_COMPUTE_GFX"/>
+	<value value="25" name="A8XX_PERF_PC_US_STALL_CYCLES_GFX_COMPUTE"/>
+	<value value="26" name="A8XX_PERF_PC_US_PREDRAW_STALLS"/>
+	<value value="27" name="A8XX_PERF_PC_US_DP0_INPUT_STALLS"/>
+	<value value="28" name="A8XX_PERF_PC_US_DP1_INPUT_STALLS"/>
+	<value value="29" name="A8XX_PERF_PC_US_BR_STALLS_BV_WORKLOAD"/>
+	<value value="30" name="A8XX_PERF_PC_US_BV_STALLS_BR_WORKLOAD"/>
+	<value value="31" name="A8XX_PERF_PC_US_PASSPAIR_STALL"/>
+	<value value="32" name="A8XX_PERF_PC_US_STALL_CYCLES_UCHE0"/>
+	<value value="33" name="A8XX_PERF_PC_US_STALL_CYCLES_UCHE1"/>
+	<value value="34" name="A8XX_PERF_PC_US_UCHE_0_TRANS"/>
+	<value value="35" name="A8XX_PERF_PC_US_UCHE_1_TRANS"/>
+	<value value="36" name="A8XX_PERF_PC_US_BV_STALLED_BY_ATTR"/>
+	<value value="37" name="A8XX_PERF_PC_US_BV_STARVED_BY_RARB"/>
+	<value value="38" name="A8XX_PERF_PC_US_VPC_PRIM_COUNT_STALLS_BR"/>
+	<value value="39" name="A8XX_PERF_PC_US_VPC_PRIM_COUNT_STALLS_BV"/>
+	<value value="40" name="A8XX_PERF_PC_US_BV_STALLED_BY_UCHE_FEEDBACK"/>
+	<value value="41" name="A8XX_PERF_PC_US_VSD_RARB_DVIZ_FULL"/>
+	<value value="42" name="A8XX_PERF_PC_US_VSD_RARB_PVIZ_FULL"/>
+	<value value="43" name="A8XX_PERF_PC_US_VSD_RARB_TVIZ_FULL"/>
+	<value value="44" name="A8XX_PERF_PC_US_DP0_RARB_FULL"/>
+	<value value="45" name="A8XX_PERF_PC_US_DP1_RARB_FULL"/>
+	<value value="46" name="A8XX_PERF_PC_US_DP0_LIVE_PRIM"/>
+	<value value="47" name="A8XX_PERF_PC_US_DP1_LIVE_PRIM"/>
+	<value value="48" name="A8XX_PERF_PC_US_BV2BR_SWITCH"/>
+	<value value="49" name="A8XX_PERF_PC_US_BR2BV_SWITCH"/>
+	<value value="50" name="A8XX_PERF_PC_US_STALL_CYCLES_PC_S"/>
+	<value value="51" name="A8XX_PERF_PC_RESERVED_51"/>
+	<value value="52" name="A8XX_PERF_PC_RESERVED_52"/>
+	<value value="53" name="A8XX_PERF_PC_RESERVED_53"/>
+	<value value="54" name="A8XX_PERF_PC_RESERVED_54"/>
+	<value value="55" name="A8XX_PERF_PC_RESERVED_55"/>
+	<value value="56" name="A8XX_PERF_PC_RESERVED_56"/>
+	<value value="57" name="A8XX_PERF_PC_RESERVED_57"/>
+	<value value="58" name="A8XX_PERF_PC_RESERVED_58"/>
+	<value value="59" name="A8XX_PERF_PC_RESERVED_59"/>
+	<value value="60" name="A8XX_PERF_PC_S_BUSY_CYCLES"/>
+	<value value="61" name="A8XX_PERF_PC_S_WORKING_CYCLES"/>
+	<value value="62" name="A8XX_PERF_PC_S_STALL_CYCLES_VFD"/>
+	<value value="63" name="A8XX_PERF_PC_S_STALL_CYCLES_VPC_FE"/>
+	<value value="64" name="A8XX_PERF_PC_S_STALL_CYCLES_TESS"/>
+	<value value="65" name="A8XX_PERF_PC_S_STALL_CYCLES_VFD_ONLY"/>
+	<value value="66" name="A8XX_PERF_PC_S_STALL_CYCLES_VPC_ONLY"/>
+	<value value="67" name="A8XX_PERF_PC_S_VPC_PRIMITIVES"/>
+	<value value="68" name="A8XX_PERF_PC_S_VERTEX_HITS"/>
+	<value value="69" name="A8XX_PERF_PC_S_IA_VERTICES"/>
+	<value value="70" name="A8XX_PERF_PC_S_IA_PRIMITIVES"/>
+	<value value="71" name="A8XX_PERF_PC_S_HS_INVOCATIONS"/>
+	<value value="72" name="A8XX_PERF_PC_S_DS_INVOCATIONS"/>
+	<value value="73" name="A8XX_PERF_PC_S_VS_INVOCATIONS"/>
+	<value value="74" name="A8XX_PERF_PC_S_GS_INVOCATIONS"/>
+	<value value="75" name="A8XX_PERF_PC_S_DS_PRIMITIVES"/>
+	<value value="76" name="A8XX_PERF_PC_S_TESS_BUSY_CYCLES"/>
+	<value value="77" name="A8XX_PERF_PC_S_TESS_WORKING_CYCLES"/>
+	<value value="78" name="A8XX_PERF_PC_S_TESS_STALL_CYCLES_PC"/>
+	<value value="79" name="A8XX_PERF_PC_S_TESS_STARVE_CYCLES_PC"/>
+	<value value="80" name="A8XX_PERF_PC_S_TESS_SETUP_ACTIVE"/>
+	<value value="81" name="A8XX_PERF_PC_S_TESS_PID_ACTIVE"/>
+	<value value="82" name="A8XX_PERF_PC_S_TESS_PRIM_GEN_ACTIVE"/>
+	<value value="83" name="A8XX_PERF_PC_S_TESS_FACTOR_TRANS"/>
+	<value value="84" name="A8XX_PERF_PC_S_TESS_PC_UV_TRANS"/>
+	<value value="85" name="A8XX_PERF_PC_S_TESS_PC_UV_PATCHES"/>
+	<value value="86" name="A8XX_PERF_PC_S_MESH_VS_WAVES"/>
+</enum>
+
+<enum name="a8xx_vfd_perfcounter_select">
+	<value value="0" name="A8XX_PERF_VFD_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_VFD_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_VFD_STALL_CYCLES_UCHE"/>
+	<value value="3" name="A8XX_PERF_VFD_STALL_CYCLES_VPC_ALLOC"/>
+	<value value="4" name="A8XX_PERF_VFD_STALL_CYCLES_SP_INFO"/>
+	<value value="5" name="A8XX_PERF_VFD_STALL_CYCLES_SP_ATTR"/>
+	<value value="6" name="A8XX_PERF_VFD_STARVE_CYCLES_UCHE"/>
+	<value value="7" name="A8XX_PERF_VFD_RBUFFER_FULL"/>
+	<value value="8" name="A8XX_PERF_VFD_ATTR_INFO_FIFO_FULL"/>
+	<value value="9" name="A8XX_PERF_VFD_DECODED_ATTRIBUTE_BYTES"/>
+	<value value="10" name="A8XX_PERF_VFD_NUM_ATTRIBUTES"/>
+	<value value="11" name="A8XX_PERF_VFD_UPPER_SHADER_FIBERS"/>
+	<value value="12" name="A8XX_PERF_VFD_LOWER_SHADER_FIBERS"/>
+	<value value="13" name="A8XX_PERF_VFD_MODE_0_FIBERS"/>
+	<value value="14" name="A8XX_PERF_VFD_MODE_1_FIBERS"/>
+	<value value="15" name="A8XX_PERF_VFD_MODE_2_FIBERS"/>
+	<value value="16" name="A8XX_PERF_VFD_MODE_3_FIBERS"/>
+	<value value="17" name="A8XX_PERF_VFD_MODE_4_FIBERS"/>
+	<value value="18" name="A8XX_PERF_VFD_TOTAL_VERTICES"/>
+	<value value="19" name="A8XX_PERF_VFDP_STALL_CYCLES_VFD"/>
+	<value value="20" name="A8XX_PERF_VFDP_STALL_CYCLES_VFD_INDEX"/>
+	<value value="21" name="A8XX_PERF_VFDP_STALL_CYCLES_VFD_PROG"/>
+	<value value="22" name="A8XX_PERF_VFDP_STARVE_CYCLES_PC"/>
+	<value value="23" name="A8XX_PERF_VFDP_VS_STAGE_WAVES"/>
+	<value value="24" name="A8XX_PERF_VFD_STALL_CYCLES_PRG_END_FE"/>
+	<value value="25" name="A8XX_PERF_VFD_STALL_CYCLES_CBSYNC"/>
+	<value value="26" name="A8XX_PERF_VFD_BOTTLENECK_CYCLES"/>
+	<value value="27" name="A8XX_PERF_VFD_WORKING_CYCLES"/>
+</enum>
+
+<enum name="a8xx_hlsq_perfcounter_select">
+	<value value="0" name="A8XX_PERF_HLSQ_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_HLSQ_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_HLSQ_STALL_CYCLES_SP_STATE"/>
+	<value value="3" name="A8XX_PERF_HLSQ_STALL_CYCLES_SP_FS_STAGE"/>
+	<value value="4" name="A8XX_PERF_HLSQ_UCHE_LATENCY_CYCLES"/>
+	<value value="5" name="A8XX_PERF_HLSQ_UCHE_LATENCY_COUNT"/>
+	<value value="6" name="A8XX_PERF_HLSQ_STALL_CYCLES_UCHE"/>
+	<value value="7" name="A8XX_PERF_HLSQ_RESERVED_7"/>
+	<value value="8" name="A8XX_PERF_HLSQ_RESERVED_8"/>
+	<value value="9" name="A8XX_PERF_HLSQ_RESERVED_9"/>
+	<value value="10" name="A8XX_PERF_HLSQ_COMPUTE_DRAWCALLS"/>
+	<value value="11" name="A8XX_PERF_HLSQ_FS_DATA_WAIT_PROGRAMMING"/>
+	<value value="12" name="A8XX_PERF_HLSQ_DUAL_FS_PROG_ACTIVE"/>
+	<value value="13" name="A8XX_PERF_HLSQ_DUAL_VS_PROG_ACTIVE"/>
+	<value value="14" name="A8XX_PERF_HLSQ_FS_BATCH_COUNT_ZERO"/>
+	<value value="15" name="A8XX_PERF_HLSQ_VS_BATCH_COUNT_ZERO"/>
+	<value value="16" name="A8XX_PERF_HLSQ_WAVE_PENDING_NO_QUAD"/>
+	<value value="17" name="A8XX_PERF_HLSQ_WAVE_PENDING_NO_PRIM_BASE"/>
+	<value value="18" name="A8XX_PERF_HLSQ_STALL_CYCLES_VPC_BE"/>
+	<value value="19" name="A8XX_PERF_HLSQ_RESERVED_19"/>
+	<value value="20" name="A8XX_PERF_HLSQ_RESERVED_20"/>
+	<value value="21" name="A8XX_PERF_HLSQ_VSBR_STALL_CYCLES"/>
+	<value value="22" name="A8XX_PERF_HLSQ_FS_STALL_CYCLES"/>
+	<value value="23" name="A8XX_PERF_HLSQ_LPAC_STALL_CYCLES"/>
+	<value value="24" name="A8XX_PERF_HLSQ_BV_STALL_CYCLES"/>
+	<value value="25" name="A8XX_PERF_HLSQ_VSBR_DEREF_CYCLES"/>
+	<value value="26" name="A8XX_PERF_HLSQ_FS_DEREF_CYCLES"/>
+	<value value="27" name="A8XX_PERF_HLSQ_LPAC_DEREF_CYCLES"/>
+	<value value="28" name="A8XX_PERF_HLSQ_BV_DEREF_CYCLES"/>
+	<value value="29" name="A8XX_PERF_HLSQ_VSBR_S2W_CYCLES"/>
+	<value value="30" name="A8XX_PERF_HLSQ_FS_S2W_CYCLES"/>
+	<value value="31" name="A8XX_PERF_HLSQ_LPAC_S2W_CYCLES"/>
+	<value value="32" name="A8XX_PERF_HLSQ_BV_S2W_CYCLES"/>
+	<value value="33" name="A8XX_PERF_HLSQ_VSBR_WAIT_FS_S2W"/>
+	<value value="34" name="A8XX_PERF_HLSQ_FS_WAIT_VS_S2W"/>
+	<value value="35" name="A8XX_PERF_HLSQ_LPAC_WAIT_VS_S2W"/>
+	<value value="36" name="A8XX_PERF_HLSQ_BV_WAIT_FS_S2W"/>
+	<value value="37" name="A8XX_PERF_HLSQ_RESERVED_37"/>
+	<value value="38" name="A8XX_PERF_HLSQ_FS_WAIT_SAME_VS_S2W"/>
+	<value value="39" name="A8XX_PERF_HLSQ_FS_STARVING_SP"/>
+	<value value="40" name="A8XX_PERF_HLSQ_VS_DATA_WAIT_PROGRAMMING"/>
+	<value value="41" name="A8XX_PERF_HLSQ_BV_DATA_WAIT_PROGRAMMING"/>
+	<value value="42" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_VS"/>
+	<value value="43" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_VS"/>
+	<value value="44" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_FS"/>
+	<value value="45" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_FS"/>
+	<value value="46" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_BV"/>
+	<value value="47" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_BV"/>
+	<value value="48" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXTS_LPAC"/>
+	<value value="49" name="A8XX_PERF_HLSQ_STPROC_WAVE_CONTEXT_CYCLES_LPAC"/>
+	<value value="50" name="A8XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_VS"/>
+	<value value="51" name="A8XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_FS"/>
+	<value value="52" name="A8XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_BV"/>
+	<value value="53" name="A8XX_PERF_HLSQ_SPTROC_STCHE_WARMUP_INC_LPAC"/>
+	<value value="54" name="A8XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_VS"/>
+	<value value="55" name="A8XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_FS"/>
+	<value value="56" name="A8XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_BV"/>
+	<value value="57" name="A8XX_PERF_HLSQ_SPTROC_STCHE_MISS_INC_LPAC"/>
+	<value value="58" name="A8XX_PERF_HLSQ_VSBR_S2W_CYCLES_SP"/>
+	<value value="59" name="A8XX_PERF_HLSQ_FS_S2W_CYCLES_SP"/>
+	<value value="60" name="A8XX_PERF_HLSQ_LPAC_S2W_CYCLES_SP"/>
+	<value value="61" name="A8XX_PERF_HLSQ_BV_S2W_CYCLES_SP"/>
+	<value value="62" name="A8XX_PERF_HLSQ_L2STC_REQ_HLSQ"/>
+	<value value="63" name="A8XX_PERF_HLSQ_L2STC_REQ_HLSQ_HIT"/>
+	<value value="64" name="A8XX_PERF_HLSQ_L2STC_REQ_SP"/>
+	<value value="65" name="A8XX_PERF_HLSQ_L2STC_REQ_SP_HIT"/>
+	<value value="66" name="A8XX_PERF_HLSQ_L2STC_REQ_INS_HLSQ"/>
+	<value value="67" name="A8XX_PERF_HLSQ_L2STC_REQ_INS_HLSQ_HIT"/>
+	<value value="68" name="A8XX_PERF_HLSQ_L2STC_REQ_INS_SP"/>
+	<value value="69" name="A8XX_PERF_HLSQ_L2STC_REQ_INS_SP_HIT"/>
+	<value value="70" name="A8XX_PERF_HLSQ_L2STC_REQ_UCHE"/>
+	<value value="71" name="A8XX_PERF_HLSQ_L2STC_LATENCY_CYCLES"/>
+	<value value="72" name="A8XX_PERF_HLSQ_L2STC_LATENCY_COUNT"/>
+	<value value="73" name="A8XX_PERF_HLSQ_L2STC_STALL_SP_MISS_REQ"/>
+	<value value="74" name="A8XX_PERF_HLSQ_L2STC_BANK0_REPLACEMENT"/>
+	<value value="75" name="A8XX_PERF_HLSQ_L2STC_BANK1_REPLACEMENT"/>
+	<value value="76" name="A8XX_PERF_HLSQ_L2STC_BANK2_REPLACEMENT"/>
+	<value value="77" name="A8XX_PERF_HLSQ_L2STC_BANK3_REPLACEMENT"/>
+	<value value="78" name="A8XX_PERF_HLSQ_S2W_STALL_BY_MISS_RETURN"/>
+	<value value="79" name="A8XX_PERF_HLSQ_MISS_RETURN_STALL_BY_S2W"/>
+	<value value="80" name="A8XX_PERF_HLSQ_STPROC_L0_STALL_INS_RD"/>
+	<value value="81" name="A8XX_PERF_HLSQ_STPROC_L0_INS_MISS"/>
+	<value value="82" name="A8XX_PERF_HLSQ_STPROC_L0_INS_HIT"/>
+	<value value="83" name="A8XX_PERF_HLSQ_STPROC_L0_INS_LATENCY_COUNT"/>
+	<value value="84" name="A8XX_PERF_HLSQ_STPROC_L0_INS_LATENCY_CYCLE"/>
+	<value value="85" name="A8XX_PERF_HLSQ_STPROC_DPS_RUN_COUNT"/>
+	<value value="86" name="A8XX_PERF_HLSQ_STPROC_DPS_RUN_CYCLE"/>
+	<value value="87" name="A8XX_PERF_HLSQ_VSDP_BR_QUERY_REQ"/>
+	<value value="88" name="A8XX_PERF_HLSQ_VSDP_BV_QUERY_REQ"/>
+	<value value="89" name="A8XX_PERF_HLSQ_VSDP_BR_QUERY_REQ_WHEN_BV_PENDING"/>
+	<value value="90" name="A8XX_PERF_HLSQ_VSDP_BR_QUERY_BUSY"/>
+	<value value="91" name="A8XX_PERF_HLSQ_VSDP_BV_QUERY_BUSY"/>
+	<value value="92" name="A8XX_PERF_HLSQ_VSDP_BR_QUERY_FAIL"/>
+	<value value="93" name="A8XX_PERF_HLSQ_VSDP_BV_QUERY_FAIL"/>
+	<value value="94" name="A8XX_PERF_HLSQ_VS_CTXT_BUF_FULL_BLOCK_CPI"/>
+	<value value="95" name="A8XX_PERF_HLSQ_FS_CTXT_BUF_FULL_BLOCK_CPI"/>
+	<value value="96" name="A8XX_PERF_HLSQ_BV_CTXT_BUF_FULL_BLOCK_CPI"/>
+	<value value="97" name="A8XX_PERF_HLSQ_VS_CONST_BUF_FULL_BLOCK_CPI"/>
+	<value value="98" name="A8XX_PERF_HLSQ_FS_CONST_BUF_FULL_BLOCK_CPI"/>
+	<value value="99" name="A8XX_PERF_HLSQ_BV_CONST_BUF_FULL_BLOCK_CPI"/>
+	<value value="100" name="A8XX_PERF_HLSQ_VS_INS_BUF_FULL_BLOCK_CPI"/>
+	<value value="101" name="A8XX_PERF_HLSQ_FS_INS_BUF_FULL_BLOCK_CPI"/>
+	<value value="102" name="A8XX_PERF_HLSQ_BV_INS_BUF_FULL_BLOCK_CPI"/>
+	<value value="103" name="A8XX_PERF_HLSQ_VS_DES_BUF_FULL_BLOCK_CPI"/>
+	<value value="104" name="A8XX_PERF_HLSQ_FS_DES_BUF_FULL_BLOCK_CPI"/>
+	<value value="105" name="A8XX_PERF_HLSQ_BV_DES_BUF_FULL_BLOCK_CPI"/>
+	<value value="106" name="A8XX_PERF_HLSQ_PRIMITIVE_COUNT"/>
+	<value value="107" name="A8XX_PERF_HLSQ_LPAC2BV_SWITCH_CNT"/>
+	<value value="108" name="A8XX_PERF_HLSQ_BV2LPAC_SWITCH_CNT"/>
+	<value value="109" name="A8XX_PERF_HLSQ_LPAC2BV_SWITCH_CYC"/>
+	<value value="110" name="A8XX_PERF_HLSQ_BV2LPAC_SWITCH_CYC"/>
+	<value value="111" name="A8XX_PERF_HLSQ_VSDP_BV2BR_SWITCH_CYC"/>
+	<value value="112" name="A8XX_PERF_HLSQ_VS_SP_HCTX_ACTIVE_CNT"/>
+	<value value="113" name="A8XX_PERF_HLSQ_FS_SP_HCTX_ACTIVE_CNT"/>
+	<value value="114" name="A8XX_PERF_HLSQ_BV_SP_HCTX_ACTIVE_CNT"/>
+	<value value="115" name="A8XX_PERF_HLSQ_VS_SP_HCTX_ACTIVE_CYC"/>
+	<value value="116" name="A8XX_PERF_HLSQ_FS_SP_HCTX_ACTIVE_CYC"/>
+	<value value="117" name="A8XX_PERF_HLSQ_BV_SP_HCTX_ACTIVE_CYC"/>
+	<value value="118" name="A8XX_PERF_HLSQ_VS_SP_CCTX_ACTIVE_CNT"/>
+	<value value="119" name="A8XX_PERF_HLSQ_FS_SP_CCTX_ACTIVE_CNT"/>
+	<value value="120" name="A8XX_PERF_HLSQ_BV_SP_CCTX_ACTIVE_CNT"/>
+	<value value="121" name="A8XX_PERF_HLSQ_VS_SP_SCTX_ACTIVE_CNT"/>
+	<value value="122" name="A8XX_PERF_HLSQ_FS_SP_SCTX_ACTIVE_CNT"/>
+	<value value="123" name="A8XX_PERF_HLSQ_BV_SP_SCTX_ACTIVE_CNT"/>
+	<value value="124" name="A8XX_PERF_HLSQ_VS_SP_CTX_ALIVE_CYCLE"/>
+	<value value="125" name="A8XX_PERF_HLSQ_FS_SP_CTX_ALIVE_CYCLE"/>
+	<value value="126" name="A8XX_PERF_HLSQ_BV_SP_CTX_ALIVE_CYCLE"/>
+	<value value="127" name="A8XX_PERF_HLSQ_STPROC_WAVE_NUM_FS"/>
+	<value value="128" name="A8XX_PERF_HLSQ_STPROC_WAVE_NUM_VS"/>
+	<value value="129" name="A8XX_PERF_HLSQ_STPROC_WAVE_NUM_BV"/>
+	<value value="130" name="A8XX_PERF_HLSQ_STPROC_WAVE_NUM_LPAC"/>
+	<value value="131" name="A8XX_PERF_HLSQ_VS_SP_CCTX_NUM"/>
+	<value value="132" name="A8XX_PERF_HLSQ_FS_SP_CCTX_NUM"/>
+	<value value="133" name="A8XX_PERF_HLSQ_BV_SP_CCTX_NUM"/>
+	<value value="134" name="A8XX_PERF_HLSQ_VS_SP_SCTX_NUM"/>
+	<value value="135" name="A8XX_PERF_HLSQ_FS_SP_SCTX_NUM"/>
+	<value value="136" name="A8XX_PERF_HLSQ_BV_SP_SCTX_NUM"/>
+</enum>
+
+<enum name="a8xx_vpc_perfcounter_select">
+	<value value="0" name="A8XX_PERF_VPC_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_VPC_FE_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_VPC_FE_WORKING_CYCLES"/>
+	<value value="3" name="A8XX_PERF_VPC_FE_STALL_CYCLES_VFD_WACK"/>
+	<value value="4" name="A8XX_PERF_VPC_FE_STARVE_CYCLES_SP"/>
+	<value value="5" name="A8XX_PERF_VPC_FE_PC_PRIMITIVES"/>
+	<value value="6" name="A8XX_PERF_VPC_FE_SP_COMPONENTS"/>
+	<value value="7" name="A8XX_PERF_VPC_FE_STALL_CYCLES_VPCRAM_POS"/>
+	<value value="8" name="A8XX_PERF_VPC_FE_VS_BUSY_CYCLES"/>
+	<value value="9" name="A8XX_PERF_VPC_FE_VS_WORKING_CYCLES"/>
+	<value value="10" name="A8XX_PERF_VPC_FE_NUM_VPCRAM_READ_POS"/>
+	<value value="11" name="A8XX_PERF_VPC_FE_WIT_FULL_CYCLES"/>
+	<value value="12" name="A8XX_PERF_VPC_FE_VPCRAM_FULL_CYCLES"/>
+	<value value="13" name="A8XX_PERF_VPC_FE_NUM_VPCRAM_WRITE"/>
+	<value value="14" name="A8XX_PERF_VPC_FE_STALL_CYCLES_TSE_FE"/>
+	<value value="15" name="A8XX_PERF_VPC_FE_STALL_CYCLES_VPC_US"/>
+	<value value="16" name="A8XX_PERF_VPC_FE_TSE_FE_PRIMITIVES"/>
+	<value value="17" name="A8XX_PERF_VPC_FE_GS_PRIMITIVES"/>
+	<value value="18" name="A8XX_PERF_VPC_FE_TSE_FE_TRANSACTIONS"/>
+	<value value="19" name="A8XX_PERF_VPC_FE_STALL_CYCLES_CCU"/>
+	<value value="20" name="A8XX_PERF_VPC_FE_NUM_WM_HIT"/>
+	<value value="21" name="A8XX_PERF_VPC_FE_STALL_DQ_WACK"/>
+	<value value="22" name="A8XX_PERF_VPC_FE_STALL_CYCLES_PRG_END_FE"/>
+	<value value="23" name="A8XX_PERF_VPC_FE_STALL_CYCLES_PRG_END_VPCVS"/>
+	<value value="24" name="A8XX_PERF_VPC_FE_POSRAM_FULL_CYCLES"/>
+	<value value="25" name="A8XX_PERF_VPC_FE_GMEM_NOP_FULL_CYCLES"/>
+	<value value="26" name="A8XX_PERF_VPC_FE_GMEM_POS_FULL_CYCLES"/>
+	<value value="27" name="A8XX_PERF_VPC_FE_BOTTLENECK"/>
+	<value value="28" name="A8XX_PERF_VPC_US_BUSY_CYCLES"/>
+	<value value="29" name="A8XX_PERF_VPC_US_WORKING_CYCLES"/>
+	<value value="30" name="A8XX_PERF_VPC_US_STARVE_CYCLES_TSE_FE"/>
+	<value value="31" name="A8XX_PERF_VPC_US_PTUS_FULL"/>
+	<value value="32" name="A8XX_PERF_VPC_US_COMP_INVIS_PRIM_COUNT"/>
+	<value value="33" name="A8XX_PERF_VPC_US_STALL_CYCLES_VSC"/>
+	<value value="34" name="A8XX_PERF_VPC_US_STALL_CYCLES_VPC_BE"/>
+	<value value="35" name="A8XX_PERF_VPC_US_STALL_CYCLES_UCHE"/>
+	<value value="36" name="A8XX_PERF_VPC_US_STREAMOUT_TRANSACTION"/>
+	<value value="37" name="A8XX_PERF_VPC_US_NUM_GMEM_READ_SO"/>
+	<value value="38" name="A8XX_PERF_VPC_US_STARVE_CYCLES_UCHE_RD"/>
+	<value value="39" name="A8XX_PERF_VPC_US_STALL_CYCLES_PRG_END_VPCUS"/>
+	<value value="40" name="A8XX_PERF_VPC_US_STARVE_CYCLES_REORDER"/>
+	<value value="41" name="A8XX_PERF_VPC_US_BOTTLENECK"/>
+	<value value="42" name="A8XX_PERF_VPC_RESERVED_42"/>
+	<value value="43" name="A8XX_PERF_VPC_RESERVED_43"/>
+	<value value="44" name="A8XX_PERF_VPC_RESERVED_44"/>
+	<value value="45" name="A8XX_PERF_VPC_BE_BUSY_CYCLES"/>
+	<value value="46" name="A8XX_PERF_VPC_BE_WORKING_CYCLES"/>
+	<value value="47" name="A8XX_PERF_VPC_BE_STALL_CYCLES_TSE_BE"/>
+	<value value="48" name="A8XX_PERF_VPC_BE_TSE_BE_PRIMITIVES"/>
+	<value value="49" name="A8XX_PERF_VPC_BE_TSE_BE_TRANSACTIONS"/>
+	<value value="50" name="A8XX_PERF_VPC_BE_STARVE_CYCLES_LRZ"/>
+	<value value="51" name="A8XX_PERF_VPC_BE_LRZ_ASSIGN_PRIMITIVES"/>
+	<value value="52" name="A8XX_PERF_VPC_BE_RB_VISIBLE_PRIMITIVES"/>
+	<value value="53" name="A8XX_PERF_VPC_BE_STARVE_CYCLES_RB"/>
+	<value value="54" name="A8XX_PERF_VPC_BE_STALL_CYCLES_HLSQ_PRIM_ALLOC"/>
+	<value value="55" name="A8XX_PERF_VPC_BE_STALL_CYCLES_SP_LM"/>
+	<value value="56" name="A8XX_PERF_VPC_BE_NUM_PA_REQ"/>
+	<value value="57" name="A8XX_PERF_VPC_BE_NUM_LM_REQ_HIT"/>
+	<value value="58" name="A8XX_PERF_VPC_BE_NUM_ATTR_REQ_LM"/>
+	<value value="59" name="A8XX_PERF_VPC_BE_LM_TRANSACTION"/>
+	<value value="60" name="A8XX_PERF_VPC_BE_PS_BUSY_CYCLES"/>
+	<value value="61" name="A8XX_PERF_VPC_BE_PS_WORKING_CYCLES"/>
+	<value value="62" name="A8XX_PERF_VPC_BE_STALL_CYCLES_CCHE"/>
+	<value value="63" name="A8XX_PERF_VPC_BE_STARVE_CYCLES_CCHE"/>
+	<value value="64" name="A8XX_PERF_VPC_BE_LM_FULL_WAIT_FOR_INTP_END"/>
+	<value value="65" name="A8XX_PERF_VPC_BE_CCHE_REQBUF_FULL"/>
+	<value value="66" name="A8XX_PERF_VPC_BE_CCHE_NUM_POS_REQ"/>
+	<value value="67" name="A8XX_PERF_VPC_BE_STALL_CYCLES_LM_ACK"/>
+	<value value="68" name="A8XX_PERF_VPC_BE_STALL_CYCLES_PRG_END_VPCPS"/>
+	<value value="69" name="A8XX_PERF_VPC_BE_POS_OVERFETCH_ATTR"/>
+	<value value="70" name="A8XX_PERF_VPC_BE_BOTTLENECK"/>
+</enum>
+
+<enum name="a8xx_tse_perfcounter_select">
+	<value value="0" name="A8XX_PERF_TSE_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_TSE_BE_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_TSE_BE_CLIPPING_CYCLES"/>
+	<value value="3" name="A8XX_PERF_TSE_BE_STALL_CYCLES_RAS"/>
+	<value value="4" name="A8XX_PERF_TSE_BE_STALL_CYCLES_LRZ_BARYPLANE"/>
+	<value value="5" name="A8XX_PERF_TSE_BE_STALL_CYCLES_LRZ_ZPLANE"/>
+	<value value="6" name="A8XX_PERF_TSE_BE_STARVE_CYCLES_PC"/>
+	<value value="7" name="A8XX_PERF_TSE_BE_INPUT_PRIM"/>
+	<value value="8" name="A8XX_PERF_TSE_BE_INPUT_NULL_PRIM"/>
+	<value value="9" name="A8XX_PERF_TSE_BE_TRIVAL_REJ_PRIM"/>
+	<value value="10" name="A8XX_PERF_TSE_BE_CLIPPED_PRIM"/>
+	<value value="11" name="A8XX_PERF_TSE_BE_ZERO_AREA_PRIM"/>
+	<value value="12" name="A8XX_PERF_TSE_BE_FACENESS_CULLED_PRIM"/>
+	<value value="13" name="A8XX_PERF_TSE_BE_ZERO_PIXEL_PRIM"/>
+	<value value="14" name="A8XX_PERF_TSE_BE_OUTPUT_NULL_PRIM"/>
+	<value value="15" name="A8XX_PERF_TSE_BE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="16" name="A8XX_PERF_TSE_BE_CINVOCATION"/>
+	<value value="17" name="A8XX_PERF_TSE_BE_CPRIMITIVES"/>
+	<value value="18" name="A8XX_PERF_TSE_BE_2D_INPUT_PRIM"/>
+	<value value="19" name="A8XX_PERF_TSE_BE_2D_ALIVE_CYCLES"/>
+	<value value="20" name="A8XX_PERF_TSE_BE_CLIP_PLANES"/>
+	<value value="21" name="A8XX_PERF_TSE_BE_EMPTY_BBOX_KILLED_PRIM"/>
+	<value value="22" name="A8XX_PERF_TSE_BE_ST1_VP_PARAMS_CACHE_MISS"/>
+	<value value="23" name="A8XX_PERF_TSE_BE_ST2_VPORT_VP_PARAMS_CACHE_MISS"/>
+	<value value="24" name="A8XX_PERF_TSE_BE_ST2_SCISSOR_VP_PARAMS_CACHE_MISS"/>
+	<value value="25" name="A8XX_PERF_TSE_BE_ILLEGAL_BOUNDING_BOX_PRIM"/>
+	<value value="26" name="A8XX_PERF_TSE_BE_VP_OUT_IS_NAN"/>
+	<value value="27" name="A8XX_PERF_TSE_BE_EXCLUDED_PRIM"/>
+	<value value="28" name="A8XX_PERF_TSE_BE_EARLY_CULL_CLIPPED_PRIM"/>
+	<value value="29" name="A8XX_PERF_TSE_BE_BR_STALLS_DUETO_BV_CLIP"/>
+	<value value="30" name="A8XX_PERF_TSE_BE_BR_STALLS_DUETO_BV_POLY"/>
+	<value value="31" name="A8XX_PERF_TSE_BE_BV_STALLS_DUETO_BR_CLIP"/>
+	<value value="32" name="A8XX_PERF_TSE_BE_BV_STALLS_DUETO_BR_POLY"/>
+	<value value="33" name="A8XX_PERF_TSE_BE_BV_STALLS_DUETO_BR"/>
+	<value value="34" name="A8XX_PERF_TSE_FE_BUSY_CYCLES"/>
+	<value value="35" name="A8XX_PERF_TSE_FE_STALL_CYCLES_VPC_US"/>
+	<value value="36" name="A8XX_PERF_TSE_FE_STARVE_CYCLES_PC"/>
+	<value value="37" name="A8XX_PERF_TSE_FE_INPUT_PRIM"/>
+	<value value="38" name="A8XX_PERF_TSE_FE_INPUT_NULL_PRIM"/>
+	<value value="39" name="A8XX_PERF_TSE_FE_TRIVAL_REJ_PRIM"/>
+	<value value="40" name="A8XX_PERF_TSE_FE_ZERO_AREA_PRIM"/>
+	<value value="41" name="A8XX_PERF_TSE_FE_FACENESS_CULLED_PRIM"/>
+	<value value="42" name="A8XX_PERF_TSE_FE_ZERO_PIXEL_PRIM"/>
+	<value value="43" name="A8XX_PERF_TSE_FE_OUTPUT_NULL_PRIM"/>
+	<value value="44" name="A8XX_PERF_TSE_FE_OUTPUT_VISIBLE_PRIM"/>
+	<value value="45" name="A8XX_PERF_TSE_FE_CINVOCATION"/>
+	<value value="46" name="A8XX_PERF_TSE_FE_CPRIMITIVES"/>
+	<value value="47" name="A8XX_PERF_TSE_FE_CLIP_PLANES"/>
+	<value value="48" name="A8XX_PERF_TSE_FE_EMPTY_BBOX_KILLED_PRIM"/>
+	<value value="49" name="A8XX_PERF_TSE_FE_ST1_VP_PARAMS_CACHE_MISS"/>
+	<value value="50" name="A8XX_PERF_TSE_FE_ST2_VPORT_VP_PARAMS_CACHE_MISS"/>
+	<value value="51" name="A8XX_PERF_TSE_FE_ST2_SCISSOR_VP_PARAMS_CACHE_MISS"/>
+	<value value="52" name="A8XX_PERF_TSE_FE_ILLEGAL_BOUNDING_BOX_PRIM"/>
+	<value value="53" name="A8XX_PERF_TSE_FE_VP_OUT_IS_NAN"/>
+	<value value="54" name="A8XX_PERF_TSE_FE_EXCLUDED_PRIM"/>
+	<value value="55" name="A8XX_PERF_TSE_FE_EARLY_CULL_CLIPPED_PRIM"/>
+	<value value="56" name="A8XX_PERF_TSE_FE_BR_STALLS_DUETO_BV_CLIP"/>
+	<value value="57" name="A8XX_PERF_TSE_FE_BR_STALLS_DUETO_BV_POLY"/>
+	<value value="58" name="A8XX_PERF_TSE_FE_BV_STALLS_DUETO_BR_CLIP"/>
+	<value value="59" name="A8XX_PERF_TSE_FE_BV_STALLS_DUETO_BR_POLY"/>
+	<value value="60" name="A8XX_PERF_TSE_FE_BV_STALLS_DUETO_BR"/>
+	<value value="61" name="A8XX_PERF_TSE_BE_STALL_CYCLES_LRZ_PRIM"/>
+	<value value="62" name="A8XX_PERF_TSE_FE_EARLY_BFCULL_GBCLIPPED_PRIM"/>
+	<value value="63" name="A8XX_PERF_TSE_REG_PROGRAMMING_WORKING_CYCLE_L1"/>
+	<value value="64" name="A8XX_PERF_TSE_REG_PROGRAMMING_ONLY_CYCLE_L0"/>
+	<value value="65" name="A8XX_PERF_TSE_COMMON_RAM_WORKING_CYCLE_L2"/>
+	<value value="66" name="A8XX_PERF_TSE_COMMON_RAM_RD_WORKING_CYCLE_L3"/>
+	<value value="67" name="A8XX_PERF_TSE_COMMON_RAM_WR_WORKING_CYCLE_L3"/>
+	<value value="68" name="A8XX_PERF_TSE_CLIP_CODE_WORKING_CYCLE_L1"/>
+	<value value="69" name="A8XX_PERF_TSE_CLIP_WORKING_CYCLE_L1"/>
+	<value value="70" name="A8XX_PERF_TSE_CLIP_CTRL_WORKING_CYCLE_L2"/>
+	<value value="71" name="A8XX_PERF_TSE_CLIP_VP_FMUL_WORKING_CYCLE_L2"/>
+	<value value="72" name="A8XX_PERF_TSE_CLIP_VP_FMUL_0_WORKING_CYCLE_L3"/>
+	<value value="73" name="A8XX_PERF_TSE_CLIP_VP_FMUL_1_WORKING_CYCLE_L3"/>
+	<value value="74" name="A8XX_PERF_TSE_CLIP_VP_FMUL_2_WORKING_CYCLE_L3"/>
+	<value value="75" name="A8XX_PERF_TSE_CLIP_VP_FMUL_3_WORKING_CYCLE_L3"/>
+	<value value="76" name="A8XX_PERF_TSE_CLIP_VP_FMUL_4_WORKING_CYCLE_L3"/>
+	<value value="77" name="A8XX_PERF_TSE_CLIP_VP_FMUL_5_WORKING_CYCLE_L3"/>
+	<value value="78" name="A8XX_PERF_TSE_CLIP_VP_FADD_WORKING_CYCLE_L2"/>
+	<value value="79" name="A8XX_PERF_TSE_CLIP_VP_FADD_0_WORKING_CYCLE_L3"/>
+	<value value="80" name="A8XX_PERF_TSE_CLIP_VP_FADD_1_WORKING_CYCLE_L3"/>
+	<value value="81" name="A8XX_PERF_TSE_CLIP_VP_FADD_2_WORKING_CYCLE_L3"/>
+	<value value="82" name="A8XX_PERF_TSE_CLIP_VP_RCP_WORKING_CYCLE_L2"/>
+	<value value="83" name="A8XX_PERF_TSE_VP_TRANSFORM_WORKING_CYCLE_L1"/>
+	<value value="84" name="A8XX_PERF_TSE_VP0_TRANSFORM_WORKING_CYCLE_L2"/>
+	<value value="85" name="A8XX_PERF_TSE_VP1_TRANSFORM_WORKING_CYCLE_L2"/>
+	<value value="86" name="A8XX_PERF_TSE_VP2_TRANSFORM_WORKING_CYCLE_L2"/>
+	<value value="87" name="A8XX_PERF_TSE_VERTEX_GEN_WORKING_CYCLE_L1"/>
+	<value value="88" name="A8XX_PERF_TSE_DET_WORKING_CYCLE_L1"/>
+	<value value="89" name="A8XX_PERF_TSE_BBOX_WORKING_CYCLE_L1"/>
+	<value value="90" name="A8XX_PERF_TSE_CULLING_WORKING_CYCLE_L1"/>
+	<value value="91" name="A8XX_PERF_TSE_SETUP_WORKING_CYCLE_L1"/>
+	<value value="92" name="A8XX_PERF_TSE_SETUP_CTRL_WORKING_CYCLE_L2"/>
+	<value value="93" name="A8XX_PERF_TSE_SETUP_FDP3_WORKING_CYCLE_L2"/>
+	<value value="94" name="A8XX_PERF_TSE_SETUP_FDP3_0_WORKING_CYCLE_L3"/>
+	<value value="95" name="A8XX_PERF_TSE_SETUP_FDP3_1_WORKING_CYCLE_L3"/>
+	<value value="96" name="A8XX_PERF_TSE_SETUP_FDP3_2_WORKING_CYCLE_L3"/>
+	<value value="97" name="A8XX_PERF_TSE_SETUP_FDP3_3_WORKING_CYCLE_L3"/>
+	<value value="98" name="A8XX_PERF_TSE_SETUP_FDP3_4_WORKING_CYCLE_L3"/>
+	<value value="99" name="A8XX_PERF_TSE_SETUP_FDP3_5_WORKING_CYCLE_L3"/>
+	<value value="100" name="A8XX_PERF_TSE_SETUP_FMUL_WORKING_CYCLE_L2"/>
+	<value value="101" name="A8XX_PERF_TSE_SETUP_FMUL_0_WORKING_CYCLE_L3"/>
+	<value value="102" name="A8XX_PERF_TSE_SETUP_FMUL_1_WORKING_CYCLE_L3"/>
+	<value value="103" name="A8XX_PERF_TSE_SETUP_FMUL_2_WORKING_CYCLE_L3"/>
+	<value value="104" name="A8XX_PERF_TSE_SETUP_FMUL_3_WORKING_CYCLE_L3"/>
+	<value value="105" name="A8XX_PERF_TSE_SETUP_FMUL_4_WORKING_CYCLE_L3"/>
+	<value value="106" name="A8XX_PERF_TSE_SETUP_FMUL_5_WORKING_CYCLE_L3"/>
+	<value value="107" name="A8XX_PERF_TSE_EDGE_SETUP_WORKING_CYCLE_L1"/>
+	<value value="108" name="A8XX_PERF_TSE_EDGE_SETUP_IMUL_WORKING_CYCLE_L2"/>
+	<value value="109" name="A8XX_PERF_TSE_RAS_INTF_WORKING_CYCLE_L1"/>
+	<value value="110" name="A8XX_PERF_TSE_LRZ_Z_INTF_WORKING_CYCLE_L1"/>
+	<value value="111" name="A8XX_PERF_TSE_LRZ_BARY_INTF_WORKING_CYCLE_L1"/>
+	<value value="112" name="A8XX_PERF_TSE_NON_CLIP_WORKING_CYCLES"/>
+	<value value="113" name="A8XX_PERF_TSE_NULL_WORKING_CYCLES"/>
+	<value value="114" name="A8XX_PERF_TSE_OUT_PRIM_WORKING_CYCLES"/>
+	<value value="115" name="A8XX_PERF_TSE_INPUT_VERTEX_WORKING_CYCLES"/>
+	<value value="116" name="A8XX_PERF_TSE_MVC_STALL_VPC"/>
+	<value value="117" name="A8XX_PERF_TSE_VPC_STARVE_TSE"/>
+	<value value="118" name="A8XX_PERF_TSE_WORKING_CYCLE_L0"/>
+</enum>
+
+<enum name="a8xx_ras_perfcounter_select">
+	<value value="0" name="A8XX_PERF_RAS_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_RAS_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_RAS_SUPERTILE_ACTIVE_CYCLES"/>
+	<value value="3" name="A8XX_PERF_RAS_STALL_CYCLES_LRZ"/>
+	<value value="4" name="A8XX_PERF_RAS_STARVE_CYCLES_TSE"/>
+	<value value="5" name="A8XX_PERF_RAS_SUPER_TILES"/>
+	<value value="6" name="A8XX_PERF_RAS_8X4_TILES"/>
+	<value value="7" name="A8XX_PERF_RAS_MASKGEN_ACTIVE"/>
+	<value value="8" name="A8XX_PERF_RAS_FULLY_COVERED_SUPER_TILES"/>
+	<value value="9" name="A8XX_PERF_RAS_FULLY_COVERED_8X4_TILES"/>
+	<value value="10" name="A8XX_PERF_RAS_PRIM_KILLED_INVISILBE"/>
+	<value value="11" name="A8XX_PERF_RAS_SUPERTILE_GEN_ACTIVE_CYCLES"/>
+	<value value="12" name="A8XX_PERF_RAS_LRZ_INTF_WORKING_CYCLES"/>
+	<value value="13" name="A8XX_PERF_RAS_BLOCKS"/>
+	<value value="14" name="A8XX_PERF_RAS_FALSE_PARTIAL_STILE"/>
+	<value value="15" name="A8XX_PERF_RAS_SLICE_BLOCK_NONEMTPY"/>
+	<value value="16" name="A8XX_PERF_RAS_SLICE_BLOCK_EMPTY"/>
+	<value value="17" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_0_WORKING_CC_L2"/>
+	<value value="18" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_1_WORKING_CC_L2"/>
+	<value value="19" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_2_WORKING_CC_L2"/>
+	<value value="20" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_3_WORKING_CC_L2"/>
+	<value value="21" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_4_WORKING_CC_L2"/>
+	<value value="22" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_5_WORKING_CC_L2"/>
+	<value value="23" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_6_WORKING_CC_L2"/>
+	<value value="24" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_7_WORKING_CC_L2"/>
+	<value value="25" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_8_WORKING_CC_L2"/>
+	<value value="26" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_9_WORKING_CC_L2"/>
+	<value value="27" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_10_WORKING_CC_L2"/>
+	<value value="28" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_11_WORKING_CC_L2"/>
+	<value value="29" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_12_WORKING_CC_L2"/>
+	<value value="30" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_13_WORKING_CC_L2"/>
+	<value value="31" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_14_WORKING_CC_L2"/>
+	<value value="32" name="A8XX_PERF_RAS_SAMPLE_MASK_GEN_LANE_15_WORKING_CC_L2"/>
+	<value value="33" name="A8XX_PERF_RAS_EMPTY_SBLOCK_SCAN_CYCLE_PERFCOUNTER"/>
+	<value value="34" name="A8XX_PERF_RAS_STEGN_STALL_BY_LATENCY_FIFO"/>
+	<value value="35" name="A8XX_PERF_RAS_STALL_CYCLES_LRZ_PREFETCH"/>
+	<value value="36" name="A8XX_PERF_RAS_STGEN_BOTTLENECK_CYCLES"/>
+	<value value="37" name="A8XX_PERF_RAS_MTGEN_BOTTLENECK_CYCLES"/>
+	<value value="38" name="A8XX_PERF_RAS_TGEN_BOTTLENECK_CYCLES"/>
+</enum>
+
+<enum name="a8xx_uche_perfcounter_select">
+	<value value="0" name="A8XX_PERF_UCHE_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_UCHE_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_UCHE_STALL_CYCLES_ARBITER"/>
+	<value value="3" name="A8XX_PERF_UCHE_VBIF_STALL_WRITE_DATA"/>
+	<value value="4" name="A8XX_PERF_UCHE_STARVED_CYCLES_VBIF_DECMP"/>
+	<value value="5" name="A8XX_PERF_UCHE_STALL_CYCLES_DECMP"/>
+	<value value="6" name="A8XX_PERF_UCHE_ARBITER_STALL_CYCLES_VBIF"/>
+	<value value="7" name="A8XX_PERF_UCHE_VBIF_LATENCY_CYCLES"/>
+	<value value="8" name="A8XX_PERF_UCHE_VBIF_LATENCY_SAMPLES"/>
+	<value value="9" name="A8XX_PERF_UCHE_DCMP_LATENCY_SAMPLES"/>
+	<value value="10" name="A8XX_PERF_UCHE_DCMP_LATENCY_CYCLES"/>
+	<value value="11" name="A8XX_PERF_UCHE_READ_REQUESTS_SP"/>
+	<value value="12" name="A8XX_PERF_UCHE_READ_REQUESTS_TP"/>
+	<value value="13" name="A8XX_PERF_UCHE_READ_REQUESTS_TP_UBWC"/>
+	<value value="14" name="A8XX_PERF_UCHE_READ_REQUESTS_TP_GBIF"/>
+	<value value="15" name="A8XX_PERF_UCHE_READ_REQUESTS_TP_GMEM"/>
+	<value value="16" name="A8XX_PERF_UCHE_READ_REQUESTS_VFD"/>
+	<value value="17" name="A8XX_PERF_UCHE_READ_REQUESTS_VPC"/>
+	<value value="18" name="A8XX_PERF_UCHE_READ_REQUESTS_HLSQ"/>
+	<value value="19" name="A8XX_PERF_UCHE_READ_REQUESTS_LRZ"/>
+	<value value="20" name="A8XX_PERF_UCHE_READ_REQUESTS_PC"/>
+	<value value="21" name="A8XX_PERF_UCHE_WRITE_REQUESTS_SP"/>
+	<value value="22" name="A8XX_PERF_UCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="23" name="A8XX_PERF_UCHE_WRITE_REQUESTS_VPC"/>
+	<value value="24" name="A8XX_PERF_UCHE_WRITE_REQUESTS_VSC"/>
+	<value value="25" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_SP"/>
+	<value value="26" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_TP"/>
+	<value value="27" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_VFD"/>
+	<value value="28" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_VPC"/>
+	<value value="29" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_HLSQ"/>
+	<value value="30" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_LRZ"/>
+	<value value="31" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_PC"/>
+	<value value="32" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_CH0"/>
+	<value value="33" name="A8XX_PERF_UCHE_VBIF_READ_BEATS_CH1"/>
+	<value value="34" name="A8XX_PERF_UCHE_VBIF_WRITE_BEATS_CH0"/>
+	<value value="35" name="A8XX_PERF_UCHE_VBIF_WRITE_BEATS_CH1"/>
+	<value value="36" name="A8XX_PERF_UCHE_GMEM_READ_BEATS"/>
+	<value value="37" name="A8XX_PERF_UCHE_GMEM_WRITE_BEATS"/>
+	<value value="38" name="A8XX_PERF_UCHE_UBWC_READ_BEATS"/>
+	<value value="39" name="A8XX_PERF_UCHE_UBWC_WRITE_BEATS"/>
+	<value value="40" name="A8XX_PERF_UCHE_EVICTS"/>
+	<value value="41" name="A8XX_PERF_UCHE_BANK_REQ0"/>
+	<value value="42" name="A8XX_PERF_UCHE_BANK_REQ1"/>
+	<value value="43" name="A8XX_PERF_UCHE_BANK_REQ2"/>
+	<value value="44" name="A8XX_PERF_UCHE_BANK_REQ3"/>
+	<value value="45" name="A8XX_PERF_UCHE_BANK_REQ4"/>
+	<value value="46" name="A8XX_PERF_UCHE_BANK_REQ5"/>
+	<value value="47" name="A8XX_PERF_UCHE_BANK_REQ6"/>
+	<value value="48" name="A8XX_PERF_UCHE_BANK_REQ7"/>
+	<value value="49" name="A8XX_PERF_UCHE_TPH_REF_FULL"/>
+	<value value="50" name="A8XX_PERF_UCHE_TPH_VICTIM_FULL"/>
+	<value value="51" name="A8XX_PERF_UCHE_TPH_EXT_FULL"/>
+	<value value="52" name="A8XX_PERF_UCHE_RAM_READ_REQ"/>
+	<value value="53" name="A8XX_PERF_UCHE_RAM_WRITE_REQ"/>
+	<value value="54" name="A8XX_PERF_UCHE_LONG_LINE_ALL_EVICTS"/>
+	<value value="55" name="A8XX_PERF_UCHE_LONG_LINE_PARTIAL_EVICTS"/>
+	<value value="56" name="A8XX_PERF_UCHE_TPH_CONFLICT_CL_CCHE"/>
+	<value value="57" name="A8XX_PERF_UCHE_TPH_CONFLICT_CL_OTHER"/>
+	<value value="58" name="A8XX_PERF_UCHE_DBANK_CONFLICT_CL_CCHE"/>
+	<value value="59" name="A8XX_PERF_UCHE_DBANK_CONFLICT_CL_OTHER_CLIENTS"/>
+	<value value="60" name="A8XX_PERF_UCHE_CCHE_TPH_QUEUE_FULL"/>
+	<value value="61" name="A8XX_PERF_UCHE_CCHE_DPH_IO_QUEUE_FULL"/>
+	<value value="62" name="A8XX_PERF_UCHE_CCHE_DPH_CMDPOOL_FULL"/>
+	<value value="63" name="A8XX_PERF_UCHE_EVICTS_SP"/>
+	<value value="64" name="A8XX_PERF_UCHE_EVICTS_LRZ"/>
+	<value value="65" name="A8XX_PERF_UCHE_READ_REQUESTS_VPCUS"/>
+	<value value="66" name="A8XX_PERF_UCHE_READ_REQUESTS_VFD_BYPASS_BV"/>
+	<value value="67" name="A8XX_PERF_UCHE_READ_REQUESTS_VFD_BYPASS_BR"/>
+	<value value="68" name="A8XX_PERF_BYPC_FULL"/>
+	<value value="69" name="A8XX_PERF_BYPC_FULL_CCHE_STALL"/>
+	<value value="70" name="A8XX_PERF_BYPC_VHUB_STALL"/>
+	<value value="71" name="A8XX_PERF_BYPD_FULL"/>
+	<value value="72" name="A8XX_PERF_BYPD_FULL_GBIF_STALL"/>
+	<value value="73" name="A8XX_PERF_VHUB_PTABLE_FULL"/>
+	<value value="74" name="A8XX_PERF_DHUB_PTABLE_FULL"/>
+	<value value="75" name="A8XX_PERF_UCHE_RESERVED_75"/>
+	<value value="76" name="A8XX_PERF_UCHE_RESERVED_76"/>
+	<value value="77" name="A8XX_PERF_UCHE_RESERVED_77"/>
+	<value value="78" name="A8XX_PERF_UCHE_RESERVED_78"/>
+	<value value="79" name="A8XX_PERF_UCHE_RESERVED_79"/>
+	<value value="80" name="A8XX_PERF_UCHE_RESERVED_80"/>
+	<value value="81" name="A8XX_PERF_UCHE_RESERVED_81"/>
+	<value value="82" name="A8XX_PERF_UCHE_RESERVED_82"/>
+	<value value="83" name="A8XX_PERF_UCHE_RESERVED_83"/>
+	<value value="84" name="A8XX_PERF_UCHE_RESERVED_84"/>
+	<value value="85" name="A8XX_PERF_UCHE_RESERVED_85"/>
+	<value value="86" name="A8XX_PERF_UCHE_RESERVED_86"/>
+	<value value="87" name="A8XX_PERF_UCHE_RESERVED_87"/>
+	<value value="88" name="A8XX_PERF_UCHE_RESERVED_88"/>
+	<value value="89" name="A8XX_PERF_UCHE_RESERVED_89"/>
+	<value value="90" name="A8XX_PERF_UCHE_RESERVED_90"/>
+	<value value="91" name="A8XX_PERF_UCHE_RESERVED_91"/>
+	<value value="92" name="A8XX_PERF_UCHE_RESERVED_92"/>
+	<value value="93" name="A8XX_PERF_UCHE_RESERVED_93"/>
+	<value value="94" name="A8XX_PERF_UCHE_RESERVED_94"/>
+	<value value="95" name="A8XX_PERF_UCHE_RESERVED_95"/>
+	<value value="96" name="A8XX_PERF_UCHE_RESERVED_96"/>
+	<value value="97" name="A8XX_PERF_UCHE_RESERVED_97"/>
+	<value value="98" name="A8XX_PERF_UCHE_RESERVED_98"/>
+	<value value="99" name="A8XX_PERF_UCHE_RESERVED_99"/>
+	<value value="100" name="A8XX_PERF_UCHE_RESERVED_100"/>
+	<value value="101" name="A8XX_PERF_UCHE_RESERVED_101"/>
+	<value value="102" name="A8XX_PERF_UCHE_RESERVED_102"/>
+	<value value="103" name="A8XX_PERF_UCHE_RESERVED_103"/>
+	<value value="104" name="A8XX_PERF_UCHE_RESERVED_104"/>
+	<value value="105" name="A8XX_PERF_UCHE_RESERVED_105"/>
+	<value value="106" name="A8XX_PERF_UCHE_RESERVED_106"/>
+	<value value="107" name="A8XX_PERF_UCHE_RESERVED_107"/>
+	<value value="108" name="A8XX_PERF_UCHE_RESERVED_108"/>
+	<value value="109" name="A8XX_PERF_UCHE_RESERVED_109"/>
+	<value value="110" name="A8XX_PERF_UCHE_RESERVED_110"/>
+	<value value="111" name="A8XX_PERF_UCHE_RESERVED_111"/>
+	<value value="112" name="A8XX_PERF_UCHE_RESERVED_112"/>
+	<value value="113" name="A8XX_PERF_UCHE_RESERVED_113"/>
+	<value value="114" name="A8XX_PERF_UCHE_RESERVED_114"/>
+	<value value="115" name="A8XX_PERF_UCHE_RESERVED_115"/>
+	<value value="116" name="A8XX_PERF_UCHE_RESERVED_116"/>
+	<value value="117" name="A8XX_PERF_UCHE_RESERVED_117"/>
+	<value value="118" name="A8XX_PERF_UCHE_RESERVED_118"/>
+	<value value="119" name="A8XX_PERF_UCHE_RESERVED_119"/>
+	<value value="120" name="A8XX_PERF_UCHE_RESERVED_120"/>
+	<value value="121" name="A8XX_PERF_UCHE_RESERVED_121"/>
+	<value value="122" name="A8XX_PERF_UCHE_RESERVED_122"/>
+	<value value="123" name="A8XX_PERF_UCHE_RESERVED_123"/>
+	<value value="124" name="A8XX_PERF_UCHE_RESERVED_124"/>
+	<value value="125" name="A8XX_PERF_UCHE_RESERVED_125"/>
+	<value value="126" name="A8XX_PERF_UCHE_RESERVED_126"/>
+	<value value="127" name="A8XX_PERF_UCHE_RESERVED_127"/>
+	<value value="128" name="A8XX_PERF_CCHE_BUSY_CYCLES"/>
+	<value value="129" name="A8XX_PERF_CCHE_STALL_CYCLES_UCHE"/>
+	<value value="130" name="A8XX_PERF_CCHE_UCHE_STALL_WRITE_DATA"/>
+	<value value="131" name="A8XX_PERF_CCHE_UCHE_LATENCY_CYCLES"/>
+	<value value="132" name="A8XX_PERF_CCHE_UCHE_LATENCY_SAMPLES"/>
+	<value value="133" name="A8XX_PERF_CCHE_READ_REQUESTS_SP_TOTAL"/>
+	<value value="134" name="A8XX_PERF_CCHE_READ_REQUESTS_SP_UBWC"/>
+	<value value="135" name="A8XX_PERF_CCHE_READ_REQUESTS_SP_GBIF"/>
+	<value value="136" name="A8XX_PERF_CCHE_READ_REQUESTS_SP_GMEM"/>
+	<value value="137" name="A8XX_PERF_CCHE_READ_REQUESTS_TP_TOTAL"/>
+	<value value="138" name="A8XX_PERF_CCHE_READ_REQUESTS_TP_UBWC"/>
+	<value value="139" name="A8XX_PERF_CCHE_READ_REQUESTS_TP_GBIF"/>
+	<value value="140" name="A8XX_PERF_CCHE_READ_REQUESTS_TP_GMEM"/>
+	<value value="141" name="A8XX_PERF_CCHE_READ_REQUESTS_VFD_TOTAL"/>
+	<value value="142" name="A8XX_PERF_CCHE_READ_REQUEST_VFD_GMEM"/>
+	<value value="143" name="A8XX_PERF_CCHE_READ_REQUEST_VFD_GBIF"/>
+	<value value="144" name="A8XX_PERF_CCHE_READ_REQUESTS_LRZ"/>
+	<value value="145" name="A8XX_PERF_CCHE_READ_REQUESTS_VPC"/>
+	<value value="146" name="A8XX_PERF_CCHE_WRITE_REQUESTS_SP"/>
+	<value value="147" name="A8XX_PERF_CCHE_WRITE_REQUESTS_LRZ"/>
+	<value value="148" name="A8XX_PERF_CCHE_READ_REQUESTS_GMEM"/>
+	<value value="149" name="A8XX_PERF_CCHE_WRITE_REQUESTS_GMEM"/>
+	<value value="150" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_TP"/>
+	<value value="151" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_VFD"/>
+	<value value="152" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_SP"/>
+	<value value="153" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_VPC"/>
+	<value value="154" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_LRZ"/>
+	<value value="155" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_CH0"/>
+	<value value="156" name="A8XX_PERF_CCHE_UCHE_READ_BEATS_CH1"/>
+	<value value="157" name="A8XX_PERF_CCHE_GMEM_READ_BEATS_VPC"/>
+	<value value="158" name="A8XX_PERF_CCHE_GMEM_READ_BEATS_TP"/>
+	<value value="159" name="A8XX_PERF_CCHE_GMEM_READ_BEATS_SP"/>
+	<value value="160" name="A8XX_PERF_CCHE_GMEM_READ_BEATS_VFD"/>
+	<value value="161" name="A8XX_PERF_CCHE_BANK_REQ0"/>
+	<value value="162" name="A8XX_PERF_CCHE_BANK_REQ1"/>
+	<value value="163" name="A8XX_PERF_CCHE_BANK_REQ2"/>
+	<value value="164" name="A8XX_PERF_CCHE_BANK_REQ3"/>
+	<value value="165" name="A8XX_PERF_CCHE_BANK_REQ4"/>
+	<value value="166" name="A8XX_PERF_CCHE_BANK_REQ5"/>
+	<value value="167" name="A8XX_PERF_CCHE_BANK_REQ6"/>
+	<value value="168" name="A8XX_PERF_CCHE_BANK_REQ7"/>
+	<value value="169" name="A8XX_PERF_CCHE_BANK_REQ8"/>
+	<value value="170" name="A8XX_PERF_CCHE_BANK_REQ9"/>
+	<value value="171" name="A8XX_PERF_CCHE_BANK_REQ10"/>
+	<value value="172" name="A8XX_PERF_CCHE_BANK_REQ11"/>
+	<value value="173" name="A8XX_PERF_CCHE_BANK_REQ12"/>
+	<value value="174" name="A8XX_PERF_CCHE_BANK_REQ13"/>
+	<value value="175" name="A8XX_PERF_CCHE_BANK_REQ14"/>
+	<value value="176" name="A8XX_PERF_CCHE_BANK_REQ15"/>
+	<value value="177" name="A8XX_PERF_CCHE_GBANK_REQ0"/>
+	<value value="178" name="A8XX_PERF_CCHE_GBANK_REQ1"/>
+	<value value="179" name="A8XX_PERF_CCHE_GBANK_REQ2"/>
+	<value value="180" name="A8XX_PERF_CCHE_GBANK_REQ3"/>
+	<value value="181" name="A8XX_PERF_CCHE_TPH_REF_FULL"/>
+	<value value="182" name="A8XX_PERF_CCHE_TPH_VICTIM_FULL"/>
+	<value value="183" name="A8XX_PERF_CCHE_TPH_EXT_FULL"/>
+	<value value="184" name="A8XX_PERF_CCHE_RAM_READ_REQ"/>
+	<value value="185" name="A8XX_PERF_CCHE_RAM_WRITE_REQ"/>
+	<value value="186" name="A8XX_PERF_CCHE_TPH_CONFLICT_CL"/>
+	<value value="187" name="A8XX_PERF_CCHE_DBANK_CONFLICT"/>
+	<value value="188" name="A8XX_PERF_CCHE_TPH_QUEUE_FULL"/>
+	<value value="189" name="A8XX_PERF_CCHE_DPH_QUEUE_FULL"/>
+	<value value="190" name="A8XX_PERF_CCHE_OPH_QUEUE_FULL"/>
+	<value value="191" name="A8XX_PERF_CCHE_WACK_QUEUE_FULL"/>
+	<value value="192" name="A8XX_PERF_CCHE_GMEM0_LOCAL_RD_REQUEST"/>
+	<value value="193" name="A8XX_PERF_CCHE_GMEM0_LOCAL_WR_REQUEST"/>
+	<value value="194" name="A8XX_PERF_CCHE_GMEM1_LOCAL_RD_REQUEST"/>
+	<value value="195" name="A8XX_PERF_CCHE_GMEM1_LOCAL_WR_REQUEST"/>
+	<value value="196" name="A8XX_PERF_CCHE_GMEM0_REMOTE_RD_REQUEST"/>
+	<value value="197" name="A8XX_PERF_CCHE_GMEM0_REMOTE_WR_REQUEST"/>
+	<value value="198" name="A8XX_PERF_CCHE_GMEM1_REMOTE_RD_REQUEST"/>
+	<value value="199" name="A8XX_PERF_CCHE_GMEM1_REMOTE_WR_REQUEST"/>
+	<value value="200" name="A8XX_PERF_CCHE_STALL_CYCLES_TP"/>
+	<value value="201" name="A8XX_PERF_CCHE_ATOMIC_REQUESTS_SP_TOTAL"/>
+	<value value="202" name="A8XX_PERF_CCHE_ATOMIC_PACKING_BEAT_SP_TOTAL"/>
+</enum>
+
+<enum name="a8xx_tp_perfcounter_select">
+	<value value="0" name="A8XX_PERF_TP_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_TP_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_TP_STALL_CYCLES_UCHE"/>
+	<value value="3" name="A8XX_PERF_TP_LATENCY_CYCLES"/>
+	<value value="4" name="A8XX_PERF_TP_LATENCY_TRANS"/>
+	<value value="5" name="A8XX_PERF_TP_FLAG_FIFO_DELAY_SAMPLES"/>
+	<value value="6" name="A8XX_PERF_TP_FLAG_FIFO_DELAY_CYCLES"/>
+	<value value="7" name="A8XX_PERF_TP_L1_CACHELINE_REQUESTS"/>
+	<value value="8" name="A8XX_PERF_TP_L1_CACHELINE_MISSES"/>
+	<value value="9" name="A8XX_PERF_TP_SP_TP_TRANS"/>
+	<value value="10" name="A8XX_PERF_TP_TP_SP_TRANS"/>
+	<value value="11" name="A8XX_PERF_TP_OUTPUT_PIXELS"/>
+	<value value="12" name="A8XX_PERF_TP_FILTER_WORKLOAD_16BIT"/>
+	<value value="13" name="A8XX_PERF_TP_FILTER_WORKLOAD_32BIT"/>
+	<value value="14" name="A8XX_PERF_TP_QUADS_RECEIVED"/>
+	<value value="15" name="A8XX_PERF_TP_QUADS_OFFSET"/>
+	<value value="16" name="A8XX_PERF_TP_QUADS_SHADOW"/>
+	<value value="17" name="A8XX_PERF_TP_QUADS_ARRAY"/>
+	<value value="18" name="A8XX_PERF_TP_QUADS_GRADIENT"/>
+	<value value="19" name="A8XX_PERF_TP_QUADS_1D"/>
+	<value value="20" name="A8XX_PERF_TP_QUADS_2D"/>
+	<value value="21" name="A8XX_PERF_TP_QUADS_BUFFER"/>
+	<value value="22" name="A8XX_PERF_TP_QUADS_3D"/>
+	<value value="23" name="A8XX_PERF_TP_QUADS_CUBE"/>
+	<value value="24" name="A8XX_PERF_TP_DIVERGENT_QUADS_RECEIVED"/>
+	<value value="25" name="A8XX_PERF_TP_PRT_NON_RESIDENT_EVENTS"/>
+	<value value="26" name="A8XX_PERF_TP_OUTPUT_PIXELS_POINT"/>
+	<value value="27" name="A8XX_PERF_TP_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="28" name="A8XX_PERF_TP_OUTPUT_PIXELS_MIP"/>
+	<value value="29" name="A8XX_PERF_TP_OUTPUT_PIXELS_ANISO"/>
+	<value value="30" name="A8XX_PERF_TP_OUTPUT_PIXELS_ZERO_LOD"/>
+	<value value="31" name="A8XX_PERF_TP_FLAG_CACHE_REQUESTS"/>
+	<value value="32" name="A8XX_PERF_TP_FLAG_CACHE_MISSES"/>
+	<value value="33" name="A8XX_PERF_TP_L1_5_L2_REQUESTS"/>
+	<value value="34" name="A8XX_PERF_TP_2D_OUTPUT_PIXELS"/>
+	<value value="35" name="A8XX_PERF_TP_2D_OUTPUT_PIXELS_POINT"/>
+	<value value="36" name="A8XX_PERF_TP_2D_OUTPUT_PIXELS_BILINEAR"/>
+	<value value="37" name="A8XX_PERF_TP_2D_FILTER_WORKLOAD_16BIT"/>
+	<value value="38" name="A8XX_PERF_TP_2D_FILTER_WORKLOAD_32BIT"/>
+	<value value="39" name="A8XX_PERF_TP_TPA2TPC_TRANS"/>
+	<value value="40" name="A8XX_PERF_TP_L1_MISSES_ASTC_1TILE"/>
+	<value value="41" name="A8XX_PERF_TP_L1_MISSES_ASTC_2TILE"/>
+	<value value="42" name="A8XX_PERF_TP_L1_MISSES_ASTC_4TILE"/>
+	<value value="43" name="A8XX_PERF_TP_L1_5_COMPRESS_REQS"/>
+	<value value="44" name="A8XX_PERF_TP_L1_5_L2_COMPRESS_MISS"/>
+	<value value="45" name="A8XX_PERF_TP_L1_BANK_CONFLICT"/>
+	<value value="46" name="A8XX_PERF_TP_L1_5_MISS_LATENCY_CYCLES"/>
+	<value value="47" name="A8XX_PERF_TP_L1_5_MISS_LATENCY_TRANS"/>
+	<value value="48" name="A8XX_PERF_TP_QUADS_CONSTANT_MULTIPLIED"/>
+	<value value="49" name="A8XX_PERF_TP_FRONTEND_WORKING_CYCLES"/>
+	<value value="50" name="A8XX_PERF_TP_L1_TAG_WORKING_CYCLES"/>
+	<value value="51" name="A8XX_PERF_TP_L1_DATA_WRITE_WORKING_CYCLES"/>
+	<value value="52" name="A8XX_PERF_TP_PRE_L1_DECOM_WORKING_CYCLES"/>
+	<value value="53" name="A8XX_PERF_TP_BACKEND_WORKING_CYCLES"/>
+	<value value="54" name="A8XX_PERF_TP_L1_5_CACHE_WORKING_CYCLES"/>
+	<value value="55" name="A8XX_PERF_TP_STARVE_CYCLES_SP"/>
+	<value value="56" name="A8XX_PERF_TP_STARVE_CYCLES_UCHE"/>
+	<value value="57" name="A8XX_PERF_TP_STALL_CYCLES_UFC"/>
+	<value value="58" name="A8XX_PERF_TP_FORMAT_DECOMP_POINT"/>
+	<value value="59" name="A8XX_PERF_TP_FILTER_POINT_FP16"/>
+	<value value="60" name="A8XX_PERF_TP_FILTER_POINT_FP32"/>
+	<value value="61" name="A8XX_PERF_TP_LATENCY_FIFO_FULL"/>
+	<value value="62" name="A8XX_PERF_TP_RESERVED_62"/>
+	<value value="63" name="A8XX_PERF_TP_RESERVED_63"/>
+	<value value="64" name="A8XX_PERF_TP_RESERVED_64"/>
+	<value value="65" name="A8XX_PERF_TP_RESERVED_65"/>
+	<value value="66" name="A8XX_PERF_TP_RESERVED_66"/>
+	<value value="67" name="A8XX_PERF_TP_RESERVED_67"/>
+	<value value="68" name="A8XX_PERF_TP_RESERVED_68"/>
+	<value value="69" name="A8XX_PERF_TP_RESERVED_69"/>
+	<value value="70" name="A8XX_PERF_TP_RESERVED_70"/>
+	<value value="71" name="A8XX_PERF_TP_RESERVED_71"/>
+	<value value="72" name="A8XX_PERF_TP_RESERVED_72"/>
+	<value value="73" name="A8XX_PERF_TP_RESERVED_73"/>
+	<value value="74" name="A8XX_PERF_TP_RESERVED_74"/>
+	<value value="75" name="A8XX_PERF_TP_RESERVED_75"/>
+	<value value="76" name="A8XX_PERF_TP_RESERVED_76"/>
+	<value value="77" name="A8XX_PERF_TP_RESERVED_77"/>
+	<value value="78" name="A8XX_PERF_TP_RESERVED_78"/>
+	<value value="79" name="A8XX_PERF_TP_RESERVED_79"/>
+	<value value="80" name="A8XX_PERF_TP_RESERVED_80"/>
+	<value value="81" name="A8XX_PERF_TP_RESERVED_81"/>
+	<value value="82" name="A8XX_PERF_TP_RESERVED_82"/>
+	<value value="83" name="A8XX_PERF_TP_RESERVED_83"/>
+	<value value="84" name="A8XX_PERF_TP_RESERVED_84"/>
+	<value value="85" name="A8XX_PERF_TP_RESERVED_85"/>
+	<value value="86" name="A8XX_PERF_TP_RESERVED_86"/>
+	<value value="87" name="A8XX_PERF_TP_RESERVED_87"/>
+	<value value="88" name="A8XX_PERF_TP_RESERVED_88"/>
+	<value value="89" name="A8XX_PERF_TP_RESERVED_89"/>
+	<value value="90" name="A8XX_PERF_TP_RESERVED_90"/>
+	<value value="91" name="A8XX_PERF_TP_RESERVED_91"/>
+	<value value="92" name="A8XX_PERF_TP_RESERVED_92"/>
+	<value value="93" name="A8XX_PERF_TP_RESERVED_93"/>
+	<value value="94" name="A8XX_PERF_TP_RESERVED_94"/>
+	<value value="95" name="A8XX_PERF_TP_RESERVED_95"/>
+	<value value="96" name="A8XX_PERF_TP_RESERVED_96"/>
+	<value value="97" name="A8XX_PERF_TP_RESERVED_97"/>
+	<value value="98" name="A8XX_PERF_TP_RESERVED_98"/>
+	<value value="99" name="A8XX_PERF_TP_RESERVED_99"/>
+	<value value="100" name="A8XX_PERF_TP_RESERVED_100"/>
+	<value value="101" name="A8XX_PERF_TP_RESERVED_101"/>
+	<value value="102" name="A8XX_PERF_TP_RESERVED_102"/>
+	<value value="103" name="A8XX_PERF_TP_RESERVED_103"/>
+	<value value="104" name="A8XX_PERF_TP_RESERVED_104"/>
+	<value value="105" name="A8XX_PERF_TP_RESERVED_105"/>
+	<value value="106" name="A8XX_PERF_TP_RESERVED_106"/>
+	<value value="107" name="A8XX_PERF_TP_RESERVED_107"/>
+	<value value="108" name="A8XX_PERF_TP_RESERVED_108"/>
+	<value value="109" name="A8XX_PERF_TP_RESERVED_109"/>
+	<value value="110" name="A8XX_PERF_TP_RESERVED_110"/>
+	<value value="111" name="A8XX_PERF_TP_RESERVED_111"/>
+	<value value="112" name="A8XX_PERF_TP_RESERVED_112"/>
+	<value value="113" name="A8XX_PERF_TP_RESERVED_113"/>
+	<value value="114" name="A8XX_PERF_TP_RESERVED_114"/>
+	<value value="115" name="A8XX_PERF_TP_RESERVED_115"/>
+	<value value="116" name="A8XX_PERF_TP_RESERVED_116"/>
+	<value value="117" name="A8XX_PERF_TP_RESERVED_117"/>
+	<value value="118" name="A8XX_PERF_TP_RESERVED_118"/>
+	<value value="119" name="A8XX_PERF_TP_RESERVED_119"/>
+	<value value="120" name="A8XX_PERF_TP_RESERVED_120"/>
+	<value value="121" name="A8XX_PERF_TP_RESERVED_121"/>
+	<value value="122" name="A8XX_PERF_TP_RESERVED_122"/>
+	<value value="123" name="A8XX_PERF_TP_RESERVED_123"/>
+	<value value="124" name="A8XX_PERF_TP_RESERVED_124"/>
+	<value value="125" name="A8XX_PERF_TP_RESERVED_125"/>
+	<value value="126" name="A8XX_PERF_TP_RESERVED_126"/>
+	<value value="127" name="A8XX_PERF_TP_RESERVED_127"/>
+	<value value="128" name="A8XX_PERF_TP_FORMAT_DECOMP_BILINEAR"/>
+	<value value="129" name="A8XX_PERF_TP_PACKED_POINT_BOTH_VALID_FP16"/>
+	<value value="130" name="A8XX_PERF_TP_PACKED_POINT_SINGLE_VALID_FP16"/>
+	<value value="131" name="A8XX_PERF_TP_PACKED_POINT_BOTH_VALID_FP32"/>
+	<value value="132" name="A8XX_PERF_TP_PACKED_POINT_SINGLE_VALID_FP32"/>
+	<value value="133" name="A8XX_PERF_TP_TOTAL_DECOMP_L1_RESP_CH0"/>
+	<value value="134" name="A8XX_PERF_TP_TOTAL_DECOMP_L1_RESP_CH1"/>
+	<value value="135" name="A8XX_PERF_TP_L1POINT5_PRE_L1_DECOMP_0_WORKLOAD_R"/>
+	<value value="136" name="A8XX_PERF_TP_L1POINT5_PRE_L1_DECOMP_1_WORKLOAD_R"/>
+	<value value="137" name="A8XX_PERF_TP_L1POINT5_ASTC_DECODER_0_WORKLOAD_R"/>
+	<value value="138" name="A8XX_PERF_TP_L1POINT5_ASTC_DECODER_1_WORKLOAD_R"/>
+	<value value="139" name="A8XX_PERF_TP_PARTIAL_SURFACE_PGMEM_PIXELS"/>
+	<value value="140" name="A8XX_PERF_TP_PARTIAL_SURFACE_SYSMEM_PIXELS"/>
+	<value value="141" name="A8XX_PERF_TP_PARTIAL_SURFACE_PGMEM_MISS_REQ"/>
+	<value value="142" name="A8XX_PERF_TP_PARTIAL_SURFACE_SYSMEM_MISS_REQ"/>
+</enum>
+
+<enum name="a8xx_sp_perfcounter_select">
+	<value value="0" name="A8XX_PERF_SP_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_SP_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_SP_ALU_WORKING_CYCLES"/>
+	<value value="3" name="A8XX_PERF_SP_STALL_CYCLES_VPC_BE"/>
+	<value value="4" name="A8XX_PERF_SP_STALL_CYCLES_TP"/>
+	<value value="5" name="A8XX_PERF_SP_STALL_CYCLES_UCHE"/>
+	<value value="6" name="A8XX_PERF_SP_STALL_CYCLES_RB"/>
+	<value value="7" name="A8XX_PERF_SP_NON_EXECUTION_CYCLES"/>
+	<value value="8" name="A8XX_PERF_SP_WAVE_CONTEXTS"/>
+	<value value="9" name="A8XX_PERF_SP_WAVE_CONTEXT_CYCLES"/>
+	<value value="10" name="A8XX_PERF_SP_FS_STAGE_WAVE_CYCLES"/>
+	<value value="11" name="A8XX_PERF_SP_FS_STAGE_WAVE_SAMPLES"/>
+	<value value="12" name="A8XX_PERF_SP_VS_STAGE_WAVE_CYCLES"/>
+	<value value="13" name="A8XX_PERF_SP_VS_STAGE_WAVE_SAMPLES"/>
+	<value value="14" name="A8XX_PERF_SP_FS_STAGE_DURATION_CYCLES"/>
+	<value value="15" name="A8XX_PERF_SP_VS_STAGE_DURATION_CYCLES"/>
+	<value value="16" name="A8XX_PERF_SP_WAVE_CTRL_CYCLES"/>
+	<value value="17" name="A8XX_PERF_SP_WAVE_LOAD_CYCLES"/>
+	<value value="18" name="A8XX_PERF_SP_WAVE_EMIT_CYCLES"/>
+	<value value="19" name="A8XX_PERF_SP_WAVE_NOP_CYCLES"/>
+	<value value="20" name="A8XX_PERF_SP_WAVE_WAIT_CYCLES"/>
+	<value value="21" name="A8XX_PERF_SP_WAVE_FETCH_CYCLES"/>
+	<value value="22" name="A8XX_PERF_SP_WAVE_IDLE_CYCLES"/>
+	<value value="23" name="A8XX_PERF_SP_WAVE_END_CYCLES"/>
+	<value value="24" name="A8XX_PERF_SP_WAVE_LONG_SYNC_CYCLES"/>
+	<value value="25" name="A8XX_PERF_SP_WAVE_SHORT_SYNC_CYCLES"/>
+	<value value="26" name="A8XX_PERF_SP_WAVE_JOIN_CYCLES"/>
+	<value value="27" name="A8XX_PERF_SP_LM_LOAD_INSTRUCTIONS"/>
+	<value value="28" name="A8XX_PERF_SP_LM_STORE_INSTRUCTIONS"/>
+	<value value="29" name="A8XX_PERF_SP_LM_ATOMICS"/>
+	<value value="30" name="A8XX_PERF_SP_GM_LOAD_INSTRUCTIONS"/>
+	<value value="31" name="A8XX_PERF_SP_GM_STORE_INSTRUCTIONS"/>
+	<value value="32" name="A8XX_PERF_SP_GM_ATOMICS"/>
+	<value value="33" name="A8XX_PERF_SP_VS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="34" name="A8XX_PERF_SP_VS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="35" name="A8XX_PERF_SP_VS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="36" name="A8XX_PERF_SP_VS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="37" name="A8XX_PERF_SP_FS_STAGE_TEX_INSTRUCTIONS"/>
+	<value value="38" name="A8XX_PERF_SP_FS_STAGE_CFLOW_INSTRUCTIONS"/>
+	<value value="39" name="A8XX_PERF_SP_FS_STAGE_EFU_INSTRUCTIONS"/>
+	<value value="40" name="A8XX_PERF_SP_FS_STAGE_FULL_ALU_INSTRUCTIONS"/>
+	<value value="41" name="A8XX_PERF_SP_FS_STAGE_HALF_ALU_INSTRUCTIONS"/>
+	<value value="42" name="A8XX_PERF_SP_FS_STAGE_BARY_INSTRUCTIONS"/>
+	<value value="43" name="A8XX_PERF_SP_VS_INSTRUCTIONS"/>
+	<value value="44" name="A8XX_PERF_SP_FS_INSTRUCTIONS"/>
+	<value value="45" name="A8XX_PERF_SP_ADDR_LOCK_COUNT"/>
+	<value value="46" name="A8XX_PERF_SP_UCHE_READ_TRANS"/>
+	<value value="47" name="A8XX_PERF_SP_UCHE_WRITE_TRANS"/>
+	<value value="48" name="A8XX_PERF_SP_EXPORT_VPC_TRANS"/>
+	<value value="49" name="A8XX_PERF_SP_EXPORT_RB_TRANS"/>
+	<value value="50" name="A8XX_PERF_SP_PIXELS_KILLED"/>
+	<value value="51" name="A8XX_PERF_SP_ICL1_REQUESTS"/>
+	<value value="52" name="A8XX_PERF_SP_ICL1_MISSES"/>
+	<value value="53" name="A8XX_PERF_SP_HS_INSTRUCTIONS"/>
+	<value value="54" name="A8XX_PERF_SP_DS_INSTRUCTIONS"/>
+	<value value="55" name="A8XX_PERF_SP_GS_INSTRUCTIONS"/>
+	<value value="56" name="A8XX_PERF_SP_CS_INSTRUCTIONS"/>
+	<value value="57" name="A8XX_PERF_SP_GPR_READ"/>
+	<value value="58" name="A8XX_PERF_SP_GPR_WRITE"/>
+	<value value="59" name="A8XX_PERF_SP_FS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="60" name="A8XX_PERF_SP_VS_STAGE_HALF_EFU_INSTRUCTIONS"/>
+	<value value="61" name="A8XX_PERF_SP_LM_BANK_CONFLICTS"/>
+	<value value="62" name="A8XX_PERF_SP_TEX_CONTROL_WORKING_CYCLES"/>
+	<value value="63" name="A8XX_PERF_SP_LOAD_CONTROL_WORKING_CYCLES"/>
+	<value value="64" name="A8XX_PERF_SP_FLOW_CONTROL_WORKING_CYCLES"/>
+	<value value="65" name="A8XX_PERF_SP_LM_WORKING_CYCLES"/>
+	<value value="66" name="A8XX_PERF_SP_DISPATCHER_WORKING_CYCLES"/>
+	<value value="67" name="A8XX_PERF_SP_SEQUENCER_WORKING_CYCLES"/>
+	<value value="68" name="A8XX_PERF_SP_LOW_EFFICIENCY_STARVED_BY_TP"/>
+	<value value="69" name="A8XX_PERF_SP_STARVE_CYCLES_HLSQ"/>
+	<value value="70" name="A8XX_PERF_SP_NON_EXECUTION_LS_CYCLES"/>
+	<value value="71" name="A8XX_PERF_SP_WORKING_EU"/>
+	<value value="72" name="A8XX_PERF_SP_ANY_EU_WORKING"/>
+	<value value="73" name="A8XX_PERF_SP_WORKING_EU_FS_STAGE"/>
+	<value value="74" name="A8XX_PERF_SP_ANY_EU_WORKING_FS_STAGE"/>
+	<value value="75" name="A8XX_PERF_SP_WORKING_EU_VS_STAGE"/>
+	<value value="76" name="A8XX_PERF_SP_ANY_EU_WORKING_VS_STAGE"/>
+	<value value="77" name="A8XX_PERF_SP_WORKING_EU_CS_STAGE"/>
+	<value value="78" name="A8XX_PERF_SP_ANY_EU_WORKING_CS_STAGE"/>
+	<value value="79" name="A8XX_PERF_SP_GPR_READ_PREFETCH"/>
+	<value value="80" name="A8XX_PERF_SP_GPR_READ_CONFLICT"/>
+	<value value="81" name="A8XX_PERF_SP_GPR_WRITE_CONFLICT"/>
+	<value value="82" name="A8XX_PERF_SP_GM_LOAD_LATENCY_CYCLES"/>
+	<value value="83" name="A8XX_PERF_SP_GM_LOAD_LATENCY_SAMPLES"/>
+	<value value="84" name="A8XX_PERF_SP_EXECUTABLE_WAVES"/>
+	<value value="85" name="A8XX_PERF_SP_ICL1_MISS_FETCH_CYCLES"/>
+	<value value="86" name="A8XX_PERF_SP_RESERVED_86"/>
+	<value value="87" name="A8XX_PERF_SP_BYPASS_BUSY_CYCLES"/>
+	<value value="88" name="A8XX_PERF_SP_ANY_EU_WORKING_LPAC"/>
+	<value value="89" name="A8XX_PERF_SP_WAVE_ALU_CYCLES"/>
+	<value value="90" name="A8XX_PERF_SP_WAVE_EFU_CYCLES"/>
+	<value value="91" name="A8XX_PERF_SP_WAVE_INT_CYCLES"/>
+	<value value="92" name="A8XX_PERF_SP_WAVE_CSP_CYCLES"/>
+	<value value="93" name="A8XX_PERF_SP_EWAVE_CONTEXTS"/>
+	<value value="94" name="A8XX_PERF_SP_EWAVE_CONTEXT_CYCLES"/>
+	<value value="95" name="A8XX_PERF_SP_LPAC_BUSY_CYCLES"/>
+	<value value="96" name="A8XX_PERF_SP_LPAC_INSTRUCTIONS"/>
+	<value value="97" name="A8XX_PERF_SP_FS_STAGE_1X_WAVES"/>
+	<value value="98" name="A8XX_PERF_SP_FS_STAGE_2X_WAVES"/>
+	<value value="99" name="A8XX_PERF_SP_QUADS"/>
+	<value value="100" name="A8XX_PERF_SP_CS_INVOCATIONS"/>
+	<value value="101" name="A8XX_PERF_SP_PIXELS"/>
+	<value value="102" name="A8XX_PERF_SP_LPAC_DRAWCALLS"/>
+	<value value="103" name="A8XX_PERF_SP_PI_WORKING_CYCLES"/>
+	<value value="104" name="A8XX_PERF_SP_WAVE_INPUT_CYCLES"/>
+	<value value="105" name="A8XX_PERF_SP_WAVE_OUTPUT_CYCLES"/>
+	<value value="106" name="A8XX_PERF_SP_WAVE_HWAVE_WAIT_CYCLES"/>
+	<value value="107" name="A8XX_PERF_SP_WAVE_HWAVE_SYNC"/>
+	<value value="108" name="A8XX_PERF_SP_OUTPUT_3D_PIXELS"/>
+	<value value="109" name="A8XX_PERF_SP_FULL_ALU_MAD_INSTRUCTIONS"/>
+	<value value="110" name="A8XX_PERF_SP_HALF_ALU_MAD_INSTRUCTIONS"/>
+	<value value="111" name="A8XX_PERF_SP_FULL_ALU_MUL_INSTRUCTIONS"/>
+	<value value="112" name="A8XX_PERF_SP_HALF_ALU_MUL_INSTRUCTIONS"/>
+	<value value="113" name="A8XX_PERF_SP_FULL_ALU_ADD_INSTRUCTIONS"/>
+	<value value="114" name="A8XX_PERF_SP_HALF_ALU_ADD_INSTRUCTIONS"/>
+	<value value="115" name="A8XX_PERF_SP_BARY_FP32_INSTRUCTIONS"/>
+	<value value="116" name="A8XX_PERF_SP_ALU_GPR_READ_CYCLES"/>
+	<value value="117" name="A8XX_PERF_SP_ALU_DATA_FORWARDING_CYCLES"/>
+	<value value="118" name="A8XX_PERF_SP_LM_FULL_CYCLES"/>
+	<value value="119" name="A8XX_PERF_SP_TEXTURE_FETCH_LATENCY_CYCLES"/>
+	<value value="120" name="A8XX_PERF_SP_TEXTURE_FETCH_LATENCY_SAMPLES"/>
+	<value value="121" name="A8XX_PERF_SP_FS_STAGE_PI_TEX_INSTRUCTION"/>
+	<value value="122" name="A8XX_PERF_SP_RAY_QUERY_INSTRUCTIONS"/>
+	<value value="123" name="A8XX_PERF_SP_RBRT_KICKOFF_FIBERS"/>
+	<value value="124" name="A8XX_PERF_SP_RBRT_KICKOFF_DQUADS"/>
+	<value value="125" name="A8XX_PERF_SP_RTU_BUSY_CYCLES"/>
+	<value value="126" name="A8XX_PERF_SP_RTU_L0_HITS"/>
+	<value value="127" name="A8XX_PERF_SP_RTU_L0_MISSES"/>
+	<value value="128" name="A8XX_PERF_SP_RTU_L0_HIT_ON_MISS"/>
+	<value value="129" name="A8XX_PERF_SP_RTU_STALL_CYCLES_WAVE_QUEUE"/>
+	<value value="130" name="A8XX_PERF_SP_RTU_STALL_CYCLES_L0_HIT_QUEUE"/>
+	<value value="131" name="A8XX_PERF_SP_RTU_STALL_CYCLES_L0_MISS_QUEUE"/>
+	<value value="132" name="A8XX_PERF_SP_RTU_STALL_CYCLES_L0D_IDX_QUEUE"/>
+	<value value="133" name="A8XX_PERF_SP_RTU_STALL_CYCLES_L0DATA"/>
+	<value value="134" name="A8XX_PERF_SP_RTU_STALL_CYCLES_REPLACE_CNT"/>
+	<value value="135" name="A8XX_PERF_SP_RTU_STALL_CYCLES_MRG_CNT"/>
+	<value value="136" name="A8XX_PERF_SP_RTU_STALL_CYCLES_UCHE"/>
+	<value value="137" name="A8XX_PERF_SP_RTU_OPERAND_FETCH_STALL_CYCLES_L0"/>
+	<value value="138" name="A8XX_PERF_SP_RTU_OPERAND_FETCH_STALL_CYCLES_INS_FIFO"/>
+	<value value="139" name="A8XX_PERF_SP_RTU_BVH_FETCH_LATENCY_CYCLES"/>
+	<value value="140" name="A8XX_PERF_SP_RTU_BVH_FETCH_LATENCY_SAMPLES"/>
+	<value value="141" name="A8XX_PERF_SP_STCHE_MISS_INC_VS"/>
+	<value value="142" name="A8XX_PERF_SP_STCHE_MISS_INC_FS"/>
+	<value value="143" name="A8XX_PERF_SP_STCHE_MISS_INC_BV"/>
+	<value value="144" name="A8XX_PERF_SP_STCHE_MISS_INC_LPAC"/>
+	<value value="145" name="A8XX_PERF_SP_VGPR_ACTIVE_CONTEXTS"/>
+	<value value="146" name="A8XX_PERF_SP_PGPR_ALLOC_CONTEXTS"/>
+	<value value="147" name="A8XX_PERF_SP_VGPR_ALLOC_CONTEXTS"/>
+	<value value="148" name="A8XX_PERF_SP_RTU_RAY_BOX_INTERSECTIONS"/>
+	<value value="149" name="A8XX_PERF_SP_RTU_RAY_TRIANGLE_INTERSECTIONS"/>
+	<value value="150" name="A8XX_PERF_SP_SCH_STALL_CYCLES_RTU"/>
+	<value value="151" name="A8XX_PERF_SP_EFU_WORKING_CYCLES"/>
+	<value value="152" name="A8XX_PERF_SP_BRANCH_TAKEN"/>
+	<value value="153" name="A8XX_PERF_SP_BRANCH_NOT_TAKEN"/>
+	<value value="154" name="A8XX_PERF_SP_BRANCH_INS_DIVERGENCY_COUNT"/>
+	<value value="155" name="A8XX_PERF_SP_BRANCH_INS_COUNT"/>
+	<value value="156" name="A8XX_PERF_SP_PREDICT_TAKEN"/>
+	<value value="157" name="A8XX_PERF_SP_PREDICT_NOT_TAKEN"/>
+	<value value="158" name="A8XX_PERF_SP_PREDICT_INS_DIVERGENCY_COUNT"/>
+	<value value="159" name="A8XX_PERF_SP_PREDICT_INS_COUNT"/>
+	<value value="160" name="A8XX_PERF_SP_CCHE_UAV_TOTAL_REQ"/>
+	<value value="161" name="A8XX_PERF_SP_CCHE_UAV_TOTAL_DUALQUAD"/>
+	<value value="162" name="A8XX_PERF_SP_CCHE_NONUAV_TOTAL_REQ"/>
+	<value value="163" name="A8XX_PERF_SP_CCHE_NONUAV_TOTAL_DUALQUAD"/>
+	<value value="164" name="A8XX_PERF_SP_LB_NONUAV_TOTAL_REQ"/>
+	<value value="165" name="A8XX_PERF_SP_LB_NONUAV_TOTAL_DUALQUAD"/>
+	<value value="166" name="A8XX_PERF_SP_LB_READ_XFER_ALU"/>
+	<value value="167" name="A8XX_PERF_SP_LB_ALU_READ_CONS"/>
+	<value value="168" name="A8XX_PERF_SP_LB_READ_ALU_BLOCK_OTHER"/>
+	<value value="169" name="A8XX_PERF_SP_LB_WRITE_XFER_VPC"/>
+	<value value="170" name="A8XX_PERF_SP_LB_WRITE_VPC_BLOCK_OTHER"/>
+	<value value="171" name="A8XX_PERF_SP_LB_LDST_RW_LM"/>
+	<value value="172" name="A8XX_PERF_SP_LB_LDST_RW_LM_BLOCKED"/>
+	<value value="173" name="A8XX_PERF_SP_LB_LDST_WRITE_CONS"/>
+	<value value="174" name="A8XX_PERF_SP_LB_LDST_WRITE_CONS_BLOCKED"/>
+	<value value="175" name="A8XX_PERF_SP_GPR_READ_BANK"/>
+	<value value="176" name="A8XX_PERF_SP_GPR_WRITE_BANK"/>
+	<value value="177" name="A8XX_PERF_SP_VS_WAVE_REQ_PENDING"/>
+	<value value="178" name="A8XX_PERF_SP_FS_WAVE_REQ_PENDING"/>
+	<value value="179" name="A8XX_PERF_SP_LPAC_WAVE_REQ_PENDING"/>
+	<value value="180" name="A8XX_PERF_SP_WAVE_SPLIT_CNT"/>
+	<value value="181" name="A8XX_PERF_SP_FS_OOO_WAVE_ACC"/>
+	<value value="182" name="A8XX_PERF_SP_SCH_MEM_CTRL_WORKING_CYCLES"/>
+	<value value="183" name="A8XX_PERF_SP_LDST_EXECUTION_CYCLES"/>
+	<value value="184" name="A8XX_PERF_SP_CCHE_UAV_TOTAL_ATOM_REQ"/>
+	<value value="185" name="A8XX_PERF_SP_CCHE_NONUAV_TOTAL_AOM_REQ"/>
+	<value value="186" name="A8XX_PERF_SP_TTU_INSTRUCTIONS"/>
+	<value value="187" name="A8XX_PERF_SP_TTU_ACTIVE_FIBERS"/>
+	<value value="188" name="A8XX_PERF_SP_TTU_BUSY_CYCLES"/>
+	<value value="189" name="A8XX_PERF_SP_TTU_GPR_RD_CYCLES"/>
+	<value value="190" name="A8XX_PERF_SP_TTU_GPR_RD_REQ"/>
+	<value value="191" name="A8XX_PERF_SP_TTU_GPR_WR_CYCLES"/>
+	<value value="192" name="A8XX_PERF_SP_TTU_GPR_WR_REQ"/>
+	<value value="193" name="A8XX_PERF_SP_GPR_CACHE_SRC0_GPR_RDCNT"/>
+	<value value="194" name="A8XX_PERF_SP_GPR_CACHE_SRC0_GPR_CACHE_HIT_RDCNT"/>
+	<value value="195" name="A8XX_PERF_SP_GPR_CACHE_SRC0_GPR_CACHE_HINT_RDCNT"/>
+	<value value="196" name="A8XX_PERF_SP_GPR_CACHE_SRC1_RDCNT"/>
+	<value value="197" name="A8XX_PERF_SP_GPR_CACHE_SRC1_GPR_CACHE_HIT_RDCNT"/>
+	<value value="198" name="A8XX_PERF_SP_GPR_CACHE_SRC1_GPR_CACHE_HINT_RDCNT"/>
+	<value value="199" name="A8XX_PERF_SP_GPR_CACHE_SRC2_RDCNT"/>
+	<value value="200" name="A8XX_PERF_SP_GPR_CACHE_SRC2_GPR_CACHE_HIT_RDCNT"/>
+	<value value="201" name="A8XX_PERF_SP_GPR_CACHE_SRC2_GPR_CACHE_HINT_RDCNT"/>
+	<value value="202" name="A8XX_PERF_SP_UCHE_READ_BURST"/>
+	<value value="203" name="A8XX_PERF_SP_UCHE_WRITE_BURST"/>
+	<value value="204" name="A8XX_PERF_SP_LDST_GMEM_REQ_NUM"/>
+</enum>
+
+<enum name="a8xx_rb_perfcounter_select">
+	<value value="0" name="A8XX_PERF_RB_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_RB_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_RB_STALL_CYCLES_HLSQ"/>
+	<value value="3" name="A8XX_PERF_RB_STALL_CYCLES_FIFO0_FULL"/>
+	<value value="4" name="A8XX_PERF_RB_STALL_CYCLES_FIFO1_FULL"/>
+	<value value="5" name="A8XX_PERF_RB_STALL_CYCLES_FIFO2_FULL"/>
+	<value value="6" name="A8XX_PERF_RB_STARVE_CYCLES_SP"/>
+	<value value="7" name="A8XX_PERF_RB_STARVE_CYCLES_LRZ_TILE"/>
+	<value value="8" name="A8XX_PERF_RB_STARVE_CYCLES_CCU"/>
+	<value value="9" name="A8XX_PERF_RB_STARVE_CYCLES_Z_PLANE"/>
+	<value value="10" name="A8XX_PERF_RB_STARVE_CYCLES_BARY_PLANE"/>
+	<value value="11" name="A8XX_PERF_RB_Z_WORKLOAD"/>
+	<value value="12" name="A8XX_PERF_RB_HLSQ_ACTIVE"/>
+	<value value="13" name="A8XX_PERF_RB_Z_READ"/>
+	<value value="14" name="A8XX_PERF_RB_Z_WRITE"/>
+	<value value="15" name="A8XX_PERF_RB_C_READ"/>
+	<value value="16" name="A8XX_PERF_RB_C_WRITE"/>
+	<value value="17" name="A8XX_PERF_RB_TOTAL_PASS"/>
+	<value value="18" name="A8XX_PERF_RB_Z_PASS"/>
+	<value value="19" name="A8XX_PERF_RB_Z_FAIL"/>
+	<value value="20" name="A8XX_PERF_RB_S_FAIL"/>
+	<value value="21" name="A8XX_PERF_RB_BLENDED_FXP_COMPONENTS"/>
+	<value value="22" name="A8XX_PERF_RB_BLENDED_FP16_COMPONENTS"/>
+	<value value="23" name="A8XX_PERF_RB_PS_INVOCATIONS"/>
+	<value value="24" name="A8XX_PERF_RB_2D_ALIVE_CYCLES"/>
+	<value value="25" name="A8XX_PERF_RB_2D_STARVE_CYCLES_SP"/>
+	<value value="26" name="A8XX_PERF_RB_2D_VALID_PIXELS"/>
+	<value value="27" name="A8XX_PERF_RB_3D_PIXELS"/>
+	<value value="28" name="A8XX_PERF_RB_BLENDER_WORKING_CYCLES"/>
+	<value value="29" name="A8XX_PERF_RB_ZPROC_WORKING_CYCLES"/>
+	<value value="30" name="A8XX_PERF_RB_CPROC_WORKING_CYCLES"/>
+	<value value="31" name="A8XX_PERF_RB_SAMPLER_WORKING_CYCLES"/>
+	<value value="32" name="A8XX_PERF_RB_STALL_CYCLES_CCU_COLOR_READ"/>
+	<value value="33" name="A8XX_PERF_RB_STALL_CYCLES_CCU_COLOR_WRITE"/>
+	<value value="34" name="A8XX_PERF_RB_STALL_CYCLES_CCU_DEPTH_READ"/>
+	<value value="35" name="A8XX_PERF_RB_STALL_CYCLES_CCU_DEPTH_WRITE"/>
+	<value value="36" name="A8XX_PERF_RB_STALL_CYCLES_VPC_BE"/>
+	<value value="37" name="A8XX_PERF_RB_BLENDED_FP32_COMPONENTS"/>
+	<value value="38" name="A8XX_PERF_RB_COLOR_PIX_TILES"/>
+	<value value="39" name="A8XX_PERF_RB_STALL_CYCLES_CCU"/>
+	<value value="40" name="A8XX_PERF_RB_EARLY_Z_ARB3_GRANT"/>
+	<value value="41" name="A8XX_PERF_RB_LATE_Z_ARB3_GRANT"/>
+	<value value="42" name="A8XX_PERF_RB_EARLY_Z_SKIP_GRANT"/>
+	<value value="43" name="A8XX_PERF_RB_VRS_1X1_QUADS"/>
+	<value value="44" name="A8XX_PERF_RB_VRS_2X1_QUADS"/>
+	<value value="45" name="A8XX_PERF_RB_VRS_1X2_QUADS"/>
+	<value value="46" name="A8XX_PERF_RB_VRS_2X2_QUADS"/>
+	<value value="47" name="A8XX_PERF_RB_VRS_2X4_QUADS"/>
+	<value value="48" name="A8XX_PERF_RB_VRS_4X2_QUADS"/>
+	<value value="49" name="A8XX_PERF_RB_VRS_4X4_QUADS"/>
+	<value value="50" name="A8XX_PERF_RB_STALL_CYCLES_HLSQ_INFO"/>
+	<value value="51" name="A8XX_PERF_RB_HLSQ_ACTIVE_INFO"/>
+	<value value="52" name="A8XX_PERF_RB_STALL_CYCLES_HLSQ_ATTR"/>
+	<value value="53" name="A8XX_PERF_RB_HLSQ_ACTIVE_ATTR"/>
+	<value value="54" name="A8XX_PERF_RB_STALL_CYCLES_ZMODE_SWITCH"/>
+	<value value="55" name="A8XX_PERF_RB_TOTAL_PASS_PIXELS"/>
+</enum>
+
+<enum name="a8xx_vsc_perfcounter_select">
+	<value value="0" name="A8XX_PERF_VSC_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_VSC_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_VSC_WORKING_CYCLES"/>
+	<value value="3" name="A8XX_PERF_VSC_STALL_CYCLES_UCHE"/>
+	<value value="4" name="A8XX_PERF_VSC_EOT_NUM"/>
+	<value value="5" name="A8XX_PERF_VSC_INPUT_TILES"/>
+	<value value="6" name="A8XX_PERF_VSC_TILE_COMP_TRAN"/>
+	<value value="7" name="A8XX_PERF_VSC_TILE_BYPASS_TRAN"/>
+</enum>
+
+<enum name="a8xx_ccu_perfcounter_select">
+	<value value="0" name="A8XX_PERF_CCU_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_CCU_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_CCU_STALL_CYCLES_RB_DEPTH_RETURN"/>
+	<value value="3" name="A8XX_PERF_CCU_STALL_CYCLES_RB_COLOR_RETURN"/>
+	<value value="4" name="A8XX_PERF_CCU_DEPTH_BLOCKS"/>
+	<value value="5" name="A8XX_PERF_CCU_COLOR_BLOCKS"/>
+	<value value="6" name="A8XX_PERF_CCU_DEPTH_BLOCK_HIT"/>
+	<value value="7" name="A8XX_PERF_CCU_COLOR_BLOCK_HIT"/>
+	<value value="8" name="A8XX_PERF_CCU_PARTIAL_BLOCK_READ"/>
+	<value value="9" name="A8XX_PERF_CCU_GMEM_READ"/>
+	<value value="10" name="A8XX_PERF_CCU_GMEM_WRITE"/>
+	<value value="11" name="A8XX_PERF_CCU_2D_RD_REQ"/>
+	<value value="12" name="A8XX_PERF_CCU_2D_WR_REQ"/>
+	<value value="13" name="A8XX_PERF_CCU_UBWC_COLOR_BLOCKS_CONCURRENT"/>
+	<value value="14" name="A8XX_PERF_CCU_UBWC_DEPTH_BLOCKS_CONCURRENT"/>
+	<value value="15" name="A8XX_PERF_CCU_COLOR_RESOLVE_DROPPED"/>
+	<value value="16" name="A8XX_PERF_CCU_DEPTH_RESOLVE_DROPPED"/>
+	<value value="17" name="A8XX_PERF_CCU_COLOR_RENDER_CONCURRENT"/>
+	<value value="18" name="A8XX_PERF_CCU_DEPTH_RENDER_CONCURRENT"/>
+	<value value="19" name="A8XX_PERF_CCU_COLOR_RESOLVE_AFTER_RENDER"/>
+	<value value="20" name="A8XX_PERF_CCU_DEPTH_RESOLVE_AFTER_RENDER"/>
+	<value value="21" name="A8XX_PERF_CCU_GMEM_EXTRA_DEPTH_READ"/>
+	<value value="22" name="A8XX_PERF_CCU_GMEM_COLOR_READ_4AA"/>
+	<value value="23" name="A8XX_PERF_CCU_GMEM_COLOR_READ_4AA_FULL"/>
+	<value value="24" name="A8XX_PERF_CCU_COLOR_EVB_STALL"/>
+	<value value="25" name="A8XX_PERF_CCU_RENDER_OVERLAP_CRE_C"/>
+	<value value="26" name="A8XX_PERF_CCU_RENDER_OVERLAP_CRE_Z"/>
+	<value value="27" name="A8XX_PERF_CCU_RENDER_STALL_BY_CRE_C"/>
+	<value value="28" name="A8XX_PERF_CCU_RENDER_STALL_BY_CRE_Z"/>
+	<value value="29" name="A8XX_PERF_CCU_FULL_SURFACE_RESOLVE_CYCLES"/>
+	<value value="30" name="A8XX_PERF_CCU_RENDER_OVERLAP_FULL_SURFACE_RESOLVE"/>
+	<value value="31" name="A8XX_PERF_CCU_STALL_BY_FULL_SURFACE_RESOLVE"/>
+	<value value="32" name="A8XX_PERF_CCU_CONCURRENT_RESOLVE_CYCLES"/>
+	<value value="33" name="A8XX_PERF_CCU_GMEM_BK2BK_STALL"/>
+	<value value="34" name="A8XX_PERF_CCU_RESERVED_34"/>
+	<value value="35" name="A8XX_PERF_CCU_RESERVED_35"/>
+	<value value="36" name="A8XX_PERF_CCU_RESERVED_36"/>
+	<value value="37" name="A8XX_PERF_CCU_RESERVED_37"/>
+	<value value="38" name="A8XX_PERF_CCU_RESERVED_38"/>
+	<value value="39" name="A8XX_PERF_CCU_RESERVED_39"/>
+	<value value="40" name="A8XX_PERF_CCU_RESERVED_40"/>
+	<value value="41" name="A8XX_PERF_CCU_RESERVED_41"/>
+	<value value="42" name="A8XX_PERF_CCU_RESERVED_42"/>
+	<value value="43" name="A8XX_PERF_CCU_RESERVED_43"/>
+	<value value="44" name="A8XX_PERF_CCU_RESERVED_44"/>
+	<value value="45" name="A8XX_PERF_CCU_RESERVED_45"/>
+	<value value="46" name="A8XX_PERF_CCU_RESERVED_46"/>
+	<value value="47" name="A8XX_PERF_CCU_RESERVED_47"/>
+	<value value="48" name="A8XX_PERF_CCU_RESERVED_48"/>
+	<value value="49" name="A8XX_PERF_CCU_RESERVED_49"/>
+	<value value="50" name="A8XX_PERF_CCU_RESERVED_50"/>
+	<value value="51" name="A8XX_PERF_CCU_RESERVED_51"/>
+	<value value="52" name="A8XX_PERF_CCU_RESERVED_52"/>
+	<value value="53" name="A8XX_PERF_CCU_RESERVED_53"/>
+	<value value="54" name="A8XX_PERF_CCU_RESERVED_54"/>
+	<value value="55" name="A8XX_PERF_CCU_RESERVED_55"/>
+	<value value="56" name="A8XX_PERF_CCU_RESERVED_56"/>
+	<value value="57" name="A8XX_PERF_CCU_RESERVED_57"/>
+	<value value="58" name="A8XX_PERF_CCU_RESERVED_58"/>
+	<value value="59" name="A8XX_PERF_CCU_RESERVED_59"/>
+	<value value="60" name="A8XX_PERF_CCU_RESERVED_60"/>
+	<value value="61" name="A8XX_PERF_CCU_RESERVED_61"/>
+	<value value="62" name="A8XX_PERF_CCU_RESERVED_62"/>
+	<value value="63" name="A8XX_PERF_CCU_RESERVED_63"/>
+	<value value="64" name="A8XX_PERF_UFC_L0_TP_HINT_REQUESTS"/>
+	<value value="65" name="A8XX_PERF_UFC_L0_TP_HINT_TAG_MISS"/>
+	<value value="66" name="A8XX_PERF_UFC_L0_TP_HINT_TAG_HIT_RDY"/>
+	<value value="67" name="A8XX_PERF_UFC_L0_TP_HINT_TAG_HIT_NRDY"/>
+	<value value="68" name="A8XX_PERF_UFC_L0_TP_HINT_IS_FCLEAR"/>
+	<value value="69" name="A8XX_PERF_UFC_L0_TP_HINT_IS_ALPHA0"/>
+	<value value="70" name="A8XX_PERF_UFC_L0_TP_HINT_IS_ALPHA1"/>
+	<value value="71" name="A8XX_PERF_UFC_L0_TP_HINT_IS_UNCOMP"/>
+	<value value="72" name="A8XX_PERF_UFC_L0_SP_REQUESTS"/>
+	<value value="73" name="A8XX_PERF_UFC_L0_SP_FILTER_HIT"/>
+	<value value="74" name="A8XX_PERF_UFC_L0_SP_FILTER_MISS"/>
+	<value value="75" name="A8XX_PERF_UFC_L0_SP_REQ_STALLED_CYCLES"/>
+	<value value="76" name="A8XX_PERF_UFC_L0_TP_REQ_STALLED_CYCLES"/>
+	<value value="77" name="A8XX_PERF_UFC_L0_TP_RTN_STALLED_CYCLES"/>
+	<value value="78" name="A8XX_PERF_CCU_RESERVED_78"/>
+	<value value="79" name="A8XX_PERF_CCU_RESERVED_79"/>
+	<value value="80" name="A8XX_PERF_CCU_RESERVED_80"/>
+	<value value="81" name="A8XX_PERF_CCU_RESERVED_81"/>
+	<value value="82" name="A8XX_PERF_CCU_RESERVED_82"/>
+	<value value="83" name="A8XX_PERF_CCU_RESERVED_83"/>
+	<value value="84" name="A8XX_PERF_CCU_RESERVED_84"/>
+	<value value="85" name="A8XX_PERF_CCU_RESERVED_85"/>
+	<value value="86" name="A8XX_PERF_CCU_RESERVED_86"/>
+	<value value="87" name="A8XX_PERF_CCU_RESERVED_87"/>
+	<value value="88" name="A8XX_PERF_CCU_RESERVED_88"/>
+	<value value="89" name="A8XX_PERF_CCU_RESERVED_89"/>
+	<value value="90" name="A8XX_PERF_CCU_RESERVED_90"/>
+	<value value="91" name="A8XX_PERF_CCU_RESERVED_91"/>
+	<value value="92" name="A8XX_PERF_CCU_RESERVED_92"/>
+	<value value="93" name="A8XX_PERF_CCU_RESERVED_93"/>
+	<value value="94" name="A8XX_PERF_CCU_RESERVED_94"/>
+	<value value="95" name="A8XX_PERF_CCU_RESERVED_95"/>
+	<value value="96" name="A8XX_PERF_CCU_RESERVED_96"/>
+	<value value="97" name="A8XX_PERF_CCU_RESERVED_97"/>
+	<value value="98" name="A8XX_PERF_CCU_RESERVED_98"/>
+	<value value="99" name="A8XX_PERF_CCU_RESERVED_99"/>
+	<value value="100" name="A8XX_PERF_CCU_RESERVED_100"/>
+	<value value="101" name="A8XX_PERF_CCU_RESERVED_101"/>
+	<value value="102" name="A8XX_PERF_CCU_RESERVED_102"/>
+	<value value="103" name="A8XX_PERF_CCU_RESERVED_103"/>
+	<value value="104" name="A8XX_PERF_CCU_RESERVED_104"/>
+	<value value="105" name="A8XX_PERF_CCU_RESERVED_105"/>
+	<value value="106" name="A8XX_PERF_CCU_RESERVED_106"/>
+	<value value="107" name="A8XX_PERF_CCU_RESERVED_107"/>
+	<value value="108" name="A8XX_PERF_CCU_RESERVED_108"/>
+	<value value="109" name="A8XX_PERF_CCU_RESERVED_109"/>
+	<value value="110" name="A8XX_PERF_CCU_RESERVED_110"/>
+	<value value="111" name="A8XX_PERF_CCU_RESERVED_111"/>
+	<value value="112" name="A8XX_PERF_CCU_RESERVED_112"/>
+	<value value="113" name="A8XX_PERF_CCU_RESERVED_113"/>
+	<value value="114" name="A8XX_PERF_CCU_RESERVED_114"/>
+	<value value="115" name="A8XX_PERF_CCU_RESERVED_115"/>
+	<value value="116" name="A8XX_PERF_CCU_RESERVED_116"/>
+	<value value="117" name="A8XX_PERF_CCU_RESERVED_117"/>
+	<value value="118" name="A8XX_PERF_CCU_RESERVED_118"/>
+	<value value="119" name="A8XX_PERF_CCU_RESERVED_119"/>
+	<value value="120" name="A8XX_PERF_CCU_RESERVED_120"/>
+	<value value="121" name="A8XX_PERF_CCU_RESERVED_121"/>
+	<value value="122" name="A8XX_PERF_CCU_RESERVED_122"/>
+	<value value="123" name="A8XX_PERF_CCU_RESERVED_123"/>
+	<value value="124" name="A8XX_PERF_CCU_RESERVED_124"/>
+	<value value="125" name="A8XX_PERF_CCU_RESERVED_125"/>
+	<value value="126" name="A8XX_PERF_CCU_RESERVED_126"/>
+	<value value="127" name="A8XX_PERF_CCU_RESERVED_127"/>
+	<value value="128" name="A8XX_PERF_CRE_RESOLVE_EVENTS"/>
+	<value value="129" name="A8XX_PERF_CRE_CONCURRENT_RESOLVE_EVENTS"/>
+	<value value="130" name="A8XX_PERF_CRE_DROPPED_CLEAR_EVENTS"/>
+	<value value="131" name="A8XX_PERF_CRE_ST_BLOCKS_CONCURRENT"/>
+	<value value="132" name="A8XX_PERF_CRE_LRZ_ST_BLOCKS_CONCURRENT"/>
+	<value value="133" name="A8XX_PERF_CRE_SP_UFC_PREFETCH_REQUESTS"/>
+	<value value="134" name="A8XX_PERF_CRE_RESOLVE_CDP_PREFETCH_REQUESTS"/>
+	<value value="135" name="A8XX_PERF_CRE_RESOLVE_UFC_PREFETCH_REQUESTS"/>
+	<value value="136" name="A8XX_PERF_CRE_DR_UFC_PREFTCH_REQUESTS"/>
+</enum>
+
+<enum name="a8xx_lrz_perfcounter_select">
+	<value value="0" name="A8XX_PERF_LRZ_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_LRZ_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_LRZ_STARVE_CYCLES_RAS"/>
+	<value value="3" name="A8XX_PERF_LRZ_STALL_CYCLES_RB"/>
+	<value value="4" name="A8XX_PERF_LRZ_STALL_CYCLES_VSC"/>
+	<value value="5" name="A8XX_PERF_LRZ_STALL_CYCLES_VPC_BE"/>
+	<value value="6" name="A8XX_PERF_LRZ_STALL_CYCLES_FLAG_ACR"/>
+	<value value="7" name="A8XX_PERF_LRZ_STALL_CYCLES_UCHE"/>
+	<value value="8" name="A8XX_PERF_LRZ_LRZ_READ"/>
+	<value value="9" name="A8XX_PERF_LRZ_LRZ_WRITE"/>
+	<value value="10" name="A8XX_PERF_LRZ_READ_LATENCY"/>
+	<value value="11" name="A8XX_PERF_LRZ_MERGE_CACHE_UPDATING"/>
+	<value value="12" name="A8XX_PERF_LRZ_PRIM_KILLED_BY_MASKGEN"/>
+	<value value="13" name="A8XX_PERF_LRZ_PRIM_KILLED_BY_LRZ"/>
+	<value value="14" name="A8XX_PERF_LRZ_VISIBLE_PRIM_AFTER_LRZ"/>
+	<value value="15" name="A8XX_PERF_LRZ_FULL_8X8_TILES"/>
+	<value value="16" name="A8XX_PERF_LRZ_PARTIAL_8X8_TILES"/>
+	<value value="17" name="A8XX_PERF_LRZ_TILE_KILLED"/>
+	<value value="18" name="A8XX_PERF_LRZ_TOTAL_PIXEL"/>
+	<value value="19" name="A8XX_PERF_LRZ_VISIBLE_PIXEL_AFTER_LRZ"/>
+	<value value="20" name="A8XX_PERF_LRZ_FEEDBACK_ACCEPT"/>
+	<value value="21" name="A8XX_PERF_LRZ_FEEDBACK_DISCARD"/>
+	<value value="22" name="A8XX_PERF_LRZ_FEEDBACK_STALL"/>
+	<value value="23" name="A8XX_PERF_LRZ_STALL_CYCLES_RB_ZPLANE"/>
+	<value value="24" name="A8XX_PERF_LRZ_STALL_CYCLES_RB_BPLANE"/>
+	<value value="25" name="A8XX_PERF_LRZ_RAS_MASK_TRANS"/>
+	<value value="26" name="A8XX_PERF_LRZ_STALL_CYCLES_MVC"/>
+	<value value="27" name="A8XX_PERF_LRZ_TILE_KILLED_BY_IMAGE_VRS"/>
+	<value value="28" name="A8XX_PERF_LRZ_TILE_KILLED_BY_Z"/>
+	<value value="29" name="A8XX_PERF_LRZ_STALL_CYCLES_HLSQ_BATCH"/>
+	<value value="30" name="A8XX_PERF_LRZ_NUM_FLOCK"/>
+	<value value="31" name="A8XX_PERF_LRZ_DRAWS_TOTAL"/>
+	<value value="32" name="A8XX_PERF_LRZ_DRAWS_LRZ_DIS"/>
+	<value value="33" name="A8XX_PERF_LRZ_DRAWS_LRZ_WRITE_DIS"/>
+</enum>
+
+<enum name="a8xx_cmp_perfcounter_select">
+	<value value="0" name="A8XX_PERF_CMPDECMP_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_CMPDECMP_STALL_CYCLES_ARB"/>
+	<value value="2" name="A8XX_PERF_CMPDECMP_VBIF_LATENCY_CYCLES"/>
+	<value value="3" name="A8XX_PERF_CMPDECMP_VBIF_LATENCY_SAMPLES"/>
+	<value value="4" name="A8XX_PERF_CMPDECMP_VBIF_READ_DATA_CCU"/>
+	<value value="5" name="A8XX_PERF_CMPDECMP_VBIF_WRITE_DATA_CCU"/>
+	<value value="6" name="A8XX_PERF_CMPDECMP_VBIF_READ_REQUEST"/>
+	<value value="7" name="A8XX_PERF_CMPDECMP_VBIF_WRITE_REQUEST"/>
+	<value value="8" name="A8XX_PERF_CMPDECMP_VBIF_READ_DATA"/>
+	<value value="9" name="A8XX_PERF_CMPDECMP_VBIF_WRITE_DATA"/>
+	<value value="10" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG1_COUNT"/>
+	<value value="11" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG2_COUNT"/>
+	<value value="12" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG3_COUNT"/>
+	<value value="13" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG4_COUNT"/>
+	<value value="14" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG5_COUNT"/>
+	<value value="15" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG6_COUNT"/>
+	<value value="16" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG8_COUNT"/>
+	<value value="17" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG1_COUNT"/>
+	<value value="18" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG2_COUNT"/>
+	<value value="19" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG3_COUNT"/>
+	<value value="20" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG4_COUNT"/>
+	<value value="21" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG5_COUNT"/>
+	<value value="22" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG6_COUNT"/>
+	<value value="23" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG8_COUNT"/>
+	<value value="24" name="A8XX_PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH0"/>
+	<value value="25" name="A8XX_PERF_CMPDECMP_VBIF_READ_DATA_UCHE_CH1"/>
+	<value value="26" name="A8XX_PERF_CMPDECMP_VBIF_WRITE_DATA_UCHE"/>
+	<value value="27" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG0_COUNT"/>
+	<value value="28" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG0_COUNT"/>
+	<value value="29" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAGALPHA_COUNT"/>
+	<value value="30" name="A8XX_PERF_CMPDECMP_CDP_FILTER_HIT"/>
+	<value value="31" name="A8XX_PERF_CMPDECMP_CDP_FILTER_MISS"/>
+	<value value="32" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG0_COUNT"/>
+	<value value="33" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG1_COUNT"/>
+	<value value="34" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG2_COUNT"/>
+	<value value="35" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG3_COUNT"/>
+	<value value="36" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG4_COUNT"/>
+	<value value="37" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG5_COUNT"/>
+	<value value="38" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG6_COUNT"/>
+	<value value="39" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG8_COUNT"/>
+	<value value="40" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG0_COUNT"/>
+	<value value="41" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG1_COUNT"/>
+	<value value="42" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG2_COUNT"/>
+	<value value="43" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG3_COUNT"/>
+	<value value="44" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG4_COUNT"/>
+	<value value="45" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG5_COUNT"/>
+	<value value="46" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG6_COUNT"/>
+	<value value="47" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG8_COUNT"/>
+	<value value="48" name="A8XX_PERF_CMPDECMP_UFC_REQ_CCU"/>
+	<value value="49" name="A8XX_PERF_CMPDECMP_UFC_REQ_UCHE"/>
+	<value value="50" name="A8XX_PERF_CMPDECMP_INPUT_STALL_CYCLES_ENC"/>
+	<value value="51" name="A8XX_PERF_CMPDECMP_ENC_STALL_CYCLES_UFC"/>
+	<value value="52" name="A8XX_PERF_CMPDECMP_ENC_STALL_CYCLES_GBIF_DATA"/>
+	<value value="53" name="A8XX_PERF_CMPDECMP_ENC_STALL_CYCLES_GBIF_CMD"/>
+	<value value="54" name="A8XX_PERF_CMPDECMP_INPUT_STALL_CYCLES_DEC"/>
+	<value value="55" name="A8XX_PERF_CMPDECMP_DEC_STALL_CYCLES_OUTPUT"/>
+	<value value="56" name="A8XX_PERF_CMPDECMP_REQ_SSEC_FLAG_COMP"/>
+	<value value="57" name="A8XX_PERF_CMPDECMP_CCU_EVENT_SKEW_STALL"/>
+	<value value="58" name="A8XX_PERF_CMPDECMP_CCU_BV_EVENT_SKEW_STALL"/>
+	<value value="59" name="A8XX_PERF_CMPDECMP_DEPTH_WRITE_FLAG7_COUNT"/>
+	<value value="60" name="A8XX_PERF_CMPDECMP_COLOR_WRITE_FLAG7_COUNT"/>
+	<value value="61" name="A8XX_PERF_CMPDECMP_DEPTH_READ_FLAG7_COUNT"/>
+	<value value="62" name="A8XX_PERF_CMPDECMP_COLOR_READ_FLAG7_COUNT"/>
+</enum>
+
+<enum name="a8xx_gbif_perfcounter_select">
+	<value value="0" name="A8XX_PERF_GBIF_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_GBIF_RESERVED_1"/>
+	<value value="2" name="A8XX_PERF_GBIF_RESERVED_2"/>
+	<value value="3" name="A8XX_PERF_GBIF_RESERVED_3"/>
+	<value value="4" name="A8XX_PERF_GBIF_RESERVED_4"/>
+	<value value="5" name="A8XX_PERF_GBIF_RESERVED_5"/>
+	<value value="6" name="A8XX_PERF_GBIF_RESERVED_6"/>
+	<value value="7" name="A8XX_PERF_GBIF_RESERVED_7"/>
+	<value value="8" name="A8XX_PERF_GBIF_RESERVED_8"/>
+	<value value="9" name="A8XX_PERF_GBIF_RESERVED_9"/>
+	<value value="10" name="A8XX_PERF_GBIF_AXI0_READ_REQUESTS_TOTAL"/>
+	<value value="11" name="A8XX_PERF_GBIF_AXI1_READ_REQUESTS_TOTAL"/>
+	<value value="12" name="A8XX_PERF_GBIF_RESERVED_12"/>
+	<value value="13" name="A8XX_PERF_GBIF_RESERVED_13"/>
+	<value value="14" name="A8XX_PERF_GBIF_RESERVED_14"/>
+	<value value="15" name="A8XX_PERF_GBIF_RESERVED_15"/>
+	<value value="16" name="A8XX_PERF_GBIF_RESERVED_16"/>
+	<value value="17" name="A8XX_PERF_GBIF_RESERVED_17"/>
+	<value value="18" name="A8XX_PERF_GBIF_RESERVED_18"/>
+	<value value="19" name="A8XX_PERF_GBIF_RESERVED_19"/>
+	<value value="20" name="A8XX_PERF_GBIF_RESERVED_20"/>
+	<value value="21" name="A8XX_PERF_GBIF_RESERVED_21"/>
+	<value value="22" name="A8XX_PERF_GBIF_AXI0_WRITE_REQUESTS_TOTAL"/>
+	<value value="23" name="A8XX_PERF_GBIF_AXI1_WRITE_REQUESTS_TOTAL"/>
+	<value value="24" name="A8XX_PERF_GBIF_RESERVED_24"/>
+	<value value="25" name="A8XX_PERF_GBIF_RESERVED_25"/>
+	<value value="26" name="A8XX_PERF_GBIF_RESERVED_26"/>
+	<value value="27" name="A8XX_PERF_GBIF_RESERVED_27"/>
+	<value value="28" name="A8XX_PERF_GBIF_RESERVED_28"/>
+	<value value="29" name="A8XX_PERF_GBIF_RESERVED_29"/>
+	<value value="30" name="A8XX_PERF_GBIF_RESERVED_30"/>
+	<value value="31" name="A8XX_PERF_GBIF_RESERVED_31"/>
+	<value value="32" name="A8XX_PERF_GBIF_RESERVED_32"/>
+	<value value="33" name="A8XX_PERF_GBIF_RESERVED_33"/>
+	<value value="34" name="A8XX_PERF_GBIF_AXI0_READ_DATA_BEATS_TOTAL"/>
+	<value value="35" name="A8XX_PERF_GBIF_AXI1_READ_DATA_BEATS_TOTAL"/>
+	<value value="36" name="A8XX_PERF_GBIF_RESERVED_36"/>
+	<value value="37" name="A8XX_PERF_GBIF_RESERVED_37"/>
+	<value value="38" name="A8XX_PERF_GBIF_RESERVED_38"/>
+	<value value="39" name="A8XX_PERF_GBIF_RESERVED_39"/>
+	<value value="40" name="A8XX_PERF_GBIF_RESERVED_40"/>
+	<value value="41" name="A8XX_PERF_GBIF_RESERVED_41"/>
+	<value value="42" name="A8XX_PERF_GBIF_RESERVED_42"/>
+	<value value="43" name="A8XX_PERF_GBIF_RESERVED_43"/>
+	<value value="44" name="A8XX_PERF_GBIF_RESERVED_44"/>
+	<value value="45" name="A8XX_PERF_GBIF_RESERVED_45"/>
+	<value value="46" name="A8XX_PERF_GBIF_AXI0_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="47" name="A8XX_PERF_GBIF_AXI1_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="48" name="A8XX_PERF_GBIF_RESERVED_48"/>
+	<value value="49" name="A8XX_PERF_GBIF_RESERVED_49"/>
+	<value value="50" name="A8XX_PERF_GBIF_RESERVED_50"/>
+	<value value="51" name="A8XX_PERF_GBIF_RESERVED_51"/>
+	<value value="52" name="A8XX_PERF_GBIF_RESERVED_52"/>
+	<value value="53" name="A8XX_PERF_GBIF_RESERVED_53"/>
+	<value value="54" name="A8XX_PERF_GBIF_RESERVED_54"/>
+	<value value="55" name="A8XX_PERF_GBIF_RESERVED_55"/>
+	<value value="56" name="A8XX_PERF_GBIF_RESERVED_56"/>
+	<value value="57" name="A8XX_PERF_GBIF_RESERVED_57"/>
+	<value value="58" name="A8XX_PERF_GBIF_RESERVED_58"/>
+	<value value="59" name="A8XX_PERF_GBIF_RESERVED_59"/>
+	<value value="60" name="A8XX_PERF_GBIF_RESERVED_60"/>
+	<value value="61" name="A8XX_PERF_GBIF_RESERVED_61"/>
+	<value value="62" name="A8XX_PERF_GBIF_RESERVED_62"/>
+	<value value="63" name="A8XX_PERF_GBIF_RESERVED_63"/>
+	<value value="64" name="A8XX_PERF_GBIF_RESERVED_64"/>
+	<value value="65" name="A8XX_PERF_GBIF_RESERVED_65"/>
+	<value value="66" name="A8XX_PERF_GBIF_RESERVED_66"/>
+	<value value="67" name="A8XX_PERF_GBIF_RESERVED_67"/>
+	<value value="68" name="A8XX_PERF_GBIF_CYCLES_CH0_HELD_OFF_RD_ALL"/>
+	<value value="69" name="A8XX_PERF_GBIF_CYCLES_CH1_HELD_OFF_RD_ALL"/>
+	<value value="70" name="A8XX_PERF_GBIF_CYCLES_CH0_HELD_OFF_WR_ALL"/>
+	<value value="71" name="A8XX_PERF_GBIF_CYCLES_CH1_HELD_OFF_WR_ALL"/>
+	<value value="72" name="A8XX_PERF_GBIF_AXI_CH0_REQUEST_HELD_OFF"/>
+	<value value="73" name="A8XX_PERF_GBIF_AXI_CH1_REQUEST_HELD_OFF"/>
+	<value value="74" name="A8XX_PERF_GBIF_AXI_REQUEST_HELD_OFF"/>
+	<value value="75" name="A8XX_PERF_GBIF_AXI_CH0_WRITE_DATA_HELD_OFF"/>
+	<value value="76" name="A8XX_PERF_GBIF_AXI_CH1_WRITE_DATA_HELD_OFF"/>
+	<value value="77" name="A8XX_PERF_GBIF_AXI_ALL_WRITE_DATA_HELD_OFF"/>
+	<value value="78" name="A8XX_PERF_GBIF_RESERVED_78"/>
+	<value value="79" name="A8XX_PERF_GBIF_RESERVED_79"/>
+	<value value="80" name="A8XX_PERF_GBIF_RESERVED_80"/>
+	<value value="81" name="A8XX_PERF_GBIF_RESERVED_81"/>
+	<value value="82" name="A8XX_PERF_GBIF_RESERVED_82"/>
+	<value value="83" name="A8XX_PERF_GBIF_RESERVED_83"/>
+	<value value="84" name="A8XX_PERF_GBIF_RESERVED_84"/>
+	<value value="85" name="A8XX_PERF_GBIF_RESERVED_85"/>
+	<value value="86" name="A8XX_PERF_GBIF_RESERVED_86"/>
+	<value value="87" name="A8XX_PERF_GBIF_RESERVED_87"/>
+	<value value="88" name="A8XX_PERF_GBIF_AXI2_READ_REQUESTS_TOTAL"/>
+	<value value="89" name="A8XX_PERF_GBIF_AXI3_READ_REQUESTS_TOTAL"/>
+	<value value="90" name="A8XX_PERF_GBIF_RESERVED_90"/>
+	<value value="91" name="A8XX_PERF_GBIF_RESERVED_91"/>
+	<value value="92" name="A8XX_PERF_GBIF_RESERVED_92"/>
+	<value value="93" name="A8XX_PERF_GBIF_RESERVED_93"/>
+	<value value="94" name="A8XX_PERF_GBIF_RESERVED_94"/>
+	<value value="95" name="A8XX_PERF_GBIF_RESERVED_95"/>
+	<value value="96" name="A8XX_PERF_GBIF_RESERVED_96"/>
+	<value value="97" name="A8XX_PERF_GBIF_RESERVED_97"/>
+	<value value="98" name="A8XX_PERF_GBIF_RESERVED_98"/>
+	<value value="99" name="A8XX_PERF_GBIF_RESERVED_99"/>
+	<value value="100" name="A8XX_PERF_GBIF_AXI2_WRITE_REQUESTS_TOTAL"/>
+	<value value="101" name="A8XX_PERF_GBIF_AXI3_WRITE_REQUESTS_TOTAL"/>
+	<value value="102" name="A8XX_PERF_GBIF_RESERVED_102"/>
+	<value value="103" name="A8XX_PERF_GBIF_RESERVED_103"/>
+	<value value="104" name="A8XX_PERF_GBIF_RESERVED_104"/>
+	<value value="105" name="A8XX_PERF_GBIF_RESERVED_105"/>
+	<value value="106" name="A8XX_PERF_GBIF_RESERVED_106"/>
+	<value value="107" name="A8XX_PERF_GBIF_RESERVED_107"/>
+	<value value="108" name="A8XX_PERF_GBIF_RESERVED_108"/>
+	<value value="109" name="A8XX_PERF_GBIF_RESERVED_109"/>
+	<value value="110" name="A8XX_PERF_GBIF_RESERVED_110"/>
+	<value value="111" name="A8XX_PERF_GBIF_RESERVED_111"/>
+	<value value="112" name="A8XX_PERF_GBIF_AXI2_READ_DATA_BEATS_TOTAL"/>
+	<value value="113" name="A8XX_PERF_GBIF_AXI3_READ_DATA_BEATS_TOTAL"/>
+	<value value="114" name="A8XX_PERF_GBIF_RESERVED_114"/>
+	<value value="115" name="A8XX_PERF_GBIF_RESERVED_115"/>
+	<value value="116" name="A8XX_PERF_GBIF_RESERVED_116"/>
+	<value value="117" name="A8XX_PERF_GBIF_RESERVED_117"/>
+	<value value="118" name="A8XX_PERF_GBIF_RESERVED_118"/>
+	<value value="119" name="A8XX_PERF_GBIF_RESERVED_119"/>
+	<value value="120" name="A8XX_PERF_GBIF_RESERVED_120"/>
+	<value value="121" name="A8XX_PERF_GBIF_RESERVED_121"/>
+	<value value="122" name="A8XX_PERF_GBIF_RESERVED_122"/>
+	<value value="123" name="A8XX_PERF_GBIF_RESERVED_123"/>
+	<value value="124" name="A8XX_PERF_GBIF_AXI2_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="125" name="A8XX_PERF_GBIF_AXI3_WRITE_DATA_BEATS_TOTAL"/>
+	<value value="126" name="A8XX_PERF_GBIF_RESERVED_126"/>
+	<value value="127" name="A8XX_PERF_GBIF_RESERVED_127"/>
+	<value value="128" name="A8XX_PERF_GBIF_RESERVED_128"/>
+	<value value="129" name="A8XX_PERF_GBIF_RESERVED_129"/>
+	<value value="130" name="A8XX_PERF_GBIF_RESERVED_130"/>
+	<value value="131" name="A8XX_PERF_GBIF_RESERVED_131"/>
+	<value value="132" name="A8XX_PERF_GBIF_RESERVED_132"/>
+	<value value="133" name="A8XX_PERF_GBIF_RESERVED_133"/>
+	<value value="134" name="A8XX_PERF_GBIF_RESERVED_134"/>
+	<value value="135" name="A8XX_PERF_GBIF_RESERVED_135"/>
+	<value value="136" name="A8XX_PERF_GBIF_RESERVED_136"/>
+	<value value="137" name="A8XX_PERF_GBIF_RESERVED_137"/>
+	<value value="138" name="A8XX_PERF_GBIF_RESERVED_138"/>
+	<value value="139" name="A8XX_PERF_GBIF_RESERVED_139"/>
+	<value value="140" name="A8XX_PERF_GBIF_RESERVED_140"/>
+	<value value="141" name="A8XX_PERF_GBIF_RESERVED_141"/>
+	<value value="142" name="A8XX_PERF_GBIF_RESERVED_142"/>
+	<value value="143" name="A8XX_PERF_GBIF_RESERVED_143"/>
+	<value value="144" name="A8XX_PERF_GBIF_RESERVED_144"/>
+	<value value="145" name="A8XX_PERF_GBIF_RESERVED_145"/>
+	<value value="146" name="A8XX_PERF_GBIF_RESERVED_146"/>
+	<value value="147" name="A8XX_PERF_GBIF_RESERVED_147"/>
+	<value value="148" name="A8XX_PERF_GBIF_RESERVED_148"/>
+	<value value="149" name="A8XX_PERF_GBIF_RESERVED_149"/>
+	<value value="150" name="A8XX_PERF_GBIF_READ_BEAT_ALL_CHANNELS"/>
+	<value value="151" name="A8XX_PERF_GBIF_WRITE_BEAT_ALL_CHANNELS"/>
+	<value value="152" name="A8XX_PERF_GBIF_READ_AND_WRITE_BEAT_ALL_CHANNELS"/>
+	<value value="153" name="A8XX_PERF_GBIF_RESERVED_153"/>
+	<value value="154" name="A8XX_PERF_GBIF_RESERVED_154"/>
+	<value value="155" name="A8XX_PERF_GBIF_RESERVED_155"/>
+	<value value="156" name="A8XX_PERF_GBIF_CYCLES_CH2_HELD_OFF_RD_ALL"/>
+	<value value="157" name="A8XX_PERF_GBIF_CYCLES_CH3_HELD_OFF_RD_ALL"/>
+	<value value="158" name="A8XX_PERF_GBIF_CYCLES_CH2_HELD_OFF_WR_ALL"/>
+	<value value="159" name="A8XX_PERF_GBIF_CYCLES_CH3_HELD_OFF_WR_ALL"/>
+	<value value="160" name="A8XX_PERF_GBIF_AXI_CH2_REQUEST_HELD_OFF"/>
+	<value value="161" name="A8XX_PERF_GBIF_AXI_CH3_REQUEST_HELD_OFF"/>
+	<value value="162" name="A8XX_PERF_GBIF_AXI_CH2_WRITE_DATA_HELD_OFF"/>
+	<value value="163" name="A8XX_PERF_GBIF_AXI_CH3_WRITE_DATA_HELD_OFF"/>
+	<value value="164" name="A8XX_PERF_GBIF_AXI_CH0_READ_PENDING_SUM"/>
+	<value value="165" name="A8XX_PERF_GBIF_AXI_CH1_READ_PENDING_SUM"/>
+	<value value="166" name="A8XX_PERF_GBIF_AXI_CH2_READ_PENDING_SUM"/>
+	<value value="167" name="A8XX_PERF_GBIF_AXI_CH3_READ_PENDING_SUM"/>
+	<value value="168" name="A8XX_PERF_GBIF_AXI_CH0_WRITE_PENDING_SUM"/>
+	<value value="169" name="A8XX_PERF_GBIF_AXI_CH1_WRITE_PENDING_SUM"/>
+	<value value="170" name="A8XX_PERF_GBIF_AXI_CH2_WRITE_PENDING_SUM"/>
+	<value value="171" name="A8XX_PERF_GBIF_AXI_CH3_WRITE_PENDING_SUM"/>
+	<value value="172" name="A8XX_PERF_GBIF_SMMU_RD_REQ_SAMPLES_CH0"/>
+	<value value="173" name="A8XX_PERF_GBIF_SMMU_RD_REQ_CYCLES_CH0"/>
+	<value value="174" name="A8XX_PERF_GBIF_RBUF_RD_REQ_SAMPLES_CH0"/>
+	<value value="175" name="A8XX_PERF_GBIF_RBUF_RD_REQ_CYCLES_CH0"/>
+	<value value="176" name="A8XX_PERF_GBIF_RBUF_UTIL_SAMPLES_CH0"/>
+	<value value="177" name="A8XX_PERF_GBIF_RBUF_BUSY_CYCLES_CH0"/>
+	<value value="178" name="A8XX_PERF_GBIF_RTABLE_OT_UTIL_SAMPLES_CH0"/>
+	<value value="179" name="A8XX_PERF_GBIF_SMMU_RD_REQ_SAMPLES_CH1"/>
+	<value value="180" name="A8XX_PERF_GBIF_SMMU_RD_REQ_CYCLES_CH1"/>
+	<value value="181" name="A8XX_PERF_GBIF_RBUF_RD_REQ_SAMPLES_CH1"/>
+	<value value="182" name="A8XX_PERF_GBIF_RBUF_RD_REQ_CYCLES_CH1"/>
+	<value value="183" name="A8XX_PERF_GBIF_RBUF_UTIL_SAMPLES_CH1"/>
+	<value value="184" name="A8XX_PERF_GBIF_RBUF_BUSY_CYCLES_CH1"/>
+	<value value="185" name="A8XX_PERF_GBIF_RTABLE_OT_UTIL_SAMPLES_CH1"/>
+	<value value="186" name="A8XX_PERF_GBIF_SMMU_RD_REQ_SAMPLES_CH2"/>
+	<value value="187" name="A8XX_PERF_GBIF_SMMU_RD_REQ_CYCLES_CH2"/>
+	<value value="188" name="A8XX_PERF_GBIF_RBUF_RD_REQ_SAMPLES_CH2"/>
+	<value value="189" name="A8XX_PERF_GBIF_RBUF_RD_REQ_CYCLES_CH2"/>
+	<value value="190" name="A8XX_PERF_GBIF_RBUF_UTIL_SAMPLES_CH2"/>
+	<value value="191" name="A8XX_PERF_GBIF_RBUF_BUSY_CYCLES_CH2"/>
+	<value value="192" name="A8XX_PERF_GBIF_RTABLE_OT_UTIL_SAMPLES_CH2"/>
+	<value value="193" name="A8XX_PERF_GBIF_SMMU_RD_REQ_SAMPLES_CH3"/>
+	<value value="194" name="A8XX_PERF_GBIF_SMMU_RD_REQ_CYCLES_CH3"/>
+	<value value="195" name="A8XX_PERF_GBIF_RBUF_RD_REQ_SAMPLES_CH3"/>
+	<value value="196" name="A8XX_PERF_GBIF_RBUF_RD_REQ_CYCLES_CH3"/>
+	<value value="197" name="A8XX_PERF_GBIF_RBUF_UTIL_SAMPLES_CH3"/>
+	<value value="198" name="A8XX_PERF_GBIF_RBUF_BUSY_CYCLES_CH3"/>
+	<value value="199" name="A8XX_PERF_GBIF_RTABLE_OT_UTIL_SAMPLES_CH3"/>
+</enum>
+
+<enum name="a8xx_gbif_pwr_perfcounter_select">
+	<value value="0" name="A8XX_M0_STALL"/>
+	<value value="1" name="A8XX_M1_STALL"/>
+	<value value="2" name="A8XX_M0_NO_CLIENT_REQ"/>
+	<value value="3" name="A8XX_M1_NO_CLIENT_REQ"/>
+</enum>
+
+<enum name="a8xx_alwayson_perfcounter_select">
+	<value value="0" name="A8XX_PERF_ALWAYSON"/>
+</enum>
+
+<enum name="a8xx_gmu_xoclk_perfcounter_select">
+	<value value="0" name="A8XX_PERF_GMU_XOCLK_NO_COUNT"/>
+	<value value="1" name="A8XX_PERF_GMU_PWC_GPU_TOP_POWER_ON_CYCLES"/>
+	<value value="2" name="A8XX_PERF_GMU_PWC_GPU_TOP_POWER_OFF_SWITCHING_CYCLES"/>
+	<value value="3" name="A8XX_PERF_GMU_PWC_GPU_TOP_POWER_OFF_CYCLES"/>
+	<value value="4" name="A8XX_PERF_GMU_PWC_GPU_TOP_POWER_ON_SWITCHING_CYCLES"/>
+	<value value="5" name="A8XX_PERF_GMU_PWC_GPU_TOP_POWER_COLLAPSED"/>
+	<value value="6" name="A8XX_PERF_GMU_PWC_SPTPRAC_POWER_ON_CYCLES"/>
+	<value value="7" name="A8XX_PERF_GMU_PWC_SPTPRAC_POWER_OFF_SWITCHING_CYCLES"/>
+	<value value="8" name="A8XX_PERF_GMU_PWC_SPTPRAC_POWER_OFF_CYCLES"/>
+	<value value="9" name="A8XX_PERF_GMU_PWC_SPTPRAC_POWER_ON_SWITCHING_CYCLES"/>
+	<value value="10" name="A8XX_PERF_GMU_PWC_SPTPRAC_POWER_COLLAPSED"/>
+	<value value="11" name="A8XX_PERF_GMU_PWC_GPU_TOP_IDLE_PHASE1_IN_LATENCY"/>
+	<value value="12" name="A8XX_PERF_GMU_PWC_GPU_TOP_IDLE_PHASE2_IN_LATENCY"/>
+	<value value="13" name="A8XX_PERF_GMU_PWC_GPU_TOP_IDLE_PHASE1_OUT_LATENCY"/>
+	<value value="14" name="A8XX_PERF_GMU_PWC_GPU_TOP_IDLE_PHASE2_OUT_LATENCY"/>
+	<value value="15" name="A8XX_PERF_GMU_PWC_TOTAL_THROTTLED_CYCLES"/>
+	<value value="16" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_0"/>
+	<value value="17" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_1"/>
+	<value value="18" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_2"/>
+	<value value="19" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_3"/>
+	<value value="20" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_4"/>
+	<value value="21" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_5"/>
+	<value value="22" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_6"/>
+	<value value="23" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_7"/>
+	<value value="24" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_8"/>
+	<value value="25" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_9"/>
+	<value value="26" name="A8XX_PERF_GMU_PWC_NUM_GDPM_EPOCH_TOO_SHORT_INTR"/>
+	<value value="27" name="A8XX_PERF_GMU_PWC_NUM_GDPM_INVALID_OPCODE_INTR"/>
+	<value value="28" name="A8XX_PERF_GMU_PWC_NUM_MAX_THRESHOLD_BREACH"/>
+	<value value="29" name="A8XX_PERF_GMU_PWC_NUM_MIN_THRESHOLD_BREACH"/>
+	<value value="30" name="A8XX_PERF_GMU_PWC_CYCLE_MAX_THRESHOLD_BREACH"/>
+	<value value="31" name="A8XX_PERF_GMU_PWC_CYCLE_MIN_THRESHOLD_BREACH"/>
+	<value value="32" name="A8XX_PERF_GMU_PWC_GPU_BUSY_CYCLES"/>
+	<value value="33" name="A8XX_PERF_GMU_PWC_CYCLE_ALM_LOW_THROTTLE_CYCLES"/>
+	<value value="34" name="A8XX_PERF_GMU_PWC_CYCLE_ALM_HIGH_THROTTLE_CYCLES"/>
+	<value value="35" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_10"/>
+	<value value="36" name="A8XX_PERF_GMU_PWC_SID_N_TOTAL_THROTTLED_CYCLES_11"/>
+	<value value="37" name="A8XX_PERF_GMU_PWC_CLX_TOTAL_THROTTLE_CYCLES"/>
+	<value value="38" name="A8XX_PERF_GMU_PWC_BCL_TOTAL_THROTTLE_CYCLES"/>
+	<value value="39" name="A8XX_PERF_GMU_PWC_MSG2_CLX_TOTAL_THROTTLE_CYCLES"/>
+	<value value="40" name="A8XX_PERF_GMU_XOCLK_RESERVED_40"/>
+	<value value="41" name="A8XX_PERF_GMU_XOCLK_RESERVED_41"/>
+	<value value="42" name="A8XX_PERF_GMU_XOCLK_RESERVED_42"/>
+	<value value="43" name="A8XX_PERF_GMU_XOCLK_RESERVED_43"/>
+	<value value="44" name="A8XX_PERF_GMU_XOCLK_RESERVED_44"/>
+	<value value="45" name="A8XX_PERF_GMU_XOCLK_RESERVED_45"/>
+	<value value="46" name="A8XX_PERF_GMU_XOCLK_RESERVED_46"/>
+	<value value="47" name="A8XX_PERF_GMU_XOCLK_RESERVED_47"/>
+	<value value="48" name="A8XX_PERF_GMU_PWC_LPAC_BUSY_CYCLES"/>
+	<value value="49" name="A8XX_PERF_GMU_PWC_GPU_OR_LPAC_BUSY_CYCLES"/>
+	<value value="50" name="A8XX_PERF_GMU_PWC_GX_THROTTLE_VIOLATION_CNT"/>
+	<value value="51" name="A8XX_PERF_GMU_PWC_MX_THROTTLE_VIOLATION_CNT"/>
+	<value value="52" name="A8XX_PERF_GMU_PWC_PWRLIMITS_PREBUCK_THROTTLE_CYCLES"/>
+	<value value="53" name="A8XX_PERF_GMU_PWC_GX_IFF_THROTTLE_CYCLES"/>
+	<value value="54" name="A8XX_PERF_GMU_PWC_GFX_PCLX_THROTTLE_CYCLES"/>
+	<value value="55" name="A8XX_PERF_GMU_PWC_MX_IFF_THROTTLE_CYCLES"/>
+	<value value="56" name="A8XX_PERF_GMU_PWC_MX_PCLX_THROTTLE_CYCLES"/>
+	<value value="57" name="A8XX_PERF_GMU_XOCLK_RESERVED_57"/>
+	<value value="58" name="A8XX_PERF_GMU_XOCLK_RESERVED_58"/>
+	<value value="59" name="A8XX_PERF_GMU_XOCLK_RESERVED_59"/>
+	<value value="60" name="A8XX_PERF_GMU_XOCLK_RESERVED_60"/>
+	<value value="61" name="A8XX_PERF_GMU_XOCLK_RESERVED_61"/>
+	<value value="62" name="A8XX_PERF_GMU_XOCLK_RESERVED_62"/>
+	<value value="63" name="A8XX_PERF_GMU_XOCLK_RESERVED_63"/>
+	<value value="64" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_0_CNT"/>
+	<value value="65" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_1_CNT"/>
+	<value value="66" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_2_CNT"/>
+	<value value="67" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_3_CNT"/>
+	<value value="68" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_4_CNT"/>
+	<value value="69" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_5_CNT"/>
+	<value value="70" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_6_CNT"/>
+	<value value="71" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_7_CNT"/>
+	<value value="72" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_8_CNT"/>
+	<value value="73" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_9_CNT"/>
+	<value value="74" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_10_CNT"/>
+	<value value="75" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_11_CNT"/>
+	<value value="76" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_12_CNT"/>
+	<value value="77" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_13_CNT"/>
+	<value value="78" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_14_CNT"/>
+	<value value="79" name="A8XX_PERF_GMU_PWC_GXDCE_HIST_BIN_15_CNT"/>
+	<value value="80" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_0_CNT"/>
+	<value value="81" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_1_CNT"/>
+	<value value="82" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_2_CNT"/>
+	<value value="83" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_3_CNT"/>
+	<value value="84" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_4_CNT"/>
+	<value value="85" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_5_CNT"/>
+	<value value="86" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_6_CNT"/>
+	<value value="87" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_7_CNT"/>
+	<value value="88" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_8_CNT"/>
+	<value value="89" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_9_CNT"/>
+	<value value="90" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_10_CNT"/>
+	<value value="91" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_11_CNT"/>
+	<value value="92" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_12_CNT"/>
+	<value value="93" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_13_CNT"/>
+	<value value="94" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_14_CNT"/>
+	<value value="95" name="A8XX_PERF_GMU_PWC_GXCDYN_HIST_BIN_15_CNT"/>
+</enum>
+
+<enum name="a8xx_gmu_gmuclk_perfcounter_select">
+	<value value="0" name="A8XX_PERF_GMUCLK_NO_COUNT"/>
+	<value value="1" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_0"/>
+	<value value="2" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_1"/>
+	<value value="3" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_2"/>
+	<value value="4" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_3"/>
+	<value value="5" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_4"/>
+	<value value="6" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_5"/>
+	<value value="7" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_6"/>
+	<value value="8" name="A8XX_PERF_GMU_PWC_FW_INCREMENT_7"/>
+	<value value="9" name="A8XX_PERF_GMU_PWC_SOC_MIN_IDLE_VOTE"/>
+	<value value="10" name="A8XX_PERF_GMU_PWC_TSENSE_CBCAST_MSG"/>
+	<value value="11" name="A8XX_PERF_GMU_PWC_MXA_CBCAST_MSG"/>
+	<value value="12" name="A8XX_PERF_GMU_PWC_CX_CBCAST_MSG"/>
+	<value value="13" name="A8XX_PERF_GMU_PWC_GX_CBCAST_MSG"/>
+	<value value="14" name="A8XX_PERF_GMU_PWC_BCL_CBCAST_MSG"/>
+	<value value="15" name="A8XX_PERF_GMU_PWC_MXC_CBCAST_MSG"/>
+	<value value="16" name="A8XX_PERF_GMU_PWC_GENERIC_CBCAST_MSG"/>
+	<value value="17" name="A8XX_PERF_GMU_PWC_PMIC_CBCAST_MSG"/>
+	<value value="18" name="A8XX_PERF_GMU_PWC_CLX_CBCAST_MSG"/>
+	<value value="19" name="A8XX_PERF_GMU_PWC_PMICARB_CLX_IRQ"/>
+	<value value="20" name="A8XX_PERF_GMU_PWC_CLX_EXPIRE_CBCAST_MSG"/>
+	<value value="21" name="A8XX_PERF_GMU_PWC_PMICARB_CLX_EXPIRE_IRQ"/>
+	<value value="22" name="A8XX_PERF_GMU_PWC_MXC_CLX_CBCAST_MSG"/>
+	<value value="23" name="A8XX_PERF_GMU_PWC_BCL_TYPE_0_CBCAST_MSG"/>
+	<value value="24" name="A8XX_PERF_GMU_PWC_BCL_TYPE_1_CBCAST_MSG"/>
+	<value value="25" name="A8XX_PERF_GMU_PWC_BCL_TYPE_2_CBCAST_MSG"/>
+	<value value="26" name="A8XX_PERF_GMU_PWC_PMIC_MSG2_CBCAST_MSG"/>
+	<value value="27" name="A8XX_PERF_GMU_PWC_MSG2_CLX_START_CBCAST_MSG"/>
+	<value value="28" name="A8XX_PERF_GMU_PWC_MSG2_CLX_EXPIRE_CBCAST_MSG"/>
+	<value value="29" name="A8XX_PERF_GMU_PWC_GX_VRM_1_CBCAST_MSG"/>
+	<value value="30" name="A8XX_PERF_GMU_GMUCLK_RESERVED_30"/>
+	<value value="31" name="A8XX_PERF_GMU_GMUCLK_RESERVED_31"/>
+	<value value="32" name="A8XX_PERF_GMU_PWC_CTXT_DONE_BR"/>
+	<value value="33" name="A8XX_PERF_GMU_PWC_CTXT_DONE_BV"/>
+	<value value="34" name="A8XX_PERF_GMU_PWC_CTXT_DONE_LPAC"/>
+	<value value="35" name="A8XX_PERF_GMU_PWC_GFX_IFF_MSG"/>
+	<value value="36" name="A8XX_PERF_GMU_PWC_GFX_PCLX_MSG"/>
+	<value value="37" name="A8XX_PERF_GMU_PWC_MX_IFF_MSG"/>
+	<value value="38" name="A8XX_PERF_GMU_PWC_MX_PCLX_MSG"/>
+</enum>
+
+<enum name="a8xx_gmu_perf_perfcounter_select">
+	<value value="0" name="A8XX_PERF_GMU_NO_COUNT"/>
+	<value value="1" name="A8XX_PERF_GMU_CM3_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_GMU_DATA_CACHE_READ"/>
+	<value value="3" name="A8XX_PERF_GMU_DATA_CACHE_READ_MISS"/>
+	<value value="4" name="A8XX_PERF_GMU_DATA_CACHE_WRITE"/>
+	<value value="5" name="A8XX_PERF_GMU_DATA_CACHE_WRITE_MISS"/>
+	<value value="6" name="A8XX_PERF_GMU_DATA_CACHE_EVICTIONS"/>
+	<value value="7" name="A8XX_PERF_GMU_L0_INSTRUCTION_CACHE_READ"/>
+	<value value="8" name="A8XX_PERF_GMU_L0_INSTRUCTION_CACHE_READ_MISS"/>
+	<value value="9" name="A8XX_PERF_GMU_L1_INSTRUCTION_CACHE_READ"/>
+	<value value="10" name="A8XX_PERF_GMU_L1_INSTRUCTION_CACHE_READ_MISS"/>
+	<value value="11" name="A8XX_PERF_GMU_SYS_AHB_WRITE"/>
+	<value value="12" name="A8XX_PERF_GMU_SYS_AHB_WRITE_BUFFER_MISS"/>
+	<value value="13" name="A8XX_PERF_GMU_SYS_AHB_READ"/>
+	<value value="14" name="A8XX_PERF_GMU_SYS_AHB_READ_BUFFER_MISS"/>
+	<value value="15" name="A8XX_PERF_GMU_DATA_CACHE_AHB_TOTAL_WAIT_CYCLES"/>
+	<value value="16" name="A8XX_PERF_GMU_DATA_CACHE_VBIF_TOTAL_WAIT_CYCLES"/>
+	<value value="17" name="A8XX_PERF_GMU_INSTRUCTION_CACHE_AHB_TOTAL_WAIT_CYCLES"/>
+	<value value="18" name="A8XX_PERF_GMU_INSTRUCTION_CACHE_VBIF_TOTAL_WAIT_CYCLES"/>
+	<value value="19" name="A8XX_PERF_GMU_SYS_VBIF_AHB_TOTAL_WAIT_CYCLES"/>
+	<value value="20" name="A8XX_PERF_GMU_SYS__AHB_TOTAL_WAIT_CYCLES"/>
+	<value value="21" name="A8XX_PERF_GMU_TOTAL_INTR_LATENCY_CYCLES"/>
+	<value value="22" name="A8XX_PERF_GMU_WORST_INTR_LATENCY_CYCLES"/>
+	<value value="23" name="A8XX_PERF_GMU_TOTAL_OUTSTANDING_INTERRUPTS"/>
+</enum>
+
+<enum name="a8xx_ufc_perfcounter_select">
+	<value value="0" name="A8XX_PERF_UFC_NEVER_COUNT"/>
+	<value value="1" name="A8XX_PERF_UFC_BUSY_CYCLES"/>
+	<value value="2" name="A8XX_PERF_UFC_READ_DATA_VBIF"/>
+	<value value="3" name="A8XX_PERF_UFC_WRITE_DATA_VBIF"/>
+	<value value="4" name="A8XX_PERF_UFC_READ_REQUEST_VBIF"/>
+	<value value="5" name="A8XX_PERF_UFC_WRITE_REQUEST_VBIF"/>
+	<value value="6" name="A8XX_PERF_UFC_MAIN_HIT_CRE_PREFETCH"/>
+	<value value="7" name="A8XX_PERF_UFC_MAIN_HIT_SP_PREFETCH"/>
+	<value value="8" name="A8XX_PERF_UFC_MAIN_HIT_TP_PREFETCH"/>
+	<value value="9" name="A8XX_PERF_UFC_MAIN_HIT_UBWC_READ"/>
+	<value value="10" name="A8XX_PERF_UFC_MAIN_HIT_UBWC_WRITE"/>
+	<value value="11" name="A8XX_PERF_UFC_MAIN_MISS_CRE_PREFETCH"/>
+	<value value="12" name="A8XX_PERF_UFC_MAIN_MISS_SP_PREFETCH"/>
+	<value value="13" name="A8XX_PERF_UFC_MAIN_MISS_TP_PREFETCH"/>
+	<value value="14" name="A8XX_PERF_UFC_MAIN_MISS_UBWC_READ"/>
+	<value value="15" name="A8XX_PERF_UFC_MAIN_MISS_UBWC_WRITE"/>
+	<value value="16" name="A8XX_PERF_UFC_MAIN_UBWC_RD_NRDY"/>
+	<value value="17" name="A8XX_PERF_UFC_MAIN_UBWC_RD_RDY"/>
+	<value value="18" name="A8XX_PERF_UFC_MAIN_TP_RD_NRDY"/>
+	<value value="19" name="A8XX_PERF_UFC_MAIN_TP_RD_RDY"/>
+	<value value="20" name="A8XX_PERF_UFC_STALL_CYCLES_GBIF_CMD"/>
+	<value value="21" name="A8XX_PERF_UFC_STALL_CYCLES_GBIF_RDATA"/>
+	<value value="22" name="A8XX_PERF_UFC_STALL_CYCLES_GBIF_WDATA"/>
+	<value value="23" name="A8XX_PERF_UFC_STALL_CYCLES_UBWC_WR_FLAG"/>
+	<value value="24" name="A8XX_PERF_UFC_STALL_CYCLES_UBWC_FLAG_RTN"/>
+	<value value="25" name="A8XX_PERF_UFC_STALL_CYCLES_UBWC_EVENT"/>
+	<value value="26" name="A8XX_PERF_UFC_UBWC_REQ_STALLED_CYCLES"/>
+	<value value="27" name="A8XX_PERF_UFC_UBWC_RD_STALLED_CYCLES"/>
+	<value value="28" name="A8XX_PERF_UFC_UBWC_WR_STALLED_CYCLES"/>
+	<value value="29" name="A8XX_PERF_UFC_PREFETCH_STALLED_CYCLES"/>
+	<value value="30" name="A8XX_PERF_UFC_EVICTION_STALLED_CYCLES"/>
+	<value value="31" name="A8XX_PERF_UFC_LOCK_STALLED_CYCLES"/>
+	<value value="32" name="A8XX_PERF_UFC_MISS_LATENCY_CYCLES"/>
+	<value value="33" name="A8XX_PERF_UFC_MISS_LATENCY_SAMPLES"/>
+	<value value="34" name="A8XX_PERF_UFC_L1_CRE_REQUESTS"/>
+	<value value="35" name="A8XX_PERF_UFC_L1_CRE_STALLED_CYCLES"/>
+	<value value="36" name="A8XX_PERF_UFC_L1_CRE_FILTER_HIT"/>
+	<value value="37" name="A8XX_PERF_UFC_L1_CRE_FILTER_MISS"/>
+	<value value="38" name="A8XX_PERF_UFC_L1_SP_REQUESTS"/>
+	<value value="39" name="A8XX_PERF_UFC_L1_SP_STALLED_CYCLES"/>
+	<value value="40" name="A8XX_PERF_UFC_L1_SP_FILTER_HIT"/>
+	<value value="41" name="A8XX_PERF_UFC_L1_SP_FILTER_MISS"/>
+	<value value="42" name="A8XX_PERF_UFC_L1_TP_HINT_REQUESTS"/>
+	<value value="43" name="A8XX_PERF_UFC_L1_TP_STALLED_CYCLES"/>
+	<value value="44" name="A8XX_PERF_UFC_L1_TP_HINT_TAG_MISS"/>
+	<value value="45" name="A8XX_PERF_UFC_L1_TP_HINT_TAG_HIT_RDY"/>
+	<value value="46" name="A8XX_PERF_UFC_L1_TP_HINT_TAG_HIT_NRDY"/>
+	<value value="47" name="A8XX_PERF_UFC_AUTO_EVICTIONS"/>
+	<value value="48" name="A8XX_PERF_UFC_PARTIAL_EVICTIONS"/>
+</enum>
+
+</database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
index 79d204f1e400..195cee078357 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_common.xml
@@ -14,6 +14,27 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value name="A8XX" value="8"/>
 </enum>
 
+<enum name="desctype" bare="yes">
+	<value name="DESC_NONE" value="0"/>
+	<doc>
+		TEX_MEMOBJ descriptor types.  These are used
+		to mark fields that only apply to certain
+		descriptor types, and potentially overlap
+		with fields in other types.
+	</doc>
+	<value name="DESC_SINGLE_PLANE" value="1"/>
+	<value name="DESC_MULTI_PLANE" value="2"/>
+	<value name="DESC_BUFFER" value="3"/>
+	<value name="DESC_WEIGHT" value="4"/>
+	<doc>
+		Additional descriptor types not part of
+		TEX_MEMOBJ.  These are described by their
+		own toplevel domain.
+	</doc>
+	<value name="DESC_SAMPLER" value="10"/> <!-- AxXX_UBO -->
+	<value name="DESC_UBO" value="11"/> <!-- A6XX_UBO, same on gen8 -->
+</enum>
+
 <enum name="adreno_pa_su_sc_draw">
 	<value name="PC_DRAW_POINTS" value="0"/>
 	<value name="PC_DRAW_LINES" value="1"/>
@@ -409,4 +430,25 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<value value="7" name="PIPE_DDE_BV"/>
 </enum>
 
+<!--
+   A fake domain for giving lua scripts access to the shader_stats struct
+ -->
+<domain name="ir3_shader_stats" width="32">
+	<!-- indx 0 is bindful, indx N+1 is .baseN -->
+	<array offset="0" name="descriptor_stats" stride="8" length="9">
+		<reg64 offset="0" name="img"/>
+		<reg64 offset="2" name="tex"/>
+		<reg64 offset="4" name="samp"/>
+		<reg64 offset="6" name="ubo"/>
+	</array>
+	<reg32 offset="72" name="has_img"/>
+	<reg32 offset="73" name="has_tex"/>
+	<reg32 offset="74" name="has_samp"/>
+	<reg32 offset="74" name="has_ubo"/>
+	<!--
+		other following fields can be added as needed, but we
+		might need to take care of padding/alignment.
+	 -->
+</domain>
+
 </database>
diff --git a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
index 51e9c94f5e37..f185b541aa70 100644
--- a/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/adreno_pm4.xml
@@ -152,6 +152,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<!-- TODO: deal with name conflicts with other gens -->
 	<value name="CACHE_FLUSH7" value="0x32" variants="A7XX-"/>
 	<value name="CACHE_INVALIDATE7" value="0x33" variants="A7XX-"/>
+	<value name="SUBPASS_FENCE" value="0x35" variants="A7XX-"/>
+	<value name="SUBPASS_SLICE_FENCE" value="0x36" variants="A8XX-"/>
 	<value name="DEPTH_BUFFER_FLIP" value="0x3d" variants="A8XX-"/>
 	<value name="CCH_FAST_CLEAR_CLEAN" value="0x1b" variants="A8XX-"/>
 </enum>
@@ -1095,7 +1097,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 			<bitfield name="DIRTY" pos="16" type="boolean"/>
 			<bitfield name="DISABLE" pos="17" type="boolean"/>
 			<bitfield name="DISABLE_ALL_GROUPS" pos="18" type="boolean"/>
-			<bitfield name="LOAD_IMMED" pos="19" type="boolean"/>
+			<bitfield name="LOAD_IMMED" pos="19" type="boolean" variants="A5XX"/>
 			<bitfield name="BINNING" pos="20" varset="chip" variants="A6XX-" type="boolean"/>
 			<bitfield name="GMEM" pos="21" varset="chip" variants="A6XX-" type="boolean"/>
 			<bitfield name="SYSMEM" pos="22" varset="chip" variants="A6XX-" type="boolean"/>
@@ -1275,8 +1277,15 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 <domain name="CP_REG_TO_MEM" width="32" prefix="chip">
 	<reg32 offset="0" name="0">
 		<bitfield name="REG" low="0" high="17" type="hex"/>
-		<!-- number of registers/dwords copied is max(CNT, 1). -->
+		<!--
+			Number of registers/dwords copied is max(CNT, 1).
+			With 64B it gets rounded to the next 64B boundary.
+		-->
 		<bitfield name="CNT" low="18" high="29" type="uint"/>
+		<!--
+			Treat things as 64B, allowing for a 64B atomic read of
+			registers.
+		-->
 		<bitfield name="64B" pos="30" type="boolean"/>
 		<bitfield name="ACCUMULATE" pos="31" type="boolean"/>
 	</reg32>
@@ -1469,6 +1478,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 	<value value="1" name="POLL_MEMORY"/>
 	<value value="2" name="POLL_SCRATCH"/>
 	<value value="3" name="POLL_ON_CHIP" varset="chip" variants="A7XX-"/>
+	<value value="4" name="POLL_SYSTEM_VARIABLE" varset="chip" variants="A8XX-"/>
 </enum>
 
 <domain name="CP_COND_WRITE5" width="32">
@@ -1476,7 +1486,7 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 		<bitfield name="FUNCTION" low="0" high="2" type="cp_cond_function"/>
 		<bitfield name="SIGNED_COMPARE" pos="3" type="boolean"/>
 		<!-- POLL_REGISTER polls a register at POLL_ADDR_LO. -->
-		<bitfield name="POLL" low="4" high="5" type="poll_memory_type"/>
+		<bitfield name="POLL" low="4" high="6" type="poll_memory_type"/>
 		<bitfield name="WRITE_MEMORY" pos="8" type="boolean"/>
 	</reg32>
 	<reg64 offset="1" name="POLL_ADDR" type="address"/>
@@ -2055,28 +2065,20 @@ opcode: CP_LOAD_STATE4 (30) (4 dwords)
 
 <domain name="CP_COND_EXEC" width="32">
 	<doc>
-                Executes the following DWORDs of commands if the dword at ADDR0
-                is not equal to 0 and the dword at ADDR1 is less than REF
-                (signed comparison).
+		Executes the following DWORDs of commands if the dword
+		at BOOL_ADDR is not equal to 0 and the the timestamp
+		value ACTIVE_TIMESTAMP is ahead of the value fetched
+		from TIMESTAMP_ADDR.
+
+		The timestamp comparision is an unsigned compare with
+		wraparound, ie:
+
+			(ACTIVE_TIMESTAMP - *TIMESTAMP_ADDR) &lt; 0x80000000
 	</doc>
-	<reg32 offset="0" name="0">
-		<bitfield name="ADDR0_LO" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="1" name="1">
-		<bitfield name="ADDR0_HI" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="2" name="2">
-		<bitfield name="ADDR1_LO" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="3" name="3">
-		<bitfield name="ADDR1_HI" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="4" name="4">
-		<bitfield name="REF" low="0" high="31"/>
-	</reg32>
-	<reg32 offset="5" name="5">
-		<bitfield name="DWORDS" low="0" high="31" type="uint"/>
-	</reg32>
+	<reg64 offset="0" name="BOOL_ADDR" type="address"/>
+	<reg64 offset="2" name="TIMESTAMP_ADDR" type="address"/>
+	<reg32 offset="4" name="ACTIVE_TIMESTAMP"/>
+	<reg32 offset="5" name="DWORDS"/>
 </domain>
 
 <domain name="CP_SET_AMBLE" width="32">
-- 
2.53.0


