Return-Path: <linux-arm-msm+bounces-106365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGAnNVaO/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:06:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 945B94E8E20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC0DB30144C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BE23FBEDF;
	Thu,  7 May 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hfd3Aypl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVc+2Xtp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EC03FB7EA
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159020; cv=none; b=fX3779XUc8j413Qjx+6o3Zl4Ip4LA95B48NgTvK2X3cjK9Oet9SgY0PSE5NEwTls7/nTbXrWSm0RVX8mbatckBe+tk8FVQOHrhSYH8pFIwSpu3kGhSffebJnsJTzwIZ+5HLfWzmP8+W/JXWkKqpPr5HaJDXmq1YqklZLOsbvaXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159020; c=relaxed/simple;
	bh=c1cCr4HKFXH740TdXo8Awqf1bvuZNKoQdiwEy4u3ZaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbimzb4Rr01d9t9QRFAtA7Q+HnQ0jBAY54S0hvokBojyYlQT1jntfxcEVbBp0N+V6W3L+Hc8Z9155ii2FX7IZZzrEA5TMco4/Dw5FlMbioUDHgnySMtGcVnZb0LoLrzomzZg1PY901iJWcxoBSgu6G61Prp65ORiWTeYneIKHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hfd3Aypl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVc+2Xtp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AFx4O151147
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRxPggAxhmeUOtwPDQu0n6LredQeEbGzVxBFYRERYIc=; b=Hfd3AyplOqxpf1O6
	pt/A4xic84I7hHNXuVeSYTzQe7sOXnMgZ2qN5NP7/uaqyKwHliS3dbC4fopMw4k8
	9hreuWcgNzREW0p3vjMDrp2FSeJcpNCwn1iZT+U1aP3r8fcv+X4YN9nw/wuemR5x
	c26WLa208J/Dt1bzfJ4mUUg7yUHuqPGZ019ZL2cwAm5e23rh6migYn+6SKKddZ6B
	qh1NRQBJWp4BL5HYxAaunFIfEsg9WOEqeXgWyL49XvRy0Fyw+3LlMOvR8o2XJ1Vp
	p6AhZZq9IaGA8PpX6/OdCOFQ0F4M5l6/oNkwzw5jLTUttYTCr8uIkQvfNlAqB2bu
	19EDFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctsvxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so11174305ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159017; x=1778763817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRxPggAxhmeUOtwPDQu0n6LredQeEbGzVxBFYRERYIc=;
        b=cVc+2XtprqEb1tjrdV73lB43NNR2FwvrzdtS1ibW2bF6PV8Zt2OuOYIL0oHQGSktN4
         sT47Qn790srAwXi7IhJverVu97WZLaTk6Uh+OhyvggCMe9P1KMo8VNRAD5b00KPGWNbr
         vyU1tRGsXKWQj6/GkS0wWkTUM1qD8rdoADZOqUfNAEW/yb39cj1Hyh1h/XFJWL1QCQHf
         Tc7jFJu5HosA3Yquq+13euo5beDudSTxpqWAeghksE+4kpgT/SGt6Gh+MdAa1e99dfkV
         2WQl9Y7n/WIkjhqipycYR+u6m0xA0Y92de/5/lbUDPD66b+RnzvLcPv+AeJHmdb5YpWL
         vpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159017; x=1778763817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRxPggAxhmeUOtwPDQu0n6LredQeEbGzVxBFYRERYIc=;
        b=H/yPOb9cJBJa3Nzigf8bArpKST5h0trG8ZCd/BVuBgIGSkS8NAejm7KLUdf+wxtYW3
         ve755VUXFWc9jLA7l5tIeNalIERMpAZsoPxNOVbiv+xAykueFfS0pI0PZkXwiQbWS3ob
         UKbKmxL9NoEqGncgVcDUO1/woQn+M7mBHU0BL3hD0YA3jPuXIzelQ+1QEiBRg1WlFmnv
         uYviBYqB4qInaTCJ1DIygFP4k5W6BBvc86bmlDC11+bTYutxY2a+l4HcUHVRu/5Rznge
         EcdwzJwZG6DhbkANktvw+09F+5WzYKwW7YBZSQ5Kl30z0OMfaU6ePYCL0qXzFGWutjXa
         V2Kw==
X-Gm-Message-State: AOJu0Yw6/bJsr84tZ7PEJanAa/GcsWvyP8ZlZaFhm6HB9OuBk5XyY1A4
	osJlKdeWsOYP9x2u5uXMjiY4QFcAhBnVogBceSLU4HVDRw+honZjQeW6aXrixjKG+i3S+NfBWLx
	jV7seucvqtf08EQVeV3Pq9A/J1YTTwDI+JqDNXLXB2wr3190mue7SqYT+FJV5ifD0KjQ4
