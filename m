Return-Path: <linux-arm-msm+bounces-54085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD8A86A2F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 03:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D01798C5CA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AB513E02D;
	Sat, 12 Apr 2025 01:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbZg98Sg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C240217BA1
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422634; cv=none; b=OcHmGRvu3C/tuN/in+UfYJKySIRZTkPWMvCiIOlBk78qMqxEY6x4qR22payeHeJ3QcAErAQlZpSfPqUe2UcgYIiVtTz+KduTwBB9Fw3ZR28pSJsyX9eIpRCnwaQhxTFcYHyfKWnGXpZ8/BaTk25fZz4u7MNrtICYHV6mygOj76w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422634; c=relaxed/simple;
	bh=nfQgkhi58KqTTlHqeIqe3Z3BAJkVp7B7ofnEj4lb41Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OfCUpWZQp3kZWpUqwMxUDci2Pvg17LLQ5Jj9eFVWnJDM2132MzNhVUM1tFN/w4tU1abLlNuljfO3o/aD+HscTycDeBAvM2NbdJt268OhI8f06ywjteBlOnQ9a6CP4Vvzc0a2S/UYEug59YLWmZ32UzVsLfrqrANu3DVOOEctLh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbZg98Sg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BMsnrY011856
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kzWWJrG8gyqNAgH2eVIdY1Ywpi1s5Ws+O9iNgP0Bt4s=; b=hbZg98Sgu4rAyH6d
	Ua+0gEhD0GrxD9fDOMuESZ81I3f8HQqGjKLzxE6+/Bn/lZBvOZ3mpXSF15C8oExI
	hVLMuKxHKGDVTZeVFyEujbNjer5kYNJhLbsWtsLzfzGWNVdORwl55qizsXWcPeMr
	WS0zglokNjcvEper+2acDCYmtoGRY8eGLLfjEXlO+h88O/SuIozl+37IVnm3YxKv
	FF7g3r/Nj6ehMPhzqtgjTYnz8qkQv0sT5njeOrrc56aGuY+im1MEgbdqEFP+yVus
	8tngM/Zc83xX4fU2SHE9gs5DsB/YxXHMCTBrrgCZbpvTpWly6IPJJkG9md5Z4uwl
	ZpJFiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3n1k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ade807fso39541435ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 18:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422630; x=1745027430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzWWJrG8gyqNAgH2eVIdY1Ywpi1s5Ws+O9iNgP0Bt4s=;
        b=h8OveaX3rKVbEwjnEIeMCUFeaHOaN+ix8PvdF8W29foA+dpbUTqzlQ++Ul1GKw/lRM
         XQrgCri0PoI06JV+KL0BZTBgzcZw4RguJ57mvnJF2wIQPlg3oDif3wJq35AJ2LsThXGK
         PO+xQ2XV8BfwuuVrkwVaIJTVd6hqPtTv6Esk/R9MqjfckmjPX3YvI5RyUD4o6ZtC2xN4
         oN/u6zW425hTi4m/GBMrwehIpmrcyeGpqNyA7vs65Jcl/hirWwG0+z2PJDJehZHob7On
         +3FQ25IOGuTEJ0mKYJy7t7ewNklKsxP4ILXQ9flZKPSxXG8X38V8G1IqBJLkl4MjOIz2
         UERA==
X-Forwarded-Encrypted: i=1; AJvYcCUbfDuwDkQ2z9lc9jaoQUuu5SOFkZCcyRDBLRcQEuO0YV6mH7rxRXXNVDnkh0tCPmP5vvinugFPlK4S8x+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQAK4tP/j/bvpnd4fsOIupQv+bRWVcONJi+t/bPjVbOX/GC5D
	Q2cIPIbqbTZR6cASY1MotHQqeJlrABDXxBH18VWhox4CR4kEyBR1Xe+PE3f6dseIqOW/RCi6O6g
	rI64G8Bb44guNEwyM3r2iCvYW2UjOgpMA1ucamL5igvwVXQQ4AOpGGTKavbRZjYPz
X-Gm-Gg: ASbGnctk+Xo1OQi8znBM/cZCzJZMJ12mWm1H3yvfkgiFIrFc3nqFIYFQVXVx1SWbnS4
	NChIaUhwe8D/zqhn5vpTPRC419bZb6oxUarlvzaKbjz+zTsYks6HrMYy/rx282gYydyRkmOx7Jf
	sV+gG6td1JWqArBsnh7/YdB+wb4XjGhp7pfnllcwuhvDhhBICI8AyPTZK53WVbttG1YLplSj8Jh
	6ZGlzqTLxdasFUJkEso1b+y2kOXeSqj92YFYicOsXvJ6h7qHV1jYk8Ys1YkbOM9J9DnkDa9cBNA
	onQbyw406QcQE8x/zbHKq0ACzHuX9d+Bm4P0fS1gSgaV/XU=
X-Received: by 2002:a17:903:1cd:b0:215:6e01:ad07 with SMTP id d9443c01a7336-22bea49559emr57126925ad.6.1744422629962;
        Fri, 11 Apr 2025 18:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXA6v5avEK/Uy9WXf2DhBnNqZgEyJbYFQRdT0yoLt1o4v2ykW7mF0pxQGvcF18j1uPfj1WdA==
X-Received: by 2002:a17:903:1cd:b0:215:6e01:ad07 with SMTP id d9443c01a7336-22bea49559emr57126715ad.6.1744422629455;
        Fri, 11 Apr 2025 18:50:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:52 +0530
Subject: [PATCH v5 3/9] PCI: Add new start_link() & stop_link function ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-3-5b6a06132fec@oss.qualcomm.com>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
In-Reply-To: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=1556;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=nfQgkhi58KqTTlHqeIqe3Z3BAJkVp7B7ofnEj4lb41Y=;
 b=0U78rbujh0jDBD+1Lp2sNzJWdNKxmknAuqX10MDmqfsJghh0oDTlPevOWhXTG3sRsYbQk+jgn
 DPT6Vm8sHFhBj3z95WIGksnclIWXbMX3m4XTV6zH5SVUvimsEXnnSF+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f9c6e7 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Yb3Dj85D5_u6pXn82cK6bmFrgB9Pr-Eq
X-Proofpoint-ORIG-GUID: Yb3Dj85D5_u6pXn82cK6bmFrgB9Pr-Eq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=852 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120011

First controller driver probes, enables link training and scans the
bus. When the PCI bridge is found, its child DT nodes will be scanned
and pwrctrl devices will be created if needed. By the time pwrctrl
driver probe gets called link training is already enabled by controller
driver.

Certain devices like TC956x which uses PCI pwrctl framework needs to
configure the device before PCI link is up.

As the controller driver already enables link training as part of
its probe, the moment device is powered on, controller and device
participates in the link training and link can come up immediately
and maynot have time to configure the device.

So we need to stop the link training by using stop_link() and enable
them back after device is configured by using start_link().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 0e8e3fd77e96713054388bdc82f439e51023c1bf..09cda518350c8ea86bf1c6bd64ed8d67e774c8df 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -807,6 +807,8 @@ struct pci_ops {
 	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
 	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
 	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
+	int (*start_link)(struct pci_bus *bus);
+	void (*stop_link)(struct pci_bus *bus);
 };
 
 /*

-- 
2.34.1


