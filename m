Return-Path: <linux-arm-msm+bounces-82015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A4C6256C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5A463B40EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EAD730DD1B;
	Mon, 17 Nov 2025 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNqCSx+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/NFjnEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C59D2DC333
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355089; cv=none; b=Xr2HH9eFuLZxfn8AUh3YnluxNNelhfWF8Tmcqo/cIxVIm6JUX4rx2+v+TNyb2lPRqG6ppVFfBYf2WTkbS5KO0ehEqQXgPeCQfdF6qWhKIA8QMN1LJtRWN4QA/1LU5N6owiiV9uo0pafhY1wM2bE1t3qX4VPRpr/jgGekE8ePGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355089; c=relaxed/simple;
	bh=a8FxIuTB8iCq19EfqpqnARVa5ybftEWxeX8WXEz9z3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9+YYSYzJ0rI7/qsnJCrWQsGhzbzS3lKPd9YRr/rduBZZhdnbzNqaD1fndl57GM1/jDvGdAF3taHmHPbPuwCq0fuSyPosGT3p0S6oMNO7eW593p/lzPwn8/JjlwNPbqPc2PqNuPNAaIrl/hi0KeGa8eipUXje3SII+z+H6KU1WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNqCSx+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/NFjnEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4oYP92793251
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGOHC0mGBvCyALHyXyoaknIJqz5aUDiXvjo+16ruLUc=; b=MNqCSx+h6BrfymYS
	Z5Alqg9uWZem1yDb5fExJDvDdDQM+nDd6ZR4Dd+Hp68h25eHqPflMAaSL5K+CjQe
	8yUBcfP5Y5EXd+9i3ZydJDH8MabWpiGKZsfdbZK1mHzz/DUOrzw+XGqi79r4D9SF
	yLF9f/GjvAiPEXn62Bijxzuw8p/dpKrw+SvRt9gNz4Xitz5vDXdY0Eu/Q5CjzFwv
	SZb0mSYONCYt9EW/X/l7TZ+zBLlalhHqBN+iA8k/AOMc8xFk2CdnW8+seVQ0nrfj
	VBqTH5+F5YIIlKHdmn1+mgmYGMl4HJwJ4gy5vKmqghBNYsZ+ESlRBQoewcg2Bl9D
	8siyWQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4afu5bg82d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-298389232c4so53376305ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355087; x=1763959887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGOHC0mGBvCyALHyXyoaknIJqz5aUDiXvjo+16ruLUc=;
        b=R/NFjnEYKXdZ8t7mCZMbrYbpdjbI3MWwXDhp7Whuo2Pw2021kJ6ZLiUobX8wT2EaBh
         RYcfMIba3slKBzc8epoJKBVdPY03CC7wZOtqvBslj/f49LB2iFY0L0ScIPNp2CUuhLz5
         zWsNtMRgrKUQE1hKVTBnC8B6ZcfWxHD3TOVtiWglxmIauPuZ1Zou+9Vjo4mlSkaIGDwm
         jJdtI5sxml/CH2GUhhtg3AV4IUgMfU1s8Vh9qHIS1fPQCIcl58n8rQkKJYULvnWCww6A
         CYtH3QeX45P5cJ1uIrEvJa7PghwsQI9FqhoRYAcywE+vIkzAPyOqxS7yAuIM3uqfMSgl
         URkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355087; x=1763959887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGOHC0mGBvCyALHyXyoaknIJqz5aUDiXvjo+16ruLUc=;
        b=OclMQ5HP0iEdCKIeqZt6Bnr2b3V3/iwWSnXxIwxpp4NpeqlufJva15UIjeIZIMy04z
         2DM5ECcSZDSkvmfMfRQi0wTXwfp8YiZ4r2O6oHfZ4i5a6hQWOq2RkM9MzE1stKolLTLD
         kV+U16P9Z3SgFmN2kCTWTdGJ1MYYIqIM4Owqtabxf21tl/jPY5zzCNX0dJcdEYlzEbb1
         pI/puTmxz6OAy7VZmJGljIrce+lBt2DEQLunnGdNSQq7HuOIYKHKclOag33uJWBQYKBw
         c/ABsNLz/VqtHHFTdxg2bYVFlb4s9m0jY+2HmgsLnhow9zmEDlZC+2zmdndu0WY7YgkY
         HnjQ==
X-Gm-Message-State: AOJu0YxHxVDAlQxKjKv8j4RsqnfK5k6BHtkjzk9+pNZSXmExOHZlpKiB
	9Ng1Tz7aA2I8qE6gN1DXI9AXJ3nocuvWAdVNvAqZZ0xEsi7FwsfkPfQmbcvMTMIZoVDhAIil/ZK
	hDlGbs0nKPXvDeq7Nr1T3FpFrPwMa9IACTt9VVxgBpNEy0QK7IFK/xi/CQif+wf5EBix+
