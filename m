Return-Path: <linux-arm-msm+bounces-96834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAroCRHhsGkuoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:27:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F725B8FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 078503244A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14342F616B;
	Wed, 11 Mar 2026 03:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktVzbtwt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+FIKlJ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C766D371889
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199425; cv=none; b=VBf+YEv1gtRY1tuO/W9D8WyeueSZl8m1SZzk8IEowOMWWrX5cBoiOWz9yIpy9CXSc7xHj/kYhHkcF6MdgaWXICJS8vI9YHqpgbsaKheMCZca3oiGyRHczgMk42Y1fFXz+LT75vtzDwyCIuyyY1JyFq8mWdlxPeWdrWJBNOD11Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199425; c=relaxed/simple;
	bh=Mo2e5asKPI5xpZsCjnNf0ROQpEF4U0WKdwGGP3IBoTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf8n0W9QkwUVB5L4Es+ILaEf24GjGzXSZu72nmgHgL8G6vA6MrWVq+HrbHyRBRcAwuYIIu8B016lJD/1tIGfygh0G+mmrxCnq1HXedju2rxz/iTi6zY6mvA9wdI1XAI4eMrG2HjOgtGI9SW5vFy0zA23gRPpdUTaDldZ4qCFqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktVzbtwt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+FIKlJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B3BNTV249197
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPjlYcDhTlo5kJobBmeD1ArJXAfI/y95Lr5sjDuhNbk=; b=ktVzbtwtF7q2sBan
	9EdHyU1rhjDMZlha42Z0+SV+I/VvkRH37rUhoOtfb0WO6J1FEq0dsuZrgkxtXReY
	UZV5dd2RGM534YCuKYcNtGnDGzh++gMVJt8m1kyqab0LbJItggR+Lx+1AH+6yaxb
	S/L9O7VEU9t5gSl2gUYK3IpM9hQfpO4BlUQ+3RKgz1tUMhOxZm226XKg41j7vFy1
	eKTueA+Lol4Di5lhe8obyjan0TX3aD9RVqzszIAvdkMv3omCDWXifaYckGlX+8UR
	yt6AkTDtG7qzo/RBx/tzPxXd9nyAtTGOf9DdW4AH4j+gOmxqYQ00wNekZXIBEeTn
	8lKeew==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv11nva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:39 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fb6622ca5dso12557129137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199419; x=1773804219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPjlYcDhTlo5kJobBmeD1ArJXAfI/y95Lr5sjDuhNbk=;
        b=R+FIKlJ9fOCEDbCoa9Uwv5NtGdtiCXpm9GVqeOzkZRlCrPjYmk8rYgsHiN4aVYbGlV
         Nxp29v1sYakPYQYeXp6KGvVULLK5FYADqZ20Zngpb0gxLZR1k574IVdv6Q26yphHX701
         y5LtIc+tZUWIqVsE5MLcRO0FlAxrLpVXjdg6BQuoTQ8QLPXb1zMxuC2HLYa9FNWwTXWH
         nTykD4Kgq99FB+0kXWoxg2CHIusF67oq9VTYmkqox6hrUvL042hDHQ77URJFjL2FH1YO
         CpPEUwlhMUp+bE4EvIIUDg6cM6EcHHlKf315FPp4lM04x95gSZmpw0z35Y0WSgEjE4v4
         Mjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199419; x=1773804219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPjlYcDhTlo5kJobBmeD1ArJXAfI/y95Lr5sjDuhNbk=;
        b=cwKt7kSFjJ1ER8vTXo+hdFkbBijtk/wtqyvcs+8GIZR0ASFFe4lsrTOQl76RL34LDH
         +arKDSEMP/pYvIsBAvpN4bpCHrOeNp8KqEJSzeQmYNq8f/UcXzCLkWEl/I/L0g6fdyJT
         X0vLNFcdouU4PnBgqke8nftFpeM0AzU7J44/8wue6ARij9gn49N9E651ke6a6pZdNfmx
         D2fFj4YYU0yKU8cGCsQmNPP/tBy+BfHAZ+3VP4VpzT9GxuvLSSsFImKLN+BPrV5zLeJU
         xXah2KtAcyOA1ZVX3EA+sTcYpSWrsXEuo+WjpWfb1uwW61IwxRZfn6NQXYk4tGdXjUYy
         L+aw==
X-Gm-Message-State: AOJu0YwXrwpYJ/dZuNahEzW7wki3dTenRvnlzIeFZcEb+XflYf/auYKd
	zmzkUEeDYsdul3B1cjLaFZ5NW1h8+v6gv22D5hTWZHyypvYTqtlm2lwhmRiy4o7U9fShxDNUNYy
	G5etFQOnRCy19VNtqWgwaHtl87mADu3+pIeu1LTYUiTu4W2c2szUtXtduYNaYARCfhqSj
