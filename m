Return-Path: <linux-arm-msm+bounces-107519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFycKExKBWpEUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:06:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CE653D88A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F5763050A73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBA93ACA5D;
	Thu, 14 May 2026 04:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOml1QBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3Fbphcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F843A758D
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731553; cv=none; b=YOvJVxGTii2JMDjFnpPCevSkEAhbW2QWqjKIo81287nlhi3J52A6X+9EEBoKynCkg0nFyH6nRi4bmiov8ff+X1eIs0GLzLCdDNAeiY81K2/Xj8r/3FTe7BR+GajoicuNyuY2mj8iZQgHw/Slq/mR5CxfWv+S8lupSJda/bBeV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731553; c=relaxed/simple;
	bh=FczBl8Dp96okkQR5uiS2LNaEbPfmw+OCsCMeVvN75gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PfZT3+vCNjtlOPIuHU5XXfODhRZdN5uok1/Qmtucheb4t/Rlmda1XZAcCR6VxTgDnC5wl4Wj4H7iEhsKYBHfd1LZrBStMvFTzsYOc7VrFXluBLHmsR32RPBrGTfD/JcA77J0uR3tZPcqN9GFZLYcCiKF9t0paxKgKX2txrW4Jts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOml1QBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3Fbphcz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E35KFL1096427
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqnaTjaYVHAwtUHVuBLnLZisAwPC7Eb1K3VBf8l9gUU=; b=DOml1QBshBsf1Z72
	ZKNIqmgm8VEo9vb60/iU1DQ7ra2Vqq86C6tOUyF9XK68NQRtZx/uIR7bCX+MgBYn
	O0p2gn259SZ2pI4lT3MRLS42kga6J//+YQzO45MdoX1pYRGaQzpI6oausI+EB00O
	wZTk0xP7kYpG9KUTJkgxF3FOq2wtgcMDeZCcEDjTCUcvTUQozmPmfbx0gLaxqVA5
	pRC4uyJNYydtR0KmjCz/q7h54zGfe7Kqg1QIp1nzSOsUX8gUXVdppc6dZsTbgPzG
	mi6v1AEqhpf0C+pcShTRCBNCPpK8xN3AXCxu0xoKm+MJnBoun7ez3FIDEr4uEFzd
	Tkgg2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bg59x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:05:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd00a65673so25192515ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731549; x=1779336349; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqnaTjaYVHAwtUHVuBLnLZisAwPC7Eb1K3VBf8l9gUU=;
        b=G3FbphczafuZGoOWrFD+mGVBOVCHun93rHhVdUV4a6ga4puXnPgEWJZQNl3MxsPkSX
         fV9bniWDPu3IUsKupsY3b8Xqt2UCEoppjKT3F3s/jfV0GI6HfUe0JX8F+0VWOoII2WXg
         /8oJb5vmkFiKWdUDNr8DnD3XjWG7920tx0LIN4Gp06mcdQoSk6YdiJXDx0sB+8VM7aUX
         m9/r4bq1Yjzb+Khx2hsWgONUfmWLnTOgk8JnSMqFU/uAXwHICZrMdaIXPI5jUMQP2eIk
         Gj/8M7EqXiHAb5zq68MOMJwrJplSDZ5pyyFpew47a3T5m6ZgthbDgjQdgYe8h0Xctfoe
         qqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731549; x=1779336349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqnaTjaYVHAwtUHVuBLnLZisAwPC7Eb1K3VBf8l9gUU=;
        b=cJYRBl4eXKhBO5ATUK35oGpxB9VDa/Du+pvr6UwvbuPwdvN2ijaGpi4hkHVmHZdIZC
         tWMB/u0M2DWZbBRJMNCBd2GeXLQAbOdess8QXBvsMM2mTQWyz1rfWWBwGsVOCMEMJZM6
         E7n2pGwTeFiiU/8aa9qQI47FcpQLhjo/GUz9xAZ5HKWU8ZLPtaC0sL5+bIAwADmvY52A
         9VWDqNRoLHEXl5vmLpWyevsfYVXF1EVV3ZZwU0K7bWyHwMr5ZojlLxW9NyX5JNLRUqDP
         33hQQOdzlcIFAeY528wxGxttkAgcFwvDDWVkMyeA6SuZr3OEgjkrsvlU35y3xcyAbsye
         WwjA==
X-Forwarded-Encrypted: i=1; AFNElJ+Fg0zWPT0tGibkOKhuFwXepIrxFW+ZwTsjAlyXIU0ergsU5IQgjBa1Jrk5y3F7oaB/Ngqgj61WzuOOwOAa@vger.kernel.org
X-Gm-Message-State: AOJu0YwiUqTtciGBko7SIxrO9XfkQYtl68fbi16MAHxTJCMpIfnylBhH
	Y9z/aZOGfI23Gecid8gEOt0uEYwZ+864uBqunEjcdU3x2vP8FrE+1kSWieGppnH/vRgTaCew5RZ
	EKnbiAAS4ats80n4TA2v9fedyXEpnR/urePsXEJ3TiEG1qaOGYmnaeeBgtysCCuWuJKTh
