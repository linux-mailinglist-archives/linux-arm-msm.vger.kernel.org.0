Return-Path: <linux-arm-msm+bounces-85823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D3CCF539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DB223017C8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988673009C8;
	Fri, 19 Dec 2025 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxsuMCAa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jst77YXT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E9309EF0
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138928; cv=none; b=pdol/L8uYKagQj43RQBQoVYdNGfsWsGUREwurTTyTmTDNJ8q8yMfUwXxKf1N7eu0nyB/IjIUUBN+CI8ffJu9wPNEbTtr3B9IsHgEc50hOwU1Gd6dtbnfUfApjXDvSMydI4/LSkbxOV31VCHAh2dMWVe1i/lMiVXbgToeWn251kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138928; c=relaxed/simple;
	bh=BB2EwnpE1FWS4HbVLj0TsHxP1wTivk2ASCTMuoJe6dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=keSq/yto2q+vt3wIRWOQ2roIbsb5P8bAq/BbeWFClUttiGxgnt0PHuY6ZUnKRWCd80ydh9pAxduxiSul/+5CGR+UI4ikQS2MDa7kBeYg4gAfP1YQnJ4ugdpjTueIsfVZ+zi16UrT/hjHRFp7XvTEmsKHYcVx4iF9QP0/aCCXLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxsuMCAa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jst77YXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cAU64154551
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=; b=hxsuMCAabSsoZhh3
	A1coZJMjFeJ4AUI8Vun1G3+OtGS9JwexKQ5XyxD++pqPyBkVY0l6ra/jfnmBwdsu
	wujaBvUDQs6Kc4uWUq/sOd3Y6NqYe94SlGF77CBFYj2/xPdE4twSMCq3MQhRDRSX
	5YmOUZ2Y5IuEZcgfhFDsjRzNhN+4mqQJ4Ssw/djbDnuNVVJuUaLui3d6KV4KQlv3
	g5//gamYxKzlaCN/TpBK4kcO8Cc/9W2Zb0Z/RvUqtORCGzjnZt3RgEJX+19nVg+K
	k0gfyT7k3DjnLCn0IDovSK56sHNcBT+txKoIeY1UC7qqFtsPxMvPj9c5JsbwphPC
	ShN/tQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ct9fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:08:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edad69b4e8so32958021cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138923; x=1766743723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=;
        b=jst77YXTx7CXJkSDaNIh3UmENGmDqGckCzujgxPFvuYQGTfQRWIu/4VD42sI3/Q3GU
         c05kUB6cnBO70AynQ4RVJjX/po2QDTpUoYZMvGswqC0k12cxRYRBbe/Bu0ELAE25sLc2
         a5XTcCaZN7OyNFz9xXJMM8g89ennhVyJlWx8FKC9LFHFaz3XQRELAC7w4xW0D0acCUzm
         yy3zJqpxNumyQ0OlZk/M9kO+W1AqXeQ5P09vQw9xQ8XoJkE/l5TFlciv8ZnN/joy6uee
         k0nI6R5bkAucO7YU9JuetqqVj7lCaRalegE/JgWiDD+TvwKJwZm4At2LkBnKC3vbnR5w
         ZBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138923; x=1766743723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=;
        b=wCq8Dcqk5aVbzdV0zsI+Mn7002LRnz1cwiEKFIH/vcr661LbDvifiuocA5IhAVWGQX
         0FcVmE46bL9F+74DtftVs50oYu5gkZ6Bq+HBMVUg+40V7lDVKoiMWhuCMIgCNiJ95+nS
         TKZ4zHJHCyrUmpUppDvgo1r/oAzD68hPzE7hcbA+vJZx/AhWYqDP2GcvF9/IQfq8GmcS
         9C14bNMAii53rAE6PjR/tpCXU2YkaoM6TaedyAf/xA1E8duAOWhNq5+pnz0RgZHpLKPP
         /7y5CUmq6YbVmKCvgsjqCvp4CEbS2xhHl5JZspOtJMOw+CUKsihFXQ9zM7j3robEvnNB
         5GZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqTdlRkitSF3xNJs7XjMVWw3dhuKOkOnt/vGAKSOr3WmlaSQRaDT4tWrp+epJkP5MxoJqDeW9wHO/WUwpA@vger.kernel.org
X-Gm-Message-State: AOJu0YxhzoR7wXay2CETfCgbVfgc81Ismo13eQPDohuWQntf/55MxpAP
	S1W85YfcrUZDGYh22hORzmAUIl1LFW9VTg+JVtX1ErDkX20FDSNkQ5J29tWaHoQkJxFLkXUODO7
	68w+//RAGzs2/LR+yrogFu5xAHkzpEBJARv/wqfQeRpDNXf7lcRbDzx2gwwj8qDj7VV4C
