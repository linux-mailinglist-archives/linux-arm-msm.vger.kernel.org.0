Return-Path: <linux-arm-msm+bounces-97230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NhjGS/AsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F81272A3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 173E2303300A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA7F3CA4B1;
	Thu, 12 Mar 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8DWxPof";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fdw4fLuK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102F53C7DF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322192; cv=none; b=Zha2buRD/oY13Tjyy2JL6ytsP1CLW40/xxXDS8GTJRymt7bA/cPXkryyIk/bbi0h4JEMgxyBXTnbLtF/8tkwZ4EKmm8W/lRdlskVMzuL+DQx7OHOws3WrjYIJ4rZ3d55cx8WThKQqfdfQbYwpHqDHI4GQ3W6nkaOBEXhKqTBbHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322192; c=relaxed/simple;
	bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IY93NJ7cJnBAdD5WoL9LQjFp5BG/jBgydhrDzA9t5ClJZ+Rwyle+ugrGeboA5aHXXWvBsBUxxDkNemk4DNF02d4c63buImmeRN75Qf70CkgBJLTlN62qYXe8LC4kKhqy653oFdzbOuxtJu6IinA6F5sT0Bgh5H0qFmvZCYbN2mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8DWxPof; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fdw4fLuK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9Sput1756007
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=; b=G8DWxPofbQvKcwBj
	X8ziP8NOUFL2EPSBzGECGyJA5C2A8V9QzzBBk34NoYZJzGJ73EVbkeEnETLKYwfw
	t4kawe/EVs/ISUse+fG9kEVvA5b5Wcki6V5aG/A9xd5mFNtVfZZdsuWxNucrgkA4
	yDNoiIHa6gqYUbekyKxne16nuYCEutq3ALMmFDhh79Y814P5XFu3DH868SxxZ+AO
	3aCwPzDgZUREY0rW8iuKWkL+W06TX4aFCMRTiwC1MEnovIaqwCKcRa84Og90X+eE
	Z9Ec1rj3xsuKOEvxOKktdWKRHnvP40ogrffjsN1bZc1vfAq5K977/6vDc0dQCuuX
	eeeDzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53j6tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:29:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd39bso772258885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322189; x=1773926989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
        b=Fdw4fLuKSZpWBVD1gkfeSMjVcRkyOjxiGeftKtt3xeHJ00wY8U3fzn1yYplZXEOVe9
         OPLVseOKvnO6i7L27ou5mZV+Ocx4ZUh0J5r8mfJ0wg5vadKmCcHkj31XLQ411Zep2z9H
         qoxCQVImat4L8HvG/vCc2LqTR5UneSvRXMTGIlih1USPlADRqf2zpuHPFo1gdZpqyFIG
         DJRw0hXYUi48H1hijavGj1VJ/P1RMG1Foi9KnUhmgd2Q+i9AGLXb+we1+uuEgGopWVTB
         nuZVCXx409YCKcv7AGGVBKwDRvaqjEk/xJ16C6fzjnn19qQqTJYw/tVQkj1tpNPQu4t2
         nIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322189; x=1773926989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2imLQEZ3DP0uNNL0l/EieMjW7GOO6W8UDPQGg+15sw8=;
        b=ts2/92O0tkXsRkSMBWxiSw09ICmRDKSQpANocYx/OsDUdufvtVqW11++GnBoJMJGra
         7Q/uiKoNnjxxEe6oCcyC002A938B1Wl3Eo7mfj5Mh+aL2bIxWwHngeRw/C/kzdHVt2zu
         g33UAr6sj5eeOxmXMNTD7NwevgZKlFwIA7UzgQ5WA8je/G38ciDM8vhXCrPKjHG1WtcY
         RqHbSDvB/Cy20L57umqB/zwvgqJm/o2QW49qkkiSh48N3xeVddbNNiCmDNnyRnhoHASZ
         PmS/OORsEViNROM/2IvmgLCV3RlTjXj1D6qZS50c16n4RbH9wpRZLUv6DI2mw7ZRvieY
         nwzg==
X-Gm-Message-State: AOJu0YxjR9gruLUjaR9lFv9J6nmClakCIFuVy7MYsao8Pnxpyv8thuLu
	orkdG/N9dNx7lN3D8dq2wT+turjgryDEH/U2FkWwhHV5f5e6q2ctuHmXfgK5REjXou46mg272lo
	BhjpSydWJ3JsNV0YiXdHln2cY/0sTcYNOZmQHLORT2f9C3Zi7LQovn9JKza6aGugt7M3a
