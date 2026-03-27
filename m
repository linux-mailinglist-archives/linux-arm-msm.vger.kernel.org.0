Return-Path: <linux-arm-msm+bounces-100171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJElIK/MxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FAA33D791
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33F3D3077DFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF73124468B;
	Fri, 27 Mar 2026 00:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1iQnVTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pgigtzep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE2023D2A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570529; cv=none; b=sGrzz0p3HfaMXhBIB5DjurAifHZK71mm03zPsd6r5yLmbhnmsYMql4O8iScKnXlSC/sbE9wlR8Gq3T4zDzbAY8P4zlK8NR4C1bpyhKcGg3ArOCIjtZ7Td29MhDo6kLy/zzWGXgG0koVzb7cwozntveSODGjI28UE7dAVaRhZ5i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570529; c=relaxed/simple;
	bh=N4kCetZH2HDTf/FdvbViMjUNsCitiWXOOSAJsJSRvT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5rOtFaP2/sVHI5WGeRht/KCGDZZ+8k7UlIeO+lTLknfpWpKL1G78cP93pv8qL6Bmg3xoc+mbkDRZ2XpBsPqljgDVw+PW3hv1THj4EJv9HCxjFxVbGV2p7GEq74/kK8unZ0ZgNMTPzmxbtsQIduR1z4wGWC0zTfjhKNV/6mMecs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1iQnVTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pgigtzep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R0BgkK790018
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saJ7Utd8t6mFeiP8csyuhBkVXNGBrgBMuOZHTEwxtIg=; b=I1iQnVTuAgVNNIs8
	psTxdsIaYIkohScy1kIdhDVaNiEmUDrvdBU07G48U1DVC+doyZRasM8OUumr6RWM
	VeLoKJPbXhtZ6IYXtUfhMeCid7E66ovovRpWYL5cm4qlonRyUknXAxvdj7U+xjW7
	hMUELGDjX6zOoF4bvzfRfyfrGzv+iYzGraFnHpJmDOJImGbZg4nh9d3JaJi2YQhv
	4T/FUVbsdlMrKo5lDAQoHvHEgjlcT3hjQ9log31zDVQSpM8CD5afp1n1xCiXS+fK
	MlYzumUhG4aZQgcfNsnGBBsy/ua1gF80Ml4cifa4cPMb0t77l/WlSfHsQ4D1dceK
	+Up8iw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d53eqjhpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35845fcf0f5so2065043a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570527; x=1775175327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saJ7Utd8t6mFeiP8csyuhBkVXNGBrgBMuOZHTEwxtIg=;
        b=PgigtzepUW/S7Js7RgxJrsludXwOimPyyc7jro5CTX6VpImlyW07XgmulFH8UhQQle
         GyjNs/41aU1XVyVvsTRIZzcNXYAnXuOd9JLhZ7Y7u57MPl8+UKZzeJ5Cn35B4kavQ+pF
         Bq4wdUPuCeynSQsn9sJfMBUjuBSotw4FRtDeHnAvThXpLcGaZM9DQzLkxLqOlncS8CIq
         2HujGQAAxpI34yblF4Ik4K0HZ6pRn9tZ33nuF2xBkKeyXTi7TqfjgBN24xA0UfNE+ERO
         YYvUux4PSV+fcwOR5+ScMu78j2Undu698jPyTEW4shoHh4qW+CkRu1qv96kAjhf0/00w
         Nerg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570527; x=1775175327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=saJ7Utd8t6mFeiP8csyuhBkVXNGBrgBMuOZHTEwxtIg=;
        b=hqFvoWrUr049wy8zT5E+pgzkkx7WB3IMB7e3vZ8v9ziA43WnM2s1HjyhkeGx4VlKx0
         kLukMWxeLMYzMMl8/UkUuv0PhXmw6YW7Q5H5FhuRVvymHm7dQegM5cwqGCK/N0fUdfk0
         8+W1r3x3LpaM7FVMBf7yWiEAhF+ofF554L/Sasb22mgRDNDkQS0Jxnrfb3WGcfsW0Dtd
         8hrA2tUSUqYVZ0Nhs5uKibxJKlHIMVskWX5w/iSv3EjqJcfvOibAuaXHedIaFDKzu0ga
         QdNkl/T9dB/JN2xXV+CGksHc0kGArqNjP91sV+qzN4AVF0rscjHGd9VxWswrll25oqdW
         FM7Q==
