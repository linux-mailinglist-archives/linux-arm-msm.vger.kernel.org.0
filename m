Return-Path: <linux-arm-msm+bounces-74739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F2B9C915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F901BC1A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9E32C026E;
	Wed, 24 Sep 2025 23:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GaSp1RQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B972BE630
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756551; cv=none; b=HE9Tg/ZdcB4mka8HHvJt2i6uEQk2HyojpcGp4E7+3v6oWUMzv6dpr8UfvqtSy4K9hKptfF6iL5z7J2F8KI3Hf24Ug+bCuqYpzAPDojZuNSaJjOUArunXfRS4dwPDHmT1OCBnAObVFxybppqDMPCN5b8SESIoIT1p+EgKE/Z3kr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756551; c=relaxed/simple;
	bh=1ixz4E1H2pIiXzLXyMSyDlIXCkqJA/x/F+DP+KNf3Q0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQ7VStDZzQ25wS4sCeiR7N/c2NdKhlt9NxotxbPjh2RVyoqiEfGmg2R8DVnK+rhWnB/bvqoz3P6PEtYQsSazFe4bvcqIDfWRDwH7q3u5eXl/Aggs5RJl/ojtD8Uq4RFrAPQJQcGNmvGMxGMPh+k1nuvuCfWOwomLOoLZxiiTgLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GaSp1RQX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD3c1J028188
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yoYprIzQpGEht+RtS27992YaizRl4nrFk0NKTW3GFWA=; b=GaSp1RQXuPs/Lo47
	6bjaqR8s8oESCs8ROTbo6wAzzzVWbzxoxET/0GlN9dIHC767HknaQBgeHIsstVTe
	my3uH2C7bTc60NlxnpA9AaDAwxDWXcnYYoRY2mUIlfXZBTldGLXruRKtF8JBzdu3
	nReElghga/YDVLdy+vu1TEI/mN8puiRQk9iiSzniQw0pV/0WivLcLSVmOieKycwV
	g6JR0BPiS7dby2qSK9Yrbkb5ZwYJBLP02RKPaghoqXjjlEWMRVQVOTRNT8jDsuKV
	x9ZoKSY488Q0ovObgwBNXdTSebIyUDvLnljn8IOkBK8Byfp54XFfEoSt1UHdGWPM
	pYNC1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnxcju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso3554935ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756547; x=1759361347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yoYprIzQpGEht+RtS27992YaizRl4nrFk0NKTW3GFWA=;
        b=HshTQfq4C3rSO9Obhlez/RBlyyHubLgnWChcXvsjKJEQrWc3kFXVE4ut3ykD9jRX7m
         rtVXfAmmSZJMf/6tJw/s5zQi1Hs5owXdxKewFfZhIGnJRfjJmnEuQXHRiSG0hN761y4p
         AqAim8Bu5KNlJYF6pVVt7ttcXBq3GIGSldjBt1K2IKkn4xtngzXzNyuJ7XIGeemZzQVq
         5zfsUqG0sTF43vPpTbEMr/vsM9RS02QRFF/lq24OIeXfHjn6n4VmzY00jAeaMfXQ1A63
         kFnU5IM3aqIFmq2RvjAgwpjp4DvXh5ICsEfae8g98idbnhT2D8UyiGns1lv5aaGU75yy
         b3rQ==
X-Gm-Message-State: AOJu0Yxy8mjFgL0l45B0GtknGI4w1JbTfCWLnHiI6o2OSlEXNRbn3Ewe
	nGQJberhVZI1Hr2aB4IOUTpMG/oSpsmxBHOOCRkxjCvbX+XPHiWkSX2UabVuPayQhWe6GAwgl7r
	AMbuR6Fa94v53illtcPeEdRhPGts8rVEeOpAhza6zdx296weYXHpcD4n7isgVx9JcytOd
