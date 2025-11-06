Return-Path: <linux-arm-msm+bounces-80497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D6C38C35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 02:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 06575344835
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 01:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39E720E023;
	Thu,  6 Nov 2025 01:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+OsXPQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGnxn/+M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD0D223DE7
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 01:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762394267; cv=none; b=XbnveNxcYUDD7i4O/eMMjjk8ngACUxQvCLmokJQCik+JgNoNLgfek1/l8IUEruwzi9cel7G13uzMKO89QNWLFdPIXUypyN/VOKeVNAMNbj2IJzY3XAIgBsjof5ewnZ9qi3Rp2JwhNFkYhoOT0W6oeNjzyNmRdhjDYg9Za0rmYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762394267; c=relaxed/simple;
	bh=t6ULjax0uh7L+bPG7+WgBNnKAukjdK5N+1IRTLoMutY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OyWSSwG5W/wSAqrg+ErpJHWCi7QVrJ4TKCKbA3IWYigac5AkTXAwGaIiPk4gI1/1kQ714SVOn5vwAeTPHs0T4eJ0LdhDSnv4LXiOQiynJ8XT1oEbPchC7gssQ1+ZeRtKABiDUNJ8kY5uXZuyMbwjER9ytKuy/yU48r8HO+uPk6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+OsXPQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGnxn/+M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFBEM1657055
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 01:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8PC/2z6b1J/yxwlQIdPRi1
	d3K7LRrs3VyP+EIQ+Duw0=; b=N+OsXPQeij5LSyEG0IL+zwYpp4dUVf/1j653Ya
	kB8VOYeLVKq+/rGqwJbD5O7IidxvCnJYC1GyOWMTKzABLuRmvHv2H3eXATSfsLNg
	4A3RyGm0WOfHJUW821Fcf7xzB7mTSw8ujPUxwwVc59n3IuH1HAeRP12cvNBipWxO
	15pIgzW+nnCyLySeFb8F0ougNrOItxsTQ7uLDKGDiteZuvyCc2+pNVgvIfWz+utb
	082Y+PWVGrBpG8/uyL8hAM0cGdfvHHVYE0KMRyMwsnz2oIKKy9zJeDkpHSQ/fAKd
	0NxJ9WjkpBqRfrG8b9R9HI//+iM+E7S67enNbwIyAsU4crXA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a88319yas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 01:57:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956f09f382so4241445ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762394264; x=1762999064; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PC/2z6b1J/yxwlQIdPRi1d3K7LRrs3VyP+EIQ+Duw0=;
        b=RGnxn/+MBWmuw/2yGaw4ETNPLUpXERTUVDBVigWSCBAxOsH9cG15QvP0Sjlr4jh41V
         YMW5bWbAuhbu93OgHMt4TJtklRfFIKIvvGIr3LmDL8z8b2U1L32E2llh1Fgd9fFHNcBm
         /hGty0vH39dajLGxtiXUEsN+O+xZeT12+Su1bK5ZM0IPbAXkj0BGn77/ElBi8sDnY3wP
         M5wPhx49oHg+w4m0eay7Zm1OEj/7HFPachW0o1QRGO28c+WiTvwnlUa9dlJUwr/91F+u
         R6GucScx+dFX6LbF4KmviTIlpv8VtZB9LEmOaKtmP/uedy6iEZ52ZOR5LR2tw7yCNemD
         Fw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762394265; x=1762999065;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PC/2z6b1J/yxwlQIdPRi1d3K7LRrs3VyP+EIQ+Duw0=;
        b=uIxgSFF2YH4l3cXN/NfK6oSTgPnW35P5tuosd5qZJAEPucHS5saHeleFhQCH9XzSqM
         krSlaQ5+uL7EG/J2JYqD9CGLeeEDAyU8jHg8fDB8bbUwELGNb7WaIzrLbKm6gq1rW49A
         pH8CaFglZvcdyLFIVgpSNLOprQhFaoL+9Usod/rdlrK3g2ZYOQIKzWCjDtHwdS2qNssU
         uxxgKYIuTkOjnyXvSpMA8NbAhTfpMRziL+7lMJ/o/CfNC9w4rFm53Nty1dOJMNCk85qv
         F5Gw9ib19SPJjzDK/ubsYQvYZRIsnnzn4rLeKW4uodyi0sOh3v8WvADshQU6aISjljqB
         iUmQ==
X-Gm-Message-State: AOJu0Yz99VUqrYHc0yfmReTK92clkU/N10jwbXrhAjHry1RiKNzCMlf9
	qGH9Obw68ptQhZj3tDrpkC5aA8u74/xYZ8bUxyR0mFxSZDBGPUlyMdaHr9lUFTg5SKivXri5oFy
	X66R+ksaSPYuyq5Uqxs3hdHsGU9IDCpmguOxHHOfUz1SG2cQrv2vLt3Z/iDFsGH2oOQDOWak2RN
	edkTo=
