Return-Path: <linux-arm-msm+bounces-88190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4291D0788E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64B343050009
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F84C2EC55D;
	Fri,  9 Jan 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSqF8QgM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IcxRMuEb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC12EC56D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943286; cv=none; b=l9jfcDjZCHG4Zsk9Ay1HJjABvi9t6ItNoObXqQEBfo8zYoJo8d7ntDqdIqOgj5T8SuxNp/jHcc1BnXqzttt7b5UjgpQfHCk9yVIBY3SPTNUOY0dU+HhLKTyLd5VDlt29OuaJWMLgaYusXRSa1hpqDA6fQg+sW3OMMxVmIFyiTLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943286; c=relaxed/simple;
	bh=vinmZfaj1r+n5Dx0UgKPAqqqJqXxuE6TZN5VPmabgjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCGa/YqnBnUGSkn47z1rRcsGzn6g27x4IoBMCu2BlbjIiXKUITiXw5a/ci5G5TGTEWfvE9xG4AOMcv9d4r5rMWbw9Ry7KNEFUw5eSRR1fcpbQTX5cb017PrWZ9eiUv/v6gps4up5C3ha3torkCDc/9ca59/31HyjJxy4EzcI+ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSqF8QgM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IcxRMuEb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608NqatP3728466
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bATFQdgkSJQNtrjTPNUlAQXLkiJbzJjL5+F3AAAsVSE=; b=oSqF8QgMtNDLGz4+
	XwJrZs+Kv4Kg79Qp9FJMAvFRCHRvU6o8kDFAs3e9TuZAEzaArrSFZXzRVyfSOrOq
	7hYRlhcLNxHO4QZx5EH7zxrKBRxw/zn+GJuhvdCqwuYvrLn71GvnPcGyModHd8VI
	PtVRvg3LWAbBiR3uSUKVEWmIRKy9OMxYnLCkN9Wqi8ieunynauGtpyi4FV/Zw7kC
	WrQ5MeT4F+fsEt6rdxmJYP6lqBuppgYjdlgsR+m6YnkLZOoFW3+8OhWgwtxHz9BY
	yh1pg54w4rKINHc02bMl27pMu/0QznERgFiJFwkzAekMh3spnE4vNBzQqND9XF98
	09B7+g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkh2r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:21:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso3716519b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767943283; x=1768548083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bATFQdgkSJQNtrjTPNUlAQXLkiJbzJjL5+F3AAAsVSE=;
        b=IcxRMuEbe/ZDPXJXMzswhRP/cqYPNCQYtlE8zsqA5GbTExA2wYPqv5vbgcmRr5BCoD
         g3zJqMG6bSh/FkwATMas7l11R8WUEwYor+YzXqVp9hukDUS+qMi72sG3jkieMUF7VeYx
         cQa9ssSu7omxAm8EfXVkhpLKuSRpIYqZForN7y+T9mG+slP2ib+vLK5SXTKRAOL6chHi
         +LHktGLSN2m1K7PZbwWF+LUgAp9kC+JvkEKmKXE34fjqv1U0faGgocKjKlIetkZ3GlL6
         Wk/9AwMWB6AlXoK7eUyGq6buWx502PhK+gAi3BDT7/oS5q8bKWu0UYu8CO2GmtnSMr4U
         hOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943283; x=1768548083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bATFQdgkSJQNtrjTPNUlAQXLkiJbzJjL5+F3AAAsVSE=;
        b=WS8VX0NrUJwkl2p48xzQHpg7aksprCzmjb2fO7/4Ae+aNfzyJVDeLWoipGL3dhgUDr
         FwEF4iBdbCHQ9aNjZQpZRVpdXi9c2jWZva0Ba6mJ2uDuIwcCHuBXZClm1j4lI7iW8s4U
         FeN+cgZW8ogHtjbTFUqe09y5CYpsbCYR4laL1BTpVA/NxeX2cr+TiLXFPWxncBypwjSd
         qq/PTK8QQwfIO5asgslvaoG78jCGoda2BqKyhjR23zOX7/W9cTAc3NijMqiKcfPQSPCK
         YPRVeyuU/zsgmZw4MRjcolcBf9B4aRUKGO63lG6s841upzyxftuda5PGxu8suZnHghVv
         WYcA==
X-Gm-Message-State: AOJu0Yw8yQjlQCnOXUbva84sOeFUz2S4QztF7xNk/p5IS+ryt0nFO24/
	1vEHin5QgXOrh6N4y0YXlh+w1dOLrG73FB+vSZ6a8LsSvXxa0PF9TAIibmFswB3YPHsFpOPkb4j
	BaO4QMd67leVppWaFAX30DDMA2rtz18/jjpyA1rm0plWs6j7+iNpVuBnGlTbl6V9xARp9
