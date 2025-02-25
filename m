Return-Path: <linux-arm-msm+bounces-49242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A7A439C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63AA3189E1EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 09:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B62D26561F;
	Tue, 25 Feb 2025 09:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYsKrDz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31C2627F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740476097; cv=none; b=U14Etj8to+u3U0YQzzlbvFvX4rUTaXTs0Z4LGnOys+r97u9HTDhMzrnepSIhjwRrxf6nqpB62UCxe2rjah4sCL3TAOQIiGOZ3YZho+imWkSvoyGroTln0PhsAjPyBVRkPk1pfpGxaT2QoO/WdOX/Ye2StrQGwPxqDTTdnygN7jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740476097; c=relaxed/simple;
	bh=w3BQV4GEVn3y93ZdP3UnB+XSKP+XiwrUWY/Bml6uy9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELdLi2zmzO7WrRHJ3f+8kMMRYhNzqnfglUcyT/8jCgcIrNZNNKhDTkYcYc6D2bbkDm3YI7t8MTjPeG1fBsZDRCDNCARPXLNDL2sdoK2gL6hyHpnoF7hsB3jt6msFTAP3J4HQ+Rr7j7S6Eh9RGkGbEWOT3clgIVSPq3juJKwysqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYsKrDz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8e1bc009176
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfVBAnMbd2bkW2PD02FjVQrfyFMHr5hxwFL2Mh9QfHQ=; b=MYsKrDz4OVpmk2U5
	5tpxkw4/ypzQVD1NZfHTdvcovmqjxNPo49Z+z3XBPVj9tV/eFMUuawnXNSDC4Rwe
	qsGVx3xP22vetpyhA3ClGAtLOJVmPyGE2A8mu+FW5zyy4HlqMirIvg8XCm+SFdNc
	9GtRlUd+dCPVaLMz+jLQpBhTbjkH2o6c2uv36XU4voLgw7UK2b9liGqZzwCUqmfz
	lEEOmFeUUa6fYA8iNnws8QETI0VfP0bFjouxwPvd1PsCJ1M5vjt95hCviaaknriN
	DqGIQkcYoDRCG/kF0yhBdlaSjuibhoQM+8Y65SjnXSmI8FHeC1jcZPPfhw8w6Xww
	vIYyLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6rb0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:34:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc4fc93262so11819306a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:34:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740476093; x=1741080893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfVBAnMbd2bkW2PD02FjVQrfyFMHr5hxwFL2Mh9QfHQ=;
        b=HAvVAmUMKSYdmXF7tC6NUMCnKx6SMpWFV1pqgrClDRTC/Rnr8A9Y8UlXwNCufNCAZ4
         rBB8mv+9gmD0rQmiBlvilV+2kRdF6jC1vyF0+YrPWb/1WjJwhA/t83tf1HkpZNibRMcQ
         6+Q1zh5CXmrwNfDX81LSHFFI247xeBvpA8dhv5n5b4DECbXvB88MxCDOwYoDc8KAa7Rm
         1wPcwvtf2e0ycvMptMTjvdRi5kKEo1ICYSxtRAzqzHzZ0VMDu5ORdwF3u7EofvtU2LpV
         /X7yGPRV8lCuLUYpzhEO2VNJGDgBQ/5QolUDjv4dTF+OrYHhBxiU8EryuA+lZC5dMhJ0
         RiBw==
X-Forwarded-Encrypted: i=1; AJvYcCX1W2EPUdS/NJFt0/H2pUZYc+8gOqElrskMjZfv+5R++7oL1XCwSToLexR+lNKUBVhWzc6b5tmxfLsXCpG6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxee4hzem11BApeG3V6M8ccX3ljFFywc4vwci3rxM6oIo/k7Qm
	nJmH+hdzFfxT/N2xw5s8QAaMcfpfGGCtnfiaL+fgQ3adGK+TSokQ7S0vE0vL44u8ehYH2eh2IDE
	gB120zsjtQoa/AK0iNROcyNxJqzmqYiQvbz39JVbV1H/0KwY+U3SGk/SGTq2+eTd3
X-Gm-Gg: ASbGncv3/PUEusB4fa/tDYXcJJee3DHCCfcTYzhUgLkiy0m0vax0fzIjptYgIHgyIIQ
	9wGfkxxLdTy8IKdvQtA8MMa6UDY0GDu83qGe5OHSUPxXHQTIK/ncTBgMpmW1wJQ3x/RAgY9KMkp
	2oxaCi1+UX+b1BMOJn97Z4hI/NzFIb8E5Pq/JZ0NJ+bexxzxgDc8wyS0plAAjNMGHxCBoxc02kF
	WWmrroLcyZc0caBf2PBAUzKDoVFGC58LpYKEhugYTeeqmXDTiXsrhQNhb3w6UERfn+Icvj9EObL
	M3QSzgepL3JJacs4H6HB2f/R7AU+W9qpsl4SmrJKQu8ycvd2Ag8=
X-Received: by 2002:a17:90b:2b8f:b0:2ee:ab04:1037 with SMTP id 98e67ed59e1d1-2fce78abacemr31839441a91.17.1740476093307;
        Tue, 25 Feb 2025 01:34:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfkUK8utPlxTxnPZ9mggiWDUCDDRGxOZv53sroMbh4/7yD0hJFXv+8HK7v+WABBzkzfhkZJQ==
X-Received: by 2002:a17:90b:2b8f:b0:2ee:ab04:1037 with SMTP id 98e67ed59e1d1-2fce78abacemr31839414a91.17.1740476092989;
        Tue, 25 Feb 2025 01:34:52 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3dec52sm1080770a91.20.2025.02.25.01.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:34:52 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 15:04:01 +0530
Subject: [PATCH v4 04/10] PCI: dwc: Add host_start_link() &
 host_start_link() hooks for dwc glue drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-qps615_v4_1-v4-4-e08633a7bdf8@oss.qualcomm.com>
References: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
In-Reply-To: <20250225-qps615_v4_1-v4-0-e08633a7bdf8@oss.qualcomm.com>
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
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, dmitry.baryshkov@linaro.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740476062; l=1526;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=w3BQV4GEVn3y93ZdP3UnB+XSKP+XiwrUWY/Bml6uy9g=;
 b=Ecnyx+01R7Ol61lB0SnLfgUmwTIIXPUGq+dcGYlCeRzL3eRvLpFInkEy3FC8hwma9M91qp/zo
 Ki3CTxY7zvgBrv57Lq970TQORFWxzP/T98htd0+Z+SOm8rMp5igpFGq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: uv_X3N2M_VtGAJZkfbg-L9-ZOW67Y6sU
X-Proofpoint-GUID: uv_X3N2M_VtGAJZkfbg-L9-ZOW67Y6sU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=720 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250066

Add host_start_link() and host_stop_link() functions to dwc glue drivers to
register with start_link() and stop_link() of pci ops, allowing for better
control over the link initialization and shutdown process.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 501d9ddfea16..47f34dd12c39 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -435,6 +435,8 @@ struct dw_pcie_ops {
 	enum dw_pcie_ltssm (*get_ltssm)(struct dw_pcie *pcie);
 	int	(*start_link)(struct dw_pcie *pcie);
 	void	(*stop_link)(struct dw_pcie *pcie);
+	int	(*host_start_link)(struct dw_pcie *pcie);
+	void	(*host_stop_link)(struct dw_pcie *pcie);
 };
 
 struct dw_pcie {
@@ -664,6 +666,20 @@ static inline void dw_pcie_stop_link(struct dw_pcie *pci)
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


