Return-Path: <linux-arm-msm+bounces-105930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBcZMZbK+WmFEAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:46:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C31E4CBC24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F47331ADEDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BAA3FBED2;
	Tue,  5 May 2026 10:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXCdpy3I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gd1EwAKk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351883FCB06
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976612; cv=none; b=FHUPWe9uhu2pIuaaCJnWMRD408YL9ZI4rJ+SLng/sdNL1qlUE2cX0EjJ0O6BHZxFCXc96/IRApiqzyqx3xDET+YUXloucJ7lb9AXCsRlyQ9LYpCeuTHYbWOBcrvxzbJK+0ih0PlFFn0+Bj62VBWv8cPuReNdPkzKVPjyD3WCDGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976612; c=relaxed/simple;
	bh=6FllQxLUIcZFy8r6XJ+qoz2lVKCLOVWcjhQYdznJGeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WFKR8DB2f0g1MLnPxxlFADG0tbh8kLrQZ/BDWcit/WsDg/kWrsoU5K1lQ49OtPZ4JPo3jJCGDEKEoGyFFgKOAstqA1KqTS589bPTwnuI8eLUg4wyyDeK/jDkqDWxgKaUT53H97NYF7TXb270eO4BPceMjvIUticgsHHcl/q4lAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXCdpy3I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gd1EwAKk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457YsEJ1960499
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0VAv94ts04e
	fo/tyn4xoFebss4TdaYY35iROH2gpFzs=; b=OXCdpy3IO5OpYh0to09CW1b89bo
	Pp/rVj3pvYUM+6kGfkImiqTRFAUYB4y1lggiO4NKUfj+/hirtHMygYADyTw1/MNi
	tqiZsHTO9byxK/quRSW7LASV+6j33XqBgpPOQ1kZ+yLoGRcpHT1emTKcJSRHgmAD
	04xAGujQra/Cjtj+6WOHGXMu7u0h3ElaZFJvhhlGQvzmkFhDlfKW0wQ20dpMZbUi
	9fkUul6ExlNb3yQCabdhq78Ig4AzvSatmfyLLVdDbHzwrCozzgeHvIkhX0deRQkf
	xvt+AzkS6XolXYBhicAZaLFSLgC4Zv6qaNhgm7vjGr2C8yWSgepP8TNvEyw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxw5duv01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:23:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso4690055a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976610; x=1778581410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VAv94ts04efo/tyn4xoFebss4TdaYY35iROH2gpFzs=;
        b=gd1EwAKkZZ7IIS2MuCcFszsgcBh/rBQIgBz032SrJl6TQpSLbc9M8yQD9wRrOPf8hM
         frb5T7KmzPPhbrvp2aG6X0RGYzT0iDwqTSh50PznHeORKTod+Fq5HcuZCzxtt+eSLtNH
         W1iKlXvgMk5GcsS94Dr0fScRmdfZ/QNbwVYpGYDdOE/ak4YEXbfNpOTmzM5JtVnusdZ5
         GX9MbttJcvaxXT9hMD4PT6Q51T0g9+jOTpR14eX449r5WjKN3ufHRlYEoA9KMI1eBUDV
         CTPlxEZCFt0f8hXRcFOesOQIeGy1Fd65s0sJoiJeySVBb8na+Hg/qWKRlJQ4viLOa/I8
         0Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976610; x=1778581410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VAv94ts04efo/tyn4xoFebss4TdaYY35iROH2gpFzs=;
        b=Je1w3VIn39sXOXzCYSDZgH8XDHSfBD7L5GFFRDfoyGLgD5P+pjxvvZFJTp9kQsKkF+
         wIXKe2lUWmdMdGBZRp1BZ2x9ohyHQlQ0VnX3wIfYXKKw2zAqfwbMQDxaRGoTHOTENh0w
         N0Ndfm8g+tQzqeU34xLsbMN15pJgxaLIYcSmoNk7m1bHkAQCDNHNSBA85/POL5bT94v/
         84rL3hlnJMhahPh2vDRx84/cyULjxK4vwssBKy8SPF5MptE+1XLZpTqzSRNYMSORBqxC
         1cHwk4mcN638BmLdmZnXfixKtsMEPiOQrcjC3UazkeN1SFl5AWjxZHeeV9h2VqE1Llab
         RlTA==
X-Forwarded-Encrypted: i=1; AFNElJ89vEv8hdYOnV0Ah6RXGvBqo6fNUjMDS9RNfIXCDGtBxFbyfsNnjEyvGlNR4hRZ2Yz5ifFSJHCL+YjQ//FL@vger.kernel.org
X-Gm-Message-State: AOJu0YzsrsRz2dQHIcGmpRPVxgcJfelEpNFrNqfCCe6XGJ9bDq62CPfz
	HxbA37p2aa7yphjwyLjc0t7LwjO3ddy1pdQOiJG06Vb+KFMiV1Hyc2TLKn68JJEKZkX9GJDFlwB
	hTTZMRFb5bGXNFKf9TN862LSQKz9FE54XMPBAfaqKRXBT+oXpsRbLl6QhXLOcWthwT2AK
