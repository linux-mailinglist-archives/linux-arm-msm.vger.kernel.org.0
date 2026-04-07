Return-Path: <linux-arm-msm+bounces-102089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKa6GkPP1GksxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 677173AC0B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BD21300681D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452A33A3E9A;
	Tue,  7 Apr 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nSnbsysl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oor3SxVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34083A6B94
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554321; cv=none; b=llh4nbirjEKMDYlFqAMRwFSm0TjyPBMn/PAQ4DkmJEzBkvq2EGOQREVshejwfHJquV4u8xPYvGGSDgc5K9YoYr/BEIS8XrAyfIbHzm3oniH9io3JBVE9qx2KRU2e5l1IQyD+RCvaB7jG+tKdYHgRXIo1u/9qrsme6QSSaRXDI1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554321; c=relaxed/simple;
	bh=1WuIHXjP1EOU8oxrMLqv00jirlI6wlcaXjj7IvPVIE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fhbmtkHKCq1s0OXtDYTJWAQ2c0QcsgWfC647EqO1qK6mUTOqPdJnbkWVAJeNcuPEvXlVshliWrkuHppxxVxZ+qa2v+ZsBp1qvhDlPrUiNiF+knURGw0TPSsT3ToUzWWZTnX0SLmCRVmpQTUkQLADjvNGggHIWu/zBIVayL02Pfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSnbsysl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oor3SxVI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376X4SM2327732
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tjvfWn90X2gwQ0oPND/UL5ENlIlf0ru6kXbNjLjd5c=; b=nSnbsyslSbWkgVmV
	E9qgjM+KFyawR11GzKroT5/BaFql7b5DjuINjxJ8TsnHomtr4nd2QV2oqD2Q8hLC
	U5fbJHd/98jEttC5+vZmWaGGpfXnRQlHpV/V5Ay4gwYHP8O6PmlYDB+zCdrqAEjW
	IDI20LtLWB3xWKYGOHJS9vMgWfNvGePch7E/4Yk/XMrtdkSh2bSeGOmd50/KVdUY
	p8WIOfj4JnctrgaegbY7OmRGttWtnQIvGpKlZ6dtSPMb7QywtjTfBRbu42LVyBK7
	MRdwkiGhH5dlr32VWCEiANP8hDImHALYOhhbfGsqAW4/tLhkmb3L50/2yWIwINdk
	8dyP3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4t2b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:31:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242b9359aso46716075ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554317; x=1776159117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tjvfWn90X2gwQ0oPND/UL5ENlIlf0ru6kXbNjLjd5c=;
        b=Oor3SxVIs7pETtzIPpV1yd4QLDyrHdHqsqpsxRQWCCXv4IAiWHITjkMasEI12QsIYF
         5YIbMxD6nLGcSAqEOTFGOI9wGY4KoiOfc22Vg43oj2gzM7OfcKmtX2Y73JtsxZBSVm0g
         x3xtPmcbypFQ9GmMamjFtu7HMhsd8DeaVZ86r3m0KIqDuVqWoJkJOgSNw4siCs9iMM18
         C8lO7FXP9hj/nvmfzT+AKIHAIVF0FdbuatHlP16ybKUDzXmxL2BhD2/Z45x5MRNGJOSj
         UTMSRRzst/jIgiDH2X255ISFmHHXcvyC6y95AEEfCtiKlQ9Lx02PAAsT/VanpP/UGkMs
         jiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554317; x=1776159117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tjvfWn90X2gwQ0oPND/UL5ENlIlf0ru6kXbNjLjd5c=;
        b=n4NmE5HJR+QhfRuTEMqFwY4i1y/weJaoNACRRvF0guYUCfPuNiCdJnnS2JZOMHYnhc
         B9bAJWz1+A/eaQYkca8YXPWlbxttk14zYp+OYEUZNWLKK1i585IuXZa1VVrAG3/eew3V
         sHUN0CL0I/eOFtLXmyqlozRs818k/j4/DonO51AY13y4WKuM82h/gHZHC7zvKQmEM5ka
         1VkxzGmWt3y2O7pbhFsdOZ+hmPrQR44df+LQMeZC6kU1C1KWHsFeklPuUN0KrpQrNV2+
         RcSOaTPno0c85D5oIZz3D8v2Abxp5MhGOLngbq3ZK/qjtcq7I6LT1qR43lDqe2Ej6ZLO
         gL1A==
