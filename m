Return-Path: <linux-arm-msm+bounces-69888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0432B2D677
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 10:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F325956372E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 08:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F04F2DCF72;
	Wed, 20 Aug 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxaebifl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE82DE6F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755678583; cv=none; b=GwG4xzB6CvLzdOQxnLBe8cS/qvGoSglt4LUEPf7PH+0pYMsxvOJXDO0FWc0g2HEz2pTSOsMD6OHUvCRzpIXu25GXBWpDF3TkRkyqRo6/637e5GYsR1iluO/M0YE/lJhP9XTgLwu3lJ3eSwX1RMQ86icaOkRNGq0Id8DO2D+mXss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755678583; c=relaxed/simple;
	bh=IkmE1jjMC4FixOnI6iCdgleDL30HMdQDrPw6ul1iKuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EYEq9jH90MfwVrXJiBt7rRLtdgSSyPW7NNefBRHxprh/zFNC809247DW8fnSGofoV5gzyxnpolh0z8N95H8WAODJxH6JW2eywyRAryV3AVOTg5kKdvpDSouZWyrl4/sPYapdcvmLnvND/55pUQX+BS/SQCP37QzJ+L5MpLYDsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxaebifl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ojNW002673
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MgVazd42Ob3b+2OxT+ub/6AIeoHG7frufUrQpGpavx4=; b=gxaebiflv6+piB6O
	nkxi3Q6Eexb0QFYJ74iLHt5YdaS4ARA2WGcxRbkB4sylH456wAE89PKce3IfhcBl
	n9cufA/t1MaRyCY9XFLRdTOFwVWShj0hdHSKhJdh+m/2751mhFtREF420dH1md8F
	Suwnh2oxMLKUcKrEYYqkDkZGCAi2Bxy4aB++18oEgvPh9Jmfb3eNsRCm0bKrfoCO
	SBKNbXqvsCytP6nOqThYxI70XfIV7DzjNPjA+2+BLN27sLGxYq5pj3SSEefvlQA0
	EcCanLWY6mV0lU2iM8/0u99Z9Bw9V5ufEekSixKSLHjPg1W4rICcZ6b8Uhg9t4Co
	3PvK5w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528ry8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 08:29:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323266ce853so11348258a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 01:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678576; x=1756283376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgVazd42Ob3b+2OxT+ub/6AIeoHG7frufUrQpGpavx4=;
        b=WxTAumLiI7H8LIWxO0Ao6rHdXkhW3/FiXysndd/bApkmKEgY8BREIWJiPUlwUlNzKx
         Hcpmlyd2AlWBw2c9aokl0SjVzFhJVR63OE59lFY97wsnfW46mCTBAeYQM8A76LMB6Ld1
         L23SP0t8bU7GM/X6HmNKlvGc4lVWQAdeuKew6NPQ4km8AJOW4gsZJlkctVuqxNP2Abob
         E7LHlj7zR67a5TdT582SnxsxIWNYInOr04RGa5gh617xce9SYStMxX4G7GttfkCQ5Uu0
         xamAYjEFOSQ4Y2OSHq3hQ/uvqZhTvsJpYw8yTQpZAePX6JeKIzqZMHnCrI1Zoc/OsoBy
         wxWg==
X-Forwarded-Encrypted: i=1; AJvYcCXzveQPGGv7e0WynF5ddNQlgEt2H+0H03SvJkL4bd5LpCVRULt4vpWpyurGyWvyMQ7os17+3y0RvA+AfiBj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07ihSjGuq1nlHS8GlNRbk/WevZK1cVgBDn5rQoFx0d3VwI1Hs
	ZuFuO2wTRkZjfIR3es586PLQj1aL0O6l0Q8tK+dtYjKInkR4Z4dUIsWFEYSKIyJxzyob+4iIJOg
	L5oxH+YZFueOfJGXw0dGZblSkwW8kMAogyQwZmI6gC7BtikEVcoxTJ7oct76JjTaZlqkv
