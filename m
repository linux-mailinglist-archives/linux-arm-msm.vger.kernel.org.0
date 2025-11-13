Return-Path: <linux-arm-msm+bounces-81581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AC9C56E44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 148A63BAFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D0D333740;
	Thu, 13 Nov 2025 10:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aI/3G6za";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egSDYUGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7C333458
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030180; cv=none; b=joPWgFT1Me9hC+gqBjbqNntpZ3t+Nv0ZgZjhVgIsMxQCq127FY6bZk2Euy3WZRGsQbRcRLWa+XB2cvIUIEZz0jpG1pubWfraKkAz05oQlZoSRspeC4c3UcOEQa9FY+rOTNHTVn2ZIFvRfyyQ4Nmk8e9dioGzyoJp+CduvbdGhuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030180; c=relaxed/simple;
	bh=4OHWHDjFq2jAK9+Bld2fkj3MwlJ5JU6OOThT1NP9j4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lqxJHlNEFIVkp8yJKQMh+ViY9yyZU7CVLJoEsHic9Ape6P/HjFvTVR87cn0d1k/Ku8u5QoEI9ZV1ZhGxbpU8hymph5er1GMP94D15tL6M80/dJCxx9801qXlkWjc3jB9UuLQhy5sHC3CK0sGxvvsyk/ad5pLmy60QCfRfTZaEvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aI/3G6za; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egSDYUGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD5S3f03440428
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=; b=aI/3G6zaLd2sKtwi
	s5Tiyek8O7Bm69Fx/yNglGsvnukWY5owLK9AItiBXPF+vLUflWUFKOw5wTZVPxGv
	6mgmZy7pHc6HP483ehbQnBLYDLoUzXd7vVKkW1uVPBBBoOzG8mlZ3YyxFD0FxAOJ
	+brnRTQuaDSAW13UwGs41o9BrQjT80RhxLsjJOqdA1qHTqB23wLSaB2CDM2PSifi
	i1qnAjKDFkazEsfVnB1iu10+9hGIokBlBxKQ57hivs/UvtgQ9mCepVud+EmZ0/ST
	zMWC6dhvknbvViytP9W9NnXN2gOvxwHfp3g/9vqv13H2NG1r0bcPyHESXWuOv5Uz
	CtO/rg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9788yaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b80de683efso1437314b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030176; x=1763634976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=;
        b=egSDYUGVM6W5ivvfFshN9B/pnZT+b5jNnUHyY9ffgC1FQYNEE/Ncg9K0tsAJ2mIrxv
         +sRbCa8Xu2192zp1PZPxrMZ2PyA1Kfmg8VTft0HqRDuKLJTVRGHTA68N3EgGSoZYV3gt
         U4eRgmpwwG5fcJ7T12Ksq+quzztdobDtvAwZ721HMOVbvZ7xzz3Nf4mfg5jdgnGivZQE
         /viqrC9Fz+5k48Xc370TUzSaLcT8zbZ0l3ZhOBl81CsPi7e7V5htCSFsSDe9Un8DTut3
         IzbOKXonkKm7CmrVtL23csl15HeqlApciUWWVaMmD/hojHXIA5aZMQN0mo0zW5qzhj5y
         3thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030176; x=1763634976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=;
        b=IzKPwTKVyMqLq3+HnMoc2TBYkFwaXUFA01QzWwPX1U+5rvPB8FFutChl7F1ISml0IW
         yB3bueB7P4uQPx3xOe8Qhrg7A8xWuTeLlj/OvzW7hOvHln7fdqn4SZE4cgbaflmRndyN
         kEk2QTGrxZlty/8Mbgtf13NjHT8uV3SmhxjIdQ/xQGzjVfigmoCqJj681s25q+mSxKb4
         84Cn8OfjYcv4gnkFtCF48+JFOkR3dubylGaMz2coi+b+TxoyZl59R8qg8P8OcXzxGZpG
         x8u54EtwMWd6kCfVn0miq3e3lDQ4QAv+nLA2d4WKbsbqmyK24o7GR5AIMVMitx5eVG1q
         GFWw==
