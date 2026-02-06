Return-Path: <linux-arm-msm+bounces-92044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOJeKOnwhWk+IgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:47:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EC6FE66E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A0EC300833D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7463ECBD7;
	Fri,  6 Feb 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FpSbiEK+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BS5rxuUX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24983E95B8
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385518; cv=none; b=HT9H+uct0SfyT+WOwXf/3zUGySlyLp9NjMgtVq9T+jgBT0qvRSgS5w9teaP+5U/ZCEcCY3b8swfw/btsE+C+OFJkm6erKV97QarI1EmWt+vDOR3/fCc/l2F8eDxp9Q7W9K9g7oLqWbC2HQEEHpWByb7RM4yai3l8iha9tP/dqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385518; c=relaxed/simple;
	bh=saK6HqKd1EWh3TSS22cpSeN43oPfky9694HMdjxVEQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RH7IlJ9lWRKX/9T1Lz66XJh1fUqXhBU9ffn4o8LsK0rjSlt/vKTIv1OkPH5CwFO8YOXQvQhQAiptpQHop3Ya1kb0h1gVjwWhQ2JEnSblyXNMKmsk0g0NHEbMPPnrNhzXXXoytWiqdWXUGKUm9lK+fvkHtVrYnEs1wPC1UPUiR/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FpSbiEK+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BS5rxuUX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616B4PVf3764221
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 13:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QRVoSAe4Va0yUsHv0BqvXGOoWDd7OSd6Eaz
	k68Y76VQ=; b=FpSbiEK+mtCgKdmAKFkjkJmraaezjLrYwv4iheHqlnbY86hTeb/
	a83ngugb5Q2nGTHKzvN8WDHRFw6ZQXrHKjop2U+0q+TlFWLxbTvFfreL6eEF2+Bm
	vJhYU5wdXSJPChZ/Y13fQ4onOz4WkYssGbu7rMj5D9rUDS1AMVQscSDjSgooqLj2
	OYUZIrb5aumst8UkAq4MFLCNAQin5ahohsEsoY2ODI7dbs+QFt0PctWDFCRCx5Eu
	uT8pSSEsu9drWfDqSLMbOnJM0prwEAFcDBV/HgmL0G9t4gelCdhZq+bc3ElHXiQQ
	0EYfTHS6Jtkv2vpFJLh5G1uIywtprZ5VMEQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5f3wgebs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 13:45:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so519080885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770385516; x=1770990316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QRVoSAe4Va0yUsHv0BqvXGOoWDd7OSd6Eazk68Y76VQ=;
        b=BS5rxuUX+jfD2xufXScxL/uS6gy1lbRNJA4U9o6Oc4rpjHjFFhBafzAhI1ywV1jSEA
         sNx+n4mBOt09aL45yLtDKgyhUTR7L50EevmaWZbVUoZut4uWdZ4dl3OV0PNIWeE6QTaZ
         efaWu6GbfewrjWIiR/P6SnRFZocUF6NcrCTlcQuJoeg4Nin/uuGFUdH4bPmCPu008ur2
         lZjg2261EKqiC1fircAR5d/qBfQPDoqVALypCQgCe0CPulg0NnisP4edAEzLzyerdNQo
         SQVlk6YHoXN6TbiZyYGh9scU0wDJiDBqvPAxdIGqouJHqJ6AKwAU4A6lYP0ZEwUxkiZ4
         bRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385516; x=1770990316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRVoSAe4Va0yUsHv0BqvXGOoWDd7OSd6Eazk68Y76VQ=;
        b=XvBAHH4wjkRxwQ4gOKKK+q8IXIkbKMBMe3K1VjtKKWRXgwYxgiG7A6njehvYxUsUXO
         XgJc3uH5vWW/LWDqusm9G0yhShp/eDTk0ASuH5yubD6dq0YyaaCb/cy1ZJMVaWEf9VQe
         fi3dVnz/qLUmdVtfTzegpsObwaHiBKwt/mHL+ZfS1bZniK6KuaeuWpuGXmoV+/O28j7b
         9lhSo56ThngIJ8ID1Rr9kI6Hqrb3UB7zdIMNrcTcPcZrnt8ZB7edvWsVhfYV+YCQ+rfg
         39THTeN/zu/H8uogV21QiYAUQk56/tYL5XGyQBaglZj75HxRXWSt9qDWdDA0Ak/9h+I8
         iEKQ==
X-Gm-Message-State: AOJu0YwwNmfM/Zz/Y8pn9/q3qDvTBw0o3XdvtZwQoY56AdTN2q5GLtVQ
	1I5g49rBKrmCJJCcG7lDw2GJRJ93DEaO9LmqXer7CnsUpAisgX+pJVwZ73y6WXo2xd0ScMrzBZq
	by2oi3MGCvY8c4BT5xx+sOn7H+vxU2RogBF799nA0v3Q4OzDygHKQPFjqMDkQAOKg9N6x
