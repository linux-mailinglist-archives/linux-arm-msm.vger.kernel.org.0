Return-Path: <linux-arm-msm+bounces-75674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D005BB0336
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 13:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC51E176274
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 11:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7236E2D9EEC;
	Wed,  1 Oct 2025 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gha6A2D2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0BF2D877F
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759318714; cv=none; b=nleTcLH67sU3aRyo670aBJ1bqZ46rqn67ACp4o/Yqnd13HpgVR0FMGjKt2a4eYXu5Q8WSzgBM5EUxQu09jDPWK6P1hZzMpi4VfXOb/rxm9ml2xFaeGdqxEZLv9PLb9K14sF4beTMyKGz3I7sDNvJMmGJeTNY6juU3kjpp4iynfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759318714; c=relaxed/simple;
	bh=9ZvSGMpPGnK7VVXjn6MKbn86JCCr6aXxG/+dB5PGOO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gfp1n2S+eDpAlk4VP7udAKBHSMX3bkoaU+H50ATHbAu6jcdQPTv8hDggI9dx4pziT2RE3gseE8WYXdAplORI/JA3bnwauIflLbm9LDIygR8yskNBHf2MDJk8VD8+c8KDBUdIN5bEdEUtrDcMKJ/YtyxIVYnpeMiUdX8JiQOzS3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gha6A2D2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5919Cc4N024104
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 11:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lyph5tNp8pQ4OzoN16KiBwnev2tHz7WupW9VSeqcMCo=; b=Gha6A2D2I+g1IyFg
	jQqgjMK1wG2btSNih125oFn3itDPsYxA7RXqadV4U3Ryp/NLNYwf8HWimUsbcD4m
	RnJPYytCEH7c9DgRf7WxoMcCXoqnkSQFq5Z46HwfST9nk4IWIfxRC0nGBkaaqu0+
	7nahJyZOcnchO52gU8cnfESKd4X7HzQdb04adsCKumdypY+P3qy5csndqkQlMMal
	q3PpaYzYIwXZqRrSKEgBag2ygFn0xgygjvCxroLn1ZrYt5oCcXKXIr0zGFv5T7C5
	IXIEexfNq4KW4AByEaqujarV9K40v5pWh2TAb0IphExvmt0hqnE6shi5QdfvsEQI
	pM7KZg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n4t1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 11:38:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ecab3865dso10075394a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 04:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318710; x=1759923510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lyph5tNp8pQ4OzoN16KiBwnev2tHz7WupW9VSeqcMCo=;
        b=TSyP3rX9Muhmfa7ufNSYizfMGeS+tpnXlkOSqgozR1QIipsvKDsFoUL2FgMC97HpNz
         1zds2PAL0bz/NCRu3zPC2w27s+Md8TVhLn/Ojqmgvns03gM+hslLqRX2TtbhrYwH4zHa
         8VvCASiGzDgleMOAYGkMU4HogEPX3W7e4udF2nyxHK+EP1h3FE9aCxOY3D5Cjfm1dZr7
         wBBidpNxeWFEd+slX2zsRhwLYjqgiUxgTAG5y2IUQyCpCh3846YRIqjaakovLPbGEQ++
         L8iCHHbG1ENRC7xIpR5UxuLpOgCVvQMocO4/DjTaGzEWeQYcDK2U8Am1vMmdpWW290Wm
         7H3w==
X-Gm-Message-State: AOJu0YzSuhNis6Hd5AXLzvEmuta14IL+4mzpmUrg2ByMTk6yQaSzAF3t
	BzCoYy1m7A26jg2VOREK7CQDmzGzEZAqi5SmSB5DRIIRRM9eTAPfFsrqGDHZDnu7o7U7qjTG24H
	HUwc4MYql8/YKHrJslzKLN/iq7p2aLzULYDqvZkT8gX9Xoz5nUTj9wsTtpVKcR8GvryeKYEOVTu
	CU