X-Gm-Gg: AeBDietidCuDDKFomhP4eGgesBor0ukmOcORLYZe0jJ4Jmo3FpwoOC9lABvCoGe/V+E
	0VGejxp67+li8aQ5RRdQx3A14vJcfMR5MmP+9xzeQ0dZGnNG6pOCC6ujwVRFE4cw6KRAy9QaH5s
	pzu690fFfWUJPfTDY2i5MS2GZc+IFIxSdGVDa5w3k7frcqJZ6woPsVEws/BwQOaYKTAdAvFdzua
	fmuTjHRaOJnjp8N+y9JsQJ749dQ33RdIZssXrCXLzkVS3LjKESS+5eVEyg9H/5MfEct3LpCexyf
	AZIKSUcPY30R7vl3wHneHnXZGbB5V8xRd3mW2fP6qFVySZvCgTNz5rh1MUG+xNPzFuMcc+U6ZF2
	FZkkGnoFrRUb6jneLPlmkpvDNgAxIp3LQYL9PCSClZWV1FTt83vgjtQEJ6DRkDwWQtA8x1GFn5v
	C5RMoL+yLhqamdJjF63fl03j5siHn/pDRS0pPQJwOVAnvhQRdpojX1MpK6GNBggQ==
X-Received: by 2002:a17:90b:548d:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-3650ce4b8abmr12155723a91.17.1777976609699;
        Tue, 05 May 2026 03:23:29 -0700 (PDT)
X-Received: by 2002:a17:90b:548d:b0:35b:97ba:acee with SMTP id 98e67ed59e1d1-3650ce4b8abmr12155702a91.17.1777976609174;
        Tue, 05 May 2026 03:23:29 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:28 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 2/6] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue,  5 May 2026 15:53:06 +0530
Message-Id: <20260505102310.2925956-3-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXz2f0aHT/xcCm
 7mRqmxRFh+RVSKAIm0L8ADkPc5K4vG/KfY3MaDiNXsdI4NZ2YO0PFQ9WrfdHDDUzmUXUAYfl3FS
 30kqHY9P0TkNiqjsVeBaXBOmzmxSG8MLMNHU3VunYJjO/Jxs4Xjd282l0JPxXQsQIidZNxcNF/Z
 kz157ynmp7jdWj61b/gBese53hWx0cG5EGYelnVTnCbZnuASK5uq2QW69aK52rp4fDqhlpeD12f
 aajmkVgR8J8Kwajj2++htnWnt7vLaPCPMO6k3wKmHGqdCigcWYEZ/LTbCCXx+G9ijbW4VDM1SxI
 38BRzTfLPOvYkbE8/Fanu4a8rvMxK3U3exRLDnDFjjokWhaesLcX+jjkdw7tXXbk/97JNZ8Zcqg
 3lz1u2llRO/XYfnaVUqRWNwtkmcfx2gCFD9yusLqqPJf5mDKyNRWAjWQLllgUKSh3hSJejAZvix
 aH52hgAnlzJ80PbSiXA==
X-Proofpoint-GUID: 6U69QCnF8lZRle83S5jZFP2f-XvoDOLA
X-Proofpoint-ORIG-GUID: 6U69QCnF8lZRle83S5jZFP2f-XvoDOLA
X-Authority-Analysis: v=2.4 cv=HpJG3UTS c=1 sm=1 tr=0 ts=69f9c522 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=RNRoJpfvdE2T6TG_4XMA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-Rspamd-Queue-Id: 5C31E4CBC24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105930-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.996];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Dropped ipq5424 support ]
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v12: * Change Manikanta's mail id to oss.qualcomm.com in S-o-b, Author and
       'maintainer' in qcom,ipq5018-wcss-sec-pil.yaml file.
     * Change Gokul's mail id to oss.qualcomm.com in S-o-b

v10: Add r-b Krzysztof

v9: Rename qcom,wcss-sec-pil.yaml -> qcom,ipq5018-wcss-sec-pil.yaml
    Fix 'clocks' and 'clock-names' definitions

v8: Dropped Krzysztof's 'Reviewed-by' as the bindings file has changed significantly
    Drop ipq5424 support
    Update example to ipq9574 instead of ipq5424
    Change 'mboxes' description
---
 .../remoteproc/qcom,ipq5018-wcss-sec-pil.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
new file mode 100644
index 000000000000..a6fc3a9db621
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,ipq5018-wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
+
+description:
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5018-wcss-sec-pil
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    minItems: 1
+    items:
+      - description: sleep clock
+      - description: AHB interconnect clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: sleep
+      - const: interconnect
+
+  mboxes:
+    items:
+      - description: TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - firmware-name
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5018-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+            - description: AHB interconnect clock
+        clock-names:
+          items:
+            - const: sleep
+            - const: interconnect
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq5332-wcss-sec-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: sleep clock
+        clock-names:
+          items:
+            - const: sleep
+      required:
+        - clocks
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9574-wcss-sec-pil
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    q6v5_wcss: remoteproc@cd00000 {
+        compatible = "qcom,ipq9574-wcss-sec-pil";
+        reg = <0x0cd00000 0x10000>;
+        firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mbn";
+        interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+                              <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+        interrupt-names = "wdog",
+                          "fatal",
+                          "ready",
+                          "handover",
+                          "stop-ack";
+
+        qcom,smem-states = <&smp2p_wcss_out 1>,
+                           <&smp2p_wcss_out 0>;
+        qcom,smem-state-names = "stop",
+                                "shutdown";
+        memory-region = <&q6_region>;
+
+        glink-edge {
+            interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+            label = "rtr";
+            qcom,remote-pid = <1>;
+            mboxes = <&apcs_glb 8>;
+        };
+    };
-- 
2.34.1


