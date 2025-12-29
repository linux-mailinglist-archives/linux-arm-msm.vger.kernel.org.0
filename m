Return-Path: <linux-arm-msm+bounces-86781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211DCE5FE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 07:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 275493002A46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694B2239E9B;
	Mon, 29 Dec 2025 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUYBntF8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmby6uFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53A3211A14
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766988434; cv=none; b=f+JynQ2FMHeekhqov27xKO6v9BpKylYItDvLlPhRvRIFpRODA7tDSTJXf2+RuBPJPdOiE/YRLCnslGNg5PZ0SEWL6pOqQSnD34ucBCVuw/Yqbi5zUyZYqMSo+qDtjciodUY1mshzUvS6FOzGwRy31uWmC0B9uXqQzEYVZs2dz+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766988434; c=relaxed/simple;
	bh=TX/gNHgRQ7J1bS3tbk1Dh+FkfVaSgF4IVbbXpym+A6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pTeSl8A4scWvULaRu+8VeEKkSJxKzAuzob9/beiSGUTZ+kzRC6ibCEPWr6UktRD4XYMLfJF1QvUUwjcndnPZ7czrX4gn8CPXp844vK/669YUEtM5iOuH7w0GziMRqldwI96mq1G56nfKol9ez5hD4CK8dqvNWBMNsDuD4YV5P9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUYBntF8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmby6uFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSNdJl8322822
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sveg7Kz1nFapUpPK2hM14UlNm9fSEY/iz4N
	I+FoNRCE=; b=jUYBntF8aOw4klv08qQXkvDKALehx5oKSZ6ucnSqZZgRfBVST62
	akQKLhygbqFWG0SlYffuQWo/hWg1YilYCzzByMfuzipqyxuoSxvfq3MiGSVclnLL
	rmKdNr6nW2ZSJzD4Y2iUuUfWX4+Jn/B6wXhaOpmNU/c4260WfA+LdEh04v1+borH
	nnJPC1Hx8hA/nhQRk8NcUbch9VQHgoR5gZZBVr3g+znilFigTHjSzepMHsW1qCKy
	prFVC9GIa+SjFglDUVotlM9iEJMUyhMkcMRbD+ZOHnxgeQhasY9W8ajN7Rja8rFT
	7nJPMf9mTA1aeczx8DTvU0vvsS3MCHYwgQA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v0rw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 06:07:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b952a966d7so18287008b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 22:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766988431; x=1767593231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sveg7Kz1nFapUpPK2hM14UlNm9fSEY/iz4NI+FoNRCE=;
        b=dmby6uFcXmGgM9bCTvPst5G6t1zSgyg5A6QV8YbS2ttyVprkt7lSWXWs3Jw+qB+9As
         tLzdX2a5hA/cj0G8wsSUSCYOdqtGvykYkYwFWz02GJ+ochF/1xoInD+49F6aBSGyLisR
         1LzuyZ6DR6trCW/19kEfD5XyRnXYUQybDQxzVPzhOGmvPmBwtsOpFPnAfIyw/VkbJfUh
         i3GOhh5eIHA1agWk8EHanNlAQM+luR+S6p/PgQLVoxLLeRd/F42CDCPPud+gnIYANs3A
         JwI0//hsMJb2T2RCUNCOuCbH+KsExFgWO5kuccQqFYQXUbDRqkfc2FXic7irEQzWkffX
         Q1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766988431; x=1767593231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sveg7Kz1nFapUpPK2hM14UlNm9fSEY/iz4NI+FoNRCE=;
        b=Vbt58vFtt0SfEoybTFX/k36lc3kgxwZ+2nWSzMisVJhbnaX/rQa6/Ll6kM8WlnlPDU
         Jfy4CRs9hG4efHLGzZ1OOcja/C0ZD8rcgX2TS2K5xVxsUwsvqGwS51ttQTHRmc55gN43
         6+fqUNvmFyfh9npPOHMtBGgFQYMJ/dgai0FKmsj4vtj8yYVyOA8ytfQ5Ni8z40f09Kp7
         4ExyExuO/kT3MfQdLhnSF5/NCLaq2Py/DNZ0Jjq2KusefhTvZIOxacMnHrGZcWusljyI
         udI8nPlKdgU8FLnuADGe7KRFZBF/aKrEqP7bsepLahvsYKom4s0yJLQjg34uUNL+zZqI
         NTVw==
