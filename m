Return-Path: <linux-arm-msm+bounces-112610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eyEPLU1DKmqRlQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112610-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:10:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5265A66E699
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:10:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hUjzLbKw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TnTrTZIP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112610-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112610-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBD0B301220A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A657396B84;
	Thu, 11 Jun 2026 05:01:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43A13939D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154079; cv=none; b=ho0SR44WdeoFQdk59LhFV+cbdWojnr7xCAqt8ueGjbECv79xo5+GqNMPlaI1D4N/67EN8e7T6i3XZn1EQP85cgBue/TNqyx5Qq58cjsY1B8pG8G7CCnL6qnfooWh5WWp3W7nEaudm/jsaYSWnqQd96h7+yk8W1r3ezhaLOZQFQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154079; c=relaxed/simple;
	bh=QBWtqPgdhnJI/7B+0i5OGO7653R5NO1B7RVCB1wNSec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txt7gY4dMpotDsf+TcGpJy7M4YIEEZx8L1qsCjsuLHz/GPXAmKaRZZimOh8xdt9d4D4lUcd9fauvD+9iXWmLx8ef8PVnwMZ5bOXP2RR8mK+NX2NF8FXNHU/7KDonP9ymoEqC8ua2xv0TXelIuBW9/kgcrgsJ2+ioAAgym8ewpNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUjzLbKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnTrTZIP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0P2YR3205831
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDOyjVy7Gm6v5C3VhgQs/uW5jqgiFhnWKhAY4sqkK10=; b=hUjzLbKwJt17496y
	+MLxC2t4JMpdgVOHsGxRxxFVW3XukS2Ipq27b6NUnEBoCI7VTKiDg09P+6BKEvV7
	bdYia0EThMAzHfb7vF9iEGQY9ynv4lj9JnwXb/PezvK+R0TOD4KEgGMeh/U3TxFp
	ux+yo+o13Omp81yfzQ+5t3bp3jl5loD4vLZIKHQxCljM53KI4p9QXQINcZoRg/5e
	q2yx0h0hrVnJ+KrR454fuS4LenpmjixPx+pXMXk9cUN3vMcrLlqGkqoihdKFu69Q
	y25kEzwZM3vK+/SkjSnOfDDXkkYz6+FgucKMFYQxeknGrjE6x5fGIfmz0ZqnW5+u
	2sLM7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6thpe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2d65d9773so9005145ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154065; x=1781758865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDOyjVy7Gm6v5C3VhgQs/uW5jqgiFhnWKhAY4sqkK10=;
        b=TnTrTZIPeqS2MynLPU/IV3atRPanmP2znbvGJrcCfMUmGY9TanM8dBPurrZeq9TTRs
         PyedSw/iy4gKka4HDOpnAufu1HUm8O+reDdDoR3Ew4YFaBhzeMtL/8/xhu7q+v3u4GYo
         ZFsl1bEx69cHuLxEUmCiXpwuQtVvSE2seJbeAbPjMmM8uExV0i0rYpgdKVABma5lXIlc
         MSX/HLlH0ZNZWi/jtmY2c75zTMAZeWs/9cqQogfiOf/smePuvU0giaV0wEfmZythaGRF
         yo8xsbvO+bRNOOuuAEN0iV3ya8OuAfUOP/PEFzlqxK62CBVPLWEXSBpTHwkqLuxjrU6B
         nlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154065; x=1781758865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kDOyjVy7Gm6v5C3VhgQs/uW5jqgiFhnWKhAY4sqkK10=;
        b=Z19IF7h7EDmfv+LY3NNUh5FwxmphGrI5PzWRV577W/Afz/+cznJllH0qJ8/ft9SYdS
         IVW3v7Ph5HVSLv/VNroFC5XOKVMraGpebtiMMwlOy4Wt44mCgglzeHTsTLXaPcL8V4qb
         Q9pXfSNI1rGnJwANd+7GDJ+E1nOePjge1K+/2PdxeqXEMeYcHcD8AzYSsOL8KQz2vtkc
         TCV0CwCfM66jVwJPdD3tjX1trAp7X/O+dNUa61jpEjg7CLvevY2n7mmKHfZQFucd22VB
         wZSk7c0Y3zO3Vhx15oGNsMOMIVbP5PfyeoLOubaplDVvLL4ELUCoHDvyEoAfHzK8kNpi
         hz5A==
X-Gm-Message-State: AOJu0YzoJEww9+TSnj8sLwnZTpJ96r6upvTEJVD0OCG55d989AoeKr+k
	skojq+tjfO3F9CxMd0EMjdTIARofzkYYukgLyec+5eyTDc2HL3BKPScdaHPBvVkyptBQcZYBEFe
	ElPCrEB0UYS0GMaQvXH0YsRgUozXjcpKUWTBY/PEVHQHESQgtSdKC4U7/yDA++3ZRfLtcTMu82P
	Ff