X-Gm-Gg: ATEYQzwjTaauq1c784tGT2woitLyaQ97TfDllMrTtncGImFOGNiU2lBdE4wKJSSb3NB
	JCXxgyc4IC1iAXebYYWSjoFeQT1J65k4mx7Kyf7m77QDfjhOaT+Xj3dfVKoKIfQBeeZy13b4xyZ
	vjYy90+ibTYNejdswWanDbj2x4ZnyuOsGVGb9qmIK8GdJ/0NfH7Ne3ukgcvohpXl6v11GzHwmQx
	15E3jxPn+XdRTZgNTXFgGNBXMGxBxn3qG5ZI55/FcMTc3dfwQ7sjB/ajgCVydAN75DR4bLWMuDQ
	Z20BMWV78zLDosqEutYspAHPD1/4F+tUeyd/RArJs5YHxXB2PXv4qUNU9qs42/PrjCzzjZ+pocK
	r/hW/sxyWpVcVl1Ld4LJfhnyXLknPHWAw8jvpZQ6JiGYWPzN5wsKK/X2flbbTgd+vrgb2wpcnhb
	L6OgSCVpylZT6vnUQCeg2lp4KAECSyGJHGlCg=
X-Received: by 2002:a05:6102:dc8:b0:5ff:172c:2d96 with SMTP id ada2fe7eead31-601deb20514mr426639137.3.1773199419215;
        Tue, 10 Mar 2026 20:23:39 -0700 (PDT)
X-Received: by 2002:a05:6102:dc8:b0:5ff:172c:2d96 with SMTP id ada2fe7eead31-601deb20514mr426628137.3.1773199418778;
        Tue, 10 Mar 2026 20:23:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:02 +0200
Subject: [PATCH v2 08/25] drm/msm/mdss: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-8-69f718f2a1c9@oss.qualcomm.com>
References: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
In-Reply-To: <20260311-ubwc-rework-v2-0-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mo2e5asKPI5xpZsCjnNf0ROQpEF4U0WKdwGGP3IBoTc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAe5uYcfbPSgL2H//BPLqal0DXFxZ43VPoW5
 a8Tb4BB9rOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHgAKCRCLPIo+Aiko
 1XCcCACKtqmULG8LMHRj/2pUtR2naMjTqEtRo0nHjZ21AchJ5RiEStTNpjUq4XT8Cq8JBxhmbnz
 EifCb6Zt+K4E+rFIGvAInS1QYyNu/tSRULdkMPBWPD/mwjHScGAasPBcgPQ2wkBy6xUpvO16dch
 HRebfaYz4AFZWxnQ8OkTOyDiZTzYnoKDNSbp90ssQXzl2dF2/Lp0XNTJpXtYk7Qw9D4CK+vSHlt
 bWZQqwZPoQCVKRXt7RnLcwWL0aqU7PVGgF2cE7gfKu2mdew7XmDzUt11b5O3LOCieGpMgH7Buzp
 YQ3W1CJPvxx9OvCM9fCqL5zzMy2Jb/tajk8cQaDk3R9DwNw+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfX7uhVIDW6oQFE
 emsGmuuTmXh3NG2s1P0jOZsMTE+xAqq11WZkEXIJEIS56+29yfeyKq4Bn4ATF4ORMtOUvrlassT
 Dn23K8psYvBAD0zUD4mX039rOr1rOjgQZ5obMxux9DQWdBorclgCsKyZRF/kHP6P4zjAFhFjOL8
 LaqIqb5O6lrAzpAzDedhczcSJh5QZbrtLG8pft7ZHlIt8aGL65U2Ph7gAketJ7oPO1vudutR6Mu
 9DCLGsZ/Dhl83WFKO08y9PAwYHf6yQ1V3fGOMwFORazC5MIh3/cXeqMZUuCHuLTWL027X4U/Vcf
 NbHL3eCBWEyZXVfmLQdrR21XrJQQ4l3QNuvGZ44ARUdZwiokMSB2yJhjVJqldUOZ5RKfzEnQiTg
 SrEhM4aVv9MvupHJ/z/EawF1iX35tWAXzfI0A5Gii7kt8EoIjM8SM3UxK8kDos5hEpbOWu9Y1XL
 jd89j0sNQHoOX3Xrn4w==
X-Proofpoint-GUID: 8M5rchO2KAr0HJ9dg1c9a34GxVLwQQZL
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b0e03b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pH-95HYbptEkGMIaxFMA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 8M5rchO2KAr0HJ9dg1c9a34GxVLwQQZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110026
X-Rspamd-Queue-Id: 806F725B8FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96834-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 497db0ce28bd..49ad1a9bac23 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -172,8 +172,7 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3


