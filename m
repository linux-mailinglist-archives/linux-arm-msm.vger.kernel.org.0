Return-Path: <linux-arm-msm+bounces-58795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30189ABE4F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 22:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A06A3B0C72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 20:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931AC2820C2;
	Tue, 20 May 2025 20:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ludPCjVp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D625C6FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773895; cv=none; b=urkZvdfJgvz9hR21nw8RCRnn6h3qFJi9AcT5lDoYKPfbwGWHeuka4jHSTRUQlX6A9ZfOELmplbG/HuMrnPH1SML3ptVe/kZPnU1JHJD9Af3U9vyt88SQ2HJl9td2QK2HQ2rRkNTxt2V1b8vU4P8yCOCKei0b4tpt1xKaFqdr+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773895; c=relaxed/simple;
	bh=PA+tCKwTo1nH+Lso+Uwg7CdiMtEk2emhO7vsfJ9adLI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mcMdAGXH8wgk3BXW0hVVSjxSDruUlFQZ69VsTTYecruWHGTZK7m2qGqUrhCr8+sM2nXbCKCHXsdfwBs9Cn4CG4RaoxrcaxOqf264B6N4f37Lcm7q1lcp7Lv2N1dTy7RsY6RlV13Uub3Ys/+QtVrc3HXk4lGqjTfy7vkgcIlvyoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ludPCjVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KJjRJe023945
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CnhEAhcJpQDgCGDvh46RTj
	Mj70tEmGh9F2KinGlWxFc=; b=ludPCjVpTFJkbjufdT8J1F5lvW9Xegoi+XLqb7
	CV10DQlYvLak/aB54M3Xx4I/38nSwr79c6um/ULPMTgVAbAyEqorClVstrXC58lD
	2pSoT6aSt5jbt8niKXpxSjWIbyuTlvqGftylKQO+6Ytae/vcYxpPF0N7oZeaJwW5
	v06dQdkYBcEy6JtrwI7jQYmNGxcSRdG253VOpab85aghNjttOpZ+bvT4vkOG4WeE
	T9lRx4uzMCPN+9nfio3ToGS5Oz4X19egzL/kkd8R55LA1Ahmi6bVrNK6UeDRQmYv
	2ghM2FQ/nsTPJo/mur7GmuKSe8qst7eY1f6XGfXafCNsX0Fg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf98kbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 20:44:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c9552514so56675106d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 13:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773892; x=1748378692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnhEAhcJpQDgCGDvh46RTjMj70tEmGh9F2KinGlWxFc=;
        b=ffbVwPtVdBFetwOXGSIwfDvOEQQkgiw98qDCydhfXkGDSAvbFuXPR9sQcVHDEz9BWe
         dn0in/1KHmopau7a5BziD59Td1m6d7QcDXu2DgY4A9nqsubIi+z9+J3T/zIZdP0HTh0Z
         Blc9ruH+x2+6K656raDfJNatTBv/CNyOWdeeTDf6l+efllve3X8rknUVuIGG55gqS66f
         AQ39U4O5LX1f/P4z98EGzI4/q4h7xTboRX0M+moMPqEOJmZzMA64l/IsQFWvmkwiASD4
         YtRrQJzjIwcSZRKSGSqJ683ovNRgI56WqFlXJOUydSXwxiyir6LnjmGfJd5UQocj7duh
         fItw==
X-Forwarded-Encrypted: i=1; AJvYcCWCSFI7b132e6Vh85sG34Mkl/aVdJlTqPD8nOTjK2dCo4bF9DHtiNykglgd1j+hZDqCGenOwRXetJuR+af1@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaMJyC3qLRSuGZTiC6nbruz9srrFFN7HysUMSAZ7OprgH8wjO
	rmF6cQMNcnu+lQBrxCQaIoxb1vB/9KkyxQk52o4VnMOao5eNqerg9WI6L66JJ19laD4fMKh7HmX
	pUB+eYrO5kMZqtRxWlTXBOYPs5S9X4fQV8iF4Gm5XLobov79XQF/JuhtrPQXscnMbUj2c
