Return-Path: <linux-arm-msm+bounces-70980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F7B37909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 06:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D7C3AED17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 04:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C43D27AC34;
	Wed, 27 Aug 2025 04:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWp6PEmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F812BE04F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756268457; cv=none; b=NvGOsgSexRFZLA6vP2VoZTntqAZv9IpytVeZGRY9Ecdm/qKqE+FQS3hmngVDYrmGOWLbUwCOoIY0EvetYsdRHDPVTDZGsbQnup9rpBuQM67/AK54z42cH/Ol4LsDFdtaI851Mz2WTGyLPHXIdKklbgwXvS9xk5LiSvxPOmO/EJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756268457; c=relaxed/simple;
	bh=xN5aoKqkzdNrpFq90kBel8vDcXnD6KFAzDt9yvkGQSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rWC/79JksUEG48jvgjfRG4ggkZVSpQ6V8TOaX1xSHUghEl4uYklBzwWUuY3NmOI4vtomwLi2Fxi5VAhnqVTA47opMpk90HFwNf/nwf0BJ77+HxMam0sZ1/RiT2VbdZqkJbjhHZFgdO/qjX74X4WFceowJ0I0vIb/ND2kj2ivLG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWp6PEmf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKakcq020705
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cgG9jC0fRhi
	ZdyvHtCvfrzjfO+AU/dNPrDX32M3A0k4=; b=OWp6PEmfY8HzuLFpF7XPI6Hutvn
	383bVACz2Qb5cExMcKHEYsA4bCqcXvZo/rpaZ6kmFl15rQ+qRcYfgFSU5zeseDIN
	qr2AwTQJj5TwgXDwyxRU4i/HRWBp31nWBAJl0rBWWhBhric1WHFEPaGA0893oUa6
	C2uPPs4Rb1eDdR3dTMGYPZ4I1gg97LBbv41ZUV4aqed8AiK6izXE4Z7SF1sy0rpw
	hYaevd+vWiz8kxE4e0PNZwyjdwN4/jKkmDjOdGS9pTqfhhJ+CMaRto7Qi1UfKMkO
	DuV9RuHGKN53m/SXh3LcLnpTYMal8JN+tZNup67bpPt3CFuOD4D5lwH9SlQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8bex0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so6495980b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 21:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268455; x=1756873255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgG9jC0fRhiZdyvHtCvfrzjfO+AU/dNPrDX32M3A0k4=;
        b=ISHdItZZsXm7r+ALWynLTqppHHGmcnMj4FGJaVA0mx2mX+Syq/hDq79pwFd7THNQEp
         8ppLmp4EeGn8flnkGsNmyZrGOSa81bfE2XyPUspm/2qjtCW+R1DHhkBEkTsH2JMFItwi
         1+wOmRzH+F0Vk+cLunklnDwT19Y41z5kL4/X75G81vML1Lxt6t2ahSZ85yXKb1Fg4dhZ
         MyBE9qkdZIiN25ocfdHBKCwrWK7QXLvFSH5RHzXr3bjTQZzT9GQxBRSsthhq0zGLnWCe
         k22ELjOWyI7158nL0uDlJNpv3Otv7iuDH1invvNIlOAIQwRPG6+ajaFntQwk3aFO9KWV
         hncg==
X-Forwarded-Encrypted: i=1; AJvYcCX0r9PqOmr3e14Ws8I4Y5KtoARxvlf1W9X5BapY0AblBTQNwTF9T5yaXiA63/v52Xh6ByQZU/qYPQqegMKO@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvZYzVW/wJlGyG9+9RcrLPkrKXe3GCr6Cxvdn4awpy5p4cI32
	83ABWDJx0CnGLPW4LB88XjqoUKzVt/S0UNDm7ab6b64C1arROeuDcqOWnLZRVbjr8dpGTKI2cpo
	SBrZtBtZ8e3KP+OOX2L7Qe4zyatWfA69jIiWt/B5Qy9PdTIOInXd73SRRpYqv0N47PcY4
