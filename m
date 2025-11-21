Return-Path: <linux-arm-msm+bounces-82887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 646AFC7ACEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9AD304F178E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 16:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5236634F47C;
	Fri, 21 Nov 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkiyalIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YzAIAoox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335DC34E763
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741646; cv=none; b=CwK1eJFtTSh4ySdNle2jcBsnuZGxCA9CQpv7XB/YvFPLYt184MZLzN+aNONWwbWlwA6GK0xcoJ3/ep7AiZe2AT/Q+pg284fsRu94PEsfF+vg6BGj0Es3ABKmvHby9IQVAWpFaFDvplzswBzHmbYGA0cACkbgiwKf+8/8eYjw+5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741646; c=relaxed/simple;
	bh=4mjjExWwAmG8isEitOAb68AjLdD1g2ziYxcCmOY4EAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQoEqmZdeqKUTCgTK5WdWOJFNKNL12/NkGXkphjvAg89rHj3OzjwBgf4AZpV8l9uIxwEH16AXj4CVVpc67vuLggeaUWj8sougyZ+aJ8tE1NIAH1oMeW+EHp/V5isR61omFrd4TLvfHSjRxDTAdeilEQscwLuJfa0J47jUKAeZVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkiyalIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YzAIAoox; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALBadbx2841299
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=; b=SkiyalIQG+hp6ImX
	fwpl1meDno6UhtCuASPEZImZA2kBEoGJGLZXcnE4/489oH5LbbOpB3cz/XO9zU+h
	2i06C8SJSzkSsmDaFi1AkpfPq6BOTsDdkIZ8xfmWdXUUlYMEGwdm/Mvr0LGIblbU
	b6Ym+PVh2qvB2/QpxUcKA9WDncLeK2FWaWfnvoBJJWFolO8U66Okx4eKBXQfnWmf
	1HgTkAZ0zfEBzemDrGHbXVwE4vHXKPtQYZijUogAvZUfXdKI+63rS5YcZqF8VwIC
	Bs8Q6Wjc8qFmCa8Fcnwvvaxaia4JK4uEoW4Fifq/NuS5N+OgPtRd2eqz2y+bIIWO
	a9LjcA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvj5bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 16:14:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5595f2366c0so4254089e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763741642; x=1764346442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=;
        b=YzAIAooxzR+FA8AXO2IQtmN2gMVLa7YNFBtzvMvfn8Dvows8lmk27b6FOb3phyb7QV
         xgUPUW8mODuIild0CLLKB8PeZBrhqUDUY9krtwpX5aBex/KTGivIeKu3nT10BVmFXwKy
         KuoNjwk5u8xN+P22gWYlhlys8X+uTkmk2cZKbnBzLd+MO4VeEHvMzHlrBVwrE7mVNptG
         ts+X27/ce98856COCJy1u2eMO8AkioL/8v+31kaAcy1cMTh1A3stJzLAfxeDHajWbCOf
         3iunTiR7bXYlZg95FbJqYR9OJUph9Ssx9E+Wt8CGGavqVBmXCtal7l+qDuFPOmOzoAVq
         yfBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741642; x=1764346442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=;
        b=CTeZ1TXL2TGBiJ/03dqrDGly4Ab2QCpESbF5ZOKSFdktrBfPaAMsaUq1W4RDdF+NoV
         +6SpGZhjEi9SwsDhye6j95hquDIWHkRKvsRM6MiSbDGnPBDsuig/sP5fGKHWBLadC8jT
         9GxTOEEI5MJ2THKOEgWO39pUBFLeeH3CfQZdiXOHZ0xDajDRAPo+biUd/+s4qeysHMKd
         sw98FuFQWwYaSbr7RcHRrq2C2rQHpX9SWc1EailJJjazeI4D/F/YBYSw3oCReWUoQ76q
         SuNWCL6h3PMEzzNtTq4o10Plai6JPe0Drqh01V6PQ204kbzn3O6skNnc3TdOk3C+1zpT
         qoWA==
X-Gm-Message-State: AOJu0Yxz7+C3WCjgiAFkC22fMAxlDoSc4KmKLfRns6fZ1/dwvBsQsllL
	wzutepGkpQQhBhLIZlQvFKWPY3s72Bn+VWzYpV2+Ev688Do/+Io6aOYzcIaFGfcGgR1ivm2ZNow
	hW2Ra6AXeYgftG8YBMGM0X8qE1KvkPOuJUzba4qJzjaXkxj+X6N99vObR3pd4YaRySSr0
