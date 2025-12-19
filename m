Return-Path: <linux-arm-msm+bounces-85816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C721CCF4FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA56330D2DBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74623009F1;
	Fri, 19 Dec 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ndl0vkEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IwFBeaeh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6E630147F
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138916; cv=none; b=dkpUqqCv2FsP6k3pgvH4zvWA2jt/PcHYF42oIb1X3kdW0mf0klQSMAeEIUBoCU+jGxeTiiSlwxOqUygPi6qwOu9ZU6JMPtYZ2N84EWe8W1scl1ysoV6ccMWlmqLzVy1jYJnybV9FNtcSDdDIBWu1t4SwZJLE0BZiAXxy6JJQTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138916; c=relaxed/simple;
	bh=7PMKbHeEm/om41ZfOgXSUioL9D/Bfv6TCCK90Aa4rTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=slVgAW1JZ/bWL1pfnyWUQoXj8qPD2h4OyYsr4pKPiTl3IgC3fs8CGIVhzAyE4Z+LRR9pzjhJ4V9ZuSlDnBUaCx3IcN0peGNzgwLO82W8LOws702ov/FMq34qOBbNf2zQa0UH0EIYZfPbAEm33aHw1NFOH7n4J5Utj4z79iDs1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ndl0vkEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IwFBeaeh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4bxsO4145265
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=; b=Ndl0vkEMEUdkCxV8
	N3ed9BiryJrCvZMjeKx1MFoIncdkjYyRZCT7C/1ZPxYsnYJqzcr4qeFxgPrV9AOI
	WcPDq6CJKJCQbzVPFlzQ7Hl+4b2IdLLD5eqhtZaMFUdZWJ61piZw5vvIWcQnfauq
	1ZVeW4ivGuxy4oRT4wLCpDTiObHhwyg8bHNJlCB8+ekjvl+N2d4PtNyUsk5F8ENM
	0um8PGcSFRCulClJxdy4VGo7+oImJq7dptycKgASPHxW7DT0JL00MNtzdo9wl3c9
	nachHeRsG6Z5Pqbe/eMQfpX4r/5ogG5cz43oqrwuH8GbME5FuzNiWzWTPL7CRsIR
	jScseA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dt93q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4ab58098eso19694191cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138912; x=1766743712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=;
        b=IwFBeaehHsEpIzb5mbV285dqQw9Q9lcEjeEHAzCfSVNCtBwrReQLMCa6/2u3VI/i8h
         nef5XQ5wfiVcZAyUX52M9het4nVDbw0FxB4cjp3xCqHDMgoLbMj1M4bMiI3mA0B6Dg1K
         xZl+cndDVVzuPzAa1m5ubL8Am5dsBGKvpyeuTNPjoUzt67oiTi1ddlFawDQVYoWilYrV
         jkb5oyQ+lvBOIzG1ehm7nNhs0NK0TI39ogSHxkxASMICoYUKAZmPwdY4JzBDqdr4o0Uf
         1R/YgORTdivw5TK8xDt6taO9ryVCtUJT/3MsF+DVapM8+Hb7EQ3WU2Hp4TDnt40O82ov
         cTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138912; x=1766743712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=;
        b=G/wGBwHRlX3WNdRv6fX4HLEaSojjryocA44L1WRJ6FZ3yCRnp+usIrsk1HC+4OdZgB
         OHNHcDzWQ8d+icwTSmJ+lVrpQP1jQdiDr3mOBLGFoo2/sQTO9afAAn49Q9/GwGoG21Sp
         YrTbXMCcF40luO0g/BbLgtb8DTrDtBwg5R1op3yiAfm8ixlC12IebNrmuaxwGS+upwhl
         A12F6+2R5VxM1+0zrU+IM163sYt2V3wk6RYIJIOXf7tsLjLf/945I9wkShBNUJDlWIg/
         qnNu0yx1DPwNOiuheZDb9yItPonJasj0EbjAXAlzDAjPaDBL/BvV9YvCtYpKgYSk3Bji
         Xi+A==
