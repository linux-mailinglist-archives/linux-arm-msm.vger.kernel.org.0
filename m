Return-Path: <linux-arm-msm+bounces-100172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ANbNALNxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:19:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3233D821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4294C3055D5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D9123D2A3;
	Fri, 27 Mar 2026 00:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccs3gzHv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EC2iIibt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3811623D7D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570534; cv=none; b=elb3NWPG/v4WDulRWFXbaL102OQmOBPqfiIfcnzlBhpdG2aHatl6lV89Ywx/Y4IwjXnQyGXM7Iz0ByjZatD2NFYHJj8aTOmySP6TRrJRSEeoX2kZV93lFk3LnfNJRp639/Y9JXyqAC1I2wVwNd+szjl6VGgFx0Pa7/MtNkevAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570534; c=relaxed/simple;
	bh=JC2wxvFzu+YVvl5T0xRJcUHR8veH92d6X32XhMscyIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlvR3RrO0uJZxlUB3KrT4wKqVRwFUsCq7fRD0e7WrJCa1mioHOpNXUZ7LrZXbVFBRfGjvsuKO3ZScdMJHu/ndZOd3k8vfrwWuVbz3cs5cdLbGvJ2p7A+r4l/ltyYOPfIPhQtmugBxE/7zrjo8dKO8KBAiccnYhUzGL9I2pbI9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccs3gzHv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EC2iIibt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QJul2g3076223
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUhadNcE6d+rm8/73vxtaIMsY1zh3Qjnoy8Bpem4KcU=; b=ccs3gzHv8EVZASao
	xURN9WiI+9xTCT+fNNvWRzXcv0Ra4gLEIsPUYTCOF0I4MbWYxR2Lxc4kIBj/T38C
	T9JPhNOa0cGkRQ0+69TcPTWSa5hXqqPgXDSVTQ4EdyjVOOVrL3mCN9TbnouQ7cGT
	Mqg4eyKzhzy/+xPDsXNeqW+/mxru+W/zGl5wrI91FxVr9z+RNsSLUrbNJOCwlgs9
	49SbEJSzSfmuTXVZVDI7fWKh/PvPLoieHHszYiyzYG4IuWzGGclhvB0DYBm+1LCl
	ZqKJaIsFaJYeZOvOkXpmJ5X/RpCLGqCHmL9uigN/u4qqKeeD+Xyg4kNMUx98kRVB
	2TnpKA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8rn18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso29194505ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570531; x=1775175331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUhadNcE6d+rm8/73vxtaIMsY1zh3Qjnoy8Bpem4KcU=;
        b=EC2iIibtxbK96JMu3C/C+kzHkkFLmAEfqGIVtLjq1tgs7wEIb5DVrBho2Ei+bn/KlO
         Zrr6HXsyN/dS9l7j2XTeAp0mNL/jwctgxlTGnAQUbORvO8PACJzreIMkoi8BJYFCKPIV
         4ZVrqh9SCvR5VOBQWZ5xrllJMScSaC2ZqLjA6x96GwlgF+ayZMXFk3BWuQJl7yYGunsO
         /9Y3UKi727SEEVHgVMz8Cd31yWe1HS8dwP0nlXTePddE4xFbT80iFHFE4TEWMxUsARQ4
         gwNCOUna0Hjup+wsD7Y+hTSZ4Rk6rwJQeLX8EgeKHBa1C9AEUBb2mBdn1i/V36My9IAw
         9Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570531; x=1775175331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUhadNcE6d+rm8/73vxtaIMsY1zh3Qjnoy8Bpem4KcU=;
        b=a73BWL7tvoJxS5vXknuOpFMABu9v7XZQRshTDvga7Rh5XnEjCDeA85sC5hD2+5tI21
         9cZZYAYFTklSOzesAo/NstgaCf6Y4oD8gekOOEOu2MwWxidKjQeFGO3qRaOBlCQ/Klen
         Lt+rBj2SgNlhq9i5bGzEsEXJVvX+CIL4aXDCGMaA2Yy1DTEqTFyxC9/dN6OiCiphBidG
         RGA0tJaPr3dBXeoRu2fZkXwmEl38k4xud6JXQvYQp15F/RiH3GLgtGo9U9/3vTk35svC
         aiwHnRB3OemvVUug1Hj3ONmKP9C1IrYgDHWplpYRFRIcKjkuHP9TCF6Cd9/YsbafysBl
         z6bw==
X-Gm-Message-State: AOJu0Yz8bRmxggbSeDY8nAsjE7MoJpfbFlvS7dIRBAIpmp0j8UROsf7L
	LyIQQY4fAElYWsd8NoSvkcD8DIay4ddhcpv1bCcP3jaS5racqL/vPivivc2vXCxMEFzl5VPoT5M
	mEmpXfNyrjdsx8Nm6cAPuz/jg7PnFw1BWPbUFGBh1qllLuPR8xqkNRWIm4VgB1Bfsbj2T
