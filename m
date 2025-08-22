Return-Path: <linux-arm-msm+bounces-70356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B0CB31570
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF421C82EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707602F546E;
	Fri, 22 Aug 2025 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBVbF8fk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56282F5315
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858624; cv=none; b=KlATpQ1/dwqOPr9ZEU8UgB1lI7UDXSTM2gDurNPDXSJNdlydHmHmLymW6b/pytzziQavzNnynYQjSB+hZwBXR/g2xi50o8y9i0ojUT6xvCeOtuIvYyeawXmntYd777C6gHwKfsW9lsrlqbSkLETgRlzB9gRNWLArkdyiC803+jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858624; c=relaxed/simple;
	bh=IZFswyabIJJi0zH6aBxL35ZR99UVJvCTrpStayRwLFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bhSL/ht8hRvWwxMmRGbHhQ2wAVEQ30S5E5J5bSLzMlKSxC2IEiCSEb/H6u/r4SX36bwuKINmJP3EwiY2illTG2xFndnmakjRwCdQnCHUcKENQvdfsQpMi4K/T5Nf2HnvFLHTTBA3yfF1nMOhM3JflF9QSYrJjr8I9z/aTm014OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBVbF8fk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMuE017992
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jcKarMudV2b8SNd6x7MSB0qXu7fuZnu4rJt
	xAKfBKPw=; b=VBVbF8fk6V/fMyntvbNNukuLIy+Bx/cQ7Mra2V6vyoOmt+vI9G5
	3lFSfcKZRVFbsEy9dZtXRMxXAWQ7VkHh+yHwBoAxf/gPRg3+5DPyam/3eA1L3EsU
	LltoADFv24tuj5aaKHGkarqvHoqeQqzTUpugsPVz+X/ctxJLb5MJWDwmLhThWl0c
	hmkwe9bgakFbTxdYe18l8SuhOp+eZDfHob2nfWisBbDVmyCbTwxch7JDIFuly3er
	WVArVyy9qa4SWXfpHeB687/FrusdRkkTx0m8caIhxOR/dTh9xNS9OyNvBvX3TVr1
	4M/5dlp1XUf2HBEtmaGDcDNDYvzOO1qF1dw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52b0rcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 10:30:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e2eb6d2baso4424409b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 03:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858615; x=1756463415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcKarMudV2b8SNd6x7MSB0qXu7fuZnu4rJtxAKfBKPw=;
        b=jDTnyuTlna5UP4eoorK5O4/OBOCu5REwLahCN+HYq1aBtdgv0SaawuVxHXXBXurWSB
         TjZ9Up/MCYGEotWe1X7xL0eZMMa2GZFbVzVsNwfLrfcEBCjniCTI0y9U9HcABuveHzw5
         R9mbVc/3ZzTdmfkkTqzkf0hycNPrl+DzLGSa6aI5cfhjG8fFLuaE01gYRoPcVHqSmITC
         pBWHHPmYJJXG+KjSp8spY7NH7zLIiAB7g+ImqbFXaglMmXP/JzD6m2ihK0/FIVPBzoA4
         5PsviUmrXDL1f4bRK2XLD8zhTss3X/2zdCb+C4XMyFCnL30PGv1hwnDfETMIbt6BdUIJ
         3VnQ==
X-Gm-Message-State: AOJu0Yzk5KkgiIbzpe/pnNU2RWa3Rd3d9qMMl9Qe52CPVe/3C9Q/rn8I
	4WSrZPUD2tesIoo5zjLZ9nelpYly2HJtJ6JqCjX9xooO1BZsQjrBoHr7zEXbQoYCjvKRerf3Wik
	uvm5k3DhPegsAA6yDCu3oAz15XY9v8XwzCPhYU+tkv+RJlcCANzYJsOEIUMeZIjlRXTfV
