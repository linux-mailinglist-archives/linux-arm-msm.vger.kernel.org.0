Return-Path: <linux-arm-msm+bounces-97545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKW3DGIutGkEigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:33:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD6286125
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85BF030EE5FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 15:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E0B38F649;
	Fri, 13 Mar 2026 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FI4tEk7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/CC1oDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1263AD505
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415641; cv=none; b=Bkft4TtpfPxRxVI3twNEOeoKGvjl3wueaHzuhdXzZVVf1XL+n0sudWW8DsdT+ObSmMSkjuK4Im1TTCLv5vF30ELBoRENzP4R6V7Sq7EsK+7ck2geHJ27K6P+jHuWg1wB9h6BQIzFKeranfUDsBj1Ho1v0rI1uveom89wy0WhH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415641; c=relaxed/simple;
	bh=rpU4GTT/yBv8WRdeSweR2UfeIRJFBnS+/2XaROjOKIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILVWTrOFk+aulD5UCE2m/YRmDZCkLkh8dLSFzmbSd6DJgPwcWaO9INLKpko050UJNmRZhZsICOhP4Ah0SB2ZZDNKCrUn9tdby3I+OFazYg/5XgBE4+xGa/ZkUVmWyZn8zkXjmPZNy5n24SpL814pSTtkc7yaRtx4TS+Tndl76j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FI4tEk7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/CC1oDn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D9B8E53906329
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eT4b4ow80B2jlEgHujhNxN0zcBznhlyhVd1QSqClQSE=; b=FI4tEk7SxxPm7Rma
	YWwm26hDsGthdCPbKfHVNk31bb0wIjNF35PuyfNZ8sTDZGeGKAMjHfPbMvkQiFB5
	mH1RJ+THmwF2ec6FIEra/SCcQ2BMFkyho6ijjbRR37VTI28Ft4UH3jcqvAvNgA20
	jSvC6m8SiOS5ABZQgx913koo9KiBfw61cUAS+hbQWtCAmFBdebfd2jwG6cLnT14b
	xwLxyFEobxta/GxVcAqwv2mzWH3yg81F4aDLFvd+LJw3wuZ1ZqrQs8OGdgCpt+dE
	AcOsbuS+ybit0dZqj5iUCipqUGJrtVuZC4NxWb73XqpEYJFxMRAnVASaE5zS+xfS
	Tjw3AQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfqs9887-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 15:27:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd83cfb36cso1554919285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773415638; x=1774020438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT4b4ow80B2jlEgHujhNxN0zcBznhlyhVd1QSqClQSE=;
        b=V/CC1oDnOs40FDlyRi30fbildzh0hm8IO19QPka9UD3pOJnWn50kiiEvrz/qcVrnKE
         pAwz0IrnYgC7NGZSLIEmt+xJqfurK9zoUY0bA9Z1ELKr+2P5JFQTIz3HzEQ9FRwxRSDX
         Yg9tQ9QIfh8Bvil/IXDknRfWHCQ0w+mfm2BKyOho7pkZb6yfRPj0Wy/i/to4iszG6nn5
         /1vbI5qLIFHDY0+F9v1FcMX30wx+suKWV3FbrHbkq3yUw2nmJXSc0ikbMU4sL7MXS06T
         xubKgKz86abLnxXUP1aNev+p/IV7h8pb9/Y1Z++jAeMPQApAzBsiD2fTbofU5bJQZT+E
         3/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415638; x=1774020438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eT4b4ow80B2jlEgHujhNxN0zcBznhlyhVd1QSqClQSE=;
        b=EV7BAzQPB3gxLUtBouF3Iu2o0QRUWf1A9MTFHQoq7EHui3ZFhXCiYa0Inqd1puNddO
         uZVTW9V2T4gEq/9rk6ObB00b11FLBvLxgTBcZRhko8BS+J40yKVQJKEWuCaJvNLo8UOS
         QNo/L9p+Jq8KPNqd/wbSiK6J+CRyfsfDk7N4OPgHi/oWqlnjUnFOjdBtFFADxmxPWtBq
         NqVmM+4mst2aMctoWdi4w+ru5DWgZipLVVPKMKQx1P9eGH1iQxarwF/OTPplJwN1cBs+
         rphPvcIrDRdctJG2xiGKf1BjptzphexIFTVKfEUM9I4r9wUxsOsA41MhzU5UZjcQdEhW
         aL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfdiLsZqcSrdOr1msR9UuRFy2p4qZsxBRF3ZUj/o3UyxiFn7Jt47c1vFxOWTXfbxj9OS3d0/nsJDReR+oV@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMQPhRS0W2I7H0Gjq1qqDPTl3oL53/niP/R2JGk8hkVdKWs5b
	XVt+qykC+8al4s7515hvyD5G6En+ns6rN6+i45kod7ig/MvG2T/WH8XTLMUtRFZRGqSBUDd8AWC
	oPZz6xWhbVeu1yT0SEiM7dwo5w+5IUng2B7Xv7CCXksYH9Os28YULY87B/wbldyk5Yj5f
