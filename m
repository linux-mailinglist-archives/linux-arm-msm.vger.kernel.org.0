Return-Path: <linux-arm-msm+bounces-102232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGxzFexl1Wm05gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:15:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE66E3B46EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:15:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58F1F3038A7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 20:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9DA37881A;
	Tue,  7 Apr 2026 20:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrnR7a7F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U953loyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074826158C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 20:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775592929; cv=none; b=Rl69q+RVe1rO+M+Ef4v/QZu/VH6i0ko9qLB37P5XH5iQKWJpOwM6UCuLtBv7EUWbeOHn3lvoeKa4lROIF75aJZjmJCGbrWB/tFmj6RdSrqgqWBwh9FAepGR9yjJMQpURhmOL73J3QOggyvR3pP8OE6EQa8tJtNW8hW22BKHEF0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775592929; c=relaxed/simple;
	bh=EOjSV+hx5am1hJQ0T1nyIzb3oz989ichfBYCGocZx14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fYAKiFIpIgAlzwljeTaAv+T2jo4Tvj4f+b2MVsWMyD8voqY7W3MhqwNgDdtJDlmxfX5TMOYVtaRFtY9HqCI++3OeVOsfqEpUSDcfso47PLDfz5S2MQodCk1t0rmpL98mNeBR3vsDCcCjlDRsJ2d5p4NR/wDc05UxklLh0kfbixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrnR7a7F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U953loyR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J855H3362760
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 20:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0rDbyQz/c6MivIDznV5bMcqLFGjCu1yh2L4
	iF/Y2GZs=; b=NrnR7a7F54Thi7v+Z2IIcE7+5uIMb+TPnp8HH4l/e5cxnmDG+KR
	tzRZGJ5tRO+De+ufrSf52ip5F5Qpvpg6kFYeMwu5rM4ZtKgQwkvwa2l9vTkxmztU
	zCQzVg2PzjEqn7otad/SsgfmR3B5qE5MUPBdcMz4aNxTKRITHXYnJkHHCgCV20iJ
	Ji3Ynerlk7gd9OdO/D4j8MFJWy1Fusy58lXRKJjOzPgJsBkpz7g3DMCAg/X20G1x
	GMdK0SbZH9etkJgmfAFdAP9dcLONTSPlAbktiUUcDQAUHVVJzNHNLO2HeecrqfJf
	RMrM6a0237fnilGkQcWZ5JVhTv2uKeuOK0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkg795-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 20:15:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5aa81907so44966351cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775592926; x=1776197726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rDbyQz/c6MivIDznV5bMcqLFGjCu1yh2L4iF/Y2GZs=;
        b=U953loyRYSoTzsEUXfIgAybaJ011dzOSPy4UQ2bCmuDnpeS7AbvaKC5rbazLs3+O4a
         4t/JYX+wdcRIM2ko3PjjjwX3LGBI4fc7NCiMkzd7Q436GcSeSMWGKwYXH0qvAF2SGScD
         MuNNOhKbYkZFPDoaYkkYNg3jPeIbOuFQWP7gXaFNXT4fOtGOs02n47x6+j5VXKPrjYt1
         QKVOYV6GFgWqiF2xxBbbfk6ZnaFP+jrKAz9WMYtbmfBIqYxCxqtAfTb9d2cXnSccNCW6
         rkB4tXn8esxX453e+F3W/fdyi0/iTG6Z1+M2KpiC6jtHj2Mm22A3mB3HTJCAzKq7+ZrO
         7NJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775592926; x=1776197726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rDbyQz/c6MivIDznV5bMcqLFGjCu1yh2L4iF/Y2GZs=;
        b=rjTlyLxqJfQ/ANBIaTLaL00MQymidMFQsaYnaKHOfbioHSBDmhionCh6BHv5deYl0o
         16N6d2M0nmF/bhbr+1iuFNCZU8i3pvnolDPbt46qrmj/XSKDGVfiSr7H+cngrA9N95JO
         1SDgVf5WQGh0nM32+wqIdxid3bSNQ8SnTDKkxvGYdIvIWnyBK41bKi6P8i0sLP8+MIhS
         csLQV9Otr2F1pUORtSSCwaUEnUL209LUVlqn0CMBOGKyhU8BDMPbg17A2fPfPVW/biqP
         NKCYM0UL6Z0nVyWdNCUlT7fUOpk0pq98gvtUkIyuweO5qhgB+weSLbDkvim5knkWHrmX
         MfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgVxJ0Tz02AVcs27OMNzO7fCg0idXRSMf18oOp+mG6nJGqDpS6c1RGooN1VCU6yc4f9BJyx+MkzF0SbXYL@vger.kernel.org
X-Gm-Message-State: AOJu0YxCW5/3rTH4ZAx493qpsPDjtbcSiZVL/wTX5WUS5njKPo6QKSuQ
	QWsBUWBlwCd+zEQo5GhlmSGiI39fsNZlZCL/SaVIqr/1+V8gD4OVa/ZIEg4xGSKkPfAs4U6iyTz
	nT6mQdYhffgbtXxokjHqQI2aVov3MuJDNnvJl2w5Aft34XCR16Xldl6Pw6D7S74G4MEOs
