Return-Path: <linux-arm-msm+bounces-79813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52AC23972
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0ADB13BA8C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33B632D7D6;
	Fri, 31 Oct 2025 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpPeomOl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMT9s8nA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDC632AAD5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761896527; cv=none; b=EaRKTgLBupFVv8e/ujLfNsYJt7QkVmJswmE16+PerfoVZSY5907irSFD/AuYuHSwrA8Nd6kF58xmMzK8XIfQIuRL9RRfdjvpnq5d0R7VkBGZpLwBThY+4Wa1Xa5xwEWkyKoCrBFym1eiD+koG7N7/BBIC7XsRWDnTGikv/ksjqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761896527; c=relaxed/simple;
	bh=qlUtzAzZxDCLyyPXTwLpPfLS4uA7aUaeJ2nseKmb40Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbCIPCLzug/W6ZHGaEdn1bo/3AMHiFQDhdLHCXBWQNz7MeMEpQ2pEgXG/yZpYTCF4phGvcU7XW16Gj5O9mNLG21nXW/Kkp4Ooi6pcfYfdeNcvE7mdABA+qBo9GMt9Mf1mpWdM/G58ilr8c3vTOyUhxxPyQJaNZChIrEpiu+Ts58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpPeomOl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMT9s8nA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKs6Mf832347
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jEUn1B3/VYskPM+hcp4qb/Ei4KQ/Ans9UCSA4sJFPwI=; b=kpPeomOlj2aE5187
	a1tg2Dc6c53MMWB9yAFdxKx/Xbj14hiol8UVu8WpD3+jwrpJ5bXq3IkuYooUD5Sa
	7USJcgGcwkP193npPuXdLSCG+0F4O8/JPhKmNu9DhOqykDUC9xtkb3xP0iJ40wjN
	QPSTRwmTdxDPvdGgQ5YPGTdvNrghbftXJCFZgNPP1i1vI/672LjSNZeNfNgN99MG
	2Cc5bBh8kGbW0N6S+oxPI0JmZK3e5DEx20S6bocjb8YEPPqTGs6hAI1DH4I8dROF
	Kq9sNS134nWmyBmPiArdox9Dy3cZUKd5cFV1WiIB08g0xiuQjbcgKMXBXPh7gZV1
	+WvWGA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb1c9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2904e9e0ef9so42524205ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761896523; x=1762501323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jEUn1B3/VYskPM+hcp4qb/Ei4KQ/Ans9UCSA4sJFPwI=;
        b=HMT9s8nAq4JEuid2SCiXXTPnJH596LJckSIkEfcz1N38q4D8GKUBHjQUglxUtRcao2
         SATBSHm6Yuf+2EG2Rim9/kH5qn0xIDNSNVc/zWWmvdnykdYYKDE8dOE+iPD2Q9MYoavR
         5hUwHZ2RiHLoRtfXPvAiW+Fb/IChjd2oCPeLtiKfL6xqgrDL84QJRcbpOj7tfvG47R0H
         Y9C7lY1G7oG1D+ggvoIoqrTLS5OtHF5+io8FsPo1uw1XROrQ5k0NH56gkuxgBbl5Mk3e
         dmYw0pi9AbNicMmw9sFGwUbSKWQiqebgT+uKT5vFUOKFO26oWvk8YfrRIahOIxNrJgRo
         ExFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896524; x=1762501324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEUn1B3/VYskPM+hcp4qb/Ei4KQ/Ans9UCSA4sJFPwI=;
        b=UKpcwq1N9kW6F8nCHmppKkOe9k3nudFDmpGqLMrH1GQxPmClO6AGEKhbPUJLZRZX4R
         lLtQi8jlGaOuMf7+1uBunXC2K63HEkl73jH4NGwK3diu7t5Nw8k/PwpaqwUCtTHYiRzN
         ZQ6J/vLwQ6B4yi9PLxi+lcgeDh2KWOfqli+BFCbROeZOFSHzmL4EbYfv0TwIJ3/eDXhx
         zbO0DtqEz3wikfmxvgh6xnYJayCkQaSEwMwTx1GVCUDJijzdC2GulMwKFd4F6r2+6Ju/
         P+DDCIQ3tdqNFH93hhKJF9DaLbKJ0Gp3rpFenEBymq7y5K14ltiM4wR+qmvODWtQZt+B
         XTAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHlfxJu2gu9WcIHVLzdGOjo1twk836AmAf5ZDVJY05+8iqKKvkw9Yz5C0Ec00/z490YZXxfq1QMO94jwST@vger.kernel.org
