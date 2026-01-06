Return-Path: <linux-arm-msm+bounces-87587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B0CF64A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 02:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70E03303E0C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 01:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7974F3164D8;
	Tue,  6 Jan 2026 01:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVUdUDT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3EFlawD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2D7313521
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 01:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767661302; cv=none; b=VqfH3r4boQndsBJvPan+JSrUbYUBQ2gLkIwZD9zJtov43YIeIUaMzuup4Wxg5FRk9D5fg+65XNHadYM46yMhsnUHoqN7jRxIgQmzc2MW3WLSltw1dn15CunC/H9M/bnPgtEfRvhnYGn2ykulxlb/qsZp5Q9dpclLTQfkTaAvscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767661302; c=relaxed/simple;
	bh=2Pib2kwPZ7DtwTUQkou3mGrF+rWLEBJzLfmZbLG03XU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bu7uHMRmINg6y4AEJ/GvUJmpJBTUPhff4SdHUXY/ZZ6zqonXtfi2C5rsdIpbva28xrZoqluGjIa/Z2Md68A03M148ifNmI/yyjOIO1kD/pqmnTX9kklXq4lyl28exxVfwvE30T2Fuqz2bjY/YhcPceHILvhVoC2gWfWz+Bp7VVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVUdUDT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3EFlawD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nbnu2597679
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 01:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=; b=hVUdUDT1XegaQdjW
	QdDbzMLFZSqjWyry4+AqBCS31BsY8mqtU2e6pYhE95Qz3VCh2f8ZPJeKMqTY/pqu
	/ZuIM2tAxPJnqsH3wa/SYvUsTai1jtn+72almpHhLgef+c/jia49Sj/0E00WKdf6
	CCFGK+Qclfc73j0wWIhSGglxs8Z+B72LWLnENvdWizjVXPMj2GWaOL2ucKpCO+yp
	N/8Uny3TmoogQ1QDJ3p0/Iz2Lf8fnJYXBg1mtbGZCS1xCjF3zZABr8o2KG7lvvhB
	G4JcP2Hu5nDAvp9Q4dl7PxxJcwJwZCcq4RF8Mr+G9nd5lLYJZsg/mH/CF2XZl7De
	FWQwoA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pjes8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:01:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed7591799eso10195781cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 17:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767661297; x=1768266097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=;
        b=L3EFlawDWwIXrYSI+1Np39clC0wcdoYU97+2M+gHiuUlhJLJPmRMX8nkPujDX4aB6v
         N0L2f5E7O5clrgYdZv0/paVjo55lTGONPsIKzDCHLBT25GwOtji2LXppV+8ieOF7D/ZP
         tqxyfGUD/tj4GkFjje/3vASZE0DVQfYUMnFEexe1JzVghH4FMbkfH9c7Qimt3O9xyeRL
         ZzQGnbwodjsYRm1wcSDyD7wf0UWaw2Tup8lFzvA0p5nmxiTW94/oQIY5M7yOQ5TEjMvO
         RSB5WDCryjpeN8pbafZ76PjKj2rsvO9XyPJRBijm7hmnACT2Sp/T3/LyUVo01FIRYoo1
         JF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767661297; x=1768266097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qh9WNdUSE4uVt7sRG1PF/omHoIX+EjzR2cCnZgd0Qw=;
        b=kPnLu0zhLH7HNtDCWlNYTEVMqirq3jHPVC8Lpcj6r0+8fHx7S5Nyg407OcKcjHHjhn
         O1mKkWWwQEIQ0hCOsOcwr9Cb7DiTbfWicxTnkShpYyUXeFuFB10/wP1iqorZ63cU/JxR
         T+bB1e26uZnxwua/W5nfOXDe77svo/gvVZAQulzZk03TDxDiFeTloV0WoeqjJVHUd0LO
         BNmGACPFUhDSPs6zQy1YIeEEwcGP541KT23m/Hs4MG4kVOz/J9mNkbI53pyKmiLsGc3t
         +C+k6MWpTk9JB4O3K5gZmGZs8M7pbxuCNh6+zIEEhuJN1LO2SAuwC2xX1LeUckAmYgmE
         0D7A==
X-Gm-Message-State: AOJu0YzigEY8iq27Q7CKCOAoNEODJL10s/O9KZJB2vUrkSuQ7aDX+SOu
	rQJ8rODKn9Y3f7aXFvRAEm0mDBSZNG0YyGsKyqIaWY0UYDrpevk3NPs9JwKdkGtP9S14xKS4iU/
	fs5Yweu0yEvQdA0ONxFaEkzeBVDxNANCx0o4FrN4gnu6DRR/UVDR+b9y4m5Pz1KTT+gmN