X-Gm-Gg: ASbGncs1jrKPnL5KbJWCUrRwT2IX1ZS89UwwkzkJ8B+tJw7IwARbnMFJBDA8cA0xhOz
	DYAzhdxxezgKYyTgyEuFYZa/pNxMgMGUJIAo0wB0Seaxpurc36iBcT+ECu3ZDDVkTaN0hztgikd
	X3YQh57BRsL+VZRRoKttuMMuTSf66oK680GLaHqX3GUuRNrs78NRwsUWRKm/EX5URYe4JwOVGa1
	KwQ3L7hcRkxUYB8QL+2MGJOaQVXkOxMwSZC+1G9OBkH/hYufhQqhk89KmZZW0YwNQy+Zc/1jSkU
	XYmvmOKwwKyxev4osfnL8CUKPZS0M7j6F4YYMC4VUcwderiuUuRknnhGCwLXsuGPTDppwZ/HLH6
	vJT1MNRcQvrJnmUQHJ+gDblpkRR5scPYAGkAnW9ZpBeXFsyvJIe9Xwiujtg9IYkgHQej0uLDyH4
	c9v06NNvbGXEI+LI4825fqqFI=
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55b8eff05d5mr852222e0c.13.1763741642316;
        Fri, 21 Nov 2025 08:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnM/0HJsNeT25iNtTu/Q3YjDCZtGtx9Z+NralVtjRltw4ot5OynRvAetYDwgNqKSPGw7aNpg==
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id 71dfb90a1353d-55b8eff05d5mr852211e0c.13.1763741641942;
        Fri, 21 Nov 2025 08:14:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:14:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:13:04 +0200
Subject: [PATCH 2/2] drm/msm/a2xx: add A225 entry to catalog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4mjjExWwAmG8isEitOAb68AjLdD1g2ziYxcCmOY4EAU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/EjMk8w8VwPXYnUwkk8izbyavLfLvdeEmM3
 9IGrsgnHQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPxAAKCRCLPIo+Aiko
 1ScvB/4xN5d9jbwFWqji8MhwVlGwK7iGKNh4cm7keJiLglhu2c4dhRnZWZmbP2BhqlrnIjeffa6
 lOlp3Zrf8aQOfCLhHMtdayiZQZxtfFnTOiu0V8pPMvaLkWd3epKP2uHOsQ01wAgFvihv51vQXWD
 rqUDoQCPbwD1LZmXj7GgDFqMym1CU2tbcGE276lgkfqRarq+r1/isjjv5/McYPhasINjHqTNb2u
 WLt/ONhI2vDFwnPZmkZsX/2XP8WKf7raaBTHQKAJA388CWiju1cSBA7vm58gI7x/XUC/7qOd7KV
 fm9GMx6kkg07unEICogNTLrNHlspotLcoEWK008ggaEjteVY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: CmTGDv9PsHAX2D-Zc0rbBLMhjhIfKtm2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfX4CTM9dNhtJhW
 Xdk3a1CJAAz3zQCT/UyijmjlGuhONTD90jXYM8xR4k4UHEQXeFzBou8MKjHUzkGvSHq+OXgIS4M
 sRP8+KquUBK3WJUDpRXmBUPRLzwcqvKFX9yJeOujz9yrsQzAeTrqZZf+y4NyhUrwZR1ANgsV2Wx
 /Wd3KyUhhazAEBMC5J7A9RMfT32h8L9j8dlvT2M0uEMoGLpfzaHo82oz2q7tLoII2/09bLRBLfg
 ant+FJSYESMR9E7CxjD1yuIGFKxASWadR0bgA1lHCkiPdVww2gAws3Itdg5XF1BZJplbZlB0goU
 1ru+LHAmUqHbO/kmampqgaC+i1JkDHU2mpAz3+lLpAuVxU7TEHhW80KGjbb73oI0vHHTEF/MQ5l
 jo9si5odzj35G6FL2HCFhjLk0DIygA==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69208fca cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tn2a2yLXBXweI1urhwwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: CmTGDv9PsHAX2D-Zc0rbBLMhjhIfKtm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119

Add catalog entry for Adreno A225.6 as present on MSM8960v3. Most of the
pieces were already contributed by Jonathan Marek in commit 21af872cd8c6
("drm/msm/adreno: add a2xx"), but weren't enabled because there was no
GPU entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..9ee4c9c4dcf7575a4fdfe24a14cd6acc99f5de1c 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -42,6 +42,18 @@ static const struct adreno_info a2xx_gpus[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
+	}, {
+		/* Only for msm8960v3, v2 required a special firmware */
+		.chip_ids = ADRENO_CHIP_IDS(0x02020506),
+		.family = ADRENO_2XX_GEN2,
+		.revn  = 225,
+		.fw = {
+			[ADRENO_FW_PM4] = "a225_pm4.fw",
+			[ADRENO_FW_PFP] = "a225_pfp.fw",
+		},
+		.gmem  = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a2xx_gpu_init,
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);

-- 
2.47.3


