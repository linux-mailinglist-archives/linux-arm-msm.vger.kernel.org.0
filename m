Return-Path: <linux-arm-msm+bounces-99112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP8eMZHqwGl6OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:24:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DD2ED7FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 438C13049965
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B3A35E937;
	Mon, 23 Mar 2026 07:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAGnR+EN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHAEwqS2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07335DA6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250137; cv=none; b=ZqOq/qd7MU68WrgKXD80/x4ocECKgeVF0f7HvubtIIjp9EE/GidlN7T/S/8Z0Vq6jdrI7rkFeX9gTUuP+I/x98yjDHjAO5pmi7ixUMkH3Q4PMmIXvcvUKMuuZCmVxVFrjRkcng4fR3bhPQ49Z/t1xKPH7BQbr5SNJELewZoHrw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250137; c=relaxed/simple;
	bh=0cxDH4J+ogpnd/2Sh8T/+lD9ulgjspAUfkAYG3Mt/CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7uDoW4/xsJ/gtBNE4//G9iKS61QIMoCvLnrj87aKQ39KH9lC/6Jtlo2mDOK0i//igQxPQPcsUdRk9wMlIelhz5HYyItuoWfdhVMOKaNWuUr71iGD2q95kaO2a6MV1BDAl8I4/FunCQr9ZCRgQuWvQA2qPqa2Om4ZyFjFAKxhaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAGnR+EN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHAEwqS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MLwQpF1200097
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+feDmpxyjcw2Gpw8JLF/SSE3a9sEyKxeVIjgMxiPBLY=; b=CAGnR+EN3TJiewZN
	OE1KnCv2HAKAwEteVPU6awedPhRyWcl8MuvNDqC6SsgvuukzEN2gybHHagN3vrJ1
	0vFzNLJUxldkJa0aJeiZ6hFFbLsGDFqwWbrq+I8umEVM7VGrsKi/vw7l1vOV8gb2
	TXYogGg+PkomzGSk6/zeocoP2YcFiSuKjbaQ0myc3YZ+n6guzKhN77EVY/HDVUOe
	9Vi/FRbJCurNxERX2+wQU7TSflmjEI3YJzRTm/SFFvSi6mNvpSieyNDYi7SgAk/J
	vHLqNXiSFGF5AHWlyocAhKPooHGmwAHcSu/JbwGnmgSBVfKIKN+AQrp3daP34R62
	lLX9wQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5v7e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c105e5ac70so2777123eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250134; x=1774854934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+feDmpxyjcw2Gpw8JLF/SSE3a9sEyKxeVIjgMxiPBLY=;
        b=fHAEwqS2TkQcjLufWV+f8Xl5GK68l+q5b5RHqyk/PlkVf+mfnnCoA3jjmwhnsfmMvO
         bsNAmIINhPbJSTPL63wMgi2nYJIbL+qFAef7kssEKf9x4LhEGjhy4zgqpboTynHt5bp0
         6gAA/6rKiqmOy3sURroT1nyukbet0jBShyKI48y6Lb//X6Q57DrjMpbw0thkgRK8CkVh
         kRzUh4dKCE6Pv5E3vHyCIF8ePuA3p4C9wLW/oZtD7eD4HyYQWKmmIEncE1ZHu3UJTzgJ
         /nzA1vkmpPiFPC54pUYJadzenszRpUooyu83bv/sYeVlDoE3wswKByMB0AevcGZ2YKsE
         7z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250134; x=1774854934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+feDmpxyjcw2Gpw8JLF/SSE3a9sEyKxeVIjgMxiPBLY=;
        b=CFLmuLlpe99GcqAVRxP8x11EFaXfZWuyED/CBwPbB0HJ2p4ieJcNQytFqFyaIth8Bm
         JoiJx+VMl3lzIHqmWqXsTqRyUIGZgerg7sF8KXo2Ofv1px9CRbLxRtotXJBVkXb3EQ59
         5MySxjb9HrJuP8zOpvKbavMPSGvRrvHiSk5kAFSSpOPxfBWbqYMbYtgc6b1Fv8hZI2Pd
         /WUHlVXtd5WKJi7gEXtHheqdogCwDtxL5ljuykm2PjhsEG5UM7qTwzoAlCmDppoFYj72
         8u4ENKv225zLS+Dn7Q1NemlAnFb7SGkcEENlNjIlbvxZlrSQoAN77yc36brIRIQAmJM4
         m8hg==
X-Gm-Message-State: AOJu0YwLlGM3o77cOaUrl7ZepArZd1RuodWePDM6cb0f08oHeLi0Q9qm
	gDd5x0UfcWhB2w/JCJhDzUiYhMK3hM44blsAagHNwsqJAZTdHLpDcLOSggBrqw79uGJou3NNji6
	xG+2j6zFoULgyigxddAW5N2G0myi15KHdQ/IRHbexy+LifT/oMr2esKmxJURDd/aDz3UE
X-Gm-Gg: ATEYQzxVASk1O6eHKDjV+q2VUBCLmsUMqPdPz1xpyngetrhH1gb4K029T0tYzq63267
	sdh0S8zHTHFdlLm03XnVr8HgUghLQsWG0MMTVFtrIZyopjj3/n0u6VejRzoOlU9HG+s96575NNs
	dVEfcEvlCmGPWP4hw9I7lXCYqaesP5XQidSUJAqQawjewmO7SisNI46Oh7KXXqss9qFsv0MHote
	6c0hhzPDY2DhXvTigsR4JO940+ytMP8uVbL5WnOtvspAZxdk5u9hqz3nxlK4buQyCsJAHOcpwL7
	+HOy9M899NnvmlHVLknhuKUvTGiQXVvwdih6oYmv14hjKuIVmXOD1TE4AMFhzgBgGxxL1okdH/K
	L2iLFBI7iEuRDqACscrTK5y9PNWDQZbcERxY399xsh+o6SIIBCjird1BPG2/rnwkcZbyo
