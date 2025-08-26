Return-Path: <linux-arm-msm+bounces-70884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3EB35AA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 13:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F592A17B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7604322754;
	Tue, 26 Aug 2025 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jahjgjn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD29321438
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756206200; cv=none; b=b/zhyStPbHuVLmkjbcqoJl2bdHW5A+ZesuHYw6wgFRvlAUO+94m7cVB+I9G0Upo7flMparvG5hr9w9QXlvXLhGSij2j8amjjbyu20U6B/V7cJKpZw06tkE9NrbV4ce0qqgJcEW5GSWBynCZI/oVTpRWAz+2ELW1l6qHCdooNegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756206200; c=relaxed/simple;
	bh=wjx9GMHTJv+sVXCnnpOXOAGgSyeX0KAgl8FPgsVCss8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5g/YU/4XZTFcQhDH7qUsFuVSpzZh+1evqXV9TQrUYwvX9+ak2617j/HzfQruBXMfJHYA19+D6bijTLGYoDvLS4aeM9fiaNVaW8aG1qdQEb9QYhfb4hF+nb2uKPR3SMgDZdAHZqwywuPxqz2NjPGgzCGDrL1HwDmqvRVwLc9OZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jahjgjn/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8Yc0o019757
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DPSOTrO4cYwZj0R18ru4Kcr+olXie/WQj6w6L3l2ss=; b=jahjgjn/kxh6JZTo
	n78k0lULURc8IHG/Robbj7CS9D6Ss9qepDv0yicP4w9Q1ahpv9UlZNb54wuGrtqu
	QUd0dBqXPJvHfP5MZTWZZIh6yisFRFZKXoSKQ153mLYOdPNHaM4Kfn0IMDZuOe9t
	idCvDWytRnisTRH+IhQJMG8a3IgYDmMvA9CbpCItsGw6vrtdAKsGUer210NkF/IF
	5sDZQxyL+tyN4Vu6k5OyBOeKBLER5C6KsbqO1zdA6vQeuygF9g2LZ2rfroTY/iAg
	j5SRGZIt/Q990yNdOHnxW1G+lWjEtGConyEJbv/r/WKjt0lect2qmm2rcA239SQ8
	bBFItw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5unre0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 11:03:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2465bc6da05so48378965ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 04:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756206197; x=1756810997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DPSOTrO4cYwZj0R18ru4Kcr+olXie/WQj6w6L3l2ss=;
        b=QhR7YhtgRrnh2Rk2jQViDXUBglatS19YhYTgMrzXVzHmmu6EblxP0YRiKZL5R8Jrbn
         riPoNKryf3UtRe6kikIoYujJTzG88Av0myVRIWBOAhc56MUP7g11hIkbb48jEUdwNJXf
         jhrGHknVhPZDhIbHh78P2MSf1FkorDd01yqlIJYBa9pdCvsfeqC5SZ2c2ydnaUF03bc0
         NyX/mABhvyLBhyly7Bw2O5u2bnc25mrkT+FMJWoCzRPy40ajHN+Z32uU1X08tyJeD0PL
         Ix5XaKNwbHX5PhetUL7b1TyonvtaTGhCp+UhJG7jPnNVDYLzyEgy2le8P1PwKcKepvTT
         R/QA==
X-Gm-Message-State: AOJu0YwK+qMgZlq4/7WTav5wcg7xIG+hFCqovAHZPdLSKBT8bTmQCjIl
	90mSQorl2PAVM5L3CUfQs/Z28cdNmGmXfcDDsdSQaE9sddHaTJLhlFFsB28+jK1yjERGR32X9Fk
	j9dDfz+1cVVB18HkWU6jV8zRldQ9JWct3Cmc97M1p4Lmqgh+8bRV5yFoLQFc2T0KP5mi3
