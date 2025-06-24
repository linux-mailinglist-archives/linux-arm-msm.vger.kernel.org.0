Return-Path: <linux-arm-msm+bounces-62192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCF5AE61A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA6916D470
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B916527BF85;
	Tue, 24 Jun 2025 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqT359pf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913B27A93F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759155; cv=none; b=rQioK9KtPZs/NRNE7WbkW3ROjRoKNrVSR7/TO3Psh25voeLCZEZ/rTdFGp3ptZjUbg+4EdX6snMZbQDzWjfqMxUa4TNYwYtVKJVBGsblsnHzJcOuTA612MXtIlwm5OkowuBFtRhKU8S/SHvbTHv1Amqn1LBTGT3g0n7Y50JWlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759155; c=relaxed/simple;
	bh=GOGOmrv07Qnn+0/ASPIoh6ungfDggmWYrZEZV92PrI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOwKO3I0GrOlMyxOVLa7AFEY1qXKSLhd89lWzUjSqUpzPQqnIWf2M2AqLJItswoOPmOxqrjLwGzSKeTB0eBkVt2o9VBMmgRU8O3z3mNn5qJJQZ62gsOrcqj7bn3jPa/cRRqIpTglD9Z58GhKvXhSNQ78dnhukReYk9CVtK8VaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqT359pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O76xmQ001108
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71p
	EjKRjj5g=; b=GqT359pfX7b7whMgZwF/L9obKTwK7y6qBY/6WkZPNHrSGrFZe/9
	E0F82c5Ljd48IO1e4VtYF9yJjo5jRO7JHetqXehhNh2+HhjWKXkMSNBcMDqc5Qch
	QSl7XBppGg8Zpn5g4RA6srb2eqaYloDhxeO8UWd9HSC5pXC/jDvoTz9XyFE44jiO
	JXVI94LWRGtdFPKuhwBtYlf3UXL7TpolOL/+BRwkzQVuS1ea7TZZc/GrZ4bGs9mT
	OH6tYrKbaXT2KbZbgzDEqe4MX0jowFkKVKzhdGCKy2jMJt5/5pIb6fPHR+D4Kfjd
	vl9NeCCSeib3X3fW+cyc1c6R0m6TtcHPfHQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1t4kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747ddba7c90so4489019b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759151; x=1751363951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71pEjKRjj5g=;
        b=tNeBwlR6yRKNFaWJZLQA/b/X7BNmaTIAt9F6/u8EN4XGEWBzriGopTTyqsGBMLlEDG
         uJSGCNPfJHJyReWvEKAhs8aGb8Yw6f4J4FMLQSSgToxoZZMc2c1NAmiNIMyZkhatjSEm
         c5eGvZV4ld9+D5zb3liDtudnfRlPtcjiCCjh0BsJQzOl0A9B/mrb5AHU3kTTiO4SK0M/
         cBt/+B8B6foABoPcuI0K0NQUpPgntGSf+PiLShx/ODKE1eqZM2uyiYxL4WaXZBVgNLde
         kcU5k18yUDgDwkO3OXZRlmtpEJTLMSuHxs5xafQhY4zAsaLZa3xqkaHuNy2nEHbXdFna
         zCtA==
X-Forwarded-Encrypted: i=1; AJvYcCVkWvVfEb0AVh/76LI2YomWXuBPxLHCE9E03gSdBM3LOmKV3u0WdqpkOoQkH3IBOWElM22UkouQxg0KSTSG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1klSYGCXZj7vsU3U1sFrpbv4a+PlDP4Ibbe86RBWwPYMQR+Hl
	mBlP8TNcv2d8x+IWqMMBDe9eka1avy80xUdz/Q3IA6W+DTjrkMb7cqXhDFUIcKxRyj7RUSa/50y
	GO+sF800asIw/CcY/JzRcyi8kC174RnEYq997N+0xrW0ekZfhkG9cySJzd7PFVu06Y/4F
X-Gm-Gg: ASbGncuzzx35ZbCJNOxAxIcEmKmvSuhvBb67UwXi9bGMbTVESyIoQEnV6OppwcHNbMg
	GSusWQw8cKGfJkeuSNwdALUhMPppR7JnukVaa9+jOXQ7Vy0hmgsCQF/0CWdTY3bM71wLmCpW1Dj
	GfxfI6nO60KwknG67Sx8y97BpLUsC/HmO12i2YDk7ki2zCKsvwYnB9xo3XDcN2ijPUfDGmTIkEa
	SkKNarTbTTDAsajm1MTlce/Vp5DOT6Pjx44Q1UsNW5IsUjq6g7HLhRLjCuy5QDCpols5cf7iui7
	kHGekcGynzTdXlycUMqVhNJYXNY42goO8IqiOyc3Qkd889PEs1k+h3NT4CMXzilieVY0o4jNVsN
	kWw==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr25041529b3a.4.1750759151614;
        Tue, 24 Jun 2025 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOm9pE/XE0KCyZahincUuLaxeNo/FZ4J8obLA+YEkBc1thYs8fF2DXtsxLOS2iwxdoEPqTmw==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr25041505b3a.4.1750759151248;
        Tue, 24 Jun 2025 02:59:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:10 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com
Subject: [PATCH v2 0/2] Enable CTCU device for QCS8300
Date: Tue, 24 Jun 2025 17:59:03 +0800
Message-Id: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685a76f0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pe-aGEEqWberZWJlMgsA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 3iwNZP2ryCqDSAx9Gm0xidiw8bfMP6Rg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfX7Fu+PA7bY5kL
 txRQAD9vYfJeISF9hrL6iWLDkuhzIOITLivhEeQmFVGVPvUSD68owF3+uRJkh2dEUf5VWkjeAGJ
 v9ZUbv738mQcKKDhyZAl3yKdgMA6jIrRbcfKWuE8q/94GcUnIG/Lcdp2PQwR+OPh35bq87vo/NC
 GCt8u86DwVgrorOmvBhhC4JkteAPrzdEvaGBF5GzrXBgodVpEyJgy6aevWPaAA2KKlE7JXa5np9
 EsmSZ1tsV7G6b+8Znc0Uig8QN7XG2nNkgylCikcs0gOdHOoYenEocVrbNd9DQfiNWMQ8poSvrh+
 o5S/9KpAqin+reSAvONHFtxhg0mQkEhKFvUtn2aB12XHC6wCzm5qmTM0Er4rXDZfqy2nZ3iezIc
 pb766fgpW670qt+WNKry5LG+3+n+B/Tb6Ame9vhtiLLh1fdkrckTVO7Xm5hrBQGIVf2BiQ4z
X-Proofpoint-ORIG-GUID: 3iwNZP2ryCqDSAx9Gm0xidiw8bfMP6Rg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=843
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240084

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: add CTCU device for QCS8300
  arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)

-- 
2.34.1


