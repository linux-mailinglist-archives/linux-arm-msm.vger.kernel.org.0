Return-Path: <linux-arm-msm+bounces-99392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FikFKifwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ABB2FD148
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 589B330B61FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D61E3E1231;
	Mon, 23 Mar 2026 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X4M7XseU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Al8BOA9a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F703DE436
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296807; cv=none; b=FFDlpSY/JjPQUNkiRqg/t/MW5YmCAfFsc0F8uQdvfOmOr3guEEYm5VNWKsZTZRl25SuACL87Qg24b6er/vtIKeCjIdwnV+wfd6JI5ySuSP5b4HAN9O1AWl1tLjE8fGEOS1JBihTy1Y/Q35WZyahbmMGLpIVB6D081011ko7oIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296807; c=relaxed/simple;
	bh=4zxAWIYbFGPJZdqzNURHE7IGPmYkkyOAYwc4ePuq8iY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNXKcFGk3/fcToliO7qHlHGSiK9Y4+wfw2EnSlWNqrAYJtLxdBU+9h2QwlaszLwN12WCYfdiOyhCFlTmuJEVoVcD6SL5RQV4fSrt386qbLJAWSB2q/ns2CU9Uxa1VNYjRUsBK9iusrbWD2pKPcXOITeYESjK6nXSqeGnqV2FdJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X4M7XseU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Al8BOA9a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqpn53934889
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+O6SQ5BKjVQu9nVs+GvS1a/KUjJBIyvuJGjIVMri3qY=; b=X4M7XseULhnwbuVK
	tMsA7hhB/c/oandTBDGtY7D0nVUGmhDQbcy2nuTmQ8Oj6Ti8dNyFsj3DWUh/Clzg
	UCvw+Rogu5C0wDr6gyMXao5zOe2Kv3kkvO5zct9gRH5CNxzna7xHIlpGi1XoHMDz
	JEwmQEgTRua7oqlsRxF/BlNcFwhTpOKHegolCHL87RhTr8KdGf/IaEg14Nutds4K
	qYQ+GKEiYD8AOl5fa2SGkmxnGB7zmllsjGfmI2KcyCx4rH4m8cKUNNv7N5zNrqaC
	7BUY47NZZje+GmHU8P99M9IO5VIPQ8kpdL/jPyGuS3GK9ZH+oXlsHoW4TE8WIA9V
	tOV8Dw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h6js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:25 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a820305c1so392450b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296804; x=1774901604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O6SQ5BKjVQu9nVs+GvS1a/KUjJBIyvuJGjIVMri3qY=;
        b=Al8BOA9a7OMlgxiMMsBY2jVdSNnDpOj/sFLyN4AIarzY7Q9MDd4ozx3n1qAGfA6cwL
         H6iDwxYgSRFK1XD6xduSfzAFbGoF0Yk9zL0DPNOx/+QX19T6t0BYWS1huDyveUrJEW17
         l/LUq7+fdpJ4q03KB5gzLMeNyvD5Ymm5YM/F/dv5n//6HlFuzRe101Hlz+mqmLOCT++q
         uhji0VzsqrTANv1wQ7viuHJyeYjNV4/iOxkeQJZ9IPwdHHVTNHC+0RfD0dpt2k3ZDLb8
         weXGwyr4Y/9nUMzc5K+ZZhnfBy4r+VsyOk0l5xpNlJJCTrQHtmZTnbtPHHJ6fStr6S+H
         Qmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296804; x=1774901604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+O6SQ5BKjVQu9nVs+GvS1a/KUjJBIyvuJGjIVMri3qY=;
        b=ZiXY7qDutfkkdSVRIhZnVK2dcnfrGgYVW8iLvKOkCPi+KkVNZ9W1kQApbMidJuBNVv
         +Zas6Jd1jL9IVRgdNMonDzTENJWaZaQQCNESMSLxJovtZ9BO+02S0am+j0xaWcbHp1P6
         x32mZrVaZB6LwM+eTjx6TGncQntPlFYIqEA2tcHNWtJHnvSPcpVAevdMpErXBawrFnML
         c6ulMgWZ30dQPT7nPOLhnJGE69UdWE6+Wj0g3XCdSy2/c3NbHHqwImHmyse4Ug/6q/8Y
         N0K/Wu99p5r0PFVLPNQJ6FxtVGpt8gevCh2K9lhWU4ODaSU6yTVsALArVzwTKeMRKpzY
         OBaA==
