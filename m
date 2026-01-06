Return-Path: <linux-arm-msm+bounces-87666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3E8CF7ECA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 11:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3977330843BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C976032D0FC;
	Tue,  6 Jan 2026 10:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8BqB94g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxRuGeL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E230D327BE7
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696867; cv=none; b=SVYsrqFg/QT+E2QcZZb29pSuJ2taANthjizaTgjN1f7VSlcJ1AJYNvQ9y2Fya9YTfiIXAyyLgsZunqjPJHrg3iacQ5obXgzfmLd8xxzV3/U+RYAtpyDE7lkAx592iRI5ES24ClEatu7hbCpoeNITUeoRZGJynZJoVnC8R7ZIqLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696867; c=relaxed/simple;
	bh=1ByE463mdCG1T7PjmuZ9Q33uwxoCP8/d8pmXMHtpnNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sSCgeoxhk5FWPL7YzHVt221OJdhNM9tx0q9Vz3RFVKmS2OuVqjfcu8BA7jQw6Y4xlmJCx3dmibDTHcx63QiuYpcdlEV5ZvWhRuI/NU2VrWDZUm6NqfoBuFTWCT6zUkM2HLTmVOQ7SFgn92LOISii87N2+0Mh05UZPOJSXJlHRSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8BqB94g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxRuGeL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606AF9AZ2922820
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 10:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SKQTUfictNk
	Nw5HfdIRn36bC15XbXeG6fAOAB4uOOBY=; b=Z8BqB94gdsIiAsFkequuAXuhnf4
	kT78mgF3It5Te/PSbM4WeYAmcKM2FxQnHGmQurEcVJDp1L01QdyJNU5SAJNmKzw4
	z8/qHkH9hUIVQNYT2g1KX8GpUxhIwwRqa3CliS2TCe5mJvr6TMJpNkqGeJ7PMfHJ
	1CWWFF+riybzCOn5L98ppCPJTWgaUyGGonSHGvSXTaXYtWjQ9NZD1CGBzBaV6zr1
	OG+Yhfijteh4ZJ7gXfIMdu42vp8qCd4Jn8P5+7Y7fYIq/5dnnoUVlRXj15MSqYn3
	znrNkm5AtqMvgtLbg76+At8AT72IRDjomuhTmNliQsn9YuqmUr87Bz71jwA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy9dwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 10:54:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so791277b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 02:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767696863; x=1768301663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKQTUfictNkNw5HfdIRn36bC15XbXeG6fAOAB4uOOBY=;
        b=KxRuGeL3/Y4MASStCBZugaHqQD/f/mrW5qNc4+39eo0aaweuxhSjhL2wkXVvBRSbM7
         dqynh0Wgkp67xy9CvNe+vCg/fKJ2PEusoBzD+37pU+Lhllx6ERWqyyfkGocihnE6tFB5
         /lWFgf/XvPGluyjadgEgZ77C4vgbYxZOQs3Fw1kflJWt5WShKzR+T6Il4QyJPXJ/Gf4d
         QwzXWw/jCI0YglYuq5eK3bCJOgY64JsF8o8UeKwV5Vc2dtwHF0CQSZXF6dDvbt4V/v8S
         Wr3Ki9cV9gSQDvsQWZARWLhMjBxNfwXBwiuYUdavsGD/DHstmXdIYkfGf3sQ4Phgb4Gy
         OVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767696863; x=1768301663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKQTUfictNkNw5HfdIRn36bC15XbXeG6fAOAB4uOOBY=;
        b=cNtPy1D7eVCLOD5NZ7srQA85MNzdMekw6ZsNQLgBXtg7ZyQiOdoIGf/SJQJ5GYO869
         oCqMsUihIVz3a1EiKSeut0tAHeIV8slmtdQ9m/FyFCtQBnocrkW0i3gLFEn6MQcWEHER
         Smuyb8ZCSKc0Mk9K2aFqTtjnuc1O2n1TNlH5g4pNuyzM3L8temQDcLU0NYR1LftBXwgH
         i28iOqE7zN/X/J4HcR1dmWZSr7HGtkvHy3ZJMsQ9Bm2prQNXs02dFCHwMFLOJaB5357P
         /vUcTys58EaOl/dZuuGn1ZdhwXj7sFwHGlggI5gKtf+Jw3bTpbRMHfD2vR+k/0Wv3c6E
         oleA==
