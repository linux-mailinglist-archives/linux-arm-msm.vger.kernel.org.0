Return-Path: <linux-arm-msm+bounces-115856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D5t8Br4VRmpCJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:39:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABC86F446C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:39:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mNpHrpR3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SoyhvJgX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115856-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115856-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0D323035EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015333A3E97;
	Thu,  2 Jul 2026 07:36:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9AA39F165
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:36:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977785; cv=none; b=ucBNsbST7XJPVENcf2qTR9yI2u0E2YIf34PzeSqZlb6H2Sz3YVXtJs6QgbQoekgD6Src+1eOg3O/tpk3S6gx9QBcQqnu1vkc569oSh3alQeBSsdvxWmU1FVzZD+qE9YswcSfKhqPk/Xq+4ZwSxftZhSTpPlyDQiBuBa5yUufQXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977785; c=relaxed/simple;
	bh=T2wTeTr1gDX9a9Bl2I0Zsyo5TOUnBGDiB8otypBDFNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enC3YSsoWEyOGJzaP2a5+BdE0STFyeNYXleHtBbpqY3cK7rXWGmo25cjY3zg6RjKTMXHqv5QW3/+ko5Goa+EZDWTcQKnwMWAQKdbPdZSwoJ/gvp7MPvcjDRaLneGCEBn2WktqfJdepY2n1NrP2L+KQG4FbgmuiNFzjrXfCIE0ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mNpHrpR3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoyhvJgX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KIZC3050666
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=; b=mNpHrpR3p4n55w+V
	EYgXoE+PhGhy1GEIf9kyHyLYTCrFv9U9Hh9txV7PoL6vAQqIMUsbPLQ9k1iwWPKe
	bEYccqvDR3X9Cc9ZGmIPLUd7pv6vb/ZSugTaVLEV8uuH9st+gGvC5rIHvI8fS8C1
	Xkd2LAcaQQenxkHUykSV2RUvpPoLxUZ0uhQ9u6wfQKAaui3yZCP5JLcrSydouGN1
	QVj3x8MK7qlUz6dipiTTitxfTvSrlvOXQU25KenfrqITSHGbp+LCV3zuCNl20fQV
	AsVU5jYV/lyyhpNXEWECJEroLPm7G5etrQ1F6Mv4VhyIpBFKuVrvOO2f1qXnE7Tu
	0z3tJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gptwms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:36:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca1f16e391so23118455ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977783; x=1783582583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=;
        b=SoyhvJgXUyW1RzsRpxl0reI2qb0A9//Z/r1Rl7ETfFZue67qgHAYq+0s5vzqphOinG
         rW6vEp9D4VysZK/0PMVYBLWAZLDbGfWSEiHcugh2F2I+cDlRb/05ktXxmIE/qNemiYut
         hQeScMq8ONNmDIi9U/Y/wWLdO78FZpOnRSCn0BDXJlwVAGQ5zcfl7dl4+2mZH5eAGlk8
         M/MfXPYXbjVdUanCEaoJdLbsrAw/unMJuaG3umy/nTMne1ghea9urx7BWvR03qYPM9FO
         3fqESTNVwua/c3ryf935EBA3tBWoL3UOarg4Gm/NSo2//7SP+X/pkg7RhHBVd2w/uM5B
         GDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977783; x=1783582583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+OLdMnSvsqCJMNx+xvl5MR4z5xBpBWEMUAEv+Vb2PE=;
        b=AEcc5dVA0SXDifNSrb5cO/EOzQ4h7b1DOWM71lOeVAnt8Lrqjfme6aiCePDU8OASUZ
         o7VVRtCDarjStdsD6336NbQFXHYWJXBNyOJyerYLkpweWvZvyCI0r9k1YbFrptPfDlU4
         JSbfmRDCWugPPe20hWq4WGooeAMH3Leio7wF4KEaJ24fr73qwwwYFx/V+TXWToqAettT
         n7pNx17NIvKGKCENmntxUh2rTDGEiXASMTxxV44xHXaT0q0pher0Qx7r5ja4F8+O7j7K
         j8h0X/saNOU3Dx0JxrgwwOTJYeJDC5reIlx5On6YoYHN5LrJof1jRIQin9pSmFTG7rBR
         YOaQ==
