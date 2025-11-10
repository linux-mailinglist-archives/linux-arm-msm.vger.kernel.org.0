Return-Path: <linux-arm-msm+bounces-80918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6469BC4524C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0819A1884E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 07:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6372E9737;
	Mon, 10 Nov 2025 06:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqn6CR3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0wjkP7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3D2135AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762757987; cv=none; b=W3t2ADuGpwWUvmmsx9pJ/XY0E9wXQOp1asKo+MgjIdHniwEbE/M65RRErH/XrkwmPMM9xcOpJKHkDNoWNHvWBHIYgts8iDgjxhJy8rx6TKjuZUpHn3hQYOI1prS61N4qV2IiGxRBlqZmPA941WDKU02dimYmIS2bkZjF7ctGG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762757987; c=relaxed/simple;
	bh=9uPSvz59kL39ak4fPvoTw7WfnIhxkAfvUWGAGfV7E8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rF0u0AYhXgak2BXVqHUVscT8oGdXeNiZrh2/zHNFuLhK9vonlI7AHrOYoli6f/ieEoh48dCDC1hqF1RsYJUHmT1hNBSzrI4B6t7UZxDk0fHTvkGxjaruAWbWblvM2c1BqsxNJUXDXDTasd1CcUdqc9ERddBti380CogsL3fyqds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqn6CR3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0wjkP7G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9MlbYq1731552
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+N7JK4cOsZ24XX9hri9w8N
	xqJ3q7bdfHPf8QM9dNfS4=; b=oqn6CR3z/CPRMK6RT13901CAx6yB+VdUA2gFN9
	HQIAuMddY/XoR668AWR0hdK7/7IuwpLjfHzvpOBeOAumoUMtaVonpEyE2kTJr/IW
	yxgRklALL2SGtdzkZ0xRpVIynq4aFGVtLfReYroZ16RrsAnqGR181s87GyJDY6HE
	ZTkqOOh9v4I6qgLylGClrP2IDvb9ehx6/YrByOvryClwfGx7dOJqBKcCOXvMgHnU
	TJcwxHGoaWSC+OW8+DIOJBZqEO6bgLgu8amKgmhb5RzlTc/bfm9ht92X/jeqMFqH
	uqNjjz9N0zpBW/5MavBf6ZyDSsQYcPhgX88AM6zB4m79paFw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aad2a2h04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 06:59:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a675fbd6c7so4468371b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Nov 2025 22:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762757984; x=1763362784; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+N7JK4cOsZ24XX9hri9w8NxqJ3q7bdfHPf8QM9dNfS4=;
        b=f0wjkP7GXIv0oRwIc7CL3fpGOPCMqaCmvV/P8GvY5v+YpxbFEcwaeP4YADUkjf9ZOf
         Tjs5rjYgB/udrLowZhUFXuNeHbnld3hZjvCtgOLgxeV1KwsTDi9MiNEwV+05LATOfWAd
         2CA8Bp3E2sQLXpVbjX9QUI/Na/QQr1kYK9qK3hKnfdW9H4vLRbKp/5fKs2IxALAd1Baw
         43jF7VOn17shwTPVEegl65+jSItwJsyOyH0C+bOJTpqu7gkh2/DHZ4HvszfeRiWCB31U
         k+2+RuS13qCbGL9OsNkFWGx3l5a0coBpxpgJ0IEtoySKt6FtfSUbJ8j4m3o3v6SQgo25
         +Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762757984; x=1763362784;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N7JK4cOsZ24XX9hri9w8NxqJ3q7bdfHPf8QM9dNfS4=;
        b=OpNKhDziHc88NsObOVDoe7hIhPAJokff+llfxG+JuS9/aT7WgH6ScDQvutq0+vqUrF
         E2cb+1i4nXvWY4H9ODyVz77/f68pqgn4UC/IVvK8VnfrQHGp80bqBwyE6N125DQ3wEAT
         HIFY982i6D/K29O/luIIzF1Xd5w0Oh2hQhUZncOVujRa1ReYLL6rJ0gC2ZS7NRcC72j9
         NVEf9HZZRPg10gIUbhrhAQWEn317kDZAONEtNyf0n0yb9njukOfNn0I3Y9cKRudFBzeq
         Ws2R75HG0EBCNpQs0bjRyQTteGa6ZZTxEqtlEFEuYt8GmsRIFCih3zYiGHfeZuxPkVEn
         iYWg==
