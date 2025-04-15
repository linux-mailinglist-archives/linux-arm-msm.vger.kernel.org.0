Return-Path: <linux-arm-msm+bounces-54366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6921A899F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA75D175904
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150A92797A5;
	Tue, 15 Apr 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzdINMk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F421CAA6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712806; cv=none; b=LmdABzlExLrKpjeT+hQmZBz581WL2MjVlGZoo3CDEsgAEtHWQYYPIwRW6g4/8iJEZHSiSd5pLKFwAkwXQ+ESjRRDsx8Z0Vqe/mBp9eYFqSCXkJxJBhD8AzEvbrfQs2TWtxVlv4EgHS/iBIOQKrBiBJKMFy5Drhz2MNMsRzVjICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712806; c=relaxed/simple;
	bh=QYugMVfYVvLSYRveE8OjurOVSqQAHtx2Ux3lVhzLO5Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X43s1QW8aMmXwJrmazrVxm/qKMG+eSlHc1C13UsqDJmlCnAYSAoGcJOc2VrPNMUWw6tKa0uwrYJ43k5FyublUhYIzAChZ8IkBHgtRSn1+YQImKxaIhrLASc82+eJ0Zm2PF90CHOwl6ReMJbYZu1BgCUFH1bUHP6ctxboPENgT+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzdINMk5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tNB8013256
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X/WtKN1AECy0M/BWY9LX4p
	Jp2RATeXAuAQYhMYyXc9g=; b=BzdINMk5OcOGEqCtWc/Z/sRJLoxuuLkbUUnYAo
	PUOcJjxxalNxcUCJTB9Pa17uviu54C1pyEgDd42znTbd0CW1Bt2AaWGVGMA6uIuC
	bPlvXA5RE1lOcLqpoLqfVwocO7Nd8VSMzqvfApCTeCa3mPQjctoflREt1REK6noA
	7gpTZEusx16bXeRbOvLgHFHC+ZZRqaBk1CvanRE+SVUFrzwDr376rEv0XjXuNzhG
	6RBqdwqbYn5mktMVMxvv102Osvq63tQn6FhYeHmF//yJbg2WVR7vCYaBcGnynRgG
	gHNOXQ3ZyG8E+wO7n9L2tIz2TqktRvMaM8/6esDeP1q4dZ6Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fng5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:26:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f184b916so125665266d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712802; x=1745317602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/WtKN1AECy0M/BWY9LX4pJp2RATeXAuAQYhMYyXc9g=;
        b=OEeuGkcEziIOxLAcnoj9639BeT0xkogBnJHjAZUwQY8B+2sHuDjlqozYb340PJyjqW
         FWPpogEba6L7kiJjSLcRc6VLGu2BMU8y2spNkcEsHGc3qipk1xMhfNinXXX9phv5DdaG
         Ea6HxPtAT8RfrjeKh7zVy4WxjKQpw6ymre80Wv7nWnjKDiYVwgLgFgU1UmrHSRuqiC4j
         SrtwhWIlQ12nvgWzhiF16LgaFMxZecKN7EKKMMmXkr+pRAxen7UWa0YhyjLEYzJz5Yuw
         yHr7UezIIyaATkzIm+VoNYXrHNHMBKc1i4FYFBzIQUjHPFRJ87y3ovW+COR7p0+AomHV
         QBJw==
X-Gm-Message-State: AOJu0Yxhtw0w05vK/sxAb3RxHy6sT6v9edL3AulrAE/1Js6RPRxEWgb1
	1WJTGbjwrZvWR/v5zUw9q+u7evz/LzqlZyDRX64+ul+0+1EHbztHxMg+e2SMG4FqjWsWiD7ltTh
	NCA1EYR69uOL41nbeOqxMazJ+ieNZoYb93xMBokPSuOoIwjkUsWZFPFXYHO3JaobGLsM1Pugy02
	jHXA==
X-Gm-Gg: ASbGncu6Tz7SIgE2eVm26SQk0bAGBo/m7KI90vzRkCZd8o0xWr8IEKxWQRjoOuRmXLz
	9fEp8okYur/E0aB2RenXTGhWSandRcKb6GFk2l3Kd5KQKU5mCZQGztSRO8cjXL0I6Q1NnaERHqU
	4s15cUn/CLFCHoPAZDmwhr+dsPOL276ZkrhzRzxV9cPg1aS0pqueDWsXHhlidNPFKtQYTxfbxxK
	qyDMB34kCMYvGuJja2srmKnZBMUwfJOxmtWtqaIZC3yZLazCqsZLfePXX9WyXCZbhHrgKQIezpL
	q5/+AhEgMHlDUZ4IOKNdUhlX4IaTWNmQi6YOf0rJzUKfeVb0lCbz/eSYFdv/rZmKzfPDjjM8MWo
	hJ3NwzRmMEPwtyOYfUL9HZYHh
