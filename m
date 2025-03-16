Return-Path: <linux-arm-msm+bounces-51545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221BA633C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 05:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD1B31893548
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 04:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04E5188A0C;
	Sun, 16 Mar 2025 04:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbwKHVkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0818785D
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742098173; cv=none; b=AHHOby5/tz8cidiRb3HLfHiQzXKeBsJZpBxGHdkc3oMJ877NxfnZcP2cMloDChe5mWjCVApjUroRkprPbguJWNsFbnyidJFmydeFl8msZrgOQc3pPabgzEhaNnNq/pwpy+P8KQCcGjETJmOrhDNVUgpBQeGr4xSLuKPoO98XCDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742098173; c=relaxed/simple;
	bh=vAL22FsrdmpzZDSOTzsqtv09wm/NpEqSyY/He8Q3rWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fJH4MU2NO+M5BK9MeR2h5GhrK2dHQ7LrNRHzO0Nf7a8jGsgd1Mm1o0Za0fsIs9xPGzQctH1uRKlqgyt5fNqOrKxBmal3OqJoSy/Fp/MIGBOYFFQiWLBe+rK56pvAgtJvXq2JadPpvtYSj5evCH8LFgW+r37Lz5HlQxg1DKKEe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbwKHVkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52G2klKi014173
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RTARSqVulqseS/hBvUMMQSRM65+7IsS9eYK8VLj5/5A=; b=dbwKHVkd39G0qWOg
	mHU31GZOBsWAahz5iu38SwXwZbcqo1Z78Hrv84I4h2P3JqxJXTAdoaQ+/yoETH6K
	zeE98bNpTCcz38NWPa74vRosdB6UirprkoETqZhpGfBhPAh7gDZIz1uY34ozJABw
	X5WS5WUtGNXEO0S4oIliMRY+Hpqs/XJt8uk7wktc2IyRojUgf5O8AX3V74Xgl2B9
	vvmCPn82Zu07seFiyH9ANmte0xVzmxUGEkQcB6GNqijMIauitDocO6sybOuDQ1US
	fMCxr/vfdRNlH5dxBh4o8gaNW3jfiG3rME3NHGkvHhNx/NNE0/BCH7Xiv4j12ce+
	qkSZ5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1s3snna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 04:09:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff82dd6de0so1232304a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Mar 2025 21:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742098171; x=1742702971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTARSqVulqseS/hBvUMMQSRM65+7IsS9eYK8VLj5/5A=;
        b=rna3JbWwZGccto5sUgXZzmyGKLNDNUycbMGa+mMGqVzk7Fs+nsAy3th0S7w88snLqX
         Mk+utyyl7DHQmijrPLc/HYeN0rxv8Cj5IR1peKj7Kf1CvAF7QjN/W65pbyALDFkd1H4C
         5n/jP6zcwcUKj5ST1noJOEj8Xrb74pZ03BgXFEOzV819P/N/2Z1ISrZZNCje74wE25UQ
         Rgqcwo661t2ftgjqCyBKKV3O5sL+UdAy4Bo1m5jS2VUOZzRgdXn1s4e7vMG6ZOwkx+A7
         AWGy3cUGqZCxUhEPVGudSXyO35bBUBi/6ffLhvwzIsLToJAmyVflHz2QXLG9D/HTr4kG
         +NPA==
X-Gm-Message-State: AOJu0YxI80q4sUt9DK1oEQyctsaRTMwwDdI96DNDMQeVv93HhwspM1l1
	fwDDIPWUBJjVW/VVVUsCJXwBfK905R03p0Tw32F4R/qT+xP49MeFRm2z5WzMz1bDv9YLxYuGXKb
	JMcJG2cUv1WlX3P9dStN2IKSf8K+0tvo3ircHDzRR3cZnjDPRG3o4m7qA0hBkx6Z9A0DrZHnG
