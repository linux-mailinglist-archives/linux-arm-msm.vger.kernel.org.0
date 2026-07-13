Return-Path: <linux-arm-msm+bounces-118696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c/ARNLGqVGp3pAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F37491BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:06:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=m38nCxlM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=O9hRO5JD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118696-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118696-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3636F3045AA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915DB3DD522;
	Mon, 13 Jul 2026 09:04:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD743DDAEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933479; cv=none; b=dn722F+Uv8R+RDg77K39SdKaOHtIT2gyIOTbPhVEhjwl41iz21smvrq1wxxXH0HsFWGzQuN/75qTgLUt+gscARoQE0gBdPv01jDElm4jv0GR+3nal5jZvAtKV626KuSCIlFxgZO3HQK4YFsyiPx78jQphvG6MracLPSzvn7hHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933479; c=relaxed/simple;
	bh=AzmlBXROR8iQCdEb1BFK578xEWcRCr8BSs+1i6E6Fvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCtJ6N2f1kYwQEpt3yItQMR+NGRHp0HAImucwiPX0/+Y3oOp5YhWtbIPOh9gew0GYblWKh6ZfLXMfmFxu96LndWNdb3aAKzxEomBHqmkiNFlFBX+y8qgntIGqZgyheA2uvhP5xyQkdF7wksAWKQSS4eExGX+3ujR68cFvr0Svdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m38nCxlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O9hRO5JD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6O55P674892
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=; b=m38nCxlMUljM7c7d
	Snds/9fkN9ZZrI/s329Y4CqL0s6ep2yMm6os9w2ivKiO8vj+Kr8i6+Uqatu5D/us
	uqOYTXENqMF5LaTJ8q0RcnIGwXZAynw3Lj/Bh4Y/4GasfFdeq+1yGXbZ2aKMWbkT
	fPPx/q/RFmSUNU8BPLon5BuvyV9hrE/ZtqVrL246yixbnIFxhPNhRnF4Finn7X1j
	D6E/5SPCV5XPf6h+IVutv6Cq2Az5PEfscXWd+qEIp2xCKV1Qu7z/wAzieBCUseK0
	LMrf/QRsilmAaib7Qmbdd+I9yuJx62fYioBEq7ws1FV8lT7W1MPV9Zed2S1uB6Yj
	eCLtZA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgnbp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 09:04:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3812b0c6f23so3392613a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933476; x=1784538276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=;
        b=O9hRO5JDF3TXWPXzUIXIKFu/SFwK9W3eXTOQXYKQVOEQZ4GBWVXzOePYCcEf+RQtjm
         4qtukeZ9OswcaSImlTfChka1pPO32V7r5/tlfU7ziJEB8GHbcnM8QIEbCGHoW8Thz7I2
         lOj7/pnqR9yg4LB6xyH9P2ZL1wiabKHHdb/nvZd7aLAaSZ4N8s3bJX1uxW2PtMhbBQE1
         DT5fxI0eVUpI6s7ikw05Upq4bmmdx5p7o1ulm/m6pYHtxA36hPVPRmN0Nfkm1iL92K1p
         i4HoC84evwPNDk8T5SFbkcc6bTfBIdTtalo2H9gjHH3Z+9AJyYEWsWn3L7+HMVxS4W0U
         lc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933476; x=1784538276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SLkAwoLVoj6Qwjd/dBDZ8C0ko9gsRMNeDqMng9Ci0XA=;
        b=HDnFco4IL0e4Fj1UQBpvyLDCPE1sIXM58zP5pPzmntNB00oPd/HiLkqU44FskrtfbM
         QB/WMG4mFoBcHGUB1frh/vuSLxvQrNzAo8w7l3mpEE2eoyALjHCFIUvISXoREY7SBCZC
         s/oviGIJlGvprUEYTzMWItXMnYVtdsd7IlSwQwzb8muj/8pDQOxlU7+BYm8uvZpBB+Ub
         GZfgUpUM3DZMGqiJCYmCY10MaMp0QEPv+V+STDovPilKDNz2IASncecyuD40MrkmH6wZ
         uNwYL7+r4nmfg6vU0OCKzq/8E7WDJjx4T0O53KEbcQoRo7swo0MOkBvQ5/GOqI3fmV0g
         4u8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2BzQyZbUWlhEXitAnsKmXnCcJBooxc98aHPawV+BVf7LUGVmvbUDAg6umsYXAwt9d5iNmcggQlJ4l7+gC@vger.kernel.org