X-Gm-Gg: ATEYQzxglfZiq1+yMzO/+1xi5pOlPJ0u3c83hXtb11cLrTtEOrqzI7bV9Nq9jpgNRwB
	rYjbygr6Ab5OaMFhibXOiMJfTdVFMCrqINoU3fA3pOs+fHXxLcPIHfZWKRthAANAMCEkSdqnrNk
	L0yaxjaKVsaYuR/LhmKXjB7hSRlNwoRI60tGROouN8osQBaJo6ocbLFL1liZH33qiEB9hmuDPHs
	u2kAGaMRTIQ1K+KiG0+d4+1MAkvIaWhuQeJ9OLLqxJ+cglZK3SdgMBsfl+GARS2mAQTqwEe55Yh
	8fJXiIc8w8L2y2mvkKqZePIQNQKvACfPiRKN7oYy/9CU07elIdF55OjxidK/y8pMZ4dUbPpX3Fg
	0W1hrYuxyWcbS/pBpIKaxFNDOUMRAoB2sGt4524D+iRkIcmpKHbraZIZ6nARKhPFtuqmNJELlG/
	K9XvXKjkrRR4bZcUe+7wvOhiZ9hmK3QBhXrm8=
X-Received: by 2002:a05:620a:1a0f:b0:8cd:b317:a0b3 with SMTP id af79cd13be357-8cdb5a8cc4cmr506912285a.24.1773415638045;
        Fri, 13 Mar 2026 08:27:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0f:b0:8cd:b317:a0b3 with SMTP id af79cd13be357-8cdb5a8cc4cmr506904285a.24.1773415637224;
        Fri, 13 Mar 2026 08:27:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33c0asm1603328e87.18.2026.03.13.08.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:27:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:27:09 +0200
Subject: [PATCH 2/6] arm64: dts: qcom: lemans: correct Iris corners for the
 MXC rail
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-iris-fix-corners-v1-2-32a393c25dda@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rpU4GTT/yBv8WRdeSweR2UfeIRJFBnS+/2XaROjOKIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBptCzPbDVGubFAdB83fs7quYhRt4vbH924062aQ
 JbpmW0WV3uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabQszwAKCRCLPIo+Aiko
 1S+TB/9ijxzpDxgoqv9lI77I3MBQE1lHdKI3R9X4vzxWdqQ9o3Q7vVMy3RWX5Bdlq/Swm7sql+T
 ID+F3jbvCe4Y6NOOtU3thB0RFeA2/mf77ZVwry9wMQYC+DY3w+h6Pz0oiZyQPtvuJXhOUxVSLAW
 S5KjLH68AMWfNjVqfj5pkMnB4F3Zd7+27q199N3vTQ/Q49svcdmjg4ZfYaLSvfoDCtKk0qqVYE4
 f3vaTQdR7sMMQVUIT9BMReRzVrfvMEVch8HD59Dyup5/qph3BZW67eCZFXEmeFRvSoLsXqQYwXv
 A7Y9nQxVmCp+sUa51tw1apvNLuJwRrp2cuuG8paOOaQJXEyI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _VMUSmQRI9o8rTJQSny93pKgeQZqcKp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyMyBTYWx0ZWRfX++K/v2wjXxwR
 g5OxgV2EnUNzixyDJl6b237N/HXtzS7JE652r69RP6xuzeIv1j2kHm0/qVgeJFHJAJfQU9OWiBD
 pn8NcrYCgqYZ8bRaGP8MZhFmO/CtowATEbGiR/5rEuaREmBNsdH1ZouG1Kp6zLXvexTAJ2StDPA
 pSPOvLubHKz1YX59gM0JQxk8RB6KtuFJ+ARQ2DPNYsa/X1ivV92GCEGrpYapzZ8RUfJ3FjtH6nT
 B4Xgn82HfGvVgimmZT0QtseLFQVptSj4SXgT33R4aZ2EWD6aj7O/iaYHxFADxIL2QgiRFMj6kgq
 /u0OpO9izjjKXsKm0crZJsLTVt4KroM30lR5JCGLeifz4oyu+FOzAS4a1nQE8QcPd0euisw6YLm
 BfhdJIzJesXUeMzyLWA7kHhPNoaJQdcsYh63H1amHBIcaM/EiHMI6KQD/LZTi9ssdWdb/7LXvAx
 MaOmpaL+BcIjvQkswWw==
X-Proofpoint-GUID: _VMUSmQRI9o8rTJQSny93pKgeQZqcKp4
X-Authority-Analysis: v=2.4 cv=GoNPO01C c=1 sm=1 tr=0 ts=69b42cd7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UouAheEfswbHdU7NjTAA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130123
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-97545-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A3DD6286125
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
match the PLL corners on the MXC rail. Correct the performance corners
for the MXC rail following the PLL documentation.

Fixes: 7bc95052c64f ("arm64: dts: qcom: sa8775p: add support for video node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 67b2c7e819ad..147ebf9b1ac6 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4625,19 +4625,19 @@ opp-366000000 {
 
 				opp-444000000 {
 					opp-hz = /bits/ 64 <444000000>;
-					required-opps = <&rpmhpd_opp_nom>,
+					required-opps = <&rpmhpd_opp_svs_l1>,
 							<&rpmhpd_opp_nom>;
 				};
 
 				opp-533000000 {
 					opp-hz = /bits/ 64 <533000000>;
-					required-opps = <&rpmhpd_opp_turbo>,
+					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_turbo>;
 				};
 
 				opp-560000000 {
 					opp-hz = /bits/ 64 <560000000>;
-					required-opps = <&rpmhpd_opp_turbo_l1>,
+					required-opps = <&rpmhpd_opp_nom>,
 							<&rpmhpd_opp_turbo_l1>;
 				};
 			};

-- 
2.47.3


