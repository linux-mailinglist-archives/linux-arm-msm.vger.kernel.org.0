Return-Path: <linux-arm-msm+bounces-108838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LCfHs/tDWpb4wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:22:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51962593747
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 315FF31F699A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B954736CDE8;
	Wed, 20 May 2026 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5vmkpD3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DS4IO0cA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFEB36A379
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294317; cv=none; b=as9fHy/UsRYUjyxHFRlVyfugWqlD+faXYSGiEyQDN6mtRXfGB3Y7QQrZBbcP8OiQDKmh13srtd26TWue4fXBsm7hEupOANTYHiXRVCABKsVDmih04N79wQomwFbqCKfJIgKrvBjX+OQRYE22vq3eYz+g2OWcnZ2HGe45DWtERO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294317; c=relaxed/simple;
	bh=8VWbdGkuGsTTTwEXrzMET+OwRMV8Bxyp9scuxw0paE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3tnr/QT7vPTD7/NU+A5/Wi6Gq8tGsSOikhSR3hHTcyh63KYmmP3jcnjH+ne/PdqNNjewIU0UYJPHmDyOAplxc+Eme2IrzK6M4j3zG2kWPDxuyPEIyO/O3eY5D9R2T13d9ph67RqqZBmRG1YqeZ5kmjdi6UcgwFBV5XdJ1j+YKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5vmkpD3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DS4IO0cA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9nVBZ270559
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uZWxbq16V5d
	ge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=; b=e5vmkpD3ip1sUgb70a2Le9d6llb
	VQUA6OScKKmhdyq69OzkO9ba8UoJMBakH2J7V1kbk4g5dbWNUstKfq0RvtsKbuux
	wmffrNMGIm2ncR8iQ7S2/KKuy6DPFbT8e830RHXthlhALeywM0asQgNOZ/0FlfLl
	kW1+0m7POayTK3TzRBFGBWdOU183QbXDAKAO3uJPtm5RUnMU8mvjp8f3G3oUTNx+
	yELyTAyqt/uw+AyblFYZLtAa4HfVE69dG6bkT9/6lLlcvijhETgwQofZwQWD26wB
	CXPRFC0+vWLNPoWVGS+859a84Fi5izsu/kNKlCBilHsboMawPF3k6V/wRgg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxshhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso51033725ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294314; x=1779899114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZWxbq16V5dge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=;
        b=DS4IO0cAOC3f7Jv9BrlzcYVs8c6iOYqDwJZOA+RwbqDJ4rHhJ2bUFrvQXb1Qf4YNZt
         /2Ek1w9A7e7KiJbb5ExJsm8s3awW8UPjBCEBbKNZxrIEGyUPwL6Js6AkyQCr1q8icv5F
         qIvLCDlV74rsfGVUeWEg0ab79jiXSV+4cm6YRLUFbYpinwa51iIEEb+znbCFqHUqMkRe
         p1FTY3cg1txzHPN1ox7gpJpEdIhswkiSQW5MtlEuuBBsvsTjZam2hB8zMw1pUwNe8/Ch
         XW5udcWrkda1a/bBwFwCvk/UFFpTHpocSPOy0nX9tfzWsg9JNxDWy6HeRZLdgF6EZISq
         DAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294314; x=1779899114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZWxbq16V5dge8U1KgQgWh7So4/tb8nUVOkQSVzqIs4=;
        b=ZfVuReVT4qWQ4h5btOaYOp7XokconedaFpMg0oOQv8yMSJWcmR3i3bIF6mJ2BolQeJ
         26nIo1JaKBWrRMewKBIhFF3z8AANRv8IwrE0ypAcjni6LjH1srYp+DLbt28GTNhPv66L
         umy4W5lJkXNX79nTNyv3euFoOlnIGdEf6G2r2twY1UQkpE4/8DzmxFm4Q+nJJ4WzzQba
         9wIPqKBOkP8LrRzJlEQ2Cxe30jyFLCYxSj6lhMcVGPMKvxVR5USxOwk/PHuOeoPY9sCY
         ylqagBVMC0/jus+oiBSGWt8Ed30w/DR3Ufjfi8UbjGKSTThTyjSU7xWh/W2o2rnykRvk
         uA9A==