X-Gm-Message-State: AOJu0YxmJKrPhaDbcbjgC8EmNSF1ZttilP00gyZE5wC6ourSFcDP6KGv
	1sYsXMVWgHuzMlPwlkOKD3/rQe6zHNOzJy6PO3VDA4pHzxtCtfvG0rGSbQVXcUSB7nRoVi+nj51
	saT6qryaF0TePXqvOyTe5CQ1vycLuHoO2Wj1O+dhvl4LmCarpjksB+3OITyfrivkTUdra
X-Gm-Gg: ATEYQzybRE20LtmtVBeRhfbiLfhXqPD6drbKIg14RRfIDxUekMynE4Nbn/IPuDQovKf
	PimUHDWzCAe2y1HnHyclkSjg6t8JBlBIgzu05gEMXQ8xLdqAZQlZ0zz6cWeq5C8BpQRXiNYwkPM
	xow7aMcQSj2cLvU+W5zUqr44pb31U4R9SnKEd3efoLBu4Iajmf2IDcwLysAT3KZ5j5zgnMXGlIX
	acbkI9vtzKXB7Kg5TviM3YmVvW0hvW+k1lkvRicxjbom5zKV/bHh3DV5zrqSacAJ8gyl5j0Ebm/
	6mRw8NUbFsf3nLsT8IjQ4KpsM9kyUzbKp4IpyHPTFCIyJUnfa5ko6s47vvq/gExMxLitaV8PcSk
	wmD5v8/RtGi7tjn6yGuCC8xU2j51dY6Lzkw4XI/f/yvViaA==
X-Received: by 2002:a17:90b:3c0c:b0:359:85b0:4023 with SMTP id 98e67ed59e1d1-35c30e090b0mr195800a91.16.1774570525411;
        Thu, 26 Mar 2026 17:15:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0c:b0:359:85b0:4023 with SMTP id 98e67ed59e1d1-35c30e090b0mr195773a91.16.1774570524866;
        Thu, 26 Mar 2026 17:15:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:58 +0530
Subject: [PATCH v2 09/17] drm/msm/a6xx: Use packed structs for HFI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-9-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=3961;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=N4kCetZH2HDTf/FdvbViMjUNsCitiWXOOSAJsJSRvT0=;
 b=PkRqHaDv/tazcfoBKv78PInYJbYNQ1ikGld9XVE1uh7mnf8ElZ8qG6+tWTgA8FYz3/lBI09PO
 QLiacQkGVLeA9cOPvyL0yM+mu8fIlD6dTJyKQl32YPmfZkC/37wExdZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXyPQ2AvUSmRKb
 ikxg7mnxYkthFsb7VCWQLNtCUvLvdms9GgOiowNOWqYx7BtpnQ3qcZhFHYa5bl6xTiwMBsA1Mpd
 GuxncSfI4vNySIxCO524CJCgAxC98lpx39XzKjt4oEbL+SKGdDhg+ol19wH8XmKr+lyg2E79Inr
 xAIcYMzcMj4N8WScqFP16Bdj1jlLAGv1hr4+lDd0bdGpyXQvls0yNngnPHK1emdvzw34u+Jx4tx
 JRW30q+ilh5hKu/zn9v40uI084HlHnLKnULVFoyhkyk/A3zg5YrDguD3De6lFM8ckJPPvXYAhBA
 QNmFNeUpHKwNBR4nUqKF1UdyDI9gVqIJpuqUSHOmk3Q7qBYgpRnUYYZphhBQuIb04lmz8RDTsSA
 nHkHjjoTx25fwPuT0zqNDHETSJKvcrC083/0pe09HeriUybIKpxgY17WMvUP+TV4DXWnx/y6f0B
 7UHSrpQwqcmDiTz85sg==
X-Proofpoint-GUID: C8Ce1vGeaaLhEXVlGQ3gi5pVEJAaDc0O
X-Authority-Analysis: v=2.4 cv=S4bUAYsP c=1 sm=1 tr=0 ts=69c5cc1f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ArFqxpKCfli7nxZMP-sA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: C8Ce1vGeaaLhEXVlGQ3gi5pVEJAaDc0O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 24FAA33D791
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HFI related structs define the ABI between the KMD and the GMU firmware.
So, use packed structures to avoid unintended compiler inserted padding.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 40 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 19f6eca2c8c9..217708b03f6f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -13,7 +13,7 @@ struct a6xx_hfi_queue_table_header {
 	u32 qhdr_size;		/* Size of the queue headers */
 	u32 num_queues;		/* Number of total queues */
 	u32 active_queues;	/* Number of active queues */
-};
+} __packed;
 
 struct a6xx_hfi_queue_header {
 	u32 status;
@@ -28,7 +28,7 @@ struct a6xx_hfi_queue_header {
 	u32 tx_request;
 	u32 read_index;
 	u32 write_index;
-};
+} __packed;
 
 struct a6xx_hfi_queue {
 	struct a6xx_hfi_queue_header *header;
@@ -74,7 +74,7 @@ struct a6xx_hfi_msg_response {
 	u32 ret_header;
 	u32 error;
 	u32 payload[HFI_RESPONSE_PAYLOAD_SIZE];
-};
+} __packed;
 
 #define HFI_F2H_MSG_ERROR 100
 
