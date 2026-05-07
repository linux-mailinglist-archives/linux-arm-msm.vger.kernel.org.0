Return-Path: <linux-arm-msm+bounces-106429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDYKHw2f/GkMSAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:17:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 709494E9FA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 64FC3303E15C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8263F41325B;
	Thu,  7 May 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcO7vQ5z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSp2WEpX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A513140FDB9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163183; cv=none; b=alsVN/XcKWJMmECthnGVlRvDD+C8eF58D3deI1URfbTzuz0D4B9LZ5CWTOXT/Nk0jqO4HB4Jtwd+lrqogPo6Owo54jm9qUyMucblGCkCZOpLS42TXxjaWPKZTj0bELxrO7pCW9EczLpf9AwoVRxq33WSOr7lBGWhT7BAg3LExWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163183; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbEtEWycZxQGWus3X84IZkAgvHEmxKSNOjlizJC0aX72hFHx1fIUV+wGT3xvSyWUwvuATSV+SiSpQBk4eX6KW3lUFYtXy3OayTzLDLcVSD4yvIG6Pb2BIT2Y5PoeNIzu87tyNJJWtkTwOpS728UHheeorOLl+VFk0yA7aCWoO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcO7vQ5z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSp2WEpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BSuaD3924539
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=mcO7vQ5zrFKDaeqt
	vZqFkK2dNRnCuiDU5Ge2UVkHSkX9MI+NnMnSehHPT4KARseHSj3d4edmystXwdZb
	m1/7h9Ba8a6kgq2oM6AxbcAJ80V2W5GhKB3Mg5JrzR9GxZoT2QU3ewxgUcwXC/wW
	+QL8HwAyZK/nfbKPJDvvNzjEqfJG85k3o+6H/TNDkY0YoW8ZDxCmXqrkK3DnTA/j
	8U4J8sLKYjDXV/x6xl4gnA0RUY0LZL0LCqbNIoqfoDz4kst0zJBLa/STugmEbbUS
	qEm+Wy3jNEd+16ApS5VNluIaeTCLVf8Y1by32t3Xz+IdM0Mk05PPn9uVswjFr83G
	BSBq5Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88bf2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c823549b1fcso1088693a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163178; x=1778767978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=iSp2WEpX6QbFb8RpBCD079ioPlJlrMoQVX1x3l7OFI7ZltPkxBLQbhrkS+w2IXYFgk
         onMyD1iQIMKCnKXJ8aqovu0SuOQqsKo9JBYPWLi2JvI/BaBVyoBpZBHG4DwUUYPplY5U
         AO+cqjOYBO3gDHsJSrTWN3qC2yaYDVjNEBsOVaTblkt1KdY+X1X/QP0FwtA8YqphxnTN
         4UzztEYIPnuxRmIcP0S82dOkqphblW8wlpWTf/bObWqyvx4dh4ReYqEbYx8ECZtYhGJe
         WSdljFoh0zQSmWZck038U+KHZ/YxExwU67u6zZWxbdqZw+5n7ak88E70FreCur7C2JQI
         OHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163178; x=1778767978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=s7AVjBvEWm3Ep9AaOb5s2EA9T1dOOCJRdELuwX7pLlpdTqjjfIMwIAqzfSNET7k+Ra
         7TFVkYKaPbLFvzNmCXAz9ptlf6GZG9/S6iDP1G25DqbJWQu4+38y/dQSU3k705ziMxD0
         DMurO1yopXQh1EpgepRUAcg3e7/jYygxMeT/cMSLXJg79OlSnTbH7AECXmG8W+O5Nm/9
         wPSrOBvWVQQJUjGRpHDtzrYGGUSgMxwjI+IZPjt6QMUPQU2/jUQu+rc7p5Sv2BdrvR2d
         AIjzuXCant2rYc7NbuNPDy1VGSKJwSCyVCiFHcA81IdXaA/kZeyW+aRZ8xnykCBLNDlR
         /hug==
