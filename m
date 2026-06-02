Return-Path: <linux-arm-msm+bounces-110748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MnHKBCQHmpTlAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:10:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2362A3DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 10:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85EAD302866F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 08:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7D43C3BE0;
	Tue,  2 Jun 2026 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgaDKcdB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VM9ZnHHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236903C1985
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387701; cv=none; b=kTv/Y8WXdbwPhdtCvHXLMtXSQpOjHEwyfDvn7U296r0XJtuorYvpx+EyFgz2bPGI6eyQitPRk2lHwFzNwNnFYS9xBoXhtnKyjgQO32b0Ofgd/0O1m6V2YrwA/lbnZxEIKdoXs6ZpeYRhsMpn8dhLZfWgkA644LyBogI/PiuARgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387701; c=relaxed/simple;
	bh=FAKBWcIX5mgY1WAddlCaxXrp5BD2oKuWSr+axNOz1nY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9mCYnoFy3uKFT2KN88rZLb8iBSXlAVGMnJRvoxo48nlpYO9HUQL8Aje50dIOeDEECg+Vis+mGhpp6BhWm4QkxPI7Q5Uld0uGc5juJYS+Ys/Koh87t5roc2A1j5FQcIzctjj9piLqfTUTDpsWLQaTXOszxi8TNa/4M78RrOSyk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgaDKcdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VM9ZnHHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526MVGS2767168
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 08:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXkGOYbueCyT4J0CjhRvb3NcVZM42lkIzicfj3kzcb4=; b=pgaDKcdBBWggE3Tn
	AIeuXKbdn3vjydi/dLflDl5oPbjTbn+Gz0HbtiEAX4HVoSj0I5BKg7rU90/Xqbe5
	CP+lRJcq5rAVpeuxIDeYUmZAo03C8SqAX30fmmlxhcnINZ+wNBjSaBOr0DuX5muF
	8+knWdDFa01LY43J4jTJ16H0vTbcMyPxDK3v1lf4HUXXhFFUM9ieq8n3rZvgvpCb
	Q8Z/UFh8OF7uT7My5jVI+/SREm7ZsMd56EDjO60OMhnT1Kf4if8f0tCf7tlX6Vuq
	+t/cJXenIxqq5qeLhuKKZiisj31Cl5rzu0kiQkyto14C5/jHqe3gXSviAmo/nMZg
	pLMNhg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0e46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 08:08:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-137d4309062so7798930c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780387696; x=1780992496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXkGOYbueCyT4J0CjhRvb3NcVZM42lkIzicfj3kzcb4=;
        b=VM9ZnHHECOrgXOgnqiymNKStdYvGIbom7mlG55ug+DgYHc94L4EO0WWByNya+FFrQM
         XrS6TnXM7HqT1BK18DviKv1o11Ak31YGcTMuw6Zpb0z3KxsGawmFuwJZ2zn/mz1FhojS
         AjsxPYVzJhcU0McYj2opYjetVGi1jdO7toCeteLh8+unEWYmtWSKrUYiSMvxVh+YMbwj
         m20eGRebbGegn9L3gWn2Bql2a1lk2K1TmgWvyW+XujMeGh4gg5W64ammlpNgIwB45RnL
         cePv62SPfktrbcRvhxHkBjtz74a3XlSThEaafgZTCaKWX+VmYnNqMCqhdQAWjWJIyTjr
         c7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780387696; x=1780992496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXkGOYbueCyT4J0CjhRvb3NcVZM42lkIzicfj3kzcb4=;
        b=eiuRWuCOxEyOF3eYUd6bY9CxxYt3xbISCYouNhLde9lPzIqsY7sPvomv28aBgwBDER
         u5b7wU7AG4AR2W+tQ02vl+f3wlCYCRSAyljpCqcDL7ttorL3teuwGewkr5ociJcR7lYE
         p2Dc96p9LrR7t6sbCVJAB3IX30i1iaFw0jx9dg/NiMauLfTlpx/fosWgQnj2yRZDKcRj
         NlIb+m6/39gzMphz2eYONDiBpq4y6To01uQ1CDFzcnVjjsodL+5ZGKq9IMiFwP8vHjr/
         STeEFB5GHl9qlaW/WbpU8kwsFI44HwfeKt4WNKejjIBexz8ujsXPuc/2/VcSIZCypaFc
         RXpA==
