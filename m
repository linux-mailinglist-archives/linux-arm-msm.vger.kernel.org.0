Return-Path: <linux-arm-msm+bounces-96661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLSROMYvsGkShAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:50:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B2F252806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 094C731A4785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85EA3C457B;
	Tue, 10 Mar 2026 13:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUa1GG6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAWqR3tv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F91E3C4566
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148146; cv=none; b=ZT5vBvmZcBSbiz2gSAQRqTvzgldljGeUeYFHAPK6xfqt6H3uLAfGrtFFZNtfQhswMfXsh792zaLXBweMRMJ6ibtls5OI2vABZEKURsxFJLbG0I2TjCVxZtHWeRCuO0TIVtDchjZ8mytR4/0TVrwt7IP8GNtSVAsE6/bqAg64ZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148146; c=relaxed/simple;
	bh=epeFhju7+aDFnufQMwVuTG39+Sk2uEMEje1WbEU1r2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p5yp2Xt/jfhrGlACgfgp406tZite8cIfFXDOUioK7tQDaK92BxA7jDMDNoPcHMqUypkEtcKEo5rHJZ7GBGrbuNtJy7TAKsfSiLo5wvEVa4NS/m0T/FkhmsRbbBiNzmWd/0fNbgruQzV5sy/bdj/jQtLrW80+RCiLnxyZcE9Me5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUa1GG6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAWqR3tv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaWqn303896
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N4n/cnHPxWjHM+LFFWE1Pa7AJc8ppj1t0Akyp/z12A=; b=CUa1GG6VcnvcgNfF
	lqiRpmJmZZ8HWutM3+QD08FoSQ8jYK+G3uuYkWDle9UnWxxltR/lJrD+ToGw600h
	b6D1cRmp83bkb1KDzD2aAMuhOZcNU9vqv08JYUQ1pO/ts+g+QLLuS7xZwGYe0P3d
	pZCIwATg8sAJsKuEOby9qCI3vLGVxqaF/0sY3p839AgZpuVj7iXhoA3oDEklCsx/
	KyAvPsRPl6UXLQc/9jhP9+5p6R2uCwTA5GZX2+5iGbPt/8I6mQsaS98Ld/S+/dmw
	VtCLRqhXFYI4H1I2gwplsIDNGgt9hZyHbrMq8CuMDKMc2KGMsMxVYpY2zK97opNp
	crk+Yw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0k9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:09:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d4cc049so2722825185a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148143; x=1773752943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1N4n/cnHPxWjHM+LFFWE1Pa7AJc8ppj1t0Akyp/z12A=;
        b=IAWqR3tvgLMzNApqB5yfLxRZ1vQgk2awYkIxn2e92BGU4oCGnfMLH89Avh4wDhI/pl
         UZf3JW0Dn09DSXl3FuZHeGMi4o4JoUkvDGeGSN0LBg1TyWk7UZaxCeZABfPiyGgwnIYz
         oiKwa3svMftGa3LLF+3xh9AuVJdAefNC2qIyp5NSnDQvvr/FnXy8Tcz06IonUjsAghul
         uLrphCit4ekjGthtMKbKhL+qOg7kjrjwBay2+XBX69auRBDw9AfxKE4D5tA6Dd0zKaxq
         YyB+hAePOHvjKVssLYWpzuE+dxO4yREHWz8QHTj2veLFReq3NWwFKrLXDZwis5q34F28
         CbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148143; x=1773752943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1N4n/cnHPxWjHM+LFFWE1Pa7AJc8ppj1t0Akyp/z12A=;
        b=ScT3pi9aQ8a4rqp5ZaKi0O0+N8Q4aFRjC781LuOoa55ofTdvu2Yt0pDBN7wQFPJHl9
         3aOxXCwX8w6SjBmvLBHPU/UXHBCrap2FFSShsiZ6CONrXr+6oxQW7X7B2XUIRiI15qvV
         CufVDENLUW0blqUp0J15PZxEMBFHXEuunxZdqdpK7i8VJaySiJZOSE2mGZ/AA6lHXvK0
         x2rLk2a9XlW6JmpRXDEt8cdVX/lxNfBqMuHrlWKul72ObqR7Mn5q+6DZqqpN5XYFoAQb
         UyQnCMg5rmhwHxBw1O0l60REgRxFlq4zSzUOdWztOhaL+HLjZrsiBDpNeCCt9b+kKid2
         FxVw==
