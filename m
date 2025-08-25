Return-Path: <linux-arm-msm+bounces-70602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF20B33C4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 12:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3511898FB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 10:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA792DBF69;
	Mon, 25 Aug 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgBreqjn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AEA2D9EDC
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756116783; cv=none; b=mq7zbhlzHfPZPvHlQxVHwdhPlmOzP9MiTZ/yVq7xcFAPPsf54KtOArnTrk992nDmQxBN0dG/RW9mvpBPThP5Vg6bN2NcmIPTTLTNDvMInVRilp6elBaFbOTjVInZQlIU3p6Wo26auapK1J3+zKSYFKOmMr+uUMcpLzAMr4YgInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756116783; c=relaxed/simple;
	bh=4jbF4aF8Fyi80mVx2EMaOXjSBRT1sA2h5/KbZLp74h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGmwDd9WK15aPJrE6QEzbP0n0IPUyV/+1qW+kt6KxqJRbwouwS1YY4GZIjeTMWObbyHbZudvB1w2FN5yb2VcUOTrzOISQc3ZemYA3PcqOlT4KslASeuT6e+gv4eLLdQeKqS9xd1FnEm67PAj2JzijkVR0vZYvrf7r1r0LWRLzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgBreqjn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8PUku024070
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kSGpgoMKAE4
	/OLKOS3q3sOnQ0DxnfDEvngbBHIulXJU=; b=CgBreqjnqvyLnPdjIEgF35V2jTD
	nmTpB8vwPs1vJW16L7LKsp2h7ZFliiESzj/+uPQx3VqH/5w95M1v47ItE8WK619o
	7vJR6p52uIFSKFDL4XiCnr+8U98H06Gr8DeNtyjDclGx1XLkMyts4t9sR8sFoN/t
	jaGaLW3wmjb968IvgvNSJRzVx08havTquhSYg83GWnc0XVkSSup82Kv0u0JYYCpG
	sBhST9hnFiQkFDCFb7EomHzD+2A2FuqaH3rOsK0TmmHXcf/Yg3Z2fU9QQpp0cqy+
	ilcgoDr+qkqUq9Z1NvrItPvdT1jY4w7DgNSd9vwtGQFwxVjRGe/N9XWnf/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uc4m1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 10:13:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70db3dedae5so40377946d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756116780; x=1756721580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSGpgoMKAE4/OLKOS3q3sOnQ0DxnfDEvngbBHIulXJU=;
        b=NrFK/lI4CDdcnHujPA7FQeIeEX/ccUZA8XDfju3/qhPO0AG542Qnz79td2RQYNkZYJ
         tSXSVkzqty5jE6OylUEqqi/pTtE7XSQRf4RxhYaPSaBPvzca9/7THsy/6YYdYBQSKCQ9
         rTFfZMMk+mafFrRHpgHjIxAItbb8hmOMchbVHTeAo2PtmCFCptaOdR5lg7Y9ga87voUo
         aLpVXuH5FG42C4JNIz7sZTJqKZAJyXOHKwDh5ClB+U0SwOjDtU6IrvjDqdZTBV6EGTLK
         k29nVwu1VacqMvHXWvriP3dF97jVC957c6yGU5iFxIpDCZnHA+8SckZUJX/49atp42Wq
         azIw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ8tLfe17dwwjXqNqUBV8kzRYDWsT0fY5PSZxQi9PTvNw/Rgpf9LisuNRv/7I2H0qNWc3mvh3DQwalwGxi@vger.kernel.org
X-Gm-Message-State: AOJu0YxDZWdYnSasiKxy5o1Aw1E3gKK0e6OEzg37rKk6YfR+dMuv5RyX
	jbONWv+0wzmr6cAABL6pUt05FrDgA8B4k+8UvULxV4Eu0bbo/G8EHU8siCtwCk1XX/2Bn+hkdFt
	+EepEPLqJIJ2kXBNJfBd4YHScIfBSD0ZFXbm6n8yVsBmSUpXw8J/KvfIGg2cAywUXQ1J5
