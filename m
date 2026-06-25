Return-Path: <linux-arm-msm+bounces-114578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0E7JHCrPWqa5QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 804836C8F44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 00:27:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=myM28uFv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SESTfB9g;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 774013012CCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 22:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248D33446CA;
	Thu, 25 Jun 2026 22:27:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1837F737
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782426475; cv=none; b=b4gA/ur1FTbbrIf1asn37Y6cKRFi5geDEbkGpx4wlZm9e63euon8lBS8cJw4dZ+9HSnYWltMcL5c1ZIi1BKSc270pApU1OZ3QVvQBV1SGEIlIocapLF5aJREkIKCaFWt9/5YkVU6wEGJzcH1l0kfODlAUO4a+uXRiUC66EinWpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782426475; c=relaxed/simple;
	bh=0In8diwWOYQ7yP4vNQJ1muRLkMrsAa74ksEacPI3foI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgcyfUW49ERE7IbSvJEnQPm9Q1asxvY1j+OZTnAg3SnjhilnoaYlGEgqVTpxaLzHf7ZQlMKK97du0fYlneGo9PlJaoGrZ8ESrCC4Xy5PQ/s2CDVy4t+mTzGhGC617UpgLKrqSg0uBSXbKLdFvPxmZmRTJ9GCK/iSzyO/uzxRfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myM28uFv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SESTfB9g; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFdq5o3872205
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MBmzUwdpwOW
	8f0OBvo8XEGa9qbPb7NiLUabU+Y9s2y4=; b=myM28uFv8n8UWaXZYxfhIindakH
	nWfZW5fPkLmlhcWJ08s4odSUI+PTUt1fJlDXs0xycsUgRkGNEVfA5HbmszEYwcZj
	+m6gnO5LaAJ8R1iMANajWnutUrFeETZ1APeysrh5Z+eq7YIPSbhNwjQtf9uNYYHi
	5pB1KSrxztmvhZIoZYAsX3b6fhXkFvaByNs8oLsjpUIUpWJfjmwWioS4BhC+bNfR
	kJvVgfR+64mVNa1i6IU5AaGI2nSmTgaTXhzeEhc0uQsTKxEpCEo8mnZU/pnkoIO7
	mkNRaO99vV576BEbFnDHkcaR0tUioYbqLGQXXaqogGjEHLOPtIdHMiz2qUg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0yynufek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 22:27:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f0d806f2so3113385ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 15:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782426473; x=1783031273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBmzUwdpwOW8f0OBvo8XEGa9qbPb7NiLUabU+Y9s2y4=;
        b=SESTfB9gkgPRghdkPwbPNi6jDZrFIr/y4n5zAk8LKVxeRy75iO2thCbHbFuALnaRlG
         PCW2TD4JklWIveP8/QYpwQKo8j+m1WLpSn8Ip80zpgKH2I8g7EPoy6MTglUmfOsRG8q7
         BoFpGU14GxMR3b9bUBJ+bRoMObIymjprNjxEUzVMpPFzMfIB+V0H9NBWxB8kQF7+l2kQ
         1U2Vo2BTcZeYtTKNkAvs2CytGB2rWLwo6j7TKxmLI0a5pzk6RJCCA0hk4Dj/WzEFPCqW
         tffi5llPb1RUpJ3T5aO0CyMfDnQiofjrqmCZGi7+Jcm/UUBNXUzLIfSaLov0QGzRhzWd
         D0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782426473; x=1783031273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBmzUwdpwOW8f0OBvo8XEGa9qbPb7NiLUabU+Y9s2y4=;
        b=U1NlJgkfTUQv8OnRlrh5UNQfpv3HvDQFDJY+/4vQOyT12VwrCZp+xnN3t5j+YJIkwE
         FlDmWxysI7NAKlqZEi7xYozz5VVlnOry87be3SDQQahGZmCK791KB+6gn/GOMmRGNobI
         XwTwXR0XvbwOwCsyS3F10fMP0oJd6kuMQeyhIOcMsPlg5uB+E6Gtk8iQEZ3pE50xuYnA
         4NQdSOnClX/ZWqiEoyoIVUAujfSYF6+BYg5E6kw8d9ivkvlwhkeLh962KvnCnxfKijH8
         h9Tt1nP7CAnk7jBFHjRfcNIKWQ1TozLAo8ULltdAWC+n8NdoZeU722vRSDOxxI96RUvo
         sCyg==
