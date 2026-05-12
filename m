Return-Path: <linux-arm-msm+bounces-107105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPlGIzI2A2of1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:16:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2C8522276
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A77234C5E0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5503A83B7;
	Tue, 12 May 2026 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxuarqHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M3IeANYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E33A83A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591700; cv=none; b=VgjV1lrb6hBUeSZhmSl2HPpj2h/FH0p2cFwT9bsTvL3nJ9r9gmkdpn3Pf//I+1kNaCtxHtqD2TvkJChEs6oWwYDpBy2ZXCf0N/CRmIADIZHPOpI09wTjdMfXUcVVg3vt0glevG/M6CJhlEkj4vGFXMoX280GNXalJYgMPArwQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591700; c=relaxed/simple;
	bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ztu6EnMGN14ZdYOXVX00Wdd2iY5Y69S02nunQCSQ1fdQJK+XPNxpHa9D0RidCS3lD24uc/W62I1HDpVxlvlxng6EE/11Pd24aUHihbvtivVizrMxz7P2POw5tslwDZZQnx78qOQ082v/wSGfAUesvVKL0WrMdDc0v+FSaF3e1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxuarqHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M3IeANYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxK3t129123
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=; b=pxuarqHaLncNCyB8
	csJZQJr10cTRRjezO6EfKVdqXv1TvwnJ1M6o7CJd2jF4+5Que3FusbIkwkA+oZ7i
	M1p1Q/1pgAMH/vVaqVwEa/3EouDwR8uwfrvcpSP32Cudz9akVa1SADbdyXfWY30B
	fp5/7xKGVQPz6+yx7gf87QPEnz6WPqqA21mgmxU+2y/uFek6H1G7Veawc0klE3ie
	/CIFU2DAvhgERYqlLJ93bhxAK7JErNWbM9kzv+aHUv5f6EwiI8Ed9JsV/DMqlSzE
	rXmcLkxItmNmMK8EYWRWReSiOQEkyaREK4mLiZvp6hz7p38o2K5wC0ZNWrh9roud
	FZZQmQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn07ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:14:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6329c1a6710so1301725137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591696; x=1779196496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=M3IeANYNJS10tUSEwdtKhI8nQUuCUMGkAYccgEIJD1Yh1z5YRGAql+7XakSZSiiUds
         YF/vOyzB8WN+AOdmIHGQpUuVfOfLRPQ6FPXyACoHyavoMksyf3qqkr66fcIGvw6XxLPh
         rFws0JwubNpQcA9G6gohNDvZA0F/+T6HgAxSYe4J7t6q4TCiPUM2njRmy8kwaGgcU57s
         mWYZ4SqOXzi9XnW8gVrhNmQQfG6PbTC2gm/isnksAviFlph45yhIypuateBeWHinfsG2
         PCGSj1nyWFE2ZvALxR3t7mlQA58znpjP/mvF1CC7it06yOY8mO3O90LG8NPs43D4KgXt
         hCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591696; x=1779196496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDUShvlFUbelpVH62uTctBCJSsxe3CkA10mFD4Q5XSE=;
        b=rcjHv+Mkj8ReZeU3kglyYdO/jvA7n+RQRHm3p7MtKbFFh3CTP5fgPf8XUbrP40cbsh
         3BDoJZzEG8KXZprLMWOIyDH3qt+HE0GQq/DWV0bNTnsnzm5O5rlLreBu9LAUbMbO0Xph
         oJhh64NZWww1n76yf3HzJLcmfxgs4A9x6tds772ZQZ8iOECt2QAjhNlISKpQwlK5dnL/
         WsahidoraFqXjAAIGNS6L1n8Ntb6oHRj3uWkPLjr+HwIhvCx47bvBIc2WuJgmGG1GG9F
         ULpUtE9rTV1jc9Al1B93/E+0Z4GBmZRktXfxSG82eHD9upXiYJly08Xk1bwQIGCQre51
         6eeQ==
X-Gm-Message-State: AOJu0Yx/aC1s4RYxAd8xyfrEdcKOSYIX+n+F8E2bu8MG8a2cHKFXp740
	7AteqjiQvkYk8j8CeW0MnFfCI0rOgoXsRHJjzQuxFbdM5cYFdXZen6MoY4kvtToWZEkP++/Ts/r
	Tl6nNVClClkZ2nlVcqa0uomJoXCdN/c6sAN0u3lpG4kPMDrVk7036IPSLNPW7YdXiI9An
