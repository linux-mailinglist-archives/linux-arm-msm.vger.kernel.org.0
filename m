Return-Path: <linux-arm-msm+bounces-70797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50AB3532F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C35D241A47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 05:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801CC2EC55A;
	Tue, 26 Aug 2025 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1C7iyel"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8122EB5B5
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756185534; cv=none; b=SKXJUSA9z/eR+L/N8tu8TfzXW0HJAoIC+1ARZ+FzN7G5a2ekGlICZNbm93OqUV3DrHMK6zdj4tXBfVxVLXW/shhCa/0tnmjaOpWbWr8zeeHad7uDSAbZsQ58UWL5+u/VBDXpZgbaMHWDcqm/dU6P1hUEjPqadOXrOm7ZDPF/O9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756185534; c=relaxed/simple;
	bh=wlA+2w9i3rvfjzC5fz0O/R7zRgngreodUE1qsXoUZew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TR0Dr9fse1eZsCxVyV0F/F3dtUNJbe84NuVD4Vugr1R0YJHTiCA4xm93/v38BBYRMA2PTmT8Iu27KQgD/9FqPPDBW2dWnLje37qIclNVsPEolG+lz+Er77vi0OvjH3TCol47Fo/GX+gwGdtY6zDNMPykJNSr2Inmb/Y8/xBrmAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1C7iyel; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q4HnxO028623
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRp6cdwJoJAiTcDp3nWelrKASDmDxqau3MdAjXBSkaY=; b=R1C7iyelGJpNwWF4
	yIT3NNE5PL65EM7mgUDZMCcFa5LW9FOxpSbyxwL9YO1je2oxifYQ5PjqG+Vwi17z
	wCRo6QxuuoCuQ8HfW/U2hYR7an1Z5oqFzhR3fEl497r6DvrdHc05noPi43UyY4Ij
	R+4cNxmPys5xfecPrz6YPfwcd4XxSb1G0FfHfzryAccL9rPW5QYv0TWf5AI8H+vC
	oi6fsBbvFUTxPmqmKHQVepMERUz3w0uyyeHivMdOFVt2EfOAtwr5Ur3HE+Vjkusk
	MLJn6XMJQwXgNm90sFZr5hOdHoaoyH0wu+W84LZ7m5BH13nmc/tUuZ0RgQ54J4WV
	tku+sQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615fdrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 05:18:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581c62faso64473885ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 22:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756185530; x=1756790330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRp6cdwJoJAiTcDp3nWelrKASDmDxqau3MdAjXBSkaY=;
        b=SKLSovrO+gxtjxjfwAYSf5enHBzJvPy3WpriWu76+Gx3MmmHIBlmOK9+/nPzn+enG2
         bUr6SGV8MzTxIVDdxgMdk/uSgKAPiIDfjoDumYqccNqLYcjlmsTGgUKdX59JUV/hcR5q
         +hNZtDA1BWhv34+GFelpv1wh9WpPxlZV7NX8/vlB6T7P6djiGOh1G3OcEfpY5rQo2UKC
         oPq+drOGSBmy/TwdZdQOksf0Lnf2jVcS7grfI3ysox5A3Swj/8QWCZAdVZxQWiyzapxR
         7pPpWQp4wjJ7IZ+2oDZih2hph8paJ9RKHcFyhDqeWo8lbNSheWcYQ90h8XaVsW5aU41/
         R7tw==
X-Gm-Message-State: AOJu0YzNbOD6otEB89B7cGtO4lKFRt1wnrJoB5B0I9JxEuF4DjLH/2iD
	irrjsEKHTOW4JQtyEensKi2VgNZvafNyArgizIdHoWtLbMHViyWDIib9E0YQWTTFzMdPkh/JOce
	U3SKkkttzcgP4TU1/48nCmq1jXE5XHVDXZzElzegg+8gMt70850kqUd0ofi5GWt8puRzg
