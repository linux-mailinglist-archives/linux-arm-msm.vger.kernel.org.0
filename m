Return-Path: <linux-arm-msm+bounces-116845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HakRNlatS2qFYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:27:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5241471142A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:27:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fAAECANS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gXsOtdT4;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116845-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116845-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 727B430473E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C78B41A774;
	Mon,  6 Jul 2026 13:20:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B10C416138
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:20:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344048; cv=none; b=Mba6Hvy37i1/puMbtvFNChCKtbeW9cgVKv1HYjcW3Cb7OiRf8grdn0rCM1gCl53E0M+WqtxFjU6SepP2j9loFtBxLgjjxi4tP8zfY3Lc97delZw1zvLCUgVa7BVYwaeW5Kl+eFQg9f00qfCWReJ9x15NBhtsBgwMBnFyRKi/dfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344048; c=relaxed/simple;
	bh=RuoW/FXZwjJXKxjWtApQABvJWpziWxB5IlaGCpbDBZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RttffPVBwUOIWo5CDna/XbwniY8sjoZ7Wskw7tgkTwbfC3/FZYXM5YT5+T2eCPqbmgdkMeg5nQtOeecgFKgMJbcPXjGwFIdXlIydE6JMY/YYF7h/C8YZu+N5qpuyVjTmWzESd3SkRiCA/D0w4glMP3UGuy3gHk8otkmLJPWTRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fAAECANS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXsOtdT4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPXo369534
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R34M5+VU1Dp
	tfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=; b=fAAECANSXAw+UojNjil/HMfomuO
	bGnEaTiI/IzYZ46yKlRDMVo063u+/emfXLGbaGWsE7qfIQkpzoEl3YfBVlwUPhLQ
	xbTOKWXCLdca5K4rQuA/+LvcGbeWlHVXNWwvj+Fh1A8vZKVjJNYUsHA00txHPjWW
	AQIORcaRAz/QlxJyR8mnLc4qysCKmC0uYEXeTz2nZxWmQHevvjLOjhCYEcsKepb9
	29TzveTi91M2YwkFgvR5NWcjnTQt/YIYhRhSHv3iPBEnidJEceashQhaBkQVCJpj
	whZp7TI12LZdcJq7OPMYCl0p/oDNUZq0j5fv/paIRvbYNC3aTAdCYz3Geig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9983q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:20:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccafc5e82cso7060495ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344039; x=1783948839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R34M5+VU1DptfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=;
        b=gXsOtdT4mUTZjnDoNkkpHfyy4vFwPMHJOsdTdIkuqZ54JhI6827Su0kVMcw2uKKSTm
         6GFZ7VINpF0y2veW59RRWTAH91YJZ5qWGr6ty6aMJxh9Ennp7Gh6lucjyL5jxjGACmp9
         8YNa604QK9L3a9aYkx+rJkTrx1wd+srlL3YzfIosBfW+jVcMQKnPrv9I+F81frZ9czc7
         5UVJQTpS9xcGOiKgo82nMwt71V/zBolIuKp7Lb/AGtlOw59cB+dbT1iXRpO1rbHnK5Yq
         xlvsZ6qhkHhmUVDVPJk6kh9A5k9jZauEzCLLcOL8APD3WvK6k1RvWxHpH90Am6lfTJb3
         MBOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344039; x=1783948839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R34M5+VU1DptfjZFm4KX5IKXsV6uN0Bc//jdRhc23W8=;
        b=XNeXqXtaglLcIVvXROIniRzS4RX2DHm+xDSp+wHXzgHtwUREozalyU3z/xlXZjEiYm
         6bz4ZCK4Z/SNsYzi1hzxCN7rwTwKJyK5YCAWl7UiNKJYlE6cETHpdss9GHOKJ7kLOip8
         3uuJUG+oHr8RdPwXCKUN0WYac9lCC0SNeG6vjsWt0f0w3RX9pGHNSNKj1eWALnAch3gU
         urtT9mF5gKJS1oAq3gqLsLTPU3U4LbqdybcGABow2R9df+UpyLH9VNKBphtFbKU9fV51
         IGJbTR6FD5UeA7aZg7K3NXBuXr+uHPfr1N/t4FECVOuIXTN1Ee6y5EYDl8pIPVAuOU3R
         H90Q==