X-Gm-Gg: ASbGncvaTOcVNKzYhNP2HJNishRC6XepOS3ytShA9hu3bpolK7f3x2Ktx/6Ho3tWEu7
	wTFnby0GqZFnJ5PSLmb7YxAvuY3juqEELDbpcI3lmEhCoWPQRNAO+w0Q8QXuHhOmwsxhzI7bXYJ
	3eGTEun8OUl4vJDZhecDyf4PAMDGqUmFUoDIM3SpA5+HfXcXFnSHrCZTK7xvtsQa1wyTzso4xMl
	9KQ3S4NankXzAVlwzGWMkCAWBGiUMSqSsdtjXipekIiBisxlHDgtL38arO+BPXo8PSdenOE3ZVj
	SDORBeOqA9gGK+NJWBnCHjmOw20gaBAmEY0kCc3LnsT66qIrQIE=
X-Received: by 2002:a17:90b:5143:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-30151d03d08mr11205608a91.18.1742098170759;
        Sat, 15 Mar 2025 21:09:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz3+v7IiV5+3h8ypqZ8mTRGjTBVXic61hpA9zS0rNMDjVKafG9HFgpoWDDAv6/CojeGl1iPA==
X-Received: by 2002:a17:90b:5143:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-30151d03d08mr11205579a91.18.1742098170384;
        Sat, 15 Mar 2025 21:09:30 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153bc301esm3490438a91.49.2025.03.15.21.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 21:09:29 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 16 Mar 2025 09:39:03 +0530
Subject: [PATCH v8 3/4] PCI: dwc: Update pci->num_lanes to maximum
 supported link width
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-preset_v6-v8-3-0703a78cb355@oss.qualcomm.com>
References: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
In-Reply-To: <20250316-preset_v6-v8-0-0703a78cb355@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742098148; l=2659;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=vAL22FsrdmpzZDSOTzsqtv09wm/NpEqSyY/He8Q3rWo=;
 b=XkTqW+wbQkb014bseIYknxzoA8wxSZeIvxT06zSlEzmJYkckrvlhzr1tfNL/Op9BMYpBdKf1b
 NqxGAKxg22JBFuqt3wPQWSTUx3sfCHlNXshA1lA5Qjzm6MSM5XfPt+e
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=WbQMa1hX c=1 sm=1 tr=0 ts=67d64efb cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0WjgDMoWzfVhrCrGWTkJm60ZNB04IbKJ
X-Proofpoint-ORIG-GUID: 0WjgDMoWzfVhrCrGWTkJm60ZNB04IbKJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-16_01,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503160029

If the num-lanes property is not present in the devicetree update the
pci->num_lanes with the hardware supported maximum link width using
the newly introduced dw_pcie_link_get_max_link_width() API.

Introduce dw_pcie_link_get_max_link_width() to get the maximum lane
width the hardware supports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 3 +++
 drivers/pci/controller/dwc/pcie-designware.c      | 8 ++++++++
 drivers/pci/controller/dwc/pcie-designware.h      | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ffaded8f2df7..dd56cc02f4ef 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -504,6 +504,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 
 	dw_pcie_iatu_detect(pci);
 
+	if (pci->num_lanes < 1)
+		pci->num_lanes = dw_pcie_link_get_max_link_width(pci);
+
 	/*
 	 * Allocate the resource for MSG TLP before programming the iATU
 	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 145e7f579072..f39e6f5732a9 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -737,6 +737,14 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 
 }
 
+int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
+{
+	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
+
+	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
+}
+
 static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
 {
 	u32 lnkcap, lwsc, plc;
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..61d1fb6b437b 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -488,6 +488,7 @@ void dw_pcie_write_dbi2(struct dw_pcie *pci, u32 reg, size_t size, u32 val);
 int dw_pcie_link_up(struct dw_pcie *pci);
 void dw_pcie_upconfig_setup(struct dw_pcie *pci);
 int dw_pcie_wait_for_link(struct dw_pcie *pci);
+int dw_pcie_link_get_max_link_width(struct dw_pcie *pci);
 int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 			      const struct dw_pcie_ob_atu_cfg *atu);
 int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int type,

-- 
2.34.1