X-Gm-Gg: ASbGncvEc7uFEOtRpERladxlbb7FFG7yxcLJohkm5vaHTWIWJyIrK+ZxmkQ9XOqeB+k
	ZtL6x9eTybkmIU2YuWnYuG/LqweaJsb1zwpFHBk6y/4RR3Eg4teYcNKdQT3aXt6u9iEK9uimYrH
	bHq42RNwQM9UjgTrKCK39JfS7gB+ZzATEFtcj57wP+LJNOVIrW+MYRZKLbpvKmQFqPI6WTr7VgX
	meTxRjM2qtuodFnuNrS20cvtBOJKEzOpZlWSm7rMUREumPyt3Cn2o+IRmm9jiDKsmvvBMAhzVSE
	AvjU/teSp9tIWk6t1A686bdvjeRtBuVielTEL+/pKsXZl4W6+HJHd4sNUOjluTBRyI7P1nIDa+1
	KrJqN/ot37A9Y6k7KEZ/l8IwP
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id 6a1803df08f44-6f8d9206bd4mr119468276d6.14.1747773891740;
        Tue, 20 May 2025 13:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGfp+ypX9kSBxgzbkN+MgSu5aIfQQmM0ZkghxJplqrv3tEo+2xeiuUHFeyxXpUk9ezuAwdhA==
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id 6a1803df08f44-6f8d9206bd4mr119467926d6.14.1747773891241;
        Tue, 20 May 2025 13:44:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:44:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] drm/msm/hdmi & phy: use generic PHY framework
Date: Tue, 20 May 2025 23:44:42 +0300
Message-Id: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrpLGgC/zXMQQqDMBBA0avIrDuSiaGarnqP0kWiiQmtRiYiF
 fHuDYUu3+L/A7Lj6DLcqgPYbTHHNBeoSwV9MPPoMA7FIIVUgoRGP2AYpohL2FEp2zWkve37Fkq
 xsPPx87s9nsWe04RrYGf+j0Zo2RHRtRE1SWoVaSQsv5X32hrec3il7f6Os+FUJx7hPL/eOzUUp
 AAAAA==
X-Change-ID: 20240109-fd-hdmi-phy-44b8319fbcc7
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3665;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PA+tCKwTo1nH+Lso+Uwg7CdiMtEk2emhO7vsfJ9adLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnABXk81kaZokLdiRD1RUNWGemqA1YFMLllF
 8hqIxr9ewCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1XGYB/9dPRhf86STXfF/uE1qb1TGI/f4ZSLGsiECHc/89fO5BSSm418umoc5AOiIwXGAm3B6JjO
 mOZvsLU1z7MspwYTdtlCgg5TILBd8hjF9c/gXk88g4U458MGK0DeKV16vwmp03DrehbbmQd4qpe
 BMJ4d+AMsSm2q7iAbSi5pllmP4dpciCdUalImp2CsoOsDRcI2WQ8oC5fDK/YLPZMn3dn4QXGY0M
 nj/elZWzy8TZq7iqunmFG0oeOVPvDmhxHCNmPImrcobEXvWetj7qdNPqUwjk29WEi1sFmc2shBY
 nLtLpx8bcdlN5XTSymqHtEW6JSeWIUBLGDp2nJoZihXt75UA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 2BcFb4GmFWnWGLZQX_NW9eSmkx1FvWUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfXzsclB5d04kx/
 UIW5cUO3wFjm0SB9FVPdAEr5IQ/pYfuxNjqFG2SzniU4GhbHnrFZ9goPIftkRG8fPCQ4VBErR/R
 ztHyjTCA0rhuxH1kEOXohZaxbHHfHOY/w2bpX6irc0yVvvg6FgTys5C3mhVk3JwBGcfxnXPFQT7
 24DPsqyq9pfXU2aADi2pb3Emu0nFNZL9EG7LHJhm6XAMI0YuvYbS4HqtkC4S1paFET1moFTtRsd
 L2Vyw5a7Tv50IL4wexSv9hMg6TBWPfrYcZQhJemx28PYMKU9Ix645Xu/edmfjs0WrpkBH5h1Xys
 de16Hu0sLVa3gi5h/Ja9jX1TFHeZsZ5Erej2TY7nfh3hMYWdRihn/ybwMpqrd+7pLHlqc0WLe1A
 me/EdXRY32TMa5hxUuNbfwPMDcN+tJ5LVnuEbMTQBjI/chgdR1fD48MRX530Z5GdS+Ny/xBW
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682ce9c4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=I5G884IeurQlcsuiieMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2BcFb4GmFWnWGLZQX_NW9eSmkx1FvWUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200168

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move MSM HDMI PHY drivers to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept at the same place.
Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
common helpers for the UNI PLL.

This also causes some design changes. Currently on MSM8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
driver and posted, but not merged, MSM8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: cross-tree merge via the immutable tag.

Changes since v2:
- Rebased on top of linux-next, solving conflicts
- Squashed add-and-remove patches into a single git mv patch
- Dropped HDMI PHY header patch (merged upstream)

Changes since v1:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

---
Dmitry Baryshkov (5):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support
      drm/msm/registers: drop HDMI PHY register definitions

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  21 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 330 ++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  65 ++
 25 files changed, 2584 insertions(+), 3155 deletions(-)
---
base-commit: a0fd124020ae02815905d4c6808261bfd262ac08
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


