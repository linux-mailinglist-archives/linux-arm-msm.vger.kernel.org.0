Return-Path: <linux-arm-msm+bounces-88853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B899CD1A7E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B13603094F62
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7EC3939C3;
	Tue, 13 Jan 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZNuur/qt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfXIHsZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE64934EF0A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=QTsGqP5dHFDzAmnJAq4MJfi98tN+G+6Q4awZ9w0DXKEVjBD+GOYJyVoUv0GN9lcMKC4Ma/ZN2XjY1kkQ4kGFtdzlKnL5vYi2SIQReSFFEkWsvV9nvh/Gi79WmpB+kQWogS6HhoiqWO/W5mVRULv2C8V8Ght1hHtUVEd3GnO+sTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=FQ3Xn2inLRRi3XEzsW+334edjBagx6YVFOZWSWxe7Hw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUrwZLkFAIvy07aR5vaJZxgQ8TN8RiDceZZEYhIEajMiNNsYmFLqlRPDYJ+m7QHfNiOSHdZMW2Ko13RkxviQTKtt9qGIGZmfuVz9Z28zWEkL8YZ/H85LZIFuYba5mqGZNMhh20WwRt/2GUith2kkKGsHq3fd/9XgMY+seTfjn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNuur/qt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfXIHsZi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsVgo2071289
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=; b=ZNuur/qtVvLzMr+v
	XjNCee7HM10Vuh12hmEZcOK3HZp1xKLvdbeT6SsrAS+hgEiVW9WzRBjeh9VhDWVC
	Ti07r6PtcRH2lztn7CwnrtcQN625MnjlzixXdVXxp/ltELpDQppGzVQy2MtB5MXE
	5HirBRKrpe166TRMyOZ+z2ZQ/yJOVyfpGFGntgx5sAo2oE+NcedU53SXNUWVPYYi
	KgPEPgO31NsEAWUuTddgwDVQFMnlZ7KdxiDkPQ7sZjuu/vHf7LaPNE5Dl7WEeRVG
	hKcCBEiF7K0n9AK5emSEsXlpnozlBc8lOQeJuj3vBiHor7eHMEpYSQlVajzNcoLx
	R2xQzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8nef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52dcf85b2so101942085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323463; x=1768928263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=;
        b=QfXIHsZizSaokI9ewrkb6YwdR7QuZJKXbUw+CeY3GQnKYBjYe44e0YKhHg/7J/VSSJ
         QT9kqUTdwWaUpmRocqS7I71m1vs63+dhJBkfH+vZsg4WI5BfFWTl5wWHKlRKhqIDe/Ni
         vmE9w0MzHeXFFGBBGxJtEVyIVHXLgULslMHybdOfKCSsQyKLIRDuEkz+dE1xn9Pag1Ar
         7JD2EWb8Qdprv81GSNRCIIYP6/3P3p9avWZr57vUBzO01grkHpbX2yuQkVan0wtVXx+r
         3Oq7YtMMlq0eWOHw4AXN6GoHfa2T/7hZly2c4k3MaRvdxSGBj2PxfRuHGrRYv9oh4bDF
         /E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323463; x=1768928263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qfeZuNCMKyWjmLYciPdmW1fc6fwfC/7fosDwvplVK4=;
        b=GABAT6gb0T/VnDFKq1A4C9pEduLNCdVIw6Hp+kh+pAcRlmtB2qnKXvOz61+ykrhwd2
         ib1ehRw6c1pWsG8ssKBGISvJylflp8iFLSpt8dCdH+2oaREMQG6fE3iZAEO+5+2HVPuI
         rN4Z8czfNs8FloTGg7VYDv7DgZ+omWrOtzW/d9w3WhRonaaBiCSxkNjtTle4rD7sWhw9
         2RWwjY5tz2v/sWWi5QC30vLHaZGLungKY/pfAAygwi8IUnZGIDNzvdLMZpQKgpylstUK
         fU34DOB1ShTRsxpWH5BlTYZgIL3DSUmAmQCU7JiVWi+kXQOzRrAccR77crOlITfAASri
         Z7wA==
X-Forwarded-Encrypted: i=1; AJvYcCVQd5m7ZJR6/CxP6XmHTSmS+XV8TCBD4MiDAIxb/JfJgjzKZ5l8dyethh+CNbPePSS8moVELeo2qHR3kpU7@vger.kernel.org
X-Gm-Message-State: AOJu0YyqAMa0kTiwTbb5lTxl8uRkcLkCs4Tr+VYGubwPqIc6Rk+P83Hf
	UqyaC6YGnjq5WU7QUQ2XHR2cvo8fuVrAiZCEzs+RLf/TbghNN9nktFk+QXcoTA9YCFgE334X0QL
	vbUlaDIoxHK+HVS+87Vjw1Fb4KPLP5bfh38zDIYwNRSShTW4OilphnatvuU88uk+mD9WP