X-Gm-Gg: ASbGnctB4mbrQ3cvPwiTq8AWxrEiqT8TaehM74FDegbouxExywiqXsfqsVEFUUvlehH
	CoB5RQo4n+rDEi4+hG3hUbvAsOc8iESAuAV2PKbfxR5aglhhj/ictllDakx1pKa5a7zOMnjPCnT
	lO9WPHecdXw6FWDpRIrP+iw3010MWgluD7SayP4B9OnoC2EQy1C6RHna3A9ZHfhM7mQt9ILN7VN
	N247CJMOb779ic30R20ZQ+rCIXmp3Ab7wxmQxw7IpurGBsAqis4z4bi54S1JH18Iu2okHrWexGc
	aZDst4/I4H5L2uzA7lMJf8OjKgg83e17XXTlUWC3pRFRIPHfYNROZJgKi2ysAvA9T23mSs9hhLG
	OkiM2WSwB8qR7DhlFzdX0
X-Received: by 2002:a05:6a00:b4f:b0:771:e10d:813d with SMTP id d2e1a72fcca58-771e10d83f6mr11712091b3a.21.1756268454717;
        Tue, 26 Aug 2025 21:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbYYxd6uRKJhXpbWdWQeevt5PKMUN9Cf+ngWv6eWh3hbHw3ZL94CizAJIrwirDo4XyosfX/g==
X-Received: by 2002:a05:6a00:b4f:b0:771:e10d:813d with SMTP id d2e1a72fcca58-771e10d83f6mr11712066b3a.21.1756268454230;
        Tue, 26 Aug 2025 21:20:54 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/3] coresight: tpda: add logic to configure TPDA_SYNCR register
Date: Wed, 27 Aug 2025 12:20:41 +0800
Message-Id: <20250827042042.6786-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h7iZLd9xcClMuth57adPkHGQVAFR-gKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX0V+DPWIg7TvV
 kjxvT+rjENjGQCU/MbKvIpNbehwopFmdJOQsYcY6I5CZpwLjFDEYWR4OckqcgjzkogMHSE5j8TL
 aVgg1UkDGxE+XZLogyFiosvBvgmDFY9bCkYjyGf7AFW6LnBVSzc3ivr2JsM6SjiY/x/PAUm9KgI
 VYJ9X7ybCgIqTh6sPIGssV5uuxt2QVa8Uir0zZGOkCmBkNcxCWwn5/RNL9McMIPwuANOkCTlnZD
 LGtdUioPaJlVcs3S3wxzkUR64DOFz4GEZ7EYsL6/lGtmpPpLiFbb75gvVJIjXb1vE8Xst9ha9h1
 eByEqRfbRHPK4Nh+q9nIFjs6bY7rmwSyJojTcWmSQGY/R6psG/3rydPIOUuOG4ugVVkJJ8LYqMG
 Y40LWJSo
X-Proofpoint-GUID: h7iZLd9xcClMuth57adPkHGQVAFR-gKj
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ae87a7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6Dbyrv6SX_ztr3m6kfUA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 7 +++++++
 drivers/hwtracing/coresight/coresight-tpda.h | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 647ab49a98d7..430f76c559f2 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -187,6 +187,13 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Program the counter value for TPDA_SYNCR */
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val &= ~TPDA_SYNCR_MODE_CTRL;
+	val |= FIELD_PREP(TPDA_SYNCR_COUNTER_MASK, TPDA_SYNCR_MAX_COUNTER_VAL);
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0be625fb52fd..8e1b66115ad1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -27,6 +28,11 @@
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL		BIT(12)
+/* TPDA_SYNCR counter mask */
+#define TPDA_SYNCR_COUNTER_MASK		GENMASK(11, 0)
+#define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)
 
 #define TPDA_MAX_INPORTS	32
 
-- 
2.34.1