X-Forwarded-Encrypted: i=1; AJvYcCWzRzf6ucE1f/UGZ2U6ejpevQtuPsiYzyQ19FcCEth2jerAUYiWZv1vHh4W7BdBLt2VIO4AgXXo51ZO94P3@vger.kernel.org
X-Gm-Message-State: AOJu0YxTC1edj2wQ96OO80cuHMBm/wiq6jBWgacZ+lbd6WSo7jlAZeSa
	ahAJyNgwXNtyryesJuQKFR4ashup0ilsCbFoMM//kFnzniMTZCiAL4f1KRfF9j++OLibLisN216
	qpOJ6NFd64p7M2ojjBooPhc0cRc5KBNxdbRK5hXIgjds6dZIPSxBRZUJMu5+B+KAQ43mw
X-Gm-Gg: ASbGnctQJ/a61/Qlik6mSbLmsE4suv5kwGAlaWfbmR52ROq66sgi5JjRVSmb/rWtcsk
	oc+fgEVE0tEmxYDQcjjDFdc6DkiiKcxSkySUPO9icN8qKPCGj4lDpHDoECNwhKWanXXw6FQVXI1
	Ir/85JKjAX8K/VX/k43f5Z5G9EVnaMssQ1b0nKq+QRwVOfG+KiprBWVTCcsvM335hTboxzozOGO
	YcdZZZIYpE1tbxsqY1BijECrbVzPVWdrBN7T9nCx7ezw0pnHuQcOX7iFKR2dg2nZbGrkm9Lg6YX
	DXIzHbJFY95vIyezyubu30zM1jRTJspbz4Dqnk48MYW5sgNdj7u1AOuAoH1hYaFZyF0O5/n4Fce
	n5A3BYAiDVGQ2Q9DqyGZC4fq1DdOjbWBhJz0Uv3dSBXakxQ==
X-Received: by 2002:a05:6a00:2d1e:b0:77f:4b9b:8c34 with SMTP id d2e1a72fcca58-7b22727cf19mr9509628b3a.31.1762757983971;
        Sun, 09 Nov 2025 22:59:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrvj2zaboYO2kASjoEWkwnazqKYzA+HD4AEsW2VfUc8ljMgUsGqkiazcfza2h7dseiyjUnrA==
X-Received: by 2002:a05:6a00:2d1e:b0:77f:4b9b:8c34 with SMTP id d2e1a72fcca58-7b22727cf19mr9509594b3a.31.1762757983480;
        Sun, 09 Nov 2025 22:59:43 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9c09f22sm10565900b3a.20.2025.11.09.22.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 22:59:43 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH 0/5] PCI: Remove unsupported or incomplete PCIe
 Capabilities
Date: Sun, 09 Nov 2025 22:59:39 -0800
Message-Id: <20251109-remove_cap-v1-0-2208f46f4dc2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFuNEWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNL3aLU3Pyy1PjkxAJdkyTzZAMzA4M0czMzJaCGgqLUtMwKsGHRsbW
 1AIcoulZcAAAA
