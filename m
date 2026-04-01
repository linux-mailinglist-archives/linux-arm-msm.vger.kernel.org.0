Return-Path: <linux-arm-msm+bounces-101236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBonBiS9zGliWQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:37:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A005637549B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 08:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A23D93066435
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 06:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724282FD681;
	Wed,  1 Apr 2026 06:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wr4vXiVW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bDaSDRWp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C2332623
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 06:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025341; cv=none; b=cwxHJ4Fa/cHHTLl5y4liZrpiah7iM44I2VXwchDDEY5BEmIrMgBxJNMydBgopSgQtGTb37BhmkruIXwnB6rdK8Ue4ATvRXUG4EnhuGTSRQOSvmZqc6nYHt3tEC1dAr8e5F8jKFPsYdF1vs0WMBhM7Xqtvc5t5JOSJRxOW+QEyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025341; c=relaxed/simple;
	bh=HykJptyeG70W7OChA49EYIHxPs0wMAgUlbTPHQWlYFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jBbS+ncwJlV1nAPCxmXDXJkXSKmZKSWIcMHlT1Wslry9oL7+RDQcB11Uv0zyAeTmzvNAGovkhTjFMRG3rULNyeKPo34Od3a+gXpJL/12ePu1dlFc3ATgi6L7O5YAoZeweG/TFwWZDNYCXN1bJCgmD74rblk9XkRKK6G1OGKTGNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wr4vXiVW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bDaSDRWp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6310eSm13103842
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=; b=Wr4vXiVWsW8f3rgk
	IC2ZVni7/VIOigl8cL8jupphGG5a3MXGVxjbFOckAdf84WhhwhsGGkHjZIxbUcjL
	aQaEEq4A22VR5oDQa9H5p2/hvhsZwWEtJpTZOfBVofDsStOY4NBCeaAHuMF/mZ1H
	V4fB5u0p7JkYPgi3Bur27CO4KoTMBjlH8sm+qM2Y4EXhuedKI/hho3bnl2t5MI1z
	ZwGYLLSY6iY5FzOSuWwmH58DhW3s7s6SnDNf7qZ7t2DaHAT8lbV4iZ8OaB5YT2qa
	/wcNqSAK+9X0Rr9tSDMq0IetC8BvcJMfL27J6IPfWvYYeWqqtpxxq+EWb97ldgA7
	WU9zHw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js22vn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 06:35:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so7910193c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025338; x=1775630138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=;
        b=bDaSDRWpx/LRFb9Lqc+mdS4F5yODvCB0vONnaKZas/IGNWuf3gEpfnn/B4nVBCF+qo
         zF+4md+obJuCmDIos1+1XgOz63pEiZ2zkYQXn40gkPxBA2qZ1b5p/h7NWKXu0wlJ9SG8
         DgfjrKDnL8LcocBfHW++XRKwlXqpd6PH4R3pRsqc2MvTvHYaO9+6yBegrX2z15SBzjgi
         glYhMx7v6KGoE2uymhQlAfNG3oM5gNQ6VkxrF35VUQJaFQkURY+bijyl4yh2s42P/5dS
         kNUTrbDzhzw3BI66x+clMX2+cvR/VU03owpCCiwWP4FQZTtRjmwn/QcBxxG4oJBOLFCl
         efAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025338; x=1775630138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1QYgNgDJ3F6MS31DQqDY7XXr7r7iT7d6sWyEB6cfUQ=;
        b=hUR1xR/2NA92Q8pMsAsPs6wB9IJHJLDXPuE1+wbCI0j6pI7gOwxt+HHnVAAP1QnZE+
         jdjG+HzjnB6lUzVmZvKAtJ+nVsnhYzlVCr+FD0I9NN6umGfrw3ZZy/tvFCVv9Q49fnoM
         WLFBrSp3joR6JIdppYiSMoDescM37LK3katuXDAvV5RVxTOQNLmVpJ0bBzivD9weQZqj
         PZrXboBWXeD2kOXaRtQF+4/03YamTUU0zg8bozDdo4AGm8o7fX8O9Lwjl6F2RmU7gvkr
         IfqzhJ7NcZ/irVtk83wpjT77XUSracfEejYWg3VqQbnZCzVD8v7ceOqfT3fVPaTg0nb/
         VjiQ==