X-Gm-Gg: AY/fxX5MlOWfuO10/ypzhRfkIHgJ4xmoLGGH+8Ms4Qwo5fNUBX8vTJtJW2S4QaGEVXd
	u/ehzqTmkJN23NTXTHF807I4lT45O2vbZ+m551IRCWyMZ6vBMtZ7L23AueV/ONaVxbMdQaiEI3E
	3Fx+Hakzpu5QODC4xZbNDPe2hLAOKeAPgAU8iyLdgUeg2iyP/7nD0Z5wCICC71KnkOSsBl6Ue/K
	uCC68lIaF6qaIQugqIqUNjsV5NDZVyQsFxm3P8+dt63DM8pC6aCu76iUJG/i/mlPfbr26CxAc1b
	fah4ydmthKMfqu3i/M0f/qg2btOFou98pnXlXuSs6Px3/KlwzcIrwr5KZhuIVPq7i81480AVTZ9
	qaZAPcX2hK6J0eO8UvtdNbxrERen5HR60bDrUvmGLyTdrpneAohPoFV/jwp7zN66tfIHY5kWV/C
	d+g6sfNjFvZvHlnZ/+P0p5Lo0=
X-Received: by 2002:a05:620a:522f:b0:8c5:2bcc:fbd4 with SMTP id af79cd13be357-8c52bccff0emr141439885a.53.1768323462893;
        Tue, 13 Jan 2026 08:57:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAyNsrk5Z2AIsgj/nQvBJ4uUGWq1+bsfUTTPz0/uGeCx1jrAMbGLWAwnxIuqCW9E2DAXzDfg==
X-Received: by 2002:a05:620a:522f:b0:8c5:2bcc:fbd4 with SMTP id af79cd13be357-8c52bccff0emr141434485a.53.1768323462365;
        Tue, 13 Jan 2026 08:57:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:25 +0200
Subject: [PATCH v2 10/11] drm/msm/mdss: use new helper to set min_acc
 length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-10-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FQ3Xn2inLRRi3XEzsW+334edjBagx6YVFOZWSWxe7Hw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0PTE5OHFGoICxjRO7KNmDeBBGHDOeA6HsO
 GiBE9zODjWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1fQAB/9voiIS7ZX04MxzzN0Dm1inK5aUdGgfXovuk/BA3B31X7AP8OTxtGaenMVPoXAqZlevNxE
 ZPdBKvVUsIXKrEDJgGtVVPPYHDImICP9S5GNbC6hyyIh10Re0xb3nsXr/zYqTg4Kq5diERZq2zf
 AIjWLSnFI8dy+V5BN53UE1t/dZ8MMBPt1xjQtqusy1GPJrErOfdB2kaNp0pppcuxOGpm7oYDmfD
 a8MAvz59mqXgE2SVaJmpbJct8XUFaxL8cU0M8WLgswAs8VmS/sLJBc7nWIxkYlApd1cYoDRqtPd
 Jk+n52B/7fIhtfBXiVRRA4p7i8fc6PRtP0oFEi1McOQBuzdR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: ETUHiGFDXfmpvGcusn32lFvqppJRQ9Ia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX+jRRJt613jLW
 VaW9n6x0XeCtG61SjTzYcQe8KXZdrW4N6CrI33KhlYJm28IBaLPCBM0Fw5T+/gNHZeJ+PvXiGd5
 3z/DC9zYpOG693L9BdH846kQAMntl++MrjzlSkuAuq39fElXULiml+bgprLk948FCzY8dtn6hxu
 zX3Wxa8AAdxCudMN56IWqaag9kiLklII4flo6Cgpe3+eY3O9HqlTZSw9BYbpdHhpAuJx1H1kLe+
 naUfaH9v6ex5SHoNZLKDgl/LsQ3nHvDNPcsjix2c9ox6CxfA+fMFLWF2Zj49YYrmoM1PYBFoYWI
 Khef2tABfNXD+BJ+LmRSlDeMNlocAog0k8uMT4B9rK4liRSypWfxF9gj1beiwCx8T1ESwYjtToJ
 sJX1ZwGezQwMnI3g1bqvpPW7MV+LfzNLsdh02cpE7N7k72bki2MjVtdOJ4aQ7o78HEs4MaA0JlT
 NyaYRT1mN/k1ytIe8QQ==
X-Proofpoint-ORIG-GUID: ETUHiGFDXfmpvGcusn32lFvqppJRQ9Ia
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69667988 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=X-e67srwgh_QgMMAbO4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Use freshly defined helper instead of hardcoding the checks in the
driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3


