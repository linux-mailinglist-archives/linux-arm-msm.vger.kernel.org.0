Return-Path: <linux-arm-msm+bounces-96225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M1pAHysrmnMHgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:18:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B9F237C10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 126F130917AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9450F399013;
	Mon,  9 Mar 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX9X/fB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOKc+sXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D767399022
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054802; cv=none; b=EPxOlBxPj2P9MuKQzwCy/nwDGb5s/GD7GSDG3O8WA82+VnvUAkwy/ZXlAQgJNH7oYvsd+1ibkl+2/X6dC0rM0c5wH+q9MpQ3URIVjtu7XQCfu3ai0BM0bzEsNF3+LeZAViUTtr9ZPVcdW5sJ5ka6yZJI3yjIfhn/ckAc6FCEtp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054802; c=relaxed/simple;
	bh=gYJlb63Zd53dsZ7vgXD5qYT6doFbEv5m6uL2BgBrnwk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BtmJDXadGcdTLZRF1Rj0/I4bh1B4jjQRwoA3iN8C/JKGYQOZemYrC1eks8u/pHk9/yI5GaygvUp74FNuRqqr8Kn8v9GDVLhjjxi1BM2iCweZ2wyJvCkWpwGIE1BF2Y5072sKzzoo/NWcyipjYl7sFdBxA+075dzNEzTOGV4goqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX9X/fB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOKc+sXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62981eBT233691
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zLiURaoEZ7L
	H+73e94RS9tg/hkXxyFDfy3q31wGb3cU=; b=RX9X/fB7VT4k+OiKrYdL6e7EBs6
	PM1VN0l8VkzHkWhBE+Hlw/Eav1Y9KtP6dqq8ZKH87rn+Nm4BkLJkpa+K3jF4Fw+f
	u5esUEq8v5CSk8Goj93Lfc7w1ATPh//r56BgrjaMxu2AidbKRWh7l4Q8N1nD4YhG
	h69q+PCxyCiMPeCEty1QZ7OQKUbDJDVrr8/J8zBbv2FcNho1Ir6hTp/IOHcRXHqE
	pyiyZ9sOKvnlRhzE6ckQjx40cGxQ2m/NYh0epCh+NlwweisSdL1OaDtLJzdJLq4y
	yJvY3WE6bpyfMJ4UCmnXFAXQnQH2P5tZ8M6qvjEchh3bx5z4d4dyo2Df9Fw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vd4ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:13:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae6961bff0so297669165ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054799; x=1773659599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLiURaoEZ7LH+73e94RS9tg/hkXxyFDfy3q31wGb3cU=;
        b=YOKc+sXG7B83/UaZfD77frfk/em0YaXtSURsZ24qnFeqV+dmA9P54px1+xhjc12V1F
         HU/5mHCdZebds6nUkgrtlIq7dQOPAYqkU4+8pW9tFSC0Zad7jRdevrzxjLa2VQg44Umu
         +ZzgpEG1E1GAuR7RwWlGGGJRaltA+Bi8907Ln6OwcGLS0kzj5oY79uN57lbgEGgC3Yrv
         qgY+Xrtb/Ld8c5lLrs7kiKS8E0tdZSyzuX6k39NslwlXhXf+IrWMB3vAM/gLePNAP25O
         K9BzDcj5lkrwNRoVMOv/Lreof9FTgepb7ckPF8BFx6kzv3WtwV20JYjDkEHmuwDlis2L
         NduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054799; x=1773659599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLiURaoEZ7LH+73e94RS9tg/hkXxyFDfy3q31wGb3cU=;
        b=HPGzTAcBUNRM182hboPH35Rt1G6I6wFtXAMcupyIMx61sdqqrqAf4KSLmHdqUnSX3O
         CrSHYyXOOttPbeUd2hUf3V3heBjgjviD8Diuia9E38D8GO4wfeNVBKnca3EJwEFYOJfO
         tw/UvzrjrdNqmFAeRtB9lvFf6f7i2HCHQhwADdQ/4kuMtdGVBeA6Cqjmg35NaWe3QFXj
         XduVHHUa2anyH0HJnsaZ6Zd7qDoOPWhfh9Af4oBCxPIQwMUIHqfTH+o6BV03pyRwuaWx
         dGYGrIOOWK3f9DLWH6wFwJl8AnRmrJB/uHh9Q97UcwcN3Ez8jxdRYZ6ttmvAllDFu7LO
         yiaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfucCEpnexajEtSA2ioZLD6ypfb+nONIKn+kAMQZK/xqAQth2V9byvH5GE76/Q6rz/KO85e0ePUq5O3t1c@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt08+2JT3BTDvePazaXOyBA6/tKs+fbamoMT0z196HqDttvmck
	IxvB7O+wV6JOdJg9KliDd66rysjccLPXtmehJSIeH4EcmUkyoL/B4UjhE/+uMVu2W7b2QRXCdM1
	PmOkeob1icwGrq0cCA4vaisZZ7FJQCTc62qVxr3DH5iBs9lZgVOOJ/grnsrUGqaD+k/Wf