X-Forwarded-Encrypted: i=1; AJvYcCWnDAfENr2nxNnbm6Q/xEZXvebsEvb7peWgvbf83Tm0WcU73Zpkg2K2yai5QIZeGZMUYgbJsDZmG7Ie74vd@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMCTozhQgJHyKXMhU1XH4ktiTYywGvf2B1s0nDhDJBdk1gdS6
	d9dIyOwOYTqHBnTq1gFm/OwPgyDXkIpOnCWdA31/UShGZ6e/WihzVYI4mvw+of0GXQafROJq8fI
	wVkxwJnuve/dV5EruqXPVZDc/QgS6nJuajzvSQmYStfmh1YXPnElItfaYc/LH4QQZr7TJ
X-Gm-Gg: AeBDies8wjocZVD/k+Dkd31SnnSeVfVilSXi4cZDMnSY4PMJb3reSzIJCftKyY9ICIV
	khhJv8DxJ6ZVk8sZm9sQcPQJyqoVQ7brSrBQdI3TZixDA2loUIhOoAxwnSmxaIIIIihBV81ghWz
	Itx6LMj3VNq6b6GZAB+87Di4SNp806qz+RjPyHpx4RKEl364OTmq/2aO5pcNSF8xAZx2FK5cIJj
	bJjY7KcmgXPLcD2RXsqtFzX23TNeKPCRVBj+wrvmaWtbIKCdUrwPCUFNe3YL6nglxavg3nHAXgj
	n6DZTXpV8Hwa1gLDOwWW4QpkDX3h9A/OssmMn9ULVBPnj+BKrWM0k3WBGhTOyK0mlqmlnA1Nrgs
	M4jJr8jyvtetS3NppxuMEgAlcl7nVFurZqQOGbe1Wnsmf5g==
X-Received: by 2002:a17:903:b8c:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b2817b5e43mr172137945ad.39.1775554317318;
        Tue, 07 Apr 2026 02:31:57 -0700 (PDT)
X-Received: by 2002:a17:903:b8c:b0:2b0:6885:f1d4 with SMTP id d9443c01a7336-2b2817b5e43mr172137655ad.39.1775554316829;
        Tue, 07 Apr 2026 02:31:56 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm172888365ad.33.2026.04.07.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:31:56 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:00:55 +0530
Subject: [PATCH 5/6] drm/msm/a8xx: Make a8xx_recover IFPC safe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-gfx-clk-fixes-v1-5-4bb5583a5054@oss.qualcomm.com>
References: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
In-Reply-To: <20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4NyBTYWx0ZWRfX4cOOWsPdhast
 Zjp0QdLB0GkgAeH/LG7XUCqYjUYznRupdcJ9etCpsSo2ggzLN/LhDozerUIkOgS5k8W2TqKdsrQ
 a54laDqE4G5l/Ynn9Z1R/EkhnKUNiQRoeEJDjNhewAXvu7rAVMMQR7LYZfvNJi4nLg+pKAtN1/L
 8Zv83inIimXfNhWPvVOsEeB89LfaAPFDCIjtZuUPSLIy6yxQ49rH/9hjMStTh84hH6USzAPUsTn
 zLalYSVx8Pw/TSTgU+TFLzwQkr2qRX0NwrzF0l3xp/4kNqf8IY8BwJcI6KuKpQvghOexw3JDwcB
 DOydep+BC5RmF8yA+XtKchdnerKcsrxNzkD6Lyrz/YduHTKSnLJjtrLbPd/fLg/rqMzlOyFCvq1
 HdHUl5TGpgpC8NBD1KW7M1HA6Dkncq5sdtYgs2FEpX+I1MfpO9RGrPY3w8vkkN8ka2Vmuok1rNX
 TWVT0H8C16mGf2Qn0VQ==
X-Proofpoint-ORIG-GUID: G_uQdIqs3nUz3bC7qP6vXA9XB__PhRxn
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4cf0e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6racf7IOMx3K1H64_JMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: G_uQdIqs3nUz3bC7qP6vXA9XB__PhRxn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070087
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102089-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 677173AC0B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Similar to a6xx_recover(), check the GX power domain status before
accessing mmio in GX domain a8xx_recover().

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ccfccc45133fda53168d3475ebd3d543f10268af..9b99ec5ceeb5826fbd5cd1059febf5bc5ba468b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -886,17 +886,22 @@ void a8xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	if (hang_debug)
-		a8xx_dump(gpu);
-
 	/*
 	 * To handle recovery specific sequences during the rpm suspend we are
 	 * about to trigger
 	 */
 	a6xx_gpu->hung = true;
 
-	/* Halt SQE first */
-	gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
+		/*
+		 * Sometimes crashstate capture is skipped, so SQE should be
+		 * halted here again
+		 */
+		gpu_write(gpu, REG_A8XX_CP_SQE_CNTL, 3);
+
+		if (hang_debug)
+			a8xx_dump(gpu);
+	}
 
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 

-- 
2.34.1