X-Gm-Gg: Acq92OHyvPOTwkB6aycXLeTR523qXN/DdRdvfply+ZVl8qX+RI4rC3TXumXgb28NRHM
	agz5rh9g3DF4jA5/MvT3rYZBXytMfUP7kJLW3/g8T88sjKfnWFUIh8HeQSlkfGutAwxHlpiFTU+
	lEdg0urZw1uCHpPE942OCnDIaqaRbgMwhHo1nIrUDDVlO9HjX71hlb3BbB1gasR6Qwv1MVXDZno
	wi5Nib8Nwoblk+/ipxr6yGdzBgFoEDfdFHe513kqEk5uzAyvRyjLOXXNpcpogTEnQ+Rnd+zflKY
	R5sQ/+vLq0y3TAXH8xCdOLn1yFv2jaYdLCyp+tic3LxqbeFdxQvzBHkCYR0G1GrWkyO6hMt3sJC
	AFKv8qIK6MKr0k9p/AEMS6phpqcpzG/rwRbkQn68QANiP8Hf37/TCn2QczgJJMrvRmxY=
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr14030225ad.25.1781154065144;
        Wed, 10 Jun 2026 22:01:05 -0700 (PDT)
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr14029755ad.25.1781154064647;
        Wed, 10 Jun 2026 22:01:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:04 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:09 +0530
Subject: [PATCH v2 33/37] arm64: dts: qcom: sm8550: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-33-2744251b1181@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=6736;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=QBWtqPgdhnJI/7B+0i5OGO7653R5NO1B7RVCB1wNSec=;
 b=pYDo5/4wLJ8WFVBfC+n+DS6lkP3DkN6ZbIumLStw5B56e409DM2lAK6jDVDFi7GioYmHRpnlC
 9WGnMp9bg+TDIkREA/uBh0zfRa7pfIFvRgSYpuNKXI0QqGrU+i6DX46
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXw1VaDNnxPUFh
 6B895B1Fge2wm3EU4HPL5EQOz6x3RzyRuXuK19yzcoiOLgCnLI5FkRtk6uBbQFrZs8lRHDyTyTW
 PizXjGpO8ysA9jjc3c6x2DGUjvjdSppzzb4/rpUrb5bDbBgG5n+MO/7pqfXHNaFC9EsNCpp7NgC
 dqTxP9i2oGNH2L4VJoop3WYrOIL7I4W/rQkP0eM8e11sgFOAvXt0aDS6xetKBvdw7/UH+2ucDCq
 glrowOcLwOaKKuo3ErTA/R2CTSBZujvox+jm6oBsTqcQ4z75gGpzh5msaYehkl8DtL7HSTCPZuC
 8JdapibMve+ngWGVTkvDIw5KSWcfDHHdkk8ZmNRPCkAP6Wf2h2bUj9ETVMJmdWnHpXRR/Lwwo9g
 mrVyr8WXnGdlXoBGnWsniPJAs2C3gIA984taPli85i8/ChgYlXlr62NqYrGZjjz/3kmjLZfSmjJ
 hBuVBDVtpcig2tLvlXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX9tS7vsgwTkUI
 6dy6jhv2Zl6xn/uSINY0HMLFdQyE3h4n8yApVHKMIpY68/WmYGmlKqFX9GN2zDZ2+Jg5MEv1oJY
 4yHdhAOD7bkr3xolxqhyZbGrJF9gmBg=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2a4111 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7SwbUlbDHKIDUUknu0oA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: TtMw_gZx1KgamyALpRb8NPE7-GEY0S7x
X-Proofpoint-GUID: TtMw_gZx1KgamyALpRb8NPE7-GEY0S7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112610-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5265A66E699

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the
controller overrides to the respective port nodes in the board files,
renaming perst-gpios to reset-gpios to match the binding used in the
root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  |  6 +++---
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          |  7 +++++--
 .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     |  8 +++++---
 arch/arm64/boot/dts/qcom/sm8550.dtsi                     | 12 +++++-------
 6 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 4709eb34521d..1488ff8b7bed 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1003,9 +1003,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1013,6 +1010,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1037,15 +1037,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p9>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 7703ebfc1b67..e44f6a8877bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,15 +739,17 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
@@ -756,15 +758,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3c_0p91>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 5ce81ac3ab4c..1fe6a8bf0fbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -903,9 +903,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -913,6 +910,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index cf4e4e9d9e26..0ff9f3850b0c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -510,13 +510,16 @@ &i2c_master_hub_0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1e_0p88>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index d23fe714bd27..678e58694b8a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -584,15 +584,17 @@ cirrus,gpio-ctrl2 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&pm8550vs_2_l1>;
 	vdda-pll-supply = <&pm8550vs_2_l3>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 912525e9bca6..a8eccaebcf2d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2033,9 +2033,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie0_opp_table>;
 
 			status = "disabled";
@@ -2100,6 +2097,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -2213,9 +2212,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			operating-points-v2 = <&pcie1_opp_table>;
 
 			status = "disabled";
@@ -2288,7 +2284,7 @@ opp-32000000-4 {
 				};
 			};
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
@@ -2296,6 +2292,8 @@ pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