X-Gm-Gg: AY/fxX4D4l6xcCvaZfWiWSyQrHQGulgAWIvg20321IYR9YsOidp+VS9sfojQwAWOtdX
	xXk1VPgTWIxzUkRfqmvZuicnadYcS//RWalKAgNyh/Ty2Z4TFva1BNLqofTquuCfjtRfzsIWH2X
	AhFNFeKrvM0LtZaWvP28S3FgnxOycGLLwo6vEGg5bA+j4ZuavxzhH7kNXoOGTBlRL4VzGe9UYPA
	39gsmwnYGdiHFmrJpGKQGS3XL8L217KyY1McJsOA2OkVoQVRqglQJfpjer+9M4iLqMhUy9zbhj8
	V+ypKp1hEYD2+BgG8G9O7kQ83mB/TT0ct7tHQwdC9t+HcFJriEcSTvhPn9ORfolq7qQHQF62BuW
	N82n55ulZP0/HmcdZFO6AbHSHIVVBY+/R2xl7GQ==
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f35f3b7834mr80035371cf.13.1766138923447;
        Fri, 19 Dec 2025 02:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWmwccXEHRM9v2aDIxhb+uD01c1pI0hDhCZLedzGqHYSUDciKqhQk9iB2ZCgb+x43vK5KTxw==
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f35f3b7834mr80034911cf.13.1766138922913;
        Fri, 19 Dec 2025 02:08:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:50 +0100
Subject: [PATCH v10 11/12] crypto: qce - Add support for BAM locking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-11-ff7e4bf7dad4@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSOjSpLnp8hi/ybwzozpW3l6rKGzZUMhQm0FWWcI8KA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQWPM7l/1lxH1CHPiAiUivnAjDvIqDU2EKcd
 9WfR0ByfmyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFgAKCRAFnS7L/zaE
 w7tBD/93y0Vezj07ev44/k1PnOo5R6g+0U3UsZXM3EyOhGQ6tKFjY8j9VB2pGGYBnj6889zxNzA
 ZJyXzIrrPNrHBSFoXOw2sXRhngdqFnKWAVhv6ZDfIV9mnMKAZ0fHAAqa2jVoHtfCodf22IEB3at
 QrNhIgtk7J70l5uPLN4cEpCqYEerjH2VBGzCIFq1y+jsJHIAQi9lUaJDf/7Znntk6v0sKRK8KF8
 r6pQUwNji1+xCr5HZW214hMkzi39bMW+ZxILe0Elksoq6DKxvPNjA4n0wovcld++EojDdCQPJos
 i/eT7it5Pm1fgy0kB7WqMo/zTAedD22Ul5vbDTZr9XNbUuxW0ahd2UGEZlB09QYngJN5JqJpZF8
 Ya+djp9ZSSQsJ8MzvrA8UycCb2gVvPAzUGYZYXHNsDB+7nk1fNI+LBFdwqrtioPuJHmS1cC/t77
 KmCw1nlpLP9dNS2ok64KVZQYnGWOX74iO129aN/mQPz39zk373B/938cKXXOIpzdqZlb49RSL7j
 yk18DjlzMtK2oZ2favstKMmsobPCZ8pndKnoKfvX5fGbNhKXUmdK7J93o1w4dbiktbdAAYFTk3F
 uG42EiO/AcPi7p7BYd09al3gutN/dyDmEjgcpQkI6zlFVkIUp0o0EOqmt4Z3+ybWSPsc1uZEqq2
 2Pq3PS9sgsIhWuA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 1r7Chw7aPMid3h9NzjPk5Xq3H-G1GnkE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX1u/aE6Y/hmFr
 KjgXxrKJFczUVNEb5dHqTJLP47ynrVB8haYrPVFeh0OzrG6VfdsLo6FdKT52Q6HPmcRzeBgGWNs
 CIYEFX8AORJff0aTjhGGNdFx+cIartFNKDFgeLW1PY4+sFqPBvlDJFIjhWoJ4p8dQZ4zbG6KlEd
 fv0jYi6bMLFww5c+/Ry1w/uHOnhbrKhFnnJWEhq+Nto+S5aqe6OvRgshTTUgf4MevfXUFZhuA0R
 c6Qwp6KxwJF5e8S36qpzyYbBfD4Ks9Zg+ka2HEnYhovFTDzE67kHSKiccgjzPEm9e3+2+nazOz8
 jiCMVOvBKniYCgiMh43k58tx7mzuf5XQCGv0RR14vkQhr8vTUK4MO+pIilHUpCRCrmKy7sUZES2
 vf8rQIDK2vBm4UnE6VeJ+3DQWUR83B2IeTyKlgdN4VkN/m4eZwj0OLmZYhb5KRzfdkDgPXQxVr6
 fXuKOp/Rl8+psIJRwWg==