X-Gm-Gg: Acq92OFZv3vtHoDHEtF72ZCpq6N8j6/hKyXG+Ipb/JASRiPTSbsl6Ynx2fVxR0Wh/+N
	0SGMhArIgbKoKAwqaWlD1V2NtMe7G70r06zQ/+/tvCShQrIJVUZINa0D25bOS4Xilq0JB6CFEOp
	nEf3R1W4cxZHbNK9jmSmInG/DCuHRrkcBmnE9FqSVgXzvun3NNnlrDxscDiVLQba8Tm6q42UN76
	0Kh/9Pf6Y1sfHwP9+Rp+JOtOnD1GWCCyAdM+foqbMtgF/BkoIla2pe1Y/6YxTnsvjZDEaXLAOUK
	gKjscwLJUeirtfB8g2+WaQQoxNYoGwKeonE+jhRhELLwjAPC4b/1LCloDZEJhWX49mPF7t5vLKJ
	Szf8rrVL+3HDTtODlM/4cnw6rnjCLlKPjX0f6heeTEXtErusOf0Vj+v3i3l9GWvyY4IKwJL8ao2
	0LqPXEa+2J3K6TmbQlI1YUrlLtuwEor/EO4A0=
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1105036137.4.1778591696553;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad1:b0:631:487a:238f with SMTP id ada2fe7eead31-63613ca7c06mr1104996137.4.1778591696092;
        Tue, 12 May 2026 06:14:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f395d5sm35163281fa.10.2026.05.12.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:14:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:14:50 +0300
Subject: [PATCH v6 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-venus-fix-sm8250-v6-1-51856dbef83c@oss.qualcomm.com>
References: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
In-Reply-To: <20260512-iris-venus-fix-sm8250-v6-0-51856dbef83c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXEQdSaGgvvhyTZjCrPo1di1ubN2oQfPidI6Nv5ympY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyfM06MHkt0moDhI5mKTZW7jOm76u1NtvyfO5
 84Rk9+KImCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMnzAAKCRCLPIo+Aiko
 1YAsCACDBh7fPyk71x4p9J3O7KsF5Ma/aNnd8AazJcSXJuqQ2wrw+jfoBVedICMuvvHdqO/Alb7
 YGZmgsEwA2h8UNCsjEruM/GXZCv+mDwHSs5ceaRdMTaaKYrIi8qNj0pq+VIXTiExhpzc3NI++7y
 M8pqCaeue/6PVtwq689utB9Q/pI+68nACq1KKhZXm+sWtZbuZ//FrhAcgPybUzmk0zZ1rhxQF5X
 n/0dUz/WvOJZ0T23YTlnUcRGcLqnphKo/AvhnM7d/9COjTR+xUsfWvsL5DluNtVv8rjOrc93/9Y
 HX3cyLuTBVzqgpDbAOqNhM9s2i55fIFr6Rls5AahdkgXOO9I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 85LPkbULrVFfbR_WQXpedKAdJXx4YxO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX3ojavlG5i32R
 6WbdwZ49oef4un2Gqzh8c+kBAjomAsUMq/RoWj5CUdiZ9GXesArOTVRIftJ9bijrI86PgwrPcfX
 BeHfjdd7GfxL92SyOlNPcaQ/7v/G1S0DKh4vGgqIGxxBsHVLArrXS7bfgzlb3UYlyY0xikamYqK
 oO1ONQCRuQnOowS8g9NRX4OCC3VYilCXlWIeRPwp4epC4IxEF1jHRhOq2lVZwhVQiliNG5SWGWq
 Lqqekfe39tjH5T2c+wa64UiwOmi7YGLUVqhTTcbf93ZP+UeTO540yrYGl7xvvCmCd9QLhCMgMvL
 sGi/XToWkUsTu7mvWnhQyzwcDeAzmW8V6AJfFEA4zpVjY61JMBYoPyaHJM9qZo0vq4jk8qMCsp2
 O/7g/cLG7dy2RwV3kyVthpq3ZFLjdxz3mX1peWAcO59PoZWeQHxY8yHeD5N30JNp6UqQPimZ1lT
 OfRL/a0dLPygwVsWDgw==
X-Proofpoint-GUID: 85LPkbULrVFfbR_WQXpedKAdJXx4YxO7
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a0327d2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rGr7YpdD5vYbGY1z0rMA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 0E2C8522276
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107105-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,aa00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
MMCX voltage levels.

Add MMCX domain to the Iris device node.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..1fcbd400a3be 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


