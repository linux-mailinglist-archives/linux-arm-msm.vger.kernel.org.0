Return-Path: <linux-arm-msm+bounces-108798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAucFaDNDWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A85F59076C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACEE33092F31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F103EEAE9;
	Wed, 20 May 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLrJKZoP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckM/xNCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA433F44F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288711; cv=none; b=hzv/AKH89cARMbbsLqjLs56Uuhdp3g54GAo/eUPVmtn3uPu5inDyd1q4jINAYqM4i3f5RpKIrNUepSOX1axO0izJc/XTuubQ8N9yn3zukaFpqWEtZZA379Y9P/rPaDFqrsK//GUm6EBqWg3LanqScOHhN1h6eR0z4pFIgWxVgks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288711; c=relaxed/simple;
	bh=Rq86OqLICFZTHwXLSbQJz1dBgV2pgL+p7E6Jilm9kng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+9hWRS0+kWs4Bt1USuTRTgXdFwqhS7tq+G45nmnAC/YlP9Wn650WAH8Znr+4sm0KVqCK+g5it3rRBwe47df5sk84QNYfyGeXp6DEdAYEqRqR8rZ3hSdOp1lkCwEHLmwdHqrmJz18CLl8MhwLMLSCMttv3iQq5J94hcbZiIiieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLrJKZoP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckM/xNCc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCctAC1725327
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NK2U86iVUwe0wxQ0Q8Wy0PvlrVHdH7DQTfK16+7BeiA=; b=kLrJKZoPEpkYiTcx
	1+5v7y9f+Yf8W0fgkJU/hROnIS+LLs1nUbVRhZriEWc1jl337owfxxV1PgyCSi8v
	zNX+AU9/QZYhCY/NVrkYsIt1q6iNrthVku7IEMX4jGCF5kObcEFrCPvP2pZk7+gk
	j0fbIxxiqGI57QKhVYB0oQXEBqoWX5X0w00OkYVDpqTXML0+b34+R3F3qSIkC+W/
	kEeoH913ritLWWlmvJteRM1XxA4W9uXpeo2Tr6hqYv7Dr/cMEm5OKIbwD70W2hjo
	p3R6Y0yMwWemIvimoMK0n4QXxV093vPLnbOcetj6uxQ4+WRoZS0SHh6suDBhsPd0
	zL+6EA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn8w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6343bea7909so1924324137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288708; x=1779893508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK2U86iVUwe0wxQ0Q8Wy0PvlrVHdH7DQTfK16+7BeiA=;
        b=ckM/xNCc2Ri2DGVnPyZIGtSyqFwwmytsgYtI5ksj7mlhQKQ6BhJ+V+36zYbfkVzgTL
         ppH8B5BrweGNDfofRuvrpVGw9kUImiWEyfOPpxhdgNY+HG0Xsq/ntd/tBe89DBEn0WRr
         r9GwCxFje932x7JVgKheS6lGf7je92L1Mf50HlkgyjL0HYaifypRq2jZBQYXENelNf4u
         uA4vO4owkTKJE0AE865AaL5CWe3ujIEsaC5tkysZ/8SzMBJPKRq05K73bx7/cItabr4H
         DhQGJJblqqXXk1h5+jTTiZkzsDg2DryLDrtctaeMqfdGXGfi3dUYHNTieeKmoF7Ew+3V
         remg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288708; x=1779893508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NK2U86iVUwe0wxQ0Q8Wy0PvlrVHdH7DQTfK16+7BeiA=;
        b=qTPTdcI+k2L14iDWBzhe4NF2+i4y5BQ0sGOem+xNC1gAf53L7fKs8/oWMqlV2Ckdrx
         rG+jXzKkGkyByFHatrrOF37T6h5BCX7k+R1MFc0I6ClHEdL9MJM80A5l+MrBB1grwZ00
         aWr+yNsmvS8IdXcoZokPVZi7R+ETl11i3C9XdFJ8E3IfhoJd3wEodA0Zj6CsDIADZ8x0
         fPeCnQlII9sJvS2LiQD5MC0umoKoFxQedB5O37xQBbp6qD/CmEH9PDmltA0FDu1DSeyS
         qzOgZ1LSk/B4wMUle8RD1BPZTVqJk4CQ79UxOAonxxv/1KHkAh0zH20q3lFxOrb+F6dP
         KhWA==
X-Gm-Message-State: AOJu0Yz7QmRpuHaM4uptANE7aE0Yqhp+vsMdzsntAokk4IB51wNnuvvX
	1YO65CtyWGSbK0L6ZQIvadoFKgML8ZSDEDGz3VLhezo5lIO6gr3v/LDizZoncuFW/KG67X6fhon
	Nn5nGcAXoDk1bmkpDli+LqVY6T7yp04cqObkKRcYKc8WaYONGIE6AOJAL+Qoeu0oMLStO
