Return-Path: <linux-arm-msm+bounces-104484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WARsAEaJ62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE2F460ABC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBBED30668B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5F0370D56;
	Fri, 24 Apr 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRJN+Mqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhYguw9s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DC73E1CE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043547; cv=none; b=AztWxtPR4O365UiomYr1sGhtkEcahBKTXNaKMq6RbK8a0bOfz0fPWNaNmyIhO9khslif4fHBiLgnia3AmGYOOrLs1sbi0+4XSGsil/pu7mijDdWb4nzGmXBHg50/Q7jR6G6AUOfP4GnfSTm46IPUrY4gIQdyKnkYDjGYKjUybgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043547; c=relaxed/simple;
	bh=6eDx26EG998hscLosra1fWHiRyCYOylVPDbJtrjnZo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfxrGfcFVBVueKo5iaoITDPdgI31SEnH2lWGiVfW640/i+8GoIVRZ1pDRNie9bnr6NoXg2BwIc9p7S5u9kninaaBtp57wYU0nl7s8Zn/V72Q0Z0CG99lTHTu7RfjsOc5f0gqfT67X1OUv6jf9Dfkepsop4ANeVZpIA37BKcFirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRJN+Mqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhYguw9s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OF7CjH1532320
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KywJ9hcCP0V
	e4Q/2h24NGhAJMgZTF4FNw76RvtNMYhk=; b=JRJN+MqddyEDO5gYUdhUGuwzto/
	PpfCNdi9dD7KhQUWOgRuBWVZd+GWjYZItIGWRSmi8WbD2oxwye/wYAex6ciW6FQV
	0MuCI5GebYWW9bpM2/E4xPPW2NPVfhaYzGw/ACW97+vuSMGKTsGgrTksuHPGv7XZ
	DZOeOEkF6cPaFh3de1KNCQ2t1MKKALOob6vgavBRfMG6DVi3vyILaFhoqBFRkDCr
	trkNjLosenQjGUrFfcBRpo52xBdfzYmV9XRKdWACKJTBt90RvNOxd3eyVWrrPAiY
	ByLLhKs7vdedJSumfXFYlgo3AyE5ySoBa5RCTZ/fyKrGk4lkvPMszxbHGPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr26mpgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d83e7461so135883405ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043543; x=1777648343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KywJ9hcCP0Ve4Q/2h24NGhAJMgZTF4FNw76RvtNMYhk=;
        b=IhYguw9sTU8j00Y6r1HwAZ2vgu8Okx9EWFAihWTpaD3+/cOWuU3KjLY52ZQUXYJ4bt
         acaLxztCuLP7g4b91lR/+iofBkQ7P2oyYOR60s2Q/A+7dFqFRKCa5jQ0R1Pa9gwNkj9u
         g28pQgFq9Ozp378RfX/ERqlLosvR/nQ2A8jGvTF8NV4mM3/0JXyoU4fE8KVnUFmhzChZ
         o9+58kUszHAo41OhniO7e6tkEz1qag7alAu5wiAd+iIKiud2guqH8omdAyPMfox1W+xc
         Ez1GIvMjpXRfaMs9H+T8g/hCl+5FnUtxoOtlmpn8QsP+p1XuTF03WW7DNKwuuo6PiBqL
         e5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043543; x=1777648343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KywJ9hcCP0Ve4Q/2h24NGhAJMgZTF4FNw76RvtNMYhk=;
        b=DsZSPVvGUonMwyC2vwERMrAw7l8mB9RLYQhtZVEyLC7VKtCb2gmGoeQfeMuNFf2n8j
         IgLm2OHU9FLdue98JYVKhz0bB39ZU4LdJAgYcB+FARW8u9W5JQR4FbgcmGVKvzliMF0X
         0Tsx2pCGV8Mltmt5HON9JDDrGRh3M3FDsK1t45b/R3OlYA3yofT+xOZLkx+bEr8hy2/3
         iqOmR1EJVmdaXx8yKomZVj8ZYYvH+LjeOrMI4V+ng7UJFJPwMwRyZders/udMQJl5nn0
         PFnjS2qBhbAfyuj/ki3Qwy01FIKCqdza1SoCwVDN1xVjoP4ysOE+DeJHHFNUUsRjXDtr
         koqw==
