Return-Path: <linux-arm-msm+bounces-114570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hlX5C25+PWq73ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:15:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C36276C852E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:15:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GYTbPnoc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eAEPbeuD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114570-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114570-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06B7A303F839
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 19:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CB4344DB0;
	Thu, 25 Jun 2026 19:15:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEBC33C1AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414948; cv=none; b=oAT0hfiHrbfCxVMItITemDkK50YEaurKGg2uKjHwlzdBVpaceQ68NJGVwJI87xLtdy6ETu5QF5VVCfib3IlYq6qKg0dhywz0tTa9iZt9Z6Mx35ENt+4Rjx2Xfbn3OWoicAtebUhj+rbF5916bi8Rr6ZkMVp902uA6FAJC/bUIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414948; c=relaxed/simple;
	bh=0In8diwWOYQ7yP4vNQJ1muRLkMrsAa74ksEacPI3foI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TNYOjKC+pR80If2RFU36HKZTClxMuV/ZuoOl+ZokHY99CyC0LdIedjlttp9v5XPgKyyE3okmRuA2u88FY1shAaWO5IrTd8In1UqbScBcyYgjd1P8w3i0ODwHhxTcwffIm97TcNepUXsP4j5WDfO7brmdmQYlgFLAVKGdcc/qH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYTbPnoc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAEPbeuD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFeieC2544175
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MBmzUwdpwOW
	8f0OBvo8XEGa9qbPb7NiLUabU+Y9s2y4=; b=GYTbPnocIofMqsHo/huqipvjJmd
	J0pUHz6JKq/DKk75RtGkNCC52Gcutz0fguNM9NE1IdBQRNtKlxy14lWr0togA7QP
	xqmxAsDAo8gZ6thvrrBelT/L6ucep4AXvEibIyAJhow5LTXczuEtqwb7mZssARZJ
	WW4GLiPgd9OPTF+y/d8o7OUYMr1ZW5ve0tLiE/4E4YrAh0RDnu9Zxgj+Bo3TDpO2
	yhWluz5HfenRam/iGfcoKY530n+0bTT3SMYmyLKmIVP+2ymbY8pyat31IQu9oET3
	/QYYMCgTpIVhC7vtMHstzSGhv0xApi3Orlc/pu32l6iCXDDNmAdwtB0qa2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q3j1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso78823a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782414945; x=1783019745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBmzUwdpwOW8f0OBvo8XEGa9qbPb7NiLUabU+Y9s2y4=;
        b=eAEPbeuDKeBGkJhdjkljmxs1HFN4vXQAUVein+ayMweuPzmN6EMJt1CMYv43tnPbcD
         OkMpUOuQRXDeuPl3iYKJ4PfE3yUYBvHE/kC4K2e4NBR5PN1iAVUwQT4c0yf6/GBqQ1ls
         fMJf2Xu3GY9c/tL32ASJ42wULP54Yct1R+flvyv/NBOAyStFAyXYznuS0GYCbK8bM14I
         8gpEHTnd5u455yNm149L8Nm135HS5+8PBQ9jU0TERTmOwkuErEfEVFjolUEifSGTBoZo
         kLcwpdMiLJ1Ubb7NlrylK24NfPw7VxU02CCMimhcyy8/zcz3V7sJUm8T5KQxpJMmC2BP
         SLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414945; x=1783019745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBmzUwdpwOW8f0OBvo8XEGa9qbPb7NiLUabU+Y9s2y4=;
        b=FCXx4dJuYsC8XGU+agviH/LlWOTSy8bDuzoR1j0ylaS9W8lGtQ8r5apKXk8eAQt1Z3
         HEMIrd6pDW9qc/MVTiV7xDJRca9FDklCJRxCQkdwgTWYzWZnFSDiDs7W2xC4NxB9mXNO
         AyIVY+Tr/Ftex06B1fzTTDUKS075WpFivHYaORJN3ZMDxDuweQrRJhOO9+Znh0GNYS8Y
         Me7JsBl2hAQo6Zr/xzw+Nap5KDpM6XrVPvuY2uzMQLkJOBTEmlKX5eOTVJJ/LAyB/meB
         xwBLeiZzWTEU2pLnDgYX31ppuE7oNlKO2UxUQElb3NQiDk0Fo/6U/x7oU02OEx4OfO1J
         lo0A==
X-Gm-Message-State: AOJu0YwSQ20+ZATY71a8ILsRJO9oJ3c25UwBfKuh/bi/vQXp0o6+11+2
	pp8OP1Yqi4LFoRK9nmVV41SuEjqJLUdf8gnhvsL2KNkTPueCtbG0WuAJEF7XIYfbUlJ6spP9rWc
	KoijEomwTEeeq4aLumNZB54OKN4pkKiNERCyuk+2EWQjTF/HItjQpr1BR+ZmIWwFwZ4BP