X-Gm-Gg: ASbGnctlBwy6lfDQeNkQySeqNDJoM/4lvKWIkoVRDVJimRLvey/+WmjCZW+Ky2gTM5x
	4ytYm5Ch7gKuw+IakGYvajMWRukT8lEvl9ACYb87vKHNkiNr9z4gtBvD8YTFBtN3R/yN5SnWrLW
	kJYpKfjwhoKNnKl+pXPZG2UpBlNPgyselFN5aupcNMobaWCpyq7DXedME4gLdX/Sxxb0wHp7AJW
	F+5zrofo6YPadylHXj/uiwbFBOWuY6U5eAGLak6K9K1RCvyV40LX9oeANyblYhYrAmCmfzlzxb4
	Lo3r6US3ZTYg2wXREmnbMr2cRQr8E16oEscxm1DjUYgFBwNg9tR4jheOkGQbbcEjeQIgA1Ou9J8
	feVSbkyeXv0obcGk=
X-Received: by 2002:a17:902:e749:b0:27d:6cdc:99e4 with SMTP id d9443c01a7336-27ed49e6cacmr15277785ad.21.1758756547557;
        Wed, 24 Sep 2025 16:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgt7aoTizG+JzBBCRszUgmA8ZQFFFV6kXdzPC21oHMm1YuShUXyP6D9IxHyhwdW2zXjSqSjQ==
X-Received: by 2002:a17:902:e749:b0:27d:6cdc:99e4 with SMTP id d9443c01a7336-27ed49e6cacmr15277545ad.21.1758756547098;
        Wed, 24 Sep 2025 16:29:07 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdfafsm4292825ad.30.2025.09.24.16.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:29:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:29:01 -0700
Subject: [PATCH 2/2] dt-bindings: phy: Add QMP UFS PHY compatible for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-ufs-v1-2-42e0955a1f7c@oss.qualcomm.com>
References: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com>
In-Reply-To: <20250924-knp-ufs-v1-0-42e0955a1f7c@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756543; l=1139;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=1ixz4E1H2pIiXzLXyMSyDlIXCkqJA/x/F+DP+KNf3Q0=;
 b=e4+RfHwGDQQ69QoAGJgmiuXeCPI6N/wpSRjaFCHERX+3Y9Wd6oeSiZH9OuG6nj1rSJ9ctggJX
 nFb12dXQbf5A+22joIbSiJNqgjR/D9hN/PK5aZ9Cp+UdhKJ5qHcQo4N
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d47ec4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=CSN1HuAOl2xf59Ui8-YA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: dYRAt54BTmJlwPCqHfCKo4iNSkawKKR5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfXzWv53DheXtoZ
 Pv4zMaD/2dSGCTljgVO9jG/T3qW6o6OsjCStCCKFE2Qki7tYHc6DUdtbwsJ4JYG7s+v/fYk+Pv1
 E+LZ2CNjMYIWPigqPCNgkXo7oAyD/PyGnCQHp6Gu0zWQ3NvlUnO98sbzQ33AkNvbyzJaEPW8WmC
 bJjsajO0F735lHJdecVnFXpZR1cw7prdzSGLG8ExfiWdsicPK6JnrwUcLr0avhoo6/G8SKkjwbd
 YxeKN7kAxi1iLt/uJaB8fitAw3K3FuREAb9QqLTObXpdrNgXr+wDacWA4ZDZeClweu6vN1Yazsx
 jEcq3i8DyMVEC19KKyznydTJtsgsmqh/7wBiuKUALjGjFHBw0od+cbltNrfaPzaCmtskb07xlQ6
 1q604nm6
X-Proofpoint-GUID: dYRAt54BTmJlwPCqHfCKo4iNSkawKKR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

Document the QMP UFS PHY compatible for Qualcomm Kaanapali to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the Kaanapali with that
on the SM8750.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index a58370a6a5d3..fba7b2549dde 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -24,6 +24,10 @@ properties:
           - enum:
               - qcom,qcs8300-qmp-ufs-phy
           - const: qcom,sa8775p-qmp-ufs-phy
+      - items:
+          - enum:
+              - qcom,kaanapali-qmp-ufs-phy
+          - const: qcom,sm8750-qmp-ufs-phy
       - enum:
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy

-- 
2.25.1


