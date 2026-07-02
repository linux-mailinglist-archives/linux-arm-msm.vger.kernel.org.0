Return-Path: <linux-arm-msm+bounces-115851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HCi1EIEXRmqtJgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:47:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AECD96F4598
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 09:47:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WQKom3Sm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VrQ8wAup;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115851-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115851-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E50A2313060E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 07:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B3B3955FD;
	Thu,  2 Jul 2026 07:36:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1748F395DAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 07:36:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977779; cv=none; b=EtewovPP+wl7Kviuvywa1yZXIckcOuul6ytbEXoBvYJqA4opFUvVYcCfBsxY73z2ACY1ehgCwiLeNjLzCliMIy6qd2M8GidCJmR1nxd1EOCrS5qa7bWU5fFvjx67NNGZfG1+GAstLvULK8dHjJCEgWbZYuemwME+uf1WihWPj30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977779; c=relaxed/simple;
	bh=6jQRMNJl/gw8t7JYSaZLMQkxtKt5QXOnlR+a/k+6E68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qG7pKAanhOLuF9VRtQJq0N3DNZINsSUAz41cHIIT2sMxTlEoyfPhSG+mC8vvlmDUxI3mEOtzYSDBn22g3BfmNUBVoPMnTCqWhjkUpvyz4TM4lhKtOqQZKcpXgH2jCqm5HOd8zFG/rFRpwoQ7cVo1J+tp1HKc2OkLjRbWHB1Ka3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WQKom3Sm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VrQ8wAup; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624i9DB3590859
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhJ+5oXH8W5RgGz/VLjVtA75jypWFCZk+V5AdTwtM2M=; b=WQKom3SmIDjG79a8
	/SfOXYmoAd2keqv09JjC9OBwHt+LKWXqHiIDxfxZtm0JIFeYE7DnobWv+qDgjQLn
	abudbvbNd7+UbQg/GOzjvKKKa6Ob1OP056/Ss8c2a4DvXSn3z+JZRtNrXaGAUlig
	mzd1IfkNlx6gIePCP0DWmF1WfwZelci/zKzA2ai1ZESGuYOfEtDfZcQYcUZ5rjrx
	KeZ7iErVdNXL2C1ezUGZkIqt6bkQGMce/x5MAaMo7bVPr/Qd4CDPX+7Lobbbpf27
	D18CWLkpUs/wnu9fWg9qQ3RfAg3WoQlZKnwaj1XqKluET9xidHYKg9o865LulReY
	VjYeaQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n8jry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:36:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso2381055ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977777; x=1783582577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhJ+5oXH8W5RgGz/VLjVtA75jypWFCZk+V5AdTwtM2M=;
        b=VrQ8wAupRBbB3O3Zc21nK+6PaJDPLPsk77ZgBfCBkOZIe5ycmEuRzObgFYa9JQk1g7
         p8R4e1CSerKX/W07z+DoppII6tbHL72Mx+HZNQWyaFbxNDMSgJOLQUoaxGJaDngTvQKV
         ZZls3qQPCRjVjmZnFDCc54cCykFh+HfA7F57pMpdFJbDnYLuPest7uR/lVgka/z0lnRB
         lIuTMdOMzRwZOhjE6TNQvE0N1NyeD7+HqiZgOsPfVMOFM9XToQ1CcpSfVG9clUhjKKjn
         8feJhS4dyIKZBudHQF/2XLeKlzfuf6ae1PLD/wZBnSyp7PCqXFCibs4DExmz8aWa/M0c
         7E7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977777; x=1783582577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhJ+5oXH8W5RgGz/VLjVtA75jypWFCZk+V5AdTwtM2M=;
        b=UJAj1GqHrDLwrKpO9ufMJY3k20Je6REeAMJ06tl93aJcz/pVGPjqBhZlSLLTtO1Aq2
         WmAD8Rg5/aL7N8WQimoKOaaOaNjv+L0AcmaxU83VXuddmLRGH90OWedvA2DidHxbN+2s
         YJjkE2d1U8FiPbmD37dO1Nmht/T+dC4AsKF605kM3NnWyEn+Ew4glsVwI9jj7Z5JN/J3
         M7mWYVHAnLBQuIrrPgX++Hj4Zf1Bdh0+YkvZ97uSOFxVgtnPp7CCoPMejXHFZJRET2b1
         jsmlDoWwdy4i+jtSdhZ0kygMJJoTEYnytcxRQspTBHbm1ttip5S4CDgdGcHR6JqwaPf/
         fXdQ==