X-Gm-Gg: Acq92OHkWMRBn6AMYgS8UiZ/nIaJ8CFQd2Hh4/4nFG9JWOpmUjSHuOft84dHLJMruCW
	YC2Sd5tQ1FJ+LZmt7gL3tWijDnbcENOluWgrHys+afULzFOK2J4bhBCzt8mLFAAOM4rAEVmp+HN
	jwuqYGw0gn2UmJpueB1xDGQjX9lmA5g9s2YCIudec6uITv4YmKrSqPQAP3Jqt/Jt4yYzmXTB1qh
	Sd04WXeadqCuQZpWo6Ocxo5dfch0GDC2wJV8U1L+9uX7yztPFnyHri+x2UyBWZTqQVkGowDT0bb
	ZBKMsZ/oJKC1GTge8sd8b73SvbfRAhKolmEThux6TNlOjID/ESjyqDn7LK3/REj3+R7UYNVz9GT
	Rjm9dMMsAQsWeVFwNicRKSapzWl016POnR7p5riPCcCrirqKQAB67Dkdvi+m6dUsMAsUjkBpAZn
	FZpySkawnOzXktVnHNJqcVNxDrLy8ypiRthz4=
X-Received: by 2002:a67:e70a:0:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-63a3ee862bemr12371443137.19.1779288708328;
        Wed, 20 May 2026 07:51:48 -0700 (PDT)
X-Received: by 2002:a67:e70a:0:b0:611:e0c2:1604 with SMTP id ada2fe7eead31-63a3ee862bemr12371144137.19.1779288703085;
        Wed, 20 May 2026 07:51:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:19 +0300
Subject: [PATCH v5 12/28] drm/msm/adreno: use new helper to set
 ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-12-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2770;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq86OqLICFZTHwXLSbQJz1dBgV2pgL+p7E6Jilm9kng=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpnUEAvxY7G7aZM/d5Hma4ALMMOdIYBP2Rtt
 UZb8lqJ5vCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KZwAKCRCLPIo+Aiko
 1c1ZB/9jYl+4DtBU2lqbMe4XPOpNhy4phU2TyumZVEgSRaYdONjSU2MIbn2lYPs+Czy7fPe/f3M
 9Bx5cCVxRLGNWHYMKjYFYiMHdSLXogh+ooVcRhZd+PPL3boBKTzOKEI5lYj7k/h7RTJD+TIf7kR
 x/0YPS2PZaL0w9omGNZjnXISUOAscZTb/6DRgkpob4au0PM0aqs3AGv8QwgJGqF2bVNMc/IT/kh
 0/b+6BUciHQY+DoXO3UjfLo4riTgFj72tDbXptsmuX4QKfMcnvk6bK+3XnvefsWCu0dj6AXgfXa
 H8Mq6WEFw6fZyZlp2OeJ75JjRRsYpEgL/rPlOLzz5qZK1n9m
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX4bW6Ivq55/r0
 4Fzgbh1Xn2ZjiJxzpEB+IBhm1TDDzViuOnZ6ZzryTdxDqGbVFxWmQNGsW8MTbvSjzLf5UlLWdH8
 tGe9na26r26M2Q+Dag3VN9tF2XZmSzyQS945F90KJ0rVYXxm00AQQkzaTff2Cjy5sOAQv7QRt7q
 tMzzBTJBne+/LaFblFFOtiOGkL1x1iJzF9a5V6/VR+I+TA0kZd9enDHx56qr3vR4I38Xh4M8Uq1
 OnNowlW7RlXX7uT363xBFZKxoUD20eMhAiLN2SxRSuncw93pj3X6tShAR5mnayQz3zfQwv/bjhk
 MQXNkxO1/LHYNzZDuUejidmv5IID1ffX0GCgcQfcy5rYO0HvrHmI76LFHkqc4OhguLTVabSvtuc
 GJzwKI3heTU1qrnc0pfaPzaFZ6Dxp2deC/VUty4dbuBUGT2OUGg5FcgcO2W8roznYrPrbbTB/5C
 RfbRA3mQ4+mJfXLt71Q==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dca85 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=cZwUhCRcRhp0DfqHmjgA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: r5feaC-RqxgFLAtPQesoeee29NHyFj7v
X-Proofpoint-ORIG-GUID: r5feaC-RqxgFLAtPQesoeee29NHyFj7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108798-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4A85F59076C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 43818d1907ab..e7a0d315e022 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -745,7 +745,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(cfg->highest_bank_bit < 13);
 	u32 hbb = cfg->highest_bank_bit - 13;
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
-	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
+	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	bool min_acc_len_64b;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 1923f904d37d..53def136e0fc 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -275,8 +275,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
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
index 78d7ac3fd8c7..6a0877e5374c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -434,7 +434,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_UBWC_SWIZZLE:
 		if (!adreno_gpu->ubwc_config)
 			return UERR(ENOENT, drm, "no UBWC on this platform");
-		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
+		*value = qcom_ubwc_swizzle(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
 		if (!adreno_gpu->ubwc_config)

-- 
2.47.3