X-Gm-Message-State: AOJu0YzUjm/lFsIjHmbXS9ObRh1jEYszLBgBv21v8a/FOcHdJcFD36RH
	XWKkgtZ9dpZWkP/hF/VADUB3590Q6Milo1xbCA8TzdUO7Vmc1sSA/4L/SYRIMlgfm9hVf/cnVPi
	GL4a5teLz17A/oIcpai9XRCRswv/7p6CAbtAVpPZa7h3ykfATV4RgmmRuRWvQQV0sCSCEVn2dDg
	+b
X-Gm-Gg: Acq92OEzGT7f5FmdpX9n53MuLC8VtHJ2fJZSOT7DNi7bKePy6jWF8zxV3bC0VENee/+
	/VLXxHmcYqKH/MkfUbGC48a5vMd5peKjZsqPZiNloRJxfeB+G+3rCo3a8S4M06DUD6tl4XTQJ0I
	h0102atXUUy/tcUTVqot73Z3Idog4bearnKTVT0FXiLF6WYoKUndfxJxwPNA3kH0tJ3tibF4v93
	ttMrOY/WyC1yLpOtk7G28ggpNZpW5UG9w3IllTq1cnM4F/8Ux15vxa+0MENoXP8odyMN6qV76V2
	XI3oGHM143EADRkonvGXHWHi3FGtCyn6WboLLlXg/1HD5QXnWUbuHVxlB/aZu0Q9fuEahO3nd3s
	+RJ2Ru7Q5thW8+kDmDGie0xhzjqRcn92E
X-Received: by 2002:a17:903:1b45:b0:2bc:ffe1:c380 with SMTP id d9443c01a7336-2bd7e86c179mr244498965ad.8.1779294314127;
        Wed, 20 May 2026 09:25:14 -0700 (PDT)
X-Received: by 2002:a17:903:1b45:b0:2bc:ffe1:c380 with SMTP id d9443c01a7336-2bd7e86c179mr244498675ad.8.1779294313543;
        Wed, 20 May 2026 09:25:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm223508635ad.60.2026.05.20.09.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:13 -0700 (PDT)
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
Subject: [PATCH v8 02/16] drm/msm: Allow CAP_PERFMON for setting SYSPROF
Date: Wed, 20 May 2026 09:23:49 -0700
Message-ID: <20260520162454.18391-3-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: NVdLIiEKsyEaNDwjv6elUam2WnMkWYsi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX1WALvUcyeNpO
 MTtW+GTF27gKusx4hXHAZYCGG6B/C9yK2gepAjbqOX+gKAo/m4rJkLOpBgLzDSGwfN2DVd0gpLu
 IpdXSP1v5f2dCVkfGmkuChFGy37G86+CT1aMOBmqTnpetbFi8HYltNF461Y2JouB+YwD+a/GCH1
 YkRj/kb7J7g2WO/AW6oCCNon8DtfSydCoW7qjMV4kUHjcWegnPPkvXfHfviJB9dwqPFOmgx1dMG
 UINIxJO6ywLcqZg+ua+MPDJsYRa2b8Cp9X3uZRU1q/RCWyziKa4+XPOuQkJpZQCoQJ9vh+5O/jl
 czlzQMKXn9+v3jpNekQ0b2crxxQMaBF00wY7g6ObPjZ60+hccjf0TILOHlF92sZWXEzamo8CDoz
 /qHU7cVhK3GeFPt4Ckf9b1tq3C/ZSAKWvTP2WwrG5OIQUXPJcAlnDCzRBtQED4skQ+3hA8mOYFP
 3krEIORD6PEYs/JLQxQ==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0de06b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=RIk3oTIWcAeXYnX0VHsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: NVdLIiEKsyEaNDwjv6elUam2WnMkWYsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108838-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51962593747
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