X-Gm-Gg: ASbGncumW0AhRL33qWeVQytpjVnmNMnHmqv51Dl2PZpBBUlaV3Gxoj2+BFR8D1MT1Xv
	2h8Id3z6LHbdjvfpXlBv0qt+3aDFYxmFsZ9Q/Te7gi+qiSMtJUzBiPX6b5NPfdm7WnnYZgdKIaE
	kdBqHlbKL5keQ9Ibik8W5M3/sVX2wLE5tcbXSwpavZojSgRmK1r0ImiesyCxCnr5NtKKxAILEnX
	K8fGWgfe0VKz/LdAdy22+UaRXgcm0V7+CP5ebpqLgReBfkFvXZgnfa5wjv3CXznfxHWeXXl6qI4
	EeI/KY/MeKfQ0iYXQ3+sSbs9xNaqinVJ3WDiEoGMrbqKEZM+NqvrhxmJM/Bfext/AySWZVXS3F3
	59brn++8=
X-Received: by 2002:a17:90b:1642:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-339a6e75e28mr3163104a91.13.1759318710151;
        Wed, 01 Oct 2025 04:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqVi+dCk7+IbRNgq6QRUG62TTtnWfhtQXxPs6teeYKYZCwjTVOjzt4g+1y74h3nIYVzSFkVA==
X-Received: by 2002:a17:90b:1642:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-339a6e75e28mr3163068a91.13.1759318709604;
        Wed, 01 Oct 2025 04:38:29 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3399ce47d7csm1861646a91.10.2025.10.01.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 04:38:29 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 17:08:19 +0530
Subject: [PATCH 1/2] soc: qcom: ice: enable ICE clock scaling API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-enable-ufs-ice-clock-scaling-v1-1-ec956160b696@oss.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
In-Reply-To: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aUSZR-dC3m0g1y0VTyFAnQmZxRw0iGdK
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dd12b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=QjoXURTcySDqg8pLkwcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: aUSZR-dC3m0g1y0VTyFAnQmZxRw0iGdK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX7y8Ht+7E0eO7
 bfaXiVV2LMrBLfeiYzELH0xQqaL090sXWaVp2E+vS0DbRzuOo06zvBBOthy8jnHZ46mYpkJTDck
 hlFZ8HkxJzS7qUyGNXDhc27FGvRC7avv0whq525vcW9ZoXsVnnxW1JeIBV9Wl8mS5bAxSLUApo7
 CDOsqlLSADOY89aLsV/I8pGzdhwvn7Mp2N9aCgONg+mY5qp8I5tPDAF/yOz5WjFoe9rKOBBOajY
 K7g3KUy3NjFQ3gXFpDBzVmOlC3S/gTuheK//YMSgumhlfLawnzOk5nHTffnUGUWymGVvRwY/rUD
 iDY7oWmHudJiPu+lKHBundT2cwaGh/F9mlPAg82zc2Pk1jYi8BoZfQnzNSQ3Wvz9yhyxjBGP5zZ
 Z66cN9IEciDOWLg2253LADFq15X6Yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

Add ICE clock scaling API based on the parsed clk supported
frequencies from dt entry.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 25 +++++++++++++++++++++++++
 include/soc/qcom/ice.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index c467b55b41744ebec0680f5112cc4bb1ba00c513..ec8d6bb9f426deee1038616282176bfc8e5b9ec1 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -97,6 +97,8 @@ struct qcom_ice {
 	struct clk *core_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
+	u32 max_freq;
+	u32 min_freq;
 };
 
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
@@ -514,10 +516,25 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
+{
+	int ret = 0;
+
+	if (scale_up && ice->max_freq)
+		ret = clk_set_rate(ice->core_clk, ice->max_freq);
+	else if (!scale_up && ice->min_freq)
+		ret = clk_set_rate(ice->core_clk, ice->min_freq);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
 					void __iomem *base)
 {
 	struct qcom_ice *engine;
+	const __be32 *prop;
+	int len;
 
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -549,6 +566,14 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	prop = of_get_property(dev->of_node, "freq-table-hz", &len);
+	if (!prop || len < 2 * sizeof(uint32_t)) {
+		dev_err(dev, "Freq-hz property not found or invalid length\n");
+	} else {
+		engine->min_freq = be32_to_cpu(prop[0]);
+		engine->max_freq = be32_to_cpu(prop[1]);
+	}
+
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..b701ec9e062f70152f6dea8bf6c4637ab6ef20f1 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -30,5 +30,6 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1