X-Gm-Message-State: AOJu0YzOX26iNm3/+N3EShOQL2BanLKZN9sdU4pzHklWDPaWvf/jxF8C
	O1RSHO5bvNk77HyPyk/UmK7DtWD8PzvgLs2zXlCck9moa7Bi83R61h655R2+6Hz9w1vI7bf9HW+
	yQI6pZRoK/aGLSWTCcp/ZDjkV671wR8IhvL6exL/fDG2SnWFl+Vl6Jl+SIwWbtWKPuIN3
X-Gm-Gg: ASbGnctvaMOCBWtY2/pRqE6rOkzEnu0wJrQ/Bj6qHttkPkbRTnGtM9Nc/tLThoryYHc
	ovFrAiPon7qcJ31moTjoQXDUdi7LxXGW41bknM1I0ZWFfQIkisErOT6zPSvub8GslKWGs74VQEW
	n0WS//ldtI9ZIvt5KIEO4RAIg4UFgAsCBt8oUpufR9uFXKcpx3cf9me38rpm1MmEC4vdmx4oZ/s
	lUVMMhKWtpe1CPfJqo7evuMK7+VLbRb6WdT88QwEijugLo6K4vdkqjSUoSzpct+vEpLQa57E4Zh
	seHshLMKwVfVq9ZmUQwN+au3zSu1WZmywJme9j9c5jd9fkD1hCbzvUBIvnpjw83ZX1Bimj5uBOd
	hh8hpo/X748fo7WcwFrC/YgQWNEPsmp44GqgbE6a83UNRbhjerA==
X-Received: by 2002:a17:902:f605:b0:24b:4a9a:703a with SMTP id d9443c01a7336-2951a3d4644mr40113385ad.17.1761896523539;
        Fri, 31 Oct 2025 00:42:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErQsbrXyuB98W4VZPUZXjD0BZVT230MCSsO+Cs/nv14Hpl821fyNtz3MNGo8AVo+zWHBt37Q==
X-Received: by 2002:a17:902:f605:b0:24b:4a9a:703a with SMTP id d9443c01a7336-2951a3d4644mr40112935ad.17.1761896523025;
        Fri, 31 Oct 2025 00:42:03 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696f0c8sm13276735ad.71.2025.10.31.00.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 00:42:02 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 00:41:46 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add header file for IPCC physical
 client IDs on Glymur platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-knp-ipcc-v3-3-62ffb4168dff@oss.qualcomm.com>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
