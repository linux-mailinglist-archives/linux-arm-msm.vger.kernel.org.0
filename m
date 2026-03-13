Return-Path: <linux-arm-msm+bounces-97548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oASdNgQutGkEigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:32:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 795DD2860A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E6C23032760
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141FF392C50;
	Fri, 13 Mar 2026 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eC04M2DF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuqzzHr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B433B2FE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415646; cv=none; b=lP5VDdHNY9nQq3pb+Jc1dkm4yXsawfPRZyoSFSXhKOR40rUivGbaglVuNQVX9QgbHN71xQHdiGqVrU+kCWYQFs2gGH93QKbreHFs2co4j4wlbekKYS7RZVXoaBIbXPss3xG33rLYJZ5x1RgtQTK0DiNxKGaxhLfA7UX94WJTMjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415646; c=relaxed/simple;
	bh=cEiFtTK9CGWRlE0jyNb5A5tA+7r7sPf024l/M9YIj28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJK4DTYvDunKDyzOagEXrywzRl3VtWU0Q7G94pd7KZN/ikJsZyYt11zAsqFx/CGpiUHlRblU352eexP4BDgHJIR/k0GAWnYiL3n/XOBHj4+wwq2IqvTJfo0exCpsr1sXAyoCudV636ZiLpfYLwzSBmLVJuSh+pD7SUxBEh6fUrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eC04M2DF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuqzzHr+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCWuLs3342514
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABFpcb7W6o4PCW/sW6jq6M5EAgU8CnIQjzMpLoYflR4=; b=eC04M2DFKnOfSppV
	E7GJnUSfy2EfqlT+lLfR1vC6iSqVrMcP08B7uCC6rLEpAcvMEvR+QoZ0WSsbBxtr
	7/2NdSubeU5IF8eLlkE+avWG2C8FA2+6OgV+AdS6SWM1ofhp330X3t7AT2rMR8N8
	sCkrlV5v1SMBVsCbXf9Q185MSjs8EVMsQmW+haqkdCzqdQEvrbQ8TGKdqgkNgNdc
	peUrnBZXK5YWKpCl8oMyINhZtqsHmf/UuOcNW99dXX1zDQhNG1GPGgo4RQ37IKUf
	dkzVzvCnlsHd27zL6A/ohi4+te5brkO2OgT4BWcy3fP4+G05zW00hwnCcaH/3GKy
	UZlSAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w5dea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd8b37d4b2so1670791485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415643; x=1774020443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABFpcb7W6o4PCW/sW6jq6M5EAgU8CnIQjzMpLoYflR4=;
        b=YuqzzHr+hWHAhbfQu/BqBQewmAGTdXPR04QcqfLISVslmVL9pI4gNiNDJ2S1d91DeR
         d6TqLGNv3h+0fRp33/u0tZazjraBsS74fwUdeRL2v32F5cpj4lwq0hKjtUtnywEx4vez
         9PCqzLj9i1F0VgqFP8g7j4kXsOpuN/y1rjFDyvEGv2GbuyYdM7ZvIvN9FCrPA4wXrkOS
         vGdgQdQmvwat4OlRlcX/I4QsOKBQ2N+6TbM3UxxLTCx/rCzaxkVgDtgeFaLzIdH7f0/K
         NOgSymrNe4BIjOaNdoian1BNYfz+sylXvFRrMIovybdBmyYzndPcCyWgGlLM4MD2cs67
         RytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415643; x=1774020443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABFpcb7W6o4PCW/sW6jq6M5EAgU8CnIQjzMpLoYflR4=;
        b=Z0r7w4PP6rFwwJ4pspKTrftZnAct1SD151JAuZSOG9UWz5ApesM7GcS3vZmrM7iBGa
         6M8wZ1oJIyz7e9wFi5nOZMXuY8FrsNN96e9MbfjAfn7a0mXQwHXfJC6C3QBIWdQcAtv7
         M6S1GsFj8dLSm1Z5LjP/ymtolAvsp70Q68bF/wiFhhcanc1OBUAzErJ/G1JyWwlhJOKF
         0vyni1RWDCDOL50VN5EdJb/7Ko+0gFVUKb42Kawf/anBlVUoW3X+Ij7gIHPv/JsIRpvj
         7KrOjaKMhboUQyH4xVp7iypyPx3Uv7FPTsdPM2EJJuMONCYWNaxwGJMxuZY+v5fY4vd0
         rY9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv3YS+3aRWHbF/JwU9vEgtoPMt4pHaey9MgfDVJeljZyMjPtKIPjc+g+6hwm5B1SMF3jGWLtmUHbrQ0ith@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpphLZetHnEtKKU7PBd9sJl9tYXc7zBYLS8PBg9s6wYxghsmY
	GEYWt+YUVRIDDJtG/1QcrpbPNceXMgYoJRSvBGlCtjirg+u0F16L494q3ZFNbFJxyFl3hT0+fvZ
	hbKxVsiQ+x6KabxMm/VPsIivK289wqL7lNY+DpL/AWAnPgyk9UXKkzPQaWQhvl4Y+nIHL
