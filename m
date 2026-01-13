Return-Path: <linux-arm-msm+bounces-88849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B9DD1A794
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9BC853017F91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A5D350A16;
	Tue, 13 Jan 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0Vq7b0Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TKseAphW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0CA350285
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=DnJiooX+FXqtwjF2EttB/1B2WuqEHgcZAKrtZ2kSH7GdD6JmIK6eggH1yO6Nf6n9bbWOnHwtpxPRS/0FFk8IB1npIHJ9dKmtiBIOgTiszYKvD+hDmkfDDhpAkjJovF1Ojaem4omAeqX5eGJDsRHv7jcXfzXsmhvWgA5ao00q84E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=AhTbHQYj1BGt1/wq9IUIForMIZJ5fEv6IZwtGavSJvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMh5dyjH9Pv7iA29Jf6xFNoHWggY6E87wI5Jk6oqgXZPxfaqTpj8GKW2WpMFwk7CKhwLhzCSJim0bdl7AzsRXUKCFA7hxEHHOKnWiK0BwZJR3lGZCP3+o9RSxG4Uj0bOsMnMP7b2G4e2A2+JNrT5Af8xRBaEkqyDLpQqBMP/uyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0Vq7b0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TKseAphW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDfwDC3735146
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=; b=p0Vq7b0ZjxkZDsGJ
	6GFEe/6Q9AI+3NSr4+vFRD4eo6OwFegXeuJIg/gZjzoRTSysBPbWuXX7IjGO+jW3
	ml9t5rGswBUcLPbEwJzDlr9wtu+B7Sa4yESVT64P1rwsX/IfCzUJ5WnWKJnNY8Xr
	Ln56hTTFSFKUv4WYkwUiEJemJUQctD93DzwbNoi5//zpaCF94+4p6LsjfEHSKcFh
	fAgu34NK1u9kyS42tvFP/Jah7dJkUoP54bLOukjEx7L8GSooQDd/3t7vvkLoIJY4
	2pVvuxsm2RfeD8kMzCVATTYnjB37d3cvnhjV0/nONFSfGUgCz818y0/TouPgw7fy
	o3ZK2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng87a3en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52c921886so59739185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323459; x=1768928259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=;
        b=TKseAphWkZFByhjk8+U8okfisCgiy8PUKa12eCK8eZQ70P3PEVMOf40lfaS5tw1drt
         XMxm+D361365nFih4iYnzW4/M04gmO8mXQUzkqLDHShcxMcfndFCsf04ENolFp1+HNh0
         wTJE5p6qOVudZIxyEp1JzpKhKs+JaolckDJjfCaH368j0S1+W9lZJoc2r8vH8wpViQy3
         BDRgNtIIjG7/uxG9l+3tou5tOL0emqwtn+Own16bbew0LYOadkou+j0PdtkX6E+fX9kQ
         XB+fsKOpNFjCzrIKlWcTuStDvgsqzidrhAdUun2lsU1YPprMh1EcvKVblBnUuvS3Jwaj
         P18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323459; x=1768928259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GLGqN4t9/fHBGxOm0fea01TzjR6zf1CFg50+jZFBdiY=;
        b=bztGw3SJux38KtuW4FXc3j+Vh1oROgR4fOmO4nUKLuq5J6rV8AlUwJWNYzIlTgq7OM
         cMDJX1MGkinyo5/VxJKfQ4snEjKNgGndzToK650nNw4prAkKnRbVtu8Lxmyr3ystoVSm
         1nYmwrmeZ0rPJmiDFlNjBXZ94fENEr/sCVeQBXgXl4pKkYsu5QXli1S/6CbURLL5ubG7
         +5v4vQUZhVRMyKMFDemzQbeszJ7rW1V/2yYLMqNABkQpaoMRaF3PaC8S8dnoIZYJxWoA
         PbZ88gCXkIfK5SVNee35opWOHpdjpGkFcqVmeSpoS5rXsnoJj9gXZO8kVDF1+4b/xp54
         X8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUf4a+1jwv5bDnfwWr5BUjhR2bG+tRQbv/A5n5CE+8tgOe3i3bRZnc7/L8oCy0y2F+sr9IABJ0DvbVrMDwN@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwKJa31DKCChW/EwqmsJKrUGVGlAnE33aFCiTFCs9foISsDxD
	4np96a6+8KitZ1h+hyHOjoMtOeFHpBD5S29pXqByPZfGM7MUbTvpYWWSzrGlRsqGJIa2J1PUjCr
	9OkDT8AImO95QYgdjEuu/dT9jLJCtQYRbv5EFJH7Uyc9uhPV05GE3qMZIBMJbSVPMTMDT
