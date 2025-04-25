Return-Path: <linux-arm-msm+bounces-55651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F296A9CB02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 715BD3A03EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 14:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DDA23F296;
	Fri, 25 Apr 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EpWdRIDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C65537F8
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589843; cv=none; b=pW6rwbA2MC0EHdpN4UXu3fPDDyx09iIyIKzhgXfgfszTGs9QKULWg1+DMY04Akwbx7FLG6BSCBKmVsO87X+W+GjLW39Cr+3LAHimYUKBCovRqQTmsUT1KVCl/YGpqrETFWtAlLBiopSZFLAHHYqYm+9/ah4uRAdGgplaLooFSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589843; c=relaxed/simple;
	bh=DVCmG2ZyZCvXacKusGEsowZKmCF8wz9Wy3Q4QPySJ4w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XmEUnobhr9kCqMR+5ZMYZgMOMJM6yWgmaFLsk3k4w5G4mTYqK6kNsDqK/YG6Sd1CGfZQLGqof3zQAq2RC2aFcDb7N1p1+GYfiqE3jiy8kd+Hvybo0832vlMbfMr4JRGhRLhVAZyOHLsqMrAyiBWmjAUBV83uZAKp6HmFhhw+Zxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EpWdRIDK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T6sE022918
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZwK+b192ZD+Z7O9cLlbngFZXkc3t1Peta+8
	UE3ITQMU=; b=EpWdRIDK6JevcHIUtggjEtQ1+viDeQtowwEOowUEyRJYvBvL/sO
	ZxJX+66/9ctPiHoPSm16ftKHZH/TbTHZ7SuCW0MWJMMNBvfSu/40L6WSvzLnaOPM
	pZuhbSNWd3hwPNriEd+e5586R1qardvudYRxr29Qvhk6DqGXA/JGQQerHdJJaN6V
	ZFv30hcJMPNUyZissIP1jXv1pHYjnRWIkuJuqBdTiufJXr7ShBJ6ZW/QXTFD/an6
	gIE9LaTwYJaJTAZYtWft/068JHwu5Y/+v9nlAJF9MJuZhDtjBnJlm0wGw5QZ7Fbm
	LV2Ml4ut2b+TFjihc4ngLCy6IIn+9zbt8Hw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hbky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 14:04:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff581215f7so1847357a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589840; x=1746194640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwK+b192ZD+Z7O9cLlbngFZXkc3t1Peta+8UE3ITQMU=;
        b=rY5oTWXowPLkx0rEl/6r4sGSZR5JCT6UeAyHLlPJvdckAUoVBTL3s5OjEte/C1sPhm
         qYQtP0MNorcE4kGWgktAw1i5+ShJL24PSo+Ic/pux11Td9clDQ+/8nX7kRtXp0jsy7Zj
         OPr+nOVc3Yam6fOuQBNF+O64DgWkecCxxt0WyKg/ffcgCiHrj2+4k6LPDdcAz+QddDqR
         qJM9CaGr7jEdBjWLSnepdIvThIWVP9yb4xzH8bsTgZRUe6QaydUHwmTouG1O9mFnuIcG
         doEHXBCWSlbmSxBHhWEra0O4yNc7Vkwepe1Z+QNdFCS/iCsf8oN7ELpZ3a7fDIoI59dJ
         hHvQ==
X-Gm-Message-State: AOJu0Yxm2mP26am1Zx1ue9ohZ+JcSK0uCpsGujGMHS24WaicUuA6N7Go
	a5SsI2MCbKudsWpK8MUAwSy0Y6lCfME5hcwaxc1EDJ8Vr5N6bHGQbzXjgeIebspu7evSl58/aUv
	LfPYY3nOLpApzl+NtexwbMZ9R8fJ4KofPv4mLMj7J0SEcd85HGLeMqaE3EIQB5Xsu
X-Gm-Gg: ASbGncuEhT/hmbQJDGBeAiMECYCFG7FVmGpvbkMG/wBVmkf5v1mUBGFjb2W124foAov
	ZxNRlWzNLEeV3vZcfh32YHXpgeTZwS2KWX7YPer6yqqzzd9BKysiK33zz8ZNaH0KBwx8nUxWe58
	rTTI8AcGDAcRp/jIa0VcDU6MHodOFqjn5ICFUwPWBXstwSN2clXv1R5+AnD/ouMvC9dYGCVhcjs
	RhV3vm+upsbR3sFLApomdahXHZa/Him4m/NBOh67wy7at+H2ydmJAc3U6q1DMiADH8n3RZCOVfH
	NmpIMI1eKffEbvdjNt5s9qxvM1iQFlZe2AcOSRQ=
X-Received: by 2002:a17:90b:558c:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-309f7ea86abmr4354844a91.33.1745589840254;
        Fri, 25 Apr 2025 07:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhLbW2FBKRZYW6QwsmA2nqfdHehuUpVw6ZkBwkNyEDmsL3fAXZEWuVrXlZk2IzXUTPUfB5lw==
X-Received: by 2002:a17:90b:558c:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-309f7ea86abmr4354800a91.33.1745589839858;
        Fri, 25 Apr 2025 07:03:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061c43sm3468697a91.19.2025.04.25.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:03:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 1/2] soc: qcom: socinfo: add SM8750 SoC ID
Date: Fri, 25 Apr 2025 19:33:45 +0530
Message-Id: <20250425140346.1087527-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qbooklotYXUDgf3-nkekKr4N1gRqK10I
X-Proofpoint-ORIG-GUID: qbooklotYXUDgf3-nkekKr4N1gRqK10I
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680b9651 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=MeXL3ZvE1JNQxLRkgr0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwMCBTYWx0ZWRfXxQTAp0SO3Mv/ rB/eXm92af/2HPT3LfqFT4EDRT1d2VnVXsNEaCNEtDEsPX6uIkzx6BaDnUtcUF/IR3jU4uv4ijv sgtpU5q7WJ8jWQ3lvWkNYr8mjBKxMqgCxFjJ/8WzhOYX6aqDhPJm3K72oEQLHt0Za8Za4uBZ2Re
 C39xmGKEGug01HIjoXyf3YdGmQOCzCWr2ys7SJ0OeIGMtFrQdB7SRF+C74Wtw1SJXW2st9FCVu5 TeXB6OXJB4Ksg4UivvtzPLhyWiwG+eU1txPB28Be4yZoK3I3Cm9lTBohAdIXT4iFxpErXp2Q8Wy yz6jati4OYOovhoW+qJ/XwyGmDeEpyb6SOh57F1ypQNEqhA9TtRUMxcxr1coeauVRQy0nkwRuVH
 4P0FTE04Wp8YC9OpGdW6oAQm9b6A8MV6gOD9eRrWCCfNytmUsXfMBEJP+nfCiOBbA8uHImFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250100

Update soc_id table for the Qualcomm SM8750 SoC to represent
SM8750 machine.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 13cf73744bd9..71858de73a91 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -456,6 +456,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SM8750) },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
2.34.1