X-Gm-Gg: AeBDieseEHOpftHqJWABMMV+smIcaD1PIsUgWIRa/1oHclSWOizY19lndG6fm01+BJt
	+6AQZ48LKuCnLeoOEj0M5HFJQaGggoCKPcOdS5DnjY7Ru5OpkAoIT6ZBvGBzR+S/9X7MHdljNbx
	aKBTrBOtBayMEnErpEcUShrqXe8pXQHTecZTCSFaWHQnVH2I90QsoFx0VDMmM/pRWSzMi5+9rlV
	vQnr7po1maOxKXVCsVOopIsCEoimBqsYppcFNdVEMT8L7RaTaA/HKRjghn8pfCTbL4SbggZ1QwN
	+Budlw4Xf5L2ee3e4p/O110oyfz8hhbXEoXtDEz9SmNj7j33ysOg4M4ukmoFU8Y3xpEfg8ZX5ev
	7bvXuIurtJuJDqjjZRZxFeEN11FpvLc75dHj5
X-Received: by 2002:a05:622a:315:b0:50b:534f:4292 with SMTP id d75a77b69052e-50d62a970e0mr267678571cf.35.1775592925627;
        Tue, 07 Apr 2026 13:15:25 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:50b:534f:4292 with SMTP id d75a77b69052e-50d62a970e0mr267678051cf.35.1775592925114;
        Tue, 07 Apr 2026 13:15:25 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c1c5291esm80966785e9.15.2026.04.07.13.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 13:15:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco: Add default GIC address cells
Date: Tue,  7 Apr 2026 22:15:19 +0200
Message-ID: <20260407201518.24949-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=EOjSV+hx5am1hJQ0T1nyIzb3oz989ichfBYCGocZx14=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1WXWJRX9OFyzaCV1QUNkuSy34/gJnfCUdh0Tc
 7nQAeDI8YqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadVl1gAKCRDBN2bmhouD
 1wlRD/9XMCsb+f2kXTrGhngHJ8rYhs5zxDqOphhpQij0Pn4x7LglJQ87TmUizU6XTYNKXw7Ik/g
 djXHEzNGuIdDFwsJzwPyazmkgABM3MfyGGa2h62zL8EHAbAhHuh651rB9W1hDPMtz9KD4WXm28Y
 tSa4ZUGNZN9oAEhQWmha+KBStLu397+GYVUeqeN1e5TvEQDJRCMKxAlnTVeA2syg8WwvOtsRbLc
 dy9U3aw3ri+7bZywRTtyfiQZNTTzRiY1OvslYXcXJ74+pfUR0Y4PhYv+4rMcmqczzLQhQTwmWsY
 bUKiOn8/RPs2GFS3o67iInqpWjVca1+BQCLlVIiyyr2/N31M1MHddErshgKBrhcfgCzMdPccjCk
 0qobiCo5cuJLj6v69/j2+wR8R7PU/M2RCBKxdDuIcZQ/7wCxxVJqCipXX/aNi7D2wCq3csgvYaA
 0nPLvQJrj4id3qcD+YQlKeLwoWQJ4ePjBCRFeZkKqk8XtPaQlEzQMAwx+zwHeQx80rCPyaMpAJ9
 wc3sRVuEcpZy5b5AU4wdfsCUcOnxmpa8T4UDj974+z5KJmARmJUKfKRncXtKQDWP1jD6vkUfnK+
 ZfTJRrLmfQN68M+2CV/xsJjGQ+Sl/zA8PeWi/ZeIpWak56uEQDeg/tmP+jXgMZbgwunW/msvM6b OLwm/ExEj9Vd3+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d565de cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2mHS39Au44Gi0sajd_UA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sRvoTFFhVrjCqPLzoEZhtnS-mGUbQULc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE4NCBTYWx0ZWRfX3ipi2DfFI+4B
 zGFw9aBelRhkQz7f64p+HSU+0rNvAM0tnkVLAx1G3NJpeT188P2dNXdbdY7moR8k4nRc2bwH1hQ
 3epVvYuyX7WQPT+VZUjyJMQ1tdvsjiArCCik0YDlFq6ce2xPRzmlJkEew7YAbzNSaIgIWKSU30P
 OMDHMLUaXbWh2uwWch/rRi+ILffWAkuubAA1//QkcdPoxycNyBbD2i0WBFl6i6BP9UAeBhCy/9S
 VaUaKPTfcaffgLZO4O9ZkGIqYKQRY3qn1WlAIgKuybJ3kcnZ5mi7oOTGFMAOaZtxg7kmpbiQkeP
 VKnoYu1kqFDvZ3q2jvKhzRFQgA4LRZ2fCVnkCAZcSiAH6x231x4wrSQ1y8P+oRPlR97eMhikizf
 E3yX/hDEXMt2X9GBkozLE3kXQzBr70FX3xiHDaHxfxfJOq1jtjD6STOgZ0UGyqK3gznjNa4a5si
 uzxqaZXHhCvAVi5mBrw==
X-Proofpoint-GUID: sRvoTFFhVrjCqPLzoEZhtnS-mGUbQULc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102232-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,1c00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE66E3B46EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  monaco.dtsi:2326.4-2329.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component 'parent unit address', which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0).

Fixes: 46a7c01e7e9d ("arm64: dts: qcom: qcs8300: enable pcie0")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Fix for v7.0-rcX.
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 7b1d57460f1e..5f060b24d52e 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7380,6 +7380,7 @@ intc: interrupt-controller@17a00000 {
 			interrupt-controller;
 			#redistributor-regions = <1>;
 			redistributor-stride = <0x0 0x20000>;
+			#address-cells = <0>;
 		};
 
 		watchdog@17c10000 {
-- 
2.51.0


