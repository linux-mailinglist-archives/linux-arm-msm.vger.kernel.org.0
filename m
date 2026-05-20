Return-Path: <linux-arm-msm+bounces-108849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADe8L6/hDWop4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:30:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A284592044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25BB0304339B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44EF3F20FF;
	Wed, 20 May 2026 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8Jh53oL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekrs7J81"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DF63F1AC4
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294346; cv=none; b=FqFcxeMX6LjM/O0WKslZOg4NdEp1JzgEUghh435Ne8AVx0KlsjjolP1PSzkB4XhyUJxZeaOQUCTTfawjXfD+UcVlRozWgbYnFV4KYvma9kJEpxYmUidQ+4Bj1X3fCdFKd6yzzULvt1m4kAnGr7nhU/+Pxy5aa8ys2kiH1BxtzOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294346; c=relaxed/simple;
	bh=ANWzeXxdDBU7nKG/WB3rv8PvntzXMQi5EInrc41IgqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmA/SCizlUItsfjoWbxMRhKWbfBKzKmL0tgA7X7u2vbDMwPST+A5ciXrbjvh0eDosscj/eH6lHexZXHMc9wNqpiDawS0WDmW87fyymqKGu2gcot6DhIH+VJvdQ1QMYLUGQKfJwJpmyhUb2gx8fkLkDDKHYAmvsi3kSRgb+2p9Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8Jh53oL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekrs7J81; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDuVkA3680313
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1lVUJdVdQjl
	CYs1pn/QJSPt+RdUfcq/IDjWcVJlIwl4=; b=V8Jh53oLHsTay1R7qEe5Nsg6K7I
	hKxrOkwYTMfBnxZH26GDMQ/WGiLmtzQG7RKfTkhgX2+2Tw2fHTqe+EQ/vOHCmIQc
	38F83GTfeaAZoCiyT4DXEPQGxEvwP6PY56PZIdfCuaHvc/ffPbEDFDGyeHjDtbrN
	WCOKKkuH4VR3dzMeqX++ph/fZysOrJK8lH1n9opL3q8GHR2r6yhqwGI8r5uOWZwT
	EL/6V0phYVolN/so7GJgMHhvpqPoLumRPQCl4W9dTRpRI5T8MJrkJel/GwVSs9dA
	T/l14Ij5fAppopkGIgwqZm60tkkXEnzoxP/31Xf3+u2oeJncjTaP1nCHlnQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j0p8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso53127715ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294344; x=1779899144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lVUJdVdQjlCYs1pn/QJSPt+RdUfcq/IDjWcVJlIwl4=;
        b=ekrs7J81QWjsUwy+KNUkP8sY+AoVJ7Y9gFmI3LgpTU1W4MCEQMqwuriud4ey5/oIGn
         aab2uJgiwioh2y8Jp0Km4mzGIGN6nZ4ctZ1aXkrhmD78iW5ujWeYSL3qdA+nNPqmHoRG
         wGdM+Cd5y1jAlm8Ip/Vd1eVurykRJXiosvZZeDGc6DnIIpf924HXAOjaaBdW9yjf2xMi
         dQqI5G471/oeUAfHHzRHgL6OOxbKAj1jWOxdKEY3YE3nycPtvSLDXAz9shKOpOfAGfnj
         lWuAT19pAHNw3wlGfovyy49B2ETvhOd/gLm6C7EMjThSvyseYt7uy6Ng61ZETk/GxOGN
         9rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294344; x=1779899144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lVUJdVdQjlCYs1pn/QJSPt+RdUfcq/IDjWcVJlIwl4=;
        b=nAYSNEt32W2jCxOMUwqP5iPdb15vqEurfPLyArM25bhOcASOyU+ZcsJu7hcj2K0n90
         D4bA4XJ77chBJ7MSOt+eMGHZ+0VChRSM3ekhT6TM1WcqjYkdS8uQT7StOLgI9bq+I/yF
         jEJEZI/cPyr9/jgqiz+UKzxApvUErS8cko3l+N7aTPgOy+jJHHFaSYYJYpIsgdRpr9xx
         zIW49iz48hp8gsvcC2nN6a5QkIlIrRGWgit1lSwHiSucR31PP8oIDe2u63uD6Q6AyAcQ
         PJWQFglvXQjZUDA3wTQbznTR/MoYQ+0lWaTZ++NJPEqg8SqeNz8F2omBKfHeqL5CO4OX
         dvjg==
