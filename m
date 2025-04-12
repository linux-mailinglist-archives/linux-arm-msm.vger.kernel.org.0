Return-Path: <linux-arm-msm+bounces-54088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C205A86A3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 03:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC3E8C5C4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 01:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C50318C903;
	Sat, 12 Apr 2025 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZkk7pN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE6189F39
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744422655; cv=none; b=gl1YfM2ur6U8S0gFTkqN4T3FhbFt5N4+VKPVw30sJvoXZNmQXPCJ55cN0kZx5/QtXH75eprYCXv6atPIjW8/4ablAb7ucCAXvMXIveTFL7Hx2WC/i0JTs2CeO9XmSzx2slBrKlYz5QHlG6SNeOTBNJpnbn7VHwqF0JnnyCV7srM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744422655; c=relaxed/simple;
	bh=kCAWt0BML5WV1SVIGZYgFbzaKmu2Qzj+fUlzFOOF8M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ph9+oKS+Dsy7I7XfYVSmHb1p/ztIQB9ZxFmU749eBuutI53GS73kUPE5rCZIgLfT10Dc64JlBtpoYkw8CJXpKeKzd/XXv4JfBAXotwJ+/ELJzfMPAxuMa3UvfgwKUsSVjL78Hvtdijy45v0Df6JsASH6LIaMvbLRWF5QjShzZZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZkk7pN9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C01TFi026855
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	glgoRiyhxfL/Te3esQieLchBRxrL4qfaUkWRNwVRA10=; b=FZkk7pN93BW3EIgm
	37mg24I3RKY/aSvBEwzSAbbx96OPgJ0dlbM9faIbLKwdlqr39KXpWp34tdtl0S/q
	iQjArEGH65vZ5J7W1x0HBiNCO9C0nt/ARa+WfJDgdmN/hMB/2S46oniDyKoPupBB
	vc52mSQt4SHfLcipXPF3OPZ4FWVXkQ5mpZ005ceuGRo9diOcYm4a8MpHsaY+3eio
	HTnfixA7Vxlpvo5mY5iT4D3BJZa7ipZNQGopAkCVxV+WrSt3P+hTMh5+d/jRWEao
	1OLmSi6wKNpVxZkljnlXm7t9CLmcp5qpopFpzjQoNBCDL9oRTRte/sTR2Vdr88X/
	qwq+kw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkuutu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Apr 2025 01:50:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736c135f695so1807779b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 18:50:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744422642; x=1745027442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glgoRiyhxfL/Te3esQieLchBRxrL4qfaUkWRNwVRA10=;
        b=nysWuNozoxQ69eNPzwCHfJzpCbYaup+iygibMaR0icBe+aKvNvRbDIWLxTojSDG4bT
         mcbrbO+HmSgRBvXGRkqDYW6PP62NWrz1yvqcMfp+vXt+3bV09JseVzGEywHVJi8wd2Ed
         Rm+atAHrQKfOwkOwao9A6XBjmiw4vb01kXHqGh6+eIFapvZg8bNWkxej3dRWX0uLDTzZ
         8vStsDUwCLoml7V1GJpexEQCqQhYpNOsqoXG0RrEDiHj+WbY69qzgGWm6PMgTuDhBN2K
         Ky005hMZX0XgoSj0HRSQMXgmlsob/qsdFszVW4tUXNPynofvFtmm19hwc/VB1HOlfEGv
         QoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlduFhv9htII11b8kEltVRuxcnHbxXWpv1nZA/uBTgvqd/dbc8iIqMhqnlVB6/1o21DxwtA/aPnYzS2JnW@vger.kernel.org
X-Gm-Message-State: AOJu0YzQIjO33Z0Qp8zdzKIS6S3srz5jKxgvTdXaa1bNjsOKQmCoj8/m
	QVPr0fgUvUfVw6affoufr7XvrVrqyux+BnDWCIcAyeEUnaAReP79SJH/ef7/IyL8ojVxA+K/sBU
	6EraLesKn7WcyqF3RCIpJJkSBaDpbxoxNiRUcErwqto197tot9tytaEvnSOKizLp/
X-Gm-Gg: ASbGncuPDpbMZiSOXkETue2g/zp4B5RWUHLcgvRy3uoX/8Dh6GxmpEu98jP4haUwSKk
	a93rATNnjxV1U7dsDNmnN/+o5Kff7lJfCs+tS+ER9TZwmnK5DJV9znLyG5pvEcEr3p2YMtdAjA3
	AcYwF4+xkzZjecrVKWYpogzaL8kxE6mdxNBIhvVlWVgf2KD0Oo1MoAWjQXS/LsTtBoKMnsQeO92
	8olE2jbkwv+UtuJMLWeOcRjyiEwFr6BZHD+ZuzjE2OPld+ZC86GnbyPz6vn8/i4eOcjD3xgE17n
	y7EhSUXSjQ94FfSbPrZpLHkrqWSUx/tRC6/E0m7EEI8T6Lk=
X-Received: by 2002:a05:6a20:d48c:b0:1f3:397d:86f1 with SMTP id adf61e73a8af0-201797a30bbmr7051254637.16.1744422642220;
        Fri, 11 Apr 2025 18:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzJLmehtyGqwCwy4UtxG9p6ZLMjrO+dqexw4oYkH8h2BtyHuukt/AlHGG0NKBbbxBgfg3hTQ==
X-Received: by 2002:a05:6a20:d48c:b0:1f3:397d:86f1 with SMTP id adf61e73a8af0-201797a30bbmr7051219637.16.1744422641747;
        Fri, 11 Apr 2025 18:50:41 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221832sm5516825a12.70.2025.04.11.18.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:50:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 07:19:54 +0530
Subject: [PATCH v5 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250412-qps615_v4_1-v5-5-5b6a06132fec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744422605; l=1453;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=kCAWt0BML5WV1SVIGZYgFbzaKmu2Qzj+fUlzFOOF8M8=;
 b=/+uFXCTf1bqF5t6g/+9yhijvRHjpSMx1KHn4h1Hyg+gKRxf6WiynmaXFgOw4lt68wVeracKnT
 F8+++3bUJvKCoASKv6Opu7cM/nrJ4KF+DzDmGGCMBoj2NCcgWjcWd4G
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: -L9QnAV4u0G3cOvvRJzsRVWYHUytbl_K
X-Proofpoint-ORIG-GUID: -L9QnAV4u0G3cOvvRJzsRVWYHUytbl_K
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f9c6fb cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=4bBsNf6MAaYI6lVPmewA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=825 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120012

Implement stop_link() and  start_link() function op for dwc drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ecc33f6789e32cd022a5e5fb487bdec5d7759880..0af734f269a342127132540514b68a8487c5b867 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -720,10 +720,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_op_start_link(struct pci_bus *bus)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_host_start_link(pci);
+}
+
+static void dw_pcie_op_stop_link(struct pci_bus *bus)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	dw_pcie_host_stop_link(pci);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.start_link = dw_pcie_op_start_link,
+	.stop_link = dw_pcie_op_stop_link,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)

-- 
2.34.1


