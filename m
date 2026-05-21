Return-Path: <linux-arm-msm+bounces-109087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAJbMUIJD2oHEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:31:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE55A5D53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1606F313FB9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A474C400E0F;
	Thu, 21 May 2026 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cas4oJEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1faG2Bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475A7400DFD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368887; cv=none; b=AeuJR4qT3eSom1aHRbYynu8Y3sJ+Uaqi2olIe4bkPsDccQSdFly+QLwZi5x+xO85vs+5MDbkj/+WKg2Cqx5aO4XAaXskJow+vISrKlB2YHJT8nT0rlvO/yvntNuXEqUVR2EKwyXsnyezvcXp0+ubatPsABWwk29dZHWUtlPKxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368887; c=relaxed/simple;
	bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oeVFmmCRNMJhMUUb/vfKVc7suZi9No9LvoYGOtmRlEvK9UEFFFJxOqptIssQOLHulCVSdUxnu6sbQHCkjCzs04BULV67LXGNHjOac37mxR5uNfBIODetNi9+HTL0aUwuhscBnYFnK+5DMChCdLp3+IbnOZFJwmWtYRQ4LMkwTgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cas4oJEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1faG2Bv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A14A3773115
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=; b=Cas4oJEi64ic3W4y
	yBpP3SctJcvv0SpbtI1SXUJpYeFS/NNip71tcB/4YMzMe1qn4dKEaWi2u0TcJokC
	7SQ4CyRPcLNV/1XtZay/bElwHD6fbrzoOghYTRDcD1vGiw1WB74xAAl53iNbzMr6
	5I5rJP/hciEb90WtYY9rdvBFX0d5eTGgmVXeHsNgU+X0EZ8pBHyjpZ+jHTdTpywl
	7jej//3zeb1xjTB0LfpEiV8Q5G9z3WB+po4jCDrICR7RbtT5qL8PDkq4ghuE566K
	l5wwfOEA66dvP/3rzhGUEV6iq4IPrM+RcALMtqR6OuWtyMrFDT3cVOCGKvhdr/BS
	ZlzGMg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma43akb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:08:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c829366cf25so9043534a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368885; x=1779973685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=X1faG2BvebtfEVvXdM2AUCdgcG4ZyA82cK89JWGImeBe7/nog88Z1/O0fbETy8sFv0
         S7VIqBoTPCGF2F+IhZE/D5q+yQ+2tO/B2dQ11ZLNC/zU36g68iEbzrJzcGVsEON8GJt1
         ZRGuxEORGk+CDcEJiHdaWAHB1t7LggDFXWPJtPGUMgCsWG2V+S4SzGRKwbloHPlHpfiL
         I50lMri9ZJ63K0mm0YUNtLdD0fMlXea0brNw3SDhHEA75vvmLtclSF3j3HFA1ucq4BE6
         HXGaF/a+IInakFeP/6YqC+UexkOH8I3IHlxrmB6RXOnuH3z0IEWCvsIxLpigi1r/eQHY
         zCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368885; x=1779973685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/YZ0aGKsLxrgGER/RxB6aF4pHWuCa0SmOkhq9nYOjL0=;
        b=g3RyyEdAbr/HbZUW/8UoiHt1aTUSFjYF1onHS9M99tycNo5v7pn9d9gSkaDuSct+7P
         nfc3hd6IRt/tJzmxnR66IePU9HFFyUTyRCK+wuOnXKCoQV7hgZtmPfPmDhuCx9GIro8/
         7xCcsK3cbe6V+4vA8XWVTf8UYRAjsB30VSqT0gEhVj2Dsb14Rb+qSYWn7Vu3aspbg7s5
         2BiqxBEA/jd1nbzhO4EpVsgQZ56T4RLTG9+f0P5BscETcaGGBa1ecVFhFzl+QJz7wXne
         lUaJUUJbpbj8wVPYPAHPjKMCAdTSukuUwZ54mf0fjRvSCsiOIHNyZJI/tFKolI5zV7g0
         SKig==
X-Gm-Message-State: AOJu0YxGcDz+h/kfBPb+dLCeYqVDxHekzEMibi/Fj8G6CsYbkl2Azjef
	4VMoQ6Ddbv++A6ZZA5wEuTWXi1zhFL0960MkRrGotlAuJwR5OCtaNt0jsy5XNrVRQNXmiNad+gx
	6KSGh2Ah9AO+6tSDno5qGi3aNZ1nzmp553G9Z4aitOwfUYbcHmc1O5hti+MotMe0Kx9B+
