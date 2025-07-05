Return-Path: <linux-arm-msm+bounces-63829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8278DAFA0ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 18:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0796C1BC05F5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 16:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B423D1FF7C5;
	Sat,  5 Jul 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qti5XGev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6761E571B
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731723; cv=none; b=Mllg3UtdlDAvAhd9PSr5rw3BAY28wEuLQqEne2zKFJz9oascxR6TNMQLFGlYEZuDT3rzBFUvDHtS7OIzzNsHuN4g3g/7ZcaF9iLN2ld8mcG1ANctt0xA8iYU0aBtWG/cZkv+9MITLuH2uL9577k48gFhDY3LVmnpEKjYSWFH4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731723; c=relaxed/simple;
	bh=1nHVCwgtw92YQiqaocxAdN057/gIPobtpT6EJm/ltEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=md+riS4zoUcVu9tOhBLHkONjPf82FXcyN+y5HdcD1HXebVsoYT0+8Ozh/+ArTjki/flqHylV/tVM7Cigosn/uj+JeN1KUMA5J5rzfaaZow04J/ZzkDRHU11z/gKZjHKIdMiFWJAJszurs+MVdoKnQTfJARDN4npmYxWQYugyvMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qti5XGev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565FbSO4018248
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 16:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VQQYkVndGStCPetb0u9KBp
	kX6kw9yPI24YEYcxWZEdI=; b=Qti5XGev3wB1tQ9SAzU+dV5xT98VKholViCmqq
	yIB2Tu+/ihCmC9cabslWbqFrQPI6J9bR28P4m9n0nrfvBkbkuVEt0CpHrK3ouUgV
	dBIz1M22Y3DrsA3m7fTCd+jkHxlrbjgzswnb7kCu9rraGE+1xUW+g7LfffMTeQAZ
	bjl5N2zlYCQ6GL4NTtf4cjjOWtSSrfUaS7PmVZDBTkdrUIXNLFDPwwP2N7juCpxz
	ctDHXqIHXJsgQz1D80O7js6ddYQ6j0GMwhmGcbAUD9FcGYfqQnnP0qHx5WFa1BuB
	DLKYJ4HhKebjwPjnK/Ab9Vw2SpPHk1n38t6Jnq5TZb5De2Yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk1j70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 16:08:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a9af8a0e58so6773131cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 09:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731718; x=1752336518;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQQYkVndGStCPetb0u9KBpkX6kw9yPI24YEYcxWZEdI=;
        b=DXhviFHG1gYeGErRR3LhHr/tXidJ/+rQ5Mkc1PYXWXON2pXALEIjuCauHPtMxP3DNA
         2p0e+LeihglEbaFNZfPNhW9FEOzRHA9gxFm9ka6yMeE1lhJ9OOyS9YgT7KyWdbUUBgNE
         79vzNn5tOGpLJHFxU2eI6+D45572BMZnje9ePKeOcWsZDEHpCGAxwwFZkLcO7DY2a1XX
         QmLaAsui6jorAIM4UUhNlx21Ym8KZxPe4tuThsTcp2+sf/vPn0a88aKdZPypqtNu9pem
         Q6HxGEBz0T80/oi+RMiBme0VNJS+xzIfM+v41d8DywKPIcY3wWqtu4Rh0F7SUJHQMqTz
         N0zw==
X-Forwarded-Encrypted: i=1; AJvYcCXKFz4Bmii56viMg46gighQegBkkJsIsYZQfBcVQcdkU4CDYgZeRVz5crWgiosm9sGGeC2dU1YghZw0zfdW@vger.kernel.org
X-Gm-Message-State: AOJu0YwBVxVn//FyIRMlTkU7Pgoi1TwuX8dGrpJir0RkSwQre68f7Dcj
	y6IG5vLvY5DZ7Xy6fXaD8Snc7usmuzW7zmXE/exeZAuB9B5iklD8LJYYJ9ct1OfdKxX9Ju1FS9P
	+nJU9lOqcM1401PLcnMDWAz6u9u1WUJaFNfoL1lORkZhFOgXwvGkR2Qm0n0AFPKGjVkGe
