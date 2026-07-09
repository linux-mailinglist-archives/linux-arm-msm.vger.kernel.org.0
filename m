Return-Path: <linux-arm-msm+bounces-117998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2CqkEWKgT2orlQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:21:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E092731829
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:21:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="aJx/VTHg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FC0Pk7sZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117998-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117998-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CB1D304045B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9CC280A20;
	Thu,  9 Jul 2026 13:21:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A827C162
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:21:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603277; cv=none; b=qmQweahRW8lsAc/OBwxRhKmVDKsNqMUOlW2uo76WafrigIvYEkZUv6WpIp6ZEwJHh7CrmhsaHRvpQSLTtLO6SIeq3+xa9bI1QQvuXRkpvopt9ue+seoPfeaeeg9Z67E5FAIxwUFOtqMaLKr+5ZdqBUvDdNnzVT0Fprh79DSvd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603277; c=relaxed/simple;
	bh=9drw3nUbb5i/WIxNasF6rDi/OG6ohOaXrUaOzfwWFao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oegqt130g5N8uaBmuToYWCuuLqSGKZLbneDKNL/Nk/GFLrbB3rdhdHqkVVG+l7jMyau8F/PwETJnqA6dOVkfmOk75OcTBjTAOlD5Ugb8B/QlQ+ar45otDr5WEE1nJCcggCKHobRBRmPoauLNYr8FmnSjZErD75x6TdBRxAbIo60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJx/VTHg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FC0Pk7sZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNPRM1716789
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q13PD2lCLRhnqh2J9YvhltTb7cQwMu2ceaCAYeHt0rk=; b=aJx/VTHgW1ODuLTo
	Ru7kv671T30wH/D/6cdvDlZDWCGVt0Z7kuhF0hFPhDa2RRxUYusPi6D9Zukre5PT
	ZJowanZqZuOw1bHZoDLFHfNnsXnOaM2JvMntJeAwuHzQ9jL88VsQhf06VhBueyaq
	jHVwuXq3nOTCM6THpE7dDS9gMAediiD8SznoKp0h3soITWARmxEc+B/B9Q4hJUo2
	JsxQbUYzj+Q4/DpVdVKeOsEsZfpfu5L0bMibRcWdqbrqdxsnYbL9MEV3ufacU6AL
	Z6xw8khzSBR6Xjcb0GX6Ilsnv9aSpuelP82fR6B6yZ4/wCPYTOzQGasq/DVrrk7O
	A28twA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vv1sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:21:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so112004485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603274; x=1784208074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q13PD2lCLRhnqh2J9YvhltTb7cQwMu2ceaCAYeHt0rk=;
        b=FC0Pk7sZv06BTyMmTNT3ZK/huhTOeJK7shv7Fflx8VcMYKmWRo4z8Xf2R1aM3nNKqT
         AmSvGCsVdTlTBnEfLyzXKUP+qpyhZCo16dOb9KmUQa8il933JULd/AcTCt/oqKJUBDQn
         vAKdAMCYV8Bm6gNVWmDFxAUOwRPFLeQYKuWNUmU/v0ikM6WmzDpGTDYbozQn2PsGZuLc
         0LUasYWTLqBWZ+OA5LXnvpK+sZFrzvhiNeEnbqBAvmZeqn4GqOlRkuQNwIb5qFXuU4zW
         Iqa/Z/aMDEm3KMguK+rT3nZfDqK7+AkecJnkUpOhY+1uxy3yJqhP2sMzIUOam6qKOYt3
         Tetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603274; x=1784208074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q13PD2lCLRhnqh2J9YvhltTb7cQwMu2ceaCAYeHt0rk=;
        b=dXMEMqX+7w/lRrkAkzOeHj/Q6TawNmBWARvjjmfG+RBl5CBt0nkNrbc1rJeWh2vc8c
         9jgqIcG1R3zk4RSo3I9RaKUEJSAZprQyHBmPKSOgcjKprc63vAJpNSV6z52te6wdA9os
         PQffssg8CQ6zMMACc4H+0MQNEGFvF4WCc8kcbe2ZiERgeXqCe5G+cCvEsPXnYZULaNMY
         NsVoWynXvfOEiu7wBZ0QArqeVSGthNqjTrsPp52TTLYWM8EmNlOr6JELg3mNTiRAILqf
         eO48+LpIqX6Cm6YHbqnC/Lk2ivpPRaBuUQRjZL59fUI5ykyv8FM5ceTiLHS5L2d2Vlbd
         US7g==