X-Gm-Gg: AY/fxX4w09NaMUU43zmorLUjT4gHtQdrTkbjN/orEC6ncv3kG70JrgylR5CjgImX3X2
	mLiYE8xb8fgwXyC1naxspt5MQQzrMyN6UQNkpw/zBKiMeWxClUoaVp4GzYmaFEupRq6+mOWMwJZ
	ba2xQ7jWhzzG+BlwfvfiZXlG9+jfFr9t3KCTbUid1O1fGBXhs5yilGfFTyWq4yBC4StLTYEBoym
	8TfJAPqXhtkcSXShLBWvBm/zPQfqM9MFtknQLITkC3eVE1MYXQ6vo4gEG3BZ/a8eC+ry5rcW76L
	Fz0bx4gliZ0aDSLyEYIGziWs+Jrrcubx/eFt1Px0v7l62ZmM6qI1fwWIodWKbSK7l9Jak/V4Lgs
	K31xumHwXG+f3vVanMGjeQDN5t7lEUWfz4vb+eYc3/cMq5JjgpAGymeanGkUYfRdr5kdjWHvjl8
	257/xoDSp5ywyOSugmNH6SHZk=
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr2835350085a.69.1768323459214;
        Tue, 13 Jan 2026 08:57:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFXwgZ0fK0yC9neD9oD7YWJrX33cXmHUqEqwH/rowxMvNIvSZblKRs3crCDW3RZIb0RPAUEBA==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr2835345185a.69.1768323458692;
        Tue, 13 Jan 2026 08:57:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:22 +0200
Subject: [PATCH v2 07/11] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-7-4346a6ef07a9@oss.qualcomm.com>
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
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AhTbHQYj1BGt1/wq9IUIForMIZJ5fEv6IZwtGavSJvk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzSaIPzdYafLuiolUkERDzWfFPViyXu9dW4
 oRCsUXW3TOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1fuHCACspYQ1kmZkSJT9/nB0zOed8vpYRIJzry11R9PuiH4hxBuD+9wDeG3gIJ+6y3f+vcNLlz0
 OFQdv8P8wGk2cgTOO9mhDIJO9oTDEJTEtfQDUv49EY3j3Mo4AwQ2RKCSIufNf7WT4gJk8D946e4
 w4aiiQhK7RTP280nagnNT945p6ccLzZPCKLS9YBri5gDsfV+kpTYBIrn1UxTOdvpCBcXxgk2eup
 eog7euByTfuBdVZz4urV0CrTaOm5F/fyfEl03Ti9226WIJHVvGybXNzwvQ2Q0+3SDNU+j8FrZyl
 DH14P31Bmuw8oTxGmXsC9UANAALUEGwg3MuMyesCaT8g/U8E
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXzxqt3Lya1z+B
 Y5mQrtVntZtCzimuIbWa8PQPIjBkDO5n01CB78KPHdwcg0YqIec45XFA8e/afG3zCZ7RuLZeSj3
 GRBOJRObf7q5oSUe/sJweX+ubNbAWtZPF6ea+daW8ZfBK6LPJxLWu2W2qCxeBxHIunH7RX8nR4Q
 Dj3bdaK6motSkZuNC7icRlyUqQ6k9TLoKaMDvNdud3CDyJzWevhp3TsdGEK3QZW+2tpiNRJbgma
 JNmqHHVblUTl2MiurBWXavYScfLoQ99uQbCJnqg07XjaL2zELEba8JJvLW3qY5TOhSIdi69icdt
 GUuqfSK07l9/l4Q5k/5PaUSHWMR/mIjI/zAY49U3YReoMZ3ji1C0CDQ8AoZA4lspssETKE4aUD2
 5FFH+5va7ndRhoBhj8ri28kJqS+MuNBCd95A2p95OQgUi5U/jPZ3XOslPHw+KdI1BHhuFP1F8Mk
 yFBjRrwlc+hXhwUC2Sg==
X-Proofpoint-ORIG-GUID: jFR7BGHZG__i-DjmDElI2iy6pF-meCeX
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=69667983 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2VIzI6ABkMI1kr12n-IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jFR7BGHZG__i-DjmDElI2iy6pF-meCeX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130140

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a880751107c7..9945c939cd29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = ubwc->ubwc_bank_spread;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