X-Gm-Gg: ATEYQzyi2z+J+JfVrnyyHov3wSmbem2Ed9ReT0YGtaYQSU7EspzIyjQZVDahkuybgwo
	FWP0465Lss/+jeiDVZbmV2//GoQw5c/0u+lYmK/cGsLIJoGn8QGBW+KTfP6rqmMxRxihZAmpzXt
	CbA6LSo9n+M7dJTwqHwX8+v6pr8FzImF4nRcw/ExeLC9gfWCDmbPsVDlA9ucjDm/NhzXWn6Lzpk
	enmFsFa/eDkzDAvsH4XnKgvg0IulrY2xyNyLaj4q5DYW0vDwA9c14ybfQP4iehkJ6GWUJByuDJh
	ZMmjXgoB+ZoOj1M8tI11kqZ38glLW49oaBRG4OULFzbjQCErZhBufLNvYedhg/HDNe0rv4+WAvt
	C5qipDIjUJ2gejH6XL+vNaK/SD8LOlGVfyzG+QWyKeDxLKT6+8YecO6pDb04Go40/oSc3phaXWv
	wQl5HUFlZL9mBLpOK4rh4+OMJHhfdrl81TOZ0=
X-Received: by 2002:a05:620a:2910:b0:8cd:8fb7:7b06 with SMTP id af79cd13be357-8cda1a1b56dmr765508185a.40.1773322189437;
        Thu, 12 Mar 2026 06:29:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2910:b0:8cd:8fb7:7b06 with SMTP id af79cd13be357-8cda1a1b56dmr765504285a.40.1773322188910;
        Thu, 12 Mar 2026 06:29:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:29:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:31 +0200
Subject: [PATCH v3 10/27] drm/msm/adreno: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-10-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2pmZHdByL6nsS8Ik/InzKdBxSCO/78Oop/N0tOJ6bIw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+2eMaAGaf5hR8bWwe1nteQfuL+tKx9L2Nug
 kEjft9zFQWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/tgAKCRCLPIo+Aiko
 1RTOB/95xo979UORIN1WeB/ydhhdUmlVwQ80hr4mwQnoZbXsiIotxewSmkof9/5oYQT9oKmhHPQ
 X9zxqcKN2GzszeNwCbyx0/KTzF5VxeKzjWLuMcAXw1bMl2DE6VHLpVsexk53BPpRdohqwYuPuua
 M4pCE8UHqbYJMsmxzuU1urOe54BFyzlsYPVx+aFlxgtrzbHhwhEh3g9CLNcLdwTCzEKYgZVJ1t/
 AhxI+pDmj8AntjBRvvsO6Taq13bHLo0L5nUn3fTtJPj8ZJ5afGpjVnNi/S4fRMgvU2z4x60Cyhv
 gd2vmfGbPNF3riQdk52pPfBT3gNGt3eWrtShZLBDHZ6ntLdO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b2bfce cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=8BxV0iZMnHvn5dZpj2MA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX55GichXYGOSd
 mExjHMglEuFJMDgoNt6DKCJjuJMXWeh5ZOX5P0IZkvBWQ4eYZIuGw35IJIPmrwcVcVipUiLqk6a
 S0rBM06jmqaNQwnwbC11NVErLz3GYYXBLcu194OooF1Na6ytgrnumQLHMv9Aj2eT/UEYKjt6hFP
 zZeFQSNR0v8w4NPOGdkUIvSIk4ZrsmwjGDe8FLTWNxs6T0TqyXlSkW8z1mu9Fa2JQ47Ha4DIJoD
 w3etjXjOhEZQRSVsUjnoIxg6G0vKKgv3LmNHWYdgPU41Xg/2iNU7lXH45GXuAhShNkyKLggb/Ge
 cdvLqJcz7ZMH6pOfxH1m1ZtpwbBBBR+mrN0383qnOY7376jKmxeLRtIgOjJT0QzHZCzw2F5Et1m
 eTNZ8rz5tFFQ0Y0r5jeYe1CKnak+0vC7O5GlIphZo4/7unMR20+SMZxLAV5AqR1wGO2lc3gz2Mk
 kcUf8S5Ij1lsN4O4ceA==
X-Proofpoint-GUID: 2JL62pcEKjfdxJ9eroDIVVxczvEAQjNS
X-Proofpoint-ORIG-GUID: 2JL62pcEKjfdxJ9eroDIVVxczvEAQjNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97230-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 43F81272A3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2027e479d5b1..56a820ffa613 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -787,7 +787,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  cfg->macrotile_mode);
+		  qcom_ubwc_macrotile_mode(cfg));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index d5fe6f6f0dec..4814233d8dba 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -435,7 +435,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		*value = adreno_gpu->ubwc_config->ubwc_swizzle;
 		return 0;
 	case MSM_PARAM_MACROTILE_MODE:
-		*value = adreno_gpu->ubwc_config->macrotile_mode;
+		*value = qcom_ubwc_macrotile_mode(adreno_gpu->ubwc_config);
 		return 0;
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;

-- 
2.47.3


