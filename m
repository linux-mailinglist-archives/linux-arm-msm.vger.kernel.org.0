Return-Path: <linux-arm-msm+bounces-109375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CegM5OWEGqBZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:46:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 500E05B87F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABA633040DBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA50236495F;
	Fri, 22 May 2026 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1JMWk55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YlCoZbPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEF436309C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471276; cv=none; b=d4GK8ydKrxyn/r2PKNiA5ogWLPJQbpqr0bfYR9ZZRO/bbWwOF4O1GrWuI3lrT8CQME//lJJ6eYwyPVsy5ejVhBMdumM9XlTkcmQClKWMQr8TAEFoDVofVbPM2krqCQEsw5f/7td6SC60oD8Ayn/B8nJVr21hr3MflMFiirtNAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471276; c=relaxed/simple;
	bh=8VWbdGkuGsTTTwEXrzMET+OwRMV8Bxyp9scuxw0paE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIUZuzd0o/2GVN4SqIXdkO+M1gWGKYbKOCFqMMDA3ULJxs9tiVqWPlygsaRk3bf7S93PgX+qnExA6dERlELrj3V4ToW8mLVQ9UpCuprA05gia3N3HYWTeAIP0DWmHk4xcBxdO9HWDpd1v/LjQ2rmDvRn/fwiCft3kQrdojZF/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1JMWk55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YlCoZbPO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MC10l81298254
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uZWxbq16V5d
	ge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=; b=B1JMWk55GaHgiWCzPuJxLZtkRd6
	YlokSf+1ZlCWA5czwzoleWZ1AnL5mKFJJ2sFcOLqwixvEErfRDo63Q9vsd6GpW2u
	OrtVcMySfUES9/YqbL+IwQWDuWi68nXNK/1+5nBNt0PS7lbNEVUm4U1AidJMIVNU
	0HMsBO+KeV6U7P+nwJutgyetySDJibNy9tUR76ifcGjp0EQISKffeGAgO4Yxevlc
	XUb9sCRABJhO4NYMI+Wsiias9AKTYNjbVt3tY+AmOjKh+3/9ArYDN6RBYr562ni2
	Ui1M4FRk4U60lUXb66wVd1Qln8PL5oG7hEjF4WyVRdxj41d+EaYXJmczXAw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah0c7g4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365d4d2fa04so7027156a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471274; x=1780076074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZWxbq16V5dge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=;
        b=YlCoZbPO3JXDnkLJV6wAwDi0eZ6Ji6/eBOAPhkxFOP7IBsNMQatoovkoPWcwi/Lc2k
         0ZaCrUd5yrau5V+1dlvRN1KRY+wZfC8ZfTLTW7OML5FmjjJu4G58tbNhIWpGXozMfTT0
         qCZFp+Asrga4XDT6dzMad/GtcLYJ/vONKVsbXDOq/nszzqRHkQO8ahZOHWsKrfsO7JZI
         hsAUBOAG7NTfeJecC3tzc5hAAxPmxn1O/cW6YX7CryaqqM0KySpwd8330qCPysFsUNcw
         FRh70Qh56YSgLoNug8kgylUWiUvezmG2ehGrsYrF09J8LJxoNGn4wwwSBa8uunViMSqb
         TyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471274; x=1780076074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZWxbq16V5dge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=;
        b=YazZWfcYJctajTFVt5qksu870TYyMLfkrnXYZ+kHnlYj3RtbCL/GhC/6ARUs6+ZmHR
         472tkAVgIvZcvK8b8zBGtrisUolBHtW6kncr120/tO7qRB11u68NMnPg7oR5vfb82CCw
         6UlLjScR/soIHk4RkUdaN8+QR4nRCzw+aZNKJu29VD1PXeMfeG+2oLnk0opfaTI16Iys
         yB4DgQeLexdOEXGJecGydvS90IzS3iI/xvNVZpnTGY9YN9X8w0gaYqA7J8bIKbJ78SSQ
         wsCVjUO5IGE4vXOm8Xihcjgj6b9Dc8Ler8mSHq6sVIjY6cdvpUVrL8dEtQtoId3R7w1q
         WD7w==
