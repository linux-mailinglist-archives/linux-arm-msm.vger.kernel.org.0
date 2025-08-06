Return-Path: <linux-arm-msm+bounces-67860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EC5B1C1D4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3DF718894ED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 08:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EC7220F3E;
	Wed,  6 Aug 2025 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hewp2yje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5822068D
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 08:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467779; cv=none; b=WEc+jHdIf6JeRrCo16AmseLFlT3PrAil+lBk6h87ajN+sTrn9wrmoYcanq94Y54OySe5VjElCE/EZ5Rzf1WQomfS3TdIP/mn/6jY1yY54BchCQxDEtd9uJue6zy1wpW3wKWqlfdNGxy4aMOsGUtJSQpwi7OlwryWjB3DKNyFvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467779; c=relaxed/simple;
	bh=8xWq6P9sR5iwmq/Cs+gKFsJ6jwcyz/+tb5GyYG9xnOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h/almmgajo6LzCVMgW/Ogk26sVciP2RcNxrI36/g140qb6YA8rTpd+KXX6IyDHIKRyvz78yVw3ZN/zWxXfKccthI9mkwDHi/EOyqcrqy7H7Zko6Pp1C3/IhmxprItoWqCh/IwwN2eoc+uvoRqsu7wgRl0TreoXHm6i8w2sE9K9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hewp2yje; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5766En9Y022856
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 08:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=knUnYiygC/glMirhYnFsBNISXjfP0z20npG
	9dhmwKMM=; b=Hewp2yjevG0elzb/Zof7MlkZNhDoXAm7hnHiZ7Gw7jsWIr3JNZT
	bCZeKtAieTgWvpX8hEv7esFEPQYb+U4kMc0EeQ8sea2hMqA1TXD1xL28t1de+xZ5
	Njk5lMf6djDj5qAnB4rwHIVHDFjLCkMvJYKLBqk+y2fuYjwuxLtHnwDX/QT6g4Wa
	ZSeenNdAcRYDV3qyWs44UR2CGfT/cQjIvf6ejiqPsI0TOPpwmvizFop4T+DCud/N
	CdieQgtUs5rt73x2dgGmOLY2JF8w9430lyJJFn9pdaPpA3nusVN+Uub5B25YEbVy
	j/pBkbj0sD2Yjc8X0r6FAusfLM3MRBiUiNg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpya9vgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:09:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b42464016c3so3725350a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 01:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467776; x=1755072576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knUnYiygC/glMirhYnFsBNISXjfP0z20npG9dhmwKMM=;
        b=EOJMIuBNbD3I6xsZVY3Bom/PEwkr9ZIKoBzWw0LLh2r7AOKFx90I2MTtIGP2h+3Ehq
         yVDwqtKcvuJAYOVW/1xmU/9/JidXQ6amd/qoZSELFpL3C/yKz6RbV4RKcfxr9a/pA2p1
         pv9pmyklWR8gTuW4V68/tajB2rXhEZvuHxVv04qJ6L9cpuPiNRxyKG5DNF7qmeis7HFZ
         m9TWV59yW9NAcDcbUhY3BFlzNcTFys7PXQTeUVZcUdOGv2jUYvbvE297IV2K4qbSUS5H
         QgJCflY48KzMijWg1IdMhDF9QXsbNYM6ZZEqLj6Hi444sZl0Hp+jIF/dvTR68jH3q+MC
         4DQA==
X-Forwarded-Encrypted: i=1; AJvYcCVLi5SoViidrR+gmdC2rqTUeF0TVlWcKcvx0jdec18yBwiqZFVkXezz15nVm8yO2hcp7cim/CpUd6X55/MX@vger.kernel.org
X-Gm-Message-State: AOJu0YxVTSCBNCcgeuoJiNXImCnGOOW+qvxub2swTeUeHf+ITbpE+95H
	SdX9iTX2p9Dk80/7lqatCjMaj/ddcKRrr760asWvbGM5wy/o/G7BL1P5QVXQmOxQmJ9obKdU1iJ
	+J0FDFGS5esOuk6rSAlSqpd0eETCHxzMjPhGIoGwJ1Q9e/tu7jz6Xf3f5oPR/RTnVZp2T
