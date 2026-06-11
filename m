Return-Path: <linux-arm-msm+bounces-112592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sup4BbpFKmoblgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:20:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450866E7DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:20:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p5PpCGWA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S0vvu5pU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112592-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112592-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 089A6311B7C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A739137DAD6;
	Thu, 11 Jun 2026 05:00:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A5374E55
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154009; cv=none; b=h6ocC4RCiPRxl/8GqurjpcmTkziCdbSvVF/ivm/KMM90JPDv6zI+iE4wnAjiaTVeddC98bEiIJr6nqo2GpqEQ2rmapagfTN0Y85FIu76tFwO/sXT9HXTR5zyjQzgx2UMZgsEnO43QO20T+78k4vh61mnxXF4/ZqKhumUxC4U4Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154009; c=relaxed/simple;
	bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEq80VScmc6UaIHbD/CEwmeFryNWJGx97AVa3CpQUfWAhJSoCsl0n68eEMDfxrbGa9qdoQUt+12drzu1rkHtqGDE7CSYLlRc+o2MSdO/wZ8TMk8E3YJsNO+GgXqjcQn2G3h2OXP3oVhVNTaDKlCuPiV8Lyc/iRgFim+DylP1XgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p5PpCGWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0vvu5pU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nrfc3233551
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=; b=p5PpCGWAMzlK51sK
	FwvuXNFjaA1D5gKuOs35ui9qkLO+OVndgeTiP9LuHquvZkAEGftZALkqFJmBlEbb
	mrUFt7/BZ0kSNTfDriPNjNEZEYazDpOHM0hkEuI2q6PUcInmiMTlnTaaA8qiQC/B
	wsrdj2GUg3CVzx+PdZj5KJlKx0dSC3erOrM0MF23O31MtU2AYeLYhVP8/sGz/g6V
	N+V5FHEE7jYGWsSNmQBX5qtrH5GDDVE40DXbL26bWj2zR4uFQtg9duWQI9C0VhdB
	70qa87refKLPAsese2ESCPRpHNNuYE80wvM7XmiKZTZjnLXdkL7aD1Blx+OKMy+v
	fk9wDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6shq22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2b64850easo36765435ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153995; x=1781758795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=S0vvu5pULF1eYrf9oIUkakcqJ2rl29+ZiNtUgIIIlmtGUCPvUNcvpBOE8lIXVPtE+9
         7XwXXY52wQ7NJKY30I1XVxe3/IJFYTTsi7M7MxsFCNs22d+ZymcRWGjRjp5Sj4Iam4Zc
         bQxwek6ckktgEqa6cEwes1OuResnYu+vw4flAjCG95fSki/UkAP5LBN+eYyI/Nx2g+Sq
         4g6EHVTkYR+dpL7hYXLhnZa59c69uZRUPepWcuuHjC2fIEb+WlWDn8Fj53HKoSP12/S2
         65EF0G5Bo03uJssOi5q1F/urpC0hYhV2hQrN7U3QVmyxTVYVqLZ2MAh1NqaVRzslbNek
         cDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153995; x=1781758795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dlWonT1sReFuMfZlXqZdPASivDsrTwJ1EUbnVN8G7rg=;
        b=UrmepQw+T26RqpyuUbefXEC/hc4krZbZrt97yAJBMTrGkWkIzE1Iu6yT5OJQt6noTH
         kHkJMJZJX4Rbaiu7j0ZBcsiJB+tD+HHFdNs8YcyCwxjVk2jodk9rwnOel3dx4+Mgg80W
         mdONdv7dYkirdi/S0H2GP9fmvYkAQ1dnUh1pTekavoBIyKmNT3SYLK+S+p6MHgq8Gbyd
         qjwVZ4A8+2ZEoev1m6WmlubAcd1BlDqDl1He9U3lCuXpGO+yw8WR1aFSzvJRbN94i/U9
         IESSo/A+FwORKcsDEp/RmwD+77OYE7vxPLfDIOtELefkj+hQ0o9eDLLjqgADVEZaeQOy
         bNxg==
X-Gm-Message-State: AOJu0YzmevNw//DPsfPcd5PiSPL+6S7vahTg96rqhkslf91Afe1mpWaO
	pYU7q9XIYU6BAVIgnm9goJvfFGxjRo/RKohY5qW+8dy4SLkcdfdV4b5iDvB9RlpJ6JMg1LMyxTR
	ZTiaqqDSmwKGqUA870gK4WKjYd+QaNGebPbXpAA88EF5l4LaJt1F+s45HIyOfcOTxI/9qEhvCFJ
	cN
