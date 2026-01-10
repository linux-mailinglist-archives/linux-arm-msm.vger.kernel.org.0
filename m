Return-Path: <linux-arm-msm+bounces-88368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C55D0DBEC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335BA3075CAF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3811A2C1584;
	Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6VOGJUG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpsH7al6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7234F24A07C
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073893; cv=none; b=qZ1iXbcR6fatzIe61dszSpXc8YyWazKAs8cUAoKuXge4uZH6swjQ4fx+e4RJmxLj9Z+wIs9C7YiHCh8flSFg7n0oUmVHs2G3RWaCOuR9/I27Eeq4UL6qmB4aftBmWp46buVKksvUwTcOWW5/9ESlIwpMRE80liDTV8HZzGZbHwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073893; c=relaxed/simple;
	bh=wPApkxuh4lfLkguH9VNNQc3BFntt8VOiO6TMdbr3Zds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqLcXfCR0Lu8AqRtzppXUi4rtHGH1YCnCaTg23TXBGdU16DXEoPRCf2Foy9Su6kdtgJZtjFOI9v8BKs/X+AEVVKCU8pvBI1Yvv8IBMHfo7ec+T/QM4qZYe2xatngVgZZ8DRqHApQyEsYwkGdt9VggsdIlXv/2It9VxD+gTNWB6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6VOGJUG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpsH7al6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A6dYiL2998493
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=; b=E6VOGJUGy61sVQhC
	sTL6ONEeLNvGbeqIEZSCr7OTYTbQQKSl3okuOUlb6Ptntc4xzteoRxhxUZQaFXVm
	2RRSkCuTUdH6U0C/yz9XjzGgt84YdUDtukdixmVfzQ+Yu6vdUY6+Tiz/mk8in0zn
	uRXBI7v49eCpFQnRyIVh1GY5sY6lIDAMgH4HJUelFLIE84mD36TPNUSpUNYqmbSv
	JpaO1Cn5n5wkV6xrCLGJQ0WV60idtUdXl8ZH5gB4bMQ2RWr+vjFchfgPwaj/IlYZ
	vWaCmBZBQAXKATq5U9fFmQQJ1xZhaJ9BpXBROTmu2ZFdFs0dTsp5Nwmn6PsbT0xk
	+jgc9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bke3e187n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b259f0da04so1405754885a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073886; x=1768678686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
        b=MpsH7al6JKA2YwDpYFcuQOAZLwVW04RD5+qZAkJ1lpiRXmzig1QyEKYVKWAUdfV4Ua
         QX6fjmwt8IcqrFysoJEFbracevQx2tpdjdxO0a0srqGqrq6F/nVuMrgSpsOMWCltyz66
         Fh08QGtdy+vaRx3Z04uJjO3JWj6X0K1eHzfCZQiI74XsmmjGw5XmwzyNTVfFjWwGTcy2
         obBoB2qz/0ZD8lxMr2rTOT4N9+hOGecXFT0d+0Sk/fq6vyH92ooxuHl7WmSkSKTcPipY
         disHqDEcuUpR8XguIUh7woNY872gTZcRry/6mkvaPZsl6sHg4JvCbGB2WOuSXF3RFqJ9
         agzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073886; x=1768678686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gK+pnJ21j1i9U/bbLvHtPo8Y26e9MJOkY3Hs+TWsP98=;
        b=PCAPJKQIM7LVUgnmYQfseu/KKanO9OhD+x+qRXE991u7wSjeCoH18EJWqDkQMERfzI
         s+7+K3p8a7ENBKA3XgCQv5GLjxa/j4mD9i0m6FuPqk9PNZiWqDva6bPD30cg0axL70Z2
         MT8z7BznkIcJfax0I4u0H4BitMnYzyntvvbTuKZgR9os9jloqwUHdO4JzE2NdHXkhg4C
         res4hjZrBEGSWqPnUD/jWyHoQDJB4l+srUZQeWfoIas/lix+yUbaevovhvRt2kzv+VpF
         5UVr4DvTvwhI00u4dkbhJz8zRLZV4qSCMeMgk/mDb8jcRr2BE1vH0SUY0ZHe1Cr/CBC/
         y+wA==
X-Forwarded-Encrypted: i=1; AJvYcCVnW7lBkFMmDflm4CK890r0O2YTGmkHnIjcNLgEREcGBMjejckY5ipeKi3yJaVNEATq2p3of/vZK+R1omYH@vger.kernel.org
X-Gm-Message-State: AOJu0YwdBn0p0Kmw9stXrQFVzD9t6TivA81ZnQ2w1wvAfqaTNhoS5F0R
	qnOnahQEgEkcIIOBP2TBoVMaexZ20PEkaD9kAnZsviAVVogasXDEOBTRa06jo3fmqw1S4VTZxNd
	V/Qtr5t7/FwB29FrGGIVcyDH6sCd8rLtdSJ0l54YW68/EueDL3OlKyx2Jszw1+O7GiHNM
