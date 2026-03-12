Return-Path: <linux-arm-msm+bounces-97233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHcdLszAsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:34:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C48272AAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 070C530BEC7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B143B3CB2F1;
	Thu, 12 Mar 2026 13:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaggJIDs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jL+DUjRs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EAF3CAE98
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322196; cv=none; b=TO/OtvHNtMAmjD85SPqyo3r6GQNLm0a/HNuUtT9b496sICCoDUVv2+3mNGl338SSnNMLlUQ3jsgO24TIHD7guoz5tkr+mJKzzQsYTCHHbLhnjsKZemHYMzCbLgOBJKnKD+iWjE3vwUaT8TyYCCbJF6MJXS3TXjAv5caXt6GsZ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322196; c=relaxed/simple;
	bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4sNhyZJAJ1owsrP8lbMKIYxOzpCf6m8UaxlouNRPHIc/S51bO0jKzGFEc0bJ6dr5pjnz6hMmulmLr0WfthIZSSAZhXCuHu5SNa9qNmPl/hrqjuEjZVSFhiwZuEWNqu/DQU2mmz7rrrpjfZGZv3wXQ2klZnxtQnsgJP45ijvRpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaggJIDs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jL+DUjRs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA6GDV263415
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=; b=DaggJIDsVY5RU+X+
	YNy7fh0t4BrlIakQoZhXZdtsbNqgsjL4XN4cYLSNflG1O2YvZ9xmq2/WgmTkN+kH
	I7i0sizRJsaH3Ro3EYRpTA5zoXgs+MhVby3UJQcalXWREZcr/erpwfDH5aDOHadn
	I05kyZGOpCf3JeMatlG4rWlqt6ycIX6m2I9iXSYpkqFjZXWn+l2uJl1lUg5pb6zh
	Bf5swOsoTPRQiN9ntvmzLvEs4qsijF8mbnqI1H3fDgOxA/EZT+UAg8itJrl44CQZ
	Lq9ihf+FiQF1iZwujBWDcOBQVvkVOA7VWwSkqBdxsY9URMChi1xSq95RuUxsWg1B
	GD8wMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj65s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1012954585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322194; x=1773926994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
        b=jL+DUjRsCI+VzQooBHQqphsz4FuUXUc2q+M04ePVXWDWgoG4u5tZmRslMUeNPJbgRY
         I6sTbiF3coWV7fSLZ7ovYmK8bgsniCifNYPhqT+DVapgyTJyoKAmOBIvTeoHmWroQA3T
         YXnGbBDobna7DMdZ3XONDAPhFHbtULjulbooS0+0IFVU5H5mPyCzbMxnSwUviXV+zemp
         gUMbpEUePbwddVXexvclHVqeakAfKnWwESsxOslSY8S6Yy7m/jqq0TMSIZbg68xAqvuc
         GqJqxQCYREIt2QtEmHDdjdodcWR4q0sPHMx5NCjWKG+dB8zbTLta/acwxmy/KkAztItW
         cmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322194; x=1773926994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jqyKT4W/cNuaTzUqSFqRUV1yQx0wbYgJqqv8//555T4=;
        b=GXqLpWu9nbq6CDn76heRXC35u5EctukLtD2P4pfekNQZaBGHwaTs+o5vHA5jTD2i/j
         jfdp73v5nB6eqmA+NLMirBJS+eJgu9bUZDiXf1w408h0u0AXb6Ud7+MxqBKVOGStyzVC
         HuZBui/5ewmMv7UyzJf67+PGb8ILO+51lzUAsPKJqKvMxEy6Tm4gB+mMnQ5vtNW+rzKr
         CYB0BJ7QVS6b4YxypxHrDi0JSnz90djNr5QlnUOaHgbkKRBIzRu+0yxy0q2mW72QHOws
         X0R16v6thSnTfXr1+n6po4HyCsuFdeKpEm2iOIVAuEXqy/NvvOH1GMtr4h1sq/oSa3A3
         5T0A==
X-Gm-Message-State: AOJu0Yy3PeRAr5JOJgphv2KUwMl2VYLouqRgEMEG+Eh7HgHqBL2tmQrJ
	Co9Mp7jedbQxQ1SkqYZlTQHDjLtIgC+pFuysgl+W+QQ2ggR9AQ/QxDzdni6BN4R+mpNmMLA0Vpc
	TIpjvuWZnfgnyolP0bJ5ej8WvOjKSy1WpKp3gCrO3ROKKFlUIMAV7qCXzjfZJ9y+y7k/K
