Return-Path: <linux-arm-msm+bounces-50729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5E7A580CE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 06:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98EEB16C127
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 05:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C894189F3B;
	Sun,  9 Mar 2025 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DE73tUri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E84B1552FD
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Mar 2025 05:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741499193; cv=none; b=PdFAW6XkoaU3DsU+jtKOjSv8Yw4uxYXkY2ShrSBKBmnjZeUYLa3wRYzZ+CB/egnsUwKSti6He/D4hVzbenhIcBHKJZU6/4YwLFmmDEYpPUPXi6h44X7mb/Ycu5h+BsK7YkD20zimsutkfsrlOBDpGhCvRINw52hUqIEe9ayZaTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741499193; c=relaxed/simple;
	bh=wsREze9ZB4TFdyowJtOMq8dXoF2NzkSuE4x5ZRpejYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbFCs3RUFuzsDUloGnjyrDCWN4M4jrTasE8b613Xgk2NJ3YoTc5t/CxAWABvORCWPzO2ziP0bB8cvCLyurc9IFl0CCnilyGN93OOxgfam8oiEYyC68QcTLoMgylKH/xvk//3y+pGQ+rtcqftDzIjQzRUKLb9YMenKEQ1YGGvIyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DE73tUri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5290tgfE020983
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Mar 2025 05:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3EfkY4Hv452ybIcZQDu1ZsQhrhBGarKIBNj23RcC4To=; b=DE73tUriRr7ieO+e
	0LOTqB5TJiLyk9/UKDDnNJW3hKcXiA5T2AgjRJOj/gtQLeIwA/D9UVb42fHRz5dW
	FY18BhoAzbd4a9i9eELK+4H4nMsaMBE3hKGDBYnyNHcoge0uvOZwZNOz6tj1iCWJ
	ZCAYWWvwfehLclpTzj15+KebIrr1GEpK7xWs6Wjrv5JWNeFXR3L3uKP5tGf87rQ5
	n8jLOKzAr/U3lBpMAubhlcaWnqtch9NRJGjF+6bYciIs/OD2mGJR9w+goYUZTtcw
	/DSttw+Z0N7tKO8tOCH5nBAKPUh8TvehS6wa4R9bzHmiXkW8z7d6eE4oeg2NNPWq
	TQZuJg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f1jsp9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Mar 2025 05:46:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242f3fd213so27461625ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 21:46:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741499189; x=1742103989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EfkY4Hv452ybIcZQDu1ZsQhrhBGarKIBNj23RcC4To=;
        b=aqh2r8IYOsnCWj0nLoor8JGyY5XaumJ5pLtoQRTSK5XSePF2jPnjouuk2xIVz60Svw
         +rPP0T9qUxZL1kCQsVSIEXvWTN3oIyGiJQddPN8jPdaOgbRmB9kOEks1k/YuN1JIVnWC
         GMSfyynrpetpa3nHH513YU8wvWysA/zKfPtRM4U/yd3WWdv5bsV7EWkfx1skMS1+f7oF
         ord0BokK7FymwTz7g/aRrTOKRKnzeh7rJ+faA8rXLqQnm+9oKs7P3HSUziIp1lmYVWSf
         vHoGlEAUl3FX/9aJ/48YseUmc9oS/woPCbDg039ZpBFfdqAX8rkyMgxnhqlBeE+DmGFx
         YuNg==
X-Gm-Message-State: AOJu0YwhLg+VEgpWbzJ1HhS+tjxyLbfA2k5h7cHHgWAo6KSX2NKlLvWE
	+er3t9dPMgbfATmZbq7S/perQ1r1O9KSJ6mmIE+/xdpVPAdvHcOOtrinzA+R4ZMC5jmFltRHrQe
	tbk9jMTpNAf+VZQTyMISjMkKxRk7ML5tsxrSxNM8/3bLan3pVUi2LB2KndpJmlNa4Rmaa7HXN
X-Gm-Gg: ASbGncuFUystwXGxbfq/5QhcZSCAB3sYinPOGeEZDqd6IOPCFZyRbAIdTd0ysidBzpq
	OKkgozvbPbPZ30qCPYIwQMH0XW6u/vzgbfsdppV/0UJ4qonrxphmPVS9hyC4bHqS1X0lKsT+qJl
	5eBxRpQF3rszjDLgY8O7uVGCNUCZ6Xm9s2fccNjZIwOzsE2qwjxdrG/ZI3vNv47K3EsuHdvwm6h
	vHEZ+BiT6RmrEUnBwKxHW6SO4PF8gZjXmBAw917KnvJm8dQhlo+/IE2RN3CIFlMsb6Qz52K/h20
	2EUZEfDIVjGqYGqi2uk5LJyVM8gfXKZuVccdjIQiZK6lwi8H8pc=
X-Received: by 2002:a17:902:ef48:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22428a8d1damr159377705ad.21.1741499188767;
        Sat, 08 Mar 2025 21:46:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtcdtKDb+nmzTQePtl4xsTUPi4gRGltswejf9cFXfLAFAd/iJir52Hd6AeQw6W6iDiwcL4YQ==
X-Received: by 2002:a17:902:ef48:b0:223:4e54:d2c8 with SMTP id d9443c01a7336-22428a8d1damr159377425ad.21.1741499188425;
        Sat, 08 Mar 2025 21:46:28 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddbe7sm54887145ad.32.2025.03.08.21.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 21:46:28 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 09 Mar 2025 11:15:26 +0530
Subject: [PATCH v5 4/7] PCI: dwc: Add support for ELBI resource mapping
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-ecam_v4-v5-4-8eff4b59790d@oss.qualcomm.com>
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
In-Reply-To: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
To: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741499159; l=1733;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wsREze9ZB4TFdyowJtOMq8dXoF2NzkSuE4x5ZRpejYQ=;
 b=3crrTkeeu1lFVP3OJpn9vRcbyNPD+fSlBlxCr4aL6Y2A/R7na9mB0h3h1kD+h5ws1pvISIKPL
 UNzx3N5eygBBUkBGfbMjBG0MBfXMZ67rKTYQ2f080kHpXbyfhO8X/XU
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=ctthk04i c=1 sm=1 tr=0 ts=67cd2b36 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: OVZU0lBzfLKbm5CvUTotzJggG_TcJeCb
X-Proofpoint-GUID: OVZU0lBzfLKbm5CvUTotzJggG_TcJeCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503090043

External Local Bus Interface(ELBI) registers are optional registers in
dwc which has vendor specific registers.

As these are part of dwc add the mapping support in dwc itself.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 9 +++++++++
 drivers/pci/controller/dwc/pcie-designware.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 145e7f579072..874fd31a6079 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -157,6 +157,15 @@ int dw_pcie_get_resources(struct dw_pcie *pci)
 		}
 	}
 
+	if (!pci->elbi_base) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "elbi");
+		if (res) {
+			pci->elbi_base = devm_ioremap_resource(pci->dev, res);
+			if (IS_ERR(pci->elbi_base))
+				return PTR_ERR(pci->elbi_base);
+		}
+	}
+
 	/* LLDD is supposed to manually switch the clocks and resets state */
 	if (dw_pcie_cap_is(pci, REQ_RES)) {
 		ret = dw_pcie_get_clocks(pci);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..3248318d3edd 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -443,6 +443,7 @@ struct dw_pcie {
 	resource_size_t		dbi_phys_addr;
 	void __iomem		*dbi_base2;
 	void __iomem		*atu_base;
+	void __iomem		*elbi_base;
 	resource_size_t		atu_phys_addr;
 	size_t			atu_size;
 	u32			num_ib_windows;

-- 
2.34.1


