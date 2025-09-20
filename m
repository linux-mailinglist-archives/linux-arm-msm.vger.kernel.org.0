Return-Path: <linux-arm-msm+bounces-74296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6907DB8CF58
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C1CD04E0F71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E3124BD04;
	Sat, 20 Sep 2025 19:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRSqHBRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7241243367
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397319; cv=none; b=SBG1/Fvtzg+E7htdHxMnPKNNkqe/6zlAba3PEvKeQ9OrcQkUPpnsZgSpmCEM93iy58Cx9qM9Nyxn9G5jovXaEGXxoVaZNb+I0vcE3XBYNnVoiulZ3/M+2lDOUvX1TkpySV8Jbj/rv8dZZiqWssO0x+VxFTNfhEg+0eo3pc7+szo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397319; c=relaxed/simple;
	bh=3KgyjXRwRT0BZpOK2ZGsUpjbWGpx9hKg5Vj5ua5WIZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOFBx+sFYDcqJtcFaOPSD3ra6OGHwUlY4xbQMHWrxPa8S7AALOQZRvk72XIkl+cJ94Ix4g7fvGaCkzV2DxCM6P5G2VM2r0w/ZuAh6M4fmq1u3iZDhmDKfA7is8fuJCeJ7OP8AN+wEOpEe5fgnDQ1j4E+hy6N8NnRnNDx2+8IoI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRSqHBRr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KElwEn026806
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McnlfO8jRhsps7LRs1tZ8ulX+YiW5w0YVixmNKrFdbM=; b=fRSqHBRrGusloyhj
	cUCpI+neP6dFXX6eavHGzm392c/dmQY5tiTZdt3ABNnzjr0Nix2gt5RVkVQbQopb
	i5BNnGMQiKjteVPix2UU3bRn5DLaplRd9ZvL0U/8zEAvrpVZT5LRxTatZmvPu2se
	Tp9OrKnlgaQFz3mOFB7IR272HSUY0+cKivEFV1al346IrDzppQ0DbnA+c7x+E86K
	KYyzp/cFefB2zwf57gwBncMG1ryRIAr4ESyvzCuVJ518Z2fhVTriGCZi24RbLZYH
	Tjxd1IeZcLgu2TphQqjcrUlzo3srROPYiViNBgwE5dg2gBuefF1VZaVIcRDS4w9N
	PEfDZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg316bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:41:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-777d80370a7so5678189b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397316; x=1759002116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McnlfO8jRhsps7LRs1tZ8ulX+YiW5w0YVixmNKrFdbM=;
        b=ndiEnkvVI8hrqVJ3O3FYug9XVP685md9S7N7BO7cH7nZk/JNvHPQz9rkUqQuTPdUit
         5A67dzlqC2L0AUCIlt4gWUMpBqMVfIUXQa8mndaQBX55rcXlGrs7e/A8jRwxiOEZRHU2
         g4QnK9YusPbJOnJLsgA618NLYVWiHw+CU/ZpHz+f7lIWboU1SkoGwyJTroOLyd7u3q5H
         BYLZPeRSvegPmsEMZkv/jUUi/v8VwmNtugAwgNUT1tQqszXBB/s8HoAh7ZvyI1+eiqcL
         5WJRQOlnsyGhzPCppM5sJxt0a2lxXVJeuEP+rGC/0Vk65E+c7j643mj570SM+yBDmbmt
         rC+A==
X-Gm-Message-State: AOJu0Ywlk25JauwBt30J+X0Z8Mapi87VaFsIy7hi0YgzA5eVchod97CC
	ZYQAtF9y/SJshdrup96Svv2/Qqkhfms2+JIGMbsiucnZO2DmzrqbqjfS7dasidq+Pnk8nmK/VwD
	6cscgX75sBMLW8qT1Vo9BsbtzUD862j+QmlA/lJ7OTyTQxEwqaB0E0VCTqL1ovqHBuHdGxyb/XU
	Rf
X-Gm-Gg: ASbGncu4E9quvEwxm9qJSoqEpRag5LPt71pu5qLMr6ctpwby1jLyWUVZWpUqGvF3QzE
	I2VtHwumdUwCMPbw6PSHGsiDeQejvAQ55OGdHh5pl0jT/rx7v6olOanAtJXQkXjOOr2yDvvE09A
	cbPXFmKcBRZgk1j2EaqTpl9MRuXJwVIzPGrs65jm3yZYfSsnrRmRuvVwJUVRxpZvU+h/FAE+en+
	AA5qiAG9W20Yap2aiJPOSCk973IwS/+ZO9aVvuQjW9V17eGToPstxoKiYXstX+uY40DJT4xWZPG
	m6VT7/8F94wtUyp8SXFbFiaNigeoKc0yeSTVHfhuEzPWBtCDtkhrTEksiWsVd0SEW7A=
