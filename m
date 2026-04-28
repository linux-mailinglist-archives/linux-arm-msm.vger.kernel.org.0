Return-Path: <linux-arm-msm+bounces-104868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAH1BqtL8GmJRQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:54:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2190847DC7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1EF8300BE23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E49A312803;
	Tue, 28 Apr 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNgUsX6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QDk9M4OF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4679329C33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355682; cv=none; b=fnOMUelgZL8rsoAkTmcrrTJ5I91JcB4BcfZroY1NtOrUdr7tIEToBwJYniEmNTB/fld9prp/xC9VEXBqM9ObnKgj8WKVcgcNpDOMSqAmouxtQG4oiEVgaKik1kd6xtTheaE6nace0R4Z2sNJwc/oPEK1U4ryu3Yor5/ExU6HxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355682; c=relaxed/simple;
	bh=rqXL46s5rfAo1aFBC3py/cLftxsRGHrgD+Y5cVyGBHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LmPTbtc4OF3zcwE9R9XjtszWyfBLcqraO8gFoNZIitKnQQ+XrIFOdRvuwd046lfnMZb4mT1BfH1Ld9+w66nqNieTtLC64ExercLUBXck1ZfHY2pCx8NUNS5vDg5diRceErWvhMWYh+o+GBt3iIRpAlI/Z8/2cjgB5kIkfCl1RqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BNgUsX6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QDk9M4OF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RLnYhI241566
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0aVE2FwY5Kf65J20nqa6ss
	u/FJorVRRYQdSelms4Hu8=; b=BNgUsX6uF6pdJVl0gkyBoUszAKT0KQ2HfHf56d
	QrYj3vEjWu2kTXEKTKfmIPghzWO7tq9x6EdIkDDIU2cRoJP0xzL79H2zByHvie7m
	6oq0GxTMXfYAtosKX92zvMsovsZhYvJgwkAaPtnjEZ0IAwyGz75gosYF0tNgqaXC
	3A87dplUvTY2UjtWafS4uUxq9cfTg1laCIP+r2EG3pM8bHhgQB5vFQ+lNO2Ul1oE
	vXaf/5QFXp+TlxZiQ3l1mNHEwTDJtLIcM4/gBOOQcbC+pXJFt7X3lisGZ0PTZ+v7
	94HQyy2ISAOTztZa5/hBU/aFjeJPGwor11C+1RRE5z8gb6IQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946u6sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:54:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f220f1dabso8120374b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 22:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777355679; x=1777960479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aVE2FwY5Kf65J20nqa6ssu/FJorVRRYQdSelms4Hu8=;
        b=QDk9M4OFGjnIRlrgRmcZQQ5GOTKczsT1VlippkpGvRFXipJ0HbCuu2Wicava7wtinH
         tLsGFy6ccCWUpt1L9J+ruTtA6RXEoD69JZwHkLEhP0PE66Xn/dxDKLWQG+MA7Dp5qXSb
         RaB7+fekqQXPsX0/cbwQTB0xXYT0yFYnKS/P4U/Ra6HV3X5IolLZNZXpYd+j8jBkAXcH
         jFL0yrVrkmfH6e6sZ30Jaf0xBLCFN1hVrBIL2afQSDR28Di8tLqO5Uw7sVrYpanfUe91
         yN4gN9Rp4zBlzpz5rRs55b38f+bEiSE1NpAW6Jab/AbxLtyREfZQ4trET4fvJv3vCYOS
         viBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355679; x=1777960479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aVE2FwY5Kf65J20nqa6ssu/FJorVRRYQdSelms4Hu8=;
        b=HcAbBkXFkBshXyZwTSIxZlRuysRcYg34lSjB09SHlVioCMf7kwC/jugov+9GCfYvhz
         IbI/hL6KXdjjRxdbhzMaTMWL2mpKPYPmnmXoFdcKgJTUVJyA5vHm4IeWIfrtZeItNGbt
         TgJcSt2zScpPvzkQMAcWNS8s73RXywsQLHWFcQQC0w93KUM7HMrdmdYwpqFtfMhS4GbS
         PPSKymQArR/tro8iXiFkx766mEo2kL/ykOsVnqWThbx+pZzUt8/obNMz+zt4LgGYu7/k
         umvNLvmt2E0kIudyRxzgo49S9FUkkJVgiq8DDGJZrFdUJDjZ3Yq1Dy9RtkHGCwigGvkg
         5xvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Rs921JO1c6nVM9PjRxn0rvYnVLQXVyL4leDIEVunO7vOzevQO7UhYD8X6Nsaj4SE5PAE7Ac2ivYqzhcxJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJI/KUrpjnCQwQ3op1i10D9LrCqDtP+J8bgqEGG31xT5uJRvFJ
	VqCsMMcSBLNaJV+NIJsNZGZP3SHDQ7xy8Og+lc+kekltW9v63tGr9u08qp+rcs7RQyKVoQPqtzK
	NPfe4TqG2ChHWfWRVUa3Jai9W/DeZB2kHowFD0pUN9xbgajvLcVURF9KdPxQzHeCapMq4
X-Gm-Gg: AeBDieuGCHFzAwYLJqJtveeDr4pybkrJAEjB3tgLsRC5AE3odk2wrMuhWW843vaD/QW
	7WqCf1ycqjm3qSEmL9wF3mR/EX2/JHNrBusbNRWmB1vieTBmkiS61fy1u3TvJssx/FVkNdzO3V3
	csTsJeVOl/HP7swR9iSFjRlTeY/uaK9kjfY8LmEe2cgKN9h7lrn1lsK1/ukW2M68+amAzpzuYb3
	Ptq/FbH1c80L4KnMz+1gSPg8xEl+25DMJGAhbSBjzb0RnfUBc4j5qcNaz64gHgaDrqioqP1kg9o
	AVdiVGUQ3pwHiipPmc60OBPuIUtH65HwOivE/olUYTrcXDJ+yC0zdFPgE+ALO89MDSWAv5o2qSz
	PfXMoH785WCvbyBGniOIiKljQVmyE+69MZa8WYsz48E8aSMOrnJ1+tTlbv86C8dlM0sV86GhOgl
	gGmd2WXEpQelBhcGD3ASU=