X-Gm-Message-State: AOJu0YyEHV0CRyHDfIL70h8VDmdoAC2tbPcch0cIP4zi43duG0SUM08p
	yYb4KikFNAjYxpvYKTQbUj9ThTBTRpWWlJZ0OFif/OXDls05gQ3gpwZd+f9hPlF78Is6UqEkdYf
	XhZ3bHCEa2EfTWIzaSAyEW1WAKOSPHXQP5Cn2sNT7jBrQFSsHuzkjJA/9gZOWLMkoxORq
X-Gm-Gg: AeBDieuRejA9QA9G5/2NZIcdxGsSPxVhJ+NTKrJkjyVuLDRY3HxNwP3KWTIeCkS4++l
	opzlqSwOzgEzwmEdZx5rSxLRX9R328q4rVLyNI0lyvD+QOm++u0wKbxIBXOdAE5jwpSE4IzmdOy
	DQqP9K+8svX7gDT5jcM5ZDaLf/ytjnulT4ILMrK7EXJ+Y1pivW657fXoL/vQudmeeZfj+kaOlbq
	3amBmOIew/b5C4tj0XnYY1vk0tirA0NGmYUXk3ASj7GYzs/8AyIHNwRrgXoUbauh0k1neX8pJP5
	jMTMiBzGCVvWGLKE2NCUwrDu7lN6JRl+C/kr82NPPkR67IoBl+5IEzxc1khQtyIXxziAq6h8Bqw
	OYXomlxTzsqnGIHmYqg3WEusKoh4DsaD2cLCzVYfIHP4=
X-Received: by 2002:a17:902:f70e:b0:2b5:ef7f:a47b with SMTP id d9443c01a7336-2b5f9f4e150mr365608895ad.21.1777043543115;
        Fri, 24 Apr 2026 08:12:23 -0700 (PDT)
X-Received: by 2002:a17:902:f70e:b0:2b5:ef7f:a47b with SMTP id d9443c01a7336-2b5f9f4e150mr365608555ad.21.1777043542633;
        Fri, 24 Apr 2026 08:12:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm209805085ad.77.2026.04.24.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:22 -0700 (PDT)
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
Subject: [PATCH v2 14/16] drm/msm/a6xx: Increase pwrup_reglist size
Date: Fri, 24 Apr 2026 08:10:49 -0700
Message-ID: <20260424151140.104093-15-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: KPUMiFETaUzhZKekORn8VGrYx0ZQcwod
X-Authority-Analysis: v=2.4 cv=QLhYgALL c=1 sm=1 tr=0 ts=69eb8858 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=8lTVeMJbxB4f0FvlbnAA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: KPUMiFETaUzhZKekORn8VGrYx0ZQcwod
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX0K7533jMppMD
 7/O51vplzQUNtAehx8Yn1NWgnab75i2J50yQSEJUnl6Xv9ryu8Lo+LSzcGEkg5mHH78JJK8gTBU
 rR/fpRV0GUNBMFtkea/e7dbzHaj0MWA/ygfryHlT/tlmuk4/SYKYDHcoWkVbRKnmv9TX6bmGe/z
 Xnme6OVff4HhWwsGWtpDUOsIcqtgmPS3yxKQuzEumOUnoY8G0dSxfQK8YeeP2sHT+aoix1qi0DV
 cm3mzy48RLBIFKMm+92/exYf0G1h9BdOPaY9iBnwcoehVxGR4aQD3Xmssk4976ar8bByO5OuRLY
 SIvqdBEKIir3XIQ9ld+Vjnv0WZFoz0W3BlUkgxOnQq4LaecyBRs62VHx4A3OMATUeMqzQ6JO8Vt
 Df4quUMehFEfxUU8fD0YDTOOk04fHHwveUXeCAOdEpkizmSwFXJWOTd45iSlS/OQ8M7difSarGN
 8QglUYd4y/qZ4TSN8Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240147
X-Rspamd-Queue-Id: 5DE2F460ABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104484-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

To make room for appending SEL reg programming.  Without increasing the
size, we would overflow the pwrup_reglist at ~190 counters on gen8.
Or possibly fewer, considering that some gen8 counter groups also have
separate slice vs unslice SELectors.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6d0f8dcbe9b4..04a6335ac5f4 100644
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
2.53.0


