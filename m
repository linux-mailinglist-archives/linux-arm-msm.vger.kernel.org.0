Return-Path: <linux-arm-msm+bounces-88844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F41D1A78B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:58:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D94CE30509C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A80E34EEF0;
	Tue, 13 Jan 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="THaJ2Hv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PshAsRyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E540C34FF73
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323453; cv=none; b=rx1Djh88ZQBYAox+25DKYacdJ06rKkFLESV+CF1647uF5ipz15rMJ50sv6hT+hbuHg3X3JaYuA3ct+UKQPw8GX/jChuFxZhUF3cXZkecON1kbrjq39tJqmpQXrSsiP9viUX8QESR0DczsraDxsAjambxd3yZUovIBQtwhZqI2Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323453; c=relaxed/simple;
	bh=e0V98OiixpaDzO7JJw0Cyt2lkwpGU1Z/ZtgdjEfcF2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lk+mwxX9HXzewXVEJVSUUWQTD8SKs7xZRMtRzhic7zRDEK0Va6bce9MYinu511RyOwClsxvUsdmuFKRx/wGd0melzDWyAP3n8LkQcsifWdTrAICf3VcKEVPN0lmfvHFalkhZ5Pn5V8R3P+MJm0K9PfwHzv1fjiFmHMUvjpxk/ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=THaJ2Hv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PshAsRyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DDsbf42071316
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=; b=THaJ2Hv14JAK5di5
	8JTVl4OO9A5vNPDfRnovYa2UWCWNEDE8pfBhK8k6PnzI4V4C2dmDQ+q2U5dso8kr
	Ze8d8MCM5aYDh91Otihi4WQKM/MiiADDRPyQuH+rajxTV9bttIhAOcb60BVy2lht
	EJpKU+wp1KKmOezALKZJSdh2zbzOk4tyASujOFlL3jCSi6AX1kiO+nAazp+1ZoaF
	4CMnej8nGDZQRatGPm8fN2hTx98xn88u/olgoQvVxMLA9WoRXzXJ2bzACshVVjjV
	2a6cPN+Hvo5+5fhB+jvL8AwrgD2/UKGWGY+DGZVSOGm2yYYrJg8DTVKCmkTkxvh3
	hS2HYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8ncf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b19a112b75so1920212985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323450; x=1768928250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=;
        b=PshAsRyTCsgk6BG4dy0OrOtqs0wX5PcZW+UAwdWncW9n8kEOJ7S/Vvo41ptJ4DZxDN
         R2QA73JwOtUpXmaohmYTRM5BfQWi2eukuwh+CnsJnFFIBgyb0YZh6s6TgjXU5mNIVHG5
         zo9kn4lQROH0KMylV442fLMyjRA1r3HEy+cvbi9cQDe5cCEe/gdbSJICPEh+9qUNdUcV
         ewkrBKjaKaO2OcrwatXBCzuHXQ1zZKpLSk4wbVFDgOG+tBTdcc2Ybl6sx8of+laiTmvk
         WPhH4Ozpj0T+8UTmo6NbYvFgv0YsiUG7AquaEkk4Zz2mry6W/CfZNVK/VKStR/lgZf18
         8MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323450; x=1768928250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=;
        b=RYEW+/XB0/rJmfcUJ3Q32krGSjCo2Gu3KbO5iEb39U+uGcJnsPFn/naPmZp2cGKD+h
         n5Nzy7pLMtA0xbhvxTckMTw17+vrJ/N+ktHQ2OOBHxlvNxybM82Vx8eTprTGf6sZ9sXJ
         NgDca+O7UBM57hWY1BNBWQtR9gwaJCL4z56/PSIadhVQ43nb6UTITKX8l5Dmu3NU2UzQ
         k6mAumQKfN11EndQ+R75hthgn7/ofDmJcJbn0isxOWeZ2lrSeI/zIm4Q0kZtYCZiCzDW
         /oGQk2GieazJVBQBVoYtof1CEOwafIqrpTNCt2XXqEe//tmI0XITZ4llP8ayo8HZHjL8
         a3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX7XzL17YdWH9YezeuiIW0HCFFQaYmLPu3HLm37SbzU6WqB9GIG/p/YifwGX0kWCPZtSbyD/4Xljspr7qed@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7OZC/jyC36z/R5bMOvmlXP/DdkE19rVOb9Gc04TsaZ9uW8m0Y
	iB9vQKVdA9lGq3iT3ATCkN0hFDK0NMTsZvTK0K6J2iet4+V7mGxizFIx19jvZJJHyrQeYp8eGes
	EDDk684ieh6uopJxLlsDZ2nT2/zt9Iy+zqaSaqkNCPCisif9cvQoAiWsxwr7pFnth2b+P