X-Forwarded-Encrypted: i=1; AJvYcCXP0PiZbF4+jl6xgIylG6EQN5H1TigiojNZsMD6bX9kq2V8zsewJyNjIdQW9m9Z+8RxrVjb5mSCz6z/WheX@vger.kernel.org
X-Gm-Message-State: AOJu0YxZS+CE5bNg3JwNxuQ/kfXL+x+jgkGHPWFhVXzF0VVeuW97oE5D
	WUpZKVmNL8Gpf12rVtZf/aqji1xCf++1R3OM5eA+zP5BnERjZAbM021X7qB7cmLFXFLgf0UgOwF
	wpU00c+1A0L6DlBKV548WNmSnFd+Og/1cJE8pCyPFCJCCKnd2g2UEHCvyoCNI8acdGyRz
X-Gm-Gg: AY/fxX6nErVNOBCgbl4MDbGxxzmoXiHGgTTbm0/P1XmDhQWlpN3YM4gO7neKP7X5CMc
	GpUy9ONkRibehKVGSZhE2iWtiz4wWGucO+nMY7N3tk8ksSWsi5FyAMwfqBXbUkLk1FaaJYmNgJ/
	UuUA1yKKCvorjZNBH5LNR0XuVKIfn8cL78KtC6ULfVN2sQdYulXP4DnsxOOGws4YXembEmw90Ix
	jGQmUsZHhdmgkvfDLdAV9XL0P+iXddyTxf3V06iKX3gMTcbCEgCX3IwYlaEb4bu1WQzQ1cHkhiu
	OlugZFr7Yv/AuG7VvQtCEnAvHgZ0JLWV7GbW55hWbJcGF8bU9FLQ0gNutZ91MuD7UKYGD9V6MJi
	bZxhgQyZ+tKd0Oh3K8RVH0hGTZoi7bBSHc55sBQ==
X-Received: by 2002:a05:622a:1b89:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f4abcd07c2mr28894961cf.8.1766138911786;
        Fri, 19 Dec 2025 02:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx4aU9c/3drBxdTal9gjRRzpkhIFGuTGGDieFoT8rX+8Th5TCaz2tgCfcXi74dOJfJo/j0UA==
X-Received: by 2002:a05:622a:1b89:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f4abcd07c2mr28894711cf.8.1766138911240;
        Fri, 19 Dec 2025 02:08:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:43 +0100
Subject: [PATCH v10 04/12] dmaengine: qcom: bam_dma: implement support for
 BAM locking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-4-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5035;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ky8hwlPnsaQJGL7zF3W8NhhDThxLSiaPym+IqXC47N4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQQvsUmiLulYKcMt7Dn+ylHkzG53fkNhxgDh
 wsQHoEoaTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEAAKCRAFnS7L/zaE
 w8MtEACG6d1PBtOtnqSSYotH582RdbHlR0LL2ik5vDSIR+js62LAIsEzJoNSGDWvy8NnHWcOP8G
 Hhp3DWitWgvuwBJav0rMhIrnnM5I21v33l2BozxeaehaaDe0qrKLbXXjiNY9oyeNk+RL5nKlImx
 hO2q7/2Gi0RxG8clBEpwLIf7hz/Fj7fRuDHGOayKJEU7DrclDToToh2lLeIH0pRmgqGOEKrYhps
 4Ob6kEhPgaYXhxZjSTgm0vd0nH18qcFtoHeqE/uHqsVOQZo9Ov6W54OU97ezQLev03fTOpoEISA
 CN63bP2hoXRb3jSa5mohRAaFwMOfoeyOf0gaDTqxAzBYVZL4DgGSMgy/p9CkgamWYd40fcvdTDC
 GU9ruIpkUtziXSF5ARJo6PY9pHZFuAUoimF6snHTxDY0og30re1TIUQM7zoxWKRTghcB9DvvPPJ
 KBzuu1B27Mhc69Ua+wR2Xq2efRxGxAqI1zbWngLUA32g+Ezdjbj7VnZayBxQflxDSncJFhye54k
 udwIt4afIkVdlnwrSacKjywmYp3mP1dxlI/ZkHSCnM0sWsKmzAQ0+WTxraBpJ8ZndtJL3TfmGo6
 GTUrxEIxSpIsIoqNdOhO5o5iV29MjT5/nQ+jjcTCv9i+oyFaqMa838CIku+L5qedOjfPnb4Znno
 vAPKN4X1W+sA6QA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: NEEiOEHFFvyIzSHVb_vyMpXbbEa9ss5t
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=69452420 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ff4Q2WZ4h2nLullQlX0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NEEiOEHFFvyIzSHVb_vyMpXbbEa9ss5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX595Kcr67L2yE
 CTKr5aW5scRjT8OyM+Uk31KUvVnYHE3/gWQgdQv3ClzeFqaUxHvJdmGNYg7L8EifqCHj4L1oXd4
 KKuIMnIE8QeLsPPAvhjamXccVwvLUMcHnWLgUlPor5hw7/p5018AiVgL/V+QwS+we0XTEh5F+vu
 vMLTYjEOJe4AuISSpP48KMoKk5XnVvbsIudA6EtPundNTrlTdxGXkGx0FOiX5yCNG2uwNqEtgKD
 MaN8VfPDhfD6i8aXpjcS5GTrRmG6jgwtc6BqzrBQx/piyljVfYlVu8bWz6wns60axzz+4GVN1x/
 WBDjv3jMHP0Olt6Y+C04YE/FGkPLxsB5+x6CymLAxWhYAI+JTuvMW27/Be+mS9LkpL760dFm6lc
 1qEJC0si5T5da+AXts4JKPbztzcxh4m9MMJXou8ctqrxAKCOlyh7d5cIoibaBz5GK8ScLXSRnzV
 YJXN3rkimcc+nHnb5sA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use metadata operations in DMA descriptors to allow BAM users to pass