X-Forwarded-Encrypted: i=1; AHgh+RorFtpRuX4yVnxerztPCtOBgD3driq064VjgyJr6FlMJ0f6O8D7MX7XJIJG9r9UVu5R3dhaHSKWxFI/yIee@vger.kernel.org
X-Gm-Message-State: AOJu0YwsKC/lTRbzJQvDeQVu5Ogb/MmkunAlMJVF1i/bzOy74J58qgMG
	e4EubSxK8fc3UlRnQyB30m5AWyk6Ds8dqsgCfrL89eK/F5hm276tQ8do3es9AlRxPk02bl2cpsK
	xIW99WPP1MJ2/8OEX+WCj2RaTysmCtbKdsZQ++JBGhZ+pLXtAaXM+8sZ8P1IYLqt6gnVp
X-Gm-Gg: AfdE7ckhFUI7XlFnlugpmcMGgU30kQF10E9pKyqmqmNHKdyVML3YXDHGBla4wxNH1Y8
	T51xzuzGK8kDna3GpOxTQ0qg0/6HRP3EmY1y1d9Iuh1CcHYwsBDfKip5CSsk/CoTLvMV0rDFHUZ
	jtr/9jA668xqMgrrsn5EGqsV8vU4ebXW6AEfqF32p40ChJM2AGsEveDUsuAeVdXcQ6Pko8JeHR8
	+NRAoiAPJxeItyPk51N+IT8S/0ekNm1fVDX6jgGcxmWj/2YkShRWCNyjtiWL+S+YkhSIHxniQMV
	Aale7cRqCEBMKITBcmY+ytCR4t+VPpT6Cm4H8VX8wtnVKtlCzkMlVp+PHKdu1WXrqhks5xj7bCK
	mZC3SL5OefrNultFza9xEWbiX2z4RwKPr2qDcUilNZTwb/WE=
X-Received: by 2002:a17:902:d2cf:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ccbe615002mr4819345ad.19.1783344037614;
        Mon, 06 Jul 2026 06:20:37 -0700 (PDT)
X-Received: by 2002:a17:902:d2cf:b0:2ca:b4b9:4586 with SMTP id d9443c01a7336-2ccbe615002mr4817395ad.19.1783344035455;
        Mon, 06 Jul 2026 06:20:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f260d2sm51173095ad.10.2026.07.06.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:35 -0700 (PDT)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  6 Jul 2026 18:50:07 +0530
Message-Id: <20260706132009.1496321-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oVANsr5bDZJqirU-Q-S9XysC4jXI4h5z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX+rq59M8l0t9h
 0jXj2j24pgPOK42DVgBqlJLlJ247XM6qKphNi3NwvBqorbqpVo1KkQaxt+mB7kdhV3vU+hSs6jy
 Ezxw+U3Gb72SsvL2D7L70Nhztp12Ihw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXxCSMJmIZFS4X
 T+NPPFP/Cp6RZ39H6ERp9eHQkrKr1ZQO+sufNe3Nn8/98mukoi9/FMNWii2OaI6lA5fo7UAUS5O
 WIkY5W6RZ7E1aM9Ra2sweMlTqbjm9vjx9KnZ9LFXviUnD13xteGoUfVlzY9QhpMK2u3Ea+XMH/1
 belRiIfYPMol4akiShPv9LMqIP73M30MakRGg6OatzylZtYQdlyRGbiBDxsPGojdo9omxH07A8W
 w2mzw2XcNrVAXuVTdS5+HeEuVc+A/5AmaqPA3AAU8GPAUJNA2BY4qEJpNXQd9aaXUOB7nlc5znz
 8xNokEhPaXychAOviMwjrcvv7Kh443Bjh6maxcM4O42V6zRSBNa3XScyN/3Wa1oS9VAOIExaIXx
 lE6zQu0tdN4u6KtzrUhUZpoTo8Zy40So2ejQG576dbCBHjsIi/M9IDU13UeGPJLY/mDqtuaPO7t
 YP1xstNAh+E3yD2sRiw==
X-Proofpoint-GUID: oVANsr5bDZJqirU-Q-S9XysC4jXI4h5z
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4baba8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=NrbrONOL4QpDeGKfLFoA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116845-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5241471142A

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..42d05334bd39 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,47 @@ properties:
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
@@ -29,7 +70,22 @@ unevaluatedProperties: false
 
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


