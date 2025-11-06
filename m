Return-Path: <linux-arm-msm+bounces-80519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94832C39410
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 07:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E4B54FB41A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 06:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120FB2DE6F1;
	Thu,  6 Nov 2025 06:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8e8NzQK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI0u6VHp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849872DE1FE
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 06:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762409631; cv=none; b=h1GeaQPoLnK3Ug+BmhsXZhdUBxSswizEyKxZ+kYDFYRz9B/IBLT1/oGgMIL46xZNtuH15LZ307BVLrl2fG3DryKvFzd/Ev/rXdXncnQySokTKfkEhVhmtYrvuo4MVUDfZVHbl8VWmQ+TN+52N13OaM6o8umHsRglnKIUYblirIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762409631; c=relaxed/simple;
	bh=HT4nVZpTKboMb5Or5J5uvYygpZjM94QiOo9HruFPObM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D3qpCiqR0/WtbPD+0P0RydY/L4WWnL7VhAIMiEy5dm3Fk2cuRyOrb1QNTg0kbEJNcbxAoDRNPM6WE44VoyxhC4F45TnTuuZ0eiARQpD2U1rfsXnRGu0xDBHGCUU3A4R0ptcErjVd40wyTFLSKQrlnVSorxjtj+Yy6XRhrgTYNTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8e8NzQK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI0u6VHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A655Y8Z3217418
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 06:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Bz+iT1VU6DH
	p66xQoSXUMGHnHJ4BKJqm5XqeWac1BUU=; b=m8e8NzQKKakKGqJjDHdtOgtO3pM
	x+Wp/kgg0tgZcAg+Crii+FPwgqatmRMDTH4ZkAZE86FWVYliTOKyUA94WsY7R7Uf
	DpT2gchyflovf1f/mDDt6JAh5Auw/CJUrwZCbWohyAy6HS45kxlZ8zTwYFJJcaLC
	njzqSuMJHMW4umEiSSL0DR7A50nked+s4EdxUzHqsxx1nmhS10wH0cFYyxsGP2IU
	TxWJJvclvJxEKh2EqnTaaDCEhTqIxdW2+pAilQ5+T1Sj2nPmQI+BJMsTCAWd8tq+
	JKzvNc09Uq5hmX09cCeUZ2oDW/RjJMwCx7bOEq+hImzkuKpXSkgncZxF1uQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8n7pg5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 06:13:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29555415c09so8414415ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 22:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762409629; x=1763014429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz+iT1VU6DHp66xQoSXUMGHnHJ4BKJqm5XqeWac1BUU=;
        b=fI0u6VHpwWk2yho/VsFO1tD0BmnbZ546rFsSDigV7EPbN8meSD+CM2mcbrOmdioxFL
         FokI+uai2TNyDsSf5k6EOY3KkXFQI8FwvtR4XgWwgt6lH31Uwa8/TguAqDtA9Ke3CMXr
         TKqTx53LU0aZojkz4ugU0Nkp+k7BxlkfbNU6+XDWLRykJxh0vgyqgUp92GXpDRKXRVZM
         njg44dOHP+Q4eFYg/FwJb6O8m6SYM9mgkYT3SuUrftsHQZa0RHLR44fsUOchtBgzsZWe
         BEqI0A8lcKAPaxForuVqIe1FdHLzD07zmSL8WeQkBoxdZ8Gt9HnCdxjFmn3LHS/9N6FD
         eKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762409629; x=1763014429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bz+iT1VU6DHp66xQoSXUMGHnHJ4BKJqm5XqeWac1BUU=;
        b=DW2rVW0SzHjIn7gXoCyVVBqYvKhrIFFCS21oyD1HKD2gmWRWqatkPbsUmjKNSevYjD
         620ZIoaDVW0GfKY3OXYsJk3ma2g5AQZN+s/a/n/8d5vV7OdUHEYsypRg1w6s5JOgG6z8
         bWkaDxW6AuW/rco9pjZVPweo+39aydv/L3ozlSdwBKSRjvyivLfnFSxyS/fiWm7GGag2
         JwSmJLKmss+Y+VS9EizTwK4jNkEabKbVyc0Z8Zs6DnS2fKS/dWeKlZEm9GuHCZSWv6yt
         31jun9YKRq2LFE28I6s8YkWmlFsbivzMRkOKmO2sbZAMXBobMcogeR5PqZyXnMh+eFx4
         ErPg==
X-Forwarded-Encrypted: i=1; AJvYcCXdFvF2KI2yvPLI9lkaU66n5QRToHgKhteCxwSk5Hi8wGUPACzk3V56Nim5AQ70B3MgGypOx6vQYESdKFFl@vger.kernel.org
X-Gm-Message-State: AOJu0YxzKdTu+AZkcoWOpHOJ6bD+fLCTRt12VEBi04LIloEkV0mFAdnm
	nLVmex3EOqPecjKO+u4SmnotAsmOc8Pc5iLlBQG0ci8oKw6AqaxKBZ3iIybUhsGihvEa5sF2/Qh
	+NSqWrHn14314MQSYsdDCFS46ZtZ/HUL+4wzWzA1fQ5c5gGRp60N2F3D+J8leVlx8RfVO