X-Gm-Message-State: AOJu0Yx2VvYd9WmjznhgIZPCTQf6eZauinUwjdprheLlCRUOOQKS3Pn7
	CovjT3EzMQdTJfkhr2BwpzT8p+6hPyIMx3uXOvaKyN0bQWzBTa1hygqsAZL8IpbhTrdun5exu8s
	1T6lNQeffhcHxetcncYfqLX49FOGln1qTOPuZXqj0H+Tyc9YApRU0uOx1uvYFUa6xyLzn
X-Gm-Gg: Acq92OG/yXz1saKvsX5g5lLl4OVHHmR171lFtmNaHpWAo+Irv6eiBTeLg6fphFXzGvo
	A5k9Mfa6m8nxs68TPfwSntgTaegKTiSE1M8/AvnFCUXOOZ6cvCoBSFCLcWv2muKuqq1U3OCDeUh
	jemPmniBI+tGYj8Emxs15jqWGrKaxg3YJ/qdcExogeO2sS42ozSppvURNFqVV7jGYtBGJry3ksv
	0Ly/VJGB63S07FagVdU89lqbUcpAco8LlsuX3da7NF3KwtNh3HNnN3LrhutQurVOfAEUSM9nnCz
	es62zId0NPc5uLP9WG0JkmzP8QIZZ6kaQPAQ7n/q0ctFRDfkUEKNwn8aXHiNurp+xT4xkxnc4Bh
	PyKVwOA3GpcYB+7+KpfdBQmFqhMF8hJ9na0xTt/fsYw5xmL0OieQzCb7J+I7Oj1uMiuckqqrPJY
	LIAa8=
X-Received: by 2002:a05:701b:230c:b0:137:f10d:dfc5 with SMTP id a92af1059eb24-137f10de331mr190760c88.9.1780387695554;
        Tue, 02 Jun 2026 01:08:15 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:137:f10d:dfc5 with SMTP id a92af1059eb24-137f10de331mr190747c88.9.1780387695060;
        Tue, 02 Jun 2026 01:08:15 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3d8f839sm8006025c88.15.2026.06.02.01.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:08:14 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 01:02:17 -0700
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding and add mahua
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-tcsr_qref_0527-v5-1-8ea174a59d7e@oss.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
In-Reply-To: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780387692; l=6370;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=FAKBWcIX5mgY1WAddlCaxXrp5BD2oKuWSr+axNOz1nY=;
 b=UddEBnN7GiB2L2JeGtrEwfLrn6/aTN2yJqcAiOPX6043r20fVlM5xWlkUG5GoM5GJnnys/eaJ
 gNaHTe/eZIyAK+opBgOXFASZwqHoDuvEoUEUfQ7UNVneS/kSQa6aZPa
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: BZrmbfO0ueXSKtQ-wu9YfaBoHwJuZNvh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA3NSBTYWx0ZWRfX6XEw0TMqqdo0
 ujtH9cYJLmeEsIpVBk46AUtHE4immloGoBYzmWSrNsACkPccg/JKFi2zLZPqUuWSsGgY28vbtJa
 wuHXf6r4Ktx3Q0iIvINHamrd4wREqs92TiYev62VTmna3gG9yxW+IW9d2DKvFaNhYxZuAVuMZu6
 0uS785YETHOej3bnyIQfVVVkN6wbaYbEBU9Adnqy9zjhVltJv7ni8hePoEy4w7Wmn3/fPGLcVqe
 OB5QWB5UUctHciNYxkpBxatzBkpqaxMOB1EqvaEcZOIdmqSJo+Si8esBV7pqnWLAzKsnKflw+VF
 ahzWaWzb5x7ebKBc1E5lTeKQx1AifOfutelGqW+AehJC70Q2EbWNjErTJUT5+RaIerwx1U0WFj/
 FeePy+7FOOrX8pguTTEZPc48G2ikiAMEuRZcmR4yCnO4jwyIkfz16ux6btsfhcX5K+UrZ8flNLY
 Axb2DqHPyd+7462gYow==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e8f70 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fCDs2mesohUn3a4l0kMA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: BZrmbfO0ueXSKtQ-wu9YfaBoHwJuZNvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020075
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110748-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47A2362A3DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for
QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
QREF has no dedicated DT node of its own, these supply properties are
placed in the TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and qcom,mahua-tcsr and
document the supply properties. Both SoCs share the same QREF TX/RPT/RX
component naming, but differ in topology:

Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
has a single QREF block fed by REFGEN3 only.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 146 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..2b6422627165
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,146 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1


