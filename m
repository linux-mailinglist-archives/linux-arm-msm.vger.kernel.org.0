Return-Path: <linux-arm-msm+bounces-108810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHleKGzVDWrW3wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:38:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0605910FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 846F630BA5B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FC63FB7FC;
	Wed, 20 May 2026 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmEo6olU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBdOrHl6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF13FA5FC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288725; cv=none; b=FDS/MGS5zMSA+gBv59l72lqHwGNG+gah9+k9zgkTvnAEPCUK2xbfWOL3TJtOGyvbglpHxa+eRqp5TjnnxQLBz8Y/wN2wklKT6QJ0cGCgb4AYx4kBg2ZzsYsoA5r43tDOTFFVl8Kh3EH3HYI+mnQ8DXFRzHQof2/zfIXiu2FwyHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288725; c=relaxed/simple;
	bh=ELfSfo30Xq2szDKMHs49lszh5EmDwoOzMcxayrSn7iI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2A85nfFwH+MCBDCnHcZ1pqxM0V0N0mZFsOWyBwJbS5FWYfprymokaE13ITKeqMDgw49RxssKXZs2S/QmMVqHAjcSy2Y7yOCjKPKJBTMqWNhIDRlVwjrCGlnfxWNfmPCbtkBasU+iR2jl47R7SJep9mcj+sToQc+V9DOUtmgyUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fmEo6olU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBdOrHl6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2Mm5826554
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pPTtabF6OA9v/5Dtpi3YOgqhDzAT72mJRYat9rS4JA=; b=fmEo6olUMDysvtwI
	cCrt8wUhd+GQgkDWk7f6yAUEhUNoESb/anppSzypW9MVC1Z2w6WC9YkTTrhQvUl2
	wrEWtBck0x6xOY+unNEl3NEbvzTJyljSNI/WM1DzaPk47a+mvYOzsWB3F6YE1hxc
	7/TTGeq71YgZwoiciIH0CCDB9h12wv15j//S6CSZdLcZtvlZ01tnDDZpHKcGGUzZ
	8Ns7Bs6vzpDV3qOzo+nhdFOgkZepuOuwTNnXyqDMAFmp1GWr0QrJ/+dkU6rfua/K
	0d0sjvkZe+rAVGpVqdVLbuP6IMNNL91rfuGBspnbdjrFBgfyvzQf8zuV7+yVlpgs
	XZJzzw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecag6hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:52:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6374098885eso8758263137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288722; x=1779893522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pPTtabF6OA9v/5Dtpi3YOgqhDzAT72mJRYat9rS4JA=;
        b=kBdOrHl6wOkgkxRQl2HdOq5R95ejIfdmX08/vek18InfDV2godbGbD9O8SBKd+qJ1q
         e6//vcIUf1lvQY0yZ7xdSyuwUoqVFBcHwthqLF5v6a1AyUkSFJaApoxrJ6PCDwXbRJgA
         wkh5NzTpd1kjsKFPUuxQ7EMvtwWlZ2Q6M6SBkuVx5w6RO3f5k2DcHBf494qfkBYrax5g
         2NDPJ3ic6b+iQhiwlhLaPj3/TlI87FR5SObWcaVv/I76CuY9maDMwDJ+M8xyIFSJOrDQ
         iG/Cmc3wo6tNTqCurV48G3xdPAipXiO+csnUW743gU5ztgb8g5ou0J3TMF6i5GI9fALa
         B1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288722; x=1779893522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pPTtabF6OA9v/5Dtpi3YOgqhDzAT72mJRYat9rS4JA=;
        b=qQgtZSpaP6+E20CO0Tl6zeRMosX0LeTGAlO3n16h3YtatIN82YxBTYFNNRBIJufALN
         3os3QrWSp51dPviuhEr+GVucLs4q+z2yo7czFRflDHxRUIt8ebjFrakD9pKgKEZrUi2F
         ZTKYjgKGsFolUMp3QE6S4V+5fC+oYqqC01Wtnu94C1B55tM1LTer5TLrF6RBgDpm3ids
         rv5U+kgXoBYYZ1mnHHOreeaQQBThMNn2ZNMnZG4cjFBe4E++6RDNIT1sPFqn7m0x+2nF
         nX7n4yBMUMd8ahl0+v1uzpj8qZDXib33uz1SzQfk7+d4QKFIS3dvcueSkSbKoVWzvEyP
         2Guw==