X-Gm-Gg: ATEYQzxvcbH0GJbwG2MELraJxFLycBLVRXXVGyOwjJVqPCMYsMBTi9fVi5wzrkNGh0Y
	MNfje/mOB9EPsn1g3wkAZliVLzU1Cs0qSsSO1WMmzftmBSFydYE6yDWL9XXJlmbE1lVwp0i145I
	4nLkoe74TyeCVTQfkpLNSznZ9ySfoFJE3BUacGhDHOQmJJiFKn4JjnsxGN0VgQxhKlVDU6fxCHc
	e5tc/TDFony7KJmE78mJwLR/nV/I/Kik8nXmNZV6xXH2BRWv3VuuIAgOZPPiihR8uaRehFOZHjT
	AUJjhhC7KGQl9bqfkw/Brrq/XFumICeTViKj8yJZK2X4Z6IAfRv0qLb8+n6xqU/c/Uj+4R/2Clf
	/WqoquXgnqm4F8T04M3On9BHo1Q2c927XFKZJFmotluhzEA==
X-Received: by 2002:a17:90b:4b0e:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35c300c19d2mr460801a91.22.1774570531265;
        Thu, 26 Mar 2026 17:15:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35c300c19d2mr460749a91.22.1774570530658;
        Thu, 26 Mar 2026 17:15:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:30 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:59 +0530
Subject: [PATCH v2 10/17] drm/msm/a6xx: Update HFI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-10-2b53c38d2101@oss.qualcomm.com>
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=5196;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=JC2wxvFzu+YVvl5T0xRJcUHR8veH92d6X32XhMscyIE=;
 b=JfyoEHjVEiM+OKcG5KAOjJ4wfNMvZWfIxYdQ7OxK+rhR+1eRE5YmYHC5XBPjYD+JE1TwA4s3i
 4MuSQKKzNf+AnA4raB8hBXYwkHth996CsBQKczTafOu5xvOePEC8Ytc
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXyf8cer5+paa/
 k2QBVU92RU0ZpxqA1bhkaTnYKm1qep006LwCGFIWZMHTCIDMZFCR6qkwpYR8FttF0nd7a1xgyL/
 ZZRi2NUtAj8lPNLeSjexxwriFnuEi7kV3QdWq9ns/gpQT++TaVwc+8lLoLx4cxIwnrBixC+6pon
 iKY76LSnrG/j7b6zfAvdlAFwlkZRlqcKGNv9KwZybkTmpTtvsrVHWGJOjjozKEodxagAFJcJmbp
 eR3EtxXY5Ei1BUEKtDmAHI0zB2Uyxbh29IHYfK2onZOo7fwaE7MSAhpGk3rjtpxE3O2Zc8yqIxR
 G9Mtv0Qg6Kj2ZHnwZHrX6dC24x9i7Ed4VmocJk4+Ct7EhLb1B21rCwnhxASvhOD1AZ96IExz17/
 ByeyClK5A3Is+xJDiLMjnyTCQ34aqGtyc0b7RXzUGb9zqTe9F56DHiohj88ndgszcKMPSknJlw3
 oFxU6t6L17h4dyG3Wow==
X-Proofpoint-ORIG-GUID: oEqkFKNPQnn1HDt7xRkrSTcJREZguHPw
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c5cc24 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wp9Eiz2YcQHRIHTaYAUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: oEqkFKNPQnn1HDt7xRkrSTcJREZguHPw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100172-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 41C3233D821
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the HFI definitions to support additional GMU based power
features.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c |   3 -
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 113 +++++++++++++++++++++++++++++++++-
 2 files changed, 111 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 09b6bc464b47..487c2736f2b3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -851,7 +851,6 @@ static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enab
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
 }
 
-#define HFI_FEATURE_IFPC 9
 #define IFPC_LONG_HYST 0x1680
 
 static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
@@ -862,8 +861,6 @@ static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
 	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, IFPC_LONG_HYST);
 }
 
-#define HFI_FEATURE_ACD 12
-
 static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
index 217708b03f6f..e10d32ce93e0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
@@ -165,6 +165,42 @@ struct a6xx_hfi_acd_table {
 	u32 data[16 * MAX_ACD_STRIDE];
 } __packed;
 
