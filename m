Return-Path: <linux-arm-msm+bounces-109963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ORDLMW9FmqPqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:47:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A565E20E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E63033019D95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA193EE1F6;
	Wed, 27 May 2026 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVGn5hYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAuguvDW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962603ECBFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875062; cv=none; b=m8gq9sU4UE+LDqYOjusHfKomkX2wG8jwF24NfAAvrbXzAsNRCIrw53vPXl/dVZ0O7gxNd4FAAq7iV2eF0DCP8NSqkEkBCGEKSDf7CZVq25OmFgUEZdCMGV9PG6xfELQc0N9Dl4fM6VJICiSsUu0Hl4By7rGrJvy/kF7l39AqOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875062; c=relaxed/simple;
	bh=J0Pz69SiuwkV9OpijCO1Zm7p7PT366AV5p1CHeSthm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLZP25XKdqoTudjykufKcsPvbLl7M0i1w6q73oz3trdN0JHO8+fzn/yePg6lQfrqX1Gt2bF+7WOQ8lwXthEURMKNaS44ovgqeJYkAwYqAmtILC0bkDJfRONzVaVMho+i29jzRkH0274VtPFycT7AvL78AiJFaVD01IM+wimTvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVGn5hYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAuguvDW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mYKk1041506
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VCYprI2U0eD
	SCldWZm2FHNdfXyYhAER+hkaVBPnyo3A=; b=cVGn5hYYuJAzBC0TwHVSLtwhdKK
	CqDa2RpJArleJZETKWPNFX0tCSY3XQsue2PDWx4yTly1LE8i09B+KPaEHqPBSqCS
	a/l2dV1UVGt+fQ36KWYf85DnkKl7lY/e5BpayhCONfQN223sRkhiKvIhQRKK1yFQ
	iCUmG5z6v6aFZp/jTIhi4LeTZVgfVb4V+ENe3j2YixPR/MsxVPZcqd1Iu92yj9kD
	Zr4bbhAIsd0xAcxCuccRfjRJrK7b/E4E2TYeYSjOFx+d0uZG9QR/D8Fjwd21tX0i
	WZ3Ce7HAMFinEC+Y40OSc4qzOo4MlQ+iuJqJqu7SnidaL2ZQW8ky5bd/+Tg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh17aqhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:44:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6aeb3637so266840555ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875059; x=1780479859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCYprI2U0eDSCldWZm2FHNdfXyYhAER+hkaVBPnyo3A=;
        b=SAuguvDWv5jP+3b8gOBIOIP5+7dv+38jvhNMk9VXaUHo3Ik+r1csSD20tb2mGX0K8u
         hWgsSEe/xS61G7MYzGHxpkxaP01KiQiDGF6Dh+osDAbSYGnkYG7jV7YNXvU4s9Y8NC2C
         O0kAMMVWwo/Xn7JuM+54JwapNudd3wFV6aShbsKGarIHezE4FDah6P0itpxDRB8lGbXz
         BZDIU/09j/8DVzy+k8HSdIQzB5ZVRWETpDpdwzqxemfcSqxm4NeRNT3B1LBJHMlL84Te
         43KBr6yjkRpvByoErJ6HBABDIr86AomXHrn5xkW3T696zG5voKWYZ8ekDIE07n6EWcTW
         sLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875059; x=1780479859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VCYprI2U0eDSCldWZm2FHNdfXyYhAER+hkaVBPnyo3A=;
        b=CcZX6MZ7gAQHsrgef1cJGwvQ1jd7Zs/K+pnq7kSN4hkGDWEQ80hM0bxXElc20bM/4f
         xPofO6QKH8Y6cLhxaR73qWU9a6pro+SBrFRpRkyJnzT0NJ8XIPx44Hgf+ktdOEDlOcsQ
         PjTmGvmpqkRM1zDtg2K7cYnBL1mwrrukeuE15gRH8wKlC3ymT0xUKEsyua/b6j9y5Gd4
         OSHnegt3rbKwuXHtx31sa6YscMkaNGLBN7BJowzLWy5K1UUM68H+n1XSrUpHwsvBs1JT
         Q7j4gZq2LkAuIBVEN9H89FgqxSrahiFvXQ4Z+VVXWVxlZzMVkdCHm6m9s1MEHbEg+eFi
         p5BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9BWowuuCyf7p0BMLBgTasmF6SZW7bIQasCToo+vPjLf0/2Toj/EW/kjX6HS/J3rRqS9REJ1eojCW3Un3+N@vger.kernel.org