X-Received: by 2002:a05:7300:2382:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2c1097c0938mr4561063eec.27.1774250134166;
        Mon, 23 Mar 2026 00:15:34 -0700 (PDT)
X-Received: by 2002:a05:7300:2382:b0:2ba:6aef:6959 with SMTP id 5a478bee46e88-2c1097c0938mr4561049eec.27.1774250133647;
        Mon, 23 Mar 2026 00:15:33 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm13997886eec.3.2026.03.23.00.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:15:32 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 00:15:28 -0700
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 support for glymur Gen5 x8 bifurcation mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-glymur_gen5x8_phy_0323-v2-1-ce0fc07f0e52@oss.qualcomm.com>
References: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
In-Reply-To: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774250130; l=3719;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=0cxDH4J+ogpnd/2Sh8T/+lD9ulgjspAUfkAYG3Mt/CY=;
 b=TKbSq0yuYb3Fe94qzlQGwjzQIQDc/sbsearhsGusfuWkOeh/nnkijAoxAlAijPB8IxtkofTtu
 H56m2yBdqZzC5saTMQ+XMFW2aQ8VEqrKsgWZqw/WsESp2wEuYK0xurU
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c0e897 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RFdnLZz7-LqoW1cxMWEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX/P7rFGPc7JR7
 QP3TnQHRTvrMva0gNzqWRMjNYiKv6ee/enSA1+j8MVCjgoEt5PEaH7ytDIcWjz4MSPWBPn04cTj
 QdiFnXFJSNjnBBMBqDlchMbIy44q6Kuy5w/GcoC8Q70z+Y+QgO/V2WyD34ft0C2ILwWczXChUEq
 1aV8LblxdKxeb7Yq3t+lgQhDLWNUZGmI7TXVJUUp94XLfJKTWbSTM4sUO3b7kIOwPk1LcPoMPvN
 9YAbKJEmyQRAgbN389i/Nv7fxs9HOwwU2IzGw5ZClBehC3FCO+wNwtixOQ70Kabn3GqNxfC/N3U
 AtKMQDnBogD0oWoEi0JVNhzWJyMRwY7DX4pEi/GXZNscT41dPby19RERy5ynfPnt/Szvys1UQGe
 wFqIqLAnj5GLykB7qrKtcpRhDcheWdEcXoiJYdC0/Nv4K7OgU6SOmigAK+fmdiz91w0SZ6Mc/Ve
 ncfwEzQYU9PTft37sqw==
X-Proofpoint-ORIG-GUID: F7jGaCEJQHwGSOYUJcNkQ1dRZQJO9Mu3
X-Proofpoint-GUID: F7jGaCEJQHwGSOYUJcNkQ1dRZQJO9Mu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99112-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 711DD2ED7FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Glymur SoC has pcie3a and pcie3b PHYs that can operate in two modes:

1. Independent 4-lane mode: Each PHY operates as a separate PCIe Gen5
   4-lane interface, compatible with qcom,glymur-qmp-gen5x4-pcie-phy
2. Bifurcation mode (8-lane): pcie3a phy acts as leader and pcie3b phy as
   follower to form a single 8-lane PCIe Gen5 interface

In bifurcation mode, the hardware design requires controlling additional
resources beyond the standard pcie3a PHY configuration:

- pcie3b's aux_clk (phy_b_aux)
- pcie3b's phy_gdsc power domain
- pcie3b's bcr/nocsr reset

Add qcom,glymur-qmp-gen5x8-pcie-phy compatible string to document this
8-lane bifurcation configuration.

The phy_b_aux clock is used as the 6th clock instead of pipediv2,
requiring the clock-names enum to be extended to support both
[phy_b_aux, pipediv2] options at index 5. This follows the existing
pattern used for [rchng, refgen] clocks at index 3.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 45 ++++++++++++++++++----
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 3a35120a77ec0ceb814a1cdcacff32fef32b4f7b..25717bc9be98824e38f3c27c3299fbd1f2e7e299 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,glymur-qmp-gen4x2-pcie-phy
       - qcom,glymur-qmp-gen5x4-pcie-phy
+      - qcom,glymur-qmp-gen5x8-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
@@ -68,20 +69,23 @@ properties:
       - const: ref
       - enum: [rchng, refgen]
       - const: pipe
-      - const: pipediv2
+      - enum: [phy_b_aux, pipediv2]
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   resets:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   reset-names:
     minItems: 1
     items:
       - const: phy
       - const: phy_nocsr
+      - const: phy_b
+      - const: phy_b_nocsr
 
   vdda-phy-supply: true
 
@@ -183,6 +187,7 @@ allOf:
             enum:
               - qcom,glymur-qmp-gen4x2-pcie-phy
               - qcom,glymur-qmp-gen5x4-pcie-phy
+              - qcom,glymur-qmp-gen5x8-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -201,6 +206,17 @@ allOf:
         clock-names:
           minItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-gen5x8-pcie-phy
+    then:
+      properties:
+        power-domains:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -223,11 +239,24 @@ allOf:
         reset-names:
           minItems: 2
     else:
-      properties:
-        resets:
-          maxItems: 1
-        reset-names:
-          maxItems: 1
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,glymur-qmp-gen5x8-pcie-phy
+      then:
+        properties:
+          resets:
+            minItems: 4
+          reset-names:
+            minItems: 4
+      else:
+        properties:
+          resets:
+            maxItems: 1
+          reset-names:
+            maxItems: 1
 
   - if:
       properties:

-- 
2.34.1