X-Gm-Gg: ASbGncvYvNhX39wphv5BNRGU/N2BEVKMgjyySDLXDLj1E8GmfusmJ8H5kN0t2NPFQgT
	DThailLDBpzRrvkjmcLZtXQakMrZqHlyAArw2Idv8HNwaHP3TruVlmrhta/jb59aTMjlSZuWVV9
	6QcjU+rrSmM2hKJslk93v4x0uR3C9S22ZUMkzOxr8qp99T98uao0fDdpg2nrhfNUSHyBDJwhF98
	uCv6EHjTrgO+ZSRpuBilZZzxDt9v0jLumzTczUFiRlqZsmNZ/G7QVj0/s+xwy1b8mJt5DgP3Ph5
	Wo8nxb9C3Yh4D6xc9wak2wgZw176V3y7Bnsv2bw0KODHnErSRh7vSZFuB869rqBES0tBwiCaoxs
	cq+aWEJoYlvwMDcb5eag=
X-Received: by 2002:a05:6a20:1584:b0:240:1e63:2dfd with SMTP id adf61e73a8af0-240314b5221mr3282858637.29.1754467776488;
        Wed, 06 Aug 2025 01:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO/5kf0TugUCngV86DUYMPF7cCHvVqLqvFAR0R+lx9ixwaYadjeYK63pbWIUa3NO/Pp3Vw4g==
X-Received: by 2002:a05:6a20:1584:b0:240:1e63:2dfd with SMTP id adf61e73a8af0-240314b5221mr3282829637.29.1754467776090;
        Wed, 06 Aug 2025 01:09:36 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f319sm14856195b3a.18.2025.08.06.01.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 01:09:35 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: tingwei.zhang@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v1] coresight: tpda: fix the logic to setup the element size
Date: Wed,  6 Aug 2025 16:09:31 +0800
Message-Id: <20250806080931.14322-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fTr3IWqC-5PXsH9hQnSGqgbTR9BeJurX
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68930dc1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eYArMgjR2MFx1z2CNlUA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX1yj8M3i9Eihp
 NR35ncDWoCeqRqJ6l4vO93NDPbm+0MEyX+Bpg6VXfW6e/VOZdlqqbL2gw6qYH5oekO9F1PZs2aX
 pCIAdgIhW5WGdSZklWDqCo+BW/GFrKyNYiYlniNRFC7/bKBOU/BmTV5ae9loK9IybiGh2pklsOy
 RtcgPKYgal9VofS8KQiMF9rXDZKZR8ZXJUm4M+Hd7TCDaRVT4nJRr2M9StBqO2PsMG7xd9z9R7U
 lfMbTiOma5gJ7DlCVyL+cO8TQu6gCj8TYgsxodgXrLQ3+V/1t4zaThnWtnXdtQoW5UptWA+jICO
 fXkzId6LWlXS/Zt6N+SFhqzyuHszX4RXO2qQbI2DSTcfSy221/h+rOnXSdZDs20JlVSSvxx6F9D
 yzZx573v
X-Proofpoint-GUID: fTr3IWqC-5PXsH9hQnSGqgbTR9BeJurX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Some TPDM devices support both CMB and DSB datasets, requiring
the system to enable the port with both corresponding element sizes.

Currently, the logic treats tpdm_read_element_size as successful if
the CMB element size is retrieved correctly, regardless of whether
the DSB element size is obtained. This behavior causes issues
when parsing data from TPDM devices that depend on both element sizes.

To address this, the function should explicitly fail if the DSB
element size cannot be read correctly.

Fixes: e6d7f5252f73 ("coresight-tpda: Add support to configure CMB element")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 0633f04beb24..333b3cb23685 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -71,6 +71,8 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 	if (tpdm_data->dsb) {
 		rc = fwnode_property_read_u32(dev_fwnode(csdev->dev.parent),
 				"qcom,dsb-element-bits", &drvdata->dsb_esize);
+		if (rc)
+			goto out;
 	}
 
 	if (tpdm_data->cmb) {
@@ -78,6 +80,7 @@ static int tpdm_read_element_size(struct tpda_drvdata *drvdata,
 				"qcom,cmb-element-bits", &drvdata->cmb_esize);
 	}
 
+out:
 	if (rc)
 		dev_warn_once(&csdev->dev,
 			"Failed to read TPDM Element size: %d\n", rc);
-- 
2.34.1


