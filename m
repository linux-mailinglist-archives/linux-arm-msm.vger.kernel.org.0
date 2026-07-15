Return-Path: <linux-arm-msm+bounces-119133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZvDBCjvzVmqvDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:40:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C39E375A16C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 04:40:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cWXUMHt9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bs1aLryW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119133-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119133-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC933073F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 02:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430743A900B;
	Wed, 15 Jul 2026 02:40:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38638B7D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784083249; cv=none; b=rDc7V3uv7cbuj1X3YTtAwoFmzhYs31qttf03WjRUi5UJmsEbi3sJM/R51D+m8IMB9/fB9x5ez8UW0bSU7yz8DJ5s9aT7EMzMcKSGaE/a19vl6Af2ch+ndOzEzkOQpfrxhsBhLtnTGk7iemcdRA4yOr8UXbxPmnbYSh3AHJhn6NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784083249; c=relaxed/simple;
	bh=LRUBCHmtCWd3pCbCEWG4bzIfRmvXJJnOFe2l5IDMwng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MM1xOuLewSrDknhesPBhbv9fn8m1bKtBxmjKCsbFbVWoAplHNHFJKUQzGkdmzk42th51VfefxqysSKfEQIB2YMKGgrwHzEcirUfTZXhLTt2FhyJt1qMBqIjJeQnBUHok5I4KJVlR4x1h1ki8NiJGqLNdjZaHQAiuD2Y4725M/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWXUMHt9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs1aLryW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0I18A2222681
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=; b=cWXUMHt9c2uS+jPC
	sxQFmgpc18pMaxx7SFPJJdLHqrzTBiZytnGlvg36aywqcNOESfoViiilXt4VuMNI
	O3lHUwK7MnxuDCKirK4jfFK+JAkvXj4F0yrk2HI6iEZyGWY5Ti67V8Z26+vR6IFK
	m4Yh3bfxEJdpQpxidcFhkhn6NLptfZ7pngMQfi2EoORHXtbgUKRahO6Fpl3HqwY1
	fB/3T1XkkEV5s8ibZMQfH3FtSdac+Zn2jaLVa1o5ERImf+XOj69u36CwTYMDF/o9
	Q9wIHjB82McFARyKV70H0nC9i7UADBB9LXzUNev5CcOm7jIc6iQworITt7joAnSC
	UlUy1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnutnb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 02:40:46 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso120462045ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784083246; x=1784688046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=;
        b=bs1aLryWFkQeHeJL0PYz40DQuDcx9II87BheOdFAd38m3YVFe7cFBT/4Or+XMLTG66
         XJlekLT1OIAmeh7rN7eHoO1Mzg1Djvz/HAYmLNZ5PnKyipFFc/7l9/w1lBGawOM3m5DH
         IVDA8ZrCHjJ7HtMxe0198aKWANMyuVL1L6arxMqhZ419Kmh4JNFg5ZhIcLh4xODh/ago
         uJGyf1DFoD9O/rm9yDqKz6zIRILzJwCq3GM+cEgzup+2r6/hkLKNvYM35ndNZsW7VkhS
         07+M4tRp4o8Lnc9udRvT1OXkdUWKmLj0gfmddfBseCIqw5O/BUBabm9+IZ61uPo1me5r
         EjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784083246; x=1784688046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GGN63ywSgwEmt576OrUnbOUrsDVqI2jRKgbSpT0rFU=;
        b=ZhuWbnHEiNlQufnkW40jS7UkO3uTUPYgD/bSQRkHMsCfX4zGzMOSXrkVhq4c5ImIzo
         ZJQeKkQqCcUuqxHOBLMmxH8Uemm79gibz477R9RUmzwWQNUoyt7oOEOnhaSjrNnmhwS8
         eBt4CF0eCl2LPL7kWKgY6fr/7cjh/FNJvbRMwET64RKgJjqZS3uZC9qfPDIKBA3LP4Q6
         EqUdS9KUI9pHncoaX9AEtw3xbAHeCc2yAgYHHrUmlEAOcyQT8nJfXYK+COlugFOk7wUP
         62K0pS8HIxQ2YV3PE786WT+qVlfxkemjHrKvVahwllDxKQWgwQAXP1dWs+BE4Su600L3
         rHwA==
X-Gm-Message-State: AOJu0YyHje/orTP3z5Il7AnTHie+wB7pzdoqmoTjwhgHJy1Y5fVy2fAh
	5tzTV3os46/n5byw8pen3vxcMTG6R/cU+cklj1o9SRxobZo9XrFjhZhFoaKmn+p8a+/CBnA+JQA
	0kLmmPNAcG40RN59nUEl4ZB7OJK9jJQohqM0sKyshCcdkJeW7uq9vjDNYqlpnUmejlE30mZKR5p
	B6
X-Gm-Gg: AfdE7cnPqG6MJfF6RGrCcfJmx+E2RL7W9qfGxDrAWFYKajXKFKewGRDx8KEo53HGh1U
	P/KvP4SxEmToVMfNIVRe0QjImGtpjUORAFcK73tlbd1vObUl//Zq8WkMVoHDUq2K9Ig/JsSohoM
	H6oaIbcqkApIoYD/F42B1BBoqv8XVA6nXsERGfa35ZD2Np/x6Yt/z6yJqZF6dLTpwNlN//1s3y2
	LSX56dIOyNXXg2EUDD7WFrtiws9PyNpmYZKgsefjyzFdcGSp4swoBnw/n8Jv1KGrZKKliK07fwq
	XzN6/hqmOMVbqy9cqMZYBS70/uNlvrBO9o9faDmwpp/5mIgVUK6RjiU3Zf9CommLcbRItX6ak/x
	p4m/oU0UjyZ1moh500QMyGBPuXAlQ+haKlVWqyQV4zNnMJzrdKVVnLzd4+A==