X-Gm-Message-State: AOJu0YyBltjVrlYO7+aGfBXAhU0ku6+iuCZu6kQK7lUllw9P7Q60ZwUN
	kiqUFHQxfQjaMNfUns/Clf6lRvkHVlxYB7GIHYh+6UtN2rOtP9njrkIIdAsLa2+/rs65pJSlKsC
	kwkePF/oK/qQgnpY+ospOfPoVDni+501mm5+pCjMzN7/xM5FPm2Vz3uzxo2dvayzMdZ7N
X-Gm-Gg: AY/fxX43qZa0GLrdxKosphqAm7kjotJbJezmaRcmMrS2T5txczmQdyxWxXgutyCbFHz
	DaipZJ0Bvh/tk+UEKjpVT1aimKv6s7shTZUeSc6NTFoFz5z1s+lpKAv5W8ecGmYiei4O4M+WTGK
	FsAsDNS2jSNwe+8pRlr9+whpXZGObzOM/JOL0Yp6FFt6En59UonlU2k9dZjCDVZUGh3LD39/Sjn
	Brz8TT2fIMLfiU7rpB9ssnb5tmVhw+lQ1v+Z3NQ8Zm2wBLluLzfmpfQZzyJIt03TbAVoVgN1ECx
	6Lsplov9HquJHxScBDqRbmET2NeyaCDlb+zq9jIFoHOXneha6eK2DxKv78CJ42W4qXttM+R8WhJ
	akUgUSm+U2Ms7lUPe+kzx20DEB10jZlZpZTUIEbX/FltLy1BJkj6y
X-Received: by 2002:a05:6a00:4f8b:b0:7ff:c51d:7e0 with SMTP id d2e1a72fcca58-7ffc51d0917mr28101043b3a.3.1766988430501;
        Sun, 28 Dec 2025 22:07:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiR6c1hYnyTq/21Gn61ST9siCjyEGbeaNeJXv4ebdm6O1biqX/yA30qxEpWML0XJqb02hwGg==
X-Received: by 2002:a05:6a00:4f8b:b0:7ff:c51d:7e0 with SMTP id d2e1a72fcca58-7ffc51d0917mr28101026b3a.3.1766988430008;
        Sun, 28 Dec 2025 22:07:10 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e8947a1sm27917763b3a.67.2025.12.28.22.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 22:07:06 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V1 0/4] Add UFS support for Hamoa SoC
Date: Mon, 29 Dec 2025 11:36:38 +0530
Message-Id: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qj5UMjHtRD9Ak8Ng1_9Fn_fKxfWGmXwR
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=69521a8f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=MLyGsh9vszGhAdf804IA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA1NCBTYWx0ZWRfX2ABWNSBsQrMT
 AJwq5yOLKZuWjCYZk4h2P+wjNdjv1iGPgeSX/KwdZyuzH0ewC/POi52T72y2X9eWf7gSjll39tT
 LGEYgE8rwtaAwxLxL0dxHZjX4CtkHKrKj0z29FAjG8eF7gqpc/FdtxyhUvvd2Snl31Ody1AnlUK
 0bzHL6tQUr0PgboTfilxclGCU09ul8re1zFp/A0Y9TDy8ZMK9uTfyTlf59Vt/Xy4H9I3CPBiJ4F
 ZnTDfUNSiPnASN3BOJxkCp1LOom/W5/AWpRTCZs9oOJshMK5XNMUqz6nEkO8AtlfxAjAvmUwMnL
 Pug88G0EDDIZUB/4ISvleAoAd49KlYkjlS9xOkzamc7RWYQ3Z+9LXJf80G1oEDRAfnozf0T0Sp+
 uDcqCCtrrfJlcBeES7B7D3l+6A0ZbWiVjHp3rjzJfVFHe5bBMwDjEA+w8EatTvTyEtbQpa/i5+s
 v9PYzPpdh9BCqxFYFcQ==
X-Proofpoint-ORIG-GUID: qj5UMjHtRD9Ak8Ng1_9Fn_fKxfWGmXwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290054

Add UFSPHY, UFSHC compatible binding names and UFS devicetree
enablement changes for Qualcomm Hamoa SoC.

Pradeep P V K (4):
  scsi: ufs: phy: dt-bindings: Add QMP UFS PHY compatible for Hamoa
  scsi: ufs: qcom: dt-bindings: Add UFSHC compatible for Hamoa
  arm64: dts: qcom: hamoa: Add UFS nodes for hamoa SoC
  arm64: dts: qcom: hamoa-iot-evk: Enable UFS

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   4 +
 .../bindings/ufs/qcom,sc7180-ufshc.yaml       |   6 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  18 +++
 arch/arm64/boot/dts/qcom/hamoa.dtsi           | 119 +++++++++++++++++-
 4 files changed, 145 insertions(+), 2 deletions(-)

-- 
2.34.1