X-Gm-Gg: AeBDietbqTc+b5AdOB1X6K4Mm9Kwu/G0nnXN+9UZKnjAr9lxD4m2bPU4y/P12krfBz1
	xNZF/kVUimT86JW/w/zJagbnIX//rCo/8TFR42ThN05y+fjIR7yhBC9QpkKLhpgf3tS8dkm/g4r
	oorZZqscbAZfl4qVLuJGsM/eQdpXfSdPQlP/Q3Sgi1qotP0dZtuzmYTbFrDIImqi6jFe7NI0AgH
	eemAzlgDGv8E2Nfxlm76HFw66ycfXuLdhg/HRRcrD6nhSjLW+CG44/ab4XS1l7xdAX1G/NkKgal
	wTPdXb2Xe/hi3n1+rH5XJD/O8zMn05a0/R7MyHkeqpVFEFByIWi/I6nyeBkZZ7aUQ8YHcF6S7Le
	H9+ljyv8OXLFIFAjNEc+0pRrJUmwMf6VOF3eWASYDxtZ+vJqDYmFy8icuqFCelLzX0i9ne04/1J
	VVmccXhnlXUgnb7LL74iSql+F/XSXguzfewV/I72xTnC8CFA==
X-Received: by 2002:a17:902:cec8:b0:2b5:ef7f:a47b with SMTP id d9443c01a7336-2ba794b7182mr81696465ad.21.1778159016781;
        Thu, 07 May 2026 06:03:36 -0700 (PDT)
X-Received: by 2002:a17:902:cec8:b0:2b5:ef7f:a47b with SMTP id d9443c01a7336-2ba794b7182mr81695595ad.21.1778159015915;
        Thu, 07 May 2026 06:03:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:06 +0300
Subject: [PATCH v4 10/29] drm/msm/adreno: use new helper to set
 macrotile_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-10-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=c1cCr4HKFXH740TdXo8Awqf1bvuZNKoQdiwEy4u3ZaE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2FAtOQQGHPCnd1jqarD8Ij7km1H1j8RLXpO
 UMff3OT1oWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhQAKCRCLPIo+Aiko
 1ZVGB/45u1nMr5GHedlGzeF8o4xph7Gamk5/dijvOiVYTd3HbJfEQIOWzmKep659zT411oY6GoG
 r7s258/K49+Q9tysIud4POpc8GlQ0U0ox4WpNNAE0Qe1lpkcswSP11ccggQrkMeuDSW4nkws0FX
 ogufqZ7XBKT6nQgF4JJLqn9SSK5dRy3GKyAKbP8PYWi0bNkwckeA3HFtyPhULq6LxeK0Lb0NFfH
 Y5b7W7b4w3EAcH2EA0nv47rJtIUahZKXHPihttdvxP/FlH5SBVILFp92iLQDN9YNQVX3GyLz1CS
 WE+UOWMaS1PG4sqmNh9OExRBu1F4i161dox4/aVGNjwfjf0b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc8da9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=8BxV0iZMnHvn5dZpj2MA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Cv8ft3QVXWMjWsvuRFXXH5nxC8-4P7IE
X-Proofpoint-ORIG-GUID: Cv8ft3QVXWMjWsvuRFXXH5nxC8-4P7IE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX2CSb3DT8f4lP
 lwesf+ADdIOGxY2PgdVUsL/uUBS0LQ4igjPA2HNeTrYO1BgNfuwMUYOX6z1Hi/aznowPaoMe/D9
 NJujMOQell4vrrLCqX3Pj5BdBu+/urhXrPb6Yt9ThH4ApiiOwOlEyjaTA91hV7h4mtrhptJST8g
 G2f6lKHdc+r3sbkqp6pHFsCg5rcveVS1Y+Src0jlSrn917d/z8F8WlRFlLT2kSXMJlfKHAJ/g/Z
 /FktpBemys/qd5XFG1G5Sl3JqbbgcvYHkqjhSLD+kPvzUrPWssZvI9WwDe2zke5zRy1CPquOxdr
 0ag2/pbnAz3mb3ZWvAHUumH5Pus/tB6o420iImupyyf/bWU7rZHq3iWx2XTwQKYu51hPdBy0B5Y
 FcDJBXcVmuqjXFwgyALlj3Z5wTs+/tN50A4+/Tf2udX7N9a7r/pzS3vggtfCC+la6fXB1ZO03y1
 1A+zAeepARusRwEmSNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070130
X-Rspamd-Queue-Id: 945B94E8E20
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106365-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of using the raw value from the
database.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 812bb95e8011..76c681614416 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -791,7 +791,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  cfg->macrotile_mode);
+		  qcom_ubwc_macrotile_mode(cfg));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 66f80f2d12f9..bf1572156b0b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -433,7 +433,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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