X-Forwarded-Encrypted: i=1; AFNElJ/576qe3xZs6EYCK2fQEuqBBa7EC+OalnQ5SxpnvO9emnZcLaQvA5T2Imd8xhmERFOVPq352UunqL/K9Agc@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDbC8aHqWINpq0v+tenPlTekknsDfb3Jv9Wz+HKgnMLsmUbEx
	0xdZejS+AhCBTEb5H+G/Kn6TJwGP2LwdJOPjJfIObdBdiy/3FYJ7otyFKhin2z+Tg/Z7m4knwhT
	oT3D0AVSwFegdH5NrHDukzLAjMb7GzDbayTpGqBTu9b5Fk6mpgtaDednXr2NMx+7suVOR
X-Gm-Gg: AeBDieuIdDEJVqrcww2BfP5lOa3lbW1zydbs1xU+vh+jSc0X57qBXryBKyxPWwQZI/Y
	R9tVhPnb2M8qrk/c4OpxR437GbK1ZffYeSBNmmPCfpgIdHkO0ksqlnbxzJeVQeYjvLAuArT4whv
	oaSyz4h4uZY/X1Dl/Gv7OKLbQWvNK93DA4eMkFQH6N2qwoRznmaZ4bcSXsE7WrkCkec61yjWNVe
	eBEEntVWMjqearXkIErKgSJ4JIucWvVwGerC52RwhRgBRJczS97sIT9iNJayio4ECEiTrdhbs1C
	PIgrneTox2nZYSHhsXz1s0U/pO6DyKQlAxTrdIwxr464zfqM6x3yxuGRsPR/DZqpHUpp12za6yY
	3sVmzCRIhfO62XfMH8QJFuDGTAfB+1lr2YU3CMxhQ+RVy90Wq0JWA+4LfeN/3pXlQuUEKbU1JtF
	OhcrHeSSUFqhIu7TkloZHSwRSgAw3MCw==
X-Received: by 2002:a05:6a20:549d:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3aa5a8fa74emr8808166637.15.1778163178479;
        Thu, 07 May 2026 07:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:549d:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3aa5a8fa74emr8808117637.15.1778163178010;
        Thu, 07 May 2026 07:12:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:01 +0800
Subject: [PATCH v18 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-5-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163147; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=cbhIVnG1Yhq18s+Tdqc3kFKI5ZPNKCtC78rrD5zLokchh/bY3YK03jTYA0TL39zB1MBdRbNi7
 gAn4qnXQvYWC18pDUJo71hQc0WNHjig3kyty4rXNE9xe3WE3/ahbwok
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: kctOhGtZE9c1DF3fhYtlEmjatEOz3UeR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX2VoNG63VK6/H
 RkNw9lfIOmOuYtTFnjAPhrjOwPfaT/d5+74EfIseZYqYlJsO9s+NqolEvtl359GUvFg9V46PwJt
 86EjBOlBnIn8MPXO9vnyLm3DpBZ2Hms1wHSr12p3qloMhASyaN0aVzc+C+lEuITp8Q1qaK5x+XB
 aix40iPbavziNVMRVM++SRzSJfBa/c4rGsS85tRRx2AEVBIcuCM/kY/mYNVUUcUYnaPWeodjxci
 NQEcHT4MEHR5udFmB472z5o2+B9rd90QxPJPz0wzM8Q1O4iqlMPQXvfN3P9c9VJ++H8SqRNeWl4
 cXdTMXyyypLHfqbtNghu0vtXTfosB3nsf3HzKVxnMxJrAkCE9cgzBnCII8e06TR/7oRUfVHgBvW
 3qNs/w7Jglmkw+blUiWj3QMQ0SxuXsLnT5dkYckz8JsgwqaPvRw2iv+NJyHaylbwwGa1NviHkSL
 WqntKGxIIl5CQra6eRQ==
X-Proofpoint-GUID: kctOhGtZE9c1DF3fhYtlEmjatEOz3UeR
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc9deb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: 709494E9FA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106429-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.15.70.40:email,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


