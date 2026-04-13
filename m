Return-Path: <linux-arm-msm+bounces-102921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBWjCma13GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9493E9C20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BA2C3023DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355023B38B4;
	Mon, 13 Apr 2026 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv+9qsDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63EC3A16BD;
	Mon, 13 Apr 2026 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071996; cv=none; b=ifT//EKAGNBByJtabuCjUq4ZVotGz11TsHhRVBMGhiqBmDwn/xUm7QlFwvq/Chw+AufqaP0Qr9Ax5r0GpdzWljprQ7sQ3G78iKLX7LO9FRyUBfcS0CUdAJdasGV/bD2v93wk6RMW/jiODp4AsUyIbHW8DCwwpi9IiFngu+V+aGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071996; c=relaxed/simple;
	bh=ehS2TNAjfOH3yY2qO526UGmzZc1ljUzsnRojhYfSTjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XejUc4sI9gEsGAV9KVKK/hmVVs8OO6t9rYwMUtrPR3NxfoyVlDEI7TpqwsmfjMmHNg1wvgdowjdAa9U/opikcz2Kjg/+/Kdoy3Zi0JVN2Mkj6XK5ZyzYDuadBeh3q3KYuBxGe9CbOkaF0aMi4T0xzYIBqsBi+QD1NMLo4NXaxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv+9qsDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7xEHi3875789;
	Mon, 13 Apr 2026 09:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ozEojes3M5H
	5KWa638HJLEmsa6fyPzqpYMguT1GsQ2k=; b=kv+9qsDjEB7iT+rsmOMgK5Z5703
	JdTY1IpgoBVgWEk+Upv9/49kUKYMYXxGBlkE0WDhZL3w/YBD3di0OejYiu49gl/z
	CkwKHO2aXCoB8clV/AGylAjNhrwLSVZA/3nNxGLqMIIat9Rr1MwBOe4SigrirP/m
	wExfq3lqsnbV2B/fSKnd/Yfw/26Z4GyN1kXUbGtdLOt1pPNu/UoglA3oXR4+Qoiu
	CgwlxjW4u0tjUUoj79w6SwYrY92TiZ38cF1t8pj6PJR8ER/T2WcwuOOI1EGPO9MO
	4SDSVopPqLZ0hkbJJNueN6q9Jvqqk+D8EKGGO2fqdm9uQC3014BDmKicmZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcvkyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:46 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 63D9FWGJ012428;
	Mon, 13 Apr 2026 09:19:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4dg5bqtf8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:45 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 63D9FWqV012423;
	Mon, 13 Apr 2026 09:19:45 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-kumaranu-lv.qualcomm.com [10.81.89.194])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 63D9JjWF022520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:19:45 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 4187942)
	id 1A3FC6B0; Mon, 13 Apr 2026 02:19:45 -0700 (PDT)
From: Kumar Anurag <kumar.singh@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>
Subject: [PATCH v1 2/4] arm64: dts: qcom: qcs6490: Enable DP audio
Date: Mon, 13 Apr 2026 02:19:35 -0700
Message-Id: <20260413091937.134469-3-kumar.singh@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5MCBTYWx0ZWRfX1MO6+Efmt+pD
 2vfog+QcwWTIgZqnBWd5MwZC0BhaT6sLrIPCofNjdqSHUL+FnNZMnorTJYvvvJP3p94io4LrZlr
 EP1mHIAnAIxsOWyKgLz1X6RMrgJvuLbs6D9RGumE3ESRMOFgN6vhTNzNdKX8j6JbezpSZO8j7oS
 p30sX4UrD7wvB6jcZegld5gNpPQIrESjjfqAhQmhJVVkNXaoVBU7tKYdS+CnSsBqXv4IkvYx/CL
 5T+iR0Cy7y2JPlqnHHMXwfvWN6Q3ci5EbJWEctKjfyEODMS/xhzCgmYP2Xjyk6Sr6pOWvtOZznQ
 T+Ias0j0y2HLlUiHgZUmCHKqTESeQPoMV3vM2NYobg67R8taA6yp3/QZvn+LEgSCjX27Xr3TOSa
 8F7tXo3f3zNDrcyeTTRGym1gP/LtH1mXMmlS5B7cW/xc/QL2og/imXHrEwDP8TbzJaVNfrlUdN0
 4qTSPQosGhtzjzu9vLQ==
X-Proofpoint-GUID: 7bK4lteHg67SaETxMnehizxzJRZsjOCA
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dcb532 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=lG2y6UpYVcZgsHJeQzAA:9
X-Proofpoint-ORIG-GUID: 7bK4lteHg67SaETxMnehizxzJRZsjOCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130090
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102921-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kumar.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BC9493E9C20
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add new dai link to enable DP audio.

Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 2e4062052828..90fd8822dabd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1169,6 +1169,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	dp-dai-link {
+		link-name = "DisplayPort0 Playback";
+
+		codec {
+			sound-dai = <&mdss_dp>;
+		};
+
+		cpu {
+			sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr2 {
-- 
2.34.1


