Return-Path: <linux-arm-msm+bounces-83442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AEDC894F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D6243545F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9433090C6;
	Wed, 26 Nov 2025 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6Yhuagp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1aQ/TDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E0D29994B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764153086; cv=none; b=Y2pH1oECmsN8VtSaN8UeH7tb4de/zyBV3yQ20eEUCm3f4Kzy7yv745vYH7+iaxIeHZ2JvtVEK9+XODkr2NO4IYlq6nfYmlETxeSFdIWoTqFumH2pSBET3n9C4HtZ7yF6MoPFYA2IoYuPeMPs9S+5Nbd7ocjosDKCoe904EiYroM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764153086; c=relaxed/simple;
	bh=XBQV6zbTgM5PW/11ScmAaN6KwicooE8rv47r9WmQPd4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dIcmTvk2J7aJuqg8o8Fh/GAGDln7u5Y3UCj/3dkKETH14EuddvKiC654rP/jNyKn/bBc498j6VslJl2qKZkHMsfKjmtU4UTODhIk3Ku8Ou8zEyLX7mheakmoCMtckj/pC1FyR0+bKy8IM0YmuD+fbyJt/6pggc8W7qgris/XPYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6Yhuagp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1aQ/TDR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ6v4Le1457983
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ysWSZ/rG34suqAdQu+gZ4WZ32lkN3tM8tmq
	ZfOIp8GY=; b=Z6YhuagpBv6E0NEJQiV2zHRpcwac7Gy1+EoP5JbaFYuFa2+BG2j
	1JR+OLcuMzO1lsswNzr5hBX8j/1Nmt2a6XLHSH6RqNRQHeHtvw+KOxQdjNMOu1y4
	FQEUCcTZ6s+alU7s5lCcy65/6KE1N79RkZpnOFgoqTVw8AlJM1ycAZSd0vvr/NOB
	mQkYmoAIkfoguXyhbLrznm64Xh9oakQQDddd93DM3EbgqvjjBArXy8GA9FFMqMSJ
	8OvuVu4pIP3rBK26A/2+rarAJBWIvEFDk52nJAUhjtDazp9mdHTYjCXCE4hHr0/D
	MxnbhnNo8W90grOrYFaIyn6Cj00DgpGJRuA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvgn4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 10:31:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956a694b47so95390705ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 02:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764153082; x=1764757882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ysWSZ/rG34suqAdQu+gZ4WZ32lkN3tM8tmqZfOIp8GY=;
        b=R1aQ/TDRszkr1IQkOFcWPP0f1BOhsGUgn7K/D8hIuJq9FA+hbbLbgUDSl/OeTywfl4
         PLThNlrmOjZQcHWPyNRa1hx9c8W87sOR5qUDCZeAb+c/ETxEzTlsuVH1RElTuf2idNoS
         a38Sk0S9WtEG85/PK1HLZsjjQN7Eeig+Gb0Q37EAURzfUlpcu1UfbdgKYuOGVYEmOyqd
         qRNMN3jJAzYGdmvlJahLZNV2nD4wwSsWRhlkNNtJhoBtPNUIMH8HaiWq0/tbA6apmBP1
         oyzaqksg8+bUGJS2NYYxOa+CXlPriKi8orYTupjjng9DoLHyC6Ur2GixGbm1oOTEljW7
         JbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764153082; x=1764757882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysWSZ/rG34suqAdQu+gZ4WZ32lkN3tM8tmqZfOIp8GY=;
        b=tUDjMzLm3TQj7nIH6E20xsD4TGWVEz1pLdr5fQle78HtdO9PXWAtVdEjPe4UpDoQDn
         AViaSUQqNgiPXnDa3qPU0FhajP2ZJh00WDbOWailR85DnyGHe35rGZyhx0BZEyRdLsVy
         ImR51G5lgvVHp5/yorYiCpSOggOV+h08PHKOINnEIRtiygTapYIMMPXUeSJga+JP0HiC
         w7yzvJsf+wnV9i4URw9TBZgBaUkIilfNRY2Yiw0kbqTEGII63mYb0z/yNNabPIhIlOEj
         zv2WVtNqJwtZVfs+k/dyBC/CfQs50wS+Cpjx8d/nqaT/rCEuVy8kBmBJ8mqqbCjpTsLz
         ob/g==
X-Gm-Message-State: AOJu0YzJnxoHkzCnmJhZHSXZbIMHlY4HZ39B211vKudaD0Mr7IyQ0z7D
	TYUnm1Ux5ulr01ntNwarqfDUZSYqpay8wa2UfPLPoMbpSX27jQ7As8nr6KNPiXqyxZpTWeGkhxM
	InNG/CAtt78gQYO+hG5OmG+s/IviAoUpN9f+A6N2m6LlmCNoJeyT2i2tdTsmljxrNCN8p
