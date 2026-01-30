Return-Path: <linux-arm-msm+bounces-91270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN8LErmLfGnvNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:45:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B346FB976A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 088CB3022966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDB536C595;
	Fri, 30 Jan 2026 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WoRBOyTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIZbkIIg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06E036A03B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769888; cv=none; b=OkrTUYtt+HJpHj8iXrvsShZB0GUjYceWGN/H/pt4PpR90k4vYpsY17gJEYrORBYy8fSo204VrYKRpp5VlHk564dTJvO9lge7fqQ5WBr2jFlQHkwxTGs64DHkvqvje+TERW65+Zpa7Qw6Y3udgIOTznhhUFfQUFFh9u01Unj8gio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769888; c=relaxed/simple;
	bh=1/tlWyaBm1LL+MIjYbt90/qHq9VAdMBrGxS+MfzLnTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaymAekrYbKPFMKjZO5wtSAS4/Tn1LGEKhMXyWIqbeebVUq8IQIjjOO4QwglSf/RLW8LGFkmqEYBfbI04cXrVN0RVx/Ofdbxsk5p+u0xbRCDv3rSbsqZJfBNyo06kigOzOM7Aai5nDSb7PpLV1sAweBXqdhRZEpvDryXAwX1Qho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WoRBOyTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIZbkIIg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U52eYx555440
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12qV8rSZThwrI4RrBfMUZj7JPmyTo6MCq7R8VL3OrK0=; b=WoRBOyTHvhMgl4hO
	GGAFffZljgejpk1+ICFRJOpDwdumaUOIK7dPq3ZOBoKYvhWiyRVRNUjzmGKJwe7v
	DIwkirmGeCfdpd+tSh5KqhvUsYFKyKst44rv3lMk7jZMellOZBNKpsSpQMzcBeAu
	taFKp3d5dwhEvXZtH986CELKLVch4eyPyUoRkkXbbjBQPfD/Vbjh8azYW3fmHpbI
	eeYeBp64LfuxHkKWrxnXWHwfXcRAxVeXMy9RcIb9dDQYCDnyfN3Ht1aVpigacbiB
	eS6Rzf1iseKUEYs0MdBp94veiiZfxwBU+qreQmQ/0uttp+dU7DnknGYeH0NnTanH
	p/xHow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p59h034-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:44:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7d7b87977so18888965ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769883; x=1770374683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12qV8rSZThwrI4RrBfMUZj7JPmyTo6MCq7R8VL3OrK0=;
        b=MIZbkIIgv8+K/EgcngWcQm+FifBWOsbhZ2s43g2wIkwCAZzg1acAzzo6WBkT/DNSlK
         aXJl3fKf7VTILat8nBuP8gyhLWX0w+NOyKa8/5LprJGj0c+OGGOChVIbIQpFRnXZIgXY
         68R9rihZfeg5R5hleCFKmXBUwCIdfqXp6JAmwjuRHhzWZKgiNNbubs16jm3MnicacNwd
         UtLy/21070gLYwsFnE4VxR45MR9pY9LJSNnRsLOE3GJ5zcPyrc26saRdSjqV+gx+301k
         n3WdQPaP8bMsvlCcUsoY9yPQIZj/v2CXV0hyDnHl87bwqSDG4kW35lYKiHAOYZhw7dLh
         IbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769883; x=1770374683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=12qV8rSZThwrI4RrBfMUZj7JPmyTo6MCq7R8VL3OrK0=;
        b=OUWe8X8tg4ztFiS7oh6ZtLp5odG2PwTeyGMmI3Ta0PLVN8hU/KUwMs08sh/bJuwHkW
         m6zjyKEm1q1gOD/CqvNAT2NkYv5HmWdcvslyxD6ERM2oWGo828kku/BK1zdJ3wFOdnTq
         yd7h+5RbmMEPx5l1J7P+DZYm4tpkoGv6koOXGtXegx2Q+ickva5c0CiKKyEM4oJvhJLc
         Gpag8cl1stPA7c9Rtc3FbirbgNuM7abT5bszjM20S4kPQ79n9VcSpeJusUyzrNid3xHq
         AZ6QVZcF7fyboRnsuPSrFyRrYq5d+x6CZoyWlJnzPSnmrFzVT6/0MZ2vaA2B3wAPZwO4
         p11A==
X-Gm-Message-State: AOJu0YzESb9x6wu9/J+L/mS1i3klaWicGngiK9jV34+saZxQHJSg5w0e
	GRDzNMNmaE3B8uLQW7d2n8KBk1p2TSlnYpZgZtc1qZ3Y9bQxUM1bWQPkNaew3czDEsgWYsdlYRY
	z7RmcvI9NkQahn3Ox1emr2hWGBBl2C6E8nX6RdsJDC4V6thfZJ/4/aivtuF5dqNQjZHzC
