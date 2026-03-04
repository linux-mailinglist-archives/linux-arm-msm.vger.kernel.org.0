Return-Path: <linux-arm-msm+bounces-95394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLkoCmVwqGkkugAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:48:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CB20568F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 18:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45B153058F12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 17:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E793CA49D;
	Wed,  4 Mar 2026 17:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjNEJviD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBZw9Z5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605913C3C1E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646115; cv=none; b=jXqHCRdfRVQwNV0UFsnCYvuO8g+YzkujOichuXwrqPx0MT1fnUsAVJ9R9RLg7ch8q5ift5tPQn9zPuSr7kfC5ddI7RZtox8Hao82pA/nFdxQmFnKe/IOYqpHNObNfTvJRHXNBqXgg4CSiIKnevqsDX6JqNXMhgb7w63NlrFhsq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646115; c=relaxed/simple;
	bh=FVOZTq1ijDV9vsfM+ILLs5LfQatBgVIEvFea2+aORcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TPN+7Gjlhc2s84V5lSWYXpSQa7iqmiaDxR1nvdgGtiwGKxR1Z9cPod8xhtVN8/wJXQ9jUeYeZHUf8QCui1qkEJzw4oe75piFJryUmyHUuGnzh/mIGhuOKF98ocrRf8nPA+d5BHyHnCPbNo5/JZo1/ikDDoCakcCTJalQyfsnZns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjNEJviD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBZw9Z5e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6249t9rG1214505
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 17:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PLi8blPUA3oM3r6i2Xmgi+ePGDxpZMvutkakyZOMW50=; b=fjNEJviDsRP42Gh+
	4mXDbeITNNfc5JvCI6AljHT5ImewYrRfEtoY1VgMWQ6uX2jeT0BN52uFxGb2+k8p
	uddakazgBHtX4bLAa3A0u/RgKQL7RSKOBO1VsKXnDmpVk0XEcuHrQ+2mCQKRFUbo
	6lDZU15+zyLrMMCQa6yEdR9gza2cUTVhz2pNksVJ+ghQf0Ec+YPQRUloBmkSXOS9
	yKJCiZqzAUlaNW1XfGohvTUTA034hBwqS5L/X6gxFfBWlM5vy2O3eluAiRKjdCrj
	BatQZPJhCkDOvJ/S7gDbqBHIUwzIe6puRlab4YjOzxYhvB23srLlgick/Cd8UBqW
	xkIScg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpjh5sdm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 17:41:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bce224720d8so4057623a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772646112; x=1773250912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLi8blPUA3oM3r6i2Xmgi+ePGDxpZMvutkakyZOMW50=;
        b=YBZw9Z5enKFmJLXJi88RQmwkcfe5B9Mr6g/Am1O9Kx8Uc86E6gHkwXVWVhmHfcKQg6
         nRuoGbcKf54VqgK9uyuY2aJu0aJr1sb34iwBw6m7RsH5r7+WA3zGWkcr43wZftrzMYIx
         vYYKpV9kmBQff7S+hAX1ylySZul/UUB7p7/l8EG1OyTHBTrBI13qJ0vQLptMPK/x3IpO
         /h/Llm9/EKNF74UU/Psq8B274i3IdpwCk8IliSj1eKg74T0Y62QZO5JlyT8mi/r05l91
         kxRLJjhv4OBVHRgFH3mN5De7qbVTlhKk9LbiEXwnaM74YDue/nW92EIlxq9y+52h6z6c
         LAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646112; x=1773250912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PLi8blPUA3oM3r6i2Xmgi+ePGDxpZMvutkakyZOMW50=;
        b=ko3/W8wyr9RjBRKGueh4SDWu42tOEy8w2o13dC7FxnFNG/rHgjiw+GdDyWqohwJCib
         t7d9HWB1wCqqILElEA2nfnHCT/VE6oB5LQf1BVs+yDhSinpMJiO6nFZttzlSyQoPoUVf
         rzUq3COKDb7wWjTmg7fBqVAwH+3IAf0j7/jDGA/8CqjalpMKJYeSA7AwS0E52/9lLlwd
         pOy1igSGSlq7F8cuKA+w8qiuERff3l6hgqfRin5x3oAnEoVw/1/zDsarAp1qc/UNt4Nn
         CNboZw9TudsU19duwMwJCEq4QEoazXA7YThofSlfYCKwigffFtn8XDCc9DRTbE5oQiG0
         7T2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwwkJ0+XL3Of/1r+7iS5cxPUT0WZfsz3yw40XHEyxYLtW2+bi1JK4u/S1hMFVOvt/JM2+QgHVCUxoLVLzf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcgm3TDmDOsrNO3E5gq3FSN6FXpCsfkp2efXbMdHVA1edQXWDW
	e7a/62ribvOkBo/mxa8izUv3eMRYEntLSkh/QrXbPpfhCK2cRen1F8fQSxZ2iXqZB5Y9NUeAO08
	4YyHJ819DeEj4qGSyv7OGgXablxzzWbUEeNVMFD6rC2To3jF9iHVeLQUnWCheR9mGvMqFm8TFcQ
	vE