X-Gm-Gg: AY/fxX7KkmeXBgdS3H+FNwVatv1ho1xL0TrpClUKLyCb6eeW+lE/pjF1YG7P7IsOVlm
	BkF8FxNdigCkWrfesibAJSLhuEIOEy0UlvoB+79sxwl2MG/9uz/isQ6JowrhYrLwGSj2sl3YzuV
	2NRQCCKl1W76Qx6Hxpg/D6zy/uH2HKcPymQeh+m3N+G4zThMjLPoHoQdhB5/Sl+U2IWYPRUFQF/
	EFVqldFq2f0wPMh6WtK6xiAVLtzVzGKq5lZ728lx+shTM5H+zmqtgiHtl2iolrVE2cr5gWFsKVI
	ORM64VWt3Skj6Dl4a1vDbWkxJzuPJNtX17V1VnW/GOnBc5aU/3q9ZcesETH21V1TnpIi63EApxX
	UlEbCpOslCvSR+Ses7Et0TgZ9RFW0aSZXhfxz5O1v+nsH
X-Received: by 2002:a05:6a00:32cf:b0:7fb:e662:5c8 with SMTP id d2e1a72fcca58-81b7f6e3a8cmr8329186b3a.30.1767943283378;
        Thu, 08 Jan 2026 23:21:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnlV0I7WmCaNsCQSf5sgFNBK7QoW3YQzRGNWGVyGJy0Kc/9qDvIlm+MyH3UrATitJaDgV/Lg==
X-Received: by 2002:a05:6a00:32cf:b0:7fb:e662:5c8 with SMTP id d2e1a72fcca58-81b7f6e3a8cmr8329155b3a.30.1767943282856;
        Thu, 08 Jan 2026 23:21:22 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c85bfsm9510369b3a.30.2026.01.08.23.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:21:22 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 12:51:07 +0530
Subject: [PATCH 2/5] PCI: dwc: Add support for retaining link during host
 init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-link_retain-v1-2-7e6782230f4b@oss.qualcomm.com>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
In-Reply-To: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767943270; l=1912;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vinmZfaj1r+n5Dx0UgKPAqqqJqXxuE6TZN5VPmabgjo=;
 b=31EkDX2BCydzu3cUHMOBpwb+Vozz0SRCXZY35FhypsrEw2cStV6ElJ16tG5VtEjEcfOtRSzhF
 doiP34NClqoBN8WcG5MNDF8pK50+/PopXJJ4iwhUG+DWtH9V8MgRTna
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960ac74 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: iY9qDJksqbxG71eEh00XTAyXYFV6o2p3
X-Proofpoint-ORIG-GUID: iY9qDJksqbxG71eEh00XTAyXYFV6o2p3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MCBTYWx0ZWRfX2gXV9ZL/Z6Rm
 CyEWz6kr3Fzhs3D3gJiqaUSKiXBCUx7Bb4pmWphyqmzASP5jCdZeDB/wHYEeew8z3+76GWMpyHo
 HQ48cNlBUk+J3uw0MHfB9JTn8RnOk+4Aa4tYe6zeP/j3PUPLjtLWsTp0TBJsahtnX+LRC0nkZ1v
 1C+lXHt+EmfXuuAzCvq0sRKhYRuIOfs+3QKHBvkb2h4iaymwAuZb3KLUxXChmvhDfi3gLJta2zM
 qCECeLNc7OraX3pC3vYgK35WQ3tHRpkqiYyxM8Lh1DpVWA9G9MmpyV5fEqYzcBlxo1uXr2j1xwS
 CMqQrGPlTNYtRV9iZoqm8ESvZYvCVbitjdQgDIgE5JLNVQ0uVnA29KpIfTORSnsRoTCwQd2rfDP
 tRjyy4u/KT+dLq8KLuWMAKUv9M59rVQI+eGG9ebVhalmcTF67FKF8Y2PjnA3em5fLrTaZ7oOLgT
 dNWi3YjodXMOpIohq+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090050

Some platforms keep the PCIe link up across bootloader and kernel
handoff. In such cases, reinitializing the root complex is unnecessary
if the DWC glue drivers wants to retain the PCIe link.

Introduce a link_retain flag in struct dw_pcie_rp to indicate that
the link should be preserved. When this flag is set by DWC glue drivers,
skip dw_pcie_setup_rc() and only initialize MSI, avoiding redundant
configuration steps.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 11 ++++++++---
 drivers/pci/controller/dwc/pcie-designware.h      |  1 +
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 372207c33a857b4c98572bb1e9b61fa0080bc871..d050df3f22e9507749a8f2fedd4c24fca43fb410 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -655,9 +655,14 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		goto err_free_msi;
 
-	ret = dw_pcie_setup_rc(pp);
-	if (ret)
-		goto err_remove_edma;
+	if (!pp->link_retain) {
+		ret = dw_pcie_setup_rc(pp);
+		if (ret)
+			goto err_remove_edma;
+	} else {
+		dw_pcie_msi_init(pp);
+	}
+
 
 	if (!dw_pcie_link_up(pci)) {
 		ret = dw_pcie_start_link(pci);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 31685951a080456b8834aab2bf79a36c78f46639..8acab751b66a06e8322e027ab55dc0ecfdcf634c 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -439,6 +439,7 @@ struct dw_pcie_rp {
 	struct pci_config_window *cfg;
 	bool			ecam_enabled;
 	bool			native_ecam;
+	bool			link_retain;
 };
 
 struct dw_pcie_ep_ops {

-- 
2.34.1


