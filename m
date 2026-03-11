Return-Path: <linux-arm-msm+bounces-96840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKMGDobgsGmgoAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1732425B871
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 04:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54065303803C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724A1371893;
	Wed, 11 Mar 2026 03:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GfdsAQCm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9UQu9Kw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC5936EABF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773199437; cv=none; b=ZU11FdIF3ep14OuzBsH9wA51aY+Ir6/y6LwwrUYIYeidoPDOeV9vsRQsqS3yz08vldZgBAjPtRGmMhPsGtCDGurp1VD8kGw2TNZ5hkGllt8+62AikpVHBctwJ7W7s26n27B+Fjrklpe4ZYR62crwjewrrB7rzCYfQp3wcPmg7FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773199437; c=relaxed/simple;
	bh=atFJQP9/usuM4FRY4otJIO9yTCLiPPC8icE9Lv+0nTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FvUNe3OK3+YxqP9ZsRbvFWnvt6a75hBQl84ZWVEHyT+MZSrChJBzXGEtDr0eeOyf8yZqVwHctkKPVk06BWLG1ucn9UprAZfKTDwE6hucp58yQZy7KJiqaM621MDq07UlwaDCAlaumzrygxr9D6QuD8fOrGKAsX8GwsQnp6Lc9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GfdsAQCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9UQu9Kw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ2ZIe3297898
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9lDD8STPEjxzwqupY586LWOYSujuCVqRMW1zTbWzsI=; b=GfdsAQCmFnbGynTq
	Ako71aQ9zFhUJ3uitDr8CZupcre/pjxe1tD12LUJ1Jslw+iR0DZ5tIkrv0fbxvVh
	6f7yQcb/gtokYczCnUWr9+MmDfOhhhrTkoLUPP+xHpAD42U8mjYF1PxFxC49Uqf5
	Bxuot/g1rxzPDs531JCKU9b+lLd5bp/JuhGNorFgadNY/vjAShS/eU7D7Fw07net
	ClIdXJZvnNcwy+tSXwndkTIHFL/RMwhVd6xrVJsvGNpkZc/gNusEbmxxjKJW9tHT
	tApjurGslwGt+ldFWdT3o+I5PI0fHoWX0/iol1tYFsaWC3yRk7w8/0yL8Ff9jGFZ
	NQxqCw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1musej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:23:54 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fff2d5756fso5769481137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 20:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773199434; x=1773804234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9lDD8STPEjxzwqupY586LWOYSujuCVqRMW1zTbWzsI=;
        b=e9UQu9Kwu3Ut3CS0i+2ZK7yHjKfcFaBZHM5Dk1+uVXyX9DoU7v+WdgxzcLEx/95lyP
         1XUDpK5OESR4nCU8/WEUcTFj5IEMaG5reUwGa+g6hRo40tTMWCG+RWcywttoYQKV+FWK
         qAiAKSIv0WrqCb5FHJqT7PXAk780lsLirPYWraxuEbfpeOrCLkgc5GhCwk9+g/TS/LUj
         3c/iexwcYkkI7RhfMQuY1v+1PEpvWLc0Q0Hv7TIgac+CWtATQuyJdCdyxX7FU6kKBFSi
         Xxfgi9jSY+gJlz/aeyZ69hIHUp2o048Wu5FZ45umJul/dr4B8GKUiCy3M08qazg+r2qK
         zgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773199434; x=1773804234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q9lDD8STPEjxzwqupY586LWOYSujuCVqRMW1zTbWzsI=;
        b=gfIzEvBxzSezgzr+konR91TJnXND29t+eFIjSZ6llMEnmZddLlD5KWOheEpOs8EJVQ
         CBzyQj2yjGWhh+1br8r0R5zDlW/hTqANsFJx/AGmw3KP8hArvGkpnHuaX/70t3J0557G
         gVCCnTCt+KcPSh0DuWBQrMNYm5UaJi+pFkYG8Qgulf4FEZV0wawgY+WhqB8zPhyZkztX
         by6Ga9/BHosgqmWoJxJxAEu99Yx9TCYg0OgmSnTwlyanOtS0AR7xTiL/4+igtcF5SdP/
         wytWntdGQuEylMo30ZB7XZgWaRBILhh7F8x5Ite5e3tzufluhsFcWEn6cBO0rFWEZ1iO
         /qbw==
X-Gm-Message-State: AOJu0Yysp+yEP3uJ3wGzpERF0/aAuVh/N297wQ2HZm4PguLld2BL/DZU
	DH8jQBkJ28XQLhQdpmHh2tW89ykjPlCpQujvBjE6Jm8hvAt6cQb9PMKAhfLoMN2OVl/51klf/hi
	OSCJN/APOV+alHTZs68O/5usMv2t1z1GHDUkXoitxZpd+NUJSF86CWTVQPM/B0dVttsaS