X-Gm-Gg: AfdE7cloYbKPwoggg4Y5WUDD/ojcQWzUPXezJtFV/K4JRKhbBtTP3Q88cv/9f8tq7wQ
	UkVSIDDCmNHzVUB2HqzIRBEeo9CZ4Wtuy3KP9uHXE2kJVtMjqvHp1UGoIHbs7Tbb0UCb4kAz6VC
	VzYSLlsiUje5Swz2hXDV4wdAgE0thY1fnNO+AiSPNH1YvStHgb+10d14ah+ZQsQE9v3VO0LeX7p
	RnAx6QvZbLyJPFADaObj45w7O5UpI+LlcLSa7xMbR0+OXOpesPIxdIcU80wB+mSGyWBrSLcxkdb
	REjtlZvZxWcUy8prj2CL9/2wXmj84hel657xy75vcidqYdRs4YkHEeIAx5sIqH70Gh0PtJ874EP
	kaH5WKXk/8cYODt6Ldi4Oz/9UFt4cLSFtEAjqAopMqFvbVsx4D8we3EXAYA==
X-Received: by 2002:a05:6a20:7491:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-3bd4ad9023cmr4376104637.18.1782414944641;
        Thu, 25 Jun 2026 12:15:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:7491:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-3bd4ad9023cmr4376065637.18.1782414944010;
        Thu, 25 Jun 2026 12:15:44 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcb9c813sm2176638a12.25.2026.06.25.12.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:15:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm: Fix barriers accessing ctx vm
Date: Thu, 25 Jun 2026 12:15:33 -0700
Message-ID: <20260625191537.47965-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
References: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RrMyjsPLZCwmbHyIrMOLeDWg3DO6Z8GG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX8c69/du/Vq6T
 KwZxPNOMWQDhAKafZYONfZd5WD0YDFRdDIiYBoIXfn6kYlJfFIZE/X2Gs44pAg4AEKgPvVoohHw
 TGHPXMQXvX2i/55bhSRgeTdYOiisHWc=
X-Proofpoint-GUID: RrMyjsPLZCwmbHyIrMOLeDWg3DO6Z8GG
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3d7e61 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PXeb_Y4BrUyLDKu8J0IA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX4O9w7mIVzudC
 1FcZ8/7+9YvtR5EHrh3PDGOt+OvCm+McPNHIT3YzHdwRAejqWRl19KzbaNOR6kJqVF5BjRb86oT
 wxe93P9RDHwQJJ3MueV95CnKBtkkJTZvGUhvzpzOmzCsDqeRG0afx1F5b/5+X2g+DjnOY5uS7Qi
 LiF4s9UtED4UORIHunqxR+YsAfgjKaS4w7Uu87Xp2ga5+tgyFY6UQAhrV6XCtXaRRMOSt/BFAAF
 d19rsR94MKycEtYN6BQoT0Q0jmiE+EDgbzaPwzbs9T5mKbOHhXsGaisrWq3NQJyb7ytakJ78sYK
 LvsydVY8ZBogNhIjHNDbaLoqVnBq4JxuX8tXokkfTWe+faIl4UKEW7IkHiP0gssVy0J7eTn4Kn2
 jxATpaVq4ZaZRxYThY5KZJEH0mogEqoCEcWVLTGZgnovp9mWafLOGyzsqowjHXMfxwlsAXCZS5m
 E+6eh3ihy1DUanHs/4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114570-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:sashiko-bot@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C36276C852E

Don't rely on store ordering to protect us from caller seeing a
partially initialized vm.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: feb8ef4636a4 ("drm/msm: Add opt-in for VM_BIND")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 32d5ebea2596..ec88155e0ed7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -224,18 +224,19 @@ struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx
 {
 	static DEFINE_MUTEX(init_lock);
 	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gpuvm *vm = smp_load_acquire(&ctx->vm);
 
 	/* Once ctx->vm is created it is valid for the lifetime of the context: */
-	if (ctx->vm)
-		return ctx->vm;
+	if (vm)
+		return vm;
+
+	guard(mutex)(&init_lock);
 
-	mutex_lock(&init_lock);
 	if (!ctx->vm) {
-		ctx->vm = msm_gpu_create_private_vm(
+		vm = msm_gpu_create_private_vm(
 			priv->gpu, current, !ctx->userspace_managed_vm);
-
+		smp_store_release(&ctx->vm, vm);
 	}
-	mutex_unlock(&init_lock);
 
 	return ctx->vm;
 }
-- 
2.54.0


