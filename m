Return-Path: <linux-arm-msm+bounces-99386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPU7GjqfwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FB12FD0E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71648305464D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E9C73E0256;
	Mon, 23 Mar 2026 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIsb29pf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQALRXAT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD53D903A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296774; cv=none; b=f2IDIsJOdwIDXq8ykZk4ABhZ5xZqgLCZtfmu0JvD8Z3Dr04d+b5l0QQcmN3uZNesAxDdGkNS9KIMftRFE8muK13n1QU46tgaSh9kefwA6AMstNJOeH4J8AdnDvdkBLL5D2DrdpBsoizL88rZc8dS0FKWlr7LCOrvmJ7NHuSonSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296774; c=relaxed/simple;
	bh=DJLzmbucRspXCItdG/LdYzMZhld/T9yZi2VyuKHhrhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ag17eGy64lY9ghk8bVy5N03Onn2g6015L0AhqUKz3tkhXocMrZZLh+RMUEERDhyvmavxF8AFvYS+3wazh4C2U9Nwyp8SZ3XR2LPQAuVehWbGBS3ma3HTcCNOpsYZLlVEkmPjuH7rFmCHgxCH4iJrv4c+WsJGOooHjGQCgzBRFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIsb29pf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQALRXAT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqXkC1761799
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZUIEeydvmYEvJ4AasFR6sWOSfK2dLPW2bJak6RaNFAA=; b=iIsb29pfOLl8jjMx
	1Bx7nY7TtB8c02p9LXjZXleyZS65YbwcWV/bkTiBoptVdI4KGIpsdyOfz2r59XTU
	e8t7pRzjbm2ZN5MyA/Kc4xtvtLzxt0ozB6xw3hCzHgV3kUc0t146NpKU4q72r1nZ
	umUa+oyyzd7j3AU+wbbM/mrKJ/BdmvM6Uh2ewcFGSl3Zp5pgNodZdzjHj63XNbKo
	hQ2C9KSdcKkuxqyGvQV2s7w2Ends0WTPqcXgIJUwjtTKi3iFTEg8XXvjnOgzOAWB
	Gemrvp2i9nydko7onRfz1Fq/shRNvw+L0Y3bBNrbsDYAQIZvecd316RJK/QsM4KK
	UH3w3A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d36f09dr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a782029b7so2445438b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296771; x=1774901571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZUIEeydvmYEvJ4AasFR6sWOSfK2dLPW2bJak6RaNFAA=;
        b=OQALRXATla0fwayaMrSJnZniCTyyAfZbkmXLGGarVHNWxRr1HeZ/TsL01qLjzevEUe
         nbNzfXxwWF5jXPGNLNgNoO10nx/q0si4zmk3rdKVuCNoZ1+Mc8J+4pA+F7dWHmP4YFHm
         w+gyrElZPXvHM+VCZG1oJ2/fnx/lBbGpX8VRyUAEOnq66jBrGbI0Rrw5fbwshmbR5MGS
         6S47iSSbr7AzwFuDqQaLmKQDhBxSBz4BAZzpVihqnjPPBh5ohWDD5OioM0sYasa3Kpaq
         HeuscKCWvTGVDD/sqvNIQ/aSeejkaNqrHGBcSFP8W/QheYgFOhVefjmLgz2h3tNhEsXn
         TkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296771; x=1774901571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZUIEeydvmYEvJ4AasFR6sWOSfK2dLPW2bJak6RaNFAA=;
        b=ay9CjXr0391uMfCw6l8sIjslExLUFJVqAr2TTb0xFh1aE3DCzeE3+KGna/UirnxTS8
         e87VGdaqdLHspe7NjJjRAETOWyTXA+co2Sx83cy37rJNscabTsSW4rO2y7x7HwhjoKUe
         pWXULbrNSEWqlYK3q9vrQzD7g+npaBe7y+eGP/hZc3tpHagXEQh+cFkKYtSUUwStHhEX
         aKIV6hN9LxQsV0jB+SQ35lZtNtp5KheeZiRixahZsEfEsBTRcqmzyF8Op0bNLldwPeO5
         2uy/xc72HlzvWq6N6Daq5UXhzYX4vETYUJSl3LeX5afR4fs+GFak0F/b7fQE8J3Oatr4
         bzbg==