X-Gm-Gg: AZuq6aLDEkMRROKfobrxTI10+MmqhPCxd5lzabsK8NWu148EOQM/mJCWz/fqgK36Hx9
	Mn+7fQu0MpEHIbcZRoGl8O5wAjvSjhT3I/a7bRqYzq7kJ9PIdz3plvrSHL3q5+URro8ciJQgSfN
	Oii3Q9zk8nTlA32N4aztTAbAxwZ+YuR4t80IZwGNJGg60Fadok7B7qVM245nye/u5BV4lOKLL3M
	FyO1AmH+KFuxlhbWoWb6Gq3xoH1NDVJ4TwXJm3xVdYolNy4T163ySX8tz+B5hOb/QWGWKZCDUWs
	1UbaWPormvLvZAN/ZeupXgixmBlJr7fX1s5h8TbYzcrmCYlrbzRCuyypsGbv7U8cDDchYWMzrBp
	v5OXAB0BiFh33ulZ6VozsvXxTEcxR9M6j4Qscl4rud1xQUs7PaOORAsV5YJV4hDBdr9hyOeb6zJ
	JYVs+LTiovfDdBhe295KZ0vERVRPb3x3JVWQK7/NRQeymA
X-Received: by 2002:a17:902:e84a:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a8d818b7a5mr28035765ad.49.1769769883480;
        Fri, 30 Jan 2026 02:44:43 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a8d818b7a5mr28035515ad.49.1769769883013;
        Fri, 30 Jan 2026 02:44:43 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b5d92a9sm71231465ad.69.2026.01.30.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:44:42 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 16:14:30 +0530
Subject: [PATCH v6 1/5] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-wdt_reset_reason-v6-1-417ab789cd97@oss.qualcomm.com>
References: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
In-Reply-To: <20260130-wdt_reset_reason-v6-0-417ab789cd97@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769769874; l=1672;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=1/tlWyaBm1LL+MIjYbt90/qHq9VAdMBrGxS+MfzLnTI=;
 b=H8IDM5WqB8c5eQfensVcaUehXaAjqNnaYzWs8ng3RBTX3MQ4njQrk++ko+O1giDJGjY7Lzqcj
 ce6afgfBseOBi6Bmy3OYcv4gBEKSJJx6DeVRrTi7mK1bjMshotQqSHf
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: xjwLLjmVgTJ9QKxpsxKKwAw3IPNotAoX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX7cIgfS+vIxko
 DxV87IhobUHiaZkEzNrXN9N4+n7Se7GH8pC5j+AHT0sLFqMc1Knv/7fFoPq11SffCdKbyWOM/BA
 1kxzxI00HxeW70ZcbtLF+vp1Xg6Nt99wgoGAHuEqhfyQYnKM64draUHYscMbeGhL1IDg7nspYs/
 OvwaUVMlHf3Cg8CvmF0m4MBrp8sFJlWkUvMuGiw5jAFb1BX34S6MUZsUG+cxIG9DcdJ9q82xksB
 4572FFsekQC23pWfGDyjnLR9LShO3VXQX2IdkFvx0vr43B2dnch2JpKQe7DiucyUPS033SZVDsP
 JjvnAlp+wi43ekarPLpvuvzHtGO6zxUG9C2oG9r3jcTnz6aAsNivH/fmtpvC5nqJsKHFEd4ct3q
 /Bex09EEU5PDTFzY6IQXnxJLJRG3ro4O6ncsMRwO0KVH7tpvw5YfvAPMkE/gq+zfsL8qBK0EIBO
 JhX9GNTgs/SQW6yyO/Q==
X-Proofpoint-GUID: xjwLLjmVgTJ9QKxpsxKKwAw3IPNotAoX
X-Authority-Analysis: v=2.4 cv=Re+dyltv c=1 sm=1 tr=0 ts=697c8b9c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=e_-3XkEp85WdVaS5J-sA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91270-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B346FB976A
X-Rspamd-Action: no action

Based on the discussion in the linux-arm-msm list, it is not
appropriate to define the IMEM (On-Chip SRAM) as syscon or MFD.

So drop the compatible from qcom,imem.yaml and add it in sram.yaml
binding.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v6:
	* New patch
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2fecdbb81cae710f6fb5e48156b1f5..72d35e30c439ccf4901d937f838fe7c7a81f33b1 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index c451140962c86f4e8f98437a2830cb2c6a697e63..7bd24305a8c7d98dc6efad81e72dc8d86d8b212b 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -34,6 +34,7 @@ properties:
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram

-- 
2.34.1