X-Gm-Message-State: AOJu0Ywh28i+KFiGOxYqyHcKROJ42lYqJYlB20DwoJXE7+fokx5ieXdD
	FurZGYY0fsRQ1wSHnoL9dVNE5jjO2mp8TIVEnAOzBkKkr0zuBtXFN8hsZrgLOpJjNuz1YW5fuAl
	92/ukrDzhFvpa1Qm7zwSCIOSdpGueU5a8OP+DuhIy0z+UTypo05yU8p6ETM/cwxag8/NW
X-Gm-Gg: AfdE7cnojA75gnvw6H5GZrH9xFzKLHEnN100oDWHHL/wKqxhDisj406Y9B7NBykVoyO
	jsf848t++WJCJoc82lPPWwt41ElUiDZX8G7PL7mksRRyJg73ZDcQsQssn2b2GvPlriv0DZzNI4I
	zH04gkoq8p6kMckeaJEML22UAo9bdKRSUgb3FvOwyIaGDrJYrwR2CYqs+Rf/eiOz6ZoC3CejY0f
	yirloCua/KZrRRyXgVwLxvwvf4ssbLzF4wNOMXoKchOuxoHLDiaEOZBr29K40WP6STbfe6VsuU9
	dk4o4Sxu7OJ2Mi8ZD5z41gE7GzY5AIVUD/L6BL/6vC0pmllQ8logWBANSlwHjcqtEY//B5GVTpg
	a40tASEV2Ojdm5mM9dn7ej5LqDqWws2XwOnFHGjjLBhiHW1aBBez7gh4nAw==
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr60846915ad.35.1782977782608;
        Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
X-Received: by 2002:a17:902:f688:b0:2c9:cf5d:d9bc with SMTP id d9443c01a7336-2ca7e877452mr60846475ad.35.1782977782187;
        Thu, 02 Jul 2026 00:36:22 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:16 -0700
Subject: [PATCH v7 6/7] arm64: dts: qcom: glymur: Add QREF regulator
 supplies to TCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-6-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=1686;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=T2wTeTr1gDX9a9Bl2I0Zsyo5TOUnBGDiB8otypBDFNA=;
 b=4TaZisjcKMsrNPge+rvekin150Szqb7OvEjJZaTtrjNWJ8JYKcHTwH73DXpM9guJHpJHdSK5m
 qV3uWtfcF0PAGZnwGdCdHkwI+5+1KUlwDJ88kpUarrn2uoSEpUjg+ht
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXyf1NMs5f35lV
 ppFKaQ7R0Yce395gYrEVEGvNV04hnd3zYtA15R0VbVXC5QhjtqacwUp7Cx7KTHYCyksVOOvhEWX
 FOTQF9p3Sr7QQB/iOqipooh22y5XonU=
X-Proofpoint-GUID: njlH9dRrc_78G7o_yqkNazALSd1b6agv
X-Proofpoint-ORIG-GUID: njlH9dRrc_78G7o_yqkNazALSd1b6agv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX0fvrk4P2NLOt
 LLHpfvXM5OsWGBueZHx3+GeYvQ+i1U9Dz1157DdRAk61h850qT9ObyllW1OukJWfoQTzbstzYPn
 X3XLBk7vvGWySk4tt+ASBLM0cAwWQi8wAIqZmncdtof4hnwriK6/b2gr6S8Ri26+qWvHj/BJ3tt
 34qtfnAJubQI6QCRYipAJkxOXHiMK48Kdmgrfehl2QFC+r0Ta+xSWAaXtLH5FayOpXi11GXBqKS
 9ncKFALelhDeYHuqVmoC7ysxgi4MobDfFejYH/Mqu0wOH2WSYVQKTzejs8axVbtBAjddFBm2Uvo
 T5ss9vxnNdroHpILSWThyD6hhiYgfrSvOZwv9Ay/49OHnnsBcyzjF5pZMdz5eKWRCHJTNxFrZRn
 LKm1hK3+wPsCEdIDiQu/CvviIwvgpYK7j3bInYkBArZCQfNNMlTxQMgZUcYgxyWIIrFBELe72Nk
 bR5/KgVgV8o6tZgORTg==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a4614f7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Sd8Y8_gha8mzdjVg6RYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115856-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 9ABC86F446C

The TCSR clkref_en clocks gate the QREF block which provides reference
clocks to the PCIe PHYs. Wire up the LDO supplies required by the QREF
and refgen blocks on the CRD board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..92b929ee3448 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -278,6 +278,26 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0_2p79>;
 };
 
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
+
 &tlmm {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";

-- 
2.34.1