X-Gm-Gg: ASbGncvS/BYnbYUwzNECwgyxP17PauuAJyR9uzScTOvhGNfKS1XtC07J3ovhUbmwOW+
	uqBiL6ikSy4m1ZbsYYK5FvqecuRnSWKiXBmSbB6b0pJ4hwUDWYGup6IUXR7xUK9IWwvcWHYZuJL
	V/PDfpxMRIKExeuxsKHw6qTv+Mb7a5u++lqNsfKF3XE3AlPDLZhRfDIzahW13BfTq2TvpuDZwZb
	PAfNlBamSErQnZUWadFB28ITfsDGlNKuK4+VDWH1pin06mT01NTFTQAqz89BdZUf+W2Y4ZkLzxH
	lcn+Nv9t0BYYPKmsgzvdn6Y/FUl/u8vOfVEr3TMU4y8hseD5W9+R1zI6Mg47r4EsFmbXIbuwviq
	Kbs7LVUWFuQXroG0UZ3D797+S9yWT/KA5FCA=
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id af79cd13be357-7d5dcc5e457mr896829585a.14.1751731718468;
        Sat, 05 Jul 2025 09:08:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4B2sgfTjCGK/I65unoqaLkmK0M7K7ayKlHuPECNRLfJUUTIjG5F1QyzFuSBOHTi3v6JDljA==
X-Received: by 2002:a05:620a:2b89:b0:7d4:4b92:85e4 with SMTP id af79cd13be357-7d5dcc5e457mr896825685a.14.1751731717791;
        Sat, 05 Jul 2025 09:08:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm622779e87.123.2025.07.05.09.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:08:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 19:08:33 +0300
Subject: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAABOaWgC/3WMyw6CQAxFf4V0bck8GEhc+R+GBQ6DNBEGO0I0Z
 P7dyt5Nk9N779khBaaQ4FzswGGjRHEWMKcC/NjN94DUC4NRxqlGOaQ4TSsO9MaFGWulKqdvure
 qAtksHCQ6fNdWeKT0ivw59Jv+ff+ZNo0aw9BIaG3ttL/ElMrn2j289Eo50OacvyaKeWCxAAAA
X-Change-ID: 20250705-iommu-fix-prr-600451b1d304
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1nHVCwgtw92YQiqaocxAdN057/gIPobtpT6EJm/ltEE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaU4EPzKa9ZLkC7fTqOEgSArVBZofNCTdp/Sb5
 6FwPKWtOt+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGlOBAAKCRCLPIo+Aiko
 1V4XB/9PrB6vncaBwBi4dhAA54NytUNQgDHc1uBL88Sca8J1uPGNjP3dU83pKyS3dPTzWNbWHJi
 P3qCHpO7IpOhZcTOxn6JKQbKHGPbS72HwPfbRcvMyQxau8bTHH56A7zy4XMfbStA460Rv9yXwa3
 q2xwWoZmQwz2UDBAa5VcAHulN4szj+eIHAgAqZRxiD5E9qc519YrQ2WtRGuDtv0Kq9mmVL6Q5wg
 I0OpVpxZsTTEsN6KLKTdEwYISyDMKfyrp0WZrSNmBGxmabvnTGaal/jJ4wZlWFDvxJC4LHBmhn+
 XUC1KVZ6mIhKg1QxzophRU7GtdVBmUqpFs3d9UZlhP9w97dj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: hWwB42BIeqzxBZYY2oOTYbBkhKEyr-3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDEwNiBTYWx0ZWRfX8k9+YmnIfwpt
 G9LPz5JIDTBNx7pSYEQ+NqPaN3f1epO/harehQL+ntYxeWABZ4rQ9SSJY/e8fVUqvIKeNZRFXpR
 YQsZbGRoiyt+XS2u1fXOkal5vE8HhNaoAqQ2EiMawhBkMZAiGGzD2VgEGmY+u4RNczHzYEQYmp1
 5KnNbFydmJanHZFGjGSE4fHn0p0TkJwP1s+ZRLV0x6Q7ZcL9HnO2MX0FCg4IAZF6iTlnNRdUbju
 kRdgCtD8UEGsnsR/ZFBWdO5zR8GNKjVdH9DAg7P1YtuUGf93y3ZA90VMzARA49XTKvY95GRrp2I
 c+N/nP3N+YZ6qPS2l4oNlWDHkayk2D7GzFohJWH6nFhURKoafwapIHo5uYS/R767fGNDwIfNg7L
 uAD6ySHZkpkKwWQOpQU5gA9HEzQPTf76fCQXAxmosdx93z8FsIDuCOS8WxAzEQLHaOdanGW0
X-Proofpoint-GUID: hWwB42BIeqzxBZYY2oOTYbBkhKEyr-3B
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=68694e08 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RJW-fAkOStluX_mlE74A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050106

On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
because of the hyp limitations. Disable PRR support on that platform.

Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
I currently don't have access to other devices from these generations.
It might be necessary to apply the same workaround to other platforms.
---
Changes in v2:
- Simplify the workaround as the issue seems to be limited to SM8250
  only (Rob)
- Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d9c3ee3d084c215362 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_prr_addr = NULL;
 
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
-			of_device_is_compatible(np, "qcom,adreno-smmu")) {
+	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
+	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
 		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
 		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
 	}

---
base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
change-id: 20250705-iommu-fix-prr-600451b1d304

Best regards,
-- 
With best wishes
Dmitry