X-Received: by 2002:a05:6a00:39a3:b0:770:73ed:e6e8 with SMTP id d2e1a72fcca58-77e4eabb491mr8403450b3a.22.1758397315702;
        Sat, 20 Sep 2025 12:41:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqFpXp+tQNpf6lNmCxbEKSFzL9Gp5AmkkEhhm5zAukFjTYb67e1DuHAs/eB3e4Z2Nu978rMQ==
X-Received: by 2002:a05:6a00:39a3:b0:770:73ed:e6e8 with SMTP id d2e1a72fcca58-77e4eabb491mr8403431b3a.22.1758397315270;
        Sat, 20 Sep 2025 12:41:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:01 +0530
Subject: [PATCH v3 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-3-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=4240;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=3KgyjXRwRT0BZpOK2ZGsUpjbWGpx9hKg5Vj5ua5WIZU=;
 b=ot7silLD6yPh2qRLGAMTThGDAx+ugIsgiHp90QsHoP1/BP/cfWDdli+MGKwI7bXztXef67ejG
 AhtR0NQmwXkDyxO0RdMrVH1Y0LB/d13tTmQPnxwcbRfb9r6FqRwWKP5
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX7z+MuBl8ICmc
 NHNku6WXWY/26mPN4Fd5Bike9cOtifCOkQOANs82tgF8KAGZZUIwA52kSextd49Fgp2wHf6wdU6
 iiJ/3DobsXOYClHjAGR58myIqXtIThkNtjPZQKhdhgMw+COQE4ZxWjIwQJi1o81vxEFK9QvmiOR
 ljwzEThr+ZYs746SvbPPZlPHlVYveJ4Y1g65oD35Eolh5nNxoyzoRH7ysh7jimt/3JMOcjzabQu
 QtuUlhuSfn5a4ExmM6GmB+8o0gZdzHsvmxFQQeQBh1U++bYgxlDUsrSYU/bTQpt5sp7/rrDjjG0
 MqOjVbpYMjNo7gxUt9Rpz4py4YGd8h5Vrksxo5EYjDzlB+A7eDeg3vNWKk5VEblKEXNHCZnVKzI
 RL17wnwI
X-Proofpoint-GUID: gIbADs8v9OjeEIqS-ymf8iG7WRfvqFGR
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68cf0384 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=puzVXGv8aC7m67-pkSgA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: gIbADs8v9OjeEIqS-ymf8iG7WRfvqFGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032

When Secure Peripheral Authentication Service (PAS) method runs on a
SoC where Linux runs at EL2 (Gunyah absence) where reset sequences
move to EL3 and Linux need to do some extra stuff before calling PAS
SMC calls like creating SHMbridge. So, PAS SMC call need awareness and
need handling of things required when Linux run at EL2.

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain metadata context
until authentication and reset is done, while non-remoteproc subsystems
(e.g., video, graphics, ipa etc.) do not need to retain it and can free
the context right inside qcom_scm_pas_init() call based on passed context
parameter as NULL.

So, in an attempt to unify the metadata API process for both remoteproc
and non-remoteproc subsystems and to make the SMC helper function
cleaner whether SoC running with Gunyah presence or absence by introducing
a dedicated PAS context initialization and destroy function. Context
initialization beforehand would help all SMC function to carry it and do
the right thing whether SoC is running with Gunyah presence or absence.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 53 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 11 +++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 3379607eaf94..1c6b4c6f5513 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,59 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+/**
+ * qcom_scm_pas_ctx_init() - Initialize peripheral authentication service
+ *			     context for a given peripheral and it can be
+ *			     destroyed with qcom_scm_pas_ctx_destroy() to
+ *			     release the context
+ *
+ * @dev:	  PAS firmware device
+ * @pas_id:	  peripheral authentication service id
+ * @mem_phys:	  Subsystem reserve memory start address
+ * @mem_size:	  Subsystem reserve memory size
+ *
+ * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
+ */
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+			    size_t mem_size)
+{
+	struct qcom_scm_pas_ctx *ctx;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->dev = dev;
+	ctx->pas_id = pas_id;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+
+	ctx->metadata = kzalloc(sizeof(*ctx->metadata), GFP_KERNEL);
+	if (!ctx->metadata) {
+		kfree(ctx);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
+
+/**
+ * qcom_scm_pas_ctx_destroy() - release PAS context
+ * @ctx:	PAS context
+ */
+void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx)
+{
+	kfree(ctx->metadata);
+	ctx->metadata = NULL;
+	ctx->dev = NULL;
+	ctx->pas_id = 0;
+	ctx->mem_phys = 0;
+	ctx->mem_size = 0;
+	kfree(ctx);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a13f703b16cd..e3e9e9e9077f 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_ctx {
+	struct device *dev;
+	u32 pas_id;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	struct qcom_scm_pas_metadata *metadata;
+};
+
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
+			    size_t mem_size);
+void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);

-- 
2.50.1