X-Gm-Gg: AZuq6aJztlCtrvOVlgchBTbzNHNvir+qnbWO85nRgD9ocfwEvIdP2LgPDcSF9f+U4T2
	oLpQZKQFFWHKGdyjV7Ax17totz5kXrRYBoFb1PO3Zl+fTCXf7BR5kSv+IMrEdPl4PP1aDSCghmX
	soODnhdzNyKx0dIPUJ8VmqiGqa6SCNtpCKtW24LNutX4CutP6OpL56k1T1RxvL1bP+qOn9U6tez
	tRm8h8Hbb1BwcbQtYSkcQv8tTwruxCp418cUm6xgedC7NKm2he1HlKo2dT3daxdx74irmXPOsw7
	x0cEh8YH2+8h1Q6Sdd4PC1hy0ZIn8/thQB+9amJkDLR1IYd0VYwiiwZC2cpmPG5gDAVawkhkte5
	4GsBsEQjsZUyh0gWik0I/Wj3IbaBzM9/7BdQhTQ==
X-Received: by 2002:a05:620a:372a:b0:8ca:110b:38cc with SMTP id af79cd13be357-8caee677ae3mr345412385a.27.1770385515986;
        Fri, 06 Feb 2026 05:45:15 -0800 (PST)
X-Received: by 2002:a05:620a:372a:b0:8ca:110b:38cc with SMTP id af79cd13be357-8caee677ae3mr345406285a.27.1770385515264;
        Fri, 06 Feb 2026 05:45:15 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fa9:b625:6a3a:d8c9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320961505sm36363775e9.4.2026.02.06.05.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:45:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: remove msm8996-v3.0.dtsi
Date: Fri,  6 Feb 2026 14:45:06 +0100
Message-ID: <20260206134506.72679-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA5OCBTYWx0ZWRfX6hWuniEyoYy5
 t00vtxEzqO/t8OY2/IBUgUT2ExaCOG9krkppBkdXVbi/JnESCI7/sjNMROfx3X2rZCaX+QINkcB
 g0DZn2cyrkp4qYOW+wN1REyyfXxe2okjoq+n835HsRpy6WioNFvIOjESIPUHZW6aXuEEKIw5eOv
 OxAJ4XZSYHlna0SVMkiXElf3S6eyEx4fSDpqsteEC1h5HEqum/GUhnFSnYMrezro28yhGm/f/VE
 nFNoQhQB6TNW7yuPrOtJ8uBLoXPgXsmP+t4qY1/3dFrmaZHIJ4sH8EfUgC05nOBJhWU08mJFNrr
 GBwHTn5Dlf9wP2Keo1RD9TSuG0RsNExe5iYLpd2b7/aiBtS2Tzscsy6RPjDw31ehyV+oIpMYf/r
 yxILPS/XDs2jOIAPX2LM9rX9U1o7XDJ2PT/lp4bImdm5cjYV+V5XTgDKqIh3lVYFLChNI1o6Tnw
 8/cEUhCKo3yXbE+J6ng==
X-Proofpoint-ORIG-GUID: d1ljWefj2-sp5tRjSLNSqFnvazISBI53
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=6985f06c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=nK1T8e6ubgmjOMe8iWUA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: d1ljWefj2-sp5tRjSLNSqFnvazISBI53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92044-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,somainline.org:email,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3EC6FE66E
X-Rspamd-Action: no action

This file is not used anywhere. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi | 63 ----------------------
 1 file changed, 63 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi b/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
deleted file mode 100644
index 929bdcd45d02..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
+++ /dev/null
@@ -1,63 +0,0 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
- */
-
-#include "msm8996.dtsi"
-
-/ {
-	qcom,msm-id = <246 0x30000>;
-};
-
- /*
-  * This revision seems to have differ GPU CPR
-  * parameters, GPU frequencies and some differences
-  * when it comes to voltage delivery to.. once again
-  * the GPU. Funnily enough, it's simpler to make it an
-  * overlay on top of 3.1 (the final one) than vice versa.
-  * The differences will show here as more and more
-  * features get enabled upstream.
-  */
-
-gpu_opp_table_3_0: opp-table-gpu30 {
-	compatible = "operating-points-v2";
-
-	opp-624000000 {
-		opp-hz = /bits/ 64 <624000000>;
-		opp-level = <7>;
-	};
-
-	opp-560000000 {
-		opp-hz = /bits/ 64 <560000000>;
-		opp-level = <6>;
-	};
-
-	opp-510000000 {
-		opp-hz = /bits/ 64 <510000000>;
-		opp-level = <5>;
-	};
-
-	opp-401800000 {
-		opp-hz = /bits/ 64 <401800000>;
-		opp-level = <4>;
-	};
-
-	opp-315000000 {
-		opp-hz = /bits/ 64 <315000000>;
-		opp-level = <3>;
-	};
-
-	opp-214000000 {
-		opp-hz = /bits/ 64 <214000000>;
-		opp-level = <3>;
-	};
-
-	opp-133000000 {
-		opp-hz = /bits/ 64 <133000000>;
-		opp-level = <3>;
-	};
-};
-
-&gpu {
-	operating-points-v2 = <&gpu_opp_table_3_0>;
-};
-- 
2.47.3


