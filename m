Return-Path: <linux-arm-msm+bounces-69656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D8FB2B8C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 07:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CAA67B4971
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5366F3112B0;
	Tue, 19 Aug 2025 05:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpoFfe4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA79F3112D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755581724; cv=none; b=f49gy3sGYlGWOBcDUUfvbfhDKNZbq1vu2KNozEgWL8Q7L+JiAL7k/aMBKaJXedoEo1xAIiPQuATJ4/FqfvckKNVdfBNkbbbtYJ+Mph64jHHfMckatxV+3MzclsL1dlCVpFnCnAGgWWNcrAgEHMUZUdbJ5mqtF2f9bCTJqkW7HHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755581724; c=relaxed/simple;
	bh=zNNsKODeITIq9p5C4zPwt5vGWZ3TBF1so1nIBED9rGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEn60KhK52du/HZLPqcoxNuHS9ZSeCMA+PR5k5h9aY+xTeayXjXlDFv3dcuO37u44R3FBR6RgRkKaD1EhewbebVwuCBy+dmWvo2NTtgy9utPrpGH0HTKY3zCojkWieGkmELo00CnM1HJjjcRxcwXlD2Nk8jSKCm3ZafVG8G6c0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpoFfe4U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J2V5Vx010740
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E2kyA8hwKaH90uvk2Xmr6w2kxbT4ZU7HruVvyuzREbE=; b=gpoFfe4UFOaDA9bU
	r9jDeKQzo0SMU99M0zQJ151VvKu4U7McC6qE51lNUIFuvbYxMnj2/prmj4NZq1+y
	cqQvxoDxsiPgGjrKGOU1T+eoCJt6PC00vnkvvtK3M7PD3WHy9ZxZLoK4OP6AGeZw
	emT9WmHmHG+8oQQfAmEsTDlkW7qIpsvZ6G1U+AQxYquH6hXxx/NzJ6KUeFjqG1xN
	SBmKDFBsHHwIEe8L4fh/M3gRtH6qkh+W18WoQzt6Cm9tkFeB90Fqixvr5bubneHk
	8Yr6QAV7UkJXK5bgNHEoH9jODoYV9h40iOGmknvuzESgi+rI7rsRmvTkcTQvTfAT
	xuZhCg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh077ba0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 05:35:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244570600a1so58835015ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 22:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581712; x=1756186512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2kyA8hwKaH90uvk2Xmr6w2kxbT4ZU7HruVvyuzREbE=;
        b=u3W6WWEURduIRQBDRKQR/z3jYBXv45MmMbcozPShxey+XK++md5Nw9b5ONOmx6I+Vu
         gbpFPChv7T4ZVKpfyN+h4IESPLUCI2ZFyxnemoTAd9Ylxjh2IQR6/PvHBRMhXmRHICjN
         X7cAMNXxXYWqJOAkkLL1+T5jC0yI/bJLBY0J5YPGZMCtEoUvEPyjVTTIRvq7wjMvtzl0
         40P25boILIvXd7gd46Hsjn+pFW+WRdnKc09gpzJ5iIRDv2rmIjkHP9UxG5WbW3VuEsQx
         qLilnjb0SFJkpd4LOgbmzuPITSJoE8K3G8fTcIsXEZqPXlgsu0auYYVMjgwlkuh1kxwm
         rOKA==
X-Forwarded-Encrypted: i=1; AJvYcCWqELpWh434Tp/4ZtHStWtg2OA12CYG83G1u6irEG1JDKCnzawdSc5PQVqg0LE4rfSD8gdEOBkFRyXuB1z+@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ+gvmBalix9WEPKzMIKHCEpqoswJFisPawWV1Uko003hPzN89
	BYaNosf8/W5nOfgvX17FsraTjefHZRG5wPg3UAiX/PM+VDOHT9zuTpThU9G4EkMWOJGgNjsJ/GC
	rfLTkbfCT6pGBe2rnyBknCkn7UO4g2PVbmmQvnW894rYieI8O/ifyAwjVXvT5juLYQNBz
