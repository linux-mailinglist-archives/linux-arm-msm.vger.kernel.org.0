Return-Path: <linux-arm-msm+bounces-101599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPSdJsUQz2lysgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:58:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FB738FC55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC994305583C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57315269D18;
	Fri,  3 Apr 2026 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsS8y6HD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLpKv8+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9CA257824
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177736; cv=none; b=iqr+n4QSkvZhmAkRnrIK5gV2fH3MIP68c2HtvfXZ9d5NU01qBsjGZl27i/2H3LJUSWM1JUCO1WeKBZ0BA+ZLXVuv2vZHG5LkdxZZpRzMexayfU4bgjCauVP+oL7+QBvIV8E/3amgJSJj7t6OXYGjZTJFLB7UvGkyNKrx7py9snE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177736; c=relaxed/simple;
	bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zv8ZqW7duOcsv/LZA1LSf+nQMzrHRNq/XSi/O07/v21C+f0KeyRK18iEnCCSre/c9/UHWI5lxRnJvWKLDHCKyLBohZLvZDWd6zp01BFRFtWx8e+jjzmENZepqxrg7R0CZHTc3XwKZ0G+mRzmJ6DFx3b9nNygBUn+SuM/MtLVrpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsS8y6HD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLpKv8+I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4Yi21380743
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=; b=DsS8y6HDOKNjt30o
	cr6feEdKADP/tip+iNXU/2wE8ahX1Ih1kKAO4yyTI852Ni/xcEevU1Y6HWhqiZLy
	HYCZqxRoc46T/t0lf79HkGsPluNdvAN3ryFkKlA14HzvOXh6AJcZdK2KdbXXDOvS
	80knjBcW0sAPILAvxg0DYTqU+WJqLSv5Nem7m2Kjf3YNV9rpXC/P6518+5CQ7K4Q
	hZdkuxxsjSCEGBD3/eWuMt7GiMOabrGWg3TC5R7vTc3lJDtwL5Vr6KWXe8Db8Ubs
	5fv2vGtahJHC2EZZ8wMLUTl4Piu8H/BMbZaYlBcDsBcN63vGjY/CI0UxLd+FfgDL
	CH7NTQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myhbatw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:55:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1884796eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775177734; x=1775782534; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=PLpKv8+IRNVMxJA3Yg0w82F37joU28TEqW4tPRvm8+EREs+4ja6HtL08dnWojG7vEZ
         uIW1PDuWAG4lzaYeLEavRmZcTHcbjsJUvRI4DVr/d43D2LPL0zawuhVP7BkSiit1q468
         vuQFCxGdCWYY1ZOSMoBcc+es+S9OipxbntaaVoO/6fp4sVxVZww7XHgDbPNRUe9XyFER
         l6OOzJKFzHQgTeP7TITMDZJyyE+8Gbbua10DAATQuHzS9+BAgGCpGquplISNcYTkf34g
         Px+dZp7ZNlLbAx3JytFMjuIf19Si/z3tQPYBEEMTE+Zu9+CBWmA7I35U2WEZnuCAAAwG
         Buzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177734; x=1775782534;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V6EfKChOv/S9Rl3s3ulBfu3o6W1NQgEPPHlL6OVVk00=;
        b=Wsaw9T0bLY+KjTFS4/dZjD6RX4Lg5hVX1hvt7sVhhkh87E32sIGjBDEyK1ZYEV912P
         PuRRoqRMwaD0Jo0aufuC8TiDDJkaWgxaSypgYGY5sxT7Mdrqm4t8NJmBJ6Ndebx+FP04
         R33fV+MNlW6x3DojsMZWVPGuaxZDxp5nBV2JDaHX81p8mLeQpo8fcpa7fnVYezw+2aCB
         k4TtDkewjIWgAvy+WqQpRsjpY40y5cqUuWoBxqCci5hNAXHbg9GXXVIIZtql14ZHCMhA
         a7iGx74v4378qfpctQjXfZeL1e+kAJWtkAX4RlxzJUG7tvD2CMNOWi2mddkZti53lMRV
         4Hvw==
X-Forwarded-Encrypted: i=1; AJvYcCWExup/tBf6SKK2qmJ+rVa/TuMeMogFtmFCnbHH1GtW+Mp7MhF1trGwKzWikBS7mAnnbovKusZZzcJN6vPb@vger.kernel.org
X-Gm-Message-State: AOJu0Yysz9B60i/N4L9TL0AA0XkOhadVWhsQ077kwXKGR8jp0K6wbQNG
	dxqHoAfc47bzAHm92si2KKiHGPExSwNQuuVcFeEsM5+zqPrxitITiph3cm6v6ALf3YFbRkHeO7S
	zsbTfQyQpxOygLRqMfGswTTz3hWzYH4ue4p9vi4c3jhAXQriJBD/qPMqbB56fuD9XbUDT