X-Gm-Gg: ASbGncszRSvSVv1dk0eLrsqVt0nnaTZq+izH9TNo8BfVicvln6mrgAXA5ENrBB81Pfl
	PESFW8/nIIs+mQB7X2g8IhPLr/YU47Ijz/JZQPXU3XVUQF7689cENQu/ndfG/JBlMALJqBPjfhs
	fbO45sHtrwmebiwdZDeuSeNJEIuYHeOMu8L58s6xOn5hEv41JdkUjKVPSACXkYk87v0/J9MBctd
	8TEvPgJhEhi+lAFUO5tIrUT5iNdi4fPsynORbBpcCzr/pJwtR2q03JnNCO86lmhDztRvMkBS8hv
	epkkDCMody/pC/e5c56h9YwprxKiFuJKskPLEdzBsAL7sdXRCEk8wWey1A/r+WNwVJTCpNC7S+3
	lV5cF7f2VaRtI5XYA
X-Received: by 2002:a17:902:e88b:b0:276:d3e:6844 with SMTP id d9443c01a7336-2962ae5588cmr78077525ad.33.1762409628780;
        Wed, 05 Nov 2025 22:13:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFchEuYKBu/vaO0ZLZ+TJY4t+sNboV0WKWOxuZqochr7Tk3bduN0PaUyD9tfuSGWl7zbKBjiQ==
X-Received: by 2002:a17:902:e88b:b0:276:d3e:6844 with SMTP id d9443c01a7336-2962ae5588cmr78077195ad.33.1762409628250;
        Wed, 05 Nov 2025 22:13:48 -0800 (PST)
Received: from work.. ([120.60.59.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c73382sm15036305ad.69.2025.11.05.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 22:13:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH 1/3] PCI: host-common: Add an API to check for any device under the Root Ports
Date: Thu,  6 Nov 2025 11:43:24 +0530
Message-ID: <20251106061326.8241-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20251106061326.8241-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: k0jcqRJ5I-kg4qE5yUkIUZYoFwL32zNE
X-Proofpoint-GUID: k0jcqRJ5I-kg4qE5yUkIUZYoFwL32zNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0OCBTYWx0ZWRfX4U52UdLveAd9
 7lfisdDZANcKRwy+rFxcpnU1CzG8XvZzSPFTPp7QgzX8tgxjlSDhCiU2f83rQ068rikdxxD2ZgA
 Pw2lrgR4MiqfvbrazRFhnywPKsgi6FVdLDBPzXFlpH+cUwl4VAYiI996HlV6FZ6MssgrYKar+Pa
 DIgw3vKs2UpNaRoaaemboh56YD3kHQ+Q73K8to8mn6g/TBmOFAPpnhYAEXaVbmRz32W4US8P3g6
 auAqCT9pq2FWVCQAvBl599eYK56NTBiQLGFwrBrMDCrZwv3XN7Ue4M13G9D6Kh/bnXxY/5AjmCR
 r1ps5QOqmSU42on/o/6Zt4HaupwI39uNZzEE0/9cqFLIwM01ulkuV7F2T3ZIlTDBl//YwuyUPss
 iLDRZpdRZLCdzijZqt0Wu9jG/1NDnA==
X-Authority-Analysis: v=2.4 cv=ErnfbCcA c=1 sm=1 tr=0 ts=690c3c9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tomDxdmRQcfPzRosr6lsLA==:17
 a=X544SMn2G6euAj6E:21 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dVeha9RqDf-OwfEDNMwA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060048

Some controller drivers need to check if there is any device available
under the Root Ports. So add an API that returns 'true' if a device is
found under any of the Root Ports, 'false' otherwise.

Controller drivers can use this API for usecases like turning off the
controller resources only if there are no devices under the Root Ports,
skipping PME_Turn_Off broadcast etc...

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 21 +++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index 810d1c8de24e..6b4f90903dc6 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -17,6 +17,27 @@
 
 #include "pci-host-common.h"
 
+/**
+ * pci_root_ports_have_device - Check if the Root Ports under the Root bus have
+ *				any device underneath
+ * @dev: Root bus
+ *
+ * Return: true if a device is found, false otherwise
+ */
+bool pci_root_ports_have_device(struct pci_bus *root_bus)
+{
+	struct pci_bus *child;
+
+	/* Iterate over the Root Port busses and look for any device */
+	list_for_each_entry(child, &root_bus->children, node) {
+		if (list_count_nodes(&child->devices))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(pci_root_ports_have_device);
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index 51c35ec0cf37..ff1c2ff98043 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -19,4 +19,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_root_ports_have_device(struct pci_bus *root_bus);
 #endif
-- 
2.48.1


