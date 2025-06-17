Return-Path: <linux-arm-msm+bounces-61555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09625ADC5B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D00D1897D65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5321292918;
	Tue, 17 Jun 2025 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Njy4D0by"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D800290DB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151226; cv=none; b=GdIIa+53bbBeoZ033wfxzmUubOWLaLAV1STuIb1Pz4DNN9J66RzBfjs/aS7rsYAaK3ReqFUjSoYkAfh+kpnjQg7cNtBbR0yd6RwQfZ+hOJlQSGLozr8LxQvl9NU2Onex1rQ5tRFN22Wcb57VMCDEPj6ccR1oSu/yW7lc8g7dnZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151226; c=relaxed/simple;
	bh=XNU86N9EHwH8cVHeT2hJe29cwljaIdUhr0t4VCXYkAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lgScXlJupI8n1JcEh1RnhEjeoQ9qscpbtDDrMqtErYPtY6Gpq1hKrZwlR6PkODUObFk/+jggRjH8zML9/iPUXhIqG21r12BgpgwBMjsd+c7eRzdlnHyMCKNc9eD9u7Qv1ZhHCSrCkNeDDpoz5P66JP7m64HYzmx1mvOCo8a91R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Njy4D0by; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H85hhX006188
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fmqvmK9k/AKo5SNpLwgroPGZIonaKg0+c1g
	g9XdcTz8=; b=Njy4D0by1rKz8FFXMBXuK4wYuGwJAfQohg0EidBRNaXef5i83to
	7SNicNaPQogiJ+3kP5VFIu88ODWHn2bKOc/Vn9Ua/LaXULw0k8cis/1RWMI43gmi
	4/Pgi/2vlzZCl/iudMc/yMAmNj09S48uTpw1yF5Lcffs6PRRTntMW7s2fDyXNn1X
	jz0UuDA5DeSpsLC3h/kq2cN7nKRLmlNV71tlv58Y+vVfkY4iN7pegkUPzkvK7pGM
	Uo+nZnOIxIfsSs/QiKR73u4LwJ5FwZOK6pv9YrmntGuod1SdngXTS/1uJUT5K/1K
	gGLvRf2qMWNCz5fGPey0Bq4yzK4V5FukyWA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791fsyhqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:07:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so8941732a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151223; x=1750756023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmqvmK9k/AKo5SNpLwgroPGZIonaKg0+c1gg9XdcTz8=;
        b=fHcLX0256Zc5VGxD3k9Idwbyh0btF+hucQivnB8Y0lQaaarcQPq3pwbO1PVdwOJMaH
         almjejxXIQ2hSD28HTq+NeXbhePF633I7YXrqoK0Y+NuuiM+MfWvw+cq25giFgtHOyls
         Cl7eRcC4llBqJBweWrvTq5YmoGwqrP2ahz5RV35gOmfyGSK5nbeLuhqXAwh2BMab/KAf
         ekTRn7pThVzQNVRNS5TKtMGEfVZ4tB28AQaozUSQM3w+vSVzCrx+z9az9P16rIdFJK24
         TsFF1fUByL7RKQf5uJ+K/+VLji3vld1fOAf8s5lUbt1yd+2ZVn29eLpbodQqcH2UJCwG
         8bKw==
X-Forwarded-Encrypted: i=1; AJvYcCV3nR80g+Z+7Mf4ycfU5aLeg3Y5Yy3mnA1HdO4xh749RWRRxnZJpSM979CFAORzXY2MF8ahDhWC81MdTgHi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvtk3jUwcSwAq1t3lFhw4pDPKX+GwKzAjBQ6WW5WDWRDI2ceOc
	+ffDiP0CJRJYVR3cKjyUl6jx260XgEGVawExuBOkRNmiL/t9OI+vZDT7vR3TD4xLYx93bU7b63e
	PJa3T2Vr8Myo75cMxMaXz5DxXZF1pTfUb0WSODspO7beYFdMBbP6+F9el2IwYsDV0Lx2T
