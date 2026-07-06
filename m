Return-Path: <linux-arm-msm+bounces-116703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fw92BKR6S2p6SAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:51:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFD670EC99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:51:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FcV5UvkV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xjht2Ujk;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116703-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116703-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DD9333B02BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCBD4252B1;
	Mon,  6 Jul 2026 08:57:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463CE3F7895
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:57:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328270; cv=none; b=ZkZSK+f+O0Q1MdOVLKr10bRvAoJ3AO4PA1ks+cti9f/Be47mR0tkE91k8q2FlnSZxPFZq5jR1o1KJmUaSJuWURDaWaFPFPr6EaBm7HVkr+Agnk6dWjGHzDdmIgRWTjUeIjteltYlK1vujGtTIcuQI0shVT5Ne22xl/UfIV4h6Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328270; c=relaxed/simple;
	bh=CI6k72yT7p3oLTIjONdogZ70kn31jcn/ngorwqMG4/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n5t+ALrZ8OsCLBepANDdwUoY4H/89EgU3+sHxfxUwlY9KfjTKbu/Mf8eCXkwghI/I39VtyXs0WS6DKenIxFKhD4Kyj5khqcz163pnzSgFrhVmUcafOc6IhcZHywOJk8j9rwV2P5U8FHi39R0vTNYIFXaTqHM8hrLTyL0FqPjg7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcV5UvkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xjht2Ujk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668jEHM3624558
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=; b=FcV5UvkV0nhXjZMI
	aJU9N5HlxHQ9jYV22jcaj83LC8omXIaqmuG63oNPUqxX1fj3LBUEx4rdT92Y1zvi
	W5dycFCXaDvPn8sUwF+VY7zoFdvpSpL7kTWxockxVzaVka6K+vkOXgs4xWEvcnjB
	SSnUksCVWEF3ue91p6fIV+2YKOi3BZ1tjD3m9JRU6nwDej7lLfLVz73m4HW+su9/
	+4+t4TUWE2ZS4cryA/R3LugZ6VKedeKqePaNG3M2Hqt6qiulANaO4Z/eMnCuwhFV
	8Gccq7D6tqwCntd7FksRaDksHUVFRZ4cfmDiSsXCWScqSjbD8NI55pAbCC3UcJZr
	yX4KtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4swhgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:57:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc88e22f92so23846985ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328251; x=1783933051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=;
        b=Xjht2UjkIkddCtVtCUGJTXJ4y9DB5vsCQwAEMyIh0j0UySHfvjtajnI31oQm887sMr
         LyLYkowrxqS4mIA3k6qMNYSPWmRmCrKB8Tn7qwZ+MEBpnGG2kXzXnPsr++bD82smfQYY
         q4UESdoZEkv0xI2AfE/6f4F/q3gAjuZXYBaH5VpKy2aOhE84OGOWQZL7Uv2r5hGOA8QQ
         /TWgnHpIfYs5D+P6Cz/+5P+Xkzr9BefvNXMIqQWV0fQBpQB7/QcWH55g6n03R7jVuI+O
         M72vIFDWsK0KCYV1NMZdDnJUxPABGLMD9Lk9Xz0qSkoxBou7GRlHrBqzbHagrYnyvz9k
         TtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328251; x=1783933051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=;
        b=eyqp4dVx+J3Nk5+EGJHRnYzQUEaRKLBA+Ffm/HFPA7STRlSwN/nKuRmJXxL3u/mPj8
         FZ0y69KfGud+KAVtSiADQyGuBzSrqaJv5NDLYx6Xz3TwUaDTlul0Yc91e2X5Gtdeqyj2
         A5SWI4+T3Nt9PpRHVusNKlGVcyeFuwtvU4oGJhby5Bh3zx2wDzrasqE4lC7VXTMNZHk5
         fHw56SV7VC/9S9lOp4b69G4Fps0AqsO4TlohfgULyoG/yL7wSAopCJpkFp/OsfwUA/eO
         eQ+I5a18YJTEwURvp0Ia01TM5AYd0eYD24fhVFzD9sgmaELIN8Jg3ssUntwrTxb9JoDW
         OQ2Q==
X-Forwarded-Encrypted: i=1; AHgh+RpkKD0V/RA1GhmSYB6Yi0rxuciaNTkXRN6lLhF4Lbcwxz6NW3LCNqSy6JNLvc8JyNzCcuwvOuFEEy3MzoQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YzIqrEa7YwqRgfU7FoVIJ1/eQcnHc/ZEXDkNXyd4k4Tigk/QJ2L
	Sz1gc50agMji2feRP79Ap9Zgc5LVGulZVij3jRFD+uWEDHhWgYzzekVqwr6QCeT8aoMkoxZ1766
	EjMbwGf+qPYCNyRgtaNYDVP7MsGdquHwvlplOmhGUaZZ+eLSQ0sQgujIRYPN+JOdH4c0Z