X-Gm-Gg: Acq92OFLZGmyhu6CitTgcnEhU8e1fcvARp5LLawapwkLyJkCbzeQ7s8L1gxDTteLmi4
	TZi1kMcu4MNjDDyT5DeB89NLRdHJ7XiwW1Q23fnOpzgkqYT7RJEMO4L9MSpNW/pVgmnZXoqqnJL
	0EAGpGWcSlz9XaCxb98kGiRwh3C3xRPGUQNPtfyuR4bt/O2kNSRTsQcfHs4EPp3boBBcAg5lmue
	y5p602mGhaF2Pbf7LNQWz3jYfO91QSaqyp5m0mT/72m4lXCk4p2ZEE1Xq+gK66ZVEOqdGN0IP/e
	fZesSxudRT82kudA05RBAxfKy3QW2kC5PYpqJbXTsBnBZHNYlDFyeUUlDzO6RuJ6zPdM5j5hKXy
	kgBNr/uNytaWzQEh7wB8ZiLu51U63O+021TaGrzMqusDuAiwpuQ+6UqyfVwHqIa4vfso=
X-Received: by 2002:a05:6a20:8ec2:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b30c285046mr2074610637.26.1779368884948;
        Thu, 21 May 2026 06:08:04 -0700 (PDT)
X-Received: by 2002:a05:6a20:8ec2:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b30c285046mr2074570637.26.1779368884462;
        Thu, 21 May 2026 06:08:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:08:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:50 +0530
Subject: [PATCH 17/18] arm64: dts: qcom: kodiak: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-17-d822567be258@oss.qualcomm.com>
References: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
In-Reply-To: <20260521-wake-v1-0-d822567be258@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=3509;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FnMF1gdIBBqzcGyw/Qftg/BoiY5xILkioEGvlCuaMr4=;
 b=sZH6QR2WouUFjJo1m46Xaxf61/naSCEHKX9WqZNiJpV1nMt0l5X1OGJO2/+0sRTGhgKOp2PhW
 V54AQyoqX6zCqfwnTJkFXsCf6wO/aGDvyZE52VzDwuuOBYYUh5J5id0
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0f03b5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: bJxn-JqwD8priPcFCCfPmSKyRQOOlZb3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfXyzXk8EuyFuWB
 0+VunsHtsPVAbi5PUKdGyViKgnslTDSIHFXmfhKgzvKlCpnwD/W8Kh9wV5xjrny3ofgITqMocJt
 G6yW2odHitG9++0bp1o889ByL6Wp3e+aigpWeNsyWF52fQzvTBVd46TWti9rh8P+tO3H8mFQtIx
 ccPpK7YhHQhzdtGp35y9epx9LsjRS2ynRED8RS44F6wVRaplyg+2KnaeBjonlIBK/4e+j1STZaA
 o8zP/C9SpECqZtBap/52YLXa69LtNpzx1+HVEd2Js5gjCwaN90/gFqZJq49xyQ2d3OX8HsAQq61
 RjHehmR2XSvl2uQSJBQadqfTJgwmAWmgAks499bdiq8A+Yit9TKx2Gu/3eUGnny/NRtQNymqKzk
 hHHWW8Dr8kWZ73jYeVYYtb3iDi/HlMHynGmKiKsWQtlMppxWGO3zH7vJ7BcqbjNjR5y0e83LZgS
 Zs70QsWqvXVcvWMwdcQ==
X-Proofpoint-ORIG-GUID: bJxn-JqwD8priPcFCCfPmSKyRQOOlZb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109087-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DFE55A5D53
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..b1ad1d7c346a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -546,7 +546,7 @@ &mdss_dp_out {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_reset_n>, <&pcie0_wake_n>, <&pcie0_clkreq_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..3a9fbef89aff 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -523,7 +523,7 @@ &lpass_va_macro {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
@@ -540,7 +540,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>, <&pcie1_reset_n>, <&pcie1_wake_n>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..e0275430ef82 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -685,7 +685,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,
@@ -704,7 +704,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_clkreq_n>,
 		    <&pcie1_reset_n>,
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..681a9ff5ef77 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -813,7 +813,7 @@ &mdss_dsi_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_clkreq_n>,
 		    <&pcie0_reset_n>,

-- 
2.34.1


