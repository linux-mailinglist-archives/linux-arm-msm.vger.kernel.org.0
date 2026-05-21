Return-Path: <linux-arm-msm+bounces-109072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGATCtYGD2qFEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:21:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F85A5A6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6603307C188
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B14E3DA7C4;
	Thu, 21 May 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agWj62CJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHgDGT6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457F83DA7DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368828; cv=none; b=cCbj3KK93AY90bkvcgtay+eLX5kX7tfCvs/wRIe4S1s0M+Mq+S4idPR2Q/4YJvR8/WBVdXwt5ziWd4HBFdnRZZMqPqTWcL00QG4ND+Wl5A1Mh3zcAJvSRrtFrR+d/drj1Rpl+bmclGPakEuY4g2S4inNyfOe6qC10eOtSMiRXJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368828; c=relaxed/simple;
	bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dv8WhsUQa18KWtNu1ONqBhYybRfE8V8LC1iIn632/bVbJA+UJLY+cD7jPCXflKimzqMIlSUoMTSOO+RfyeTMbbePUy4enhAyT+SxTI913Dkf5K0PmSLLwkuhPJwJ0nru2QgpCksM7CX/KoWFi15xNeYfGyGDV5akLaI6UjIMZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agWj62CJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHgDGT6o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99vjP2491830
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=; b=agWj62CJBhtLkUt8
	cG1gco2GC+3f5EmEuRhDwJMDjYLBSsFmPvUNb5vb9nTAnGgf1sXZeEM5RMvIw7VS
	l5qUX4V8HniolukWvnOHuLSAZbqKUhuAa+tj/C6DOEdHlQRQqNowR5dswkajC7B8
	9DXooHSLR27twsb9njdOLrK/2VAmZ+IMmvTcxxIu6SicZZV7P+hkPlyfvHqqRI8Z
	jgolys73R4fgv4xTNNcRiYEtBSnRn8CbTNghLZH/EWCzacbX+hnJk6tEXW2S1ZMo
	/SCRaxjbOGAjYSOIPnEAlOZXsZHSYHRtPftSLbyADRlWN1htWH69tdAuUdTJG8KQ
	fVmKqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j5394-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 13:07:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so5301113a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368826; x=1779973626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=aHgDGT6oig3SmNUYO8JRwj30UsJK/H7+pN9a6CzggXuCz9r6JR8Z2+xgeuHsXOn2g9
         WIgGrt80HRoIIAnvqw2Sn4YOKjO35dfgh+VIwfqHjIycBjSlegwJ6mHuqDUBduYcbTqZ
         NA4Hje3ubJR5azNsb4WTRFOWeCVCg5DWDs2Ur6Z3avMjiQ1g+1jzFP6ZKgUZyjr1luZH
         Y/EdY8H8GooWUhKiv9SauBn2/0+43d2QqRuLyyi0nfcqrXKVDPuPS8Dy0qa04dGWxZ+e
         nbmGN+H1iLbxDtaDxLWEz9588nWgzlb5vr7TDx+6DHPOZ631VqK3sECtqKrayrYh57Dy
         ic0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368826; x=1779973626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4xEgo8KFQzUOZK/g2YyAF9vBNnCJ8+gelSNfCLkmzQ=;
        b=VbZbqv4pMR1guwqbcOySWMAPcR1x1im9JKvZJpUHVJD3GSRztgL9Z66N1HzN/lSxhi
         KvQztdGknCc3MM2MQe2ekBcFYHmQAhLFo1kahNKLUZDQabTkzl6q5rkG+A8o5Ow+HiMI
         1ZXK4YsP3tUwaNkdlDGxkurweG/VTfCSQgENSC0xAtxFlBUyo94wsXSUzcLPvAtSb8k4
         3JsZ2M8tv/Dn2NoMDyzMvzPDcAyeXfYwYwebtgaGTYLjVy3vHUx2Y1wE44BElQwcZXZd
         Or4rbulX1GzoAQVjNaf3Q3plyvW3KNCf6mNX4sMFSTmh3d3vL8+YZwOV8PPxqWwfeCgh
         f2Nw==
X-Gm-Message-State: AOJu0YzpMsd0metOoQZM/0NVZoTHr28KUyQ3uWse9r7EuMWrlLMLayw3
	7UiktlSDlJyM96xnX6FFSMblW/rHc7n0z0DEVtsZCHm2D9YcsxIOoe75uawOqcjKVBkfys0i6sU
	4et4AaMD5Oyi0qd8+URbCeWW/E2fUbrsjoRy6+ennd4kVRbkm/GWaTuzH6304x2vYptYa
