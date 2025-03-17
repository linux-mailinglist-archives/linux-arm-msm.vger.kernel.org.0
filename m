Return-Path: <linux-arm-msm+bounces-51642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C67A65B38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 18:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B658176E10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 17:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D101B4227;
	Mon, 17 Mar 2025 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ib+nkGDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C661B0F30
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742233487; cv=none; b=Copo6QTmvTIGiBCX9FsNIgie76CoSffBba/2I4rYSSWIbg4RBnxgs1dUmtHZvhzHZobqGJ8y2cyriWNwsug4GN67dbb4NXuhcIEi8MM9XaDVvoB2va9iYYr9OTDy4ybPr8JgUGZgaXmVPrN3yvHUxuxx4v2vIdTL++RS0ok1Qe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742233487; c=relaxed/simple;
	bh=WXxJVR7u/eEtq0VSMR7e9vL+o9y/vFO1lbnUevsiJCM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YQnIin5pKJ6dF1OnVaCojY2P/SxsmP4qraUMgujk+MKmtm3UZT5MZXQIYFE8UNzptj5i4hpCsmN4nCGvqzbNglEEcrB/0v/ySHl3kHAE8FEJ5i4KQTpZ1YNiXbJC0W8KCFxAmltsvpYH4uhtwTIjQgvThCs11OuAJOX60DpMA1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ib+nkGDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAnIdH028624
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zBUsExIYKuDXmKfSyZ4/x5
	2vF/DMlL74oBtWZxSet6s=; b=ib+nkGDXhDhWrobH8BbDmoviUA3JDACnfQOOhZ
	/ePw/HhpiLikp8nH/uge02lZoZP6jYe57jXQiZItgLvRugfteG0baVtbbVFfd9JC
	w9N6awNVkyUz+QSm8FjtlX+raILx9C9h3KFYAMqmD5k+z2F98X5bBum8sLdUlErZ
	4StwKS6aZmsKzLbBSrRE3hzkgoiMbinP2Sez+rZtdBtTBHbE3kGMWeRqwFoaQwTQ
	KWfzcEHls427Ha13cmUP2fkdRf/gLGQ00lvVMWn4pzH+1bDhc8vcIT2/DadEESYC
	fg7y7NF4S+GagRqqNak6avWkteLOiTJjiKuE8Y24Z78VcYCA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxwg4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 17:44:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54e8ad9b3so1027442085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 10:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233484; x=1742838284;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBUsExIYKuDXmKfSyZ4/x52vF/DMlL74oBtWZxSet6s=;
        b=H03cIQxttbUI14wlNiUuK8cJUuFBwyjMaCyYGfNy0lf4GJi2lQqmVo/oNhbPpKzzGl
         C65yenr1z+vCmLr+TNQjYsb7Jza+ZIUVDKprUk1GTD7EE4Wp2gsDeWUCbIvOAK8jB5Pl
         7dFaJds5OmSxqNjO/J4381+Fpum2/fUrbcPPrYTAne2kLuAEwViM6HIlee6rQ1mBGKzQ
         As0bVZoWEWIqNPmLxkpegCWrF+u/J8V2kmI0lhva9lIeR4Hxn8G+QpHNf0lWZVnrNZTg
         HBOGtyAoIY9FxYdrEKrNGwxKs5XVy3quuYZSlLx7kSCVCfJg1eQOHAPcrqO6ar9WsVGx
         9rMA==
X-Gm-Message-State: AOJu0YyNt9rv1nfOHEuvJoIAY6jXLCPckdnSrX3zVyFpLyKclCECwQ12
	WrH5hGs5xChFlva+fdm7cggR6KjZOkkXliI3mx2zJBLbgC2KxYd+fh1hpupSQsHQQY32/mE2j+8
	R91OIzTjnY/fdIc8GUNOK0kIw7Huhs17RVpos/N5Ldk5Wcjk3ICjKA/6w11epb5pt