X-Gm-Message-State: AOJu0YyJTLgSjj7LO7jTrkcceiM6yB/sIPk3fseXI1YtiMkIwCy3zoWF
	USktyCLVWEp73PWze/XXfLLvfoFL60Z0eIP2IOP4gIzpy6+Ft9lW1bNpnO/DJ1PQ/UyohBANgxt
	IvUj+8H3xZW7eLId45727quYil5LBKhw+DXQ/upDg4lJy5r1mwteoK8rzsvNyTpbVcEfy5fN/D4
	Hh
X-Gm-Gg: AfdE7cnrex12jKFYcoOl7TNbTUvdy1iALL/4RJCwjKjEDKb2eMhCwq3/lEAOmDs/RH+
	yGK803OeyASg8OhKWi/oAvmScj5ceNH+HAHKgAz4AOwxHcJirWRgzeKiwyf8fLuOkm4pmBPWv+c
	PjYwGxGq0Tgekc2LJNlUZoKSHUjoAaBzgYoqlcCrYtI80Qly7nCF3O+kAuCCvAFsVlSMEprKZpW
	fnZsgmmF5hJu6/IE4KUNBqZPQ6PTtjhWdlAoD4FhvTHM5ElOeNrxaQl73WOgG2O/qN56AB5cwuC
	eIGK9Q2/Q99CWoOK5KE9snRzWxPWf3NTlx7dppn3cmMCKqVRKRjzpaclx7Jv5/YXXZQ02DPG/Uz
	uJh/XX1IqPW1+Qi2LwMywVrDPiLL1fUkgFLYN0enYgDdw7ADMzc/dY2SFqA==
X-Received: by 2002:a17:902:c94c:b0:2c0:b081:84b1 with SMTP id d9443c01a7336-2c7fc681c93mr39522845ad.10.1782426472619;
        Thu, 25 Jun 2026 15:27:52 -0700 (PDT)
X-Received: by 2002:a17:902:c94c:b0:2c0:b081:84b1 with SMTP id d9443c01a7336-2c7fc681c93mr39522645ad.10.1782426472202;
        Thu, 25 Jun 2026 15:27:52 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5b04be8sm27459425ad.35.2026.06.25.15.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 15:27:51 -0700 (PDT)
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
Subject: [PATCH v3 1/4] drm/msm: Fix barriers accessing ctx vm
Date: Thu, 25 Jun 2026 15:27:40 -0700
Message-ID: <20260625222744.22254-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625222744.22254-1-robin.clark@oss.qualcomm.com>
References: <20260625222744.22254-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX4+h307jy2xlx
 ZsIOhszbOdqYUG5miGOfzeQVUR+RiBd/BPVbdIB9ZH/f5JP4hhuw0LjhSUthnCrEs3p757YsyFL
 yrx4yffQRV/m44WbbQxau0YbUzot+U6rMJSB2jlopv0q9vh/ipXYy/jIqSYQbU4AW64B9jyfVdG
 riDxxJ6udozaaUmH3HRDxaif1UNMUp5bOvDOMrjIZseVLgPApohilMJWAZOJNEdxLCxzSpNogOX
 BPuLVS0VI3O3w2ccIk8kOq9/sjE2L6Mos6BbInnjHLHN8zbZld139El0Hwy35l+kBGmz3Uhzu3B
 EnMayb1kWEkt/OWkA73IE8wEH9rIeVZM/vPgE4jtlo5LyqrHYNslv+uiyQVnlANqActk3NHKtn5
 R3BGZX7kijKyf8uNXZNIixCDu2dRga64OJaQv8NsUi5T6LSSRjge4dNzyaIGI5K/N9MHyzM18x8
 1y6rwuN1If8vDAQoGjA==
X-Authority-Analysis: v=2.4 cv=aoyCzyZV c=1 sm=1 tr=0 ts=6a3dab69 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PXeb_Y4BrUyLDKu8J0IA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: uCsTcCi8OTijKAFsQMURTryxxjnxtdJi
X-Proofpoint-GUID: uCsTcCi8OTijKAFsQMURTryxxjnxtdJi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE5MyBTYWx0ZWRfX610FXKHF/DEK
 M5y/Wtkqf6WZoFZIH2IRtSso2RVs6jgi83gERIR2HiDO95jbVYDLqioFk9+DseivNhi2927t+V5
 bhVbbKA1C0A5cQocphg6VeZ2TfR5RPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250193
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114578-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 804836C8F44

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