X-Gm-Message-State: AOJu0YyBioQ7DpZZXUtMwgV/xbMuxiXw7UXFzHaAWtrYJPfAW7ZVfwrd
	Nkab3ChcnKRkFt1VXzpP+0zARHKyEjIS0fqaQluBAElCjyZNDH7gFWVZgHMyBSVcea33Wzuh38N
	Xaarhvvy1ba9btbFH3tNG25nnTdp6B8/AqTOd5IJbsifYRH42UG/A9l5YpRmzyRihTUhw
X-Gm-Gg: ATEYQzyIXMZUTrm0cjnk8G/20Lr0UZvvlxmGk55FHsunalNq/jaFteVMUNS5YoY1x+T
	WA6UsLIN8Z/9j2VMLlnsxjOW85l0cVzQZ989LAsaugjQnoRI1k33CPL/hQlQRI4RmdlEBWSMPXX
	Kljx/oq+Li+hpqXmUYXHd+velGatcmqdn3zbzYurAIThpI7m/I8Kb/HhY99fQn26Tg6NIQcaLfB
	AZKAGzVtZUKcMvvT5yMlNyorEN6FZ9OfbAI2HwYE5PAwE510JEzLv4vDGBCrvfEPuFXSp4meYS2
	tzGaTcnFPuALQNWgxOqIqN/2muH3/OYOPhT+fazjTJOmnZmKDZqn6wTKBsqurcKc5heCgSZ9vF0
	dVfqAy5CpoPdb/E0/MFr9HQ6GP62ppLVdEVDAAvrnEjg6sA==
X-Received: by 2002:a05:6a00:21d5:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82a8c233026mr10856585b3a.1.1774296770518;
        Mon, 23 Mar 2026 13:12:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:21d5:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82a8c233026mr10856553b3a.1.1774296769990;
        Mon, 23 Mar 2026 13:12:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:12:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:14 +0530
Subject: [PATCH 02/16] drm/msm/a6xx: Switch to preemption safe AO counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-2-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=2121;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=DJLzmbucRspXCItdG/LdYzMZhld/T9yZi2VyuKHhrhU=;
 b=7eIpyiPVzz3/lA3tNdx6v3BjVJkz9FAwX5gIBKai2tJFGSn0FlxJ6dayYSPkVj/CSLne/fone
 t1xRhr84PPcDzDlp69R41ltZrzK+IhHNEbKr9lypHSHELE9CV0laPKm
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=b+q/I9Gx c=1 sm=1 tr=0 ts=69c19ec3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=5jko6oGmZP8uHvb63LkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: W2zTQP7SL3Ia_8XsaDw5qkcF53aORw88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX+2T/XtPHBgnb
 I8mn5Vv/3mMx/dsMr8cB4A/jt7IS/Z4g3QCJn14Iaq3wb2Xc8LH+v5AjhgZ5570FDIdkT0ttKf+
 8aVWRr7uXzOh8QHXrZxTBxM5ypdB9vIAzqdBY1bwKI+XDcjdHq0yGvvzWCnClVwrzLVpTnxu6H0
 zIAYvv2rnjTrAZ3bgJZq1p+d3duT00VXofs1RyJCEFR5FGdudCC/pGVJtkmvicB5UiJMQzHytdj
 GnnkRkn1jXY6ISBOievBTKQkQ7DIs51sFTIOl4vgVfzIFpjnMczcmmIqSHx7oOJ2VHQFTrwdUCy
 2IBx4EeyGeXza42wNJ4+PN5vOcAEWDQ9KyJs7zZXToFN7L7xnXRPv7oW6yToP34JgOGWRmi5qza
 xBcy6vxOzPLT4s0FPIvJhF0dNQCUH332BiskrFfntHvLA2+EiJ/hrgru2WlYQPniFUzZH0TDsne
 YHjrnCicyJtz+xm04jg==
X-Proofpoint-GUID: W2zTQP7SL3Ia_8XsaDw5qkcF53aORw88
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99386-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3FB12FD0E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
provide accurate data about the 'submit' when preemption is enabled.
Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.

Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 14d5b5e266f7..93bf2c40bfb9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -345,7 +345,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	 * GPU registers so we need to add 0x1a800 to the register value on A630
 	 * to get the right value from PM4.
 	 */
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
+	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
 		rbmemptr_stats(ring, index, alwayson_start));
 
 	/* Invalidate CCU depth and color */
@@ -386,7 +386,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
+	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
 		rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
@@ -478,10 +478,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	if (adreno_is_a8xx(adreno_gpu)) {
 		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
-		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
+		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
 	} else {
 		rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
-		cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
+		cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_CONTEXT;
 	}
 
 	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));

-- 
2.51.0


