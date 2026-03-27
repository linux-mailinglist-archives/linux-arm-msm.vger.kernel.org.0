Return-Path: <linux-arm-msm+bounces-100169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFKqKbnMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3333D7AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4083830D9A6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207C923C4F3;
	Fri, 27 Mar 2026 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8Uz+LSZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGdXLMTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54342233149
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570518; cv=none; b=Uvan23HDbbXT3idTJjq2NiVnBcCSe5hx45uoBmA+86mKtkhz2YPnIWglJVWppxIaxWPqMIbktEo9JObPAx3MXrWmlExbLB5eimTCxXyN++iH837jyIPp4Qt6uSu5TKmojxKVhxn3coW2h2W9TBzZ4ANaGhIHR102ECp6zMB+VyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570518; c=relaxed/simple;
	bh=sxPn3k2wukfo2f3i1QdTe9EbnZ53Hjix+2O94acfs2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjezJyICtjv+0oFWilbUALGcZPz5oyKtTrLfwUH0KAsMb6kB28obrTJur4Z+flrSvjz8S84vjzuBSeOaVME4B6nO3hKXZ2i5OHyvw4JGyHq4Vr5+v97+9V+BXbOewk2v9V2yrPVqLrY7VBZDH4u5Z3y1GwWz7OeNDSaBy0bbmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8Uz+LSZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGdXLMTz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QKYKau367453
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpT/EooedCDv5+FigI376so7QARJ90o8abqnkH5Y1Ho=; b=H8Uz+LSZ0hFcCP2C
	wcjvhzYB2tQguhvM31D7SyMDslS/aX4YB/8VJ7G7tFCRJiKANeHPpwA8n72MLn2L
	wJc6lFu+DvBUr4w4uLk/QlR9pv5IzNvEPfC7UZt/jeW37mr6eG+6mdkgw/4HsTVp
	bZN8mW/RwCNKqyqvl0cOOc3ZcrZByPgPTAGdHOKkhtE1g+aOS0Ux+ruqxnsnD3Mk
	ScqlAzyoUoxxL1g7gH3NqKuQmSk4AErjxC/UxHBWl737UpY4qhuAbLhX2SiEVAav
	DiGQpZE7td/jHu510cA9BBzfh7XJvdNAcyAeHREVU8kebf0mAXP1qhLZrJYLGOdd
	aABLvQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvghqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35641c14663so2045660a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570514; x=1775175314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpT/EooedCDv5+FigI376so7QARJ90o8abqnkH5Y1Ho=;
        b=PGdXLMTzoxj6lX5bFkXgr/BCibipIJuzBRWlIQ6S0DDytRXaQZGY6U/iVis4HkNAh6
         qxejhel/SujX+tiXXX1EbAkILmRrwzNgdtS8wd9XuTXO8vgk7+HAFdl3yJDi4iLiKJsD
         ZZlvKBYtwRQrzptHDPrGQzG0uFlHyZO5BLlbLkWDHuy0RGpgGrXkmKzFGXKlR4AR+s3j
         FfEzqPLy7P9TxXFvT6+1//SBoAjtNnrip07jnGRi7LTAAlo+U/qfch0PpipydsT/8vSA
         GlwrV0T4nlmR0cPRezoJlQwdK/kpc/py5zQe/UmG2G8sd7iVdtIpTHFMmTzXVAljF0XM
         6B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570514; x=1775175314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CpT/EooedCDv5+FigI376so7QARJ90o8abqnkH5Y1Ho=;
        b=AXVXqDrASlMhKb3ZhPKoCCWKHVoVYbRAnKFa1k9QPVlTH4bfRMZvRGWqtqYPPVg1kb
         c1Wo+xj2vXZKYDNoFMlLpbWg4+o4c8DgeRcsVqXqVipKWpfXI/5yJ06GWWyHxc0uRKf2
         /GqbICKoRfx75XLSxJuDa1dRbG7k1/hdq1sT6MRZWcHwMeSYmp9h2eG4fV0SiQ4u/IKk
         qQmdRHOEWeNYY0jD68Cs549R9NFaQkC2lkqkN1sF3V4o5f7nDB75OD7ncXDPE+EZrweK
         mnBKr9GBfp5jHCiVYJ1hT7CKv6Gsv+1xs5IdY7ebnVmiknblqDHsNrVVZN5nclhR8O2t
         8oBw==
X-Gm-Message-State: AOJu0YyBBFKcuEpExzx2PYpIgURGoNxtV90OHLzFA/5mLwxzQPYNDFp1
	yWSYPlZDk0oeu6RQ2XCTukuo7/FZpR4dfF3kXZtpQ3HR4G+YcfaLmXGCsmCQbSojupzbqEdl2bM
	tJ6byCX1nZOx0M/T7f/x1oC10tGeaTSZgUwqaQQJbYRc0Vv6oY05Qxl4oEMBf3idWPfcsTaiRYa
	kj
X-Gm-Gg: ATEYQzyUo+/xRb/PJeuQ0yg9jdVqqcTwG62N9LMciAQdMpDGUxhLA3TUCOcS3/Y+7Z4
	z4B7yLDbfWx5wiYw9QKtTD+q9fLkrWSCISOnZexnZGNVs/p8gQsIwPr80FejaMr+h2dGZLWjntj
	KeAPdqbeEvDxqWjAoodMnCyN33Ga3YqxPfe/gVikRQZJ+AS4CvnBJpcTi3fTlfNtP6eO5Ofup+5
	C8bqJ/Oa3y2D9zbkxvxtSfgYKRf/i2Soczvxx5QTxl3Qhdbo1kBMBgwihWnkV0xF4NDW5+Bc4ut
	FzPVVoq2lASSbm+mc/S/5yZ/qpTR2A+1mZ5XD9lxJQ0WbYb7vpFJ7TWAsoE5Ln28AK1yZwE3KBj
	dXBvGzsrVlmywxKO7KPpBF9ljeAPJvvifB0CKLtR+MiSFew==