X-Gm-Gg: ATEYQzzzTnz6tPR0ABfltCkT/wYeO8iy6DqXCsPC50Cf6FJ+sXSwfYa1vdRWQCdu4cP
	BQxDEUYPmpBMqDkOsKRkzF2TMoH8d8wbgPjkl1RhgYWNu2zH17cFnmkJyncXb5R37ULNg4CJInK
	JcIzbEevoy/SyPF2K1IkvWecuTT8PA3kTn/fd9Xd4yJ7hmoP6bEOqhlHReR2YhdDkP2CWtxp4wb
	hWPi23mVv6Pcg2aMT8zzDLseSka8cimkIpDoic1tID3SlXBYkyJNMbkXneO0yr32CYjqUVnzgpc
	m55c4DWZ8DJvwh8J8qguQXVOTiw8ZWBYNyvurQ9cVvFFx6DmCcW3dxExu3QdyvSoUIl0mHWdxnG
	cbpAH5057eUDdp11r1XJ4c8o5clQqXQFKgbvAPqVRzFrPX+rtp6gMwZN7lyDAhevXt+/yBEyHtU
	5ItbHmxBhuIAl6xXxPwKsOfFNBRXxevO3ySvY=
X-Received: by 2002:a05:620a:4691:b0:8cd:8f94:2595 with SMTP id af79cd13be357-8cdb5a69638mr448818685a.34.1773415642646;
        Fri, 13 Mar 2026 08:27:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4691:b0:8cd:8f94:2595 with SMTP id af79cd13be357-8cdb5a69638mr448814185a.34.1773415642004;
        Fri, 13 Mar 2026 08:27:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm1603328e87.18.2026.03.13.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:27:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:27:12 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: sm8650: correct Iris corners for the
 MXC rail
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-fix-corners-v1-5-32a393c25dda@oss.qualcomm.com>
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
In-Reply-To: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=cEiFtTK9CGWRlE0jyNb5A5tA+7r7sPf024l/M9YIj28=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptCzQs/fY4RW7wVPrb/WJf3b+TBnSef0kQu2bY
 NJm+3J9SbOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabQs0AAKCRCLPIo+Aiko
 1Q/FB/4oHpJS/wArW6wiv/w/UkISHjFJuOd7ddKKrOKP2ZUEMGoFaQpDUK9GY1nIg88QotsgUZP
 FyJdifJvHOjTY9Ofexq2tSdqtcMUsLdNeea+fXWacq9s3WH4upLxXWLxN/h0WykQl8dIug+ugP8
 t0lhwwmyozR/Z2tEcFB73iTJQOglS5kojECj4JQ5iHoiyML8TaF1YUy+qQUnq5RZMbmcxd5UWLW
 XjJgaAhZpxahZBAkEIKAPnUy910xUaT+VwVsWZ/LTRrXD6+SHJ52aC5vmHRRxXQ2TKSOzNmcnBM
 iTj5ufSDsdd0quN6qnUg5PdAvD4Zm+FVbKQql/RUw3xpXxHA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5P5fohjdbNpzpBteChujVlUcdXbNKwaX
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b42cdb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=UouAheEfswbHdU7NjTAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMyBTYWx0ZWRfX2lr/I8ZE4hzF
 prn5uqBO4XZQjK/LyMgnM0c+sxTkKq0dvKcUp/W8FwKl2ecRg/mC80u/AIYwF/lLI1xZG6LIKBb
 J5+TE0Rcv1BO+KLrAvpQwtWI3Pkpi3b6jRIqkk2zlf+icH8rjG435yW7aprMPhphSw/Oyum4Xa7
 pvK9bdd6gaW/4bTz/d36nBHqb95h52Pr4b7tI2otjvxmSKFnc81FHJtJrF+v80acanv7uevQUm4
 Fv8pg4dAxCtsy/X+3y7LsfI8iqEn1p6BGgDlU3Dp2GLS75GsTTOw/v9XQmD7/+QmY4TelKz54f8
 VNKsNrOfVic972RSWKLXqXeWmKS8SOt9xaj53Neakm4nkRPzK/tpwYJQEndsb11G7Jdkh73NeGS
 QouDfU/7xpZBl6fWalPIcUlSXjBZPaItMJwpgBUGSHw9fr4rOqdbWavaWyA3Jpg8DPFGdKnT18c
 bUpyGYvjmJprwajAtbA==
X-Proofpoint-ORIG-GUID: 5P5fohjdbNpzpBteChujVlUcdXbNKwaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97548-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 795DD2860A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
match the PLL corners on the MXC rail. Correct the performance corners
for the MXC rail following the PLL documentation.

Fixes: 56cf5ad39a55 ("arm64: dts: qcom: sm8650: add iris DT node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 357e43b90740..9437360ea215 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5236,13 +5236,13 @@ opp-196000000 {
 
 				opp-300000000 {
 					opp-hz = /bits/ 64 <300000000>;
-					required-opps = <&rpmhpd_opp_low_svs>,
+					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-380000000 {
 					opp-hz = /bits/ 64 <380000000>;
-					required-opps = <&rpmhpd_opp_svs>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_svs>;
 				};
 
@@ -5254,13 +5254,13 @@ opp-435000000 {
 
 				opp-480000000 {
 					opp-hz = /bits/ 64 <480000000>;
-					required-opps = <&rpmhpd_opp_nom>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};
 
 				opp-533333334 {
 					opp-hz = /bits/ 64 <533333334>;
-					required-opps = <&rpmhpd_opp_turbo>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_turbo>;
 				};
 			};

-- 
2.47.3