X-Gm-Gg: ASbGncs1WzZaDKpvlG20nPdkB6PmGWBWzdN3NmJ+ZpXmt8UItG2jpfuDOwngHkrrg4I
	r8GL9rDNvcJ2UecLW3Ax+jh6acUADLxKz4fDr4+N1kmpRQqvs5Ac1MLuqDMyJwig3paiGESiIN3
	lSVac7LIODwWTB9dpSYCMs5hYeIzZ/3s5KGR4ehHwQQC9jhR1IGVPiAOhubmIYfgXYBdzC2irDK
	Akq8WO9RufURi84sMJxz0SbqkGNizDpKt7RU70bK/cc64G81KyriEudl648TgjiuO7N2X9opkBl
	4EcIfbX4o69emeGhM9BHyJKl893NW+2O4KUAoYSacwZdaNEOPbrY48n+qk0fhQE7Bk4tTllMBJX
	1PIHqPOHLToha8hml1cs62jBRKzKS
X-Received: by 2002:a05:620a:248f:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c59b8aaa1cmr52554585a.20.1742233483591;
        Mon, 17 Mar 2025 10:44:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhfiwtI1vGLjeE5IzqOgUZWulx8wY4QyIkbO2lD/DD4nMJ83CYnPPjC1rh3t6m36OU8cMz5g==
X-Received: by 2002:a05:620a:248f:b0:7be:73f6:9e86 with SMTP id af79cd13be357-7c59b8aaa1cmr52549885a.20.1742233483171;
        Mon, 17 Mar 2025 10:44:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] ARM: qcom: fix APQ8064 schema warnings
Date: Mon, 17 Mar 2025 19:44:35 +0200
Message-Id: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINf2GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nz3bTMCt281IrSYl0T3ZQUg7RU46TkREsLcyWgjoKiVKA02LTo2Np
 aAAds/vRdAAAA
X-Change-ID: 20250317-fix-nexus-4-dd0fe3bca987
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1703;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WXxJVR7u/eEtq0VSMR7e9vL+o9y/vFO1lbnUevsiJCM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+GxcQJgJPjISwSlnyJbUcpp+Z/ZtkHrXc+i
 O+VklGUppyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1dhVB/9g6cVCpjmDg/J9cGILVCTRjkxcPbPm8giIi6XatiuGR56vsEsIU5fB1ko9soln8IvtOUW
 hvgRPcnX9nEblDDmkVgd2oEMoBbCe5Lnt01zbQfEBxaz9pbvF4WWM1/JSPEfwwuXWUS9H74b13H
 s3Yy9+fSI1T3s2xptLOYackhkkS9r4AdQ6yZpzFk+EJYIi0phcak/5+w8g8U2Jduh3DJsyVBu3S
 9otEv2EiIOabC/zYtEHlKY+iaxwJE6jTLfWMIUdB2qagGZiEhyKFX38LZrGtmAe9B9juuxj9er1
 pc7jED0X7+aHUn7Z4pWgEiSrF/GrWumv3k/pANwWAPIOY1vA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: PvlYvG5bbJdNT3HT0EiDV4WDLdXe3EVb
X-Proofpoint-ORIG-GUID: PvlYvG5bbJdNT3HT0EiDV4WDLdXe3EVb
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d85f8c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xd_227E7yWZRqRJlnwUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=604 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128

Rob's bot has reported [1] several warnings for Nexus 4 submisson,
however none of those warnings are specific to that device. Fix all
those warnings for all APQ8064 platforms by extending existing schemas,
adding missing schemas and making APQ8064 DT follow all the schema
files.

[1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      dt-bindings: soc: qcom,rpm: add missing clock-controller node
      dt-bindings: display/msm: describe SFPB device
      dt-bindings: soc: qcom: add Smart Peripheral System Interrupt Controller
      dt-bindings: arm: qcom,coresight-static-replicator: add optional clocks
      ARM: dts: qcom-apq8064: add missing clocks to the timer node
      ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
      ARM: dts: qcom: apq8064: use new compatible for SFPB device
      ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
      ARM: dts: qcom: apq8064: move replicator out of soc node

 .../arm/arm,coresight-static-replicator.yaml       | 10 +++
 .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++
 .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  8 ++
 .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 85 +++++++++++-----------
 5 files changed, 136 insertions(+), 44 deletions(-)
---
base-commit: 2bb3cf7805af73af62ebfcbb55e350549b6a0912
change-id: 20250317-fix-nexus-4-dd0fe3bca987

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


