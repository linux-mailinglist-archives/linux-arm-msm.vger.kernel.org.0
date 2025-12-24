Return-Path: <linux-arm-msm+bounces-86585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49720CDCB81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72493006F55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE6D2D97BD;
	Wed, 24 Dec 2025 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPOoMGze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkyqnuB+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACD62DA763
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590438; cv=none; b=UzKcEbFLgq1RmlqZWOqTb39lJp/ZcoX/c0MMjKh0L7WL/6GVlov7CU2WVPc5AsPdfg/29hNY0dc086opSIA5FChT836oe6vuM3uOZAZcbb9XO2PzRl9Mvce+/majAtc+lhy/qaH09LC50XiTC2CDCtuHobv7X9g34HfPb61sKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590438; c=relaxed/simple;
	bh=hua9yNQidjaS4ahVcEKC7c7G+W1N3sfAOzqaGw7jqK8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qUNIpeZ0HhuJi0HoVt/9tjae1in53raI2jc5vWjffkHMAM1soqjd7eSOj9Cy1Ckc5aVJ0GvOK+WO1TNvZxoICoCPEHnbSumKQuToRbCrT0wjxs3oCh0XIcogoVqzys9/F8nMDH+Ek10aUkAx2n3I2muVPKf+qHUGboo2pNM2JQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPOoMGze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkyqnuB+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8dqMx1208041
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fkd7yIcYdAiRrFUU2lcbgY
	3gwdJKtsu/J2ER2SzIswk=; b=IPOoMGzeGov3HsXADIQtXJyPFa2RFS8ceqhDtq
	0gp7TOvewQHFUuqvEWGJ/0LWouSyr/imuvyiOG2damodxCol58JvlfsQFh+bw/Cy
	d11mB6OCH3OmkwadXGoqBAP+8nvLN3vUXe6Rp6iR8s1CD1xgylXlkdCBV+KIjFXz
	h2tZjxtI2qXcWLAVSM+4ZifLfTn654+SJS+10ljIjcIIY9pFdUGZMC+zZHMc794S
	5KHCseMTDaNeINcN6b6yQQdkkWneU5NWU2+5EHEq13yaiKzNeHfv1I6exPoLzXuf
	Es6oJcAF6HzZaEExMyfcBP0DAjfnuwTA2wZhPns3XL3g6CSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r2g2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:33:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f183e4cc7bso109123181cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590432; x=1767195232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkd7yIcYdAiRrFUU2lcbgY3gwdJKtsu/J2ER2SzIswk=;
        b=XkyqnuB+fjUNdHtafe+1djbKdNLeRKJafI6IGeUCoO4Z0AwtEImnXXr44nRESvrwrp
         jb46J9lCIJ230hI3kuKdS9azl6OLzSnaQJ+FiC9aJ7qhhFUWCuJ7Y/Q+F/njdgyDb6BJ
         WTH38UZxcYQafoC+m6d5N6MsAOWG6dQUMFEO4DqtZuuh8QxUYK6IVMnqQkSKOyy/+3xj
         jLhmP+Dp1QSgDR/Q9sBtfBWsTDPg7bpUaYQC+OCIiVl3T1yxjVxUf7bE4wGRsAmtCT8y
         LThdrHkJqn3JPIL+PyEtY/UNSyChe/Nq3o+ulEBsumr6lXQXc8yIMWIyH9Kp4wKuIMEY
         6SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590432; x=1767195232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkd7yIcYdAiRrFUU2lcbgY3gwdJKtsu/J2ER2SzIswk=;
        b=nB9ymMMqQKuhA80Qg96jZcnvhBI7X7HxZMyLIlk8IzZJRUDWbgpP8aE/jgocMSLRbu
         UW0bymmGYHQu2xogLKmKq4wUhCiQrOR7kpjN8x3S/zA3CCfs/7v0Sr0NEC2iYVPxVw6Q
         +sX9pwY6k9R2+AzZXEX0Yd/qjjaiSeCGhojVPWERDiGZrCtJwfD+PUcK/LRQ0KA2NV2n
         /EgKZZZ+tS5T9uAuk76rcwKspsJvfM+a59vT+UXhcXxO1aFPPLJw+6vOsrERtrKUpvEG
         GcjHtWj84wX1cnLJ8bGb8uxWj+DbXalD3VOkrzluU0gA1heT0070Qq2/yQtij6cgfXPi
         WzVg==
X-Gm-Message-State: AOJu0YxX6/siDwWzpeJIN9nfSSDnyYETOp6qnsvlgZpALnZDDThHU6Qz
	i6RQk1Qlzcdohwp8tgS5NrtFn/WIWfy/KoD0DgBcO/MZBZ6xXqgF/ykKApsnj4u9ntvgVGX+lYy
	wKh1f/q32mpsSzXAfPIZeaYfHVkJdBiSCnuCHWhRTWol7RZX14VwFZt9rpkjjxp2pbgnS
X-Gm-Gg: AY/fxX6P9o2KW0Jcr87GGn5S5UioXQ1YBKcYsEgAEES4TXttRe8uxCu9+U7reeWC5YX
	vVxEvPRa1UpXRD3z5WDZ6zSMXpagZ/D7e2kos3Q7ieyhYeIqhoZQfrRvRcxhyceaTDkaYee1SFs
	X7vtiNoTrhMR4w2xkiNZuRZS+C7hJOw3gqbJyPD6Ot6RznpjW3kOhaQi9UHHquJOZ6O2Mn4tPLt
	6Bp025mJW4WifPdgXJO+5K5CqgnLxLba0O2n30Qbg3QtSKDB7w8eeCGPMCJzWQxt3F8nRPIdYw2
	3NC7xFP91ueUOt7EpXqRJiGjTYQa05G28TK9Ahv3vSQQuYBaKbA7Dkd2AJvxP790fVLDEBTd5SY
	IWpqOJfTwkfjKb4ZSKIgVmKRkM5mk3OVaXiqfx4tnAdYHlVWzuLKWS682eDPSRZeC4MoXO9Q0nF
	mmSagghuJGVEaoEsckr+PQuTY=