X-Gm-Gg: AY/fxX6rrR77dbMuQME2w9Hpyv5Fm8F/7zrWQSyg71IiHTAHe5lRtxr/iXcFG4WjLB9
	ocMY5uOgy8FrqSRydrPSo6Ny+SwlREzU8sf4zkuvxa9KFvoZQ1iABADp6/jdoeJd+lE0ivKOBlt
	Chy8T+fY2K7nFZGyKhsofIaX/Jz+5pkpDkR6qAV3mxfLHOnjfobH2So2qdRoiLY8T7OFSmsmkAQ
	uja4BGL16B6JkkGQdTfsPVS53GqLu29hBbkMU0mx6/rFrPtszyqxMbe/Gms5RhnUXHqGzbE3DQa
	pcC1Qt1rrJywwLM2HLSwfgvewpJLzM6dmzSMZThVm4RBnyeHSk1O/8LuPsl2NDKBC0ufnbwD+WV
	+W/C6WsJelFb/X7854HBFFgizpw3dmFmiB2mKiXXABHs8SHCFYQKl9ODcPGpUckh0jpR0m0xY85
	YIx5T2e44IsJM3JE0S7Oq16A0=
X-Received: by 2002:a05:620a:22c:b0:8c5:2bc7:ef4b with SMTP id af79cd13be357-8c52bc7f196mr145687085a.4.1768323450199;
        Tue, 13 Jan 2026 08:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETb/7ii8sn89Sw8DV+nF7jagzkTsPymak/SBe7T7VsY6OtDNVMWeWjvXq4VG/TaTaK4FoePA==
X-Received: by 2002:a05:620a:22c:b0:8c5:2bc7:ef4b with SMTP id af79cd13be357-8c52bc7f196mr145683785a.4.1768323449624;
        Tue, 13 Jan 2026 08:57:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:17 +0200
Subject: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e0V98OiixpaDzO7JJw0Cyt2lkwpGU1Z/ZtgdjEfcF2Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyDVz+Wo0glM21ifTIaAQLz5zzbJ4yr5G1m
 +ccpl6RbmeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1SaPB/94hhSkf8Jfq26zR3Uyp0NXJas6waNJbiN+pOkZBHHRlnQxe7rQ/joj0RgjPdp9LKlQCQt
 HocVjc9oF8l2stPsKZofomcbU0siWNtQvToM4Hexmo1inJkw56+9LvCzkV3DyQxyJ6HsV5b5bas
 /TszfA+YKyCzumsLkXZeIrzRRj6Y6j9KgRoTExU3qbdpetocqYPQvZdxXVfGtrF7g35R7pd3XNV
 LQPDO/pKbScaPa6p2mdcBQyJuwBjBJRGTpui85u/vnUsbP6WmBTjxhkr398LsLkEU/DfUwRw6wI
 51kNIAw8g6l01v3BaUBdNMEF0bDUXxoyazke+ndUHonFfY8o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: WQjzYPlVxlNtKOr2itm1kKSEWahN_dFt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX7MGiyDr9BVIb
 j+V3HjGc0R7vZC+GzuKKE5Jol7uITSGpAqFuBZ2wfrRTMf/dluYeKwVyOEMVuDhSplPAs5Mayl6
 VJtw+O8c98kQ7167h9pxG20XVCYMnHF6SN8ZiS+EaNbqawkz5h5tqfSzKIu9lVvSSiISQi0vlYQ
 +kRFqY4eqGi1dQNK0qF/278r439WzMa+0tpKGNFSOh13vjNpOf87+XTGb9QiAVTWf+1Vkn4wStA
 VBolK1OM52ys/+yZp4Ege9oSUn+ZwA4YtpEYVHbtTd8GEmd/cq21eBRd8t6onnSU9rBR0gB//1I
 PVuoW3ADR975/57NznibQWCi+aNwzR68xCnIvOdKnE9KcKw2c0gcWMpkScjQCvn0MwiUSGUL5wK
 jGie9LU5DbThWgIZhTvHt3qduB9eUG23gIqCyZjGB04XELFDDeD//VeHrwsrVGA5B/8Gyy4g8BO
 /0gk2aywXSb9V7j5iLw==
X-Proofpoint-ORIG-GUID: WQjzYPlVxlNtKOr2itm1kKSEWahN_dFt
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=6966797b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iQqaBmfQ5YO45CrMvZcA:9 a=4tUkUnfIpJ8A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..5bdeca18d54d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3