X-Gm-Gg: Acq92OFjL9tB9bqIDB2r7r2Jo+FTHNOvu4p+VhsbqUDkXrcIxqnHzlb70vYtrOE6yd7
	yZoGQRi8zl+06xyDJRD5DLCSvovJ0j0X3oI8yYK5rNO8oVVizCrAcZ/XST6GxRKDQU0sQqLzq3o
	rV8AlViWGDTVh3JOMwCWqH7xd2202UfufC071sCbXDvDpfSyxAWLo2KhbDWOL50pYASYZuksveZ
	ZpL0jOfgsQlzh8+cT75pAbkLe/jc3iOgMqit2YhaGSuZ6/qooKXwDa4HGNaNa20yzm/76OR7ZiY
	ODxkN4f3h1rQo4Ct51By4YcXBbwF3eplPxEQVNhNLH82YCTtbGQlGprXQcizT9nT7R4AO7iczdI
	0cfI0+AHBFf/ZIl/aFgGyp6VIBp6sSoTU6IyfTKTBW7gDP9l6rvL1zRgA2FNvAkmVbBOXitPGwB
	0/V7DIZvqfQOHkw7YFeMVZlC/QFbZAeVcBfOlmsGzBa5gqYQT6488=
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr13374635ad.14.1778731548713;
        Wed, 13 May 2026 21:05:48 -0700 (PDT)
X-Received: by 2002:a17:903:4501:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bd5277cb20mr13374375ad.14.1778731548241;
        Wed, 13 May 2026 21:05:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:47 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:35:35 +0530
Subject: [PATCH 1/3] dt-bindings: interconnect: Add Qualcomm ipq5210
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icc-ipq5210-v1-1-b5070dfbe460@oss.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 3D44BFNfxVY5JhfxhkLrVEHzCEsbdnd4
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a054a1d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=LXs94aH5GLyjx-_FEpEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNiBTYWx0ZWRfX4LiX/q9y6ZnU
 lEtpa201CPQhZfOSUPlYy72Yl+3syVU1iZO7ow7RH0eKQLZophHaygY64V26vrObimEbcM7u1Zv
 iOkNs2JljlxTdpOZWCkDA5QV4NHjWabkzNvO7FUvdrzpSXtbcpHq8XE+nbBMLS4j/fcAWK8OBwm
 wr5cXsT7V31jms+UOWwfseBCZXrkv8LE+8jgJPcyVLzfYr1vNQ9QKsjInz4AO9/UtDUjVcJy81b
 1dmpv4cIXlqTu5vUgkTRMinQSJpy15r/wcBs3kVKF2xPPFprY0tZAdaxRDz88q1mx3hHfgaBEyf
 lXmur9GB/634O2YveA6/WkIcWhmnOnL/GuxckkXm2s7nOX6EH2GfwjLGaRc1ZI965ZsafITRMX3
 YxIIhfeY0d3pMD/C2TCIMNOVl1AZcjOQixPgmK33SRBXFSToIQ8+DYt2MCwf4c3GJe46ZAkkmQ3
 YSyLqaSwQTU7D647oxw==
X-Proofpoint-GUID: 3D44BFNfxVY5JhfxhkLrVEHzCEsbdnd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140036
X-Rspamd-Queue-Id: 43CE653D88A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107519-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add master/slave ids for Qualcomm ipq5210 Network-On-Chip
interfaces. This will be used by the gcc-ipq5210 driver
for providing interconnect services using the icc-clk framework.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,ipq5210.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/interconnect/qcom,ipq5210.h b/include/dt-bindings/interconnect/qcom,ipq5210.h
new file mode 100644
index 000000000000..90c0395e4596
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,ipq5210.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+#ifndef INTERCONNECT_QCOM_IPQ5210_H
+#define INTERCONNECT_QCOM_IPQ5210_H
+
+#define MASTER_CNOC_PCIE0	0
+#define SLAVE_CNOC_PCIE0	1
+#define MASTER_CNOC_PCIE1	2
+#define SLAVE_CNOC_PCIE1	3
+#define MASTER_SNOC_PCIE0	4
+#define SLAVE_SNOC_PCIE0	5
+#define MASTER_SNOC_PCIE1	6
+#define SLAVE_SNOC_PCIE1	7
+#define MASTER_USB		8
+#define SLAVE_USB		9
+
+#endif /* INTERCONNECT_QCOM_IPQ5210_H */

-- 
2.34.1


