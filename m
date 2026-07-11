Return-Path: <linux-arm-msm+bounces-118446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id txQNCvI9Umo/NgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 14:58:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC40741949
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 14:58:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jeJRKAlk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ebNdNC+F;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118446-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118446-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F69430264EA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 12:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237CF3C456F;
	Sat, 11 Jul 2026 12:58:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409D3C4B83
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:58:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783774683; cv=none; b=VyNmA7o2VXAXypshIn4VmbResu6l1B2dKCLUdhEp1y1iEIIbE/jvl4BONa1AxbJ2mTV/jqfK5uNwtIMUysHuDSua4jIr0DzoGrvjlBzSoFnqi+YZQaNubDJNOUZHUwDaqw+5iPcE+Zi0x84Y2aZ/zHnfGcUfXMvM1Xn+EY0ir88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783774683; c=relaxed/simple;
	bh=vBUE09K2ZJ0I6D7b7YeWJW4uNjwNJtT1FGpBYywnV+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i38cKYJMXE6p6aZ6A41Jdlv7BDVq867SReeOhmreX44Nr4xCgofeZnaK0l6n5aCdJ5+aD9jsvr5pwn+otrcpDxGyY4TEYKHP1snjRWSPpJ8bTY3CLRsvj6uHuBOezjSuO6uh5docw0wCkLVQtRDvLrNXJ38REetJnHca49Q2keA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeJRKAlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ebNdNC+F; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BAoFXT3604304
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cp4uLzOCic1
	RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=; b=jeJRKAlk0IxnliHRBh6InvnuKnR
	IxlQmeA3YyRHgQuO76itsH6zBTB4ktp9S2sjtXVk+byihi/uya9p3YXAHSvh5r5R
	yzSZtvCcMP/49SaLTaY2DDNjpMRluJxEfhOLPge4UOr4cNH/PGkrN2UickXfHxmk
	gOg3iYAxxUCU3IS6Tg8izQvTz+rLcfiPBNE149zA9cc/S+Co5rlVnK9xiBvhBTgI
	2GWgVdjaRZH//eQW1FcqmSQBgwArZwoyBHWKKfaxBX2ZlfirBINZT+FWXS0rDc71
	FRY6T0LpW3sDIv+uKeKeB69jkzq3KI920jz/uwcVnBtFMX/JcSbFX/4Homg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehgtqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 12:57:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-380a638fb5bso2046063a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 05:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783774678; x=1784379478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cp4uLzOCic1RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=;
        b=ebNdNC+Fer8I9rxfxKnlh/ccCQbBaoPv5OELS6YD1wzRN6789lMLGbBkGABet6dhpx
         3p2M4bV6JUk+avUDcERhtkhldnzD2srcb/wYXeXyunUlJsGxAMrEn4f4qtm8iWZ/CutH
         Xy/PAcZf/U1kGMhZa+NCJK8hHCfn5GcBJUn+nYER9CVj7JdK7fAAeE50+5OK+p1N6Ibc
         ovMncfmelWXGLmUn5M3E5NFdW0DOgq4ct2K3lgh2cJYuUdL/VUl72tx7kqXcwpQ+wj4q
         O/CveBNNg1dI0UmNpk35Xjtda4rz/hbD2+QCx+EX5WvsYK9qBGP6VbaplHXerVjKKIh7
         Q6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783774678; x=1784379478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cp4uLzOCic1RRkGa7AiSR4wCQkdmgpEFJlMlPSR0hCk=;
        b=gae1w6+a3HFvNPsViP3jQVNM0jzJt96c9AKrM3QklqsYXnRKqZe2ea8PEf1BZQi5pj
         oyPodT8RSPhOrqfCXCc9/4KlLbrboC6+HkuSkvxnoaOMpWLF1M30g1UGQxIX8a/U35LD
         t0L+TYZ4pVyBf91voZhJIpijVwuhLQweEcvYoKkcgFDieSHjqcXXOG5WYFSB12EeayaI
         YMZAihZumbEaC3n+uHNu7tfNdmVHdjv/I/FjUFYe1YNktLAIXUZWRf3aQRqOtu3nDDMN
         28Wp7btVItDR8s9V0V1Nau6f04zFEetrE/D4ji7Yx62fk988VIv5MnaeTEeV38zlq+b/
         uNlg==
