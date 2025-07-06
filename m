Return-Path: <linux-arm-msm+bounces-63845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 293EFAFA491
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 12:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A47A17AE1A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 10:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE5A1F5828;
	Sun,  6 Jul 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBZjEbQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1E17BCE
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799047; cv=none; b=bGh1Jg0kbq/MOrpsUqx/GjQ9cywNbODG7GTmaSmk4MHfeDOeyIEuxBwTC3XTJ0qv2wJToMiiy3RczIYpKXrC0D0UqlAesRyFEAGaJLjxlmlnRUTct/nXvRIzMjpazmUf30lx2m7qK3E2ZS+GX2nPBzizMxLSdaoodzlxpYp+j30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799047; c=relaxed/simple;
	bh=abFeflhuiqRXobFgO/j4I/E9aQ+Bpgb60piKwMt7tVg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JLrbApQCQaL0nomt3eOOHHGNDlwm0UDcF59BV3AbNT+cPho13ka0af9iFd9+f7cMAgpm1El7AaZI74FG0FGbpKv5tyPHYX/m1NQYKmumK/r2p+cRunKKqoyiMJuGZcbTs52khpb/sYr1D+NR6uo6zA9UA63Qn80T05Y9dKteXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBZjEbQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5666XqXs026076
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pcd4BLImn7q/BF7cV2K1Zp
	P7hDYqnAQYmYuUNx48W14=; b=UBZjEbQatqU9+Ki+/vwADmdgljBOhy94WKKtYR
	brIORsHliOrUBdtpp/1snSLoFcSLMKMMeuw1HQjWXELWRFY/GHkqMkhADf+10IV1
	51h1/cy/hBJu/SOOATkzZ/wUov/K5QHLqnCt73Y+PHRgwDgMQT/l5t629Kx4kX5I
	D46LFNOa+igbLveT3xDwiPEkpueEZtyPQTihwNIt/iLH6lF8s0e5XlXPwETZmPTU
	lW6wJ+Up2/19UHn8gIwITZyQWuGZ1Im7oXgc0NJGCFaXNLif6PFuISvbgoWAQNnz
	NaTtZraH7keq0mG4R92/XT0shESvgAAoXlUNc2RvxcPPib9Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk3mke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 10:50:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a584d0669fso46313391cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 03:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799044; x=1752403844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pcd4BLImn7q/BF7cV2K1ZpP7hDYqnAQYmYuUNx48W14=;
        b=SnzbZdr5xcjOfj1AFye3rURmNJl6g76N2hMixF7fhUdO+GsqtAKH8dG6mlz2qrpYzz
         4bhFlE6nQ0qLhv7Da+iGwmScUdq0dv3TRuqbNSfjK0SwXLX9ucgMI0VXbA9tRcnC2ChN
         g1iXE/rpshD928GDApok3AxsNAxFgZL8S7hdNCWxth6BxQ0n8UH75Jp+uNkOI1F2Myys
         /iMW75cOzMZ2DRVbOTDriMOsUo2bv6ZIrXR0hxKsurtPAn30ccKRP9JeqdMiBX84+JSV
         VUHFslCmzaq/gSyilTr2fL74a8/5nYX5h8GIDeKG4Dbub3l/kb499UaBWw6q1cnblehC
         nwyg==
X-Gm-Message-State: AOJu0YyugQvJoxr45fJMT1jMIP4Gf1U9qzzzAw4ADmoznvClxI/5RHbm
	4r5czTAy/nKSrXkhmQp3Awi+/BhdNI0rSqMnOChKlAL3O5xNC0h9Gouk6ulLYhc3JOhlmw2CJwi
	p0G17KZiT4ZQO+4Kp93rwBtV/r2zos/yNpfsAfzxZmTMrmXO2tpb8C89nIl0Tv38Qfne5
X-Gm-Gg: ASbGncurbMKSZdbJ0Er/Vr7Yq/JKVOmu3e5/APBekDo/gHq6NFyQBHez05l4KilE2B3
	A7hfcDcNKssgYHO1pb/AzHGE/yYJYiuTzkMIvnAcs14EHDLBjzaVygz03eD0Iu2kOfn9AwjMcZp
	RPO8qeqUjDxtanbiE3cJsMlN/Gce0rb5MALN4qmGysvsiBv2Yc+f5pW3FJHc/n5bUHISyQ0/FgZ
	cQ3yHBYuybqUKTiJ0UEI6ZspGsF3i0cT2G5jiowjjvOGde9Cz4WQHeD0orTqbKOkwa7vqMkXWMx
	wVkqQuKEIfHKjjmlIRYxHN2oQpWp7Di1Bya+UQNAOu/sUeU0u38KFxpRSd/Knadtrxd4/ahqYYf
	UB9uKpNiFAwRdU124c4B1EJJF2PQhAL2RjJI=