X-Gm-Message-State: AOJu0YwouRLjtq5fpo1Rn74KXwTuuOmJHef4WBlw0bGc/lFAxWkPFmRj
	F1SZYUXgV1qDnvlNxSG8gk8FXjdlw6Lmrjp4frCIpXx+S7xANOIIdTHugoIQ6ZvczGFP8Zm5kjT
	3JuKXZFBqx1wGtylcJYpNExJ1atYBQvJIffWWiQ3kkELR1OJfq2s5Gw68fZomma/j+YNn
X-Gm-Gg: ATEYQzyDo/5Wt7ptCfFGZsZ9zkesxUzFRRhutzjnwUS/6YeqZJaB/RWr4RFPDeA1s0T
	dK+F06/UI6cusNJD7BkRaB7mGWSVDzjHx+0LVG96VwQJaoOzkaX9lgfpnfqT+xDIFgPr/DRO8eo
	m+AP3es3BHgsLdeKU5vf9wix8BHv9QlxOaPUiPcL/TKhUg/wsvLgC59fYhRlK+y4OW4nec46YVU
	KsPQbMWOT7MblfyvM1qj0IGeqR7K9XZ+IIcjj4yEryY1AlTyTyZHmhRCA96pe2QLmziOWbCR0SV
	yHNxHSUHPIcQb4y+qOf9SSWZ0gf9bfzhQZisnFAHBOm2sydz1YfdaCDTMQczIndfuit6rvgxz9/
	BLF/baoMmNjaOkTBgi45oRB8TfkRgh81HZtRuAW1ti6Tx
X-Received: by 2002:a05:620a:1a29:b0:8cd:8d50:16a1 with SMTP id af79cd13be357-8cd8d50200emr706034585a.55.1773148142840;
        Tue, 10 Mar 2026 06:09:02 -0700 (PDT)
X-Received: by 2002:a05:620a:1a29:b0:8cd:8d50:16a1 with SMTP id af79cd13be357-8cd8d50200emr706029585a.55.1773148142310;
        Tue, 10 Mar 2026 06:09:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm99472385e9.9.2026.03.10.06.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:09:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:47 +0100
Subject: [PATCH RESEND 4/5] arm64: dts: qcom: qrb4210-rb2: Drop redundant
 non-controllable supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-dts-supplies-v1-4-5071a7052ea9@oss.qualcomm.com>