X-Gm-Message-State: AOJu0YzQSRSjNIkbxozvRa7tye0vZwhhID9HiPy11d9yZ47aekGN0oKI
	MTbvNpAEylnOGE+TIvbfp2Nx/2owCqGXiDgy1AKA6aA559+TtbsabTYXIE7roFhHReO9v2bBU29
	taJXTk0kM7JUzqCkw6d/D9/VoX/vj4yHOWWmCit2CmeBocFKImKJYwzENZXGX6/8sRNFd
X-Gm-Gg: ASbGncvkBKFxsUZbOrbOU9aA3hqcRHUyXmw/WlDnt7QqYp2NegTVVRXHA+EEP9T7L05
	3fD+b5UxwcXN/rjCYZgFsCIZDP/wmfpKCK/PK+poJwe8yZ67LUAMF1dsPf42KAgpsg1jP6uJ4r5
	6CemmH+W34d/F57/hcWWBktlkH+xkO0cSxCFfl1B+JCsJq/ECnvDQXEBKzVqhT8vBl9tr4jQpO3
	oCXajPGlTxQuQTk0e/lIoFTTpbzHtmib0uPCNoOCNYjxN7RKkHUOqBEqxg2Kcunnzye51v/w2D3
	phnWyVeHkNoYOfw6eQsmvz+YXZwkA51NkRrICiBR91rvj9JzOkqFByUMyZbWNkSXRw2ZOmzEsC6
	uyYHGjRe1XIKkiBwsgh+tLhhpXA==
X-Received: by 2002:a05:6a00:3d47:b0:7aa:9e4d:b693 with SMTP id d2e1a72fcca58-7b7a4edd4a6mr8524544b3a.17.1763030176292;
        Thu, 13 Nov 2025 02:36:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGIq6p3zYaQkOGcAJjI+TPTb7shKZI9xkbDN5N3p8QV8KTQjYB+x/iWASM6JrTmUJjbM6j7Q==
X-Received: by 2002:a05:6a00:3d47:b0:7aa:9e4d:b693 with SMTP id d2e1a72fcca58-7b7a4edd4a6mr8524500b3a.17.1763030175582;
        Thu, 13 Nov 2025 02:36:15 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:15 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:05:52 +0530
Subject: [PATCH v7 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-2-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=906;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=4OHWHDjFq2jAK9+Bld2fkj3MwlJ5JU6OOThT1NP9j4s=;
 b=w318Bx7r90h+xljy776NCBKlBZscTjUwXmchks0oHl7B2ii5+sjpDI+SxMgAzllPteVRLK8/D
 vd+vLj9aDZ7CVdPuR0c9KIiD2pEmgBVuUnJP07VuH43cYMqBKxCuxiJ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfXx11HfS65BT0u
 NhhbUlqw3YOphOhOQPgtkqcCZhlsDeVACnohEHYCNZeL7/RSCjv1IGtnafcP4FBhuDuHGkE1jq7
 COHrna/c+mXPHEvOz8BkgA12osjNf8RbyGtcPF5oGbzTQq/vb5DhlfotqCY+t5v6FhWmwv0CaEM
 ME/HDc5GIj5QUJgIRc/SKdesrYocc5LXhpkkkawto8qhYLYk/zgaxsp/zxs1HA7gMRUy/j/bjSZ
 AdD5HUK2JfyVIaVeQLsNpf6b+16Dptu12Za+C6rQhPxRTPpjmbT8oqnrPBkxrmBEI+Ht9kM04MD
 xAhNDqvMdnKFKUAyLOcbTvGpkECsR3UXxA2PUm/lx//ECCFXStQaKdOoWh7YE7hMPru3yzcDyUB
 lYqe0K7cW4CyTg0bf+/fngeoWbxMtA==
X-Proofpoint-ORIG-GUID: Xm1ZuEYrbcvyNgzSMr-9uU6KYnFSJ4i7
X-Proofpoint-GUID: Xm1ZuEYrbcvyNgzSMr-9uU6KYnFSJ4i7
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915b4a1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pWxEDRe995Kf1ot4LjYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

The qcom_scm_pas_metadata_release() function already frees the allocated
memory and sets ctx->ptr to NULL. Resetting ctx->phys and ctx->size to
zero is unnecessary because the context is expected to be discarded
after release.

Lets removes redundant assignments.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..26969bcd763c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1


