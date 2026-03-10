Return-Path: <linux-arm-msm+bounces-96576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIMZCR/tr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:06:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5624912F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BF5483070959
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AAF36606A;
	Tue, 10 Mar 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EUrmS35C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFRvFCC5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0D36E493
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137038; cv=none; b=M687Mp6ZMbRVnNqZsinTlp+afjBGHk+gz6SeFsBp2x/4szAOEKUPX50pPi5I+GbIvOHbGQr+7NnXKIntD5MEZiQY1t6+ZhUe0TeAWYnN016YFk/9W9u+BKxdTp5lvsexRPGecpkgY0bgQ0wBNcG69sEsiMRWxC2ufc1xXay7loU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137038; c=relaxed/simple;
	bh=gZbvYWxtnltp+9V8OICF8P4ygq3AOAwfyaCIqwTHoxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tD+5dDS6gsJcleGhHz3Xhrmw6KdoI7Fj7GX3bLbKpoDNHmc/JwfqkoO7RupEvKOD52tEynt5E6Qp1/Jn2qo3Ew38GmA2HnESH84LNVx6+IAUpDTA/ccf8buDNjttg0gnPbdqSvfVDi69CHSRjOH/NQgtvXkwFStjpst82ujmmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EUrmS35C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFRvFCC5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wIbx3124447
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFptXoNQy3MKnCAaLmFatsHFB8MF2GLKpS3f5re0I1Y=; b=EUrmS35CpQatMFFJ
	Fa3xclvIkrBLk7+8cvVhVbfp8Hot/oobQLBLQqGfS+6wAI5tfSRmbYlWy692REmX
	CxjJkEiKTNlVpKbJ53HaWgFuW/rfcBnSYU8wLNuQBgkqS9MDUu/DVke4FVbH7vRK
	lqnsKZGtOLDXoJUlQnGUdMjtZz3OfgmI19PdCRDybv0OwzYsZHAzDmOs7g8E41WE
	Zlcwlji+xi8OoudNWE9Vr91+WpcQbIVg9I9MHRbQ0jDwy/SOXd7CNuUq90BExW9N
	g5Xb4Fj7zsfWHPiohWFVt3ekjs8yojUwuZXjfIIinZOy5se+BrBpq9TiYyaf5OeC
	1j2pdw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0g9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:03:53 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d74d78c5f7so16585456a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137032; x=1773741832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFptXoNQy3MKnCAaLmFatsHFB8MF2GLKpS3f5re0I1Y=;
        b=fFRvFCC5a60w5r6ycNnVjDNMLVQoEiHaEf5isCMkwspQeMbTD4CyoO9dBmXrsc6W6g
         uvdHaw1Ox7h7saDrrI8FGRxyLClPs6bLD9ntu+85Hm3zrfv0964qGt/3Iy0hvKAB1u63
         8BUTgZUCU6dfBTcHlodQPI4tcNw5zBxZ+HdKmck5S4TjmKBzJKSUo2UeQjrbc2AA3gY2
         gF5brEu7UKRVQs3FHCjgdKW9nfjvzIYDTCfJAxWWcXInrYLOul+hq7D/lRFTB9HQ97Ry
         ypIdhvfcfCzpmzwZ72mgEcYp+SqoIiMXl0GgdrKZz3S9/yCTiF9qEWS2WU7nQAoP1KB7
         WDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137032; x=1773741832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OFptXoNQy3MKnCAaLmFatsHFB8MF2GLKpS3f5re0I1Y=;
        b=efYBqke9cnqPoNObEnwHQ+tzRFVKzBqgvnZVsZzdjyr4h5LuTPvvqPCs26pFg9Vv/p
         VJ3ppz+GpxpqqXbRD5XI4W0jnEIAFspqJhBnr60QbnkqEMp27ot3XiuOFHWkYqg90pLr
         5T8Y1078Sh1uhW4xPJaH71W8/5c1GABEdbhWksUWx9Gfs73BbBkjyh+O/PR6tWBulPvP
         VuUVLL36U/5Bsoqi+APNr7Gs0rzQZLSg+jtutqZa6uIfZzFk80SD+xnfKAxr6nlsOCSX
         Q/XPFFhCzYwBYvIZOKsB8o1bXqYWVn7fyjRMjJXO0a6UCPbOXaiIjHgfBUEtv/Skz26Z
         Osyg==
X-Forwarded-Encrypted: i=1; AJvYcCV4/Kq27nltkTyHU58V+YIsO69008MnEbCL7sqqyp8S2xAKTDi+KXmbvMG2uMggvcmnmZvtol9HKsLq4Cl8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2cMYvfWaS/j81Y3Gc7ZlEUyWNbMbLAKOnbIPQPsa3qD3YFWlH
	D/8o826HbbOr64OJq3xrBibVSNjFwu7VnACAVKxq4axC+lEY+P+opUxzJAB+EbD8/LLA1svbM6V
	Pu02hA/vRBn4kzRjaia4s2hF72Zcr1VmE7IolhUL8oUbyNft5IOML6OhOMMZ0qJ0OScrJ