X-Gm-Message-State: AOJu0Ywm4bNLJE0hZmsAQ1qWVBNwYpt0PTgy0/bIrTOu5y2449smjf96
	c+e1I9iLpI566caT3SeEZqW+AKsCkRu6MhikZnfRPB5lBS1HvFF3Tv655WMkg5Id8IHpENuZSeY
	lo7KWXJz3YE9La+GqpyMdrbIcktsT5hENn3y0dRtfCsHN7FL/lTbepLExpUspsOA04cNz
X-Gm-Gg: AfdE7cmG+UwP/qxGz7Yr6b9ylY9hekK8uRWI3h860Y2MrnOMvEv/SB5HLZUJOx+ClnD
	Bnfg409+7SUXwGC+YJ6/NmB3MD4Iss2f2myEDSEGLsMqj04QLoHws8XfbJGCATNezDWAhibemLB
	nLi3E60p3PqTUhZ7TTtzdsnToufKveyaZnRUaoHlxIah9xqIyJPzWer88bi5KmiLO2hEUX7p78m
	9Wdx8l1zeJ/6bTvbZsNzeX7pgjMte3UWdS4XCZK0kVyN9bjs15ee0y+hKMJjEE55tCzzImy3UTy
	JvoqwN0o02MmJEqA1RUY2eibLeGDWi6ClR0ubdasqzejZijmxo5Tf+c2I/fJ6/mfWeCBSmHri2F
	47vdVexrYiKYSiriGciUWJHyeNLx33zbia68q4jYEkAeB1SsU6UQVU2Y64w==
X-Received: by 2002:a17:903:41ce:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2ca44a3dc4bmr84215565ad.30.1782977776473;
        Thu, 02 Jul 2026 00:36:16 -0700 (PDT)
X-Received: by 2002:a17:903:41ce:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2ca44a3dc4bmr84215335ad.30.1782977775972;
        Thu, 02 Jul 2026 00:36:15 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:15 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:11 -0700
Subject: [PATCH v7 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-1-776f2811b7af@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977772; l=5559;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=6jQRMNJl/gw8t7JYSaZLMQkxtKt5QXOnlR+a/k+6E68=;
 b=Pk1Qy9VjAhMz1xxuzyr9zMXWsYCkr0gvBhMwACchJo8r+4aLQTLoRoslWd89S4lqiTzuAlrZp
 5zfeSQ+Qqx/BrDYKSG0CxwN4HrDVwmLfLAMJ2MLNQwvMcImUVUb7KkX
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX1v84N0PxpFMp
 BqKLrBY5+AYgmw0w2aaqjihFgN5yNXKwD4PhK6fKO9tGKlR1BouZuYfPm+NU258E84mMGyIHtdN
 sKoqC0IGm4BqbNfK51mfHB21+TS/liWzSPeICvlDliGd/WDFYXBcaLSb76tRDRwiwPXJOMQFd5U
 kMvH7Y/4hzPdB6c7MaA+KCJ0UHuCcIoH/5HIpTWF5pwvrm4AY15LIFivrpRuijJU4QSxMO+UsYp
 QjE8Njto1k5j+nherKLblSNAJU4RvHUZQ23beVfZ5kye5zCuflL3Vp3xKUfU+FO+aqO3OXb71Lr
 yxpAvI0bVFOgRHEq96MbJF0VEkCh8F3vuw9wp4ZWe5k4LN3M1XWR4Zo6dmU9WH3DQlCvbdQVPEw
 gq93ET1NTp1mDV9e4gzNlDpHwJjjEl2DvFlES/OdK83NnRB9jBlyrsuHPdu44nJ/QFeObaJv352
 ZPLQXZSFQerlFAUBMIg==
X-Proofpoint-ORIG-GUID: iF50-fLP4SGOBIZahx90iW-rUjTQS1i_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfXxuN1EOPLnAMU
 n3Zao2VB5OmmUtQNiOfdR8kjDtSldjFaUxvgIOnPINAcLZ96RYTlI+1lntBeb/qF4DomlC/rd7s
 RohTaBYRJmg0VT37ZP3jI0QxrYrBoSQ=
X-Proofpoint-GUID: iF50-fLP4SGOBIZahx90iW-rUjTQS1i_
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a4614f1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=12nZpKSYVJl7DlM_WUUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115851-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: AECD96F4598

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
(clkref_en registers) resides in TCSR on glymur. Since QREF has no
dedicated DT node of its own, these supply properties are placed in the
TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and document the supply
properties. As this binding will grow to cover more SoCs, mark the
required supplies per compatible using an allOf/if/then conditional.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 126 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..ec89feff89e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1