@@ -82,7 +82,7 @@ struct a6xx_hfi_msg_error {
 	u32 header;
 	u32 code;
 	u32 payload[2];
-};
+} __packed;
 
 #define HFI_H2F_MSG_INIT 0
 
@@ -92,27 +92,27 @@ struct a6xx_hfi_msg_gmu_init_cmd {
 	u32 dbg_buffer_addr;
 	u32 dbg_buffer_size;
 	u32 boot_state;
-};
+} __packed;
 
 #define HFI_H2F_MSG_FW_VERSION 1
 
 struct a6xx_hfi_msg_fw_version {
 	u32 header;
 	u32 supported_version;
-};
+} __packed;
 
 #define HFI_H2F_MSG_PERF_TABLE 4
 
 struct perf_level {
 	u32 vote;
 	u32 freq;
-};
+} __packed;
 
 struct perf_gx_level {
 	u32 vote;
 	u32 acd;
 	u32 freq;
-};
+} __packed;
 
 struct a6xx_hfi_msg_perf_table_v1 {
 	u32 header;
@@ -121,7 +121,7 @@ struct a6xx_hfi_msg_perf_table_v1 {
 
 	struct perf_level gx_votes[16];
 	struct perf_level cx_votes[4];
-};
+} __packed;
 
 struct a6xx_hfi_msg_perf_table {
 	u32 header;
@@ -130,7 +130,7 @@ struct a6xx_hfi_msg_perf_table {
 
 	struct perf_gx_level gx_votes[16];
 	struct perf_level cx_votes[4];
-};
+} __packed;
 
 #define HFI_H2F_MSG_BW_TABLE 3
 
@@ -145,13 +145,13 @@ struct a6xx_hfi_msg_bw_table {
 	u32 cnoc_cmds_data[2][6];
 	u32 ddr_cmds_addrs[8];
 	u32 ddr_cmds_data[16][8];
-};
+} __packed;
 
 #define HFI_H2F_MSG_TEST 5
 
 struct a6xx_hfi_msg_test {
 	u32 header;
-};
+} __packed;
 
 #define HFI_H2F_MSG_ACD 7
 #define MAX_ACD_STRIDE 2
@@ -163,13 +163,13 @@ struct a6xx_hfi_acd_table {
 	u32 stride;
 	u32 num_levels;
 	u32 data[16 * MAX_ACD_STRIDE];
-};
+} __packed;
 
 #define HFI_H2F_MSG_START 10
 
 struct a6xx_hfi_msg_start {
 	u32 header;
-};
+} __packed;
 
 #define HFI_H2F_FEATURE_CTRL 11
 
@@ -178,14 +178,14 @@ struct a6xx_hfi_msg_feature_ctrl {
 	u32 feature;
 	u32 enable;
 	u32 data;
-};
+} __packed;
 
 #define HFI_H2F_MSG_CORE_FW_START 14
 
 struct a6xx_hfi_msg_core_fw_start {
 	u32 header;
 	u32 handle;
-};
+} __packed;
 
 #define HFI_H2F_MSG_TABLE 15
 
@@ -193,7 +193,7 @@ struct a6xx_hfi_table_entry {
 	u32 count;
 	u32 stride;
 	u32 data[];
-};
+} __packed;
 
 struct a6xx_hfi_table {
 	u32 header;
@@ -202,7 +202,7 @@ struct a6xx_hfi_table {
 #define HFI_TABLE_BW_VOTE 0
 #define HFI_TABLE_GPU_PERF 1
 	struct a6xx_hfi_table_entry entry[];
-};
+} __packed;
 
 #define HFI_H2F_MSG_GX_BW_PERF_VOTE 30
 
@@ -211,7 +211,7 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
 	u32 ack_type;
 	u32 freq;
 	u32 bw;
-};
+} __packed;
 
 #define AB_VOTE_MASK		GENMASK(31, 16)
 #define MAX_AB_VOTE		(FIELD_MAX(AB_VOTE_MASK) - 1)
@@ -224,6 +224,6 @@ struct a6xx_hfi_prep_slumber_cmd {
 	u32 header;
 	u32 bw;
 	u32 freq;
-};
+} __packed;
 
 #endif

-- 
2.51.0