X-Gm-Gg: ASbGncsRjnccj4tyDKYzr6KA8RYzLvbgLvGTRb7cyRSdZutfDTF+dZkMSuiRnk8KFwi
	iON3q+mXyY5/j5xljdzUmMGndfCyS1VNtl1unIo+AI8kKvexSIUsphTx/O6x6XqrlI2WNYQKRkr
	3fBxUCLJCix8s+gdB8pDX50uJBQ7KYCw6v83Uxso/KZRvJWpW6pcg2qfEpxVh2PjJEBmvmO0oeO
	sK/jQcoW9msrPVBqdzEuY8m1yhQPnhejvjddVx7mbrIVYC6WOMh4aaPIw2UVsWFdPA9BuGpNLE0
	G6css1sn9AaghJh8dM9VRRyNf4f/JqZHzPie59wopI1hnF0GsOebDQ==
X-Received: by 2002:a05:6214:1d28:b0:70d:b2cb:d015 with SMTP id 6a1803df08f44-70db2db15a5mr57117856d6.67.1756116779689;
        Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOnY9gws40NRoxP1ky0M65480RnEkGn7SLBORQFmruM7OnjhFUae7l7V+Z3KiJbquOo1nbOQ==
X-Received: by 2002:a05:6214:1d28:b0:70d:b2cb:d015 with SMTP id 6a1803df08f44-70db2db15a5mr57117556d6.67.1756116779189;
        Mon, 25 Aug 2025 03:12:59 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6359b8d6sm5798645e9.4.2025.08.25.03.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 03:12:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] ASoC: qcom: topology: convert to cpu endainess type before accessing
Date: Mon, 25 Aug 2025 11:12:46 +0100
Message-ID: <20250825101247.152619-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250825101247.152619-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+RRWi987S1Fv
 UCCV02DnOZ89ToFbMO7MPvEngQuV9+itI76cUcjPhOyHsYUtYlIxvZz+S12IrspaYDQr3MThhcM
 CXZdamLqdnLrQ0QuBtDg1zr/IEgEZhIx5mo2f9aVgAj7TEpaqapNX11gzVovlPbgGdJJw4wi10Y
 mOjVpR+D22pV16J1D/Gcch0Bx4/iWJxsNDH+nT+db2KQ93I1ir3Ug+F8WbR6r7VP1P4FwLaVXW0
 2bnC/RNjzWXErPQnto29HweiVmh54wbwUxkFXqaqB5HnHYRpVgA4Tjh201btUe56WNfQ33zUf7s
 2Z16x42uQHfZVcmSDlmVYzFmf6GszLbwVSMhl0op3oRTC2J8KLRKEInSiDCfx0/0Iiu84u/MK0K
 fQbA2pqF
X-Proofpoint-ORIG-GUID: eWOzQ3RQ-jG730HAZsK4pOAL0lUv9lrC
X-Authority-Analysis: v=2.4 cv=I85lRMgg c=1 sm=1 tr=0 ts=68ac372c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=OR_sDe2PA-1rWwznPDAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: eWOzQ3RQ-jG730HAZsK4pOAL0lUv9lrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230032

Looks like some of the members of module config are accessed directly
without converting their endainess to cpu type.

Fix this by using le32_to_cpu() where required.

Fixes: c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static calibration")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508230741.heXmHeDC-lkp@intel.com
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index c2226ed5164f..f61285e7dcf2 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -314,7 +314,7 @@ static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
 		struct snd_soc_tplg_vendor_array *mod_array;
 
 		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
-		if (mod_array->type == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
+		if (le32_to_cpu(mod_array->type) == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
 			struct audioreach_module_priv_data *pdata;
 
 			pdata = kzalloc(struct_size(pdata, data, le32_to_cpu(mod_array->size)),
-- 
2.50.0


