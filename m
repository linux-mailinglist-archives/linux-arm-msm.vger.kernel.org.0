Return-Path: <linux-arm-msm+bounces-74755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91676B9C9CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45E75382D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A3329E0E7;
	Wed, 24 Sep 2025 23:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7mGMPGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531629AAF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756910; cv=none; b=neJZOuH2tGClmNyzkbAdz/PaWw5GWd1oV6j/SfolVcjK/VaygOjLd3ANFXFWWcMXaQCgT6ha+HnGYS60O8TbPUnLgNl/sJfCpgmVg+A8pnfAbTSCfKAR6qwaQ9BHg80oZ13RA1J+GFmF2WGn4zmkLU6WXa0pub+vCJ+1xenrEcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756910; c=relaxed/simple;
	bh=Rl9KTMUdwIiYEMdOtiL5Lii1gIrVj4sbsfGYlSZOYFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GJ7YtYM+wYeIEitINpMc79wGf82IC3dzUBJZKqRI6sVYZ78D7bGHc7VYAvW1fcfCXmHRrREOts47cPOuaLu0fI2NxBBmrCsyLpc00BsolFW9rELEPtZ6flwoIQSIe2UBFT79ghlt13Ne+IDYZU03oCzgDljDLp1jZp7TG39QQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7mGMPGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OM6Zhc018220
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N1NPRqXSWps5+W1iMU6uaU
	9WzkrfYOwTW1b50gNguWo=; b=f7mGMPGI8o7JG+1U9WjHfi+SVLO2QmqTtNWPjg
	ocknAV12ykmsvYsFBjl7Os8bVaGYGYL4FqVEXdE2Skkvo9p/wbm+C4v7EBcNuqxK
	ERicRIkcJCkUrn1ICDwUSMz8EpFudDjvV9D6Z+mmKYhPbpSpDu1qQj+VsXfV12cy
	PJfynzjYDTsFWxofhiPSaodMbuQBquH80+d6XHu7oojnKbmyCo8v64a2SoKnCcfr
	2oqzJLtn9/RtTWamjuGPkSzh5RfEB6RJQJR2zqqFdc13djLPe+nuf2Y/lzYOLh65
	ZRpo0Tly1UoBqSyevAnArmpBeGiTdH4Rq5qcyeijyF6rb5qw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kka0ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:35:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so293476b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756907; x=1759361707;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1NPRqXSWps5+W1iMU6uaU9WzkrfYOwTW1b50gNguWo=;
        b=Z8Xf67do5kSrNxG4uTq4bJD4XxPcB/vMf2h28Fv1G12d6cI05JJfrgHNXXpkPdycjE
         tBK8niCOpGxdm5dNi1C1JEe9defGznnXDoZz1dfANu01n4PlKRBBRbiLph5Fo07lztrk
         Td2d8nM5uVbiV5zLHhZ3/GUqQk96TUygdH9Tb1x4uuSNzl9zzZQH6egngAP+KI2xS79P
         wreQBurzPaRZwMLe7EMw3FawmXw7PdwKo3dpUAbTM+f3kDUqsgaWWO1v5wNTCJIzgMfe
         1EAfqoklx+22S1SypYKfn2MOR+nYvAA27AP8qHLvisQnXYvzSCqVgsP7cg4vyyS6hHd3
         79lA==
X-Gm-Message-State: AOJu0YxYV0r5ktkN3iSlqZIy+1lNuBlfAEgrLjhRyQYtsevy8saSQY+s
	ZUerfrXTsxsqBcKmpRzsPk0t/eMRwfm1JukOri4v0tVAnpk+PP9Mv7evw2Q/9SzhImPeb9xnifV
	l3H5hEYxDYY26ssTXu+fdQM4Wc2oK16Bi6s67mZ8RYQUxS4FwcSsrN9KcVouVMU4sL2SW
