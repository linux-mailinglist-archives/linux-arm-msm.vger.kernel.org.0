Return-Path: <linux-arm-msm+bounces-92319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE56HkvuiWn4EQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:25:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F275811037B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED54301D04D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633A537BE64;
	Mon,  9 Feb 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVl1Ih9E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXYWhgbx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8FE37B409
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647097; cv=none; b=WuOWV4QlziNThSoCOGomgC87IO0yLnJE73B0s+pAb0Zgv+yJ6L9Yg8abjpxfC+a25zdoCNiUhIVxZFzmwg0nTOXPMd02PDUkxL3JJAD+z/3LfmIKh79Nz5AxbDRBazQ8g0gntXm9h3jZPdr9xOyZ0g6tyOOngmqpKtazW4zuFRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647097; c=relaxed/simple;
	bh=LSBTZ7It9PAftWsB4Ry05XdKPZsQlPZUcnACDNROriE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzEZj7IPhylPb3uw9Zz2kjHLzHumdn6qaSaMgy32fyHIv0IgYoW7G5yRUQCYYNQQA08XI7IKHoRk1BMbsTEniNwT/jLnG1iA7dm7hnKLVuaybvCQo+iJG/zPpI8K3d0WgjDWFflWBtEFm8vC6yEbndH+0sc+To9PAh7aYoL8nI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVl1Ih9E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXYWhgbx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619AL8WO2381298
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EoksmBiMh7k
	7TT2UIj+4wyYLHeAj96A8+a8vZe4o1k4=; b=VVl1Ih9ExSeStLuu3Y42yyGcalw
	vSmxO5KkuqP9RyPjEmdaCX1nayFsAMdIqii6lHeYmRizS6RTQXHfOmdBTbaQrjpY
	YnA51qsXKHvTjsMUenv986k2reBx2jl7o8TEO4FHDI9mU/U3QQspLLqKZHwi8AHI
	5iZOQHfrKHIvzyr+lY1bY3+RTkqGkUWLnG2ULcqbnbaNwYQU5gaYZ5eglYiPjXYg
	Sm3tKqNlool6XVBw/asAT8h/vefx8BJ6/0NxcBVivyfMZwJ+mPME33IhO6F9vQm/
	1wj17j7S2iykwM6fy5bihhGSSTxsxILrx9Zreodkkiq50rdx0JTgT3qmo9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78gdsxxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:24:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70a08daf3so1177769185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770647095; x=1771251895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoksmBiMh7k7TT2UIj+4wyYLHeAj96A8+a8vZe4o1k4=;
        b=LXYWhgbxl5vkwB0TVMeL/GlJTnonPjrVZPSxE2TPTQ9YqDA78J4Qz7jaZDl0nxKIhv
         hO4eX9zkCwOO9hAIvqBX8/CbnlAOgubfBoP8RAb8iv7ekFZvvmXmAtR2HdHXUnNxW33e
         hZkhK6TMlHJIu2wrkzpYkLdZ791DBYVaC68Y8P5rv/J2gjqkd/7rzrY4WZagZ22CulxH
         swBJKFIs+TDdcmxx+hKLZmVKT5Xx5gHwNor5WYhZHx+yFyKrpn6Es3DYun70H6fN1Rt9
         wgIkX7QaZ1eJkoizArG01AvYl9+G2kiWNKQrTNM4FkXxmKUD+BOXmLfQJasYGuUbNteF
         A35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647095; x=1771251895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EoksmBiMh7k7TT2UIj+4wyYLHeAj96A8+a8vZe4o1k4=;
        b=gSyZw0LKbkK7+i1aqfqjWv4t9gbY8bEGrytmlsjNZ60QuoLC2JmDFPOb/inior2efI
         ky/th/KJzXqxJ//7MvlX8a1pyVjl/imefDoPSLyA3jx5i4gvs4b3HEhimOikLgqARiGO
         /za/ZBxsjD1ep9ab2ipBW7yDTNQPrzK3kW9bGWPsr0KIy9eVx2omczacDW4hmj2v51Kw
         N9FQeMepkmI6fbwZmYLF0qj26lvlVYQQjS/Qpa1USnZZ8mW/M9hhzuEYm9GpFNBfOPlk
         T8FHAhlXhgWMCz3HdcXagDoeXV7b8GKSiJeH4Q7DXE7Dhi+Et2xfKvlz/j0kCTK7DfTh
         Okaw==
