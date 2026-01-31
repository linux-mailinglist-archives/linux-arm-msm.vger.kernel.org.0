Return-Path: <linux-arm-msm+bounces-91385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJMZLvQ9fmk6WgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:37:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E45C3535
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 255AE306E803
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E262363C7E;
	Sat, 31 Jan 2026 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqgzLnhO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VEfzt2Jv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EF361DA0
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880847; cv=none; b=ejTkqtzGTwx0jo+w71QhuIJmg+7X/NjQx/zlZ/3OxR7yfOzQ5HsYwPNbg4+4sn7EPNBXJn2pl67gkM8JJc+VYS7ujQchiP4BWQIi5tACxLLj986HZCxrHTwUhAGaqdeRlGisbvgZBek9Xabu8PKs6z13OgUD0AMuoalwOK4p+8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880847; c=relaxed/simple;
	bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Atab81DwNaOhPPugMrDCat3j18R4ppTFGxIu+UPvVto76jFj1Bm/GjMxLjCBz3tfFRBUzb+IUJ5j0S76pXkhOBE5U/e2bajJmLd6bNXpM9w5p+vwsHlO5Zh1OwBNElvsxAz5T12WX422b+gxjqt79CsMXr8fB5bsRPl42MsN0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqgzLnhO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VEfzt2Jv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4bxwp1061880
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=; b=dqgzLnhOtDSbKs6A
	ldiFNFA+pqrgKaArFwhD2TgeolgjchihkbzpN75u835H9tx/gxDT0EdLxF20QGgE
	AlSHju9n7WNJ+zpMiFvhzvtQkOwJIiQJUjwzgtFptUNkW1Lf75Xx2FxzHF+VqS9G
	e1MAQCwtBNMS33w8hJJjIxgRM+0muhsd3GYB2xYlCr3Ej0bY7it8Repoii/i+u0i
	f6zlY8woYZ+ubjht3c9XeMBZn18kZYToS39v8/ph8kVT+9VfDzqu16NIoivWfZP2
	Mvsbs34yf7ujnK/DZTQhEPrUIoq7wFRN2wJ3xm7ll1r7iNrMdzzZwV6FoX6LWuy6
	XCV4Vw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avnh6ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:34:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f8e001165eso2219493137.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 09:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880843; x=1770485643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=VEfzt2JvbYm9/mjGaRNOWFT34pfLX7iQc/wlbmD+TR+hTl4ntWo9iilcT0v8eMMNZz
         3A/DbNd1RpGFJ5lHwrfaF1dl+jlm6HqB8JN/WC650QTYMhXP+FGROTuAdxd7G1u8zkpz
         SSJoo2WkPM6jzh4hIY2B4Yq1HIImm2S39Lg086u3JfUAv4IeESMsdseZh7rcC7DCB7HS
         8KD5BIHZg5F74VaUQK3mhFg0d/KDErr5niztt9RQgdJsyLXETGFpNb9KdGK4cck3GeC8
         F3a5RVUVvKSM5zSsyM02DYZWIV43OilMnvEkmXW6XySaj94HqailYTBzqXP05FuzzFso
         L/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880843; x=1770485643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=UQqz5dcmiIfE5l5NiaaRAt+EZlsh6NGFEaZAPGoW/WQxOaK12Fc3Gz/QlvYYP91fFA
         4XrEs9nxS9oexAGRB5h3up5Khg3tvY62KYVbYTmypFgt6PDLdwYklTWNLQPcxp5jDdsw
         3m9pMS2fDtrpfTc9eAecfg32K/JV8NZQdUklr0uOZa+sA1ScUyMCzbsux5ll0/JGx/Tc
         yyXCTZCPbUKjJzNYs8oYVlja0Cx3Brp5Ohqd4AffmPonq4ctbrzEH3NMiL/cbZkDJTu1
         PUkuGf744WJy3SuBkCjsADOatdxoTyuk0vzxxdvhrz/7xv6wk+2exqP4e5FwN427j8TU
         UXRA==
X-Gm-Message-State: AOJu0YwYUEkzNBhO2FMRS4rUBMV9PuCQiRmWaScfHpJSpT5fusq6nnf8
	nOcuetD9upoITDW8Ufm2lPBsXj8VaJlxNvUJ+XTpi5fyOePWrMUJj3n4zNzwlBVS89VYb7ebEEn
	1lnI4WJV1+PoifY/JY0i2W6gmeat7NUxVivvDtH6ghTTfLOABJCTG6HndBpIgcpiWz984
