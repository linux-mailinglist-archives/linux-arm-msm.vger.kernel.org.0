Return-Path: <linux-arm-msm+bounces-73091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A08B52D65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:37:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33B7189D7B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 09:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76122EA49E;
	Thu, 11 Sep 2025 09:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cx5gELQa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3F81D5CFE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757583449; cv=none; b=DxCpxkh57jgPponvygpwi2Ibir3unFYyGmx7iH84a8Vvkpfw5yQZfkQ8TxYaXcOcbbkdOGxZ8MLxT8RFBg09/RFD5OzcirvOrl+KGM5NhaZU7wSlfvgDqzDgi7pyfeqoWMWXDHhDi50mdauNrVyvpt/VnAlooYiwlkBj8JJFeug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757583449; c=relaxed/simple;
	bh=1KctSP7tT4hdSPnIjjOWWclG2Dc6KV/r5m/+90egGy0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TBS1Bm6O1pLfTVKDM1C6sm1QgrBpUGVIZijuFAqg9Vm/14bcuSayfjC+NH2y23DzKxrFzjEx6UVcJHaxj9ku2s6Hlv4jRWMZRTja+Pzvy++OE2jthvCT4qSlNU8KFJsr3UBDw8+rmNHLUbgVugIvL10TnrRvilHI1isoTq8JQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cx5gELQa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8VoPc003774
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WTsuPr0C1+tfJ00SepcUle
	p/Wkf9W5RYeWTkYV6Ftlg=; b=cx5gELQaK/mRvLGVN/wca+lSeaEGbg9kIcxqlM
	eRgIDd2b9Aj45goaTK+OyB/pUnfM4FR/M/hhlBYCzdri8T+hQJbWoTrqCyyKeosH
	vvt+lKppo3os/vmZgekYjI1BjU/dS3+i7T6aUr1DQDHdBG8JXjgy5V+BvqAk0r7B
	Yqq3/CCy/WycPEzRwnxDsSQxLk20QI8xzLnjg2I/pqrU9yeVwEhoQC+fxJhzWuuD
	sM2CDM9eInTlJnEEbFhNPbEc1nvrtkfyHL1ASHPpILc8ddxXF26gZtZ+hAAujEZt
	RBMgMcnVZ61MICz66AIZlWdS2OpsqBJS1Ufu1ksfWG9KcE9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493tyxr6y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 09:37:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7725a76dcb4so1085725b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 02:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757583445; x=1758188245;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTsuPr0C1+tfJ00SepcUlep/Wkf9W5RYeWTkYV6Ftlg=;
        b=r6Cgj7RVFZKFH9gAbwzLejeQttQKh5/gWz3AcKeIvAM/lTD131oUyNJdePM1ahoPW4
         QGjc4Rle2Lxu128rYECZReV8M6ss1TWB1bX0dIjDu0GJWhkoOaFGwDLSXQFrbxadK6/l
         37jypbXARfpQzSEbebCSiZ0nmpR/EhVsCfWNOnUk7Qk+OP2MizKNIAZ94efSiN1YLt9H
         RK3eFYxupLX+ulXgN+ojzvQEAv9bDWekFUig7JVe4Z2Ukq0XVvKYMcVvCmIJwbfMS15q
         cWB7Tq8TOGbEaOmynJtTISq8oLXc6Ap36fxZLg7O22qUO1JnrlW+pvCjBoUyLRJRFrTC
         9t1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7rO+AF5zFM5L+tEA8QondbADbQ3QEbs9xcitN/kFuuLJXYnOX1G7cJ2ImOprbLhO3pjIGNwlfuxRkJZgX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+Q8TidUJwG5lgok90QsSwoWjIrYaT0jt/68J+eclOHbsGt9s
	fVEdNqiwvWw9FmHEr9AUiuYam9ZjupBGfHlFpv4IIyhRpCijnq5ASJaoWIW4ZZ5C2Zc9ABPbKjE
	1aqd/cUvrNMUdFe2FIxkeq3GZwMpuN2nxfLVGeQjR68kRI7KGsL5XiJZXahYFjEetqAmR
