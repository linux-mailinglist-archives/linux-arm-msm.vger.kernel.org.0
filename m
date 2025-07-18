Return-Path: <linux-arm-msm+bounces-65688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3E6B0A856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 18:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD5955A3684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 16:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D98D2951CE;
	Fri, 18 Jul 2025 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4JCJR3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88B32DCF66
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752855663; cv=none; b=Agi9NXRgvEP6XUruBIy575fS5/YuwGxvy5NZ2qH6nt7MN2K/66rZa9lFG6gYa957ZYJuPbIWjWD+DpP3Uk0U2Qi306zOef7PVTEyrK2m/Zl8dr4tTpq+9pEJ7TMh81H7sG4T53JYVwPctXxTB0iVRX6kzZGu37pnNLYgMd+1u/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752855663; c=relaxed/simple;
	bh=jnQej5os8946OtwsAYxWV5AqWfH0NVCPXeIuQ2kik1I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U3bqecUu/wTgtkAO1vQ+oqeXRtxwwuG6lf6MudFAE3of8TW0an85LuR5mIPTXoEGrhRj0xZU6C8JsDfTN2cy8r8YUzbc0iqygZJ1A+i24E2DUecvhTldoK9N+qn9I55fSsDFFu003jQAhaZCcGdpykpugr/kJlQcllfiOyyqc5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4JCJR3S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I93Q72028059
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E2+mYONdTWwAKa/b2Dnjv7
	gT1I0AopAtzO+8co3bDc4=; b=H4JCJR3SXw9tgn0jFSQ5nadXmD0sTfvO33FeTC
	xkfh5XGBEmDujfKzTA5bMnAmG5Ulv0jyGvCevfwmHKoWpXjjAm/4ng3/dBAtlHy8
	fXnvStcAJWLpDeStFDUL5b3tZLKgJMwKj2+8EYZ9t569nddutkEkmWTjHCBQKekl
	YTPqrhSxc9uFxgvQDSZowyjcXVbjGUytVvTHk1t93YwZtV18n4CAfLQDI0ukqG02
	l2OvLbQsuhE5RDzF9Y+u3GD6qZ2vVsKZpD3jzSSEtEpoYMcN7sV7R5DWDtcK7Ejs
	+hO5ebj+NecfXcjO/nYYv91mk1VdOFt9E7xx2ChLivO8s5og==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh64fp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 16:21:00 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e8e969090aso2261768fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855659; x=1753460459;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2+mYONdTWwAKa/b2Dnjv7gT1I0AopAtzO+8co3bDc4=;
        b=LM/CQhcnZihS2elwoPE6BrGQquGOKj9INMVnBytlR517sQ+TGIQgOt52Q4drYDXnp3
         vkYDH+kIXkhlGi8QA3DzdTCRCKOjY4gZsRxR7V0pQfaOHZJRoCbpSwwdz3nW9AgCCFy8
         8IWRrF7Tp74aApLjI8BQDWfuwPvx0AxUD5xYUmkDhOps+ibuRorzRjnGar9QXeF+ZMwm
         trwP6vLe4tRoslNEk0RAS/8i1CldWZTLfQHa9K61xWfxWxlKRFoiBq9s7P49nHXRAGPx
         m9BYkf9d/ZlbPFBwQtKXJIijOJIPU56g87Z5q/zMT6t2m1EUXS7tA4dO4liqBCXYWjWV
         9x5w==
X-Gm-Message-State: AOJu0YyTTWMYz6du97DVNAUHXMNai4/7NR2A/paRpQZxaSHEj/xM8sPJ
	IBeM+qEs6CQnW2/h6tEouGqchuzPwENK/CER2QYztraK5PhMJacPxLfCVNjpiJBDwNqq6v7++YA
	lzuaxNz1V0Ouh28V4DsVcxKuPUnlnLuCLexupi1/QH+Uw1qU8TH2tbsVT0RsSV4Di1VO/P+Xyfc
	vl
X-Gm-Gg: ASbGncuxhUOGrInI1jotqzCFhMm8WTE88NRL+ZQ81KJN+fawqqE1LW9xnetUVwNIw03
	mD5hnzRV5h5e5uIflAGaXKtrcwBpMkRYV1FStET88k//d/0eEGwMKW2cLpT9YEBPzeYD1EYB5np
	lM4lTpBM7c+CzjcwEPJIiEfCr4q6L+3UxNyXBb4crL8g+ABvUZAePLPrhgfkwnC+tX82D+Dd8YE
	wPFvLgX1gh1C/BAZnq87ExQb/wf8KKFxAZMq4jKCYeouFF25geKGP3KSAK4rWILpPPMJlTsMOF6
	hfGXg7EFEtkeuVTYQHtbg5xBCrCw+8Lixtl749GXsDwkwSRpzI0LEzp6XORF5HGFptZAfoMJHA4
	Hri7MU3gxkqtIBkKYOVvgy5FqKry2mLBvPTlSxpJ5PZmest0/uAaZ
X-Received: by 2002:a05:620a:8509:b0:7e3:35e3:3412 with SMTP id af79cd13be357-7e34d9ac2e5mr622296385a.34.1752855226594;
        Fri, 18 Jul 2025 09:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJFME1iu2nBdlZCEndMtUjbp0cqubsgTDnznr23GMq/CHMfz0nkUvr0ssMwdhTZk5t9cEtiA==