X-Gm-Message-State: AOJu0Yxh8zI7m2JaoWkTEfZHk2jG1V/klbDaUGPiXyo5NFl3ecAT/r8f
	sq6T3991JHcqAY8/9ZiYOog3XOIL+sdKFEs6DcnulABwo2a6K+Gzt1sumk0/MloJo6gjQdq8HYj
	uxSXU0xRQ51B8QT6E++AXmFIOV7vIIzGW+HC3VtxWwH9OF/84cOoavKM8Go8ZviQ+sGMz
X-Gm-Gg: ATEYQzz7broMorjbnsG5ygx1mliXlFqVucHb3dp9YMwb18IBUs1ojfX/QkgeQGOGgpu
	m0CUKAavFIVNigk4nez5DN47LNDNIDTnjte853ubgEAm01goejVtf29rC/6/G2JA9B7lW3/WZ7e
	8c+UWW0R2JW1N+BzQKkcE4qekEd5kTEYDHTuQKhf4yalLceQgCeKm1i9EoxV5+n2SwpFNTzHA6M
	ZoOJgF9iqqV30BuguUbS0R3ZWrZ0gX/L1GB32tV/8OXO1A/cNsV3UtmexPTfuoiGc5DBPRBTHGX
	shRixhDMVnczJHSOqBcY+CxoG4fmdkfmaHNo1EnRYEQZ+qnTwnSBK1m8BJ4kwtTfzvYoPCdOc7/
	1HQrk5q0tXl7GuWYyUbsU5qjq2yriABzRLUuwdK6ozhnbhQ==
X-Received: by 2002:a05:6a00:1a89:b0:823:1d10:cf04 with SMTP id d2e1a72fcca58-82a8c3b88cbmr10947683b3a.55.1774296804316;
        Mon, 23 Mar 2026 13:13:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a89:b0:823:1d10:cf04 with SMTP id d2e1a72fcca58-82a8c3b88cbmr10947651b3a.55.1774296803779;
        Mon, 23 Mar 2026 13:13:23 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:23 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:20 +0530
Subject: [PATCH 08/16] drm/msm/a6xx: Update HFI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-8-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=5252;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4zxAWIYbFGPJZdqzNURHE7IGPmYkkyOAYwc4ePuq8iY=;
 b=a2Dz3Y6fr4jNZCH89Aek/iMsncePcji5TDTxjTMHmuU0EsB5iXbHSJaDp22+jrOYoWLH5zUN7
 lj4JNars1x7CwhdiPOLG0SbUDOiZniv4z97wG9eBVf9BNa2LpXmLjVt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c19ee5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wp9Eiz2YcQHRIHTaYAUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX/HBe974bWoVK
 JQAOsWBeexCBKrlSNGGqtsdn19CcQRRjbRKihB03gWj8yWiQ/aBFK9L3cjFS6R31wOYtMdfB9By
 J6ZqO7ZeHH4mMIK1kLV2d+0ay5b316leM1orT0YnhbkeJh2aRoc8Iwv1lRy/W0ceGcFBaKMV1hB
 523sqmYhX5CpyU25cGGdmPHJmoRQfUi3XPjR6nbk7Uq5lElwZ/juL2A+vCdXUtV616+cUPaAHbo
 36u0RmoRlWgczPt3fI8bG+Rq8wsOdxX/AETe3A8LIfe0n/X2nTKV9IPUZTUylvD8LVbPACE3L18
 0yswJNoX9nnA0ggxLcEQKq0oN4GDNOD+DJxJ3nwS3BQE97Ph196N3npLhHGF3cxt7C1+4ggcEfX
 RtElvPLbjJycGOsL8I04b/IrPdj0PpeXdLyHaQtZnKz/62IxzveFpz3/W3QUcIR4i2D7VkDT79E
 cG+KjISdhnJ1rm8Jzpw==
X-Proofpoint-GUID: 2JCaUVx9t49eF97cn_FqGMO0pWV6ko6T
X-Proofpoint-ORIG-GUID: 2JCaUVx9t49eF97cn_FqGMO0pWV6ko6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99392-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9ABB2FD148
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
index aef00c2dd137..d613bf00e3f8 100644
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
index 217708b03f6f..917b9c9e9906 100644
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
+	/**
+	 * @mode: BIT[0]: 0 = (static) throttle to fixed sid level
+	 *                1 = (dynamic) throttle to sid lievel calculated by HW
+	 *        BIT[1]: 0 = Mx
+	 *                1 = Bx
+	 */
+	u32 mode;
+	u32 sid;
+	/** @mit_time: mitigation time in microseconds */
+	u32 mit_time;
+	/** @curr_limit: Max current in mA during mitigation */
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