X-Gm-Gg: ATEYQzzcE1PXnDQOvCUsiu7P4YwgexWqB8DfGy6qWo1J6m0dpLw6UDU2fXoSIJJWjGN
	XqM7Z4M/LD8S+ZM5KJPfGLUo3cWy50oj5og6lFNupjJ8zYIB52PItZQBhZi1mhSHg02KN0G+84T
	mcpvgI3sVGshUXkQGEWL9+ri/YHpgmxqKc2gVMP8TEvl948nC7VvKWyGz6u05QMNNqdgTxGCUq1
	pON2AIMe1ktttrAyi7ckiRvCUJhkSG9qvi7VeZtVxUHLdoTylsRNCjhP6v6sff51nRkeITtinUN
	aQYdlHYjdXWtkZfhGfEXnTrLTI47e1FTWfs3opHmA3g9H2MnG+yyhfiNopUZfSPLOsIv0NB2Zhn
	qChJjCe03M2e585mtimydlBdVT+ZOG/1fNrYyvtcHXfJLwLWgV8phTmlCBt259EOROZB4L5cm/1
	YwG3B4x9/XFsT2sHTU83pqI6nuYI6IUf+6kr4=
X-Received: by 2002:a05:620a:d83:b0:8cd:9446:cef9 with SMTP id af79cd13be357-8cda1a562a3mr778065485a.60.1773322193777;
        Thu, 12 Mar 2026 06:29:53 -0700 (PDT)
X-Received: by 2002:a05:620a:d83:b0:8cd:9446:cef9 with SMTP id af79cd13be357-8cda1a562a3mr778062385a.60.1773322193329;
        Thu, 12 Mar 2026 06:29:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:34 +0200
Subject: [PATCH v3 13/27] drm/msm/adreno: use new helper to set
 ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-13-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Dp+N+Bk8UMYAX+OsWFRzXnJ6xbH9DAMBa3dOlN5rF0s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+2JtEAtBmQ/NcrldvywY10gImttE0oGu/aC
 LPb10BpE7aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tgAKCRCLPIo+Aiko
 1QL0B/46X+E2kxsvXxWD3d7+sr2ywH20dgQme/s+FJAEU3/0Q+AmAS1DhEZTNwdxMa2StPQKvLY
 WB4sO4ENNQg/OzFo60K+PifFsL1nLEIBCD3BW/CCyg85AVRm3ds2vsUXHrYPDxZ11r4lB75wIBI
 6m1OJB0qZ3tD6svcNlKYGbeWAzc6fcOkD/9a7cGO/0Gza3SJT/ZI2MgJSRkjvvwfYOjJUi0xEVy
 22ffARkP3Xz8IDEZ1yrQyZLJCk1jjobRMxZbRRSScvcp22LSb8rtxgKO7Vg8gacxwPiA8vRbDR/
 PEmVcvQvcYIlI3qJsEBTMJKOlBZv+baZB94HMtaL/2yR7lzs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX2aNHiQO4FaL5
 O1YDmSlK9Qgs/JLC8Aek00OizeHZMFdyxzuaY+rQPaBHPznQMD0dj95BvzQQXrAfiQ4PMRY3dIE
 DLFQn4TLQg+fBGWqYFcKlYvLgKTgAM1d91JAN7yw6fRakXXyPpnNPp6C1QdJzuyKMhxiMZ7cYz1
 c9mbCmgjSKCb+z1lHgiNWAW3w3pft/Hwz2kqFsKbTezG2i9bvKsDbVswESAaN1SyBP1qCof5Xxh
 S5wzfcTUjnAZNjRNL7t4+2ypMOPEdrfwH59qlVwkRvRpUfKbYg8BqGXDSJBu9XvT8B3UOjskdMf
 LnvPr7ePvVQ2vK7R1Yyoc7R3f2Ojcbj0uTQvMalnKUJZMGMT4D9CVGOU0fNKA6v5klAC4kpq5e/
 77QcZXTqlbHUeIR0HtNVFoUqsmE5XaQXhjh/9z6XghH9HcN+TL5iUBb5ufO42IpNZtO5xdBy92+
 MDy2P/0VtrvwewQ9L4w==
X-Proofpoint-ORIG-GUID: h0JDkSdeatQi9m2NFWEFuZ1b8xb3kGLd
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2bfd2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0JjmiBfSQHijSEXDZO0A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: h0JDkSdeatQi9m2NFWEFuZ1b8xb3kGLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97233-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36C48272AAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 56a820ffa613..7be31de3b525 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -741,7 +741,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(cfg->highest_bank_bit < 13);
 	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	bool min_acc_len_64b;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6dc1d81fcaeb..680f0b1803a1 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -265,8 +265,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->ubwc_config;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
-	u32 level3_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
 	bool rgb565_predicator = false, amsbc = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 4814233d8dba..cc21b41cae26 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -432,7 +432,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->has_ray_tracing;
 		return 0;
 	case MSM_PARAM_UBWC_SWIZZLE:
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);

-- 
2.47.3


