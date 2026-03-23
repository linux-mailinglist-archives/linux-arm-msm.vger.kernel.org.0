Return-Path: <linux-arm-msm+bounces-99388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCReBj2iwWknUQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:27:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE852FD33A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 831BE3074F15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B2F3DFC7C;
	Mon, 23 Mar 2026 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hb3eSMNd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vi+Jit4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C573DCD89
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296785; cv=none; b=e0STV19vmzdy66ofbix4IfCQs359Z6mivJFKdN/+9rZkZgf4GGyu++dRYsJ1an0EI95uNZ77276gAIkPkOsQ+N/4m0TujyjNG0/6FQT2uuIcULopvf0cujc21TviVVd8azZPI+OmnZ0UpQyX8YsT85R0/CIGTUnlhtzrpb6gkno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296785; c=relaxed/simple;
	bh=sELChCEzxCGR2Lu27U9noN48qPqz/NrmLFJdIRsmNH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlqXbZKJPGaZefCSxbCJEQuBAM9V6eWo5Y6diEvjzNRpRufhX+bm8wFpFIk7nmXsrYzkCc7mr339d2/CCZwjTVHjDZJY2lsgg6R1uVUdu5c2PFmQOBdR1l0zYTai9xpqa79I3EU2bT9Hn1GFj9dAOKYfE6rs60W5vUfDp1ZzIxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hb3eSMNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vi+Jit4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHr8WO618876
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vuW6AnATRy0mNRNmrdAu80AS+AJJl14JYp6IvrFFHNQ=; b=hb3eSMNd5wSMQ6e+
	EqNiSySNyqMOI7bazhzRGQCNqSYl8WNOUBgNRs1BAxePQvqO0s6cMCGBVbJ/mOhL
	UR0VZGjVYzaFSseWhchzDnXfXPvkQF4k2rEKJAITTCYmuEhX9Rs5dLaf7qDBoEsN
	4YE7pg90XtHwufOTAnG384F6ZgC3Iv7MeLp0FZ9SPih6qECJmA0ymOuPjYn8tP8z
	/elByFWpjNkRiMX9JTCPccYnIYcBJx2/GFKAZpDcn4TTdWXi+tiSVR0p0dSeHPU5
	jKVVXvYP3RhXD305DTU0lxhiNTgMjbqd24heCr872QEJrq+skCy4Yce5r5/Gy0cX
	ZwYxgQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjkf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so3900803b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296782; x=1774901582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuW6AnATRy0mNRNmrdAu80AS+AJJl14JYp6IvrFFHNQ=;
        b=Vi+Jit4keVX24oiKkWzWh5oFjrp5iTpBTkSAqJe8JwHlpjBByQf3AZb31ID4jZ/xYM
         ISdCiRtGEQ2P/0hX83ySF14rfE7b1uvtYUB4JXj9uM8gZGnVwgF3ehff2q+Cd0VvPkcT
         hZBIGrSKQYqCEooHUgzwAOxkJYQ+IOwPZw/XPbKRxhmvRCDPzakNZ8HYIyQAUJuMPTRg
         AWUylaZ5s1j7Mr+ahjTdFGty7IGpFFmy01pEL8BV7T4xzUCOBo20+ePANI3XhTaZ1mFu
         qQ1SlDjbdCKz/HOdUe2JpFZcLdS14Ozh4kjcnEJ9O/1TBDzGNgN6zV1xW83pSWH42CJa
         wYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296782; x=1774901582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vuW6AnATRy0mNRNmrdAu80AS+AJJl14JYp6IvrFFHNQ=;
        b=H230zoq0PRXXeIoboUeT926sB+bzoBUs4F4ZV5odK7e3K6Sp3v3O6bmb3P+mqKPlZS
         tSgDyN04AEYK6dzew4zLDQWNoSxezCwGuQCcqVL0YrFdDgvGVrUEp9WKrA206GfjRvsq
         iHBg3MV+bboHFxXHRmGK49dupbLczG6Z7PaRc7DekA63KicYZwx3URKPHvDsPaP3Rwnr
         wszNQkamNdC8ztlDebAGI4M1yFA0W+6CuVWhqmJPvwTcdS94JWgQfPIpOTJghWhbOyZy
         y3NBznxmIhUzxG7/2dC8l+S6AurWt28JLn2tlenjmuYPXD0XDqWu3LBNAf3QMArtxcls
         GyTw==
X-Gm-Message-State: AOJu0YxUwMZ4ipWcSq9WfEbpW0KgDrk5vFVazNdfVVNvOOR6A678ZlhQ
	ktcYXrqst4DFlUpz7wssd4yFtk4VHcToqV6/Nzw0xbbb81c/z1tGOV8jNgiSLEI2OkZE4moFt89
	HgGKVQ6fhda7qCTjU8Dm+wgB3hyZOIXsWVKKT6CYxycWX2XIUmghCVkf4GcArokjItRNn
