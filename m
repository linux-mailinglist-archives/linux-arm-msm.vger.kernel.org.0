Return-Path: <linux-arm-msm+bounces-87205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F59CEE444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79BEA300163E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F912E1C6B;
	Fri,  2 Jan 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4bxZYCS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJof4HBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6912E06EF
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767352082; cv=none; b=Z1GzfDyl/NMiuHqRft0Q0sALpPBFwzYx55tr9W3DzrCwjxWJxrDJxhw1A6XdLidLSFkoqy1q0RhHJriwE/snDlArIoQxJgKFpRV7vMtO5M+t0t2sA/YLK7z9ke6afUYmxCCbGWm9Rgh3jAjg8cVrxSidsrj0YIsMe3Z0k7y53u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767352082; c=relaxed/simple;
	bh=KkDQhZMSUVwp0+1UmXnDBE8Swp6Wh3Yql6B8Y7cFvJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j76izvCIZb0VjYEp68arxMZJpdJWtNEhoM7Gq0BF3GCu1JdY3+mEkCPMxbEIGdrdPNa4JYSljKBeQdTCDl0OaP8LCiPqjkybh/HG9sxBGOH3cgIq+6Gt54NclJXyOnhpefdABUvVOQ4pBZ0bo0bHdziqBL9oACRy1Wns+SyYzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4bxZYCS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJof4HBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W0qY3960194
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 11:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X6FFg5ASsMmd5AH4CAj055KPd8ELixeAxe3qlYhEaE=; b=Q4bxZYCSuFG7rRjg
	RJyih2wu/hLJNoFarNpLqx9SpbxcUxCYEBsF4Y+HkDQggbLm80SUnReWTWFXFCuw
	OYxSvl/qIuO3yAq7a4K/Dc/yhmUsp2RI/RkwqEu4cquQqbWZVPP0iBjxY82/2WbD
	HmZDmkPZyY9L8Ird6iJNropzPWUMEaxuSz+z5JWYafT2VsbeA68tRLI6QV4CkX4t
	Da6YXWf/WPriri0ZBsKA50gj36SPC1EwViQTYvPeGjb5txfAMuyECil4JYLvbejy
	kAiuLjFR0tXh/WqH1Wt8Rx7CdpBq2n3a4Di2lQjjrpBozByY1NyFKahmR+U+W0d9
	lH9LUQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v39us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 11:07:59 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ac34c4b41fso12309434eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 03:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767352079; x=1767956879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X6FFg5ASsMmd5AH4CAj055KPd8ELixeAxe3qlYhEaE=;
        b=iJof4HBF5yYRTaobP8z6ix15Ljq95Ssz4cNBg9Hqwpc0uLrzcawEgadnHbetQR0rBo
         KlwEOhJEA0AbSMWh9pCFQSMI0uS51OfNe7UYSr3GHdDyoxPIb5GsMFN54arfmdh4Rrn8
         kxZr2gq0MfLHIlUPT9Jb1JdOfb02Tkej39xjPvYRwuc42I8jvU2pEn7UMVxqRv2FLEW+
         h/DPgnWBwRWp6QubyOzaEHT5AD2WVPHwA2eqwMtx8tagJ9xsZ1bSaRSfEF29bN0xwnVW
         4cWkmkwtDtDNlfsdMh2DegerkAExa3ujZ6OH/o6ZCgl39cLzqGXfJrNwix/mcDjlH5p/
         FxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767352079; x=1767956879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X6FFg5ASsMmd5AH4CAj055KPd8ELixeAxe3qlYhEaE=;
        b=b9oKKWjfxnkXA1K5BlA18oRGXwDIiaj1sp6U0ML1i7/ncI4XiO/HBtKfbLP5gGD8q1
         1TueDR5PXo0OW6a2SaO4i3i19MRSQBWB9jyV9H5rFcivGEdAJViZTEWAPTWEXvZifqcv
         M68UI7erTB1GJSFfgOAlJOtM+lHGSZ3nGxAuwTZLfl8it7RmiRJk3N9A30HrtEjJwBhA
         UIGSAudwibJridhv+45KYYOUJc3WFShBevhB0oFk0lzM4rH7sGPWMnH2eECl6VWCOZAE
         1ahZh4vLN/voiuAyzUlm+Lreh30uI3Ha6YznxqdC6O7sL7fnjQ9J4rfnXswnPVkaxVCP
         l79A==