X-Gm-Gg: ASbGnctl35hkZc53+UOd09HwIkJR9VF7gM2EoP//KHsP+CkhQ9lZK4v4Ql1otarnKvb
	HKFc6HBNd8RhDTfdy7H96KKScDAO2UhmeM6RB3JzQ7hUPQhfFz1Rk/IH9Rvt1OMR5oOhaqXmy73
	VMipia/QfSt86bImhC8ptw6QcMia+z4kru8bWJ6cj9TYxLki8Lgxg/Hxw/0h+8vm03yBC/kYxjL
	rEi2va9fSv+gzrIh1jaGn0H4BYFv7SiEUW4xpUpf8SIDyMx+NMDlJ4iedE7jvjVRkBqW3q5BWED
	WKdD7q24GW6jAKkg22HU8p+kEKDyzISlL9YT71et/UBnJdOeU3XKDZ/9ug2cVAFlBWG4vOPesvu
	b4h/ZiW0WjZhRv5Q=
X-Received: by 2002:a05:6a00:2386:b0:77f:5048:8a8c with SMTP id d2e1a72fcca58-780fcf1f200mr1705543b3a.28.1758756907093;
        Wed, 24 Sep 2025 16:35:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvPHLLLfcrAguV8dm/AHzS45EMx+5sChl6etbTWkhwR118b19qGtwnriyiyE7t/rKeIdvbWQ==
X-Received: by 2002:a05:6a00:2386:b0:77f:5048:8a8c with SMTP id d2e1a72fcca58-780fcf1f200mr1705521b3a.28.1758756906641;
        Wed, 24 Sep 2025 16:35:06 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:06 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/4] phy: qcom: Introduce USB support for Kaanapali
Date: Wed, 24 Sep 2025 16:34:53 -0700
Message-Id: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2A1GgC/y2NywrCQAxFf6Vk7cCkIkz9FXExj2iDONakLULpv
 5uWLg+ce+4CSsKkcG0WEJpZ+VMN8NRA7mN9kuNiDK1vL77D4F51cJMmF9CXfA7UYUEwexB68G8
 v3e7GKSq5JLHmftu/o44khyj0nexpPOx1/QNkpeMjhwAAAA==
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=1256;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Rl9KTMUdwIiYEMdOtiL5Lii1gIrVj4sbsfGYlSZOYFg=;
 b=B2o2Pfld+/1LcRIUb8MooBDPIU7mPswCsw3Py/cKadOg7yq2h5g5I/1Uux6fJQDvlvLxO1rx5
 nLk/HHSI2UaBx5sMRoIBsi2K3jiany4XakCAlndBN//foxlslCIJW55
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: eXlbqq3fvutNg-CWBA1QiJlI909prMdC
X-Proofpoint-ORIG-GUID: eXlbqq3fvutNg-CWBA1QiJlI909prMdC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX7iD6cGOtZKzt
 vm6YU21MJhtEEvHPEXY5utRVYOfVS9RUGNwqzjru+A8YEWBf0M400iNghzXLW/YHeT5z+4aavmC
 rnpo7BhZFZoGUpGEe3YBaUbCfVoDuX6HVJsqn/a1cvq8BDorZgVuZnQPo84Th9urlPIVF3IftZA
 FPgUq8h7r1pMG6JJsyoW9N++fKPSkuCmOR3wvKSoGkzzKPcxHrpn7jM+BpYER61VIvXyUF/J+Ur
 zSwhhrwVReMdbnjuPx51HqmI27n83P2vnSIBghznXdZRMaomH9lH6s6v9JIBlSN/OifZCSzo/lY
 EcKObu4/Iqf7P1uPtTYkOaLzjrrnH2/BJo8q3OT/YoDVwZAtVsjY/OUz5mk56m7Fn402EoLw8l1
 MjVxI5NQ
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4802c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=751tZ-0Qz6C-U5i-0qsA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Add support for the PHYs and controllers used for USB on Kaanapali SoCs.

The usb function depends on:
https://lore.kernel.org/all/20250920032158.242725-1-wesley.cheng@oss.qualcomm.com/T/#mb2e1260cf266638a56c04bc793f5fe9ed1b3b79d
patch 4 was picked from:
https://lore.kernel.org/linux-usb/20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com/

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

Ronak Raheja (1):
      dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali compatible

Ronak Vijay Raheja (2):
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Kaanapali QMP PHY
      dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Kaanapali

 .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  6 ++-
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 54 ++++++++++++----------
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  3 ++
 arch/arm64/configs/defconfig                       |  1 +
 4 files changed, 39 insertions(+), 25 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250918-knp-usb-810dc38e91d1

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