X-Received: by 2002:a17:90b:3f4f:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35c30124eb5mr454890a91.31.1774570513664;
        Thu, 26 Mar 2026 17:15:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3f4f:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35c30124eb5mr454842a91.31.1774570513061;
        Thu, 26 Mar 2026 17:15:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:12 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:56 +0530
Subject: [PATCH v2 07/17] drm/msm/a6xx: Add support for Debug HFI Q
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-7-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=3294;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sxPn3k2wukfo2f3i1QdTe9EbnZ53Hjix+2O94acfs2A=;
 b=YeKnM2v6ry4IWiNiIn1nn8ghwud3UWgHQjMKvhrWwokL4jfoJRlC8nUGt5hPGARhXjSx+b1uQ
 Qbu1f5ZunewAI12ln09UT5rw81I7vli0/ZaW9iPsY0dHjcJSWssPf9O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: DUi6L985-CIG78zO_Chnpnsoe74pvH7w
X-Proofpoint-ORIG-GUID: DUi6L985-CIG78zO_Chnpnsoe74pvH7w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX8li25v94cKAA
 VU6EbGPQn6tLqZuHgffvBycTqjaT17Ea6u6zhrMci2r6lUcI8gxYbfQ69NqNpOufT+sOtQnEAw7
 9fiFZVkUd0dC5QqjOFPy70ekg69Fh2z4LNlCGHcjDXjs1O3r+UWbNvgoQKiYynygGDhgt4I9Njn
 nSBu/Oz7ANXVZ/pyxRinM6qsoauw3FAmX/HSBLZyt/Z+CL7F5QajM72rvt2l62VOs0PqCE3adh0
 KWrrqEFHHV44nU4IgXfAbL5CmhJDqhSR9AZwvGqQOl2iOM9EfZ8ZlNO/14CZ3M+p8cwrhnEOBiV
 cmSpgMUGbhj9s+YwgPRTVpaFMmPqJ03EcrCQros9M+uLzEZ2f/bX1tb2kt1Z/rQRKyfpP4NTCV2
 uB++MeOXx/zLk4cH1+arsL8J0PyiWe7B1bmg2OmW+HxUAxwbWGE01fgRfPMK0AmdR5oiJBKGnQ4
 1acmX5vuSOyfqAsfxwA==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c5cc12 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=a1WYpzXZzT6O6UdPSaAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0BF3333D7AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Debug HFI Queue which contains the F2H messages posted from the
GMU firmware. Having this data in coredump is useful to debug firmware
issues.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c       | 16 +++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h       |  2 ++
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 0cd8ae1b4f5c..3f96b10b5f61 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -111,7 +111,7 @@ struct a6xx_gmu {
 
 	unsigned long freq;
 
-	struct a6xx_hfi_queue queues[2];
+	struct a6xx_hfi_queue queues[HFI_MAX_QUEUES];
 
 	bool initialized;
 	bool hung;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7bec4e509d2c..c0b9661131e8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -57,7 +57,7 @@ struct a6xx_gpu_state {
 	struct msm_gpu_state_bo *gmu_hfi;
 	struct msm_gpu_state_bo *gmu_debug;
 
-	s32 hfi_queue_history[2][HFI_HISTORY_SZ];
+	s32 hfi_queue_history[HFI_MAX_QUEUES][HFI_HISTORY_SZ];
 
 	struct list_head objs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 4f5dbf46132b..09b6bc464b47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -1062,8 +1062,8 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu)
 	struct a6xx_gmu_bo *hfi = &gmu->hfi;
 	struct a6xx_hfi_queue_table_header *table = hfi->virt;
 	struct a6xx_hfi_queue_header *headers = hfi->virt + sizeof(*table);
+	int table_size, idx;
 	u64 offset;
-	int table_size;
 
 	/*
 	 * The table size is the size of the table header plus all of the queue
@@ -1082,12 +1082,22 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu)
 	table->active_queues = ARRAY_SIZE(gmu->queues);
 
 	/* Command queue */
+	idx = 0;
 	offset = SZ_4K;
-	a6xx_hfi_queue_init(&gmu->queues[0], &headers[0], hfi->virt + offset,
+	a6xx_hfi_queue_init(&gmu->queues[idx], &headers[idx], hfi->virt + offset,
 		hfi->iova + offset, 0);
 
 	/* GMU response queue */
+	idx++;
 	offset += SZ_4K;
-	a6xx_hfi_queue_init(&gmu->queues[1], &headers[1], hfi->virt + offset,
+	a6xx_hfi_queue_init(&gmu->queues[idx], &headers[idx], hfi->virt + offset,
 		hfi->iova + offset, gmu->legacy ? 4 : 1);
+
+	/* GMU Debug queue */
+	idx++;
+	offset += SZ_4K;
+	a6xx_hfi_queue_init(&gmu->queues[idx], &headers[idx], hfi->virt + offset,
+		hfi->iova + offset, gmu->legacy ? 5 : 2);
+
+	WARN_ON(idx >= HFI_MAX_QUEUES);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 6f9f74a0bc85..19f6eca2c8c9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -4,6 +4,8 @@
 #ifndef _A6XX_HFI_H_
 #define _A6XX_HFI_H_
 
+#define HFI_MAX_QUEUES 3
+
 struct a6xx_hfi_queue_table_header {
 	u32 version;
 	u32 size;		/* Size of the queue table in dwords */

-- 
2.51.0