X-Forwarded-Encrypted: i=1; AHgh+RotAY/mzWLoQdRqlDZtaDjCgz8Nush6YD04oInLD6oti0xDeIU1Wj8f870QsbfHqcjYH28zjkpcfMA9uirj@vger.kernel.org
X-Gm-Message-State: AOJu0YzryGez0vHHxKE18gSCnEKjjQyF+HZZs7r5cTC9s37fnJhhPMPv
	ctskFHcUk7jrkYFK4wTX5mfqSL2JcNAKxenBa7MYYiIa+GlQRpHB683PKlS3ViBblKJFKcX4Mxv
	FHHzmeG3dDpqOc5uYwTpZfhmZPbA5NF1xNKaJu2Kqa24kZNUzrsCSsiCD+XzvuLv6LewR
X-Gm-Gg: AfdE7ckFlXRUOiLLk2lPcZq2JtVH6bJbtSzOd38o8s1tuwDIyr2zqpvidgTtoPYFb1W
	COHG5f1YjXutqUChOShxaMnThLc+ICh016S73n7pSFQ8SRL5bjMqIjTSTKMFoZXAzTOGyi3jUpv
	FglnGBwS41JVesvqjnWbBbd+ZDNUO53x9/FPpXSi0PLIUU+MY8s5YZWsP3GypWTLCgTKLIcyr4v
	nhEUozwslDfZp+R3dYZ/mLaoBTuknQ1iav6HtO1DAsp58JKNtyEqScF+c16BAec5tHa1Ju4HQO+
	XcldDGJWJPVlAoZao39AZgHJXXh/wq56Ltwh5/x/fa6oE/W2WiclzjmmVFbYJE1E34tE+uVLrwW
	k98XC97UF80EmqZl/nTvOQbLDkW6V30DXaSIvQ+9EaT/lgZU=
X-Received: by 2002:a17:90b:3d89:b0:381:2811:e8ad with SMTP id 98e67ed59e1d1-38dc7777abcmr2924093a91.23.1783774677947;
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:381:2811:e8ad with SMTP id 98e67ed59e1d1-38dc7777abcmr2924073a91.23.1783774677496;
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm11185634eec.23.2026.07.11.05.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 05:57:57 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Sat, 11 Jul 2026 18:27:38 +0530
Message-Id: <20260711125740.3083236-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX3zKFUEn0NZb8
 rvSJxlgR+tBJRE8pGjIzARGSm+2FnGQZ+bZrSwIsskncpFStWzzK1FxUFe+zNu9B6ZXmbRvAHI0
 nTCSbFTZck/WDUjdky+UcI+us2BwzsI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEyNyBTYWx0ZWRfX3/D2Oqxd9m/P
 wfGvAfQsT1gAhJVAEgOukJoLlvnf+AvUfT7LJ5WZwYM8A9Fz9FgY+xSJeyL6SZlF7oszqjUMPGb
 C/4QvPx000SYzO9pYKV9hA7KWcWE6tlT9WiTrzJgrCwMsMFJy3CDsi64hMnBtYoUxZ8+MsUjV4q
 eLqYRpPraMebzmmn0iwmYIn281TtGTcQCuuYzaN1Er1N9Jmr0l/XnYYncCG07U2mQEoajDer6Eo
 3mXOFH7EqfnkdUqaF6krRc4Wu+IsXzOrcVOravvhTbXSYnf2JlGUfVTavctcom3VQ+Hb3YVYJ+l
 P4Hdad/WpqSzwZupnDuYQQNGZ2mTBhocX0ZtLzF5e/kYutXK4qT/4WHTqSAjVMMp/H30ClJfNO1
 4XC2zYaamprDrmVpY8rd4vpJh8WG8WZdgCUuLXhv3eiYnq8nZakVH/1ZudPPvdmHFf+/9WBN8+z
 /IByQi6kVMAee5wD/yw==
X-Proofpoint-GUID: 5ZqIzAy-nyezJzMEBVE4eu3JFLI9sx6d
X-Proofpoint-ORIG-GUID: 5ZqIzAy-nyezJzMEBVE4eu3JFLI9sx6d
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a523dd7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=NrbrONOL4QpDeGKfLFoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110127
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
	TAGGED_FROM(0.00)[bounces-118446-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:krzk@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:srinivas.kandagatla@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8EC40741949

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
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544db8b..f3a8b12d7fc8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,49 @@ properties:
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
+        maxItems: 3
+        items:
+          enum:
+            - mclk
+            - bclk
+            - eclk
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
@@ -29,7 +72,22 @@ unevaluatedProperties: false
 
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
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                    <&q6prmcc LPASS_CLK_ID_PRI_MI2S_EBIT
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk", "bclk", "eclk";
+        };
     };
-- 
2.34.1