X-Received: by 2002:a05:6a00:883:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-834ddbd42f5mr1589828b3a.38.1777355679072;
        Mon, 27 Apr 2026 22:54:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:883:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-834ddbd42f5mr1589809b3a.38.1777355678595;
        Mon, 27 Apr 2026 22:54:38 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae22ea6sm1590630b3a.23.2026.04.27.22.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:54:38 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:54:21 +0800
Subject: [PATCH v2] arm64: dts: qcom: monaco: fix wrong connection for the
 replicator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-fix-monaco-coresight-dt-v2-1-2293259bbd10@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI1L8GkC/4WNQQrCQAxFryJZmzIdrCOuvId0UTPTNmAbndSil
 N7d2AtIIPA+Py8LaMqcFM67BXKaWVlGA7/fAfXN2CXkaAze+aM7+IAtv3GQsSFBkpyUu37COKF
 38RQ9VbcqENj1IyerbuZrbdyzTpI/26O5/KX/nXOJNsEFV4bWO6ouolo8X82dZBgKW1Cv6/oFt
 IkCTMUAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777355675; l=2816;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=rqXL46s5rfAo1aFBC3py/cLftxsRGHrgD+Y5cVyGBHU=;
 b=MxYpcizJj5ch9lKYV8RZ2R2NALO/yFR9Fu0i4+0sgUZep3jLfMMoGXhDnW7igqJmHggYXaNs9
 ZGFb1HWf/uzDmotaraogz5UOMmjpqntN5kvxEDZCj2v7DCP2AjzcSlc
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f04ba0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JzNmrNgVyS65FeyOR0gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Kog0eNnEWJ62wbf_29iZzX-QfrRMR1mH
X-Proofpoint-ORIG-GUID: Kog0eNnEWJ62wbf_29iZzX-QfrRMR1mH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1MSBTYWx0ZWRfXw4BRrGy9fZrr
 5YpC0e7Tlj6Q8WMc3DhJgl2ZOIs5eKJ3x9zrRFSxCazuCrJ60paO1q8rXMXyrMNcDJ9gr8ruSV4
 3v/KNGY3hQeZCtXWfTwY7+wxFm8qMLd6t0tDrozBgGwRb0oFJ6VPpc3r41Uf7bnkLFS/IcmZabf
 SE1ke6Gu52wLQAkFwAqQZhXCkaxu1qlbZzzA+mIf3gxK094zwXp0TkMGLzeIEJmV0YVoXjaNqEd
 EofV+weLq/JEgFpl1X5b/IkUQlfDhi7VPSY5UIxj91H/8xASVxHvyyNuLHcYdFqmdL7kydQICB7
 mnOySM6YXudKoPvIaxr5jwOvSYY15fCgsbAYpUW1ny6K35T76B4RId+GMqt5UVZPgDVAGHQyi9K
 nZWKpTWhba9wGsvr6rxgkNjSwPGEYqllFDTJn3Yoo3jJ1Y5ax9JmI+oSknPaixeVVrOx8Jfox3Z
 ZipMAHBub1Rkh5RQsBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280051
X-Rspamd-Queue-Id: 2190847DC7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-104868-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.522];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:104.64.211.4:c];
	RCVD_COUNT_SEVEN(0.00)[7]

Fix the wrong connection for the qdss replicator device.

Fixes: 4f791e008807a ("arm64: dts: qcom: monaco: Add CTCU and ETR nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in v2:
1. correct the Fixes tag with correct commit
2. expand the git diff for reviewing
- Link to v1: https://lore.kernel.org/r/20260427-fix-monaco-coresight-dt-v1-1-1707017f20c5@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..50fd8cea88b9 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2996,48 +2996,40 @@ stm@4002000 {
 			out-ports {
 				port {
 					stm_out: endpoint {
 						remote-endpoint = <&funnel0_in7>;
 					};
 				};
 			};
 		};
 
 		tpda@4004000 {
 			compatible = "qcom,coresight-tpda", "arm,primecell";
 			reg = <0x0 0x04004000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-
-					swao_rep_out0: endpoint {
-						remote-endpoint = <&qdss_rep_in>;
-					};
-				};
-
 				port@1 {
 					reg = <1>;
 
 					qdss_tpda_in1: endpoint {
 						remote-endpoint = <&qdss_tpdm1_out>;
 					};
 				};
 			};
 
 			out-ports {
 				port {
 					qdss_tpda_out: endpoint {
 						remote-endpoint = <&funnel0_in6>;
 					};
 				};
 			};
 		};
 
 		tpdm@400f000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
@@ -3713,40 +3705,48 @@ etf0_out: endpoint {
 
 		replicator@4b06000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
 			reg = <0x0 0x04b06000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				port {
 					swao_rep_in: endpoint {
 						remote-endpoint = <&etf0_out>;
 					};
 				};
 			};
 
 			out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
 					swao_rep_out1: endpoint {
 						remote-endpoint = <&eud_in>;
 					};
 				};
 			};
 		};
 
 		tpda@4b08000 {
 			compatible = "qcom,coresight-tpda", "arm,primecell";
 			reg = <0x0 0x04b08000 0x0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260427-fix-monaco-coresight-dt-20d8d2c5b57c

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