In-Reply-To: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761896518; l=2593;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=6+n6xeXIQsCm4bVQMKIbgwhM/8zK3b3MTjTKsWiI6vA=;
 b=muuDjORrusoCJOFXDoPlj2+qe43LxVBqjAwpJdfoRCg/bKnNy9FuWMna4emTiZgOO5GFCoOke
 ofjPpCWIkF0Aycj2lyZBMJ2/g7VuDWmZLXsLOj0JkGazqN6W8poFtMf
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: NUlbRTsZW5w_cQCxWbsED9S9AUHR97L3
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6904684c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=469midWMXU5kPErhl_0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: NUlbRTsZW5w_cQCxWbsED9S9AUHR97L3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2OSBTYWx0ZWRfX6FK09Cjlsira
 cxM0tVzPdjlswWG3uWuidIJ7ylsOtSXKV2N4ybOFBPsTc7YHqzHWS45uvnZknp6QbQupFI+8mhm
 ZYlFbpmurso7dCc0HTNvjJCQZtBdFxxWjwIQ8k4iNueSsPkA0GWQX+O2GNMWKTrEpntu4OK5Sii
 bdjwyFNF9+2eJoMft9j49siKoSBi5xBcYMI0NRrNWTtc2X0gorUl0F96OhmFq6AOlzLTPAvU9AO
 DqNUyuFZuz22/cJ1elmsj8XfsZ1yEfTg/vGmIGBsa47yZ8eeOFB+CGF3p5K1tQgfeSfUhRuOlb1
 1X04pD5FckrU/iX0iRgK0bxD/X8FiMtRx/4sOlYx5lQuJ8tdBIuK+Q29Rl0lBdoLIDweuhus7TW
 3MJ4BtgpuTjQZ4vDc/OISDRbV8/0vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310069

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Physical client IDs are used on Glymur Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-ipcc.h | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-ipcc.h b/arch/arm64/boot/dts/qcom/glymur-ipcc.h
new file mode 100644
index 000000000000..700cd7114909
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-ipcc.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_GLYMUR_MAILBOX_IPCC_H
+#define __DTS_GLYMUR_MAILBOX_IPCC_H
+
+/* Glymur physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SLPI			4
+#define IPCC_MPROC_SDC			5
+#define IPCC_MPROC_CDSP			6
+#define IPCC_MPROC_NPU			7
+#define IPCC_MPROC_APSS			8
+#define IPCC_MPROC_GPU			9
+#define IPCC_MPROC_ICP			11
+#define IPCC_MPROC_VPU			12
+#define IPCC_MPROC_PCIE0		13
+#define IPCC_MPROC_PCIE1		14
+#define IPCC_MPROC_PCIE2		15
+#define IPCC_MPROC_SPSS			16
+#define IPCC_MPROC_PCIE3		19
+#define IPCC_MPROC_PCIE4		20
+#define IPCC_MPROC_PCIE5		21
+#define IPCC_MPROC_PCIE6		22
+#define IPCC_MPROC_TME			23
+#define IPCC_MPROC_WPSS			24
+#define IPCC_MPROC_PCIE7		44
+#define IPCC_MPROC_SOCCP		46
+
+#define IPCC_COMPUTE_L0_LPASS		0
+#define IPCC_COMPUTE_L0_CDSP		1
+#define IPCC_COMPUTE_L0_APSS		2
+#define IPCC_COMPUTE_L0_GPU		3
+#define IPCC_COMPUTE_L0_CVP		6
+#define IPCC_COMPUTE_L0_ICP		7
+#define IPCC_COMPUTE_L0_VPU		8
+#define IPCC_COMPUTE_L0_DPU		9
+#define IPCC_COMPUTE_L0_SOCCP		11
+
+#define IPCC_COMPUTE_L1_LPASS		0
+#define IPCC_COMPUTE_L1_CDSP		1
+#define IPCC_COMPUTE_L1_APSS		2
+#define IPCC_COMPUTE_L1_GPU		3
+#define IPCC_COMPUTE_L1_CVP		6
+#define IPCC_COMPUTE_L1_ICP		7
+#define IPCC_COMPUTE_L1_VPU		8
+#define IPCC_COMPUTE_L1_DPU		9
+#define IPCC_COMPUTE_L1_SOCCP		11
+
+#define IPCC_PERIPH_LPASS		0
+#define IPCC_PERIPH_APSS		1
+#define IPCC_PERIPH_PCIE0		2
+#define IPCC_PERIPH_PCIE1		3
+#define IPCC_PERIPH_PCIE2		6
+#define IPCC_PERIPH_PCIE3		7
+#define IPCC_PERIPH_PCIE4		8
+#define IPCC_PERIPH_PCIE5		9
+#define IPCC_PERIPH_PCIE6		10
+#define IPCC_PERIPH_PCIE7		11
+#define IPCC_PERIPH_SOCCP		13
+#define IPCC_PERIPH_WPSS		16
+
+#endif

-- 
2.25.1