additional information to the engine. To that end: define a new
structure - struct bam_desc_metadata - as a medium and define two new
commands: for locking and unlocking the BAM respectively. Handle the
locking in the .attach() callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 61 +++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h | 12 ++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 0ce9153da67032dc8ce910f68d1f80019d8b29f4..e35fc73a53aaa2a6b999b189add7d72df15ebf0b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,6 +28,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -59,6 +60,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -390,6 +393,8 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	bool bam_locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -651,6 +656,53 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct virt_dma_desc *vd = container_of(desc, struct virt_dma_desc, tx);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc,  vd);
+	struct bam_desc_hw *hw_desc = async_desc->desc;
+	struct bam_desc_metadata *metadata = data;
+	struct bam_chan *bchan = to_bam_chan(metadata->chan);
+	struct bam_device *bdev = bchan->bdev;
+
+	if (!data)
+		return -EINVAL;
+
+	if (metadata->op == BAM_META_CMD_LOCK || metadata->op == BAM_META_CMD_UNLOCK) {
+		if (!bdev->dev_data->bam_pipe_lock)
+			return -EOPNOTSUPP;
+
+		/* Expecting a dummy write when locking, only one descriptor allowed. */
+		if (async_desc->num_desc != 1)
+			return -EINVAL;
+	}
+
+	switch (metadata->op) {
+	case BAM_META_CMD_LOCK:
+		if (bchan->bam_locked)
+			return -EBUSY;
+
+		hw_desc->flags |= DESC_FLAG_LOCK;
+		bchan->bam_locked = true;
+		break;
+	case BAM_META_CMD_UNLOCK:
+		if (!bchan->bam_locked)
+			return -EPERM;
+
+		hw_desc->flags |= DESC_FLAG_UNLOCK;
+		bchan->bam_locked = false;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
+	.attach = bam_metadata_attach,
+};
+
 /**
  * bam_prep_slave_sg - Prep slave sg transaction
  *
@@ -667,6 +719,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -728,7 +781,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	if (!tx_desc)
+		return NULL;
+
+	tx_desc->metadata_ops = &bam_metadata_ops;
+	return tx_desc;
 }
 
 /**
@@ -1356,6 +1414,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..dd30bb9c520fac7bd98c5a47e56a5a286331461a 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -8,6 +8,8 @@
 
 #include <asm/byteorder.h>
 
+struct dma_chan;
+
 /*
  * This data type corresponds to the native Command Element
  * supported by BAM DMA Engine.
@@ -34,6 +36,16 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+enum bam_desc_metadata_op {
+	BAM_META_CMD_LOCK = 1,
+	BAM_META_CMD_UNLOCK,
+};
+
+struct bam_desc_metadata {
+	enum bam_desc_metadata_op op;
+	struct dma_chan *chan;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