+#define CLX_DATA(irated, num_phases, clx_path, extd_intf) \
+	((extd_intf << 29) |				  \
+	 (clx_path << 28) |				  \
+	 (num_phases << 22) |				  \
+	 (irated << 16))
+
+struct a6xx_hfi_clx_domain_v2 {
+	/**
+	 * @data: BITS[0:15]  Migration time
+	 *        BITS[16:21] Current rating
+	 *        BITS[22:27] Phases for domain
+	 *        BITS[28:28] Path notification
+	 *        BITS[29:31] Extra features
+	 */
+	u32 data;
+	/** @clxt: CLX time in microseconds */
+	u32 clxt;
+	/** @clxh: CLH time in microseconds */
+	u32 clxh;
+	/** @urg_mode: Urgent HW throttle mode of operation */
+	u32 urg_mode;
+	/** @lkg_en: Enable leakage current estimate */
+	u32 lkg_en;
+	/** curr_budget: Current Budget */
+	u32 curr_budget;
+} __packed;
+
+#define HFI_H2F_MSG_CLX_TBL 8
+
+#define MAX_CLX_DOMAINS 2
+struct a6xx_hfi_clx_table_v2_cmd {
+	u32 hdr;
+	u32 version;
+	struct a6xx_hfi_clx_domain_v2 domain[MAX_CLX_DOMAINS];
+} __packed;
+
 #define HFI_H2F_MSG_START 10
 
 struct a6xx_hfi_msg_start {
@@ -176,6 +212,41 @@ struct a6xx_hfi_msg_start {
 struct a6xx_hfi_msg_feature_ctrl {
 	u32 header;
 	u32 feature;
+#define HFI_FEATURE_DCVS		0
+#define HFI_FEATURE_HWSCHED		1
+#define HFI_FEATURE_PREEMPTION		2
+#define HFI_FEATURE_CLOCKS_ON		3
+#define HFI_FEATURE_BUS_ON		4
+#define HFI_FEATURE_RAIL_ON		5
+#define HFI_FEATURE_HWCG		6
+#define HFI_FEATURE_LM			7
+#define HFI_FEATURE_THROTTLE		8
+#define HFI_FEATURE_IFPC		9
+#define HFI_FEATURE_NAP			10
+#define HFI_FEATURE_BCL			11
+#define HFI_FEATURE_ACD			12
+#define HFI_FEATURE_DIDT		13
+#define HFI_FEATURE_DEPRECATED		14
+#define HFI_FEATURE_CB			15
+#define HFI_FEATURE_KPROF		16
+#define HFI_FEATURE_BAIL_OUT_TIMER	17
+#define HFI_FEATURE_GMU_STATS		18
+#define HFI_FEATURE_DBQ			19
+#define HFI_FEATURE_MINBW		20
+#define HFI_FEATURE_CLX			21
+#define HFI_FEATURE_LSR			23
+#define HFI_FEATURE_LPAC		24
+#define HFI_FEATURE_HW_FENCE		25
+#define HFI_FEATURE_PERF_NORETAIN	26
+#define HFI_FEATURE_DMS			27
+#define HFI_FEATURE_THERMAL		28
+#define HFI_FEATURE_AQE			29
+#define HFI_FEATURE_TDCVS		30
+#define HFI_FEATURE_DCE			31
+#define HFI_FEATURE_IFF_PCLX		32
+#define HFI_FEATURE_SOFT_RESET		0x10000001
+#define HFI_FEATURE_DCVS_PROFILE	0x10000002
+#define HFI_FEATURE_FAST_CTX_DESTROY	0x10000003
 	u32 enable;
 	u32 data;
 } __packed;
@@ -199,8 +270,17 @@ struct a6xx_hfi_table {
 	u32 header;
 	u32 version;
 	u32 type;
-#define HFI_TABLE_BW_VOTE 0
-#define HFI_TABLE_GPU_PERF 1
+#define HFI_TABLE_BW_VOTE	0
+#define HFI_TABLE_GPU_PERF	1
+#define HFI_TABLE_DIDT		2
+#define HFI_TABLE_ACD		3
+#define HFI_TABLE_CLX_V1	4 /* Unused */
+#define HFI_TABLE_CLX_V2	5
+#define HFI_TABLE_THERM		6
+#define HFI_TABLE_DCVS		7
+#define HFI_TABLE_SYS_TIME	8
+#define HFI_TABLE_GMU_DCVS	9
+#define HFI_TABLE_LIMITS_MIT	10
 	struct a6xx_hfi_table_entry entry[];
 } __packed;
 
@@ -226,4 +306,33 @@ struct a6xx_hfi_prep_slumber_cmd {
 	u32 freq;
 } __packed;
 
+struct a6xx_hfi_limits_cfg {
+	u32 enable;
+	u32 msg_path;
+	u32 lkg_en;
+	/*
+	 * BIT[0]: 0 = (static) throttle to fixed sid level
+	 *         1 = (dynamic) throttle to sid level calculated by HW
+	 * BIT[1]: 0 = Mx
+	 *         1 = Bx
+	 */
+	u32 mode;
+	u32 sid;
+	/* Mitigation time in microseconds */
+	u32 mit_time;
+	/* Max current in mA during mitigation */
+	u32 curr_limit;
+} __packed;
+
+struct a6xx_hfi_limits_tbl {
+	u8 feature_id;
+#define GMU_MIT_IFF  0
+#define GMU_MIT_PCLX 1
+	u8 domain;
+#define GMU_GX_DOMAIN 0
+#define GMU_MX_DOMAIN 1
+	u16 feature_rev;
+	struct a6xx_hfi_limits_cfg cfg;
+} __packed;
+
 #endif

-- 
2.51.0