X-Received: by 2002:a05:620a:8509:b0:7e3:35e3:3412 with SMTP id af79cd13be357-7e34d9ac2e5mr622289885a.34.1752855225796;
        Fri, 18 Jul 2025 09:13:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91c1ab7sm2388131fa.50.2025.07.18.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:13:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] pmdomain: qcom: sort out RPMh and RPM power domain
 indices
Date: Fri, 18 Jul 2025 19:13:38 +0300
Message-Id: <20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJyemgC/yWM2wqDMBBEfyXsc0OTiAj+SvEhJtu6lFy6ia0g/
 nvT+jLDGZizQ0EmLDCKHRjfVCjFBvoiwC02PlCSbwxGmV4NepCMn8RPyTks2f+qpe663lit3Ox
 7aM/MeKftb71NJzO+1iav5wizLShdCoHqKCJu9RpsqcgwHccXYpV3FZQAAAA=
X-Change-ID: 20250717-rework-rpmhpd-rpmpd-13352a10cbd5
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jnQej5os8946OtwsAYxWV5AqWfH0NVCPXeIuQ2kik1I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoenK2X/4FUMKR/6O9sQRhqyVPR9hRSX6jxmwhn
 gheSKljeAiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpytgAKCRCLPIo+Aiko
 1WBDB/93DGP5KNuZts9BxHzohRG1Am3sPtjk5P93zmsB/JMqiWqKOM/hgbgj5r+UBDA8tyf+e2S
 eBGQrnJ6eZ3ybThugmU5ZTY8qq3d4TKf5hWv3P7bufQoeu0FWwMJNcg4nmSGxlrPWslux4byiRl
 86v7dmjWxDRHZkT6CtDTUVi+XyjMjCeIvssj0pR5GHfYMh8Y6JBV0daf0me7Sec1keBlgb6BboW
 DAr1H8ykZzXcebSMtffH3PEY36WiCxRAngEjpl+CcCQIVJNsRCgr2MA/7TOT09cFJZFqYaGa3sD
 O1EZUeyToT0ck7XzZCHFx0gcP1/M8gaCwNqEc5OheEDt7Y9U
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=687a746c cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gAiK-lJt_Rg5ifV0ZIAA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: R8kZz81-YuQDQO45u8iEWW5HQf7ttfjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDEyOCBTYWx0ZWRfX2XbnKMN/OU8B
 FfJAaj5uOhwoCHTGHaGEmcA/QAuZLGXc8ZX09ILx3L5u4XJO15b0XUj3VpwR70Ea1z/cLa5cWxm
 zsMBqfmzctVPElMOu3v/8hyGLpmR4xAReSxGkg77jWUVWjvzjcbXyme8gs1wcaLAuH6grLUX4L5
 //GHuyNgwmUm73Jc0D2RecWMCpixkTZ6npCmnCofhXR/TDsD1G7bwk3p0gEEwItns4SVvJIvQ6P
 RmqzVXvGtkyhXLF6IKRk7UybHQ2zGsZXIrwOIKal7HgorglAhP1QiKQ+nfwRONSWQq+dX7BzsNI
 yGl3VQXkqtOB/6vkRtiJr9sGfTjlODncX28xsYyldRJ4Zgx7km00E57qJywvRfSiHK6hrlRh0rS
 xnBx25YyJciDEHmEp9hVPFYs/AyS8pB5lmiSIxHSQwHpbdIl7E+BEtok6eSYp392AYpFQuyY
X-Proofpoint-ORIG-GUID: R8kZz81-YuQDQO45u8iEWW5HQf7ttfjB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=706 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180128

- Separate RPMh power domain bindings from RPM PD bindings

- Drop now-unused (after [1] is merged) binding indices for RPMh
  platforms

- Introduce generic bindings for RPM power domains controller

Two last patches (marked as [DO NOT MERGE]) should only be merged after
corresponding DT cleanup lands ([1] and DTS parts of this patchset).

[1] https://lore.kernel.org/r/20250717-fix-rpmhpd-abi-v1-0-4c82e25e3280@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      dt-bindings: power: qcom-rpmpd: split RPMh domains definitions
      dt-bindings: power: qcom-rpmpd: sort out entries
      dt-bindings: power: qcom-rpmpd: add generic bindings for RPM power domains
      pmdomain: qcom: rpmpd: switch to RPMPD_* indices
      arm64: dts: qcom: dts: switch to RPMPD_* indices
      ARM: dts: qcom: dts: switch to RPMPD_* indices
      [DO NOT MERGE] dt-bindings: power: qcom-rpmpd: drop compatibility defines
      [DO NOT MERGE] dt-bindings: power: qcom,rpmhpd: drop duplicate defines

 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi |   4 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi    |   8 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi    |  10 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi    |   4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi    |  16 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi     |  16 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi     |  12 +-
 drivers/pmdomain/qcom/rpmpd.c            | 112 ++++-----
 include/dt-bindings/power/qcom,rpmhpd.h  | 175 +++++++++++++++
 include/dt-bindings/power/qcom-rpmpd.h   | 375 ++++---------------------------
 10 files changed, 306 insertions(+), 426 deletions(-)
---
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250717-rework-rpmhpd-rpmpd-13352a10cbd5

Best regards,
-- 
With best wishes
Dmitry