X-Gm-Message-State: AOJu0Yy7ESRJCThh29E7TtKVSn5+QEU4/O9Jg6BMQEMgvUEwODXvo1w9
	6ddgQZL/303hyPIqeQrFQbmJHbwbQ9dICWp/PiwPh1L4n61QfMnolbV21rZku3yKN5uIV9glQuV
	7QEQugjct3PJ/HSW+i3bIt6i7A/bfz8UjXWvLVz5dV5I2yEf2cq3RobqvOzVEQQYzC4K8
X-Gm-Gg: AZuq6aLIb16tCDp6ZByQDWJwkmX7PBiAEjffHR2JG3xTNTpSFBA4iejIIBiSH0Zx8df
	1r3THRTkZGL9GkAV1+mYP5ePGStYYDXNFLk2RnhnLsrJfudDBHturkPHtdmci7M0PNY8aqE31iE
	B7Q9qrTq3JPIvnAlMIyFdvv0pw40Hbd9dMgOQ6xN5EKkh/W+sNKx0k4kgPkhWVW1zFmHs7geycm
	rWqj/kxQbEEuKv/w+15o3WovIAJWG4TJrajp+6igqGPrU7Wr56/kBEZ+UAJh/NN4Q/zdnxwwYUt
	q0qIK6qucn5HPREAhojqM9W+3kpVLhjWa9ppkYrLoR1H1+c+EjWAXEfL4EcG4BqXs3YYKIjI9jA
	l7voluZvK+A7uVV78fKBBqfpyDPu67pxvOpxJpguOyws=
X-Received: by 2002:a05:620a:708a:b0:8c5:2dbc:6251 with SMTP id af79cd13be357-8caf1acb155mr1485633185a.56.1770647095541;
        Mon, 09 Feb 2026 06:24:55 -0800 (PST)
X-Received: by 2002:a05:620a:708a:b0:8c5:2dbc:6251 with SMTP id af79cd13be357-8caf1acb155mr1485628385a.56.1770647095055;
        Mon, 09 Feb 2026 06:24:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm28296634f8f.28.2026.02.09.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:24:54 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
Date: Mon,  9 Feb 2026 14:24:25 +0000
Message-ID: <20260209142428.214428-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfX72JGPsthMBSF
 MtlIYd0++JTNMBAULLng2pte0uMGlG526al67e5G122NIugwtobj599y5s4RPq4kvj2T29K5rWa
 LEXhe/K2iBJELtfFb/8w41Qf7KWd0WoGMm/9HV8T0DAH7lXIKBUFAAn1s6jLmysTJfsdtjFX4cG
 zJcQIMS+KfKBKeBXOj+lqX97aDXZAZprVwiqEqDed2XahFQqna8QFHur8xwAEuOzpHiFAEnDtpb
 L7Hq0W+FUYngyKZFTu8fX3qp6PZgFZaseAYgGRcM3zVu9zrapWhjU0M4awSwjRd4hZqTQ2gU8+c
 /9D2cJTa1Ow/dDg/V+vyCYT5qeozZ7eG09BOTChvItJTQPGl4Ouv/yv/cco3Jx2C+7GPBQrf6qt
 FdSvkRwqofHlJvBFM7JlN3oJxGenyw13DRyGcoTNpVA2I1peCdGyF0vgl421dDy4ccDRrSz+emS
 pl3LB85uUKUevpa2+Lw==
X-Authority-Analysis: v=2.4 cv=Fv0IPmrq c=1 sm=1 tr=0 ts=6989ee38 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1S9TnuZ4X9D0nYt2MHYA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cJ6K1LTFxVt4e3gt8waHd6wMA7zztE3d
X-Proofpoint-GUID: cJ6K1LTFxVt4e3gt8waHd6wMA7zztE3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92319-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F275811037B
X-Rspamd-Action: no action

From: Alexey Klimov <alexey.klimov@linaro.org>

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec support.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
[Srini: reworked the patch]
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index e5931d18d998..f58a85562c26 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -145,7 +145,11 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - properties:
+          compatible:
+            const: qcom,pm4125-codec
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.47.3