X-Proofpoint-ORIG-GUID: 1r7Chw7aPMid3h9NzjPk5Xq3H-G1GnkE
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=6945242c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=E80RO7-gMyMBa8V4svAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for using the new DMA controller lock/unlock
feature of the BAM driver. No functional change for now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/common.c | 18 ++++++++++++++++++
 drivers/crypto/qce/dma.c    | 39 ++++++++++++++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h    |  4 ++++
 3 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..292fb3c7bbd3d6f096bbdc3c66d37d11e9ea109a 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -593,3 +593,21 @@ void qce_get_version(struct qce_device *qce, u32 *major, u32 *minor, u32 *step)
 	*minor = (val & CORE_MINOR_REV_MASK) >> CORE_MINOR_REV_SHIFT;
 	*step = (val & CORE_STEP_REV_MASK) >> CORE_STEP_REV_SHIFT;
 }
+
+int qce_bam_lock(struct qce_device *qce)
+{
+	qce_clear_bam_transaction(qce);
+	/* Dummy write to acquire the lock on the BAM pipe. */
+	qce_write(qce, REG_VERSION, 0);
+
+	return qce_submit_cmd_desc_lock(qce);
+}
+
+int qce_bam_unlock(struct qce_device *qce)
+{
+	qce_clear_bam_transaction(qce);
+	/* Dummy write to release the lock on the BAM pipe. */
+	qce_write(qce, REG_VERSION, 0);
+
+	return qce_submit_cmd_desc_unlock(qce);
+}
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index ba7a52fd4c6349d59c075c346f75741defeb6034..885053955ac3dc95efefef541907f57844b60a3d 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -41,7 +41,7 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 	bam_txn->pre_bam_ce_idx = 0;
 }
 
-int qce_submit_cmd_desc(struct qce_device *qce)
+static int qce_do_submit_cmd_desc(struct qce_device *qce, struct bam_desc_metadata *meta)
 {
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
@@ -50,7 +50,7 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 	unsigned long attrs = DMA_PREP_CMD;
 	dma_cookie_t cookie;
 	unsigned int mapped;
-	int ret;
+	int ret = -ENOMEM;
 
 	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
 				  DMA_TO_DEVICE, attrs);
@@ -59,9 +59,15 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 
 	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
 					   DMA_MEM_TO_DEV, attrs);
-	if (!dma_desc) {
-		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
-		return -ENOMEM;
+	if (!dma_desc)
+		goto err_out;
+
+	if (meta) {
+		meta->chan = chan;
+
+		ret = dmaengine_desc_attach_metadata(dma_desc, meta, 0);
+		if (ret)
+			goto err_out;
 	}
 
 	qce_desc->dma_desc = dma_desc;
@@ -74,6 +80,29 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 	qce_dma_issue_pending(&qce->dma);
 
 	return 0;
+
+err_out:
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	return ret;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	return qce_do_submit_cmd_desc(qce, NULL);
+}
+
+int qce_submit_cmd_desc_lock(struct qce_device *qce)
+{
+	struct bam_desc_metadata meta = { .op = BAM_META_CMD_LOCK, };
+
+	return qce_do_submit_cmd_desc(qce, &meta);
+}
+
+int qce_submit_cmd_desc_unlock(struct qce_device *qce)
+{
+	struct bam_desc_metadata meta = { .op = BAM_META_CMD_UNLOCK };
+
+	return qce_do_submit_cmd_desc(qce, &meta);
 }
 
 static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9..4b3ee17db72e29b9f417994477ad8a0ec2294db1 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -47,6 +47,10 @@ qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
 void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
 int qce_submit_cmd_desc(struct qce_device *qce);
+int qce_submit_cmd_desc_lock(struct qce_device *qce);
+int qce_submit_cmd_desc_unlock(struct qce_device *qce);
 void qce_clear_bam_transaction(struct qce_device *qce);
+int qce_bam_lock(struct qce_device *qce);
+int qce_bam_unlock(struct qce_device *qce);
 
 #endif /* _DMA_H_ */

-- 
2.47.3