X-Gm-Gg: ASbGnctTvpDwub6jjqXVGV1WiNx+b2r+qIuVA6HksoNuADxLQeLiF04nMQzQiD9kuGi
	jvIRCtC9x+DZx3OzpZ5pucla4xCbHW0tIGgraTxQdivcMiu9GJl1TYuqeXeq/T3yejpMI5Nz6CY
	QFKvQrmTNpEfBt4UvrdxFKxGFb34TpwaMDG6dfyz4WzlO4BCoRJ1IiifYqnTmR5XANa/JRsKLrZ
	70ZnOUPUEe38mHWQVvFifK43cpYxLZO6v3YXOw5veApMYjLBvLuTAic/7EEKmRgETJfMmypZOOG
	qmG8A7ou6Jz451PFVuBtSBZc8ralZ+ADcpeqXExAu8GnFli9trz/7eI2klxgnTVmRYYWW+60CtI
	=
X-Received: by 2002:a17:902:fb0b:b0:240:8381:45b9 with SMTP id d9443c01a7336-245e0e7e446mr10287345ad.8.1755581712172;
        Mon, 18 Aug 2025 22:35:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlQWzbteHJo76hpEH20uaQnkd1jnlahQtMpjZ67WAow1lhts+lyKQezKrKBUYJNQS0+C1iDw==
X-Received: by 2002:a17:902:fb0b:b0:240:8381:45b9 with SMTP id d9443c01a7336-245e0e7e446mr10286985ad.8.1755581711630;
        Mon, 18 Aug 2025 22:35:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f710sm97004785ad.86.2025.08.18.22.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:35:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 11:04:44 +0530
Subject: [PATCH v3 3/3] PCI: qcom: Use frequency and level based OPP lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-opp_pcie-v3-3-f8bd7e05ce41@oss.qualcomm.com>
References: <20250819-opp_pcie-v3-0-f8bd7e05ce41@oss.qualcomm.com>
In-Reply-To: <20250819-opp_pcie-v3-0-f8bd7e05ce41@oss.qualcomm.com>
To: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755581690; l=1508;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zNNsKODeITIq9p5C4zPwt5vGWZ3TBF1so1nIBED9rGw=;
 b=eMVsS4IDFU8hFcD2F6t7VUAbSugqg0W2QV7+j5cYp/puvGByR2nitDuJVhUEL2MRqHpkfdIKl
 VnFRKOAoOXPD998biJlrKBmMT5FS56JhLQvtb+clOi+AEl3ORrhDtLc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: ttI-DqXYW9ypMJRn0qgJJKJekOJKqCHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX097fKsPuRi61
 HpB8J+25MNoD81tW8wNquGuEfa0g1P3tWnfrmf8ownLoaGp8TD33yhpXX+Qj5vWgpoqMBg2tsWs
 p+QFHKyp8Zd2SGdIe3esfodJ9ZikCXpiFIonplMatL8/PkvRSsjMz83FvfSyPq/1ANM7apoZ5qB
 nQ0DcpExmX3Hh7yOKGGNcyUlWnsjpZYJMLrQam+KmH87zMCx57RtI7GoR8EyeV3GIa4z/U7Elm9
 N6nJb8Einq/vKThr6eCckv7bC4jHplXpZjCK4SMpJT91DD6DU9CD4J9rsAReRX8jZnIQuBQWopV
 rhS/1TD53JIX5JhnPj7RFUJoQIxKpg/ytyA/OyiSXq1ELDrXoJ4GMxfYV+h9JFiQU8xyrkBhM/r
 JRD6YDOs
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a40d19 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ttI-DqXYW9ypMJRn0qgJJKJekOJKqCHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

PCIe supports multiple data rates that may operate at the same clock
frequency by varying the link width. In such cases, frequency alone
is insufficient to identify the correct OPP. Use the newly introduced
dev_pm_opp_find_key_exact() API to match both frequency and
level when selecting an OPP, here level indicates PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..831c9138841ac089c6dd6b08a4a206751dfebc91 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1555,6 +1555,7 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 {
 	u32 offset, status, width, speed;
 	struct dw_pcie *pci = pcie->pci;
+	struct dev_pm_opp_key key;
 	unsigned long freq_kbps;
 	struct dev_pm_opp *opp;
 	int ret, freq_mbps;
@@ -1582,8 +1583,9 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 			return;
 
 		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
+		key.freq = freq_kbps * width;
+		key.level = speed;
+		opp = dev_pm_opp_find_key_exact(pci->dev, key, true);
 		if (!IS_ERR(opp)) {
 			ret = dev_pm_opp_set_opp(pci->dev, opp);
 			if (ret)

-- 
2.34.1