X-Gm-Gg: ASbGnctfD/nPu2G8Suv9E+K905Fq+5Ck+MJ7EBQgMR87Dk8ppbB88MUnlSjgoh/1KFG
	xU5H+2mEeXzt+gP4P1LQwXk0ddx8J6riR3EXDcF6y8+x2ict1UpJME7xn4JuvCCf0Zg52KZ4FXB
	Uhhu+b24c9e+76R50YKqcjBKj+rcaJHXHz/dCIz40Zr/tlIcCVdXj86dEpL7s0eRTLXuyOhLCaU
	e89mjrUSuzKIj+qDZX55nuG3RCbqI8jpIDfqtyduHRtLWC1CU75EelrndWbPOqbGSHTScRsnhL1
	u2fDDvxxpLXSc9R/AxqMJOzy6ofE1UUrcVttn9GgYxQGijmg8Zqjys4wCDgEBYmIwCzQKMcmSFU
	=
X-Received: by 2002:a17:902:f611:b0:246:60d4:8708 with SMTP id d9443c01a7336-24660d4883amr174590525ad.49.1756185530318;
        Mon, 25 Aug 2025 22:18:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4JdOmaJA7OmHsYMG/CkXVnmja78fd1yAOoHORZ5cWVQm1Qx961LRCZYJGnATy013N+WjhYw==
X-Received: by 2002:a17:902:f611:b0:246:60d4:8708 with SMTP id d9443c01a7336-24660d4883amr174590205ad.49.1756185529841;
        Mon, 25 Aug 2025 22:18:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466889f188sm84348085ad.146.2025.08.25.22.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 22:18:49 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 10:48:19 +0530
Subject: [PATCH v2 3/3] PCI: qcom: Restrict port parsing only to pci child
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-pakala-v2-3-74f1f60676c6@oss.qualcomm.com>
References: <20250826-pakala-v2-0-74f1f60676c6@oss.qualcomm.com>
In-Reply-To: <20250826-pakala-v2-0-74f1f60676c6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756185504; l=1205;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wlA+2w9i3rvfjzC5fz0O/R7zRgngreodUE1qsXoUZew=;
 b=UwcfXS73nNRO2s3mxdpzLdlG8KmBpuaS5B2msciN19rX7pkriIsewIyloiqjb+cZUtUFg0Qm8
 7BxFoRtAt6xACSVgIYAa6M0tFapi6WTspE4kKX4sitpOfD9WfrJ8I4y
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX5jY5jLCJtfWy
 /7g5DK9swq+6win+pVDRv5qL1lslrV+EeGRWAMAk3SN/8fHNjW5NkIMBz9LWleVSURqczMm2JXg
 xWOPaPA4xQeuhpi9iMEcTG8fSpvkKlFFUUavP96Sv3eASZifzc97JKCKOKh8GoMH1cSJ02GgfKR
 zH0r0fW9WG+jAQoJUJoT38+21p2GqQtdlLl4crT5oMrOF+g9V0OmuyaxSbkrgQ6/deV7hJxcm3t
 6BlqhpbLxVo4H+c6NtC12mGv+28r6xoORoZEjRatL3Kenwm6FU4mKfWrGkWU1zesj0ig0DooKfm
 xiyhrUbcWVqIGFDJBi49wXHdHjifUbRWHY2YwNKLIg9JQHBjihja2cupw8+4MsAwDHHIRzbK+ON
 n3wVjFIs
X-Proofpoint-GUID: EJqxz57b-COV4EQ3KIUb_kN7Qn4D8NhF
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ad43bb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: EJqxz57b-COV4EQ3KIUb_kN7Qn4D8NhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034

The qcom_pcie_parse_ports() function currently iterates over all available
child nodes of the PCIe controller's device tree node. This can lead to
attempts to parse unrelated nodes like OPP nodes, resulting in unnecessary
errors or misconfiguration.

Restrict the parsing logic to only consider child nodes named "pcie" or
"pci", which are the expected node names for PCIe ports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..5dbdb69fbdd1b9b78a3ebba3cd50d78168f2d595 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1740,6 +1740,8 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	int ret = -ENOENT;
 
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
+		if (!(of_node_name_eq(of_port, "pcie") || of_node_name_eq(of_port, "pci")))
+			continue;
 		ret = qcom_pcie_parse_port(pcie, of_port);
 		if (ret)
 			goto err_port_del;

-- 
2.34.1


