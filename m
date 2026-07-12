Return-Path: <linux-arm-msm+bounces-118587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 68wXIwKzU2qAdwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:30:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 347EB745310
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:30:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lxua+DoV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VliNW3lC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A502300A75F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF0433F8CA;
	Sun, 12 Jul 2026 15:28:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620CA340416
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870137; cv=none; b=b4G9MQ380T8p0uih3DocpoqHQKWZB/0fqa/ggbD7nd8TKWsc0jCc8DNcZQQxF+tMkjKT6pdyLNsUKKujN511V+uwuMod5f7H9xCuqBMJgpJ8HD95YNec08ioC1EyDWL8FMnZStOdP1Xw5teqUHMCm9pUfz5DcjgozZGhrEc89U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870137; c=relaxed/simple;
	bh=pa1uBKrJaaxo4mIls2wPcMnmCJPRxvh1/dRvY121X/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXnFeuCQpHAVgG/GPJ4NDC5pszmOC0XC3cdlR/5ys5xawKzcxZxzhDoJRaMAul8Q2j607gnOqRR52TrmjSVkjgvTyzhjlwqOwfieMmCCFbzuN/sQhPodNzpYaL3ZzbPXwuD8cUvGauDAr+18671JyLyEuypdSrBbxCjLk64Ut4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxua+DoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VliNW3lC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZhBq2749883
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTLfXqR33lpyP52Ix+0HK2NQsXaqxIC8ssOzv9Yh/EA=; b=lxua+DoVZHw5hhbI
	SxC/laIajh+K2OaRYCRFrOVPgrN09M0EZ9dxAJtgmT0dq28g37lT3FJyWVGBBeLp
	C438GzKsI4sj7FV8j2e4MgWUddsCWWHTz80QVs4bp9RJTSSF0h0isMN4p8bxeBH8
	Gf8Jwn1oom8B0tRykpeg/kspDLZs+GkFa/iSQCO5UIuO0RD70dhqxkWyX6y8DTZI
	Eziff8rjeZs1BxM8OqAATAgDj0UfNXdE8lzgnRe9xhiR3kdTJOj06U+I+qKkBeOb
	RmGAKwYnIIFD3crkwofkBn30sgV1CpBgcbGEot6IY3acawds+iUTGzUVBEO2sEQD
	6j/t4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgk264-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:28:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so3113456a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870134; x=1784474934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTLfXqR33lpyP52Ix+0HK2NQsXaqxIC8ssOzv9Yh/EA=;
        b=VliNW3lCPk6Fj+hsYOkgIf2dsCCVNIkiyok/5nNWHk5PgK4Slk3G0E9RyFbx/1n/4Z
         DzXSDUy3HHXiQvZZ5RIEUIcAZsFpjzkOujwEqCkSisRjXOlWc65M0M3hEo+UGnXRaqJw
         9YfVhxQRAvTueP9WrSaF/8xyZh8BjFNQhd+WHeKAQEuLo/5hLRMYdsHfyhjTzp32uJIH
         gJbDB+n7VrE9O3JyxuNsu6z8ka0N8+mHjwevBVwKxymzwB3JUpIpiqRFolp31PsD4XaI
         EvPVHcyOPVwPnf9du5Kk6hBhAHeAv8ZDIvSg2KA9RZtvz2S/ml63pCyviURixAsKkbzC
         SF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870134; x=1784474934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTLfXqR33lpyP52Ix+0HK2NQsXaqxIC8ssOzv9Yh/EA=;
        b=UmRuuVcfedS49LDqFBsJLefIvKTaqW/o5wit8qnWQqg19MffHFB3RRjcENf9SpwqLt
         k52eC8Xj+dQptLi7h25ylxF5yN/l5Qz/mijkud2YAt1njuFl4QERK/uDa1DqT+FMakgS
         cBBSS9klQKCpCPfTXmucZOKfRNRJATvec5yXBI8wofj3q5lSlQcMwhu2iLad25WoNFoz
         3CmIiqJHUtAp4MwhEWqCjsur0EKxbTngWeWTlRiw6ItUNo7e/O4qfTEc5LSSxdjpqXfu
         9cH4mIoRiZkaghcQyMop9HIMGSHZ8vCi6Y/iQngbfokRDWKylIaJgdvjnnVLJcLbjAWb
         13Ww==