X-Gm-Gg: AfdE7cnJbUsNJF09uX/5+tGtTmyVWEL8CM8y0oqeS2IjQaQcoW54v9XwMnqljElq+iR
	UyftZu9FUnpB7T66TSoYCOJRLqVL1I3oZvs+7iKNgxje4LOemEWvbMmsL4jpNChkbmUEpiNO13f
	Ud63nPtkQi87VJZvJK2fH8znZ/oxYCqzEwmXzlCKn66HqfIAKY85iyx4ymFGChq9zFlRTMS0HMq
	jqqyjMxSwT3438MeZFwUgYBy53WG5fCeICNTu+rmD6NCOAz50cYJijnXqPVB7aY/FJQl5oxjmaw
	YtpIRoGIFgSkNri5+0F3cZI7NLH+IU9FB6axNQAi610UBPWuMpnh5dSha+flEhQyh9+evO+D4tG
	QiFTaEhoa68ZJGsTsS+4PFMgX2NNIrDQaWDM=
X-Received: by 2002:a17:902:e78e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cbb9ee02a5mr104858045ad.39.1783328250256;
        Mon, 06 Jul 2026 01:57:30 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cbb9ee02a5mr104856655ad.39.1783328247997;
        Mon, 06 Jul 2026 01:57:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:27:13 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add video clock controller
 on Nord SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-nord_videocc_camcc-v1-1-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX9cr5MPmzxDx9
 8qVALvxfm4IHJxvLfLXpTPPg+t7jeVUEUtsqDfpMhCKfbyuivn+aX+h/52b56ZlE8DcfebNMalh
 RrRZWHuspqu8r3bZNt2FGV9cA2MKAIE=
X-Proofpoint-ORIG-GUID: 2VnNfph7XGIaEKrJjZbpd68VpsJ_WeQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX2hLaty1ohrkX
 Il1jH5K61IFBbYjb3u4q9YxLo2E/hmHXdvIsV5FxEhCJED+3B/SnCeabvLJLk/Kqj9G0v49ojMk
 3A9d0VhMil5eLFLtVhoyNEwpBpM0s1HQRsrQcRf8ui308gHJwzx6DkBND+QzRGJld+dPC0Yqvms
 PLalcDbUUoB/+TYyGMBFcDPGIX0wHT0vEi4J4pb7hB48/4kW7YK4CLWUFbLi9Tp1aayUCOgTWw9
 HR1rMtglTCvyZqGzr6wzB6+Rw9C7wrQuR98IMdrMluDCbs/TEOzEM6gv7oS0FpEbWdGCozQFLcb
 Rd6qXePpTfiojWXTFOAqZtckp8PvvCapPAc1FAOKaXS4w+0Gzl12WCRG1LYCBhMDO8Pks3Su5yB
 hjmjqxR5h8yhQEF/iEDwIKERFS2niqtxZldzher95zGxBpJo1+iH4vDUOA5EmUAcgIuwb6whxFn
 +/4Ch6MkblFs/gcwibA==
X-Proofpoint-GUID: 2VnNfph7XGIaEKrJjZbpd68VpsJ_WeQY
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b6dfb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RY-p5p5HfOYGDjfYP0cA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116703-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BFD670EC99

Add compatible string for Nord video clock controller and the bindings
for Nord Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
 include/dt-bindings/clock/qcom,nord-videocc.h      | 40 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8830e2bc0c3b8f323c818ee48dba2..9b9878e9b9cfc669e9b5f1c42a68e9e0c11eebd3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,nord-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -27,6 +28,7 @@ properties:
     enum:
       - qcom,glymur-videocc
       - qcom,kaanapali-videocc
+      - qcom,nord-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,nord-videocc.h b/include/dt-bindings/clock/qcom,nord-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..8d75460211099f3b2463c5c544ce3e85155c6466
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-videocc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_NORD_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK_SRC					0
+#define VIDEO_CC_MVS0_CLK					1
+#define VIDEO_CC_MVS0_CLK_SRC					2
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_MVS1_CLK					10
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				11
+#define VIDEO_CC_MVS1_FREERUN_CLK				12
+#define VIDEO_CC_MVS1_SHIFT_CLK					13
+#define VIDEO_CC_PLL0						14
+#define VIDEO_CC_SLEEP_CLK_SRC					15
+#define VIDEO_CC_XO_CLK_SRC					16
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+#define VIDEO_CC_MVS1_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS1_BCR					4
+
+#endif

-- 
2.34.1