X-Change-ID: 20251109-remove_cap-4b7c0600f766
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Wenbin Yao <wenbin.yao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762757982; l=2867;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=9uPSvz59kL39ak4fPvoTw7WfnIhxkAfvUWGAGfV7E8s=;
 b=YxudWzJ2kaIC8Rexmb+T3cJ181oJYr60GPWfBstX2YYFT21moKv6/I5FZFVvjnsTNoeyTyijc
 rsWaevd6HyWDusoBvT5MVyi2r7jb8911dY2LwfHb5+JPv4HXthjfB+o
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=aedsXBot c=1 sm=1 tr=0 ts=69118d61 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DEqV2ByZc6CzvKhUxuIA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA1OSBTYWx0ZWRfX61QHHU8ui//c
 +VOo1rlveHOcQl0xMUeKf2IH7qkj9FfQO+mPhUZwG/cw3YArjlibUMhryEJeZjzF3qQevg2OGor
 FULNQdow7mbBf94h4A2DrBCH272/RMlNDtO0YUxjzF6apLRQggXYWlijcC8JsxMakOvlLpx6LkC
 aSVDkQD60xCYQwMqvI580GZzrBdlSO0mxEGeXI0oChsOHzP2cQUcZpJtsPH6xOcgQ0j8d925Hhy
 skc/d8/GY0VaOFYWaGFihAIiTSbsCIydGoMHTEo2ERSLHOZgsRB9zK6WDhrNCtnOwR0pNWhES5h
 ELvZO3zRA8Tfq3HxLLdlgM+Bm/gkogAh5bbSKhC7XkBVRj1A8+dPFdjKmFhc7ESVqz7HAAXTUZG
 PqUGrlepIcHGhJ+eMbEX9lYb5BfCOA==
X-Proofpoint-ORIG-GUID: rZAJ4Qsj1IYqZ1Dp-l3HArM-IykJprFI
X-Proofpoint-GUID: rZAJ4Qsj1IYqZ1Dp-l3HArM-IykJprFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100059

This patch series addresses issues where certain PCIe Standard or Extended
Capabilities are advertised by the controller, but not fully or at all
implemented in hardware. Exposing such capabilities to the PCI framework
can lead to unexpected or undefined behavior.

The series consists of two main parts:

1. Infrastructure patches (1-2): Add generic capability removal support
2. Platform-specific patches(3-5): Apply fixes for DWC based PCIe Root
   Ports and Qualcomm PCIe Root Ports

Patch 1 extends the existing PCI capability finding macros to optionally
return the position of the preceding capability. This information is
essential for capability removal operations, as it allows updating the
"next" pointer of the predecessor to skip over the capability being
removed.

Patch 2 introduces two new APIs in the DesignWare PCIe controller driver:
- dw_pcie_remove_capability() - Remove standard PCI capabilities
- dw_pcie_remove_ext_capability() - Remove extended PCI capabilities

Patch 3 implements automatic MSI/MSI-X capability removal for Root Ports
when using the iMSI-RX module as MSI controller. This addresses the issue
where iMSI-RX cannot generate MSI interrupts for Root Ports, forcing a
fallback to INTx interrupts for Root Ports.

Patch 4 removes MSI-X capability from Qualcomm Root Ports unconditionally.
On platforms like Glymur, MSI-X capability is exposed but lacks the
required Table and PBA structures, leading to SMMU faults when the
capability is used.

Patch 5 removes DPC (Downstream Port Containment) Extended Capability from
Qualcomm platforms. While the capability registers are present, DPC is not
fully supported, and exposing it can cause undefined behavior.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (5):
      PCI: Add preceding capability position support and update drivers
      PCI: dwc: Add new APIs to remove standard and extended Capability
      PCI: dwc: Remove MSI/MSIX capability if iMSI-RX is used as MSI controller
      PCI: qcom: Remove MSI-X Capability for Root Ports
      PCI: qcom: Remove DPC Extended Capability

 drivers/pci/controller/cadence/pcie-cadence.c     |  4 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   |  2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 10 ++++
 drivers/pci/controller/dwc/pcie-designware.c      | 59 +++++++++++++++++++++--
 drivers/pci/controller/dwc/pcie-designware.h      |  2 +
 drivers/pci/controller/dwc/pcie-qcom.c            |  3 ++
 drivers/pci/pci.c                                 |  8 +--
 drivers/pci/pci.h                                 | 23 +++++++--
 8 files changed, 97 insertions(+), 14 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251109-remove_cap-4b7c0600f766

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