X-Gm-Gg: ASbGnctUzcuGO3UuoINd/cBCyU9hY5L6PCMGtOOo2fCB2zGCr2AyB+kgY9ChXtxXmSo
	HeLCiDU6vaeBtSa8eU9c7wkj7urOyduBUqK5aIOcKwoF5AxPw2YyqwY+9Civduu2RObivXGD9zo
	UPD0QotlpKQc2V4d9QcElsiZUIH1X7Je31LMPw6bFL9F4XkfzE8n+t28gIS3i52/dcm2v0HpSq/
	jWnTJQXX7ZyGXwkTF464555yXwvVJpSWbGjUFWyzYDid/saTfQGOLde2YfKhHzMs7CUFdr/KCVg
	KgBG6p1r/AqdvN3h2DoMoPRIH7q6rievFKRm1DKrixjzwvaqfke3zgZ2GPmBZxuW2rJsLTvAtRU
	=
X-Received: by 2002:a17:902:e811:b0:243:fd16:181f with SMTP id d9443c01a7336-245ef215fd2mr29489665ad.36.1755678576436;
        Wed, 20 Aug 2025 01:29:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiPY8BfkmagQpheekyURX0cr9AaqhseFsDNA26TuaYix4uLgKtUJ/U/jV9HEf4oUZFV9rQ3w==
X-Received: by 2002:a17:902:e811:b0:243:fd16:181f with SMTP id d9443c01a7336-245ef215fd2mr29488865ad.36.1755678575396;
        Wed, 20 Aug 2025 01:29:35 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed53e779sm19037735ad.160.2025.08.20.01.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:29:35 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 13:58:53 +0530
Subject: [PATCH v4 7/7] PCI: qcom: Use frequency and level based OPP lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-opp_pcie-v4-7-273b8944eed0@oss.qualcomm.com>
References: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
In-Reply-To: <20250820-opp_pcie-v4-0-273b8944eed0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755678529; l=1526;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=IkmE1jjMC4FixOnI6iCdgleDL30HMdQDrPw6ul1iKuE=;
 b=PKpGH+CYVvuGgKtCdEXtU++jgYZEJaPAHeVES7cN24c3hTKUpEzzt3/Th7iOTfRMFmIRRo1fa
 ENdpSsix4ALBFuePX3rfVUMY46z3LUq6gF4FLOehT7YuZ4EmlT5/79O
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a58775 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 3zAlj0zolp9BV9-wzfyN5wi_3fToopkJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7YR9MrEfNg/a
 BarscS8FAAKN1CWkhxe/lwwhPTPC6LHtajBLw8RLtwuVebcZzVjF4ospvVjWLMe0DC0L0EAIUOg
 38J2Inxw3EVqYCEnq7Bu9UJ5cPGVPHGbPZc8DeQ3fCkFTaszD8m6MRKyye4pt6l2QLs9i6V0CzV
 JOz7czeFH8OyQFO9nI2l7cQMqIYhxZ1SU1RnZNepEHi1db11FL6gPjWm0V8NAVDFsButeQVNwd0
 iyJ/Aqedg8eI5coySKmBp3jPzHtq/t1UzUfQVclqpaKeuJLWdM00oMNYorcBCq1IsqYjspZTaTe
 lgy02AtbyDtH66pgdXOo+aK1W9rdZQ2kqWeQ34J4AhVQegNs5l+9Y++a1nubXVTzD5mGrewUT5U
 PJ1gWVq3iqkQUMTkKXqMLS+/qGdllQ==
X-Proofpoint-ORIG-GUID: 3zAlj0zolp9BV9-wzfyN5wi_3fToopkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

PCIe supports multiple data rates that may operate at the same clock
frequency by varying the link width. In such cases, frequency alone
is insufficient to identify the correct OPP. Use the newly introduced
dev_pm_opp_find_key_exact() API to match both frequency and
level when selecting an OPP, here level indicates PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 294babe1816e4d0c2b2343fe22d89af72afcd6cd..4f40fc7b828483419b87057c53e2f754811bdda0 100644
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
@@ -1582,8 +1583,10 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
 			return;
 
 		freq_kbps = freq_mbps * KILO;
-		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
-						 true);
+		key.freq = freq_kbps * width;
+		key.level = speed;
+		key.bw = 0;
+		opp = dev_pm_opp_find_key_exact(pci->dev, key, true);
 		if (!IS_ERR(opp)) {
 			ret = dev_pm_opp_set_opp(pci->dev, opp);
 			if (ret)

-- 
2.34.1


