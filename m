Return-Path: <linux-arm-msm+bounces-69779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67CB2CA08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47059582E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 16:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6106B2C235D;
	Tue, 19 Aug 2025 16:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXRdml3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C612C11DF
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622530; cv=none; b=NFd7u04Bw07SwS7ioSeRUhVuP93euEvjBe0ji1tthmsTMZOrQglmkrE+8p3Y0XmOpNczMt+JqheJCprZgwSiYs8dBGo+jHQ7ZoB1kEslmnA9oGooyCW+XetrLF3W5/rRIAvNT6H1R8zOZ2mQDbO8cTRQ8nrfrhgWQzdJIbJ4yQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622530; c=relaxed/simple;
	bh=/AflHXTFVOH16SOW2V+0meYRbIqCERPZj2WZC7Vo8H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPgS+CTMpENPsJbeWK6aB1sEg9VQIEcK9fNfG/xhMA5ndqD60BU+EXybyoCpg2j5FbRsNwoVG9axCGRMF97lYBcGadZbkhLyWCLlkofdSw5gzmEzfTXH2hphpvQ3hMhi7TL8F8tMk54gG+jvjhyAnbB3vfJDWe+U3V+TVo9GQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXRdml3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90b22029822
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pXVD6URM8iG
	tLYeJuDTnL3ZNXgs+m9zGa8usL8h3epI=; b=cXRdml3mbCs2lHhaZJZzWvieN84
	kUS2hI4UYd+t00HXPun/dT3q0wvOzh+VJZq5Sz4z68oWu6692DeoM6iHmvklrRvk
	3kO1lhs7ViWgxA7Tc/8A06DVdWK60h+dHVuL4iS4EVmLd7n7orD79MAnQhiq9Vea
	x8mZItrgJUcJNZo06G0lcAL8rfbWcfRdZwY4kzuyGkAAMKVwMehXWpGYZMQfcL8c
	983esjVm9Rovo/ji4enBKuQseE70aQHRkDTwV2jGVxXPg3QtFeb8XiXiB3pkMrAK
	rdh2t6kW9+ewtdHjPflu6mtlmLLbkbFSZzRHSfsZ+kIrBBC/BRbbPRx342A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mh68n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 16:55:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445806eab4so58151935ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622525; x=1756227325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXVD6URM8iGtLYeJuDTnL3ZNXgs+m9zGa8usL8h3epI=;
        b=Mf44M7j+2RPhBwdU2YpxwFKIR+ejWrsZdsdIoEbMQeRkDtxa0DHtzvaQtuc6HjCnBe
         w/fHXTOB2T+IPOSA+5l2pfycCzv5SW3ueKpd21jG/2JaUzsKOcjctgMkiwVE7bw8mJJg
         6mzNorWfxAvEsIlpmxwlid0e49mUc/gjAXHxyRM8HPTbXQU2ss4KbJsUW7rXdNp7mAnJ
         9PtNXk1M9lCnHS/NPo5fMTyrcQqo+dNdLZjhJS4BbTYTtWXmBwfBG9EQ0eYKeocgdGgb
         MeIw7bVJUJ+3MrVGru4Sn/Czi9cRe6sntNMfYj9+Ai1R0afhb5CR1YUY8F/R1quUvH6x
         tAag==
X-Forwarded-Encrypted: i=1; AJvYcCUIGEBc1gFMeO/51ywpa7h4ZDiNG9UfbdpRfhW36wzFFCxEwI8bgvoIVK0yC43koiB3rzAtFxF/2BqIQtI1@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHylOdTmB4PDzmSxqHzrk8yEhmmsqu4Cs7WRpuq2wCbPB5Tn6
	6CvKsztP2OTOE2bnpelJEcEN014zLUilyU/SYAOqFfA+sYbqwtmCcRV13qx3O5vQFnTHi00eYQ0
	Kqd8tEEeu0fSzdazgbbHjVRLp0P1hR0vEtHEu5Khqzfj94uCPw5IN4pysw6g5s1ztz94z