X-Forwarded-Encrypted: i=1; AJvYcCUk8g3P0BLv9mCh9GJMtNZ8YmVwYX/UVek3yyAChHLMwqCK03wPt/xaBiq3VbU3iEzpaGHHBhQt4FUXXD6j@vger.kernel.org
X-Gm-Message-State: AOJu0YzRofdgz7GYkGHyLAdcJyEA1cOH/qAcWNt9IDPONkz9wZgh8FK6
	LkZpjRf/P4vEvhDtxdqqH8kWrVM4e2RzJuZ9EQ+BFFa+wl8AhiTa9h4MrlampmbDI5pZIBn01jT
	XBq5wtDxr0/ph+MiHnBDW9RcFpgSfvMQE9JuNtTZ6VRb1vDxeXr2NGH4IaNu8QQ6BP5Xz
X-Gm-Gg: AY/fxX6WBgz+cIEQWx4SwVdvdCsRbGcPe6QWgYPPN/9tiaTEz2f64UdDFyexZsz0J7Y
	Q1kkPv5gBzoOu5jHJL+3mKgFfnMOGXLF9MK0TgFuAnrR+Xi+Khy70CWRQ4e6WtyTjjm4vtkGZvF
	jrf0r9bXi08k8yzFxVtS9Z0Q4sc2SlChG0D8vSNUAzaUqOlzW71z/T3WQYV83SH1F/DOUuqcfxG
	oXTSF4twzD2caOHT0P3GfPO17wy9IJ7JiqmrubYF5h+4KKKlDZc6QgQhp5BY5CgNfvhBFDsQK71
	uSY9Xy1qz7l/CaM5R9StFvBMDPkqhaRwFUgjWKsvc4cNkQY3V34ZBdUwjCzjrav8C3ecah2wyyE
	QBkNTPOtWv5vp5ubcvBb3hUM2jQvC49Yd43LXrLgSrzoD3GEyc1T4bFfxWk0k+g2LPYumG24Gbg
	==
X-Received: by 2002:a05:7022:6709:b0:119:e569:f874 with SMTP id a92af1059eb24-12171ae9412mr41785653c88.17.1767352078829;
        Fri, 02 Jan 2026 03:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5DP9FQSdI+sVx9/kt6FQVQLCaAZX3r4WT9lg3jds0XTfiicsnWUpRGu7OBO/lQqmA2iVKgQ==
X-Received: by 2002:a05:7022:6709:b0:119:e569:f874 with SMTP id a92af1059eb24-12171ae9412mr41785614c88.17.1767352078128;
        Fri, 02 Jan 2026 03:07:58 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm157431107c88.11.2026.01.02.03.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:07:57 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Fri, 02 Jan 2026 03:07:55 -0800
