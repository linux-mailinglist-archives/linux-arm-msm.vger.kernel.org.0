Return-Path: <linux-arm-msm+bounces-111636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 22tdNF4pJmq0SwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:30:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D06523E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 04:30:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eWBhz2m0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K5t8OE34;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111636-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111636-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DDE83001CFA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 02:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B116B317173;
	Mon,  8 Jun 2026 02:30:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A53C317158
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 02:30:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885840; cv=none; b=UHqA22Mw/vkwEF2TC8xGFrMFjyCI8K6OGL/rLcu0m3ETgefG7JaX/+DAj+4sO/B9YwgXwSosq1ZcdJ8RrTAh57P8k+9YSKJHis15J8dlrfQWPqMN8Iw8J8xmLHOv9xC9887W1Z9VZ5S6JEmyMP6bsRTHc5q4BivZq3QsgHzugls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885840; c=relaxed/simple;
	bh=42VpR8ugAARHyI0wmOQZp/rBCGxgBSiRrJQELIHnh8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q/klz9qvFFFSsflMl5HcObxcyBJTO3etKZ6Z6oBTIMoBHx3f8nOS96HqNlLIVN1tDrAbor8IIV5QAn5X2nsHIDmmQwbtkWL7F6UbzxbU9Xx3oEafITMZCobWP0vs2w3SOmAoW26JD8qLSOcAao8qx1D3qxHETZwvx9mnBXGZjjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWBhz2m0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5t8OE34; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580ECst1575143
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 02:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IKc5Obhm1v3
	/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=; b=eWBhz2m0o4dB3nYeHqRL9JMfo3G
	/Wq8MjhNV0VpLkdkPjX1kI04Zrf0vL4n0OM0CqINRu6ka+nOQtzQ71uG59PvZg+1
	+cZBtUkfxRllUzcKbxJCZhUwMq7OAWnGOVwAS+6ijcXhk8sHKgHGSNTgC3EjxZDY
	UfOliPtgSg34AYcWEOhBMs61iuWx5nP008FTBFFRKL6eVm5rqJaJ0YEOoqrZd1S/
	xhflQXyx6kDrGIJiaRhqhG0uRCcdmWzkDspBNjS5bqRE3C7udDdzRQxdUme8a5WR
	hFhLZIeAT3ddHuamm2Sc4ev/r5dlOkG5obBM1JBBW0wNqLguGo+hlDYWujA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1da84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:30:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c20f7581so40901465ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780885838; x=1781490638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKc5Obhm1v3/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=;
        b=K5t8OE34B29tH9uCHbnM6suinHcCqyE8n62KSh70HJdEQiHBPyLa9vkn0C5finBn/r
         YB8C2n/w7doOzgmrIhDoZcDKcoIojfPdR2uEBstisNAupOsoG/XTTra6cNnw2xa763xR
         PD/arZWyZy4wfvwFRSpqVpkzOapY9JRsZi/bPJe2ChRl9nBMaz/I2RpNaGCOIqUHaO2F
         QRXlvlaLqQd4zNQp3IOXo1KcaM1SLKfNMYi/U2SO//YbMaT2m8bZzL5WB8kd63BNSxkq
         aXhT8u/rz19OmvuKdRngTL9Dw6dZ9t9MZUvvwlnDdd6//x8yagDNGbMS/7q/8ZmmE04b
         nwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885838; x=1781490638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKc5Obhm1v3/KA4MaSQ32W6Hvld9D5qR9cN80qMH2Ak=;
        b=stAGf5aVlyBND6VWHlWmY6b12yz5wfrnPIrGfBuxVQqJuCD9xsSawlUlSQiHq9hbzK
         9/ipHgZkMDxqkwU/WRw2SGGjoVnXm9c9AkYDW1Q0gM41LOc7LVOJOlgvVegMKLeqOoT5
         O/Xr5BRo+34aVOKqFtZh3lRxxOVLwyAocTUuxJFokPEVovaNcH88qFRccCmtucgmwVkj
         SVz9mduj3q29JOU6ef55iyIGDDo8EJoYaAaSfj57lHkmNWGfl3lKi/EzOFph3QSVrE0B
         D2hDk30JYy6O3ObEEdWDOVgwVOBpo/v0GFaZzCdpxRIgiI8qj2adDmcX7DGB3PM0UiPj
         Nvcg==
