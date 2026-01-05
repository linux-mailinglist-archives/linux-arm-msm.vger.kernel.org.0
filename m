Return-Path: <linux-arm-msm+bounces-87430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 362AECF3C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:27:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E2063007916
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2585531960D;
	Mon,  5 Jan 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuLow+nK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuE2Sd4i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687BD31577E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619280; cv=none; b=NUT4nlPhul2atSgoQPRVDYjvWYQvmAPHcqIWzhlcS+Ihnt2JTkVvzDH+uzj/cEU8ASFynWESUxIf0eBECaSuIJDZO5qkFGXx17SvGst2rjeP4TRabWWOjsvFgnRJuW/HNkIv6zH9gTAlWc831U9RnIcm639vt6Q9F/t20jdxwrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619280; c=relaxed/simple;
	bh=U7XmshVdBAwNRnAOYLYhMrKisbMYTFMoCRfC8idH+WI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9DcAJSpSxXwMSWV9p8irMuHmFa0SZYFOxnjiP2+dwSyGkaKAkSPEuRrfIwrSwUYdUYS47Q9WPqiStIo+tpFIMVSVG9A8rg5a88Ui59oqsqTwpIov+81zcDjT1sTTXzJBvrNOVxFh+OgLBii3eGCFCKD3aXIWxfM7w/DkGdjVC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuLow+nK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuE2Sd4i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605AYUwu936763
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nkXRBv9c13K+BOWQMFjoCUtfJHOCkN84v1/BMhoeC7E=; b=FuLow+nKszxs/Hqf
	cZKtH2yeLZSRTpKe5ZfrH4tIEWGrkUp0MxnHHCVNoIKqFXBxTT/Aamz6Zm4b5ln1
	lJ7v4MFALJH1fKVXYZvOD26aC04J636aYD2gW3igTspVQS0yVFk1JHDkDpY51KQQ
	JAsTBwkvqB5h9ytVetVFV3mWf3GseeHeRQZGqdg2bLLtCEd9JMaMf/E9RKkJZw1I
	T3Z7HWUk7wHLRY7MQ0guvsZnKAsVH4fMBZwbuyhWUcXA5ROd8BGnWxuAeBM5Mcsd
	QsBSpFXrLu5mzeXKqeOHuRTzZrmgTgQ4sBa2uuEHnRDSitAJqWAJNSdYwBnf1A53
	ryz5EA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgbnv8chq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:21:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc240cdb249so12618180a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619276; x=1768224076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nkXRBv9c13K+BOWQMFjoCUtfJHOCkN84v1/BMhoeC7E=;
        b=EuE2Sd4i1tSoxkHdqyMgkZcp4lWbWNk/sys93veL66DvnHb+O0NFdBwoyLGBMqBMYg
         t/A0GNifo1O8tA5JIJ9IEErlm0u+MHZ6w5llobeEf3+4B7zSgGrPHVP/uiOblNDpdZW/
         bijzhqSYnO81Uf1kj1NwnmdXM2h9ifNbjOemO+vSgrAFapnlM+0YfQ0sNOqGs8a1RYI2
         +pUfrITsIsvk1ZqzuvFRZA78IoGNefDdaCJHUCtifBDZdME76bVKuqiKh9VT1bIma6wL
         RZkUgwTN69j0d+2FQMCeis2E7xTwiOHfHh7KnMj7HLDG319z71gsEubfBBKJc7XGGP6m
         Cijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619276; x=1768224076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nkXRBv9c13K+BOWQMFjoCUtfJHOCkN84v1/BMhoeC7E=;
        b=FOCq93ucWkkC0rkkMj8Gvu0/qyjK3QFvDSLw+VLtadNx42JbNDyfL+JUb7ml8EK2Ix
         A+EUld6jItIugVHP4VAD4q/y9cMU5RsPSAtEWF07p4mS/sX09h7pCWQLaEPqbzauG37A
         c9PntOqQO+sFJIWlnkeQXwqKrzSj1n6wb34Rz1ntVHvVkQ30Fqc99MfB4HNF8hYmtgH3
         Sl1A04n1oijR6lPEPBfpDO83wUb4crY9WS5PU3RrFDZfBzdfPKQVEwKcbVJNHB/W3QLu
         X34sE8z+aVQtSzkHe4iqPubh6BA7D3NSnDmCD8NMkFidZwlBC4e/GRJDk/EMJC2Fyul9
         pytA==
X-Forwarded-Encrypted: i=1; AJvYcCVnCCRASExB2HcjVnn8KxPCARepOeLbihogGeXXd3kMSlVABGurMDmLUfga5iqeKlTpGZK+8RdbHDjGOQUj@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQbfL5cP0Qdh6a5tUMl5qkZfBv0gywJCnoUutgR9ne1Pe1U4H
	un2ilhwpYsqoJPCYGks72TNCOHEhyqIDZ/JYxzf/dfmLm5MhwaxOCN7rJVqvsEmGJX2TQZJoLfh
	LOF8cgtF0QJ/vEqCvK4Bb1K/6w+fHHhj9hOIL+P2HD/Jrqk8OzHXcmtmOL6OpUvt28bqO