X-Gm-Gg: ASbGnctsUxgR0JBV4GGx09h4TeokagQ7XvRPg95E6YgVMzHfhQRDoQpgijyCjm77DEP
	ZjCiDPkQMS3l4l0/PKlOukfLYUDFzbji//Xdaciti1TG6DkYEGZKs7hKMQBNRLgR15AamzKC+UI
	HQ3c0K4C3DwCABtv7yeP72HYGgLaP53R6vluX1CKGomkAWEuhOQA7u1zGw8zGgYIZvUs4mIH3gF
	67dfWNFHVondR9l3LsjHjLxcO0gH8Bae5rWwNd9XHgZnhdY8ha5trElClIKmj6mubiMEEVhCFK3
	gCLyK2nzc8e9q/Hol/yyR5XyPNb6uSq1YZaqzumhVC0bT4eQoKLIiNgC3qR9EMVCIlaQ1FiqdjJ
	nu58i0svBntPXQrG7k83ttpuDhGRLua8OEes4kXkgq9xt
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr68896045ad.18.1764153082186;
        Wed, 26 Nov 2025 02:31:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtNSOALWZhHSuDXvX3CzC6UbjFFjub+TsW750YdkPPPyau87i9PtTK1ZxruaatUAFQE/8y0Q==
X-Received: by 2002:a17:902:d4d1:b0:246:e1b6:f9b0 with SMTP id d9443c01a7336-29baaf9abb7mr68895455ad.18.1764153081592;
        Wed, 26 Nov 2025 02:31:21 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b26fed2sm196534635ad.69.2025.11.26.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:31:21 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, mani@kernel.org, krzk@kernel.org,
        helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        krishna.chundru@oss.qualcomm.com, lukas@wunner.de
Subject: [PATCH v3] schemas: pci: Document PCIe T_POWER_ON
Date: Wed, 26 Nov 2025 16:01:12 +0530
Message-Id: <20251126103112.838549-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA4NiBTYWx0ZWRfX9J/1w8XWHUXp
 PH3xqJXORa4EgDOns78F3UmkW2g2FWfqIVD2YySOb0admT09rx0Wz48P0fZ68+Tf02TsCsC0Nbk
 FwBYgNwXxaa/Eu3OXv/QcE9YrFGVHASxFy6Cb5EZ5P42fs8VI/ZFZUxZUZAhP4bu56RxCdkJJNm
 AdZ5g3PxyAQ1jV3jRkVJSPIcULTHG1Hrju2lrDOKrZVyhAzs2/SNbm3US0F3o2t/amPxzUTC4PD
 ZzI3w2dowhM+sGAGH5ssBtXOpH+RBWXxv/7CvkYyDUbOwfNJqgbTuoWZCaVhPjCB9idk/4fP074
 J9fxpsMoMjaXpeTk5HMAOf60mxhnvDyUTSzPFwAXqt0eannw2/fL/HccJAV3LbSZuNa5QFUiOPS
 9h7WHy0u9GpBIbExZShGIfVFvfs7nA==
X-Proofpoint-GUID: sGuMh-42KeJcpzrUgCd2VZgvmw5bYBgD
X-Proofpoint-ORIG-GUID: sGuMh-42KeJcpzrUgCd2VZgvmw5bYBgD
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6926d6fb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qIbWdXD6M1inJYch3NYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260086

From PCIe r7, sec 5.5.4 & Table 5-11 in sec 5.5.5 T_POWER_ON is the
minimum amount of time(in us) that each component must wait in L1.2.Exit
after sampling CLKREQ# asserted before actively driving the interface to
ensure no device is ever actively driving into an unpowered component and
these values are based on the components and AC coupling capacitors used
in the connection linking the two components.

This property should be used to indicate the T_POWER_ON and drivers using
this property are responsible for parsing both the scale and the value of
T_POWER_ON to comply with the PCIe specification.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v2:
- Move the property to pci-device.yaml so that it will be applicable to
  endpoint devices also (Mani).
- Use latest spec (Lukas)
- Link to v2: https://lore.kernel.org/all/20251110112947.2071036-1-krishna.chundru@oss.qualcomm.com/
Changes in v1:
- Updated the commiit text (Mani).
- Link to v1: https://lore.kernel.org/all/20251110112550.2070659-1-krishna.chundru@oss.qualcomm.com/#t

 dtschema/schemas/pci/pci-device.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dtschema/schemas/pci/pci-device.yaml b/dtschema/schemas/pci/pci-device.yaml
index ca094a0..4baab71 100644
--- a/dtschema/schemas/pci/pci-device.yaml
+++ b/dtschema/schemas/pci/pci-device.yaml
@@ -63,6 +63,15 @@ properties:
     description: GPIO controlled connection to WAKE# signal
     maxItems: 1
 
+  t-power-on-us:
+    description:
+      The minimum amount of time that each component must wait in
+      L1.2.Exit after sampling CLKREQ# asserted before actively driving
+      the interface to ensure no device is ever actively driving into an
+      unpowered component. This value is based on the components and AC
+      coupling capacitors used in the connection linking the two
+      components(PCIe r7.0, sec 5.5.4).
+
 required:
   - reg
 
-- 
2.34.1