X-Gm-Gg: AY/fxX5cU6ciMdif9UYNzNGJTDxPM4btc0azPViVSV9NqLiAtamhAZxZCpLO9+G70Pc
	ipTv22TsNOJDP21J9QpbxZaIqEzYfuOb4vrHjAMu1CAVKRAensNq/fBXwwkLdLfEuGLY9uEJyAj
	8qDumqaFsWf0fy/z1vxGT52wfIcJqD6Q8DpKyjdIiHsGv24GmJ4YG1784Z3TDNqJERmhosZ1Udi
	2/WybrBAnqEetE7DVLrJOpO1QyJkj/W5oiPsou27y1ap5uNdFQbYOnCKrExnR+6JyuJkijKBAvK
	woFf7nXBlNiUVmODts999JtWYJbdr21E6X08j2uudhbpnCv2UNZ1xOxe6mEnoxQoL/2rEivXlU9
	suBwN3ev9V6VFAUkKPhvazgY4L0ZQFL82do8j/ITy9I8NcK7j0XtrMQk/Kq/WU+miP8q9TXWHlG
	sbG1JofdfGgmDcWNclyoaNjvQ=
X-Received: by 2002:a05:622a:6087:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ffa76d6e12mr17788381cf.26.1767661296973;
        Mon, 05 Jan 2026 17:01:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjXxUcPH4SVqfn5bNTY2jmHhXwNYALWEoxJG7klZ5VqgG2/qKqzhz+fiZVGsmUcbbuerbXUQ==
X-Received: by 2002:a05:622a:6087:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-4ffa76d6e12mr17787811cf.26.1767661296555;
        Mon, 05 Jan 2026 17:01:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea8b1sm181082e87.6.2026.01.05.17.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 17:01:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 03:01:18 +0200
Subject: [PATCH v2 08/14] arm64: dts: qcom: sdm845-db845c: specify power
 for WiFi CH1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-wcn3990-pwrctl-v2-8-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2Pib2kwPZ7DtwTUQkou3mGrF+rWLEBJzLfmZbLG03XU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpXF7Zlf5n0Dg26rwIIPNnqK2YFns3wZx16t903
 43lWvHimASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVxe2QAKCRCLPIo+Aiko
 1dZrCACPlopmhMEjT9k6ib8gDTAHXIMD+WgZ5g8/QSHrZLMEMi4HDHghnDOoNwNm1NgDBRRyGUS
 h3LH1A7/KcP6PthaN1Gt4mtN7JaJFgmn7w4pSuQM22tb+cHchs4dAHfuDrTt8n/5EbR24ZPL+R7
 ySpex+Sw0hf+p/wN+px4X0jDQrYn/XCcoY8QN4YFI1q0GEKHpwQRPMx1h1SB2XbIUZKJpH4cVDH
 Q1lL8ogyLBdqHNz9ucKF6STXUBf3Z9tLCVFxwgg8ZuMZOIYRPC4R+l3z6KPyJne8A+cSBVREq2q
 tZfomdIN5pHS3W6ZowKRJiQZh1rThNq+q3kJ3RniBemodlI1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAwNyBTYWx0ZWRfXz43C/bzLcz9M
 xNgSNvIum+25MLW6X37doBryjTARCE2Bf81lYLHc6TrZMjRpKKPa3j4gP9rRpMuMFVrSCzOZChK
 W2ldc89tnZ6tHNYeK5N7v0FtFQf5IqH4pbvWp/40fZevJMqMj/FeGXXfPCqMNBpxfwtYPR/dm26
 dZiefebRf0QxoWoszC83TYVStmYH3xmZ6ClJxzUvGCnrOhb/aQVlXu1NWJideDR2IJmHnq/gVuI
 ZW5FVX0nN1NhjQS0IGCO7tvOewB8YqKtQsKUQcGxqhOaxU5VNDckELBXk1ODlk994FU5ilPRt7/
 0sgOZ67chPULFQgIh7GsRLK3rWrKoEa6gu3XWcbbvUU59Y7YWZvn9/hk4IlaPP+D6ALGE417dRM
 DGl8kLvXK5hQS0ZXM1fv51nK4kIai1sjiNQpwGNjXJW7ExkPS0ERHY77i9LSrl1EUsOBzt5Jg/S
 oC4TS8O7BJFaRl3jCgw==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695c5ef2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bVOQ5LKHHoa9h4ffDBkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: fWw8G1s7oHkWq9pKshzbnv_qDOIMrJ0X
X-Proofpoint-GUID: fWw8G1s7oHkWq9pKshzbnv_qDOIMrJ0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060007

Specify power supply for the second chain / antenna output of the
onboard WiFi chip.

Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index ad283a79bcdb..5118b776a9bb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -379,6 +379,12 @@ vreg_l21a_2p95: ldo21 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l23a_3p3: ldo23 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l24a_3p075: ldo24 {
 			regulator-min-microvolt = <3088000>;
 			regulator-max-microvolt = <3088000>;
@@ -1155,6 +1161,7 @@ &wifi {
 	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
 	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
 	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
 
 	qcom,snoc-host-cap-8bit-quirk;
 	qcom,calibration-variant = "Thundercomm_DB845C";

-- 
2.47.3


