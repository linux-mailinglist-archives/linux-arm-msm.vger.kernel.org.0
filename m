Return-Path: <linux-arm-msm+bounces-46056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50123A1B350
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A1EE1656EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDDE21ADA3;
	Fri, 24 Jan 2025 10:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WX6Y35iC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C121ADB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737713458; cv=none; b=qG2nnqXbaovc/1hgAbdNV+/+GZ9lrAFh9lY5SH6APD7DXCDmK85c6t74Cayt7T8MDTOr4/BnDoYH6JxYm0H9vrIC21+0rxzLvZJV1TuSd1w39qhzQbZyIT/pPWYkzQ1p/H3R2U8/bOqTkYiTGq2OpClFN8uMxteXrbVA3usdk14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737713458; c=relaxed/simple;
	bh=n8LBnxrDnBbcUXm/xD+VonYiva2MgEDrR8IbQUCoyGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aeDXAUTMo1rQD2FazcM7bk+JKRI1GRO3I2oihjW/GB+3vu3o3CdHWKfygihn3RmBURf9A/QCzAoBYKbjFjZK6TaT18evxWSiAmvuWwM4UoikQ4Ofj6GXRHLYjNhRORPe+iZYJdGsb6YrjCiEeVS3VmCdJtij9Vz1CiyvQ4wFshw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WX6Y35iC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O5T6mB026325
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9NBpxVg2cBMC6znT9WBrpS6Wfd6zoznAlFR
	eZfrgsW0=; b=WX6Y35iCRJ8/LvrXYDqlJCfCj7r+rLn8ReP/VSffq4OFX3SwVHe
	bq6e7BWdsF8Whxad1gXrDRpxfJAuGoGj0ASKw+cZTuhOn+/9koP/WfgbWCoi4Orn
	c/scdESldRhWS92qKXsODagUditLe6itiKubJnL4NKB9u8lj5ELhroQxzl8aQLvI
	p8H9QwYAufpbhHXHWogODApmlR+Ipnpip2wDumMcmM/gB0PdmSl8Q9qguZfYoRKt
	5vYs21/oVoqXcz/qopjm21DItjjWvpwIfWiTvNloLLuxbHpQKQLvtY9oZYfvb1fH
	1S3HJb3x/frHGtSZVMwQ50tcxX8Tei3tMeA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c4rngq1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 10:10:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166e907b5eso35203975ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 02:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737713449; x=1738318249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NBpxVg2cBMC6znT9WBrpS6Wfd6zoznAlFReZfrgsW0=;
        b=Z9tqQy/ZagMrois13J1Cbp+tfrdguppLrNpL/n9bcHGwZllvXZ2UoQGEPG8t/JOJKR
         c2FTYo9NAj2IqjKcZnjhRNa/WfhnsYP7cop5OvRRbRvf7f5deCPd/IhnnMjhqfutu23T
         L1dhr+nVQZh9b6zrDGlHgXvk5pYwa/HfI5yi9UXZgBk+SmBuoGq+kuGoQq5fkqKMTxM5
         xjxET16qJAqbKE7eN5WdmQwLHCg6FttbdPuBrF8hgjRuFE9Lprz0F6jEdHE5F5MW317h
         sXwVYVmRncInFsw/B2xyKMPcPRsffgARyMXbkrNH20z1CARlYUtntDSe/LjH8XONjJNv
         vYPQ==
X-Gm-Message-State: AOJu0Yy2kYqi5bVnqqF3PlpjdNEhClLgWfeTvKx3s9C4HVHXY8x/BZgn
	ar6MJfP7MTVKabjKe7PsKOsi0IFxW3pDWlNM8xHOpbebWTPzzyivI9LztL570gfs99YYwpzo68z
	o4PyQtYwM0eh9C79cYe+v7gIVkORTi7PQb2w4yPN4QT26b8aLBITZaJUoWjJ+vq0F
X-Gm-Gg: ASbGnctqTS7UnXE90MHGkFKj4onSILF6cD1r3v1DVouWqhhEw3WxwoAgDeel9Ucl+65
	5m/Xt5zRqbaJfI/mIbOX9ASsX01x1QF1qG6FcmQt7LH0tWQEGZxzGy7OeMxlo7t/qDuEMoA5im0
	DXt9VbLMqfDJB6BSzza1xogrxsnmolwdKVdG92g8pR77fT5B+eOAP4qyz0O15LunYl+zkhBIma6
	8JlZ3v6wUx/lc5jdIPTfMoPGKS2+TlExzT1XD7EO70cIYO3ZLv07Nvuex7fQ6XK7YAoUbNpkaAf
	t75IS6uB90AkEhfOIR/9HwQ2Y3wKug==
X-Received: by 2002:a17:902:f601:b0:21a:82b7:feab with SMTP id d9443c01a7336-21c35594fd9mr441785715ad.33.1737713448966;
        Fri, 24 Jan 2025 02:10:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGABoegU/H7TpE+0qoZZPoBSDODBsyYLWoLVFOYvGbOKcXuJH6boH3o2G7cWF/3MfuPx8Cbvw==
X-Received: by 2002:a17:902:f601:b0:21a:82b7:feab with SMTP id d9443c01a7336-21c35594fd9mr441785265ad.33.1737713448598;
        Fri, 24 Jan 2025 02:10:48 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141dacsm12773825ad.133.2025.01.24.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:10:48 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH V2 0/2] schemas: pci: bridge: Document PCI L0s & L1 entry delay and N_FTS
Date: Fri, 24 Jan 2025 15:40:36 +0530
Message-Id: <20250124101038.3871768-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w5W3nIFHqQv-aoD8aZ-aZHU8jPiw4gB9
X-Proofpoint-ORIG-GUID: w5W3nIFHqQv-aoD8aZ-aZHU8jPiw4gB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240073

Some controllers and endpoints provide provision to program the entry
delays of L0s & L1 which will allow the link to enter L0s & L1 more
aggressively to save power.

Per PCIe r6.0, sec 4.2.5.1, during Link training, a PCIe component
captures the N_FTS value it receives.  Per 4.2.5.6, when
transitioning the Link from L0s to L0, it must transmit N_FTS Fast
Training Sequences to enable the receiver to obtain bit and Symbol
lock.

Components may have device-specific ways to configure N_FTS values
to advertise during Link training.  Define an n_fts array with an
entry for each supported data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
changes in v2:-
- Split N_FTS & L1 and L0s entry delay in two patches (bjorn)
- Update the commit text, description (bjorn)

Krishna Chaitanya Chundru (2):
  schemas: pci: bridge: Document PCI L0s & L1 entry delay
  schemas: pci: bridge: Document PCIe N_FTS

 dtschema/schemas/pci/pci-bus-common.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.34.1