X-Gm-Gg: ATEYQzzxUhXp0SdXNBSZgmRv7VwB7VV3uaYU2woWf7yMh+JQ4RFdJ9YNF+OxlLnDPvm
	FcHzmO7wirMKd0ecE4aQTyOxta0wEccFPDvitlTsCp6pZkMhbk/ZeOuGVC6Vi9lLZZug1pwL5cU
	w3+ndwC69xHD5SbrYCiBPqoViEtPQJKUf9Qg89k/CaSL6X3DUtKFv2HPCD3l1MF6OCD2vNNzSqb
	hxTL0bQ4kUbQT/4CyqEbrXOJuGr3ssguyF2LhE3NLloR5QN+Z7cApgOGbNE96JGwqqXHOUtPCjE
	jjWx9FYqsjx0lS13u3Og0KN5Rh2spReUuGq5OOLGEPD/3b5CyviWF+gVMBH7Fs9RsFh7aDryNqx
	c7qBhZ00z4Zh4HVwdT5q6fq68moaZ1XtlGULUXT7RROXoZ6rIBQXKeIVUzBWUnTdZxOQnUl1tcC
	HDEAp1qJzKjHXfk1OPyVHPBGxn/9zf8EmJ8+A=
X-Received: by 2002:a05:6102:dcb:b0:5ff:ea98:c2dc with SMTP id ada2fe7eead31-601def73364mr463667137.33.1773199434235;
        Tue, 10 Mar 2026 20:23:54 -0700 (PDT)
X-Received: by 2002:a05:6102:dcb:b0:5ff:ea98:c2dc with SMTP id ada2fe7eead31-601def73364mr463656137.33.1773199433843;
        Tue, 10 Mar 2026 20:23:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed41sm1422721fa.25.2026.03.10.20.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:23:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 05:23:08 +0200
Subject: [PATCH v2 14/25] drm/msm/mdss: use new helper to set ubwc_swizzle
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ubwc-rework-v2-14-69f718f2a1c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=atFJQP9/usuM4FRY4otJIO9yTCLiPPC8icE9Lv+0nTg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsOAflOdnbVa71oM+AEie4Ga9xWTywVRK8ic9L
 dD9sQ0/abmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabDgHwAKCRCLPIo+Aiko
 1U3uB/9fT6d32sWGFoD4Ek/GEvHpGp1CYXDPAeXNR9sz279sC1S2DQZX4uDg4yN73Q5ssDyHzrO
 eH5tYIVyidhdjlwuS26+zRnT5hhW5kw+swCkgpGs7PJ07AzIbRUgQlN7isynM0pNiwrw/+HwMQp
 b9CzArzhcxRkdWfGKh8lTgnaDa0FFqG1TmijlDjvHIwAHRdCbZ1oegvjR60mC2rGYmDJ+Uqv67T
 7BlWGfA4/YvLDK7+djDc1Fmg1s/v8AJSVNGo9ytimbLC8hYkkxfPCYjrRyDv+MDLlqf3Ys+vjFm
 NxZZnCETVM/HEbOe5i9mtQZhBDO/xc7y58rZNkfP88C15Qtu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b0e04a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=lYHGZ8dQhJ3a2aHNycIA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 8UuXNFIn-HEL-U_Rs5KT16ERtASGt1K5
X-Proofpoint-GUID: 8UuXNFIn-HEL-U_Rs5KT16ERtASGt1K5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyNiBTYWx0ZWRfXynzP1f3o6I/1
 QErBBT+2rf2/ZRKhmsXb8KqwL5NM7GG0fOEUWSjHpAiGKKMlNiziAGo2+c7XDjxdsi3ACzGRpde
 1W49gOMXrkoIDPU+LhfVroCXzXgEgk1OghFvpF+f/wK4ixD1yjVVh361riuejGyswQSR3sMboDv
 EzV8aqdmNvvhd7jZ4DtmS0QCht32wWDeSU9RKuKCE/3b5eiPicbALzyvsVogtT5FWbH5U/TSaUb
 xbmkW55CbzKFR1ofTIBi0FzheADfQI6KBzqGqYxBv1H4wjKy4lFoX7vfb3U5x7ykrtPVAeIlXpc
 lcq5DBP5oFRhD36teBRzeH1Dl/cMr8cljmIscO3w8Aub4AxRNQi4Cz5N4uPwqMzw3buePiQIiB/
 e7B25yf4SGPlszgNrHB2v+bDFvg/zQ1CW5EfQ9tAPR0Gh6ngsCdl44U/uuLNcFa5IWNUJ1bqOCV
 1ALNrKFZRXw2YO0dsxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110026
X-Rspamd-Queue-Id: 1732425B871
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
 drivers/gpu/drm/msm/msm_mdss.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index c28bdc21fb1e..0b15d725566c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -169,7 +169,8 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle & 0x1) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data) &
+						  UBWC_SWIZZLE_ENABLE_LVL1) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
@@ -180,7 +181,7 @@ static void msm_mdss_4x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 
 	if (qcom_ubwc_bank_spread(data))
@@ -200,7 +201,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
 static void msm_mdss_6x_setup_ubwc(struct msm_mdss *msm_mdss)
 {
 	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
-	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(qcom_ubwc_swizzle(data)) |
 		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit - 13);
 	u32 prediction_mode;
 

-- 
2.47.3