X-Gm-Gg: ASbGncvWEOkHwsJNGQnJMmutN8YHWdB2wv/8ezojiDf2Z+T2KMp5Uf/1ySP4mdZceG0
	gA7e6vKFWPrJd9mC8qtnC9t4Afkb9doUqAOa0RAn9hBM1ba5JP77139/zz2KMvt8rGF/tB4C9wO
	6Wm6LNHGAQyjVwSNW5B+Wkbi937aUdvbD+KdOFTwn+hocFkf/CxJV9MHlDTrKrhr8sreYXfNhF5
	ozz8cIBhNJkNiSs19wCjSHQ/PrIumo2AqBALw2ixNMCQo9Fm64lsKbsFbPas0Wf/x2BAs+2CUOE
	Xe/J/fFqhvqRhXSkqwCT7wP4qqvVkjhz2IkW8bXkTTxQASOb/vzYX0NWNdW5Uw==
X-Received: by 2002:a17:90a:dfcd:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-313f1df631amr16365954a91.23.1750151222811;
        Tue, 17 Jun 2025 02:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENDak9/m3y1Z+lHpFAZozMSnCXvpiXSdunaaZ8aIr66QWZk842CKABwPXtHP1IzwXStJ+syQ==
X-Received: by 2002:a17:90a:dfcd:b0:311:c1ec:7d12 with SMTP id 98e67ed59e1d1-313f1df631amr16365925a91.23.1750151222358;
        Tue, 17 Jun 2025 02:07:02 -0700 (PDT)
Received: from cb9a88ed5d41.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bdb39bsm10017370a91.20.2025.06.17.02.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:02 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Mike Tiption <mdtipton@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add EPSS L3 provider support on QCS8300 SoC
Date: Tue, 17 Jun 2025 09:06:48 +0000
Message-ID: <20250617090651.55-1-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3MyBTYWx0ZWRfXxLAQ5nidoi0i
 rccEqlK7KI0hmB+8e43ZSO9odA3Wzvc0Aryn7C2AfwihSbMu3wpmIucMims1qm9cLhOR2VTOXjy
 BfcmbsAA/wGyHaVPy7DbZyfzAaTsl+j5GkJafu2t0gYc6GxVUQ6zSMy/B8jJ08+/AieWe+GAYI/
 US6/Yn7ucidwVzATXiPiZroNrDsJq5ZnyGOIvDh4nxp4xWVuULsL4bER9DkkhcjYDMAvOrK7eie
 k15heQM6QJHeZddZsldfn4tGPrXY4tQ4SSufuUc+ztNEMOK7B8/17EC7cFHwRTuGl1lno3AmNd7
 f+8ijW/5rvdKsiWFmpZKzOZQ0WeVh7mAMXeDi63EeoZJfeaDLQ9MkhY492T4thjKwH6xOySD0cM
 dBKGM2QcKZJ2+V9e+3RA9Yc2qoR2v07mgElA8BUTdCKLXMr6Hty3SWvxL2tZtlXjjNWtpl9v
X-Proofpoint-ORIG-GUID: 8tXhiLlCLwL2cXF7mxMEcHuD0V5Qu1pR
X-Authority-Analysis: v=2.4 cv=OLIn3TaB c=1 sm=1 tr=0 ts=68513038 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=0wEiu_sYbdzYxkl5siMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 8tXhiLlCLwL2cXF7mxMEcHuD0V5Qu1pR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170073

Add Epoch subsystem (EPSS) L3 scaling support on QCS8300 SoC.

Raviteja Laggyshetty (3):
  dt-bindings: interconnect: Add EPSS L3 compatible for QCS8300 SoC
  interconnect: qcom: Add EPSS L3 support on QCS8300 SoC
  arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node

 .../bindings/interconnect/qcom,osm-l3.yaml      |  1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi           | 17 +++++++++++++++++
 drivers/interconnect/qcom/osm-l3.c              |  1 +
 3 files changed, 19 insertions(+)

-- 
2.43.0


