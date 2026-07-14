Return-Path: <linux-arm-msm+bounces-119057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r2lVF1xNVmpb3AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:53:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD3756185
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:53:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pqqu5J1A;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bCDDkfQb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119057-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119057-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 513DC300748B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95FD492180;
	Tue, 14 Jul 2026 14:53:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997D49219C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040793; cv=none; b=ihTA+XayZk+ab5/UnKJt8/UxGoo63Bpumec9DitybACX/XsdSdorgYPK+bvTImPa2lIwKxyBgbbzVw+k0A7hfNv9VQXMuvaRUrhwVeI2rME6UhW8xAXmbX7FNmlmHCGZ6tuyC7tlf7DMtUJGM1HC61aPhllIaE6pG60QJm0pVOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040793; c=relaxed/simple;
	bh=mUsS+GvxnVmAQvX3tN/URUtS6qia41RXJhMZqg1lKGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qVMCjsHqflBOmatbCjfRVvOzvY5yeCVkpNbxdW5Ph3Sokt0wyZ3sZPhefyPZXaG/SlkkO1uVOzSzL5ZNO35/z1MdYXcfgEquS34/iwADcrm3Imi2ACsN8v7HZl6rl9HAQ+BErK3zkFBknr03LHymTzN8jHlHow5+/bTHtYOrChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqqu5J1A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCDDkfQb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcdte548043
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N4zDumXgGqT
	zNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=; b=pqqu5J1A99a7ase9nLil+XdLSNQ
	ms1RkoTw0SogpVKN3ZJw8cbvZXJyrC5UP+Rbm9X5gYViDZPuPuuaDj1DLy3igNof
	PpSrTtNjbLn+CyaVl2UFN3blLzLPrZJwKhRFw5205SgLySBBlrNretFN3N+VJv06
	kTVv2PSak4LEsCvhilPNBFTunv6UKYM8B+3bH1b5H2b3i9K324vnnm+nA6dsifZK
	TK6KU+8xBWQughpzw04GXTeZBkVnXP6obYuFZ8jEAv6TXeJLpXms1Wo/YSopc6Xw
	EXJNojROoE2UtQonCKTvGiRgIP16k6S1N4hlDLrrjodDBS2gaJHzwg2LdMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesaa7fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:53:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3811ae55313so1095548a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784040788; x=1784645588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4zDumXgGqTzNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=;
        b=bCDDkfQbqlZZdt0tV0MX/R9XOJyhMdewPFEr6wMb/fDhE4I6iqzqcwBJ+eNC9cagtZ
         MRfag3zctz6x8BWkOZIXrhmWvHfm/hNIbOswBv6xR+fm6zjnMjcwO7FMrmRrf7rwT0YL
         I0KY5BemJaKTp8fQNLuHuSBH56d3c0ZcrAxzWZe45MpaxDx1rwvR/2XVJxwAUwRX18Zo
         OUlWp0ZhNyTrhDSuaZHq/bTnvmM6iDwBvzaHl/koOUjdClWQf+3engy2wtFXVBHQFhL4
         hz1pDXoPbWOpVlGiBc90f18I+brVAYXsdHtjsTlNuhKoq0NnYKXdMGZYesPPMPr6/GOk
         aDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040788; x=1784645588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N4zDumXgGqTzNb1A7W7PrnDPcMHrX3OAzIUOpDTYsBM=;
        b=qw6o/ziA3P0tkvtKY3rUkWOGI21Bj/fUzOuFprJIvPQJrg4MDuKm2u9HfySPKK+Dor
         ct1kRq9NHXiGci5YOvJfCzv21FeDWyNeT5I/5IT119qZNP1CsPi3fAW4J2HHPRMDxuKO
         d804wcbHmuIe1rnejCzol4UC2e/li+jhsixHCX2+9TA9OsiDIVhpg0Q8R17ez8VzqTpV
         PBb4nY+0ndG9/mXaPyV/J3HUsQVZjM6hSSB8XQ76BpPE4CcESMy0QdEQaCNswzNwGzOc
         +XrrKZNsHF9gXG+vsNbQxwMxcOR/o1B6n+5RYGq+wTmUdlGxTxxKcoHHvwvlZvFPjmh4
         fBjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJ4oFc7QmEBTL2ixjb+5FEqXAf9XXjYTrPAF4SipOjibH1Hlkr5QvTtxtSEvPs4fhntk/gCOnJBttgXTkI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9VwL1BRTaCQY3lbsu6GIC/hAXNPnBtjsLYdOQpIfhpKYwa1bH
	nOtNh7yw4QA3dNma4asmYObf08DSHKqXEgUxOfC3fIp1/36TMX+By8T3Yyzx11xnKDG9YqzGyy7
	StjrQIer0QzcSdwHDVh05hfIw/yL1Fg2ZEDwPQr8BBEJIp8nT1XWzCMXrz9dhWUH4uOHA