X-Gm-Gg: Acq92OF1+TpCLKwiVa3qOgub8wxG9bUSMA/BpIwAAI7Nr9Muu0uqDX5WsBKX0ltN6GZ
	9af1+yXZMbgZcNX6s7JfY9mwZ6rUgqdOyNkWhUGtzsIDbAzrVCws8Vrn0hYpVdU+qZHdtZ0PGld
	VX6VYjmKhhz+Rp9biqBAs1JdlIfWpGxsa7LMRcxU4FoYKx3mqBNv1MLnhZtSJ+ZgyhaaGCZGO/U
	QA4o8HmIjgA5/B34TtKGs8Hnhf4jQpaWcOLAoJUeZfhzaq6OZW4068h79K0K93D1602/E37iQLD
	ofMTjiCo97yOGpjLiIn56K92/M4UXy+4jzU+8/r4qbk1HWR3xwC7HuSQWsc4TN12yNk1AKJ94R+
	+7arD8iQvgn55F0DNybu1WATjApEDpVkX10Y3fy7uB4VzQXBapwq40oO697mXuIE3rqM=
X-Received: by 2002:a17:903:983:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2c2f23a7328mr15034405ad.9.1781153994668;
        Wed, 10 Jun 2026 21:59:54 -0700 (PDT)
X-Received: by 2002:a17:903:983:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2c2f23a7328mr15034135ad.9.1781153994198;
        Wed, 10 Jun 2026 21:59:54 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:51 +0530
Subject: [PATCH v2 15/37] arm64: dts: qcom: lemans: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-15-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=yeaV9sJqN8fsZTYxfMzuF7Ab7IHMyFVmWwQiXiHWSzg=;
 b=LmgkTkzUvDAmQCQl1RiVbHEPvZUZ7pC+Cqu0xRCsZE/yiAnlwfaFnwRMehLwbnB4E0MdzCHD6
 OirR7//cSx9CCVRqtmLwS386uKnEjPzviyNGUCR6YdBmCvkU0rJdxHx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 2WlrN-TxZpdnR7yg8r1IzOzg7AIjLlDn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX2jCQHcC8Ex7q
 zRQkXbekYumdYTyMuAlXPBzQJizSQtjaCYtF7twLU5lJ9HSlFFhhvMhVh4IK1MnBjwZT/WYbgk5
 BMpLYdVu63v17Xgn34oOOQfGARYccw0=
X-Proofpoint-ORIG-GUID: 2WlrN-TxZpdnR7yg8r1IzOzg7AIjLlDn
X-Authority-Analysis: v=2.4 cv=Kux9H2WN c=1 sm=1 tr=0 ts=6a2a40cb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX688gJFcEgFCd
 QRQgeFSYgKe3hiWBB6hIOaLLTrCdupfRseD8D9rfSD+Dsb4YBpHpyY9XWPHjArurxcYMHHzDVk6
 ZE07BwfONEs7Gkjxvr1RKGWdJGAKGT6b9BdkYRTH7x8Iusi2esuNhYoRtz/BOVrr+aasv8Mqj7E
 L7mhS5B3ME8ZHS5NwvwNQiN3iPICu5ZeLJgkW3jdm/jmkd5GdI/bdFUKIW1B7llT8uSwjbBNoSr
 luZQgDKF2YEoBxyDAnqMzmNhRVsSqOt2Lnu6nkbc/agL24T2FePZ2LjncGaNhOKzj4i7mNIx4WF
 YfHu1FcgKUlaZCKgVl0LEGBmnahi1vut+TVuwHz2ZTxPc+/UOemYN9z/efnONWluDLQ9BJec7PJ
 ujC4JasEu2OeKoawDFDzsl3fSPspEGbeEflN+dkvFSQYKOWp57eWELQgPVnwIlnjemiKu6WuAGo
 pc/sFGoGK9fUkkIuDnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112592-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6450866E7DA

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index c665db6a4595..fe9a2cd325d4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -703,7 +703,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -720,7 +720,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 31bd00546d55..3a6d73b485a9 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -854,7 +854,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -864,7 +864,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1