X-Gm-Gg: ASbGnctIFEnobaPWGkiTnEBW9h4sDt1RMopK63//ru7GoZ/nRdVVDHyGPoOUao/N2dA
	IoXAq+xbXTGg/Ivz7qyhvMK0oR1nBh8fDjUc2wsw9v+CYqiQ51htHZyOSsvyC40/JjHFCUOZ5U2
	0U7wklo4f+z0tRFR6Js4NNhtlITEVAWhGSVjbyc22PEKsSFxFexVy2Y281fZdWwwQMyduhcqt1Y
	aWliXeSXT8ZwL5KgWFX4++QY5Jw7AnO8KZMoZMIHZd1AuZ4oRAgCoHjb8ipPJkoOndSLVIXeY9h
	CcOoPHkZLz31d5559rhbSDCgnJZLh6/OdV/t9lFMOb/FmKuz2e5CdgReV0ULQsd6JnInUK9FExD
	OTZJ3NmU4CCIuQj4pBTR/6HYnyBy7j03zUVEEo0qcyNjyBmnjDh57ArsMjwkuIY32pz2A4rql8D
	IXkArXS1B6BMnBEyIhRT79I/Je2TVLgn7n0Iqm1XxdlsSz
X-Received: by 2002:a17:902:e948:b0:294:cc1d:e28d with SMTP id d9443c01a7336-2986a6d6d8bmr123687095ad.25.1763355087034;
        Sun, 16 Nov 2025 20:51:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkMQmVLCgDBPw9z7nTTC2dcritTEqwhD41gbL5kBPb2dlHy8tOdsJj+3sKq5cK2sDNURS07g==
X-Received: by 2002:a17:902:e948:b0:294:cc1d:e28d with SMTP id d9443c01a7336-2986a6d6d8bmr123686925ad.25.1763355086620;
        Sun, 16 Nov 2025 20:51:26 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:26 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:20 +0530
Subject: [PATCH 01/10] soc: qcom: aoss: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-1-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1069;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=a8FxIuTB8iCq19EfqpqnARVa5ybftEWxeX8WXEz9z3M=;
 b=qWEYXzd+I2XzhFqgMitP5ELtr7JqstLUcvKp+XQraj6GYF0K2QZO44zgpc1ID0fBlah6CFtOY
 +xCvAPY5GzLDxjiMoUsgSs0LcrDSEpya5phByuF165djDiXuf+7cvVD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: WLyi5l20QBbI-Wf39Ls5MkVfOF4ZSnOV
X-Proofpoint-ORIG-GUID: WLyi5l20QBbI-Wf39Ls5MkVfOF4ZSnOV
X-Authority-Analysis: v=2.4 cv=Xvz3+FF9 c=1 sm=1 tr=0 ts=691aa9cf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GU9CKOWR0grCKxHO7KoA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX3HL2q9huoqVw
 vhvOJbYUzkLJBFKWA4MJ2oDS34LmDkw2ZROQBEicUvuw4jFqQG6Nsz1xtDE+c1t1ZgakS5A4ko5
 o5sW7DgcU5x32JZC7N8axHFqCUrU8gYejlMfiNhUUqCs1oqwAkudG/v4WDu6NVJcpv6dZjAT+H/
 Q6Hdlo8/K5y9p6Be2+N7/nskK04mz9tWVjM/RKE50klzmVxgqVQzWNC3nhKl0otFJCi79oyjyiN
 Cq4FObYg/OKPwYo/F1qCGzhRE3ffDoGrJmwvNjIkwwnovqTa+6jReAAkgppbdNnDbnOBbV07EDi
 QESFJ+1mTLJhrI0R9my7fgAUtuaLNPhYb+hvfYmSSfncbmfx8kLCbyRTBuhKs1xk0Wp2h8RFqOx
 yFZpAynP8nRyLjBv8rkdvv40sT3jqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Make use of the __cleanup() attribute for device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_aoss.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index a543ab9bee6c4efcbd7026c44af9731176d4d60c..cc9882009bcac7eae8db74815563cdf1cd9a5aa6 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -447,8 +447,8 @@ static void qmp_cooling_devices_remove(struct qmp *qmp)
  */
 struct qmp *qmp_get(struct device *dev)
 {
+	struct device_node *np __free(device_node) = NULL;
 	struct platform_device *pdev;
-	struct device_node *np;
 	struct qmp *qmp;
 
 	if (!dev || !dev->of_node)
@@ -459,7 +459,6 @@ struct qmp *qmp_get(struct device *dev)
 		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(np);
-	of_node_put(np);
 	if (!pdev)
 		return ERR_PTR(-EINVAL);
 

-- 
2.34.1


