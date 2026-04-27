Return-Path: <linux-arm-msm+bounces-104573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGtTLuy07mkSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:59:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6598E46BC52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 202133007346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28B2233149;
	Mon, 27 Apr 2026 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFzMCJjh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O48mi7I6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58A2248B3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251559; cv=none; b=d64hdtFXH97dPH04BoyJ9PV33xeTYD6WBIesmM5P/p9FriXDAqIFQ8LPgol4drn2tw3INfttU4xLrzAMrd+SSDPG1MV+l4uY7j6tjN8Ex6KDoTm/SBUCSYZcIh/3EZxsel8EZAnp0TQ4FnI7mmfc53/UnxGkd2y9r5r9ybk/g9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251559; c=relaxed/simple;
	bh=WwAukQBvBlQKt/0sDy+HB5jTVqYbgBzmRl7sIxg3I3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCplU+dvQHLIgsYhIKP2hV+9u5lOcGsKozh8WR26XkGLrnTA1q55v2I6PToqIy0TTC43/UDunxeJxqAwTYfet4DdH9INoIWqFF6rTJDvfNMoHviDl5d3TBgeaT7FL9B4/zV8gkWW3aUPx5XV1O29Lk+9vrwB67uudT7Usv97AvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFzMCJjh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O48mi7I6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKdAZa4181360
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CSCClgFCGdfxbkWymQv4Z/NTd5LMxxMp9Gm
	3xwHHSoE=; b=mFzMCJjhsoQKPKe6qMmFWjCVi3Sem3UUJ3LH4ag/WUJN12+v6id
	c5Z0mtK3Q6gH1zlucJIFnSXr25wTBM27Z7iVu9r9hdWRAFikwn1+5Gn9z/cxwiY8
	yiSh7M1EfHUbqxeOmBz+xJZJZV8rBdwd3lGrGWQiKwNQiXiRpbCst+XODgArRUhG
	rC1HtXxZzBIv/tCv5MVOTjtJ2eGAbQeZGI+YN6jbDBgU+XiWXsS3yCuy0dQOMQLB
	CrS5MrgUsBzwm9PkG22N0mx5ptAyMIAakWy7kPDPe2+lP0MWJae+g3hMf3ZVLTfj
	LfL9s2+/aKd/Bg0XU9n1xALI0rRD+6f2B3w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrkthm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:59:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2dd6fb4c867so18030177eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251556; x=1777856356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSCClgFCGdfxbkWymQv4Z/NTd5LMxxMp9Gm3xwHHSoE=;
        b=O48mi7I6wxixCSCsK0xCfzwe36SwyeS0Gl/nZk++WUEwhRLxgWmF1uuCA7V1ssEQly
         BNWZSQjbZY4qrWRBA7gNP///3kr7kuUii/30A+eVvPQdJaNUAtb/XsPQO2leOt2P/fRH
         5HTGV/DRNT5RqakyVmvyurVBn+taC6xlrUa5ma9Ka/ZBdA41H+Lb352Ir6ZoMuauhhyC
         N7pE3oc5XXtmlkersb3LV/G32ei91EWnyxiZ8vKefElCdpjzW/BcAyMdKsiWyojn2cqh
         4ID3cOBcFZTaM5B2hRAfAkhAoRt6MKpJT1zfA7WRmiE8oRMA4W6KCBYIWg+pl1bAHo1u
         GG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251556; x=1777856356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSCClgFCGdfxbkWymQv4Z/NTd5LMxxMp9Gm3xwHHSoE=;
        b=BfdBEWeUCp22n3lxRAUee0DCMzreUhxinLMMYw2VYuektdnyqkghAnibvX2/1Jz1+D
         biAflCom7Ms2p8OtqSY1P8A5QLyDddZtqKtUyzjVwrTfZqZg9/DRA22Jcs3StZRk003a
         DlFp5Q9wRuELuleSa2jhjxaO5ULny996hB4qi70EKmKPdpapbBWXw0ntKhryGHpOnHgm
         QQTmOdhegCyHx5Kzi8k5GH4IxBsUm9uO9Vo3rDMBYWc/j1I2w+R/ww6QgTIAjZU0rVs/
         xl5afk1pib5xO2h7byYEunBx4Ot8yy2N/Nb3elxi22vwCV6uuMnXSh+k2iLHoJS54sbO
         xezw==
X-Forwarded-Encrypted: i=1; AFNElJ+z8kmnVZ0yqNs339V1kAoPXsBTGHrFi+3B3J1KFQPZO/Aescd/+dJQAevbaBFqKK1g8bRW7/oZRntVaoTh@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIwavEmzrUbpkCKCKRU4tjEo4yrXzxrPXKn5dRsImLuNvR4pi
	6gZsNOMBQ66GF3V376Ss4fyzDwJvS5mom8kUcVFpj6aMM6vPjNm/n/1uABtieoBclh/pGzJQrPt
	tZZ3mtGPYHBnb8kpXzWrsLLY5reniv8KnlJYU1gzs/kgco39ze/G1sAx/yhcce1RwRbwB