X-Gm-Gg: ATEYQzzEfM2ZurjRXd3iZ/+Ag17ccQV4fqNGAOtAs9Z+GF7i7cKlmJlj73XFbKuifTe
	J+5VNiCt+Bh4LpEGRmzzIGvZnF/k34S5a84Lk6mD6axURo2WqhLRCQ9zCBvYT1ArGWBGQsMdiKw
	L4D1X4ZjPJK3ad1XSV85T//vfpNBpsDbmO7fIwpIIOiMiJZWrUUwyVC35ABOT3tQ6DbcKddji/e
	nRUjWymLGf/L6fElImnGxz5Vq5tt+lcfmv59lefZeV59wNQwVk1RI9feNEcuN26vFkhHPUsGjMs
	FpCgAEuRuYjKo2e6Dj2jTcCZ3sAR+lhNvT1OIeuPtOWIihez13c9zY2Dp64rr91ca9fOe8xzy/t
	NGqkY1naQef++CvX/UsPRn8mwdX+dmZM/YCL4GkoLjP923WVHNU32LM+jCw==
X-Received: by 2002:a17:902:d48b:b0:2ae:51bb:9809 with SMTP id d9443c01a7336-2ae82444376mr111788095ad.36.1773054799175;
        Mon, 09 Mar 2026 04:13:19 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2ae:51bb:9809 with SMTP id d9443c01a7336-2ae82444376mr111787955ad.36.1773054798670;
        Mon, 09 Mar 2026 04:13:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840c9967sm145405925ad.90.2026.03.09.04.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:13:18 -0700 (PDT)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document DAI subnode
Date: Mon,  9 Mar 2026 16:42:57 +0530
Message-Id: <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3JSpNJ9gpQhlzYOjlRXfT4dtWQffFeQb
X-Proofpoint-GUID: 3JSpNJ9gpQhlzYOjlRXfT4dtWQffFeQb
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aeab50 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ToWtgBs4AJHCE2l4FVQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMyBTYWx0ZWRfX3BE9M9ctrOgz
 HJEF8xaPaABlqxXn5hMSZPtbL3ONUGBqbdQP771WGLleR+/q/AaxOsjfYDnGnTyaQsLu/V1R7Nw
 I46sHbLZN545buV4YPy5+NxluKS4JOXI7oC1QzJRxNQmP9UWTg5vJqIh/wS76PFFJjIqFdC0Yhk
 lmO7V048W0SJzgxvssNXUBP5xhHG5UzW1eLKruiOMCS64Dod6ziDKzgBWsTDJq/qTLcyvNwv/mo
 mVKYMl8n3gSkeU5CB1cRL08MvSW+phrNExItF5kPEgqgrb2odPcpUZ2RsGu9dhzYBFGf2lnSRQY
 fsGekg00DXXxPHFFDcB+Ds1eRHbdJn3M49YOvrDL03H9IcbvCTdGPvCbvlfm9XOqAtr+SnhWMpS
 3Sky5Oyx9HtMJYO03DCaZTRxFweZsVvkHkHcJyGPSLxoHPreJd49oRdKXiwhyteB7c4iYhhkoOt
 LZBSsV5GVoGVoS8Wlxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090103
X-Rspamd-Queue-Id: 55B9F237C10
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96225-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.16:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
describe Digital Audio Interface (DAI) child nodes.

Add #address-cells and #size-cells to allow representation of multiple
DAI instances as child nodes, and define a dai@<id> pattern to document
per-DAI properties such as the interface ID and associated clocks.

Qualcomm platforms like talos integrate third-party audio codecs or use
different external audio paths. These designs often require additional
configuration such as explicit MI2S MCLK settings for audio to work.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
index 2fb95544d..1d770cbcb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
@@ -21,6 +21,34 @@ properties:
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
+        description:
+          Digital Audio Interface ID
+
+      clocks:
+        minItems: 1
+        maxItems: 3
+
+      clock-names:
+        minItems: 1
+        maxItems: 3
+
+    additionalProperties: false
+
 required:
   - compatible
   - '#sound-dai-cells'
@@ -29,7 +57,18 @@ unevaluatedProperties: false
 
 examples:
   - |
-    dais {
+    #include <dt-bindings/sound/qcom,q6afe.h>
+
+    bedais {
         compatible = "qcom,q6apm-lpass-dais";
         #sound-dai-cells = <1>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai@16 {
+           reg = <PRIMARY_MI2S_RX>;
+           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
+                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+           clock-names = "mclk";
+        };
     };
-- 
2.34.1