X-Gm-Message-State: AOJu0Yx1wplQC8poKUwVBM9nC+NjIMfAPEx4asB/dvzUGCKq0mfaCtSF
	GJjP7KLiM/dQ2lQ1ziyUGc7f7u1kvGAFaIWW3gJlWvQnJ+XhqNI8fzlo0YMaUjnJDlwfoHpsSxI
	FPvgrQoRquSpnBHWX03dHD+ZFxCItfahJiiGtrb5E5lKtchtiTiNFk9fCmsu8n3fpHHr4
X-Gm-Gg: Acq92OEnoqL8GvQPP6Him+Xc93L/6hE7pPwRm1KBdcVQxMRDqoex4xFuoS1+x9C6XnK
	jvP1VL6AFr8k2zyxmVa4wHS1gFbvpRjW15SgOSZI9vF6as9bC1Fq1+DZFAoQwebktN9xB2DKYNo
	4u7FmBOMSydl+5fUTma92TpuSE5X76xgNXg+5tIL1oR7VTrIdtB0K/Nvaq1c85dckeYs1vWe78S
	wm8sfAjKUJC7WYuFf9Os1DoKuFVhR4J/1E4opz/KSMw8/9zmOCGCeC7VlRHD0mgTfLb2pkRTq3e
	NdVSceEr9MhucPdNGwFPCrMi1WtXFldN1WpBKZ1akplBHQ4I/Ozv8tA86Zcfuvg5+KTACnnOvKE
	s/TUzOMVbcqwGOIinfWQ8b64BtAxzh+OE
X-Received: by 2002:a17:90b:4905:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-36a7c8f15b3mr1889223a91.9.1779471274016;
        Fri, 22 May 2026 10:34:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4905:b0:36a:7c8f:1423 with SMTP id 98e67ed59e1d1-36a7c8f15b3mr1889189a91.9.1779471273526;
        Fri, 22 May 2026 10:34:33 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852057f9cdsm2063203a12.32.2026.05.22.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:33 -0700 (PDT)
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
Subject: [PATCH v9 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Fri, 22 May 2026 10:32:48 -0700
Message-ID: <20260522173349.55491-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX5fBEMRGwfAKT
 TcyWzJJQEgqQZ/EGyzj5iFsYwoTy0aZgS7vkvVBJSjzC1eQlTszzUVHe/6p5HXh1bnaeKXToHB7
 FxCRCVyUkVg5AJcnYcWIZT9AFFVIgXmbs61WMT2fUoLz6cJG1OEtYJCVCNn9QN0TRT3fjQi3uor
 4c6LX3yHQOh9IsjKXdh1iXUTVt8BCVD6od1rdPMKY9eDs/8/2g6JhAWcdecJxwZuprbb8T+KkZn
 YVLpOyRJ65k5ggpfjFc91iReWsr1koYt1DTn+ZPrwesSlx3+3szoQZp+8cr28Xw6d2Yu/Q06+yt
 l96r9vIljLL0qdFAjwUgMWjFnBT27wvjW2QXOJkNOnyBfgYcykk4jfGKKuIcTIPoI69wrzwwbAB
 i0V6VgQla4mzmwYCAtBPHYryprA8xKpfRoN2UkX8fSv/TkaCoDucjdDaxMnW5KY4MczgnjjtdKS
 FWSUZbmLwTG/qwKU98g==
X-Proofpoint-GUID: PflkQO-_oX9e42jqWVqbyf49ibaVhE3W
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a1093aa cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=RIk3oTIWcAeXYnX0VHsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: PflkQO-_oX9e42jqWVqbyf49ibaVhE3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109375-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 500E05B87F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use perfmon_capable() which checks both CAP_SYS_ADMIN and CAP_PERFMON.
This matches what i915 and xe do, and seems more appropriate.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 66f80f2d12f9..72b71e9e44f0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -494,7 +494,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		return 0;
 	}
 	case MSM_PARAM_SYSPROF:
-		if (!capable(CAP_SYS_ADMIN))
+		if (!perfmon_capable())
 			return UERR(EPERM, drm, "invalid permissions");
 		return msm_context_set_sysprof(ctx, gpu, value);
 	case MSM_PARAM_EN_VM_BIND:
-- 
2.54.0


