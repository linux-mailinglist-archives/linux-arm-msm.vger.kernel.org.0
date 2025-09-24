Return-Path: <linux-arm-msm+bounces-74646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D93DB9B82C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CF7019C4C17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF69313290;
	Wed, 24 Sep 2025 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CY1gpxMA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F521765B
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739077; cv=none; b=ulG4cwGtJ3Z42wmgpgkTMIzXSjgKB1fCS6VHkv7LdzLp0D4Bqe3ju3vJ1fZZcQkXMhk2epIV/7QSN7H9awNokexTRR3gZ5A5Xi8bJMv7nYON6m3M1OnSEgAchXyTzAGDSErSF8khRxEvg7LIyhhFJffK1FO+5UJs8zSbu7lQEtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739077; c=relaxed/simple;
	bh=mzcBpIew28uM32FyQmevqMPECn+YhIPoaGvu5PHcgPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MEfIgWXL3JR/KKN6CyzjdhVk5pf9cIAmm7KMQ7AQUxyuFPKULTYYAGUIRqbTgsRts7t6X0pcWudch2eITCHEKFkoB6P1/kJ1o0dLqw4XROq2/tzlbmw2sHSrlzdw1NX3mWqmXs/c4lQruboGlNjBZ1I00v8qTmDIis5CZkXOPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CY1gpxMA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODIXca029565
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2YJp0AJoPJela+qIoEKQr2oyB8xKumCAl4d
	Z3LNuFmg=; b=CY1gpxMA5Wirdr3GLCnE+1AEoi9PX0us9Fyf8LxOeRDJzqekzc6
	PbyyDitdDPaPEv2406hToa/CCclZ/S3erCFVNfad1V6FwSD934rgkJNiyOYgiSiU
	0QiU8DkqEKWOk+QrIHzN7e9SUuiUFC7KZsSIopfxQ/gx8BkSFFkc3WQ10BdDEX6B
	FZzYZ78OWCgmH7eIYfTrEtYxfFuyNDEu3jSAGaqxwbggYgWJe+sxcRxwkLqqcOJZ
	mLtzjWPJ3t+Huo6hBSRTiOXlHR39sC6G2TsfevRNRlFkSiPsbSXUFK834U3UR/kr
	hHt7TrXlufUv9avDC1arHMVk2yHaXDVnreA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fna45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:37:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b55443b4110so46844a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 11:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758739074; x=1759343874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YJp0AJoPJela+qIoEKQr2oyB8xKumCAl4dZ3LNuFmg=;
        b=k8ghxQQwzAu6RUesjSlGYm+PAx5GvhX7qoYapAhcNFdSVJmNwYKWVVOjxaAdjCAbTi
         Ro6jinYx+G2sB8+jQer7rSBCuM4zlpESlTExQM9hO4YUywwSe/GcKQWBAxOHbDBL57Mc
         OXfsO66xoPCaDM0oLYPUe0kZy42NfwpKQgjaKgkK+163cMN4mkbJ1EFcinqSXaecKKuU
         /mWl989zWYufoNR0X3DPOLnHfaQiIgs50KbapKpkq/P8hNLFEw4KVDL0AoPSefw2STMW
         X/ny6iT57zTCWy2PC/SRj5TANRtRxgcl6PGNT0TryUSqeyxJ1TrFKF1Lx2nhkPqQV+jD
         nZyg==
X-Forwarded-Encrypted: i=1; AJvYcCVy0T0PfQr/uruvD8tMg7soeJ5aJrylPLybOuYcBgcWjOqjBNioBvoZFn2X4eXhFVM40C5kmxOhA1Eqf8Jl@vger.kernel.org
X-Gm-Message-State: AOJu0YxXuR4EQN/+pmYFZDW+7TPIh4XmUtNf0TjrJabWN6NQvKIwnVR2
	lPzScQb8XdoP7Bi5WEQuQiyhjI4nS7lkQbj7JrSpk2x4PvRRQFhan/7Cjj6ba5RqdW3Br87PYfT
	fDuZ17FmSQIkxYj4/ip1VoOPiReEONXqGVD0kuHBDxOkRnA4mwVunq3/CAy0jGc/xMZ9D