X-Gm-Message-State: AOJu0YxqubMO3MVzjF71DZjwBKYMFp2NLsa+9S3I2fpNwH36fcdhedEv
	PBOXVHkbuBO2Z9nM3Al5I0pF+ktSP/dyGc2jc0Ds5usTkFlB/Habuh81hYB8UCRn5Z5tmF8ghE/
	Nd0NZLym54zQwoHnD6h26qkD2d/6NoPOMIDW3pTzlyBDMgg3UuuGn+AwA/LaJweu/1Lge
X-Gm-Gg: AfdE7cn6XRPL8lAjs4HopMC/UnganMMJxIRVWo5D8y+RtGfd41I0sK7SPcay6YCGIyl
	83sbxuZCLn/JHi+SCgRxDih78Zm03rLKH+mqjpPr9gf/pQHRxcwh2AFgcQMMoWuDrSteUC/a+/8
	/G7rWWUDJ+xp0fvklR80GvlxvopdJ0UFHCZ8n3m+WC2oM7vhVEQXrPiD0/YhSMasT46B/MesCXA
	wb9Ct402qsVDm3kQFvwPpJ6eK+pVTHCONbCNPmIbLEDKcijm0IXMgEmLaJt3gx4bGzD8RgS5cQr
	P0pSB+Wt82WNXvsxq6a8ylaW779aqoI8OxsHdFSBDCgNJIVW++uFRmIPBDvwBGdjdyTI7WrD+98
	vmHBCJ55iKmpmGZ5oVajo6E8BQxRzYROJiKM=
X-Received: by 2002:a17:90b:164f:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38dc779ecabmr7418665a91.31.1783933476015;
        Mon, 13 Jul 2026 02:04:36 -0700 (PDT)
X-Received: by 2002:a17:90b:164f:b0:37f:9ce1:735e with SMTP id 98e67ed59e1d1-38dc779ecabmr7418618a91.31.1783933475496;
        Mon, 13 Jul 2026 02:04:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:09 +0530
Subject: [PATCH v2 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-3-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX7elz0Ck0L6mm
 dX9uwpIwGRxQJgg4bDLs0ROcM0TsnteEKZfQ+A1cWLIJibd2L7OpsqOhbLT27WSooH4+zZgomUx
 0gDsEe8yIqcnudVhZJKPqmKk7nA8SBQ=
X-Proofpoint-ORIG-GUID: SVpu734uplu83J5DvtmaYBkleMZWgW6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX3e2VCb0CqZ9w
 wZIRJAAjiaydXrGkLqtOpR82CbehvxpN8eXdXIIMrDLHDLVSIw6JqCz6prpR38sRGuROqaQXFAn
 FjGYWjNi97P/fyJMzGmWQkVeWic8VNaejuTkXvzOoetCPJU0MOsKPaBLQcM4oJb/+l9TZ1ckyJb
 ugt+iS3a7f4bt/yx+Qu/9G6pZiOGHhvjxJg3tapKqntuvKYuIVI9nnCngr8xOHnK2CM9We/JXcp
 Gepa+OJmK5Nju1i62BBMhNhX3qoTrJ4cvDColatSCzifY2niQDLNfOquEQtRNq+08BgXkx9gwUw
 RwRg8TjvtnTpxPq5FvAvyRms1wVvfcxNWsfabZJsLNOCMcDRgQ3GT/uhoMZQqGzQDRuImke427v
 mMdPlQ0ORntzfL0Cx/n6XXbWbdeI4u9yj9Ibg1E5lrGNUNpIrz+BKSSm+GgxF2NJapqo3KriJtA
 riPgeAvKTb6nQ2Sg4Bw==
X-Proofpoint-GUID: SVpu734uplu83J5DvtmaYBkleMZWgW6i
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a54aa25 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118696-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 481F37491BC

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
 include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..2101f4e4bb0d37f5cff42290f88c2f816038c402 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Hawi
 
 maintainers:
   - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on Hawi.
+  domains on Hawi and Maili.
 
-  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,hawi-gcc.h
+    include/dt-bindings/clock/qcom,maili-gcc.h
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bindings/clock/qcom,maili-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9bea90adb988ed9050ec30550d8723ede01ff6d6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-gcc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+
+#include "qcom,hawi-gcc.h"
+
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
+#endif

-- 
2.34.1