X-Gm-Gg: ASbGncvuBuOU9J/VZy0CWJvnjTloJ6Iq4S3vUFR5J7Ktba7bpRjqFntBP/VJVGXJFxb
	SQ2kYbANWUjNlVkL2IEhP/RdohX+rBIO0EBrOQGo+R3n2vIdMXpngxWXRYuWn2l7C2xqN1wuHWx
	a73wMxiBI2gusI7lWF/Aj56LtfQiqaAcmw6mOSufL3J6HexdsGmciFW/HyOHmbLTISR8e9FlQyv
	jV5Y2EkAdfTZXHqaStsGe5mbr4905Q5cRE+PWy/3Wdd/1lSfoDK9GXkXQvRJCoOb1akZ6DLx/we
	CS2xIEFkorVHBf3tWXasbbaGYYqZVfRbkG4hsvvooLBr/I6+nYony8bKP4a3Vf/BV30gSQya1nq
	XoqvqyKHDbC62Q/yWbdzr9whAHOw=
X-Received: by 2002:a05:6a00:189f:b0:771:f071:28fd with SMTP id d2e1a72fcca58-776032ab5f0mr2570378b3a.14.1757583445432;
        Thu, 11 Sep 2025 02:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgldY20V8+urkr4ak6p4W/xCCAQs/UMUOmo7GZX/3jtAUQrbLaxmJeSauXvSu+LH87TMBpFg==
X-Received: by 2002:a05:6a00:189f:b0:771:f071:28fd with SMTP id d2e1a72fcca58-776032ab5f0mr2570345b3a.14.1757583444893;
        Thu, 11 Sep 2025 02:37:24 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b730sm1512930b3a.15.2025.09.11.02.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 02:37:24 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/3] coresight: add static TPDM support
Date: Thu, 11 Sep 2025 17:36:55 +0800
Message-Id: <20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmYwmgC/x3MwQqDMAyA4VeRnFeogQnzVcYosYkuB2tpOhmI7
 27x+B3+/wCTomIwdgcU2dV0Sw346CB+KS3ilJsBPT79q+8dMQerVDWGmnkN9st5K9VNg0wokZh
 wgFbnIrP+7/P7c54XZWwnvGkAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757583438; l=1654;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=1KctSP7tT4hdSPnIjjOWWclG2Dc6KV/r5m/+90egGy0=;
 b=hSQm9OeSCW4I7m/wlMm3hqgEn6GP+EQWEMukwgLy9pq1T1ns/FGnhrgKP7d8mj011uKFnkTYE
 hPhMjeqM/96B0FmPC3N14+NdrVJs7IsRLNLBGnQAe6Y2Z7r1dIy+oGf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: xkj_TJp5EKdz_52QIRhy_kn0dv2avkA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA3NCBTYWx0ZWRfXxfTqzKpYgOU8
 pKJ0keIOZDkdypTcdMGrE+R4DMTwgySyOXV3Il1Yg9qHjhnJiMtT3cVWA6ZWE7PMwvWhjYDIti7
 IrfBDwifmf0wssbJ6jnwscngBFv9wrdu+NHyXJQ0UnsgaFS2LDkySHG8mqmxKIJpoIXyyDv/M67
 YXZQb9cKKntm0ojB+uHM3fQugZz2tn3aFroN6y93Ok61zpTtBbFF1UvQXyD0sRCfELU/iABTiPH
 pnW6RVOL+0q3EPTj4fLyGVEb5WPDQiBvz5uKvO5zLEgurEd3Xt3bJllwXL1hu+MNbuF/VKzvKuu
 +kfEorcYBNl+U4nr/Ri+z8aHOVagfbIzCMR/zQertwupVwun0dfwHTx9OZ32k8/zqFArF0Ev6lG
 tzjkz2fu
X-Authority-Analysis: v=2.4 cv=VZn3PEp9 c=1 sm=1 tr=0 ts=68c29856 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nhnTKuEOM_5bWBThM9gA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: xkj_TJp5EKdz_52QIRhy_kn0dv2avkA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110074

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

Changes in V2:
1. Remove the dependency.
2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (3):
      dt-bindings: arm: document the static TPDM compatible
      coresight: tpdm: add static tpdm support
      arm64: dts: qcom: lemans: enable static TPDM

 .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.c       |   9 ++
 drivers/hwtracing/coresight/coresight-tpdm.c       | 148 ++++++++++++++++-----
 drivers/hwtracing/coresight/coresight-tpdm.h       |   8 ++
 5 files changed, 256 insertions(+), 37 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250911-add_static_tpdm_support-b6eb2ecada26

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