X-Gm-Gg: AfdE7cnjqHdpkdt3UUVc72QJ2BYeByigZJrI8xziFFyVY6EUAsKmuVcPSFnNZQt5/Vs
	0n4Z0IYKn9hS6ePydSMoSVogJevpvoxDCb0zsFg6+YD/mTcmjrK6r+wyno27IhJEyoyrgm4iIjj
	BmO/Oq+VeyGQ+jT2Za/PKP/Kurcj6bcaCRlLykfdqcTEwlstakiP1n/7Swx60UgeCzfY+3X8KEm
	q6S9Soh6gahQJBAyjDO1EvRjbsfxOikhsFaRchYIl7veIeXeLUdfoDzddEnLOYVX5OjaaqErNRX
	xVCZIJU2CQlTfuuR3gjY9qPwN+VQ01P5pvKzk4i7nPqh5RsLtRGg83sT1MuI0X4mnuGtIsjfPLp
	WHLoAsHmmb76GxNnnUnJvjlWuli5TZfRk+jOLcavK/bApFBs=
X-Received: by 2002:a17:90a:2ec4:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38dc7b3f843mr9709057a91.21.1784040788253;
        Tue, 14 Jul 2026 07:53:08 -0700 (PDT)
X-Received: by 2002:a17:90a:2ec4:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38dc7b3f843mr9709020a91.21.1784040787736;
        Tue, 14 Jul 2026 07:53:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313cb804197sm31941773eec.13.2026.07.14.07.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:53:07 -0700 (PDT)
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
Subject: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Tue, 14 Jul 2026 20:22:48 +0530
Message-Id: <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfX9UPyJpuujFlZ
 OMIJ07B5RG9fng7JrK9LS32BgoaicELZGocQfmZrz1q/uYMu1944iEgfbX7cikp/5jAkyySWXH8
 6UAVEEbIYBrjKApK1aBFdD8tryGHZaA=
X-Proofpoint-GUID: FShN2Rk5GKjcNiszk5gMPfRTU9ksbLE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE1NSBTYWx0ZWRfXxstE3mJx7BRU
 fQyW33LpGzpHl5qRLp94W9TKjsmadmcfs7QKca43hpM5PP4XdgBIvJbCW9gOQfn7NRo/MBX1WzI
 QfKqbgt7m8V5KgGkwSQOvlIvTqCSpjV/AWdmm7Fu0IsuDvPE86pEEYGC4u5kP7SOcypo+radKqM
 uY0ssu9TbyYEW/2RV4NS5BKO4QLEOR3VIk5qhPsm5cVSPxQVZyjMmy1E0HI6gl8rcWlafjHU89d
 FeLHORKYOWCXacZfpALeAUazfkAOEhiRdjc7+fXnyUB8xQOgcrgImsT65ERQGYN013q1zvw1JSe
 wKENEKLd9xIljJOZzDjw+9iapKN1lBPYLG2tofHWf9hKlnDpLIWh8FuqybDaVA3T+qwUS9BMBEG
 S1OOkLcLo2MFqwEgaqwDxVIyG1g2w9QetbAhYCWMU15MWJm5hyIMj3k7pa+5wA+kHRXkwh7Nj9v
 TU4QoljVgvwlADosL7g==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a564d55 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VOP_JMduspszKC0JWG4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FShN2Rk5GKjcNiszk5gMPfRTU9ksbLE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-119057-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DCDD3756185

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
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..b37c62ccd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,82 @@ properties:
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
+  '^dai@[0-9a-f]+$':
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
+        maxItems: 2
+        description: MI2S clocks (mclk, bclk and/or eclk).
+
+      clock-names:
+        minItems: 1
+        maxItems: 2
+
+    allOf:
+      - oneOf:
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: bclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: eclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+                  - const: bclk
+            additionalProperties: false
+          - properties:
+              reg: true
+              clocks: true
+              clock-names:
+                items:
+                  - const: mclk
+                  - const: eclk
+            additionalProperties: false
+
+    dependencies:
+      clocks: [clock-names]
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +105,20 @@ unevaluatedProperties: false
 
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
+        dai@10 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk";
+        };
     };
-- 
2.34.1