Subject: [PATCH 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260102-pinctrl-qcom-mahua-tlmm-v1-2-0edd71af08b2@oss.qualcomm.com>
References: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
In-Reply-To: <20260102-pinctrl-qcom-mahua-tlmm-v1-0-0edd71af08b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767352076; l=3637;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=KkDQhZMSUVwp0+1UmXnDBE8Swp6Wh3Yql6B8Y7cFvJM=;
 b=r4xgs1j4ZijJF823M8n2RgReEm28pbSrR7BFi3dpzd6YSEtqY36g+ccHhT/QLPHHPtZU73oUi
 H/izleqlrLAC4gX34E1gAAiMT63XW+heTx0rmuS0xc63anezWyl87ku
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: vCqQJeeTWgwWCsOIIKDILDQoWfeC_1p9
X-Proofpoint-ORIG-GUID: vCqQJeeTWgwWCsOIIKDILDQoWfeC_1p9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDA5NyBTYWx0ZWRfX1Q+KxMO88pWm
 EWbpGEZHfVBQLBkQGlGbp2Rixn1W5FgygIuUQ/kOnAj5sVU3U0miJv9/0oJ6O8zhjhHFsgOMXPg
 F3oSYc2FuLtjBahxmvbARYyZuxidpHQIOEK+5jKK0B0Z/JVru6qaz36Pz1R0CJLCLwoT/2DzwU3
 KzgS6Kpk7EEyd8Ux7JpypSOTiQRM7I5f7exku7X5XSEjIeWHZKAiu3stMhMQWdfh15OXo5vHVeM
 4PvhckxOIOoV37g13OEdo3XU+pijWnt/YyC0vDH/fENVjIoO0Hxy+Wfncp2vdigDsX33g74vNBd
 EvQmbeV9pYmPAPtgBicDU1FvJsKgl7f1cAzpHHPazGxStWKwhWaaIR2R/FRe5LDZnbM6BX9MFHW
 D7l8ygPe9cz6UPuXt5uIqD+WURJxhvsdYshzDNeq85AO8KpVOz2TD2CZnhSpBkTVG5WyEcDxc/i
 QK57Yjg+NyWWN2q+pgQ==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957a70f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Cqdlar3rRHXyc8QQv8IA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020097

Introduce support for the Mahua TLMM (Top Level Mode Multiplexer)
in the pinctrl-glymur driver. Mahua shares the same pin configuration
as Glymur but requires a different PDC wake IRQ mapping.

Changes include:
- Add mahua_pdc_map[] with Mahua-specific GPIO to PDC IRQ mappings
- Define mahua_tlmm msm_pinctrl_soc_data structure
- Update device match table to include "qcom,mahua-tlmm" compatible
- Modify probe function to use of_device_get_match_data() for dynamic
  SoC-specific data selection

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 335005084b6b..bf56a064d09c 100644
--- a/drivers/pinctrl/qcom/pinctrl-glymur.c
+++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
@@ -1729,6 +1729,25 @@ static const struct msm_gpio_wakeirq_map glymur_pdc_map[] = {
 	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
 };
 
+static const struct msm_gpio_wakeirq_map mahua_pdc_map[] = {
+	{ 0, 116 },   { 2, 114 },   { 3, 115 },	  { 4, 175 },	{ 5, 176 },
+	{ 7, 111 },   { 11, 129 },  { 13, 130 },  { 15, 112 },	{ 19, 113 },
+	{ 23, 187 },  { 27, 188 },  { 28, 121 },  { 29, 122 },	{ 30, 136 },
+	{ 31, 203 },  { 32, 189 },  { 34, 174 },  { 35, 190 },	{ 36, 191 },
+	{ 39, 124 },  { 43, 192 },  { 47, 193 },  { 51, 123 },	{ 53, 133 },
+	{ 55, 125 },  { 59, 131 },  { 64, 134 },  { 65, 150 },	{ 66, 186 },
+	{ 67, 132 },  { 68, 195 },  { 71, 135 },  { 75, 196 },	{ 79, 197 },
+	{ 83, 198 },  { 84, 181 },  { 85, 199 },  { 87, 200 },	{ 91, 201 },
+	{ 92, 182 },  { 93, 183 },  { 94, 184 },  { 95, 185 },	{ 98, 202 },
+	{ 105, 157 }, { 113, 128 }, { 121, 117 }, { 123, 118 }, { 125, 119 },
+	{ 129, 120 }, { 131, 126 }, { 132, 160 }, { 133, 194 }, { 134, 127 },
+	{ 141, 137 }, { 144, 138 }, { 145, 139 }, { 147, 140 }, { 148, 141 },
+	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 155, 159 },
+	{ 156, 149 }, { 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 },
+	{ 193, 161 }, { 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 },
+	{ 217, 153 }, { 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 },
+	{ 232, 206 }, { 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
+};
 static const struct msm_pinctrl_soc_data glymur_tlmm = {
 	.pins = glymur_pins,
 	.npins = ARRAY_SIZE(glymur_pins),
@@ -1742,14 +1761,32 @@ static const struct msm_pinctrl_soc_data glymur_tlmm = {
 	.egpio_func = 11,
 };
 
+static const struct msm_pinctrl_soc_data mahua_tlmm = {
+	.pins = glymur_pins,
+	.npins = ARRAY_SIZE(glymur_pins),
+	.functions = glymur_functions,
+	.nfunctions = ARRAY_SIZE(glymur_functions),
+	.groups = glymur_groups,
+	.ngroups = ARRAY_SIZE(glymur_groups),
+	.ngpios = 251,
+	.wakeirq_map = mahua_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(mahua_pdc_map),
+	.egpio_func = 11,
+};
 static const struct of_device_id glymur_tlmm_of_match[] = {
-	{ .compatible = "qcom,glymur-tlmm", },
-	{ }
+	{ .compatible = "qcom,glymur-tlmm", .data = &glymur_tlmm },
+	{ .compatible = "qcom,mahua-tlmm", .data = &mahua_tlmm },
+	{ },
 };
 
 static int glymur_tlmm_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &glymur_tlmm);
+	const struct msm_pinctrl_soc_data *data;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+	return msm_pinctrl_probe(pdev, data);
 }
 
 static struct platform_driver glymur_tlmm_driver = {

-- 
2.34.1