X-Gm-Gg: ASbGnctQn5TqG+p7JlGUSfh552qzbDn72envOBgBK9m/9+RgLf38GTDFpsvLYH8L+CJ
	TzNzqkhf0KOnga79oa70jqLMUK5lJkXTp8oeI9QRhfebOPepLW7sG9JhGPMZy5eDDjHMOdY/S0F
	LZ/y7UrC7wfSYLyTflGRvhBQnrunyj6U3YTzpDkPU3iQFGQju+pZhg3eNuclqPlI+mTwNeboRqe
	fMHmaJ/tiCmUGS9jioyhjjY3zk1+RuCXzPplKROu1MJVgkcfB0mSsvEGgus1OajqJdavNoVCRbu
	sLBaLt7tAexbEDe7MEdbgCE5eqmQDww/PewjDGzmrTZPrI+qVuJKhYDiSpFf7BgNQt6qHVDrBPY
	SqmwTYxhxRz1CuWmd15NJ
X-Received: by 2002:a05:6a20:1584:b0:240:cd6:a91e with SMTP id adf61e73a8af0-24340b0ed25mr3975351637.20.1755858615168;
        Fri, 22 Aug 2025 03:30:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM6/4eD2DcoKaSA3nCo67Yg9ZTNA0p3eVi79EitYPShFXo+QxmspWgagHgSI57FCVpNE+xeg==
X-Received: by 2002:a05:6a20:1584:b0:240:cd6:a91e with SMTP id adf61e73a8af0-24340b0ed25mr3975306637.20.1755858614674;
        Fri, 22 Aug 2025 03:30:14 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fec0e9sm6825196a12.24.2025.08.22.03.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:30:14 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlmao.mao@oss.qualcomm.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] coresight: add static TPDM support
Date: Fri, 22 Aug 2025 18:30:05 +0800
Message-Id: <20250822103008.1029-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxDp7+0nmLx0H
 meVU/cL0bRKburlzpY6h53+vIctsaaWiz/OaHIJ8+Y1Wl60C+EaD0HFdjG/NkK09Zwc0IOyUjem
 evTbW4uY/svmzm3G/9n37c7WeR5mJin30ENjSQfbEeEH2cDqOAIE+WSQIfayXxvKIErwUN75hq6
 x+1AasgMs7b0Z16/rwdm1X+ndlogDwCvlQarpw5u/SyPBFZE/puX/L7z7eJJFb6eUUdq0bqovwp
 Cm9+RGTf6VWRoeZ388+aHwTJCa15Abk796o/GEbi26YP1HqMFlUKCsMPTqqKvpdEx6YExAr6P61
 35sNNqOmqNUrbEL9Ej7yasC3IppKjsb7SrTWEkAYSkANH1op2an7H0/95cBn86Zj93uhf+P4r21
 CMhW9aS9sKqJrM7O+lZFCYEdYPwrKw==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a846bd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=miiTG7pHY3C1tMSzQ7sA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: _khFjHlAkW8wjASe3CFp89TR4s-Ia-P9
X-Proofpoint-GUID: _khFjHlAkW8wjASe3CFp89TR4s-Ia-P9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

The static TPDM function as a dummy source, however, it is essential
to enable the port connected to the TPDA and configure the element size.
Without this, the TPDA cannot correctly receive trace data from the
static TPDM. Since the static TPDM does not require MMIO mapping to
access its registers, a clock controller is not mandatory for its
operation.

Meanwhile, a function has been introduced to determine whether the
current csdev is a static TPDM. This check enables the TPDA device
to correctly read the element size and activate its port accordingly.
Otherwise the TPDA cannot receive the trace data from the TPDM device.

Dependency:
https://lore.kernel.org/all/20250806080931.14322-1-jie.gan@oss.qualcomm.com/

Jie Gan (3):
  dt-bindings: arm: document the static TPDM compatible
  coresight: tpdm: add static tpdm support
  arm64: dts: qcom: lemans: enable static TPDM

 .../bindings/arm/qcom,coresight-tpdm.yaml     |  23 ++-
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 105 +++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c  |   9 ++
 drivers/hwtracing/coresight/coresight-tpdm.c  | 148 ++++++++++++++----
 drivers/hwtracing/coresight/coresight-tpdm.h  |   8 +
 5 files changed, 256 insertions(+), 37 deletions(-)

-- 
2.34.1