X-Gm-Message-State: AOJu0YyRY8dFFUN/M1TkMM+J4hw+Pu71WxSUVqedA2HcrrpLUo3vRgBZ
	z406I+WFFzCtTk3dGTJTK5q1ITPzqsjsa8VFYwYSQn5r1sMj3ZapNuNNmQASIsOt1J0erUYGsn5
	xYjCkjkDrRzMnn07UWPnte9z40zA0HyUTRfk/K5z7bocJioj6QTlBIS6I7ESlHgTYFARG
X-Gm-Gg: Acq92OHc8irjX3y5HqUfef6wg2vavpHrBp6R3QY4ctVwB+qbZt7/jOm6oka7mFZwjep
	8UBd262YWvEYh166t6UbCcXvIDtOCa3Ocqic6WnL7Ys1ddiQ5wsPVy9fhYszznnsM+fC6oX91ay
	nv1eTPeFxdoPQTkRD2+u/PmWFshEHUEL3b1GE/fsTkAoOI2e2GLGr74rkHdj9lvStbPaGbJOJ1l
	BiyHCCt0L8bbPhhfo2EKxzw6Q1grU+x3Eca1hMzmyDsXT/+HuBgKu8Xxq15sAuoXvnYsYEC6qMc
	+pniQ2XkArJbFcD7A47iiXaFBQQ47oOVow2uEyyHRbJuKpvw53UjMyirLXsQ7kj2olJJPuQH6rN
	4Nz2UXWFuqIGXIsc4Bvh8jsZcQ++OChPWYm/5x73qrMdu5AgdovS9liuE6EuXYQwlqfXrXpe1Ml
	64h7Tvjp4z2yRoPCuUrJ9m6RmXNnxnddG9yio=
X-Received: by 2002:a05:6102:808e:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-63a3f28c288mr14430973137.21.1779288722314;
        Wed, 20 May 2026 07:52:02 -0700 (PDT)
X-Received: by 2002:a05:6102:808e:b0:631:4e9a:ba3 with SMTP id ada2fe7eead31-63a3f28c288mr14430935137.21.1779288721797;
        Wed, 20 May 2026 07:52:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:52:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:31 +0300
Subject: [PATCH v5 24/28] soc: qcom: ubwc: drop ubwc_bank_spread
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-24-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5607;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ELfSfo30Xq2szDKMHs49lszh5EmDwoOzMcxayrSn7iI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDcpp4I7RvK2HILsybRcgfmEkL+/9WfJirTkYA
 jDZw6s3r+WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCag3KaQAKCRCLPIo+Aiko
 1ZJtB/4lsnTD7zdhZblkKl3eH/4SO3fLhhOuwa4VE2DtFikTLo1feLEogub0Xnbt7lFGtEF2rnU
 ykylJ7mH7bAfx+pxxBKKLKZNUUtlOcALJUQNoxjBl0vVv9eBn7z5opObMqTIxHwpV1o+7FS24+E
 FXiZJbcNJecaCNnQ0Gx0za3x4RqGSrJHHTkPCyJ4ScJdGthN+hU4nNiqZjuDF1NuIM8Ugyvlx4J
 UcCdw6sBFejsMj9X6fsPTrCfaBc4aXE7tgPEDngnGeTPX3AVuak3VcXQlro2twryZVLFxwPNXZY
 ed1JltJJfETWGoRF97wvd0bg15A0pKvuBdE/Y/BJNao25Mbo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: iE_R4IpQlmrwfo3XmFRmxtzksUBNTKKV
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0dca93 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VGmcmSc_WkMUHOMtpCQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX0xJWs65v7jKd
 4HThFpxSYud/1lgzWTaw5qShtHQZG5ZlOEJb9gUao6GSLxUhgpFyBszXF1D6S1kuwa3SKyiJxfx
 Wkfgw60L/ZGkPrHsdKOdxN+KccobC48RR8W5RYinkuk+q2GLwLR/aWCG54kw/AZNC95ZlUaxHod
 0hIc426yKSnTAaUo0JT5+UyyyZKz152yhr/amzd6UnX3DcXE8HKAiA0DVR2c3AT4SFWwBIB2Bi4
 rk2FpcD0pIzygEi8zQe4ahzQ223V9zJxO1DvF/fNkTkdzMl+MBLLVB4nR9lzBSWGEIhYHKfSZ4z
 qDD+Xl1nKbGLPdNLiE/tXZSlIwXIqi96iraJlwaT/MwLzeqeVse3EVtR46WHkvRMQ6AC7NjMp2j
 jlR18gDR5wmiBUCfmVvZC/smcUErNZ1B710lEitoqk1B4mJnNhfHSpuedhLYupELv9v/WEdAnEU
 ITSC2rHgUiM8kSGN7xw==
