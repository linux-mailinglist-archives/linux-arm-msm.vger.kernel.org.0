Return-Path: <linux-arm-msm+bounces-118925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FxCaIZLCVWomsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:01:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEFB750FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ChsohAib;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GUw50QvY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C186B301C949
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C2D309F1D;
	Tue, 14 Jul 2026 05:00:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087A2ECD1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005200; cv=none; b=sq5mg3JhTdOUmvn1HQ19yDk2fwM4+qyzbxasAZmdlgu85ahqM8hgUqW9AyeszVEqPaVC2HQsUzy38/hD6a3efZWOfOr9puo5NU+PieQ5GT2YmbyHOFKcYDjE7tpg+gKzsKehdu+5W4LJiph2jfV3khKpXe0mIPxN7HcEESvUXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005200; c=relaxed/simple;
	bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3UVP8G4SjRUPGGACnhCe8bOTgC+iSJdB03dVemHajrw7AGgfKDY6oDm1qnmvzLNwqTY08XSNER9jKzkbOxyJv+MG8L8L4NFPEt66UgrjCP91zjZGG5HA2lTOgvV4pIdodcyQWd/DiWNlVsSn+p44Lkv2qvGPoFa5kTOXht45No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChsohAib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUw50QvY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E37wwc3482604
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=; b=ChsohAibkEY8PfDz
	wsUqMPYeCFJ4j0JxqwLjaq5aFzzR8z8cLZg9N1vSHD0aITFa2rHhbDpnXSNdeOuI
	VF84pIA2XSfkPI9HRfYRyzboJ2X8XpwJtfN7ZqtvKPJXeLmGH4UWeFikd0gz4aMl
	VvDVPR3idX9CHbTaxZQH/J2+ZVSV0DL+ANrY1J4XwZg2vz0YFLB1gPt7m+HWYFJz
	/R8KPQ/nULxN9q/05NOYB/B57h1gSDINgAc5mbRPa/LXliHpEl2BaVz8ny9uL6im
	+JLYnben9EIMnrigsvF8QMYuo0Fw1HdM/gozabf1U1w5r9MUEhCzz/vDYEgH7aWd
	eZhi4w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xa9j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:59:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so499185a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005197; x=1784609997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=GUw50QvYcKumlegxpOY1KJ7a616iqLUgYeUDYqT/RD+W356I/pPmR3BM8ZNXw149ip
         /QIKihda23PwUNU55sZCk/tTMaw73l761SIYV3b8HKQGC1L15LD+7O3CQnPlxtCkHrrZ
         G5whiG1vJoCvBoP6s4kzd7Jb1wO/Ex3Yu4Izh/uCOswGj00yv/XvsM39zOVybxmaiIpl
         A4GADU8efNjnCbbvhqmpguf+BtrEtRksP17HZzuWXkfr6X+1qTUDfWPs77yU7hats69Y
         g9r6jXYzaWpJncxm+muUnHkRlHt2GqlkDEgNdFXATMEDQLa6/1/2rvtLZsXDPhBORT9a
         flHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005197; x=1784609997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjEckMXmIg3lTxAMQEusLsfGlV6CVK9DEapraoZ5Zsk=;
        b=MKlfp5EyDUI6/68XO+tXWGqBBD3KKUSmPkd78b+N9hncNkKct36Z9T1+G6tIO7+b6c
         XhXgl7VaCBWamViC1uWnfClvuEO8aZgIXWCHa2fmzSC/TkCxs3hyzluIekoDltLhndY2
         9o93g/0D6+0qt+6BaIM/+ketQxlXHTHDSMj6PxF6+jQos3OBURvsWmFhEZtygOVqxW9o
         8Su6rV5ftgQoD2ronaBrHkeQ9xQHepft4S8iyIX4EBtg1ftSsna+Kfbwz4D7YEmwmQfa
         01foYPKJfV7rXCrYX/DtJxQXBoIUqneLUc5iLqc9d2YUxsA6ngQk+ZnL00MuAxMQkXAH
         fpfw==