X-Gm-Gg: Acq92OGWacnleDvHqxHr3DCQzhYRIRjK6Wwz5hEz2pwU2r8ErelLN6OJmLXpYs1/yic
	KEaxKvYnjNC8RaMKeBnKxkgnev49LJWVlhzstK/0o3L6ALjlGuzo6Ci/AZSMPYpTCuSjfnnQCQC
	9YqU4YYqaS/XmQ5CojLZt1md8yRpnF/63cluX1p/WjQGc89b5PPu5vWMyLeuurb8FxvaMXytek2
	cY3XmUMIbRAzVJ/GFABORc3vmqtMKpgg0vAovW1/VShamvK5/De9DaOH7KiaGD8mnuihQosfK3S
	t3iTNpXkE2cq6gXY1sbG05l61lv2C2dliBz6gGjJnz81hGRnCKAHOJt9TCaX4iDWFDCU57Tqcze
	tu3kIdu9WAr5gM2FfCWndM/G3qW2U8n/n1t+n8bPy8NZCj6ffVG0g53DG
X-Received: by 2002:a05:6300:7119:b0:3b3:ce0:9f73 with SMTP id adf61e73a8af0-3b30ce112acmr1706122637.19.1779368825654;
        Thu, 21 May 2026 06:07:05 -0700 (PDT)
X-Received: by 2002:a05:6300:7119:b0:3b3:ce0:9f73 with SMTP id adf61e73a8af0-3b30ce112acmr1706087637.19.1779368825164;
        Thu, 21 May 2026 06:07:05 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851991ab10sm294602a12.22.2026.05.21.06.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:07:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:36:35 +0530
Subject: [PATCH 02/18] arm64: dts: qcom: msm8996: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-wake-v1-2-d822567be258@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368813; l=1618;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=+8pvm0uFERW5lUAcvZeBTj7KKJ4hI33filK3T4PAcEk=;
 b=pD90Fm15PWEu6vH9L4UCmhcsjpwXr9YAvc7b9uDjO3GE1G2seFaaqMKW+Y2f3jUzKkQD5lmLJ
 kUzQfb8tFH1C0wdu7fQJEyc/XGPVqu1QEf8JUYbmJovOX7SHBXidBFf
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0f037a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=TRJGHeO7bdl8qYu8Ap8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Op-rWCXil9OcTm4ZY6LgaWcryTIPW9YK
X-Proofpoint-ORIG-GUID: Op-rWCXil9OcTm4ZY6LgaWcryTIPW9YK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMSBTYWx0ZWRfX++kmoWtYFfM0
 F46Mipxy6FxVavjRo2Mgy+pzP3uwcG1wimBzvZaH7ZcY8bHwp5AQeh7mTwP5rwYTXRNmvSqqRmN
 bc0+Auy4agdYTWWBDdrh11y+xLIoEedY7So0JD7z8YW33ol+wCZnO38Q+YxK6fejMXGG+C6L9cg
 9tFglRyairPpDPiaPWSG2oeQfzETSKZbFvLXZkX2rDyrr20T1sBJZPBccZ+ge8hJ1hGkz3OVdse
 Z451SFBV0HFAdznOfj6HW6HxPuLyDDL1CTDUjUFtLlLCVMHICaJgiA3XlX82FYAdwa+/3qguLAa
 zjVUrzgfrE7yQzmQrIpYWDqQVUfFH+LzNqmkaMcbpglvLQn8xuozWpQYb6PGxZ9UYiiDs2Ix7cl
 l3J18XDEZP8d0BqAEpo5EyfaZ8mx52vniQ51knC4k4CXutKZPx2KDehnNNHxxy4qoW1J4G+DhCD
 shQYQflU1RS7km7NKbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210131
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109072-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: BC9F85A5A6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index d55e4075040f..5b42c266557a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -192,7 +192,7 @@ &mmcc {
 
 &pcie0 {
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 	vddpe-3v3-supply = <&wlan_en>;
 	vdda-supply = <&pm8994_l28>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 77ad613590a3..2abcc733dad8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -280,7 +280,7 @@ &pcie0 {
 	vdda-supply = <&vreg_l28a_0p925>;
 
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_phy {

-- 
2.34.1