X-Received: by 2002:a05:620a:6a1b:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c7b5dc2feamr1377173085a.18.1744712801820;
        Tue, 15 Apr 2025 03:26:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQkB9B4cRRHGs0lS8BPNTKw2hR8mld5Rx8as+s6ViIlEv/ui2RElc5xqoCFN3WDYStZYgb7w==
X-Received: by 2002:a05:620a:6a1b:b0:7c7:b5dc:2e36 with SMTP id af79cd13be357-7c7b5dc2feamr1377171485a.18.1744712801368;
        Tue, 15 Apr 2025 03:26:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035f5sm1384005e87.117.2025.04.15.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/20] arm64: dts: qcom: minor display-related fixups
Date: Tue, 15 Apr 2025 13:25:58 +0300
Message-Id: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADY0/mcC/x3LQQqAIBBA0avErBuwUKOuEi1Cx5qFFU5EIN49a
 fn4/AxCiUlgajIkelj4PCq6tgG3r8dGyL4aetUbpTuDPkWMEtHfgoFfEhyUtToEG9xooX5Xoj/
 UbV5K+QAwxBF4YwAAAA==
X-Change-ID: 20250415-drm-msm-dts-fixes-70664ff6fc96
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2793;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYugMVfYVvLSYRveE8OjurOVSqQAHtx2Ux3lVhzLO5Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/jRaadylFo01oh/vF/7fLQSN3VZAz0tNEwYj8
 YTK2uQYcTmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/40WgAKCRCLPIo+Aiko
 1YxMCACR0VCSUdyKFhnoaLva/hZ3hlHqubOjopbLrCjgdkioDrIcOq/ixAmu5SAjtVFC96MLScW
 bS7bO2i/E6+IKplFazuT4kC+HUAOcXfayvfvMA09KaQfI1bC8K73THyt+585Zd894esYcA5ADn5
 fF7wAIAxVw+YkBMiIrRa8BL8sh642kjHqoMMlmpAeK5k/3cnbC/co5G/qxV7ZnIIjwVP8EOVlwH
 vcVO9Z3Ty/gGtf4fR3Rkw+hbDKn2FdUcpEpkMX9hm4ewMHZcj+U4pYySacOA5Hc02c77y56iIfo
 G/D/AwFVXZjRCJfqxcos97iyXeTkaEbe/Bfr5S93oeN5mnJO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: sp4YWIMOLylK6JNt0LTWl-b2ekcLvlaI
X-Proofpoint-GUID: sp4YWIMOLylK6JNt0LTWl-b2ekcLvlaI
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe3463 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=baB_RGo8eP4_a948qH4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=565 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

Based on the patch review by Konrad:
- Change VBIF size to 0x3000 as defined by memory map
- Use new DSI clock defines on SC7280
- Use TAG_ALWAYS for MDP->EBI memory interface on SA8775P

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (20):
      arm64: dts: qcom: sc7280: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sa8775p: mark MDP interconnects as ALWAYS on
      arm64: dts: qcom: msm8998: use correct size for VBIF regions
      arm64: dts: qcom: qcm2290: use correct size for VBIF regions
      arm64: dts: qcom: sa8775p: use correct size for VBIF regions
      arm64: dts: qcom: sc7180: use correct size for VBIF regions
      arm64: dts: qcom: sc7280: use correct size for VBIF regions
      arm64: dts: qcom: sc8180x: use correct size for VBIF regions
      arm64: dts: qcom: sc8280xp: use correct size for VBIF regions
      arm64: dts: qcom: sdm670: use correct size for VBIF regions
      arm64: dts: qcom: sdm845: use correct size for VBIF regions
      arm64: dts: qcom: sm6115: use correct size for VBIF regions
      arm64: dts: qcom: sm6125: use correct size for VBIF regions
      arm64: dts: qcom: sm6350: use correct size for VBIF regions
      arm64: dts: qcom: sm8150: use correct size for VBIF regions
      arm64: dts: qcom: sm8250: use correct size for VBIF regions
      arm64: dts: qcom: sm8350: use correct size for VBIF regions
      arm64: dts: qcom: sm8450: use correct size for VBIF regions
      arm64: dts: qcom: sm8550: use correct size for VBIF regions
      arm64: dts: qcom: sm8650: use correct size for VBIF regions

 arch/arm64/boot/dts/qcom/msm8998.dtsi  |  4 ++--
 arch/arm64/boot/dts/qcom/qcm2290.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 10 +++++-----
 arch/arm64/boot/dts/qcom/sc7180.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi   | 13 ++++++++-----
 arch/arm64/boot/dts/qcom/sc8180x.dtsi  |  2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi |  4 ++--
 arch/arm64/boot/dts/qcom/sdm670.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi   |  2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi   |  2 +-
 18 files changed, 31 insertions(+), 28 deletions(-)
---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250415-drm-msm-dts-fixes-70664ff6fc96

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