X-Gm-Gg: AZuq6aJrhaKA83TYEq95V0n8OcV9XdQlANnhvmkaZIFKLsvMsl+vsbsH+GVOBsJK1Cm
	GUmBkcZfWIs6kGmcnXCZzTmGX4MZCSyl7E+uMqvq0ujIpoKsOEsup6OfJk8h+AllHPFn7H7lj6b
	l7Aw9WCiewH8jZsm0vWeazRVnh5xqdYj/98OdncB5gdURs4ePh7htvRRtguDR1wjhqofybAeuoT
	AvAIGiBNXkVsqk8IUhK269t5PSqKktZODZrFsoIaqBC0IuNGco1rVhP3ubGKZTkD6LYMFhYmo09
	pOk+f5plInJAzagQUXF9Xteo3xG77AAV7Ps2DCcZqNx1UN7eBwd15jz3vJTemnsQHfT63Sb7zNx
	3jpnZRkU/ZMOC1cIIx0iyYPvhrK7ZTOD+n9/thRFIM9PkfZgxpTTVuMVVOP06uoEFxxcQzGrUgj
	tiskvveb3g4RxrF+oXTtrOqXk=
X-Received: by 2002:a05:6102:6112:20b0:5f8:e3a5:40ac with SMTP id ada2fe7eead31-5f8e3a54830mr1242356137.17.1769880843077;
        Sat, 31 Jan 2026 09:34:03 -0800 (PST)
X-Received: by 2002:a05:6102:6112:20b0:5f8:e3a5:40ac with SMTP id ada2fe7eead31-5f8e3a54830mr1242331137.17.1769880842680;
        Sat, 31 Jan 2026 09:34:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:34:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Jan 2026 19:33:50 +0200
Subject: [PATCH 8/8] arm64: dts: qcom: sm8250: correct frequencies in the
 Iris OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-iris-venus-fix-sm8250-v1-8-b635ee66284c@oss.qualcomm.com>
References: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
In-Reply-To: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz/pOjKg0Y6ylBWtl+rxPfBZQiUdYI2FzDZa
 PpVj/eR7n6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/wAKCRCLPIo+Aiko
 1ZQmB/41FwhU1i3cnQtLfyRxR1Z7I99s+iXEpuOF3Ey7f5BfAbY3gvCyhQ673lqUg50M4Pb5IgZ
 M/HMSspV+CzAeBzhm7XZzmJKk2lQsi0jui78NC1E9u54sGmlm/iJ+t3FzftAr11huEBbCuJXOnq
 Hrm9YlaUgM5lHv4q8CBbTkmjilbJmz0qVk3rPky0qZubzPtgWK/yy/ZN3O7ACjEDcY8eZBtzNzX
 2p5i6MwzHOO7MK1cpsPr4+LWxZPcQqNMaXfIFINGSZm8Cp0IwkoXdrHYEMQGoQUC3ziigVNk283
 dE8I7JXfrTNKB0gDcf/79WG3OgFVI0uofDRehgGFRNnLT7cJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ie6P0qUycXM7IRAkwlawGx943gCOzU4V
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697e3d0b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jxPhmlQz5o5YGUuCidoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: Ie6P0qUycXM7IRAkwlawGx943gCOzU4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfX5aFlHF4nb8uO
 5+EdVi/IyRvYbqVr6M9DZq/dnk2jmg4JOQPAfYTxD6ouy/6cOrs1DXFVACJgwQiI77a/hf53nNx
 KrtMq9JSjAySCp5FxQSSH6fqaIO5t7qHG3tSgNhMrlD5JiX4AK/8ZimIeWlSlMUZpBd8XLutn2p
 1OMeHsZFHgCAlbj79ceKeOe1lcRkski2yM9aCMqio0tb1pmzVH1b4kgRJYJJh+3grv2RunbnELG
 uutsoPMymqi4hoRAybDdwLopf0z6I0UxkoPSzjsRNVi/tg0hh14pxopJH9gBtsztW7sAaR7+mHj
 hCk/m61P+vs8xc4o1AMy1tWS7m3y9qVkpqycv2V8k2r8DD1bj1bUi4GhCLWCwtLQQEJX1+iggf2
 cujxzijW2bxT0DdxYT7CTQYuQIXz2ntCq6O1gyzQAZMBPlN7QZOUh0RyJKXyc9rwarFCZgLSvgq
 QJY7kTrqdO8T6H40PxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91385-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,aa00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38E45C3535
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 531470506809..21a186e199a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