X-Received: by 2002:a05:622a:40c9:b0:4ee:1806:97f7 with SMTP id d75a77b69052e-4f4abd7532dmr235501031cf.47.1766590432383;
        Wed, 24 Dec 2025 07:33:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSeGGQtG0K9rKZDkEEbxBcmrQ167DlB3Jnt9KRJkLvfcvp9+m4Jh13XawZF4dVYqDiz9OxfA==
X-Received: by 2002:a05:622a:40c9:b0:4ee:1806:97f7 with SMTP id d75a77b69052e-4f4abd7532dmr235500791cf.47.1766590431952;
        Wed, 24 Dec 2025 07:33:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618cf9sm5115105e87.57.2025.12.24.07.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:33:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/2] drm/msm/dpu: fix vsync source programming on DPU >=
 8.0
Date: Wed, 24 Dec 2025 17:33:48 +0200
Message-Id: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN0HTGkC/62OsQ6CMBRFf4V0tqS0UKiTArKZGKODMQyEttIol
 BREDeHfLWzujifvvnvuCDphlOjA2hmBEYPqlG4s+CsHlFXR3ARU3DLACAcexj5UTS+hVG/44pA
 FEcXSo6HkIbAfrRH2srRdc8vS6Br2lRHF0nG6nA9HRPcxRYwlAWFxihNGwiyiBGVZtEvTNNhuf
 mJu0Zat4Yi6rdHc1c/+ofXdLXU9CyvV9dp8lvUDmbX/luTTNH0BQf2zCCUBAAA=
X-Change-ID: 20251224-intf-fix-wd-95862f167fd7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hua9yNQidjaS4ahVcEKC7c7G+W1N3sfAOzqaGw7jqK8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6YP+71PljXFTnOfzPXe/CbA7cQ2P4+OrANxi/0fzF/FE
 OLOfvRjJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm8lmN/b/fmZzfZ3/wXkq5
 4cLQLqy+2e1e+XfxT7XvwnufBRY9+/p3a/7md1dneZrVOyozLG6IPcj2rFg5vpklK36C3+s/Lbp
 vpZcH3O29vNw7+Y9bymUW8YwLQdqsiz5tWs5Q872z+YBepFPk0Sqz8ujG5+aHTWK0FwDJpWF/Yv
 6l5Oxr9uQPzIgJmfDymymfX/lXH5UP74L6+d78Kr8y957K5a51Z/b+sdjrMZuLWaBlT8dCvXJpb
 U+Li5Pe/Sh8OnvlnMzia7t5lk6wbzWquhA2S33H0dXP66axtR9d7JXaLMN8bD7DfGdpsQ9JE5ca
 iShyPexPYir9rybCWB909nZs1Or3eX+9p/9fn1X31K0BAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: N62NilqN3p7H26WG2clIqknBKiD8SwyJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfXwh3px7Xo/Ut5
 etYgeMChw2C1Q+acDnJ1STgyEiFFqk4Z6A4EKhGYdzYnBlJMZih+e5qS62XI0U/yqcEngx2qdjk
 i7vG5tZfJ1Wzqdz2zcrXnVyAT6fh9gEuTRRWQrvrU5xSldHQd7gFptc1LCa1FzVyc146u+mEy2a
 bZ7XNcEAQzbjjBlzVBy/w0irl8vpMnVUzG0SH2sazATFvXskrw6CXeL3wSvFfYL16cL0lu8HSiH
 VvDHAV8HAaKR5i9uo8Ro8tdeOebPYekqymOsnGvPEUx7PWxm0bcLWUqyAuXgdsaJsYkR1sbi4SK
 lPH85JVMNR4CPZz0y25bf+5AlL9JpTLD1dKjPeCVAEx3uXwQx7tr0Ja0jnzWLo56e29oB8p5P57
 3QFp4x/EHF+kFLzb2glFJk432Gw97ChCoxgQdoG2IU7ggkLid5aksPeYbWG6VNj7dSCHsnGJReI
 qj13Y7gnvssmRjPR7yg==
X-Proofpoint-GUID: N62NilqN3p7H26WG2clIqknBKiD8SwyJ
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694c07e1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=4r7oZHox7d71xAMh2p0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240137

Currently VSYNC SEL programming is performed only if there is a
corresponding callback at the top block. However, DPU >= 8.0 don't have
that callback, making the driver skip all vsync programming. Make the
driver always check both TOP and INTF callbacks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Picked up the series per agreement with Teguh
- Fixed VSYNC SEL programming on DPU < 5.x (Marijn)
- Implemented WD timer support on DPU 8.x
- Link to v2: https://lore.kernel.org/r/TYUPR06MB6099C539BD2C937F8630FF8EDDD5A@TYUPR06MB6099.apcprd06.prod.outlook.com

---
Dmitry Baryshkov (1):
      drm/msm/dpu: fix WD timer handling on DPU 8.x

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 63 insertions(+), 19 deletions(-)
---
base-commit: d2b6e710d2706c8915fe5e2f961c3365976d2ae1
change-id: 20251224-intf-fix-wd-95862f167fd7

Best regards,
-- 
With best wishes
Dmitry