X-Gm-Gg: ATEYQzwoHqYNpsHoV0nhYPT0YPmWgMgk05VzF6q1A3flFmOEaMLOgWEl4nYiMMZqXVa
	ddymVQPLFUGfMenh7v3NlTCan8R/GOveVjx7u3CpKA3wm5LUp5qnlo/NnBY+lVFsnrRNQBcDLXe
	3Wqha7HcGAmfNING6hYZXXYF4topiSRTNIVuqU2lMA+h9elrJH+5W00WOKsN7zKmd8xnKJx2UJ/
	RE4ZZuJIrF6/NOo9HEvyndgKxABWxzGs2YI8s4oVPP1Xs45rTpFiIAtuDNFwR+FkefMJH4OHtJi
	9es8jAvmaO1Tv940SdqhfwmdYNPrZjYSbOReAolUEGyFkstgqmxafkFoZT4WnUsfDmhYW9wjY6l
	uqLs/1kxaHecKPRDrOVAu5w2UkGYge/s2v5YUaaa4pG/RpA==
X-Received: by 2002:a05:6a00:4288:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-82a8c302094mr11008586b3a.31.1774296781768;
        Mon, 23 Mar 2026 13:13:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:4288:b0:81e:7496:f826 with SMTP id d2e1a72fcca58-82a8c302094mr11008547b3a.31.1774296781278;
        Mon, 23 Mar 2026 13:13:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:16 +0530
Subject: [PATCH 04/16] drm/msm/a6xx: Add support for Debug HFI Q
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-4-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=3294;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sELChCEzxCGR2Lu27U9noN48qPqz/NrmLFJdIRsmNH8=;
 b=QRQiVhG4a4bfTyTLpWD25BEfUelIPhhcz/p6tq30dvKOuPYxKYBHwauVgKxvptrDrGtCNHFGA
 Pu3HSHbAmbHDjw+o2kFeXCyyLk1vAPhXYiw9VIaaOCacIhIu6dHRDSd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: m9bBtzctOxgJ5mWljr81h7Jcxb7LuW7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX9pgQCTd53tV6
 d+6U4mEZV7H0IRXY82Xn/UPWS4rjlYwiB7bHkMmrszJmX5ayOJfYi3F4dPTk9+19vSGO0i9OMN8
 oF8fp2RnYF+n/ype0+N+5IGvHGwgHDi7MEkkTuyq9bFCJlWTRzre1IeFugTjRwUjW0hqsO9s5cG
 dX61AFpCCvIA1++dCTus85gpoFsLstiUygIJq/5+ZXiJmTZvcCHHz5CZohgKyJXroDajijYACUW
 lF4uhrbAEvvIf/fL/K8C7HGZzIpG7RJv8HqBEn6lvQJXdRCeFaqENmD2fluQADsUpXSPAZBVS1J
 bCuAl28EF6EQEFuCWqZ4kDihoc2QKgbJQINPORMM9CDhsyHODeUSC+B+PX79G9zELLxStlNj2M/
 sMXeNj176+B0vcX91dtbq30ynNEo2bF2/38ZYjOJ0bg0dZeGep3t2NA/knxmdQQ6EhAALYv3RS1
 R+UKJ/OihFGvL1QQn3Q==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c19ece cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=a1WYpzXZzT6O6UdPSaAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: m9bBtzctOxgJ5mWljr81h7Jcxb7LuW7e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99388-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 6FE852FD33A
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
index 2af074c8e8cf..dd0614b19aac 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -110,7 +110,7 @@ struct a6xx_gmu {
 
 	unsigned long freq;
 
-	struct a6xx_hfi_queue queues[2];
+	struct a6xx_hfi_queue queues[HFI_MAX_QUEUES];
 
 	bool initialized;
 	bool hung;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d2d6b2fd3cba..018c164ad980 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -57,7 +57,7 @@ struct a6xx_gpu_state {
 	struct msm_gpu_state_bo *gmu_hfi;
 	struct msm_gpu_state_bo *gmu_debug;
 
-	s32 hfi_queue_history[2][HFI_HISTORY_SZ];
+	s32 hfi_queue_history[HFI_MAX_QUEUES][HFI_HISTORY_SZ];
 
 	struct list_head objs;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 53cfdf4e6c34..2daaa340366d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -1056,8 +1056,8 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu)
 	struct a6xx_gmu_bo *hfi = &gmu->hfi;
 	struct a6xx_hfi_queue_table_header *table = hfi->virt;
 	struct a6xx_hfi_queue_header *headers = hfi->virt + sizeof(*table);
+	int table_size, idx;
 	u64 offset;
-	int table_size;
 
 	/*
 	 * The table size is the size of the table header plus all of the queue
@@ -1076,12 +1076,22 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu)
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