X-Gm-Gg: ASbGnctJdps+NL1l9cXl66XA83fIHGZMjEmD+/ZHe10WHfEL/WlyCVRs1+ePFd4AET9
	3EITURBUzfNM69wYzmJTpzz8sR4/KXNQRYx6YXKmEKU/WcNEqzrbb4Mf04lM0XlesCiegv3iR1q
	Z4qOWsoPgrYz4CoIs/lTohnzmPEyUICVYdC20h2q/Rhj/6E4TYp8THXXenO0csnCAC15I8RlTvL
	lefWTGCuWY29ipwiN8fdY+c68ORzPFG5GDrt94hMIY2Yh+fTkBMVJMbl8YWJaf3I/uv7yDdRK/C
	I1+zObq53R86zPuxM9YsYgUkvZYipPVK/GhITqGVpsAg4feWhHiOXJ+Od8EOI/EuUZYVoVQqguy
	UrGABdYdIU+hWgPNyJfCqxH/mR0d6es3soQulnYzrTerQqLqagojdfPJ0/yQvWg==
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr20185495ad.5.1762394264492;
        Wed, 05 Nov 2025 17:57:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmUGkZSvsUeTTnsilPJaPGGMkBkQb0ls+edvSO9i2m5uGuoNph4NlzwX5lLH6hyj7ACY4dBw==
X-Received: by 2002:a17:902:d4cc:b0:295:6117:c597 with SMTP id d9443c01a7336-2965084026amr20185125ad.5.1762394263979;
        Wed, 05 Nov 2025 17:57:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c93e5dsm9115725ad.81.2025.11.05.17.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 17:57:43 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable ETR and CTCU device for hamoa
Date: Thu, 06 Nov 2025 09:57:24 +0800
Message-Id: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYADGkC/42PQW7DIBBFr2KxLhEMpjZe9R5VFgMMNVJsErCtR
 FHuXhKr7babkf5o9N+8OyuUIxU2NHeWaYslprkGeGuYG3H+Ih59zQwEaClFy2lGeyJOS+Y4e+4
 Wt/KQMh9xSsi1d63RhlrVE6sd50whXl/9n8eax1iWlG8v3Caf2/82b5ILjkFrcMEaAe4jlXK4r
 HhyaZoOdbDjYydmuqxVZNmxfx5Va2epH9YvY0ozusSFt6DB+yCkGLb2aWCx1LuKiMvQmB6UBGG
 E6bp3ax3qHpXTmoIM0PnWQK+cDKq+8vgGEN1qAFsBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762394259; l=1207;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=t6ULjax0uh7L+bPG7+WgBNnKAukjdK5N+1IRTLoMutY=;
 b=Np7STajOLOX3KQaJcttBtap2LpgDeSchLLIDNb6bsujzOUj82lg/iKtHRsnIm3rwBMT9KJjtq
 Sv+i7n32bgqDpljDCfLrn/Q+P90o4FwEDxJyJOtwcGA7Tva6cA/iRHb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: NBobkf3MKGUj9Ldp8j8XP8BWA3Ahc2r6
X-Proofpoint-GUID: NBobkf3MKGUj9Ldp8j8XP8BWA3Ahc2r6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAxNSBTYWx0ZWRfX1t77IjkOC97f
 lvQ0DKup930xFKSHC3dUdd6HbHioPnwyvUna2dv+Fkwb38CDozytXNJKQ7DMo0G2JYNSJ2cj4Mj
 QH32Z4OiwFImCf/Jplbo8SQaikVQPjJzdV4+i8wi64RtsjLWtKA3cBmiFSddNF7oaqhtq8vY1lL
 kild71n9x5AfeO3x2Hjvg6o/NasSxQLOe/0rPXewQyuukwlIVjFO59LhjAsnLYz56GpYmUCnBk+
 Z6tD6AvAoYOfG/rZTHlUHLvRLx3+3Uji1zEMtKbKhe37qYCMxdMxD9Rc1mc3TfM40kxilVRSWea
 oRnNPMhtUDOdpWt9Me/xu9+JKnBdcOZwsrG4e/Gtppb00nebYWT3MdevAxFIwoVHuj5GRyYqzK8
 lW1IYIh7/WPOeoiqm9XTclQVekg+pA==
X-Authority-Analysis: v=2.4 cv=Mdhhep/f c=1 sm=1 tr=0 ts=690c0099 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6fBNxW2ai29DZFBfugQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060015

Enable support for ETR and CTCU devices on the Hamoa platform. The
newly added CTCU compatible will fallback to qcom,sa8775p-ctcu for device
probing.

Dependency of the binding patch:
https://lore.kernel.org/all/20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
- fix space issue.
- Link to v1: https://lore.kernel.org/r/20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com

---
Jie Gan (2):
      dt-binding: arm: add CTCU device for hamoa
      arm64: dts: qcom: hamoa: enable ETR and CTCU devices

 .../bindings/arm/qcom,coresight-ctcu.yaml          |   1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                | 160 ++++++++++++++++++++-
 2 files changed, 160 insertions(+), 1 deletion(-)
---
base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
change-id: 20251104-enable-etr-and-ctcu-for-hamoa-5dc4959e438e
prerequisite-change-id: 20251103-enable-ctcu-for-monaco-0db252ddf010:v4
prerequisite-patch-id: 24741288526740f3ac246613ce8398433d5c61c9
prerequisite-patch-id: b361d3a1a00bd5a94aef678c052e8728f7583339

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