X-Gm-Gg: ATEYQzwJiqr+0aFX5XCu3nyQhXpcM0dFg+AsoDffSIWBoRLGLIIixykfe/sFBTK0Kcp
	iqSpnDKBpw7CDQmonDmhnjdwuj8Cd9sL5yLmlS6AV4UhPqUXe5YsdF2B6drODzvcdX5b6zIJhxw
	V7D1X7qhupy/JtbGYR2fFORbDakLgCmJk+JuElHR76setX93s5uK2YNLS60uNLaox57MhBoHNuO
	G9qNY4fS8uEH+yGC4dcq47pb3YEQrBJYZh2DQJskThIC8Eza+uaNlhQOrkqtZCvXydmb2ZvQXWW
	H5rfVqjclj4khtxWkxGxKAdpAQeVNe758R/8mq+aufm0+FCS01DW8Bc89DSqALs7joQT6cF0u4K
	TfzLaM5raUg/nUG195ZvIAw/KjhhuzBfL56tRNEPodxnHQxAyH0yk
X-Received: by 2002:a05:6a20:9595:b0:38e:54b8:60a1 with SMTP id adf61e73a8af0-3982deaf562mr2751601637.4.1772646112323;
        Wed, 04 Mar 2026 09:41:52 -0800 (PST)
X-Received: by 2002:a05:6a20:9595:b0:38e:54b8:60a1 with SMTP id adf61e73a8af0-3982deaf562mr2751577637.4.1772646111880;
        Wed, 04 Mar 2026 09:41:51 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm16608794a12.3.2026.03.04.09.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:41:51 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:10:57 +0530
Subject: [PATCH v2 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-purwa-videocc-camcc-v2-7-dbbd2d258bd6@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
In-Reply-To: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: GJBWg8Yuvv7FZMfv5SlKhKQBFY1HaSTS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX1gLmqWCZ6hrp
 h7get+SrgdSA2I16y8R0bqkhNxEzYGp9FwHOMKXqLEplNE1wdP/M1s23s/C+8kz7tb761WPgVK+
 XXz7505qAdidnGlUQlVmVCJ/xX+U1y49Xf2YxfOtJQmTuOvU3+lo+GR3YGK4DlIsy2g4q0Q4Gul
 Hpwl95wPGFnsUQCbwKLt9aYSVVvB2ymURVpU6YxaZHIP41CMcgyrA/tmGisIihwkUgNuNjV9/vD
 IDJVOPPPVbgKl5EOZQwmdWfQY8QeWHQjVsIyV6oQXcHWdWFK2K8uYTycs/1k3+ASItx3d7jKm+Z
 8TxDH5SC6XjO78q8Z7Ntd+O0JH28owgA2HJU9inYe9ya56bwD406XQQ28JbVSanSWsU7M2wRuDT
 ExotCUA6GpvD3Qs9WZDrvHBHGrwIYmOv+TpOrgUHJsMIc2tJ9Msb5aOve777UKt/7i0VY450kb9
 nVXlYeF9V86JLWFIvzA==
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69a86ee1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GJBWg8Yuvv7FZMfv5SlKhKQBFY1HaSTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040144
X-Rspamd-Queue-Id: 253CB20568F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-95394-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7a6d7e70d38352a3eda4a39c39a9549508b3b944..50cecf05027e6de754771b9ab5195216f908f859 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1461,7 +1461,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1