X-Gm-Gg: ASbGncvX+uKmbnFXavMraWum4f6PhQjj00VlgdThAIA1gTRCriBALlIZJVgxWxGbMyG
	C9H4zt00mEBV5s+rW1MO3qzmYjuvhRQ7Tx0wnjLMScVP1H3B41eOfI9z+U0nrdEOBgPrj6ycNCh
	7UJEP5qAyBxW+aIp7PbBPD1WpJsYWx1i+QiNoqEL5E4CX89O5m3Y+AjlOlMPC/g/XHon2h443hE
	afcRybl3X9PWdKTeVKn+/Y0CiBrMbKtmOo6E7ud2uUYbpUJeiCzGua1GTNP4ag2dwDluIfUNKV+
	0gr0/c9zOf4jwZmaxcGgq+oy0/q93hA0cSE1pWQ9JV/C6Yxt086iOhLpzsUPyy35ygo=
X-Received: by 2002:a17:903:198e:b0:240:967a:fec3 with SMTP id d9443c01a7336-245e0484a9amr41225475ad.29.1755622525329;
        Tue, 19 Aug 2025 09:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+lNYppywDdTFFexVwLhEK+BRHzaI9WsoHo0SSwLAnNl6dT+h/o5sN/sHh1+Wi0XAryEA6Lg==
X-Received: by 2002:a17:903:198e:b0:240:967a:fec3 with SMTP id d9443c01a7336-245e0484a9amr41225205ad.29.1755622524920;
        Tue, 19 Aug 2025 09:55:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:24 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context initialization helper
Date: Tue, 19 Aug 2025 22:24:36 +0530
Message-ID: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a4ac7e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3w5JJ7MTCOpz5QvkTaEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: UCRL29JyrAMaTJF5e_l221OBSYOVIGJ4
X-Proofpoint-GUID: UCRL29JyrAMaTJF5e_l221OBSYOVIGJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX8JgxkU4YfMGy
 f2j15c8F8vBj0gnMIHy163LHakpSTK6TpDyz1Rtl2IF800pwOOtE8B+bLNfHjOhqGxYB1vAtPoU
 1nJwYjKnX/8XJ4ApNI1/kSdjiiS1EZfdsQ1K/+bwToH6CItPmB3yPvHnTo5fdrRKwDg9kItuB2S
 Uj0/yI8p3tVbB1+zmrJnEQHO1ixzd5vCEWILtX/e7ZB5kUcbJLCkmmFbdfBOWkTNL3mkoKnMYWQ
 tUyIXu3WOL8ExRjs1t3CtB6OrOBovS7xqUJQUUszTSMX4xUu5zyDUn7PlfobyxT1QSNQ5F99tFN
 SxTVdUviRaP0hNUrZg3MyTNzFL4JsHDnHYem1W93Dxx9jH54+5B4h00zmmZTwPnGztCIVDxK3vN
 UJ4KfK2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain this context until
authentication and reset, while non-remoteproc subsystems (e.g., video,
graphics) do not require it.

Unify the metadata loading process for both remoteproc and
non-remoteproc subsystems by introducing a dedicated PAS context
initialization function.

By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
across subsystems and reduce the number of parameters passed to MDT
loader functions, improving code clarity and maintainability.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 96d5cf40a74c..33187d4f4aef 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
+			    size_t mem_size, bool save_mdt_ctx)
+{
+	struct qcom_scm_pas_ctx *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->dev = dev;
+	ctx->peripheral = peripheral;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+	ctx->save_mdt_ctx = save_mdt_ctx;
+	ctx->metadata = NULL;
+
+	if (save_mdt_ctx) {
+		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
+		if (!ctx->metadata)
+			return NULL;
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286b..b7eb206561a9 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_ctx {
+	struct device *dev;
+	u32 peripheral;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	struct qcom_scm_pas_metadata *metadata;
+	bool save_mdt_ctx;
+};
+
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
+			    size_t mem_size, bool save_mdt_ctx);
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
-- 
2.50.1


