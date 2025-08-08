Return-Path: <linux-arm-msm+bounces-68087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C3B1E4B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 10:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2AF1A4E3D6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 08:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2C726CE30;
	Fri,  8 Aug 2025 08:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQ6xq7VP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A3326AAB2
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 08:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642980; cv=none; b=m12X0YkRotyrGLH+hb9o7UkNgeysteUs8/jWCbzYb2TmyS8J16Qp4J4h/iC9LkLiJUql1mgYOtzSYw5zeAAAe9mFouJhwVPzqFrUavljSFU7S2vaQBzLCxfosmOIePCdWBOyfgcs5OAspXbNbZ9zZ0RfeGAFkoQVFVHFyQCLakk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642980; c=relaxed/simple;
	bh=n+vg5ydQ7X4wyVt0+s72ttQVBKiwA0hDbAZIqS23E6A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f8Gw6Wf6/1nlVpIB01PocqgsjRi+40w/ovY+nKG+ChAuxEEnTrB27E65XD29NW2osEmiqvr5lanMQqNEapL56o9JgRi79s5coumHY5trELrT7nkhl1/b6Rdb2JOZKl7w/nCKtsPHDV/Q5dCDpdeQcQdxgBHkumukPTIGJ876iGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQ6xq7VP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787INa7001872
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 08:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MPC6xd2VF/s
	mOBIHZ6B9pOI38D2n59UvsoeVG2Ya7rA=; b=MQ6xq7VP0qVp8a3aHVrsXHpeSC2
	n/ONq5QtvuUvgXqL/uQZDui2TuybsWCTaWNRN1WGIrWD3otA6w1Qmhjfolm+C+w1
	S9hnR4bVbA7addlaRPVoDxv50xnGUGQ1GxF4sYBvaa1ZzpGQH+9nUWhKy1+y6Zjl
	pCTJL+QuCpywIgzI17m43qB/A62565S2Shh0ECWr/8AulK1u2LLfLxbeNRCmKiJD
	ver+eak2caDg8ln/6EUENJpRUGYfbGO3gth14hkFfjVpABzsMtk1WQD2+UisrdrH
	6ddDK4ihbVUEFB1u2yarCL0XFreFmgMsKtxdCgXm4018g1eEuqpoMWU3QZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw399v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 08:49:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4af117ffc70so49008501cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 01:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642976; x=1755247776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPC6xd2VF/smOBIHZ6B9pOI38D2n59UvsoeVG2Ya7rA=;
        b=Dn734ibcI+7/TWupEoeh40jcN0r3nEATapSWQGGzatwOqVLkffsxCR7ZzhEajD5XUh
         kNikqXw8OFT/Arp441V93MxPfyjFbMEhlzhuIHV20NazQvpa+1BFCtt4tVZ+qrjeqG81
         g9ZjrIEab1lFnNG/fO9k/YYZmLGBe9JW2kfrJ1aFB3ovfphCJGz1kDNy3K2QKLEmfhCN
         xNi1aPRJrvng6y6znGtIWchwPLYaJ/Ufx7rXGwu5bdeHEE/nyr0FoMu4MdpmRUVbGMOT
         nBcdGCLdwVe0f+OZSP1MwNhI5b13wXlzcqiXxuJQE+bQDUSkaqly5Wri4JsvvUSNo1IV
         d6Ww==
X-Gm-Message-State: AOJu0Yyc0qEU8wqrFOqXrF++5beEEq3lvPsFMFvQMzI7+pkr7QPIOpv8
	jjwp/nqu2oqpFRlHk8zSH7L2HUBTbxzZZlpBenwCIKGSkv9rRHW4Uz9E+Dzw8sD4cpLYkVc6ONI
	XT7Keymdanx91fLne1QzokcXU+sI3lFr0dt5HVbM58gsLW72kQExkcH2a2F8q+uZZCgw7
X-Gm-Gg: ASbGncthS+JyRdx7vbKxT9bDgoLyJCl+27bLg457MJA9JPnLVxXcUrsFOUnsH/mR5H4
	KY6k3OEGMRBq/bkopeZu9xdMga9BaFJAD99PlVIyeuHeo3BWrPvgbcMKIp85zdnP9nMnvW5xV8X
	Z4Mea//T7f1OQHr/la3LV+STrKlbKEOm05651qc70SvWYb5mDYluGJ1uGkxVaGZGO3ag3ELCP7r
	0mA8M/Ba9z+MSllyw3+8OZuxeiJgztp8ZxqGdtCdXn+kga2qP57/GpYtz3Pm+UcgTAWPI72h5lV
	y8RTGu/Y9HlAXZGF6pZ4L05c65RlifBZ46LT+kgAoH/ZzXYQ9RwT9kFohgbEAwPcwQAqAh5p9xa
	zCLyKYvA86BE1
X-Received: by 2002:ac8:7dc2:0:b0:4af:575c:cc39 with SMTP id d75a77b69052e-4b0aed0ccc6mr26657531cf.1.1754642976227;
        Fri, 08 Aug 2025 01:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPT5L9K1ndC4Lc0SocEjGMvLrP4Jtf9+LLMfgbO89C12Q1EWLhMTp/PQ5tpPfbopMSvLhQeg==
X-Received: by 2002:ac8:7dc2:0:b0:4af:575c:cc39 with SMTP id d75a77b69052e-4b0aed0ccc6mr26657281cf.1.1754642975732;
        Fri, 08 Aug 2025 01:49:35 -0700 (PDT)
Received: from trex.. (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e58400f5sm122904295e9.2.2025.08.08.01.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 01:49:35 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/8] media: venus: core: Sort dt_match alphabetically.
Date: Fri,  8 Aug 2025 10:49:20 +0200
Message-Id: <20250808084923.1402617-6-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
References: <20250808084923.1402617-1-jorge.ramirez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX4CJUjCL3K60y
 /MMaKre4NRuIQVJW0jAnfRN1j5hgbm/7KVwOuWprbp2nF41s11/K9dI/rf4qKGVTp3wqNd0PvAh
 hPWX0ZtPnhljnsZ5F78ow9hL0Q0bGN19HGKDTz0Iyh1gCoIVDJGMF4qPXlHKFzkjoFt5kapIVp6
 Zk3jgZGWq1tkovQb9hYwKYhXTR3s1ju9UPnFkmI2xj49ARG5TBx2x02XDtirHs0biG73sLsFEGV
 mrDnipIkCCtbNz7kefyBksGaRk8pKgjOtIblYruAGq8Ijkux9UnwgqA+txrzpt3O/YJfalwt8/I
 3GyjvoR+eeegIpwaR8oMDvIkeojUtwZ7CSpnH6zgJjiLSRDtuPZ5RRtQ3VGJXIFruiRolA0w7HA
 npFOberB
X-Authority-Analysis: v=2.4 cv=J8Cq7BnS c=1 sm=1 tr=0 ts=6895ba21 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=2OwXVqhp2XgA:10 a=tkZEzfabOtbtaFzRxSIA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 1HZZ9pKj2JCMf6NEyO-dLtMUwsRmtwWo
X-Proofpoint-ORIG-GUID: 1HZZ9pKj2JCMf6NEyO-dLtMUwsRmtwWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

From: Jorge Ramirez-Ortiz <jorge@foundries.io>

Correctly sort the array of venus_dt_match entries.

Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
---
 drivers/media/platform/qcom/venus/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index adc38fbc9d79..9604a7eed49d 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1074,11 +1074,11 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
+	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
-	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
-	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
 	{ }
 };
-- 
2.34.1


