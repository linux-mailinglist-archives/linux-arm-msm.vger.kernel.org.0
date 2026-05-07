Return-Path: <linux-arm-msm+bounces-106373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPIMJ66P/GlhRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 985974E8FC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 71E9B3055789
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032A440B6EB;
	Thu,  7 May 2026 13:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+xa7thf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvJnVwZR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F82C3FA5C5
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159042; cv=none; b=kigrieQ5pMc7NCxBmyGvXs4xHlJSjFbqsA9WJBPKIJPGHRl6YFmWbK5NEKFzCvHeNu4GbN1Wee9/E8FUW7q/oOQWDQ5o2fA/AR/uzpkZ8dv2cmNE01ErIWb6U7XU+fGKsbAZm7CsvQYv8ZoP5uwFRb4L3dAn7L8JCndF7juXXSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159042; c=relaxed/simple;
	bh=Ibw1W4RxXxm+xTq1o2582iDKALgKQbHejlJobaatd7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HCbi4dGQ9SsnjrP3hpbzkjYG7RvhiNwbKbjyk73LyLsUFZKcqZsgGKhiVVXppsba3aWlSiDhUFQTaoloAZB9LOnPZ3SpCcF8GSpMxxfDu6U6exzDUEDv+hW3hjsuDrGXYtSnk6Or8pVnLV9oD5w06CzMy3sWyyecH+iHEynzjB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+xa7thf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvJnVwZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BxUxr2734045
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nOhtk+T5Qeojg+oP0GMyR2EynxX1OfJWaHf6gSAwPPA=; b=o+xa7thf4YlEoVfX
	+SQQS25mphW2NL5GBsNLBD8jki8Zu22zEm8mtCw/JnyIraP7EOUbyyd9tTGO1rOf
	I0lQAOsk3IQ/YLO9pnp4NTtuLDGs9+a4tUJPG0jF4cGW8fltwsbyo5iPLwflXPw5
	ZPVAn6zilGWwMdSi/XlTQIGiXP9pYMK2s8AhnFLcN9r9yuJLvUvLpHNUm/UDU9Eo
	XqHL39xztDfA0migHqRcJ2CrFuO/yqL3ah3pS2qEZfYVRJu6AQwOJTWbI+g5Ps8S
	c+O+A9sJPJLhxSHExZSiAiZbkJ93oPAsFqA5VBxoFj04GHU8EpQNA1m75jc6bGQe
	/clbog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr72g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:04:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so11184065ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159040; x=1778763840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOhtk+T5Qeojg+oP0GMyR2EynxX1OfJWaHf6gSAwPPA=;
        b=OvJnVwZRaooI5tRzFa3VlB6WLRmdHs7LGH4UG4UYX1ahw5TY/YTJV4MSsfcWK/N3TX
         MZunNuINXq8PFjzUXiL1Xr0XvuH2MbkKB8i5CV2fR4XbWW8ETY3E262Gih7BCs4KlYZp
         +nYOI4wiXhqOmG3TG/NtulJkqdZ6q3wL8PD0zgsYrlv30+uRZpNZv+Rh6lOwDENDylFz
         QeErodnFZxO59D0H3SRW9VuoUsi7Dpd7qVESOyXa1p8DtBL2fXmwdCUzdGUq1cY6mIzs
         DxrNrt681yNSqDdeqavONlGX0Klrx8CYpWQQn/a0r/2oab33tKZQEgstgP61JvZurXS+
         i79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159040; x=1778763840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOhtk+T5Qeojg+oP0GMyR2EynxX1OfJWaHf6gSAwPPA=;
        b=hNRyzDnQfGWDjUQFJToVIZgep0FGmyVMcL3UeWMxagIw4hkuoGKqQDtz2LGHJs1yau
         WhhShOQFrhvWMUb0cgEaWGnQ/sMvF6JxvxU3+QUk1l6zDeoHgprR4YSOKXmlJ6t29dzF
         uenyM+qLtLXiuc6HoedJ5pnjG5hCgNREJae9O95L1RbUaqY/7vmCMXFAnOzdL9IQ9qbs
         pOyMHssVArJYDYUNHmf226pILqKltZVkR5IkN+tvZP+NRVw7TnDWjLalnRyaTX2YYRbu
         ft3I9jY2saRKaf30LOg9igLj5bRD+wSrtxQv2yRuXpeS4pkzums3kKRJwCeMOEE+8qqF
         92dg==
X-Gm-Message-State: AOJu0YyFwbJoiPZFsqV7GrPrNrVIvaH/2NKxGquCBJyvm8dqIVQewxRi
	Vq9nv8xyiM2Vgmitj24q0oUknw0aiG4FV4u/9IiTmFv8fyyd5pKXu3PmVcXqxrSZytbYEGuEMzW
	lR0GZ8WQK51Vf3tRd+T79pLgCweW9SNg5AlzonUSFFhRXvr55Vb0LTbMocWxLccjh1XEb