X-Gm-Gg: ASbGncs9zX5whpuCNCnJiS97t0keXMv6OEB1mgkONNssi0jgqbpLdc15dWZCx7whwRH
	ej4Ttol8rXmF+SfsTiE3rQu0cxq/wfJOerr9CIzUnxCyFvrYHQbibnf1PxFe6yUJUyBgVNvnAZI
	wDbA49yUn6/NPBasApGRnCvPZDDuLECOuTMqR1tsnsLeWQNBnpIdLbU/EmMgFXhXnE3kvUenQtt
	NsZhXEnKXwVr/9xB9L0e3yEbHq37GNw8Cr0tLu8Gsq3D2eYq5+WF5QOICfssclVxG5W7sBTlMr2
	PSvNj/iAGxjdab1gFxdvEFrD97Fq3lg2ZzQ7nWPHvA7HRb9ToDMuhwPmCLwdqV740hqJ3uTPHuV
	2mKHG23XQnIvmsrve7mG4Q8Iz+HmlcbIUUJjC04VZ1+1BoUdJ3veW58M=
X-Received: by 2002:a05:6a20:7348:b0:245:fc8e:ef5b with SMTP id adf61e73a8af0-2e78f003672mr806186637.5.1758739074406;
        Wed, 24 Sep 2025 11:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJgBc1x8MlTWvXGM1116gCob5y5IWdsvIyBP1B7OfN0lEnpPv4P9NKMSOaFxcOpNFSOkokkA==
X-Received: by 2002:a05:6a20:7348:b0:245:fc8e:ef5b with SMTP id adf61e73a8af0-2e78f003672mr806160637.5.1758739073966;
        Wed, 24 Sep 2025 11:37:53 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b555adca754sm6523412a12.16.2025.09.24.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:37:53 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, andersson@kernel.org,
        mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/5] dt-bindings: remoteproc: Document Glymur ADSP/CDSP PAS
Date: Thu, 25 Sep 2025 00:07:21 +0530
Message-Id: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tsUc9ODc8UeAP3ixjYnUkX5PrZkNjWv2
X-Proofpoint-GUID: tsUc9ODc8UeAP3ixjYnUkX5PrZkNjWv2
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d43a83 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_X9-DzOTpKYA3bgxq-AA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX2SBemvyMhcxW
 9ufwYo1UnyikT9O7aWzTe4WvK7ds02hJs86aHr6xGbdZXTpi28nRNsfdkfdMCeeB8kHbEYFYpFU
 1oAQ9fjEr9Fs1JdsPEdH458A9QDyaI+2CWEm0j5swJhPXHfqdk/a6Ezrz751dpzxPH/0/6mzPT4
 ivowLf4Ee9cuxhrxoq+oWvGokcjVUjQvdPCjr18f8WUhYi2ABC68rrRBFCOWdKV+qADFmTVVw2J
 4LDDxyhDVpLGDaAIRK7p/c5ibK4pmnv1TADI0h96r3NoQ/2J2Eu7JnLyAKP5j72VRlfoBPFbxh7
 YeMKMpWukLetG6YNDVGPDViBtTT36p77cW3R9EF8wBoo812URI3NmN6UrtMRfSALu+V3nK6b0s5
 whXu7bG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_04,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

The series documents the AOSS, IPCC and ADSP/CDSP remoteproc bindings
required to add initial support for ADSP/CDSP remoteprocs on Glymur SoCs.

Dependencies:
Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
Patches 4/5 have a dependency on the iommu binding added in ^^ series.

Sibi Sankar (5):
  dt-bindings: mailbox: qcom-ipcc: Document the Glymur IPCC
  dt-bindings: mailbox: qcom-ipcc: Document Glymur physical client IDs
  dt-bindings: soc: qcom,aoss-qmp: Document the Glymur AOSS side channel
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur ADSP
  dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur CDSP

 .../bindings/mailbox/qcom-ipcc.yaml           |  1 +
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 22 ++++++-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  1 +
 include/dt-bindings/mailbox/qcom-ipcc.h       | 61 +++++++++++++++++++
 4 files changed, 84 insertions(+), 1 deletion(-)

-- 
2.34.1


