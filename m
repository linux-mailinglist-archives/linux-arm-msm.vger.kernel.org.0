Return-Path: <linux-arm-msm+bounces-71113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FFB39C73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E33291BA50F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FF53115A3;
	Thu, 28 Aug 2025 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6SlWyIh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B11311592
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383033; cv=none; b=FIQhNQFtXbowFSqfkIhOnxgoXH30+Mxu+m/mgRD8IgtdsIh1Kn2bJsSR41ljjI5djA7WEt34MmDQEzlVPX6Vqg6k2uhd+sWEOJEUW1OsobedtA4AoJ0zbe1s1wX5aqWPLdkWYIQen0r9ahnd5+R9quWNaoRnrhWlrdsI8rNpDZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383033; c=relaxed/simple;
	bh=gJyZo4+y70cAtQtM0l94BcRRIWPsTYGyCPIEqvg0Um4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W1Z+xMJW5d4La/QobBg7PiFXtIJseC8R0N9Sby0jg2H5Vd+HR4ThWShoFInQ13IrglPDUFJXC/Qr72Y1ycf6cHJPhalao2d2cVaowfIJ9sVUVAs9lezUoR+pfua1RfK/f7QPY7uY/sJOhVGsm2givSsofogp7jTErmuYF9cNiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6SlWyIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S62Xmv029193
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ed6L8eMIvW0AbHtn3XR+t7FYjsouaycVZOPUWpXRCik=; b=X6SlWyIht6MY+2gP
	qkxTu5ixJm3zsW11mJocaFzzjYBQdC+f/n27GVbArjDiLhkqOKQdYSO4a/Jmjdfw
	OODYV/YUs2rVylt1xpCErJEtfCa0pjBtsGlxh0QQ+Q448Une9VaKo2zaUW2r8ZM/
	cR4aOZyuv6NJXhGSBQ7ZOW3tPpcnTfrTP2VZDjv9HSFnCsZtQ38ZUp9FSGGUyqXv
	EYQvKLvK+MZTET2y6J+cC7ImGdCHCHCOMlvpawYyol/FJvcrmMY7tRS+ZjrpszBe
	eVptmnBLGpTj9i7XlQJIj5YcxOaCf5uILR2aZCwXz4lqKWTYXM78ikmMqy+0OwS+
	olqXTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w30b1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3276575ae5eso1042056a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383030; x=1756987830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed6L8eMIvW0AbHtn3XR+t7FYjsouaycVZOPUWpXRCik=;
        b=VqwWgguPu8OSqIGzslwtT7IDluAQq0JJQbeHdYIs0y3qzFvySX5nIlymTfk3EFGFx8
         W7vbijiX34u13VQf+cvV0smxce88deUBDjbU3iZYfPolS5eswnK2MOU3RLe+jB/Tow08
         7Cq+ashQYny7C0cOfl4nFwN/MK3ywaKPRjwZd9xBvAwr/lXS2UIby0n2SpWNSy7DTX4W
         KcMAANPGZMeTWOtoVEcoUXlKCUw1FAYd0/HKkM3axXXNRx62TiXZweUJx9kXq2gsInuq
         u9rYLXF5D6pIkh5EkYYo5/Y2Z9QcmfFKrEXrLxuFz/28hl4zbpvVOydWveXYQqfGaHvy
         VTog==
X-Forwarded-Encrypted: i=1; AJvYcCXTQWDL/u8qVPONxjvj+SjrFCnX26A5gIKAm2BMHdh27WLcIEF1RAweEbmZ1tCE5MLcz/8u0Pau5XDH55R2@vger.kernel.org
X-Gm-Message-State: AOJu0YyRT8PAXGB6v2whAuNlJxY/vNT4Zygg0488fZ7DEjRmRHxNTmJ4
	ucfuWKQUqB8NV+TOuINg8fyEk/1jCVF4CfazztZPpqStS3PV1/yf6APGY980sAm3vMOBsAqvhlj
	JjAQXOEnCPzwfLpHwz064h1Sz5vhZ5ZAWj0I4xDYrnpc6T3xp5BMffVxtzBxhw7iHbUXu