X-Received: by 2002:a05:620a:4510:b0:7d4:4b29:6eb6 with SMTP id af79cd13be357-7d5f2f3f4fdmr574460985a.40.1751799043772;
        Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIukBC1av8TGs1q9stHT+YVv5BfUre5Y4Hxy81XIwRrW2ee07LeCFv+0xcxt99ugtxwdvE5g==
X-Received: by 2002:a05:620a:4510:b0:7d4:4b29:6eb6 with SMTP id af79cd13be357-7d5f2f3f4fdmr574458885a.40.1751799043328;
        Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:50:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm: drm_gpuvm leftovers
Date: Sun, 06 Jul 2025 13:50:35 +0300
Message-Id: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtUamgC/x3MQQqAIBBA0avIrBvQARO6SrQQm2oWaihFIN09a
 fkW/zeoXIQrTKpB4Vuq5NRhBgXh8GlnlLUbSJPVTo8Ya8SUUXKMFwZjyZDX7HyAnpyFN3n+3by
 87wdslSUWXgAAAA==
X-Change-ID: 20250706-msm-no-iommu-c15212a0e7ac
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=abFeflhuiqRXobFgO/j4I/E9aQ+Bpgb60piKwMt7tVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUB7YNmLatqn6ankqSO0Hfjb6vNG59uNUcyR
 yfJ92XOnBeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1ZbiB/95vo+RcFcLBiOFi/mP3tiH9pE2NWoK8npFIpTpCeQvnianNFvEoT6JbXnLTQ1/tIINrGR
 Crby7aelzzZERQY7AONv4DgzKnW+nwyERsa+RG6vPlDNlNwzY1e93D2bMC+enH6SpHKpZqzXiIF
 xgY46g5s5APYU3+APnXEQVl3Ir2X6sUUgeJP44ZYAzafQIJXDcq3YKWsMfp/AH5dlU+DVl654im
 HTizMM8Y0BJ2jYmO4gQKvnv9KuBj90jW5TFh3x/yvtwq4rPzxsZddT+b134io96Zy0uFVi2fpqT
 m2WWrSEjS0dXQ0q1G/HVBbBhJahvmlZx/DBArw+3++tE3Sdl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 8Y1jl3n93R-7M7nE4pzozfqaPtO1jXrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX1lqhnC3n2jvl
 xg+Cnt+VisTPMSnzbxx69jfTH7lAFil8SK+g20f47inWKy4Hkd7rx6HdAnjc4qHpnCX71L7w3kX
 TBr144b0c7hAdPLXOPb+Bxxk+sxdhg/sUpsm/AQMaX4B9/cs9bE5ac+DampZRZxmv7lJAd1o/2U
 9TP3vZLeDSN0QbHI3Av/b9Upf++A86uRGgcMBPq4/eO+YwMYcS85qZrkVEb+klYLVx81gKEg5Xt
 bPBigjRJ90Gc+LrTRuTps8cmVqeu+tQ4cKhqqXMNQv6i0jekh0IHfmMToVssO54e6tCaB4OX+xd
 IElnChmmeDten5VaCBXCRwoOHYdz1BI1VfN6k5VdSFSqWtnRK9qDxAn6v8TXBe8Z6oQR9k7zv1M
 ClilJ0/InAoqaDLuqBSuTCBEaA1jGP+SV+ZQxxjMhS3ukahBseb4/bOXnYTE0mUGQk6Rb5iu
X-Proofpoint-GUID: 8Y1jl3n93R-7M7nE4pzozfqaPtO1jXrN
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686a5505 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OCoH8Ai01jLj_7CUrnwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=936 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060067

After switching to drm_gpuvm, the IOMMU becomes a requirement even for
KMS-only devices (e.g. allocating a buffer for DSI commands now also
requires the IOMMU / GPUVM). Disallow non-IOMMU configurations.

Note: MDP4 patches were compile-tested only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 drivers/gpu/drm/msm/msm_kms.c            |  4 ++--
 2 files changed, 7 insertions(+), 24 deletions(-)
---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250706-msm-no-iommu-c15212a0e7ac

Best regards,
-- 
With best wishes
Dmitry