X-Gm-Message-State: AOJu0YzWAtFHizbUFX+Ms6E+rk6Ru4KdewPLbZecyQiWfq6LxcOXpCa3
	88r3ZtaWmotI6c1VIx3Hj0rRduqhgRAhJcjQBH5Lwas+NT94Txa10hM6l/AhJUzyTUXbv/4Ilrb
	gRChDbIhBkBAiF1uybKhJhARnA+f2vaV6fiazqbcLubvaQ/djDEumqnQK7jeeHqApYuYf
X-Gm-Gg: Acq92OFDeI6pP6i/GfwwVK+rqWMG8nsi07F6ZfFRGlHY39Q3lcNk8XTqOoPKYhpPGST
	3FFq9QPHxaxl6CkarB3aROIicOJRtQMRrNEbPSgRZTrXyI+eFwXTRYAbhymlfaqQu6FGJApkHFT
	vUb4KIbS53EhPMXtRGVYTyvFr4zrP1dvyLJ7GJFoWJ5p2MIT2Z0pC18eb1KJXd4V1f95Kdw7SmT
	w2KlvZFq37qjAmDjsIIYtauXL01swlIbJbfpQngBBMx2A+kMtcWvRvDtDnzZo8tT0l3lUX9Lyx9
	kluDtlkzUWSs+tMKAz6uijkeW/h9pFjAWOZ+7eGbVxma//YFGCeB3/LZUo7rCAhEVvOA27R+X8F
	RaVrWdTuzTM6jxtPfxl8WTl80ynicEovmJ+kxgW5R5KQXK6za
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr257340935ad.30.1779875058484;
        Wed, 27 May 2026 02:44:18 -0700 (PDT)
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr257340605ad.30.1779875057976;
        Wed, 27 May 2026 02:44:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b386esm154738185ad.44.2026.05.27.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:44:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 09/24] arm64: dts: qcom: sm8250: Reduce OS PDC DRV span to 0x10000
Date: Wed, 27 May 2026 15:13:14 +0530
Message-ID: <20260527094333.2311731-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527094333.2311731-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e6dEc8zc88405zbqwkxV-3nS5STWQxXO
X-Proofpoint-GUID: e6dEc8zc88405zbqwkxV-3nS5STWQxXO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MyBTYWx0ZWRfX2tt3UzQw3xla
 6VlMF7gYrs57i1REQvX1x1rXcq8EOAtgrgcrqL/E/3f3ECQWnq9TbFIxoQx9by4IchmdZlCDPPQ
 1sV+iU8FByjCL0In4S+1f3bKRFthdvOyxG1TDWmpFmBiSPf3jhuyQF58P25fITkUYZjbsoj4c4G
 Y0QKD+HEQyoLDMllNoYz1RO1UsYOIzYo8aT6Lhvb7NTmhnJS2KjxLOXj2D+2wJcZdz7RJYqwkZs
 ZfKOvDoMFgiMn7wbH/NEatyi/gqaeWa5+xieln/flgsAWMkqcl4qoGXlCOTSIksWDcFk4cfoAn2
 ltcz7ko23BMyexhGgF+wDErOe+gQr9BeqS5qGNQo9juDqbA/ky+pzvh0udZfMgJ2Yh/dTyI9qHO
 YDTtBEh+tMW9CNz2Q12D3MfpZs/IuZ2pFjMnYr0MRQ6TjknVtQwiraCDJcBtuU3aE1IDJitSm6r
 gDftrg3V3Dzqhuop1vw==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16bcf3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=XEim3XUm7E7NZKULO20A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270093
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109963-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,af00000:email,b220000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.997];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0A565E20E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OS PDC DRV register window on sm8250 spans 0x10000 bytes. Reduce
the size of the first reg entry from 0x30000 to 0x10000.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..23aa483e5c43 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5053,7 +5053,7 @@ dispcc: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
+			reg = <0 0x0b220000 0 0x10000>, <0 0x17c000f0 0 0x60>;
 			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
 					  <125 63 1>, <126 716 12>;
 			#interrupt-cells = <2>;
-- 
2.53.0