X-Gm-Gg: AY/fxX471gFNWcvyk3b/8BJKdxSOL9wB6tDDANokgJNzKs31M6dAX2606Ct6VyJHjak
	UhIJRGoI8Pcu+jF4BGpR4vS12yL7rwuvPh4ByKpnCxE//DXRlz2DXrVvM2JI5ATsP2R4SRsK7zS
	fgr0iPAPHRCPrctmHC58hXVXA3N09oxcjQK2DCHfyyRY8pIXk8V97awipjbo/NdtV16xx52YkdZ
	DH0Hu//d0RlXIwkUD6U6DdLkSMD96RseVb/ltOJet5iShtQ/EHXUOrZMWyQMMtcG5WpJKbjlmRF
	dqYFnFq0MnC9Mt4rlP4VffNQv90j3dtIjP6+avQvWmDzM02JXyEw03bMVLAvtwaLY+N5HveLJ44
	b93X2l2TO9/2HeCGdLySo3wlIDZQAjEC5taEuO13Ao3IAZhfSESooHnqjuKbuj9O7UlPcwqF32g
	==
X-Received: by 2002:a05:7022:6886:b0:11a:5065:8763 with SMTP id a92af1059eb24-121721aab31mr45120821c88.5.1767619276048;
        Mon, 05 Jan 2026 05:21:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFT0ZePvBFPK+WkreTAXcszd6+ZsL6LcFSVxA1iWWB0gBqGVeNWoO+0CAH7veXD9UU2F+fSQ==
X-Received: by 2002:a05:7022:6886:b0:11a:5065:8763 with SMTP id a92af1059eb24-121721aab31mr45120790c88.5.1767619275419;
        Mon, 05 Jan 2026 05:21:15 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm165866042c88.1.2026.01.05.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:21:15 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 05:21:11 -0800
Subject: [PATCH v2 2/2] pinctrl: qcom: glymur: Add Mahua TLMM support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-pinctrl-qcom-mahua-tlmm-v2-2-7ac036f700de@oss.qualcomm.com>
References: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
In-Reply-To: <20260105-pinctrl-qcom-mahua-tlmm-v2-0-7ac036f700de@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619273; l=3188;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=U7XmshVdBAwNRnAOYLYhMrKisbMYTFMoCRfC8idH+WI=;
 b=X2H5ldyU23GV9aceRvYXSzCRSozd/BsQRwPwoz+jGR7CiUH+d+f1lnwxxhF2KIgbcUofy8NVu
 LP7W+pwsPBYDXhe3NKAQFky3M1ITJoistD6w0/ZKD4q4YxQdAPn6hGU
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=695bbacd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=p3TO2ht0Q29_D93gC-wA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 1cMvefamRQupsFyp8EBrxA0t9TAEwU9O
X-Proofpoint-ORIG-GUID: 1cMvefamRQupsFyp8EBrxA0t9TAEwU9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX2zjm2cZOxbdI
 EkiVtuYKGBaK5Lhp0+PepZ0z/jr/M/TNNo1Y93+FoM++TwOwGtZlE/XNkE/QQPMbh3SDX6Ww3ho
 V9uJBpCPHiOBAByOneeTNGZUGYB1VwIbo25/FB6hxMWrCDqJIc/9tXHEzjUZuLGUjlua34s/4PG
 yC5J1WPwNnME6kiV8s9JBS1YqN8w8ahccD6rDSyX6R4mQ1cODanDg5LSTet7n/qT5flR+6A13lM
 j14XK0nCydLRmQwR+9XYJQdIRrNLIIoDlf74zZzq/Z9JvwGpB+un7UlbAHkT905rSWNuTje4SYT
 le0wkNCl+ZnTnt/NzhfzjNy4adQnsKMRqOCtRJBXIYxYDi5JJg9p6MpgwVJt0h7n6LYz9k8Nx4y
 ugJ2XIkemMV8daMDbjAJOGyWNeLHbqulQBq3gBhptZPH8wUQMDOK+PCyXL3354aqhkSdwTBnVLW
 U7jRRS6aaePgiAJwECQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

Add Mahua-specific compatible and wakeirq map
Add mahua tlmm soc data

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-glymur.c | 43 ++++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
index 335005084b6b..0f47e75db7b4 100644
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
+	{ 150, 146 }, { 151, 147 }, { 153, 148 }, { 154, 144 }, { 156, 149 },
+	{ 157, 151 }, { 163, 142 }, { 172, 143 }, { 181, 145 }, { 193, 161 },
+	{ 196, 152 }, { 203, 177 }, { 208, 178 }, { 215, 162 }, { 217, 153 },
+	{ 220, 154 }, { 221, 155 }, { 228, 179 }, { 230, 180 }, { 232, 206 },
+	{ 234, 172 }, { 235, 173 }, { 242, 158 }, { 244, 156 },
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