X-Gm-Gg: AeBDietMYUE28+gdgLpoagb0kFFLeosfOQez40ydEhq5wISBa/pFwgO8qxIC1tqjzLX
	OJEdCgztrc5aA90Z5QovfJP92L4tz7MDgVftPbczot0qPrgMAtw/KSMVoOod0bLhnVTg5u1DytL
	CZY/tkK+8eh1dGrWvjeDc8COcmcC2m5lhp6TbMKKwZvvz/UnmVO31TLRV5ajHcEw+uSKzTHcXo5
	zr49vx+VNrpIDvB6pgbRIAMv8VWo0sjY/pXSrTdkD0d8wvCY/3HKDqd1fRIbxJ6mFh++v/ea41t
	mzLfbcw6DJDn+jLEh5yXzypEjyYBtqgqclSIqT52Nj/9wWhpWGb7bIzCnQtFR40qtRbdlnAN2Zu
	/BPF5vD2PH9EYsCLQ3BlRw9S0xf5eW5N+Ze2M9n7PbhDbr71HVdEvrEZWxJa7tb9CWAhLfORliw
	S8GlyMWJoaks7vAMkbAa5XZgIH4dta8Vpwryt0RjnKCBoZpWVv8TIng4qe
X-Received: by 2002:a17:903:151:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2ba78b48767mr57604355ad.4.1778159040325;
        Thu, 07 May 2026 06:04:00 -0700 (PDT)
X-Received: by 2002:a17:903:151:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2ba78b48767mr57603755ad.4.1778159039654;
        Thu, 07 May 2026 06:03:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:14 +0300
Subject: [PATCH v4 18/29] drm/msm/adreno: use new helper to set amsbc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-18-c19593d20c1d@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2249;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ibw1W4RxXxm+xTq1o2582iDKALgKQbHejlJobaatd7Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2GdeQsVex3N6owpP2pA9FewFltQW5GK42rB
 dz4tBHATp+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhgAKCRCLPIo+Aiko
 1XWQCACgehnNB4GH/t78ejQi5pMD6T9QCqnBPc224Zs2w6wxkll2e1PSz4Rdl2BakSN0BD9lbqf
 lgatMMprwMfSfuMAHEjUflF60smTphqMqTp//8m8CaKjfsiLK6z8hrlwIO8dALiXOeJrOOSO/eH
 OqQva/bU3OVvAAp/MkwHMGGPVz7kcyFmlboECTg69GuP+SBeRp6voRakIdNEHqvOKpY29e9d2nj
 tAyZCO99prTbo6i1xDBmfl8MQfriIkd0hSXc3Se2X3lCjiz+XHH3R3/nfP3uQCXEaakffdpYa5v
 lkT3rZL++8OZBZQMyqeaFKeTnTHZ0IpdSmI5McMAbxSdfwGf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: OFaOm0GxiGwkpHXeIOxtYc5BUmOCOWlA
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8dc1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=ZxXxw7YCAI2S9HbMwnMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OFaOm0GxiGwkpHXeIOxtYc5BUmOCOWlA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX/dyAGsGLOgkj
 kVKuWAf/+0FabJLVQmVY4o0SMM27k7TywvnoRzbYIV1Dqes6HvBdrNLUhtkZ/YTEzUg4/npZ54q
 Az6m3rCDeTn2ddSiACgFlzwnE0zNtx9C2vmr9mBOGCYOuTPmI6FoNYSIaFcAWOOtblr/ss3Wwr6
 zrAd/vCe9kNvXFdOWjQc6eXZHoshdwgFe+2WieBT/rBBKtRV5IvYBxwr6+QTEjl6Sv1ugopOS9w
 w/HHwXstCdbC11+qIzsXv/5aELDYlhir1F/j+KwMCvjWBwSALNngFxDWzeT/HpYSMSWxVpK3poU
 5njjOSTUHw0oq5c6DvBXDC5R4vRDOgVFAHQhMMuOvtLvZStfUY5Sn8Ul5zIa3LjddDGn2Z5gh5r
 y2psj/l9lhB7ZKBGE9bV3zcg4u99zGv1auroHB0KKOKvxdySnl/G7BL0pb8MSUIXq+Maon/qdbp
 1pdN/gXb6xkXzgHg5KQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 985974E8FC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106373-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

Use freshly defined helper instead of checking the UBWC version
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5c17565b0499..a88489bdad9a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -747,7 +747,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	bool rgb565_predicator = cfg->ubwc_enc_version >= UBWC_4_0;
 	u32 level2_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL2);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
-	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
 	bool min_acc_len_64b;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 867c7d05f670..5c73a9ebb22b 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -279,7 +279,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level3_swizzling_dis = !(qcom_ubwc_swizzle(cfg) & UBWC_SWIZZLE_ENABLE_LVL3);
 	bool rgba8888_lossless = false, fp16compoptdis = false;
 	bool yuvnotcomptofc = false, min_acc_len_64b = false;
-	bool rgb565_predicator = false, amsbc = false;
+	bool rgb565_predicator = false;
+	bool amsbc = qcom_ubwc_enable_amsbc(cfg);
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	u32 ubwc_version = cfg->ubwc_enc_version;
 	u32 hbb, hbb_hi, hbb_lo, mode;
@@ -288,21 +289,17 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
-		amsbc = true;
 		rgb565_predicator = true;
 		break;
 	case UBWC_5_0:
-		amsbc = true;
 		rgb565_predicator = true;
 		break;
 	case UBWC_4_0:
-		amsbc = true;
 		rgb565_predicator = true;
 		fp16compoptdis = true;
 		rgba8888_lossless = true;
 		break;
 	case UBWC_3_0:
-		amsbc = true;
 		fp16compoptdis = true;
 		break;
 	default:

-- 
2.47.3