X-Gm-Gg: AY/fxX5Ik37ce71VVmW+4lWi3Qb4esgsvQ+uQ3o3j90SPyXDZC2vl6dlV0UWgmTXqmi
	RUm2mVJfS6hl/AxjQp4OVVMJ78LCKMy7fuyPpzT/QILytcKCmzaG8VLnbeBLV1kJoqSb07RhZOB
	0JezeXxaCgyB7e8bH5DF8EfjEU9sLaWaNvZqbhN/mM8zhZg9OFtruNLwVLNGsYkpn6LC2a5nWUS
	InKBpCdqAxDDC5SgOOqUTeGH/0Rv2bZOWd9w6mH80RhU6dahqFVyPQBPj3nckjxyXQZ8IdLG8/r
	GIvS/fnWYU8DiLTdeBS9Z6rKObGDZf+Is7d+QB1h78WJEix4rcRUSCb3T9ug4ZuyaXb6QpHN/79
	YpWMADIiCu1iO4GVzOUfShm/LiXcrdBoBTJ9WVIyy2r7DKpm7K/FtIFPbzV38nYH3ptOwODVctM
	Cxr1DZ6vTuUqxtZqe94lemzsI=
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8c38941be22mr1791695885a.81.1768073885495;
        Sat, 10 Jan 2026 11:38:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIKWgn/ESS0qupy6xBZrxuNNEEt1VDukrNT5CaPVcHGZGReo2NFsBi2b+nv6ZXh9qRMm0aJg==
X-Received: by 2002:a05:620a:1925:b0:8b2:ea3f:2f91 with SMTP id af79cd13be357-8c38941be22mr1791693585a.81.1768073885052;
        Sat, 10 Jan 2026 11:38:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:58 +0200
Subject: [PATCH 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-6-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3036;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wPApkxuh4lfLkguH9VNNQc3BFntt8VOiO6TMdbr3Zds=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTqJmApBFFw10nL1vWSv+/MlslTeTh12Vy7
 IceARZggeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1QHuB/9SDh8YAvc7H5s3wL2CsuB8vGeKPCPurzevmcKRHH1YnrOFa7QKcZ37MhNPhXNFF6K1xxp
 jsh+JHZLsbflUJExjO1oH36XdfZg2hDrpk47mqwbOhd6x6RKZJBVUwJOxbYS+qofypTKBbliKEw
 qMJfjCjO8jHHO7/a7U5SSxk+QREto7FgnTdDPK0DbjzWAPIh9E/RX05mQmDDqq/VFCXNHyk8YJR
 Ka8rPLLcuK6cTDY8ZxwEhTMtt8934hmWXJEikYkHY90pN6ShtsSOU0N69ORl5JUbekwAuxb9nHz
 bCX2FMRAD/6/NTjuZQvhq8GbuxVkYsnoaCdJ8cwYzGuYjoPH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: zulKdMiAVzdVsrhHtlFdkJSz5jbuSD2E
X-Proofpoint-ORIG-GUID: zulKdMiAVzdVsrhHtlFdkJSz5jbuSD2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfXzrYDah1ICCo4
 IpiHhk9e1G+wYd5ohH6oUbY0gayKc6y+DWZ2b8hpBdLv5B0ZLWJWQYuxFdwXLtDumeywdIqBmTw
 C3vSB4UM7ObnWZCOGrAHBqP5HuKvy2oi/HrtAaEHHZoeyLttqPt54adnDQcsaXKqaDBhvlF1GjX
 Lo1FH0b96W16vrsz4FTpa2PdDsaxgk4jC3R7JWY3SEKp8AavItkX7p+BtJJ4rD0M6tebwda0YUC
 PUKViT2FzRRErxXAZbN39oijsXbdzSebVn0LRJRphofTM3iMW4L73EuRiVdG6gWyuI1h4zgDZbN
 2MVRv2u+mkOXT9PnjkrLXawEfN39Y7lpB/oXSp+7fmNe+vquHifz/OLnYLA2Kn3Y6cMmOy7avXy
 hSgmJtHYCnFLLbUwfHWVApEm8p2LGP1zajVCPe94FBpVT8Lm+3yZ8Xx3mtvN43csU7Ky3MKaPMz
 i7+qhpIX+t3adGEpHMg==
X-Authority-Analysis: v=2.4 cv=Dckaa/tW c=1 sm=1 tr=0 ts=6962aa9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601100173

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4e60e9d32a4..a880751107c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8421711dbe60..9f9ee67e4732 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,9 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ae996d19ffd..0f06066d814a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