X-Received: by 2002:a05:6a20:244b:b0:3bf:6c08:fb8f with SMTP id adf61e73a8af0-3c36c39741bmr1072991637.49.1784083246054;
        Tue, 14 Jul 2026 19:40:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:244b:b0:3bf:6c08:fb8f with SMTP id adf61e73a8af0-3c36c39741bmr1072968637.49.1784083245588;
        Tue, 14 Jul 2026 19:40:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm155285746c88.14.2026.07.14.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 19:40:44 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:40:41 -0700
Subject: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
In-Reply-To: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784083243; l=4927;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=LRUBCHmtCWd3pCbCEWG4bzIfRmvXJJnOFe2l5IDMwng=;
 b=f0Yo0J8KBn9i1Z+E521tianI8T71rTtfRs/0vEwfA3bR7lKcElCwIJIKlTus19+hm4IEGsIbO
 mLCksaUbv+DB1I4n9/nBORqaEHTOY8urUuyv/xF5PISX2elqg5oLFdb
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: Kne5jq3iGWak_tli73KlxkpXv4IDT7iA
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a56f32e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Vu0f6eG494TTLRuRXOAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX6xn+DOVFAXcS
 AzZ73IlItQfJXBGXR3LojSysBhD7jw8YdWOZkvXcqjGmhd4CK6XTAyziUj5VALxjO2zhWk7OOar
 Zw8+UJZAA9FY6JBNfMpWBlylVbRDD9t2fi6Alv9OOn8PozSJ1nFfLSRLjptuE/ZDlr/T8r5/agm
 DxgYspo11VLylc68CR8alawsJZCTBBPkzHJja4WTqcopuvVUTQgcEUPiVy3LpKTiUZRlAUxYCYJ
 Nt05W9JvDCYzfMoOlmMg8eQP5NhFQ5w5ZVFP6tqU+9qqrmESLhIWHhGx5QmBe2bz5RbHjPCb55o
 Tff/QX29GLPoJZX19495izw6nsulWAyTbXSVkTKUuIQwHjoy+dZ0JIN5yoQ98oIHuLWGLYlyHHk
 rDVbsiVwLAyrST2yTGMMlxP5MPlBh+ofetlAbK8ryA+BDaM8GhVq60ut4DCw5SvKb6UwCt/OAyr
 ZqS55Ff0Y35XE10pAPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyMyBTYWx0ZWRfX9io32SlwRXiA
 3UPlTp428L4DiXo8ZHN7oA/tFc6BPOTFWFr4Pa8AlgBHM+4VkUv9xLO/TCkxmWeIiGBiTDz93P4
 KRDrD6qDS5gHHSf4MGzNX6a3IkuB2xY=
X-Proofpoint-GUID: Kne5jq3iGWak_tli73KlxkpXv4IDT7iA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150023
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
	TAGGED_FROM(0.00)[bounces-119133-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C39E375A16C

The QREF block supplies reference clocks to PCIe/USB/UFS PHYs and
requires dedicated LDO supplies to operate. The digital control
interface for QREF (clkref_en registers) resides in TCSR on x1e80100.
Since QREF has no dedicated DT node of its own, these supply
properties are placed in the TCSR node which acts as the control
interface for QREF.

Add a dedicated binding file for qcom,x1e80100-tcsr and document the
supply properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   1 -
 .../bindings/clock/qcom,x1e80100-tcsr.yaml         | 118 +++++++++++++++++++++
 2 files changed, 118 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 19ae0634b922..1af53c6b99d9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -35,7 +35,6 @@ properties:
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
           - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
       - const: syscon
 
   clocks:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
new file mode 100644
index 000000000000..55182cf550e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-tcsr.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on X1E80100
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on X1E80100
+
+  See also:
+  - include/dt-bindings/clock/qcom,x1e80100-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,x1e80100-tcsr
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
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-qreftx1-1p2-supply: true
+  vdda-refgen0-0p9-supply: true
+  vdda-refgen0-1p2-supply: true
+  vdda-refgen2-0p9-supply: true
+  vdda-refgen2-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx3-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-qreftx1-1p2-supply
+  - vdda-refgen0-0p9-supply
+  - vdda-refgen0-1p2-supply
+  - vdda-refgen2-0p9-supply
+  - vdda-refgen2-1p2-supply
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
+      clock-controller@1fc0000 {
+        compatible = "qcom,x1e80100-tcsr", "syscon";
+        reg = <0x0 0x1fc0000 0x0 0x30000>;
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
+        vdda-qrefrx3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx1-1p2-supply = <&vreg_l2a>;
+        vdda-refgen0-0p9-supply = <&vreg_l1a>;
+        vdda-refgen0-1p2-supply = <&vreg_l2a>;
+        vdda-refgen2-0p9-supply = <&vreg_l1a>;
+        vdda-refgen2-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...

-- 
2.34.1