X-Gm-Gg: ASbGncu6EG3UNenbwDOd7gB66kPOux2W12QzT+47z4vC6i4E8qwKUFi7qp5wknDVwio
	fkLUSvMHxGPQzJsBoSog2QRzSUiu+x8cxPKLQEsV5Sy+Dkzipk1RvBQlfp7YQFG4qkHhY5IdHqA
	2p+9QdzqfCg4CPnYxI3r4drQcRxraV3gpMTNbSosSbq7pTXgPXwfxN0Vgbeeit6MowVztS6/hyL
	MzM3BQNXpTkVJOGnhyAJW4E5swt5/rWkk6jYezXUZcb1+4Jd6+CZ0slE1cPmrtlirDDGt3F1Pr0
	LIRwltn9wy4WnEGiEGJOQWRNyAnR4bTB28vw0yYbY60e//VZ3A2A5PhpbhGkhq+RchFLcBOkrtk
	=
X-Received: by 2002:a17:90b:1f85:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-327c0c68a2emr1602900a91.24.1756383030484;
        Thu, 28 Aug 2025 05:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLqn7GbKDipnvW7wO7xyl/z3nxMSZZtjcarpD2Fv56UXUJZ4TTQws5DQWp7lRiXQXSlA/Unw==
X-Received: by 2002:a17:90b:1f85:b0:327:c0c6:8829 with SMTP id 98e67ed59e1d1-327c0c68a2emr1602844a91.24.1756383029911;
        Thu, 28 Aug 2025 05:10:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:39:01 +0530
Subject: [PATCH v6 4/9] PCI: dwc: Add host_start_link() & host_start_link()
 hooks for dwc glue drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-4-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=1587;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=gJyZo4+y70cAtQtM0l94BcRRIWPsTYGyCPIEqvg0Um4=;
 b=m3Z83ZVY0UwHl+oGtMxjjvp8Cwj8Qi1oKlZ+0jAtkA1r8ZOAULJQJy/HJIbx09SyD/w0CwAm2
 oQLd0oEZ6nmACuGRfvCySXEqKHoqu3pc4HcgTAkcz87/6u3scmYEyk8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68b04737 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/AbMeirozeuz
 MDJakChbuXkuSE4IXN++lDpm0rd0LfMFdWcLOztYk6pola9BPK403oSjgm01lIk6qa7hpDf6T+k
 wjxnbcIzqb2FwffPiTekxTYDUITMBNl9u6FCWfE99I7+X2CVYGj/L9DhMoJrFD+CUse78ljxtYa
 vHMrlzAe3XrNrIwzW040jRTDmmzvh6D6XsZohHYE9JgtihqIxjx55fE00hLtyGGBbcyWf5gDMX5
 bcpvVRuYLdY8QnN6x4Jm4YJ9Lu8xOeTxEYZymkEJaJ2egQ4ZMQYJDNMfk3DfsZD9C17//t3Poba
 ZoNUngvg2d5YQbvC8FnN+BbXrd1fQ3N00bzyfDvv3gQ5Jo0zmbQRA9rXR8u3xIBOqxtl8phlFb4
 ugvGBaKP
X-Proofpoint-GUID: 310YU4S1Sd5f_K_I4LfkalVMoMiXlg1b
X-Proofpoint-ORIG-GUID: 310YU4S1Sd5f_K_I4LfkalVMoMiXlg1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

Add host_start_link() and host_stop_link() functions to dwc glue drivers to
register with start_link() and stop_link() of pci ops, allowing for better
control over the link initialization and shutdown process.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 00f52d472dcdd794013a865ad6c4c7cc251edb48..1ed7a75501bd516ef704035a63e5edd35bd7e0bd 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -479,6 +479,8 @@ struct dw_pcie_ops {
 	enum dw_pcie_ltssm (*get_ltssm)(struct dw_pcie *pcie);
 	int	(*start_link)(struct dw_pcie *pcie);
 	void	(*stop_link)(struct dw_pcie *pcie);
+	int	(*host_start_link)(struct dw_pcie *pcie);
+	void	(*host_stop_link)(struct dw_pcie *pcie);
 };
 
 struct debugfs_info {
@@ -738,6 +740,20 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
 		pci->ops->stop_link(pci);
 }
 
+static inline int dw_pcie_host_start_link(struct dw_pcie *pci)
+{
+	if (pci->ops && pci->ops->host_start_link)
+		return pci->ops->host_start_link(pci);
+
+	return 0;
+}
+
+static inline void dw_pcie_host_stop_link(struct dw_pcie *pci)
+{
+	if (pci->ops && pci->ops->host_stop_link)
+		pci->ops->host_stop_link(pci);
+}
+
 static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 {
 	u32 val;

-- 
2.34.1