X-Proofpoint-ORIG-GUID: iE_R4IpQlmrwfo3XmFRmxtzksUBNTKKV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108810-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE0605910FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

According to the documentation, UBWC bank spreading should be enabled
for all targets. It's just not all targets have separate bit to control
it. Drop the bit from the database and make the helper always return
true. If we need to change it later, the helper can be adjusted
according to the programming guides.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 14 --------------
 include/linux/soc/qcom/ubwc.h  |  3 +--
 2 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1344cda0fb75..35cde4e9a238 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -20,7 +20,6 @@ static const struct qcom_ubwc_cfg_data eliza_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
 	.highest_bank_bit = 15,
 	.macrotile_mode = true,
@@ -30,7 +29,6 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -59,7 +57,6 @@ static const struct qcom_ubwc_cfg_data qcm2290_data = {
 static const struct qcom_ubwc_cfg_data sa8775p_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -68,7 +65,6 @@ static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 13,
 	.macrotile_mode = true,
 };
@@ -77,7 +73,6 @@ static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -85,7 +80,6 @@ static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 	.macrotile_mode = true,
 };
@@ -102,7 +96,6 @@ static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
 };
@@ -126,7 +119,6 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
 			UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -149,7 +141,6 @@ static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	.highest_bank_bit = 14,
 };
 
@@ -171,7 +162,6 @@ static const struct qcom_ubwc_cfg_data sm8250_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -181,7 +171,6 @@ static const struct qcom_ubwc_cfg_data sm8350_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -191,7 +180,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
 			UBWC_SWIZZLE_ENABLE_LVL3,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -200,7 +188,6 @@ static const struct qcom_ubwc_cfg_data sm8550_data = {
 static const struct qcom_ubwc_cfg_data sm8750_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 6,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
@@ -209,7 +196,6 @@ static const struct qcom_ubwc_cfg_data sm8750_data = {
 static const struct qcom_ubwc_cfg_data glymur_data = {
 	.ubwc_enc_version = UBWC_5_0,
 	.ubwc_swizzle = 0,
-	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
 	.highest_bank_bit = 16,
 	.macrotile_mode = true,
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index c3f9efae5db8..254721f5ea3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -33,7 +33,6 @@ struct qcom_ubwc_cfg_data {
 	 * DDR bank.  This should ideally use DRAM type detection.
 	 */
 	int highest_bank_bit;
-	bool ubwc_bank_spread;
 
 	/**
 	 * @macrotile_mode: Macrotile Mode
@@ -85,7 +84,7 @@ static inline bool qcom_ubwc_macrotile_mode(const struct qcom_ubwc_cfg_data *cfg
 
 static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 {
-	return cfg->ubwc_bank_spread;
+	return true;
 }
 
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)

-- 
2.47.3