X-Gm-Gg: ATEYQzzU9RQ6zsUpz0fM1IF8TML6I0wNZncE6mCHMOt0vcMsGppTYA/LgvxcxxUZPBt
	MEOJdtqhvGNXrfk4KLeCNnuWoeMHk0PtdBF9kixzFjW9x6LKGnvkoxXQvPQWa1vcXD+gyn+MXz1
	bb2NvBrZFiGJ8Swndy06+IVt0mItTd0LhBW/i0jaowqpBoSc64cgmCIpd2aSv9i1tgYrikQhO56
	nzxPyU1FI+nk3MvLMUfHNBV6CSSe2ud3LugiaGI0Z4mmPpUTz6QiP5fwxkUQzhFEn4np7heLpwL
	XIj4thmmXvvqbc0jnva9JobqevqpgYe3m9nthBFpxe/3RueKUvGCqzjGJcisbmnFidM0c2EMqa7
	rggA8aNMWVaJ/YcCG+ceZBk7pVAOHd4xTjEDLdvVYamMu1znZ5Yu0pEwmIJZpqlNPDYKHV72l
X-Received: by 2002:a05:6830:8289:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d759b01ca0mr1760790a34.12.1773137032445;
        Tue, 10 Mar 2026 03:03:52 -0700 (PDT)
X-Received: by 2002:a05:6830:8289:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d759b01ca0mr1760775a34.12.1773137032126;
        Tue, 10 Mar 2026 03:03:52 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d746bdecbfsm4337611a34.10.2026.03.10.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:03:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 03:03:17 -0700
Subject: [PATCH v4 1/7] dt-bindings: remoteproc: qcom: cleanup
 qcom,adsp.yaml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-knp-soccp-v4-1-0a91575e0e7e@oss.qualcomm.com>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
In-Reply-To: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773137028; l=2735;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gZbvYWxtnltp+9V8OICF8P4ygq3AOAwfyaCIqwTHoxU=;
 b=nnlIQkEY1s8hcXkzRR+Eh6R7DeJfAHlqsWXsssc7kSeNnxeTIoagGOKUomve+vyqkq61estpT
 bGh9e5qZyEfCbwrpRBt43TAqJlMlOKL8JdqKme9tD3/sej7BXizSwYo
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afec89 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VspIq9AKIDY_7iLw7w4A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: t0TYFWL48FlCc9X0gIjn2WwfInirtsl9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX3j/IAcZwq2n4
 wfqshlBclpYv72o8NdvqIYlfrugJJK3h2zcTZOKak1ykFqbPyAM07+76AlTX65Hqgi4UpUU3FHm
 eyHPkKacHQF0GczelqxW3NVZRm/36IKh5FsHjA+LVQeEVldj0rMUdhBjZ3+rVtY02SWWTN+SXfz
 2OICRcDRN/x3pPYeQmkPdsDzeDMSIMmQ7GI3fiKhaEZaWtQVbmXSE9BtBZLljK1SsuIft5Eq+B8
 xrEAYN4lwYr+/ZwyPEEy5HhaewGB8lBMMD2gMLecShWAqgC02LZRrb+Na/YRLD8uNG2kAiKg8n8
 w0+vskuufFxQxd/NX5DJwc6xagP1NsR4d4UvQ6Hjhcd5jyEP54JtSulKoekhb3HKk8X/SzMaw2J
 wBBYElhj/jAqQM5EesxterxQOFNqpHHrxCbMixoHpAzCeVCr2hPu9brxBSsJ9pwuYNjRXIv6irb
 6PfWJM72rLhOmI22OCQ==
X-Proofpoint-ORIG-GUID: t0TYFWL48FlCc9X0gIjn2WwfInirtsl9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-Rspamd-Queue-Id: CBD5624912F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96576-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Items in qcom,adsp.yaml have common clock and interrupt properties, move
these out of the allOf section to avoid list the compatible repeatly.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 64 +++++-----------------
 1 file changed, 14 insertions(+), 50 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 16a245fe2738..a270834605da 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -32,6 +32,14 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
   cx-supply: true
 
   px-supply:
@@ -49,6 +57,12 @@ properties:
     maxItems: 1
     description: Firmware name for the Hexagon core
 
+  interrupts:
+    maxItems: 5
+
+  interrupt-names:
+    maxItems: 5
+
 required:
   - compatible
   - memory-region
@@ -57,56 +71,6 @@ unevaluatedProperties: false
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-        clock-names:
-          items:
-            - const: xo
-
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8226-adsp-pil
-              - qcom,msm8953-adsp-pil
-              - qcom,msm8974-adsp-pil
-              - qcom,msm8996-adsp-pil
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-adsp-pas
-              - qcom,msm8998-slpi-pas
-              - qcom,sdm660-adsp-pas
-              - qcom,sdm660-cdsp-pas
-              - qcom,sdm845-adsp-pas
-              - qcom,sdm845-cdsp-pas
-              - qcom,sdm845-slpi-pas
-    then:
-      properties:
-        interrupts:
-          maxItems: 5
-        interrupt-names:
-          maxItems: 5
-
   - if:
       properties:
         compatible:

-- 
2.25.1