X-Forwarded-Encrypted: i=1; AJvYcCUjZTgCuE2Ojcw2YUJ97DMO2y+u9tViyTeJYuQNv4rshiG5Yt4cnstXBZ/daTOvKE81X9tSwY3vvNvTWx2/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2B23mZLTm3cZJVRrChcNZiOmbH64JJru1bOJyDnPf0g5UnX2r
	jq/5MeJQDs6n5kXwQ5f4Z0MnzevftMmPjQvH+X370kGucds/jd6bHXgw0zOsMDHXA4ukjLoTNBN
	NItUJ1NfTOQKzpJ3+8M61xnZa5gA7n7xZTQZYD+O5F4xGHRszLhOa0vRasIZWmkued3/O
X-Gm-Gg: AY/fxX4hXCkq/0dWnbAGOg87YeSs+S3t2yflM29RzExBx8NZbMbzuwReQwqErwCvaaH
	HFZjnUvORKz1Moesv97g46rgQhM4oX1FLnT1p1dkZzLpw0ItFk7h1h+YhCeZont9h1LNUO8R5sE
	NGeU0CW1gBlGRZlDVpv2gIt2mNk6KkJa7JSpOV2cakipEXt+1oSzS4s3lE6guuTnCkdr0Igh4P2
	ybPuyWM/it4EJK01yKCxfMI+cdrll4mqFzcOLouFvqxP+tGo/QCOoEkeuuSqgV29guhyuhtY5UU
	M+RChcYFFZloxGsniQ93YgOytucyqtFF1tR3VAJWrzGEJ4t1UYtBNciw711xqsqOmp2zlXOgc2X
	EySZBBQmnUfh89y0eqJ3/FsRAkrOtztO2cse8xSnQhniKcMQwjdl/q7cw9BiDiRHjACQh29UJCW
	D3wokDPN07qcBMQ++fEIi+uCo0dNOqypZN7aGUK+c=
X-Received: by 2002:a05:6a00:44c8:b0:7e8:4471:8dc with SMTP id d2e1a72fcca58-81882ddc524mr2791524b3a.61.1767696863397;
        Tue, 06 Jan 2026 02:54:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG72f5rxDkoC6aaKTUgEoqI5/CVCVVOf+UAiixMJtOO1RFiWqbCVO+gHS445KabZNNCEVBosA==
X-Received: by 2002:a05:6a00:44c8:b0:7e8:4471:8dc with SMTP id d2e1a72fcca58-81882ddc524mr2791501b3a.61.1767696862888;
        Tue, 06 Jan 2026 02:54:22 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b98sm1855121b3a.20.2026.01.06.02.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:54:22 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v9 1/6] firmware: qcom_scm: ipq5332: add support to pass metadata size
Date: Tue,  6 Jan 2026 16:24:07 +0530
Message-Id: <20260106105412.3529898-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260106105412.3529898-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OqUrLUtuVw6SdkOl54Mm7RQKYhUfnVqk
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695ce9e0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=uWiwPwd6ELW8fYEcJRYA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: OqUrLUtuVw6SdkOl54Mm7RQKYhUfnVqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5MyBTYWx0ZWRfX/fbXxFk4tKt9
 pzD6wrmbrMznktPfDBvq54mnofakDiYx8EozqQlgXIE/Goc9yaDwauZlHgJz5I6dyeLU3zoP20m
 10rfENNNmAa5k0H8bZefhdUZgH7m+H7cNYxPeSUQC2HznfAQopOqSXBhmlEID3K4zwFlOsDJS35
 G1dnK9YcixygF3ky0Shrr+PXP7CajTd6ZwECiZou9hMMSkk9rUvfqMrGdAJoLXvs3nv8pFw4lk1
 pavDieSwcnhiWHzPMOQjS+1aw50zhwLA30S7mLGjR4CF3lmFAShwXXnCglYJVf+bTGPku4XA2M3
 k+GMqv+Z62x2yIWvUE8vmhViZj2zZ2AOqwHdiS0x/i3tgh93D4+mdEHzqhudYzz8WqL/cnmyvtr
 b4C+4IBtYqwZhAkjPWivZqN3gGvWyWojXJUaXAkU0M2OZTGLbV+eGaXAYqLDTGFTzDz1w8JDTcS
 Om7VQJXPFRxeOleV6bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060093

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Added signed-off-by tag
---
 drivers/firmware/qcom/qcom_scm.c | 17 +++++++++++++----
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..c970157f75b5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -583,9 +583,6 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	int ret;
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = peripheral,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
@@ -617,7 +614,19 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	if (ret)
 		goto disable_clk;
 
-	desc.args[1] = mdata_phys;
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW, QCOM_SCM_VAL);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+		desc.args[2] = size;
+	} else {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE;
+		desc.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW);
+		desc.args[0] = peripheral;
+		desc.args[1] = mdata_phys;
+	}
 
 	ret = qcom_scm_call(__scm->dev, &desc, &res);
 	qcom_scm_bw_disable();
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index a56c8212cc0c..57d63e932f62 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
-- 
2.34.1