X-Gm-Message-State: AOJu0YxAu4m+sIIwbwh7RMiYHl+L9klDvSKDvzm7QOryaSJ1gyW/F/Ge
	YzfpI6pMoMi+VYfVLqjcXN3XiU3PbXQPLniBUNcVL2/mk1aSqmFwUPQoDda7LsFuUn6Qf4YEpqf
	Qdhua4aWUc0AX0J1I8v9qnA22uGZjUM+iHJ+2Zf1VkRIPjJcDy8Ny82dzZwVTfwsDk90n
X-Gm-Gg: AfdE7cmX9B6NMnSj+U6bcRRUIWUBEvm9hyPKL6nx1sI1scbOmC+C11lL9a3d31khHBB
	v3wZvvU8yaoQreR1THTGTsd7R7Pxh23WoeBgyEAFdpseSpjbf1L88eGJhlzWTjgb2vRX0KgEoy7
	hr/rrNbsN7CtAYjoyVDQFlS9dwQX8uIarFVNkW9RuCZ+NmEmkkhFpLpjMJHj2phFfEDNr+QmrB6
	rhpK7WjApOez04JezB1iPQySSy+g1wDhBsXw8yLSaDfzsACHKHLexd76htKoLRJfGAdrd1mC024
	EP3EywiGfkI7+mnkmY3DEClgwxsqaIMHIWmysyGaqtz1NQYKOTBv2PtCcvK887Cdvnz7zIQLtn4
	9+CFdSlYAqjHnIM5Srbvsz7DhRafbdlbCkTHbVVnDDw0veG1+/v0SZAwyxwDE3Q5JNWemoGCuVX
	7Oh2ug
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr4853279a91.15.1783870134292;
        Sun, 12 Jul 2026 08:28:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr4853257a91.15.1783870133855;
        Sun, 12 Jul 2026 08:28:53 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:35 +0530
Subject: [PATCH v6 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=2707;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=pa1uBKrJaaxo4mIls2wPcMnmCJPRxvh1/dRvY121X/4=;
 b=jFQRmxwZFpX6DQoCl4CLus+aF7XaIltggdJxmaYCfTHV8GOZORXSipc6EXyDGh9UDr+F7P2u/
 SqghEsIgir8B6hnqwwuv8E9ZQ1A+LIyEMv6s/oN7Xr022gvVmucF2WQ
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfXzkLi5ODeMxHO
 2J0WEzGirsmMEyjMRs2BQfERKHcYIP/4b+v8owtbRGlMr9QfVTXVTMBhJPKFFzuoJfZu/Wbvml5
 epTjludjSgrbws2zJoN2IT7/wOPxS/w=
X-Proofpoint-ORIG-GUID: vv_W3T11sSHPC5xnyhTRgFFpmYH6-lze
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX9rLh0t/OwPNt
 oaK3+bpu9w1EMWSG76RB6YLfpg5QCNelK3JlqAQoQWRksyChhMKTnoHAtZuCSJL5uaqi3mu8Sb9
 ZYonDOamm+bTFk4DBGl0SjMmxZdN+HgBiW/+ymeMrZoAVX3pQvten1yuQeSO6bZXF4WMb4WXKuU
 X8ye8JDDHsCDicyBfdfGFbpP+9rnAiNkUtVnK2eJkSgYJOkysta4wFTFC2JphtfPbxg532RHRy4
 wUiA1k51Uew5wZZvKTYjLBS3j4D1GYi6gLuwsR7+9Wmoa/OMhloD9TOKgwwh2lC9PaFs5UbrMTx
 92wkZoSZJT4jFG9S2VtOr6EkknBMNXCwZmIHZ96FCqsBXgDNDtdGKdwiS9O9sjzP20K1KO1I5vX
 BVFelHBNKrAqQFsBcXkIcisUVWGGwQ/yX8qxcjZc1JlAME3wQVsNYKYN2ZBWOF4KjA0l3/4f/g5
 U2sx00MQOXxQTEGuIzw==
X-Proofpoint-GUID: vv_W3T11sSHPC5xnyhTRgFFpmYH6-lze
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a53b2b7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ufZ60yBX7R2ALNXMlhoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165
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
	TAGGED_FROM(0.00)[bounces-118587-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 347EB745310

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. As per the hardware
documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".

Also, add remote endpoints and orientation switch support for getting
Type-C orientation information.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 49 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..98397006fa62 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs615-qmp-usb3-dp-phy
+      - qcom,shikra-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +34,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
@@ -63,6 +67,22 @@ properties:
           - description: offset of the PHY mode register
     description: Clamp and PHY mode register present in the TCSR
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -78,6 +98,33 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          maxItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,qcs615-gcc.h>

-- 
2.34.1