References: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-dts-supplies-v1-0-5071a7052ea9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3055;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=epeFhju7+aDFnufQMwVuTG39+Sk2uEMEje1WbEU1r2c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsBfhn9OaP1NmC8o3gXRT4EaJPRfowHdDrweVy
 0v8EPjE0o2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabAX4QAKCRDBN2bmhouD
 19h7D/0YxKWM1i3to4oBKMJAnW50YlYxrzjhC6H8gVKl0o0yMowdmMFmzYuvEtk8jCwM4PNT+wt
 PS7nBK2ojHt2BI+HAGugR/lnN1MT24xOLrIMXwyGTBmgXCHJtAPPo+/9ne2inInhTbXQi4BkACB
 mCTVLyogdfixbVgqoEKJqzOuDKLEzeA4cpMkkBdFZ59416bcIxcvtFAK7i6QTSmBtzB6dt8/aua
 nCpygybbLs57w2Rsmg4VRC3lKFp1vJ4Wj2BxlZjRU4hc7BH0/5EiMeKKhDlHozOobq+qsMjCX50
 PUM8zWHp0rYKvI9OteZwVih/MCQ1evnMdZsYbocSz/kT7qn7KM9fZsc71MmnSxkYkwOKU7EIc8c
 sgMd77qLcvYWLxfqqxcL0ofEa3GvI/lxWdUUsBxI9Xq1uZ3TdBPHLdNuCCmBf0f3tSiwg3cLzhV
 8VYJYaNtLtu32795slsg5vfjLh/puLU0Ruwt5Q1+bXAtUOXMXCWPVlos38xVfn0BpUJvV5Cwp3I
 IrZguazf2IwObgaV0NW0Bw+9kFaSZZ4w0Lfut026a251N5qU449zph7OAJfffRgKOOSTP/vnP5x
 Gg1CXxhXk8wZ9RZ+cjTFH9EIqkPtPuabiJQwdqqZTzwV3hHXW8xi977QwIQ98fUuWO5Y/KfFlTU
 9+hC6akDAIYAbMQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Jy1Vf81H2MyC-3OyUufAv-WL0LTJ4h2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfX/tdYPI/OSGie
 nhh7uiiRhDjsTAJCiGCZR5wJR9oT/PZ2GmKYUA44gl9xDkCiHtDUAcsWoyZxDkdFqkN84UQPUAw
 D3jVjapAcQtc+xdPSCqIdvG7H1ApJCCFBo6j5tHEDxSZ20eq9IcxulXFZjY9xndBCtGJHfVSCS6
 o+/A9qNUhHCiUMWA53h2woj88Z4lippXLaKGt3V1X8j99UR89WQh8KGtptYNGb68GD3ALWhxCRB
 bgmtxz+bVClu/CePz/f44n0jVtqLRY1abjXVfcw4yaGhJtTG20XNSBuwEaCRtxNLUoxp7UuJK4K
 06wv4Jn4CH4gi/cmmDDyRKQoF4SEwa5r7atAg5BJZCkWc9x0hEoBmKAhIhgr+KGbmN6NmzTQzKi
 tzdWREFoUTKSaYf4bBnQ+UekUZeE5lmfhN1AJJDlXgBbG13WmWIqdaO+iFyLTJ+bWUTW0I81d8G
 YQctvL32eM0/IH8/Ghg==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b017f1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_9iiUgdG0rMA4LjK8P8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Jy1Vf81H2MyC-3OyUufAv-WL0LTJ4h2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100114
X-Rspamd-Queue-Id: E5B2F252806
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96661-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Drop completely redundant non-controllable chain of "regulator-fixed"
supplies, which serve no purpose except growing DTS and kernel boot
time.  They represent no added value and because of being completely
transparent for any users of DTS (except the bloat), they should not be
represented in DTS, just like we do not represent every transistor
there.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 --------------------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 5f8613150bdd..c2142264ad79 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -158,7 +158,6 @@ vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		regulator-name = "VREG_HDMI_OUT_1P2";
 		regulator-min-microvolt = <1200000>;
 		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_1v2>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -168,39 +167,6 @@ lt9611_3v3: regulator-lt9611-3v3 {
 		regulator-name = "LT9611_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_3v3>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* Main barrel jack input */
-	vdc_12v: regulator-vdc-12v {
-		compatible = "regulator-fixed";
-		regulator-name = "DC_12V";
-		regulator-min-microvolt = <12000000>;
-		regulator-max-microvolt = <12000000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 1.2V supply stepped down from the barrel jack input */
-	vdc_1v2: regulator-vdc-1v2 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_1V2";
-		regulator-min-microvolt = <1200000>;
-		regulator-max-microvolt = <1200000>;
-		vin-supply = <&vdc_12v>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/* 3.3V supply stepped down from the barrel jack input */
-	vdc_3v3: regulator-vdc-3v3 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDC_3V3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&vdc_12v>;
 		regulator-always-on;
 		regulator-boot-on;
 	};
@@ -216,23 +182,12 @@ vdc_5v: regulator-vdc-5v {
 		regulator-boot-on;
 	};
 
-	/* "Battery" voltage for the SoM, stepped down from the barrel jack input */
-	vdc_vbat_som: regulator-vdc-vbat {
-		compatible = "regulator-fixed";
-		regulator-name = "VBAT_SOM";
-		regulator-min-microvolt = <4200000>;
-		regulator-max-microvolt = <4200000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	/* PMI632 charger out, supplied by VBAT */
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
-		vin-supply = <&vdc_vbat_som>;
 
 		regulator-always-on;
 		regulator-boot-on;

-- 
2.51.0