X-Forwarded-Encrypted: i=1; AFNElJ/SyGaLOAWXu4nuX8OVqvExiHdNoRGRNkKWXfn0Gx4+AFCTyStXfnPMBQS35JDWu6JEfBB/4ce4BcWjGaDW@vger.kernel.org
X-Gm-Message-State: AOJu0YzxR3d2BvLdV+TXpXKm8MgjzQ5xu2I3KnyNdbyjlsOULqnNRMgK
	oV7MMtxrw6440oXmW1Xj70c8EK9U47nGlOZ1glXWRfF7aKWCB3ig474TjXtnF1OKZcNXPbjRfGr
	PFGBIHPvsRSRvKi0SOcXHSZL6giZUExNRq5d5yYfMiSZUc9c6PziaJyp8phUur7eDaOO2
X-Gm-Gg: Acq92OHrrxIMmSyiPRmoefku8KNG4Pa0/P9q67dnMbYezn6r9ZckW69cPBPwJ+/VY4I
	TFuiRyVAFb18fnUwcCo8h6fsuPW+HeZTlGdgZXG8US3i+tbaajst3WEtOC9gIiNfzXRiHYUfNJX
	xrGmVA8HwBzisHsET0qiyA6KsrfiaJn9RsXepxXmmbQa6luXY94xD/DsAVmPdcH+87B2O1jyb8v
	rusVSB+O//L1fUh4sKeta47bDzoRvkmJLQH4vvVPOw4X5m/O5OOahYXHNyDxPxeUGYWQgYDVBPN
	as66VIdiVE7owBv6g8HGwaALxOe3m/ROWGLjEYFGD5oSYp9AzKBwP1/Whrk7rzmr5mkssBo3V+2
	ntpeqzD58P9efUbDjwlItSMC9mhYpRCR8nBi61EcJgF762vMHZESGGzW9VvG+nZtsaA7k
X-Received: by 2002:a17:903:2348:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2c1ee755854mr149411755ad.20.1780885837673;
        Sun, 07 Jun 2026 19:30:37 -0700 (PDT)
X-Received: by 2002:a17:903:2348:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2c1ee755854mr149411295ad.20.1780885837094;
        Sun, 07 Jun 2026 19:30:37 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e0bbsm162343585ad.50.2026.06.07.19.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:30:36 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  8 Jun 2026 08:00:09 +0530
Message-Id: <20260608023011.942228-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMCBTYWx0ZWRfX4iIT/7jToU8b
 PcA/CAJJaR6SvoLyVv7cyhhNoj57H28EVeXHkGd0kXQNelGclzlaUHVk92fubyGVo0cvXim0/vt
 rX1mhd2e4XTeDe6xMSzdi20Epe1bBnDNbhBkT5kMJv406+ypZyJgfX/xvhtptMKEVKI6t8qsbHk
 JhqSpzJMesWPMQYgir5Pnz0zrytlTmmJ7Wd9DDi6lSD6IeNNP76o5Loy98BFpG0nS7wqYHHTOUW
 3UGpcQGolgQsYaaJKzJD1DjoHzP1mHYKQlXM3Yk/ECILgd3Z9R13PKSMuIo37Gxbu3VvumVJ6xT
 o+czOex8ujlNrdPmR14cstASnAUFkVNJhNHr2jwKcpVoWkgE1LXc6mupTNjaKC9Xajhfsfo9A1X
 Kbgw4Q4pUdHt3sC3WysVSd4xtOKo/VXCXMcCuXE3B8LKOi3w+4LN8kBLMDQVMehLaYIFdMyXNl/
 aa3kUlrdGl+BGQz7TXw==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a26294e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=NrbrONOL4QpDeGKfLFoA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ntdtKlrmuR_Bz7ovqsBI0HnHDRJg8Io2
X-Proofpoint-GUID: ntdtKlrmuR_Bz7ovqsBI0HnHDRJg8Io2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080020
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111636-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D22D06523E4

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

On platforms such as Monaco and Lemans, third-party codecs are hardware
wired to the SoC and do not always have an in-tree codec driver to manage
their clocks. For these designs, clock line enablement must be driven
from the platform side, and this series provides the necessary support
for that.

On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
I2S MCLK and BCLK has moved from the DSP to the kernel. This series
introduces the required device tree binding support to represent and
vote for these clocks from the kernel.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..4c4c73778 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,48 @@ properties:
   '#sound-dai-cells':
     const: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+# Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        items:
+          - description: MI2S master clock
+          - description: MI2S bit clock
+          - description: MI2S external bit clock
+
+      clock-names:
+        minItems: 1
+        items:
+          - const: mclk
+          - const: bclk
+          - const: eclk
+
+    dependencies:
+      clocks: [ clock-names ]
+      clock-names: [ clocks ]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +71,22 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
     dais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@16 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_EBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk", "eclk";
+        };
     };
-- 
2.34.1