X-Gm-Message-State: AOJu0YwwbQEwSzuFNsZTwmX7bh/cba8sIjTZrab9xW6X/msbpQBev/bJ
	jkHoKDCgDlcMNBKMVmWAbgRAe7sRH4ZdLcgHive2cNHvGrkRHzeCjnvPfb2bjl+XlYRax9F1T2M
	r+x69b1RsMKtvhaFuykzfqGpomtHZE6JUiWGljFyhRIJKNwiJghJCbFALT+h69Mdm1R7zcUBR1v
	wg
X-Gm-Gg: Acq92OGBeEgbizFykaKKT2X4h0ydzg2qclUIYyQs3KqZW6y71We1vktOKhAuFOwf0IW
	XtMX+vNwF0nzHFFdF/FKLTNScjjuJSvye46PgAL7dWsGpuw9VZ64rnVj4R654NDNsYYYAHPGHDq
	oSJ93XOEyMOfmfJFY4aQOVmAVKpFrOKj3Qxjx0QRtDx/djmP4+qfWXmXMDzPL4tMd04DNdRQtUP
	mA3lduTVDp9R50nzz3EuScWYowYeAAXUJpDXfJ+Jv8zteWCzrPAZr0/zv171ffPcWLr5hItIVV4
	umXsgFlp0OpI2DwNm7IY/I1cw1T3VYYjooq4WzkfIxFssCCwRitaeF45MbFHAJmSzWKLb0/6dsJ
	pTyJ0duO4pHzF/PGp5qz0kh67Rj4bzvO91YAt9avxg2k=
X-Received: by 2002:a05:6a20:4308:b0:39b:f25a:28d7 with SMTP id adf61e73a8af0-3b22e6672e0mr28332614637.3.1779294343827;
        Wed, 20 May 2026 09:25:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:4308:b0:39b:f25a:28d7 with SMTP id adf61e73a8af0-3b22e6672e0mr28332567637.3.1779294343384;
        Wed, 20 May 2026 09:25:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb1231c7sm20777095a12.31.2026.05.20.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Wed, 20 May 2026 09:24:01 -0700
Message-ID: <20260520162454.18391-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0de088 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=bkW2Msa_OoTtud3PmHQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Qjkeeb-0hmY5gsh009sh6XWFdD8XLs81
X-Proofpoint-ORIG-GUID: Qjkeeb-0hmY5gsh009sh6XWFdD8XLs81
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfXz9APCdfOs4sM
 5I7X0Glr+rR/0olgyoyQki1hLAsWXt67abx7QWjiFX9Ooi7SWlGk/io3Xrwe+7hJ+FDI9vw+sVw
 /h2Aqj/p6LqfHNYIIn8hxDkk055QoTn46TyzK94/NhPj0hZiDA/N3lWUvwmykbkRzATUVeO43Ad
 2gdxBFtN2MkDbxFD4e09ThfEXgwC1r1bvJm86T9AfMZRu6+yps5w514T3J7gLlU6MYjTPHaqIxK
 Gkph2Mz7F1C0wrmhA0XgLH6jzQZt52cXnZRfQ+l0PMxfwjSZyV+uhsJP+E5F+emEdECitSALA0r
 oniEG/2IddXYUzGllnTWqlG/2Hwu2lrYkIdjNFRQW8XR+jBwcGrnmYCUdjjh5sEjDKDf/dnFCG4
 KKWjIXnq7ZjKu6HqlbcKk8CTQsdQTqY+ftuw5CPjvoK9vWjyZrn28IGzJwnfx4IuwvsJsgc6RN/
 pJHliG+wQem7h21VWcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108849-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A284592044
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index a329d20033d7..61c6b0e781ce 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1183,7 +1183,7 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 	}
 
-	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, PAGE_SIZE,
+	a6xx_gpu->pwrup_reglist_ptr = msm_gem_kernel_new(gpu->dev, 2 * PAGE_SIZE,
 							 MSM_BO_WC  | MSM_BO_MAP_PRIV,
 							 gpu->vm, &a6xx_gpu->pwrup_reglist_bo,
 							 &a6xx_gpu->pwrup_reglist_iova);
-- 
2.54.0