X-Gm-Gg: AeBDiesu1N1NXsStC1CsVKd2DcfkJvvFI2/C6e0nJ8HxLe2stTIpLbOmhEn53ikKRBY
	R66d7CQq/6oTl2OE4MD9kIZJZZc53B6OGitS/tYrEvQ3qcjywZWe7SRotnQfM90P4FiRikUR5fO
	cdBe12+2Io0JrHv50vYTGtntDxrP9Q+/xdo1bQIUnH3YPtC8hmpDwZnFcSO34xqTgjWMixpPkqA
	QA7WiEF5Zi1RsFPdNCXamF7Ajhz7NGO68j+p7CjYf8ZHee5zOMfB76Qi9dgludQKfJ0cE3w/P1M
	rtsXcbcL//iu2LCrRc9KklDIbLc3BKF+3JXcRgKfSfQ5jjvpNryaGQJ5IsKtga8PhwHZqLN2nEg
	8eXRnLh4hRoOouc6HmWz26ndcm0vZsQNnsNrw3eZuZtO6A0QoqG6t/B6OkUWlwHRso7Lc07mBgv
	gDJQH73yWDcplA5r3u
X-Received: by 2002:a05:693c:2b15:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-2e47a1058a2mr25167332eec.21.1777251556244;
        Sun, 26 Apr 2026 17:59:16 -0700 (PDT)
X-Received: by 2002:a05:693c:2b15:b0:2d9:b466:5e19 with SMTP id 5a478bee46e88-2e47a1058a2mr25167316eec.21.1777251555723;
        Sun, 26 Apr 2026 17:59:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa3ce1sm39253861eec.4.2026.04.26.17.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:59:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: qcom: geni-se-qup: Add compatible for SA8797P SoC
Date: Mon, 27 Apr 2026 08:59:01 +0800
Message-ID: <20260427005901.230237-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNiBTYWx0ZWRfX33phH60kZy3k
 cdLNkGbYAq0/JP0/x1xu8r6Gg8XLQDQAw9vba0AGkNtnfJ9KNfyz92fK609o0Urb5vz3QG7a/Gw
 EK/v50DsWIO5myAEI8fl5dWMeONeG8O8JBZSfKUnPJZQ3EixlTIA5dEycmWn/3cxYjQa6xB/4lK
 Rs4CoLhQUUUlgMUTU84HBPlviWGEzXqcdNQXcFMz6UsUqvH7wT4IxAU2CB9OvQ/v0BVbtM8bMM+
 OUKNHAlFTeX7MiCxMss7IgpupIleNww5XcHU2H6vBFiKiGhbKKiS0czVjbKriirmmG/EIMkvvgu
 4/GdTsIUtMWjPfoCGJ/RTDdeb4ckLuomhx1bujfKgDn99ra+MXhH3YoQkcjoOlae6XEdWo6ogMb
 y3jlnChXMncgS3sn71VDEcQdjqR25oTYBTQgOKsbo9Njq6VA8Uq5BTDEYKYb0Bnh4dWvxPU8s5p
 TvX4Hw9VEwtGW5wPQPQ==
X-Proofpoint-ORIG-GUID: lcAlgcT2nOn3XtJKDRBMCZGp0bdFxB3a
X-Proofpoint-GUID: lcAlgcT2nOn3XtJKDRBMCZGp0bdFxB3a
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69eeb4e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UCCXU7vEHtf_CmXrlTQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270006
X-Rspamd-Queue-Id: 6598E46BC52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104573-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document GENI Serial Engine QUP Wrapper Controller on Nord SA8797P SoC
which is compatible with SA8255P one.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Fix indentation warnings reported by yamllint
 - Use 'sa8797p' instead of 'nord-auto' in compatibles, also update
   subject and commit log accordingly
 - Add missing I2C and SPI compatibles
 - Link to v1: https://lore.kernel.org/all/20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com/

 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
index 352af3426d34..9c38ba59662b 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-se-qup
+    oneOf:
+      - const: qcom,sa8255p-geni-se-qup
+      - items:
+          - const: qcom,sa8797p-geni-se-qup
+          - const: qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -49,7 +53,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,sa8255p-geni-spi
+        oneOf:
+          - const: qcom,sa8255p-geni-spi
+          - items:
+              - const: qcom,sa8797p-geni-spi
+              - const: qcom,sa8255p-geni-spi
 
   "i2c@[0-9a-f]+$":
     type: object
@@ -58,7 +66,11 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,sa8255p-geni-i2c
+        oneOf:
+          - const: qcom,sa8255p-geni-i2c
+          - items:
+              - const: qcom,sa8797p-geni-i2c
+              - const: qcom,sa8255p-geni-i2c
 
   "serial@[0-9a-f]+$":
     type: object
@@ -67,9 +79,16 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - qcom,sa8255p-geni-uart
-          - qcom,sa8255p-geni-debug-uart
+        oneOf:
+          - enum:
+              - qcom,sa8255p-geni-uart
+              - qcom,sa8255p-geni-debug-uart
+          - items:
+              - const: qcom,sa8797p-geni-uart
+              - const: qcom,sa8255p-geni-uart
+          - items:
+              - const: qcom,sa8797p-geni-debug-uart
+              - const: qcom,sa8255p-geni-debug-uart
 
 required:
   - compatible
-- 
2.43.0