X-Gm-Message-State: AOJu0YzLsuuDMTtbcqs/UaAvecobON/F3K3ZfkbRSY3TDjfv8GS5n4F7
	9yBOGB0xlZenuVkv3mswL5n5IORrslrvo8Xly72QjJYHW5kYKFhRJk/sdC4ijFLt+7kKXtdLzhL
	UU+KhJp+rbQbxOuevH99KdXxjfZOdMNX85bxT+JyfYcc6jJduDtzhdKY+LSG1CQBWns5P
X-Gm-Gg: ATEYQzxVjHY31p3jKo3gBHpb6XV7WmUUkEIyk+duVopHR7ht87AvOI6TA40lTIuQOvr
	gmVS4t23kcLFjgeOcHDu8X24ZlW28+MSaywpWXohRicY5utrX0z2M01pyJ4KAzXBYSbkvXoroOO
	i6llYWZKl5+oGUb7gUsc0kY7sOhQ1IdkkjnfLP4iwTJBdJTuV8EcidlvE/Y+WHzNV8t158ubqNb
	dAuX7OQA6zIthn0xY5jLsCGhx3eQVqpZHzTj3kIHfL+Kar+MSUsnO3pGCCbJN+E1BtSEK9aTjXE
	JaVav3j1rbAwrj8S8bv5AdX/pWvpp25ffXayIWlfut4R1rGKdIKFgxdyMa9A3R9Fip/PrrDAL1B
	4Wg2kon+dKcp7iZnM0GuObMZLVKOmAKvPiADpacmaWqs/y2Rs0gflWhEUfbSFfr7wR1V0
X-Received: by 2002:a05:7022:2387:b0:128:d4be:7418 with SMTP id a92af1059eb24-12be65a27b9mr1238000c88.35.1775025338219;
        Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
X-Received: by 2002:a05:7022:2387:b0:128:d4be:7418 with SMTP id a92af1059eb24-12be65a27b9mr1237978c88.35.1775025337549;
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:29 -0700
Subject: [PATCH RFC 4/4] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-4-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=1732;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=HykJptyeG70W7OChA49EYIHxPs0wMAgUlbTPHQWlYFw=;
 b=0SX9Xe7reS6OSBWr2q3Gmgf6avxaV0jkkGa1FvQa4GBhvKr6tFnkgE6sk+GAMJCTnHGKVygEt
 xJGoX00cKHtB02MK0Pa2mGPWEuj6mAckxKSii02vihdA2tQXK8cZY+K
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 66suKN3qeUHTKeYMsJvOMzX72D1U4TVz
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccbcba cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Gcy0W0cHAWauOcWtTx0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfX2Wmd0fewCU1c
 x3NRvQRxRLo9ZsmJgm+aCEPz6SbS0XpOmdEe9EP+9nhA/lBQOiabZvQU0fYZqFKno8J77uzIUeh
 rJrRnBmq9RzFYXBA+rTrvD1tvvS6v2wG/Ht69S869fhe2hrEf9BCu5QaJp3c0+dItYEAvEwy1x/
 jo6xSEuZY/MuL7QUPgH2xuYzJXopPcXexdCeDIuU/LVZcTWAfx0Ew9dJNiIC3d+plRABie7Pxt3
 m93x9bOlYmxKNp/ZxO1YRojnsLAf+LC3b3FKsVUs0nmn/s3tfVisdI4riHxOR0oUEMQxg/CsWJ+
 yxao6VBPfhVjvpq0mtCREZ8q+K+VRf+buwHvbgQH3iXeKvnBjx/qIpFI3qj128k+nFX9rF0f0/t
 XOPxzVJDhPm1IdXxYb2xhXFAJIFe07if0sV0KtQ6YyQsIhuBwcMkGTV/MK7PtDpp8m+PeAioYBY
 VGLgICSS3z+0NXAE7Ag==
X-Proofpoint-GUID: 66suKN3qeUHTKeYMsJvOMzX72D1U4TVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101236-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A005637549B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The TCSR clkref clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board:

- vdda-refgen_0p9/1p2: LDOs for the refgen block that generates the
  reference voltage for QREF
- vdda-qrefrx/tx/rpt: LDOs for the QREF receiver, transmitter
  and repeater circuits

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 51ea23a49b9e66f14d08dcff777789d16647fd17..3ca181d082ebbbc4d4778abc853c39deaa2a76e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -342,6 +342,25 @@ &usb_1 {
 	status = "okay";
 };
 
+&tcsr {
+	vdda-refgen-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen-1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+};
+
 &usb_1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_hs_in1>;
 };

-- 
2.34.1