X-Gm-Gg: ASbGncs3/W6hnYQ8zV9mwwRRMXWlsFbxnSe69FeKA+v5WdeL5mZx2anAGrUaSiTIaCF
	zoO9jDFZhve9eZjcUK1HwzuUQAahDBOci/ci7x4qldReIbiVh03p8pe8M2cqv4JJXE8J6tdoSIW
	w6feS7i7Yrs08UfGo75KD3rAztdLZwox24MeVTgc6JxxXyaPPTAvf648ZWbU0Zv4y5V64W7WWGw
	ke/OVFSqoqLEgIaqcx546nOr/MEqr2ljeIdh9KKE8ZYToo60Tuy7CY4fZ7xObcJ6GYa7ubISRwE
	3TCdTkhw4MU08tKPvaafnQCC/2sRFxui2roHgw0RHjFtKTz33tLdm2QqAGkmS8EPH87rHCYwyzY
	=
X-Received: by 2002:a17:902:cec2:b0:246:61e:b564 with SMTP id d9443c01a7336-2462f1d82c4mr184211965ad.61.1756206196090;
        Tue, 26 Aug 2025 04:03:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb/AZx3XW6vrNMBVNQNlwghugBEj5Jl+a3IPk5UUCn6++1jKG/5K7QzZFQ/5XN3S+gDRMYRg==
X-Received: by 2002:a17:902:cec2:b0:246:61e:b564 with SMTP id d9443c01a7336-2462f1d82c4mr184211365ad.61.1756206195528;
        Tue, 26 Aug 2025 04:03:15 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688a5e5esm93207955ad.161.2025.08.26.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 04:03:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 16:32:55 +0530
Subject: [PATCH v3 3/3] PCI: qcom: Restrict port parsing only to pci child
 nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-pakala-v3-3-721627bd5bb0@oss.qualcomm.com>
References: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
In-Reply-To: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756206175; l=1564;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=wjx9GMHTJv+sVXCnnpOXOAGgSyeX0KAgl8FPgsVCss8=;
 b=C0xBQUzGHEvIUVnt+TDkqiJDzJlJ3dBZwRdN3YqQCt7Cp8x8kuf2+DS17yh6DcNQNE0FJYI5o
 XBtet90TSDPCSMC2G8ETJoAda/ei6+0M0XJb054TozCWTN7TI3xe++D
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: O9GJ5mo0Vu6KXOBM4imP_L6pDwIgBGK5
X-Proofpoint-ORIG-GUID: O9GJ5mo0Vu6KXOBM4imP_L6pDwIgBGK5
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68ad9476 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXzzRnfIahCstA
 B5HcAsxzeCfcWvxk+iA07QLfQ7+hitc4QvFkA1XejFcWX5FWgRKl8lqSaroKP+wthLWFI1e8JDg
 xSCYwdfR+gAiE+papWCMFG9EpJyLkDHgB2cl0zfjGW8g9ecNbo2RdV6i3Tt97nTalumFvULPdUo
 nMki7URdQyUe+OCcQjSmAD7QoFrolIbf2Sbe+wnlv6NKxH/jJXRK2NNP7VoIKGva5sb1JQPI651
 R95J7tynMua0TTTYyx98BS6UpqKb1lPyR2wJdeaXvdCytleS5LxveeiwHz+ezbf2ZuTFgf21ioM
 c+PY631LeeRH64cpCTsKMOnamTJw/lH01F3W89dNWOJcR/4WBv08c3VpOaQ1NJsxFLN2zbPikSE
 cRyY719r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031

The qcom_pcie_parse_ports() function currently iterates over all available
child nodes of the PCIe controller's device tree node. This includes
unrelated nodes such as OPP (Operating Performance Points) nodes, which do
not contain the expected 'reset' and 'phy' properties. As a result, parsing
fails and the driver falls back to the legacy method of parsing the
controller node directly. However, this fallback also fails when properties
are shifted to the root port, leading to probe failure.

Fix this by restricting the parsing logic to only consider child nodes with
device_type = "pci", which is the expected and required property for PCIe
ports as defined in pci-bus-common.yaml.

Fixes: a2fbecdbbb9d ("PCI: qcom: Add support for parsing the new Root Port binding")
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..fbed7130d7475aafb0d8adf07427c3495921152f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1740,6 +1740,8 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
 	int ret = -ENOENT;
 
 	for_each_available_child_of_node_scoped(dev->of_node, of_port) {
+		if (!of_node_is_type(of_port, "pci"))
+			continue;
 		ret = qcom_pcie_parse_port(pcie, of_port);
 		if (ret)
 			goto err_port_del;

-- 
2.34.1