X-Gm-Gg: AeBDiesgK866sbgRJya8eRkHefSiwojgVvx31a6SrBzM37tydhpNt+RB5i2dQQ2kZ1h
	BXvorWTQPCUjreykA2IpMiEylPfETKRaagJ0noz68YEv38cIKRfC1tVtdv5UwfWRtbk+DEYezyY
	c0e3N6rYNf+/Vj9UT3Q3741/mHE8XYqFryjLmFZQOzmwKUMhDnBVojMuWFWHpBHi9j/ZEVwdNzh
	RXFs7+tvjVndw7QS2U9bxPajMypU4CQ9Vqqm4661n+9Zi3oiESTMJTOtRl2LtQljG5kWSue9KPB
	EOUdoN0U5lHrEW3FsRq16E7Ow7nunFNO0zQ9jWC0MI6rU5VIUjgFeBpPG7bQX27Hl4CG/rjLG5j
	L4qkVOr/XCZfhqcpqO7f0VVhww4M+I/Ink47rMUNreRzeElfANoeKTYnnSdNenXY8+hXsnYh0MA
	==
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr646945eec.3.1775177733757;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr646929eec.3.1775177733228;
        Thu, 02 Apr 2026 17:55:33 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cf010d7sm3750800eec.25.2026.04.02.17.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:55:32 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 17:55:11 -0700
Subject: [PATCH v2 1/2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Hawi SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-hawi-spmi-v2-1-0bbe811fe3f4@oss.qualcomm.com>
References: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
In-Reply-To: <20260402-hawi-spmi-v2-0-0bbe811fe3f4@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775177731; l=1247;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=/5a1m6I6NfJxXWkBlWbrgm5EJvWmpe+5B0+24yFFvY0=;
 b=8tUP/lj5kIW5Qx1PtF2E2NkQKOnkUUclvEoipxhnLMFNRTNqygE+3e2VF2k2doUJfN25msUuX
 iFiCmpXNq4JAuoKcU6r1TBJ/oieI7VaDMLBSw9tev6bwE47hyVYrI/R
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: ajuXWg9sUpalNYneZ_799NLIHUrnIKtT
X-Proofpoint-ORIG-GUID: ajuXWg9sUpalNYneZ_799NLIHUrnIKtT
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69cf1006 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PsuS8QLcD5ISLKS92A8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwNiBTYWx0ZWRfXygTsf412+eCm
 9z/h45LHSOnRjZPvig8fJPB7/h6/FEH0Pva6+AkGbVHfqlFWM+i2TSevG4NAJbrjnnDWsSXkCZ9
 r8RYzqQsDmUUnNWvX69s7eE13ur9Cf4uD+S+x9Ce3oad4zYW3AA4gnq6ytU2SD2H8TNEclKDqwa
 md76rDpYiEfuJbm1NYltrHc02xvC4B4dulxoz0gjNG9PuoR4aA7vu8ZOd92jSMIAMPr5YLWwYpc
 +x3wqfFBLVCmcOGcMUE6pqiIXwTCt2USrMEqG157TQ1zuwA4Z40vn4UxEfsBUYw2wl56Ucryjeg
 LT3wS3GeGz4RMzzIiLMlN+TuOvNCYctRWkK2/rR8WcoKM+teyt5WW+a1AGn4DAIKf2O0WkYa/Ih
 BYxlKJKRWbASnksRIpk3pBkd2KQzRdTPzcNeB/zxbsPtpG5KjEedUmh9WHZaCC9bM7eQNluYfqZ
 1T0Eq+MNuuYowZPRj+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030006
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101599-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1FB738FC55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PMIC arbiter in the Qualcomm Hawi SoC is version v8.5, which
introduces parity and CRC checks for data received from the PMIC,
as well as NACK checks for command sequences except for read.
All other features in PMIC arbiter remain the same as the one in
the Qualcomm Glymur SoC, with the only differences being some
additional error status checks.

Therefore, add a string for "qcom,hawi-spmi-pmic-arb" as a compatible
entry for "qcom,glymur-spmi-pmic-arb".

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
index 3b5005b96c6d..1593a1183a36 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
+++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,hawi-spmi-pmic-arb
               - qcom,kaanapali-spmi-pmic-arb
           - const: qcom,glymur-spmi-pmic-arb
       - enum:

-- 
2.43.0