X-Gm-Message-State: AOJu0YyHQudUmgAYchOuMuaaLOttFl2pi2q8uxrgrwAgMgCb2b5SJCbF
	FBaL9809Q7FeDuUX9GbwCx1/uYAnx53NwqGb8iZGbPsnct7ZVDtd5nWZF27M7xy95SF3yQcCuYi
	zirsqUXG6QhM8MmeRdy4luAo4Uw8shJB2XhKACGJPygWoISklgFiPvP0bdM0DlrHmhKtz
X-Gm-Gg: AfdE7ckdIGgh1NYIHhsYKZA0IStDnR++2OQygyyZ2Cdc9E36j5l5wkFe1QWoMLcQumg
	E7y3kJ2i6INOvvZE3j2+iifKYY54mCvQHQ+JIAk4Pyv4l4Y5IG4V3deAf3VXPNqI3KnZVpwaKnC
	LtL8eywuGkWoVJI6la5+hGqllsBxlw7dbvL7uHtnQymH/SL4wza2wjfBniBXJ3WF63AIoI2XYpg
	WOy5ZPJYehygtAFrG/Hvrg16oy533of3AY4WXUihFDf7Y9g2CnL+OhXZj+tLILufuhdlBczD7PJ
	T2/z0b/87XSR0tpdrFhAcxoUr+SOV/WXt5RhgB/dwPX7fOd+1jR3zIKk+cq/bcEPzONe7D5Ecrh
	/xRXN+CEwtaXsC3B7ItzYF+1b/8wiumnmHfBttK0Jf9+I50whnxWx1umxcg==
X-Received: by 2002:a05:6a21:9d4c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c110778416mr12506230637.24.1784005197515;
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9d4c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c110778416mr12506199637.24.1784005197077;
        Mon, 13 Jul 2026 21:59:57 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:41 -0700
Subject: [PATCH v9 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-6-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=1658;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=mWA8/QzJVw/Z7Z45NGEAV1BRxr53CZ6L3rVVpjHn2gw=;
 b=doXDPI60X4ekfOU0fTFxqHfYME2KrZT0grUAy9KcmmZGE3pE0qPJrm/2tIMdQuohv5L0fqM/H
 Jn8yIF1nsulCs8zxTuwTNhBa+NrEfKGl07fgF6RuyNd2Ab9lYdVRNqp
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfXwnMOvXmVP/lL
 aBZ1jPMfjCeubrjWlTtu6UtqZ794yvSzNQyRmjC7E2iPsiIuTVuDZtz+jOvMLcc2f9LN2Q0aE0+
 lnUDUT5Al9Y7ALmjYul7KHEjEcv12j+3ow3N/QlFBz0gm+8WzdG3jin4EU0CsqjJ5g0qU3lI5k+
 JqrHMOFzPXlLUJJ5Szc1up10P3SeBZfb4obDXo7cjeRrtuiXh9kf5l/MHnHbsGtNM1tJwJQ2W23
 pbHgBviWnDX9WAQV/Z2lPgDb8fN10HdXRQNI0Wh9/UAAWG4OopIrHO+Wy0re5d0BwtrghJJWcqD
 vOSLD59+Ak4bUej5TBxig99/4XJosX/UGadm5fQYt8tzv0y9ZiFJzqkvQMD9eYWekHsynCRRXvu
 gZ9OTVZdLQlJreJsN+OL97GUTf2EL699vLpauj5c/eg9IsYWAXprGZKdXYiDkbt+G6cFqMn0E27
 tZ93ctcOJgHq3IFGd+g==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55c24e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=n5gI8yOKKvUJs91qd4MA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: IfsVxjDTohwRZ5XVN4C9G94OGtEO6uoM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX398npMnAnvn/
 cyEpH8/0Xe8IOPJe9VI6KZuPM4cey31i/6asCtsc5udiDRQn/fCCkAj9Lj941mr1mdSpMOsA79m
 HctF/UcevjId1ZpHtT/gmRxcTI+HP0k=
X-Proofpoint-GUID: IfsVxjDTohwRZ5XVN4C9G94OGtEO6uoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118925-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DEFB750FAE

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6125617de82a..44766a73b0d1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -28,3 +28,23 @@ &mdss_dp1 {
 &mdss_dp1_out {
 	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};

-- 
2.34.1