X-Forwarded-Encrypted: i=1; AHgh+Rp3AqxAylgykTQ4tsbBpFCWPjYMjgM1dfPN3DdgLLTyLvIKLFWRk6gT0NJUX/q9zQz7LWN3f1fZvSQHenep@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv99nhhmTE5TTlVmp4OGb8/DjgysOILbOM8XsHcrg/aBcY2C1c
	Qvbws2b93OiI1HwJq6ITEQqY0E6j0UXGJVvYeT1FtBVC70BWUrVNwJvhfOIVMgkAs4/dXAuLjg0
	sjGk9NNjYSVecBVCbSc85dnZ8tlyTz76LRZnbNwDR8Ptwlhv7FNOqlna51OyIs6f35QrJ
X-Gm-Gg: AfdE7clbDrsjnZHAyHfBRJcl6il7mRmZ++UOX0lg8i/s6qkifCJlGZ9j9hbg341ZENU
	vpbIzpu+KxQKNh7r/ar6TFKseyoDm8445c/LFWUwigxbbKl8ymhYSsH/nzM4ICJoDI/wmsWAPvq
	ODSfS1+AeYhZw9/85UBCyrjVMaW7JPl2fxMAyIcMsFSYFnrxxkCH4jBGZ0HatSlAIaOqLeoF9h3
	FtPYveeTgtmHpGfzRzjK8sC53TsUUuB2YInkFZzBTV5IFg2AAz5eGrT+4cUTp6x3DrGhlQln+xX
	i//d0ybF01a1uY8Q7S0lQPsQJIRNyDkKzZ7nQMusml5tNng3cfS1oxQ2Sh9HHIscLFZEJrMaTyx
	BhxQnN4fmTWw1K/1WAJ3sJATKmaUUSlTCQ0DhXOnRE6QjKMB6cr+581ZraYmMbYvw4gpRWMg=
X-Received: by 2002:a05:620a:1720:b0:92e:6858:2ed1 with SMTP id af79cd13be357-92ecf5dd2e1mr746858485a.53.1783603274114;
        Thu, 09 Jul 2026 06:21:14 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:92e:6858:2ed1 with SMTP id af79cd13be357-92ecf5dd2e1mr746855585a.53.1783603273671;
        Thu, 09 Jul 2026 06:21:13 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ce5126sm1654976385a.41.2026.07.09.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:21:13 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/7] dt-bindings: arm: qcom: Document SA8797P Ride board
Date: Thu,  9 Jul 2026 21:20:09 +0800
Message-ID: <20260709132013.4096850-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yl7jmUEhHxtJLnmhrdoVYyqvHhv46A0f
X-Proofpoint-ORIG-GUID: yl7jmUEhHxtJLnmhrdoVYyqvHhv46A0f
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fa04b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dQQo7YwDhi1l8iBccy0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX9SMPPhNtxxSN
 gRrBTbO72v+aa8PlZAkN7EWh3ZxU5M3nfxeQZmZuZXN8Z7hkAMYiL+/V6TJypE6fkt85lNJmf6k
 XCP+zSRk0mgdv+vK3W3HvcEoR8e4rXBlguCOAHjkETMTbG0VJVQha0bcvmUmtjmsZCSPThZcs6N
 CKzF9srlrOJ3N1sKHjQ0R4/e8l70juR9Y/H+9R9fhCOAhMcFXUxhBXvvOfCaNZ5JznQt+XKbnWX
 6TGtLmWqEQl4A4SePgq9fPsv9/ag2q43LRlDnE+MQyaUpJtqmT4dPgtdHDMmmVrneEMnma4F2NL
 jgHljg1q22/GacuvGzCFPrxUUlIn3n4DO8VjtHUhJiSGi3r7U7uorVUkeKzvOLjhE6xRihSLf2D
 /BU4kzvitZeSpqjiiIgJ9BPv4H9rUhx5ZtpFwYHKPU4IYR0f3Zpn7LBNgz6cTGggfspA9O05fAJ
 ID1TsSa/yNmDJa9RgsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX4OjGqvgX6LfX
 Ev02jf/wHGreI/EpUCrCOiRmfs3bKp5RFR0NZb4MjzdtVLhOSUmY+HtbPSmwpVgU9MWVoTTaXcX
 y8mJV47LV+heH5DXZCLslkuM91ktjzs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117998-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E092731829

The Nord is a new generation of SoC series from Qualcomm, and SA8797P
is the automotive variant of Nord. SA8797P Ride is the automotive‑grade
development board built on SA8797P SoC. Document the board with a fallback
on Nord compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9df4074bb582..a7e8dc994b35 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -389,6 +389,11 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0


