Return-Path: <linux-arm-msm+bounces-99169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ7cGvwMwWngQAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:50:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC632EF5C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2DBB3011CBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AF83876AC;
	Mon, 23 Mar 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGk1ATWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpVeCYuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB69A3876B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259418; cv=none; b=ZTr3/wQlns5eH/15ybIGIcQJLRxe/mKZhZP2RKbajG/gKchEId4Eu9lU08OKVOAzQOW7CBciaw9A52AHPFGErxjlxN4KqUMo74UHkSjtWFqluZKzo3ADnPPpoNZQWIJG03XownNyDWE3Z9Q3AE0GI3GwQb+9TsMI6P4zFxsllQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259418; c=relaxed/simple;
	bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAgB9Kgh6NSsdKWGtl/Vxfga1ydOoMkgx5x0TjRnyrM2K9jGS4sqI7vZ+KvRWq05sOmKr8hRoKk1HEW+aCEA4SlTVXbOUlCj9r8aCwSW2QPqTOcYBfVYJgGefoTTrW+tzD9utKFfvdFnNxpuslwDBUUFh6lEVrwt/j4QAg8Fghc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGk1ATWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpVeCYuz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7Owro381067
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=RGk1ATWijn46n4dV
	/PPjXcUanGIl+j9qtviAsZLIdftayoF+99Mdx43vPdb87MJrSUYcEX2CfRPJi+wn
	lQXZYd/0EXGyy/NuKJPL1Lj/c3q1nVy6HLApo6D88QGmw0OBH3dyTEjAGH/yD9Fx
	QlT3bkC+IRgfFC92aQul4OUBaJGMr7C0pQT9tWI652l4R2AUh0Z+P83Mck3HJ6US
	+M8p3UNkUbiW9UnsvePoDNwAcaV33RoAwnvXLtfUM9xSNvzJedCqlbyoknSbLKRL
	8RTynxj/9swi+fOKEyHj5LcG0bdY0fqr53TcphtaUO9QKETT2MlCBcivqJJqRfWO
	FWE8Xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4xd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:50:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35ba237d2e0so3039086a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259414; x=1774864214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=RpVeCYuzx4jPHAUpmtCHxkpPA/D0uH8kvboBmhCLelcQgT1LmM9olGDbb+lsNWS8/s
         6QXg7fR/vQod8sAGHCeSEAPCy/ErHUGPVn+1x7Z+UTyNi9wK8PDZ114JMawDT2YmJLUa
         SHOAnGP7BNsdNPKqBLZ6tBHPPYLt4dxL8NrERKW/scOSgMOPVdQFrN///oDGakRm9c8u
         EHeeLdc+6ypdXqBINZL1L8JTP+00G6VHdpvAzIA5kX8l3bZweO/KqjrTyAewBXRtjqCe
         z1g5Y7sGaoKnc2CQLmHbV2uZ3BmEwI74lklqCvYMWB+mNCzzHJt/YJ/PgyoVugFv/vq8
         yjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259414; x=1774864214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=SyDSMER7jApJbaBPPS7jcg8F9kiLpiomnBFwq3LGrhQHfpTtdYVY9b3Jrs+51bTZlH
         t5G1l2wnM7juaWDptNqgxCN4B7SvC5WBc4bZIxLgcLcPacaVuecxfkLfZ+FK+CzVFn0Q
         6CEkDug9aoSoOcpVuS1IUdVcRXQhKVYWS4MQmYnDDyubFRl3bihySiyY0DYWeUcdiyJ/
         aO2sxrswn9iHBibfCsPKwbeWReSEY9rDxY9WgQrOfem+pKkCtBXqepk4ReylN05tcwXQ
         vBsPiepldRBG9UWTr8Y9XdW2WMjrgivMmwS3GJ2k9FcSbKRuSyXYgH/5xASqS1tr+4yG
         UW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJRjc0EsGcHWa6gxcOwdVUO40y3e5Mh7Ndo7Q5eHNKB3cfHCMwAMziT627BPVlewVnlpBXhyANY5dgCtf5@vger.kernel.org
X-Gm-Message-State: AOJu0YzuhM/SzRSIzWNqo0AokIKNnjsLC+8a6y0cpYltcW/+eM220ZEg
	rxCS/v0OJcd29ARustoWkz6zABWDcrzZ+kuc0x4RRsURX2j6UgWlRiqutSB7CJEVFbkS2mMNTEf
	QMGb95g8TtyQSRCjT/4oytpKJ7m68A0SoOeFUYiyNoNLEChyw5hxia0V8u04PU70YieaJ
X-Gm-Gg: ATEYQzwINFZZYUobJIE/jkxzgIh43w6m9VZz0Jrpz+8LrDjkos2PMHW6724eU1QQtBI
	zBNVpGBAMlZ/9KgRj5QBY83Zd6ByHmet+KT3itdLHroch6LALyaRoOseTRBSu11Ij6TjCOYvaay
	ADeYHV/IKxzYwc18SvSl8El4iyAkFS0L3rFwYEU61KmBxS7O5PSNZBm36MVDYB8D5VCZc0gq8Yp
	SwkDZDyRCTWuKBUTN4m+EcTLGvHFmObZsuPykj0dPmFi33VnA4kNgRSlO6h8JrV5DtJnldFzZ45
	aVXAnPgts0dpuFCdndOqnnzLgokl1GxzuFSGhD+jMK5p++WArvc4+exBXDiKRjX5PEn5AU3x5NF
	InVVpE6FJ0PeMx47V2G9wZcWuGqNLGF0axD9yechBNukKRm4pY84tyE7ikuTwtYxHZsZI1jcrHQ
	LgCWWTrSgR
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9172190a91.12.1774259414361;
        Mon, 23 Mar 2026 02:50:14 -0700 (PDT)
X-Received: by 2002:a17:90b:35c3:b0:35b:9c97:3d18 with SMTP id 98e67ed59e1d1-35bd2be82e6mr9172173a91.12.1774259413891;
        Mon, 23 Mar 2026 02:50:13 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:13 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:30 +0800
Subject: [PATCH v16 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-5-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=QEOSRZFfoBp0jud88kuJhTiDDDkzmK/bBgbOz82nCMck9HgEPLrVRoJ18aRIKgPGe2aUeK3vm
 mjSYkANIMw7DhV+ZtEsVnee9wwsAtCeKdfPHe8nFQfIwEfwpDdh67OI
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: VOpFrCRlxqN6D5ecrrn34keY1Hn_kwCU
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10cd7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX04TiR6PmXW8z
 XaJP6pZwh39RV5Tbn1xC8JQ6TDsYXtjm0Vkulv8H7NIwoMtz84164GALIWNOz3Ax9bK/gpTF8pk
 Dk3DXHkwlDYvLrc908uj94vwZb51TqhIGCGkjmz3KUvx6+R2CDdebEM9k36CBYkARWrzpyxkaV/
 Z0XIVJrw0/Bc7xUHKGuVQoH0flPhBRYYmP6o/ErL6IKvrICcB/lo8G1TtqcAv//9CRVF3YbZwIh
 4D+BgFXPbQlpy3qqnYK3vqUsErmemCbEZD1aesp20w/iB7tePulk5uhqrYBD+XnBXnD3RInYU4X
 puoB4Zp0xBpRTGDtffBmK925V9Ri/UyDY2UmnjVmjFKpWMsdnb/sxRl0XC3PW1UhVR1r7nTIE+K
 xukLuQSgvyf49P210zImt3734KEknrssQmFoPqMpEIoQmSmvdpN48s3KEpci/2bICZbH524wmlA
 mPbaPY5nCMUIGNuFQuQ==
X-Proofpoint-GUID: VOpFrCRlxqN6D5ecrrn34keY1Hn_kwCU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99169-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,0.15.70.40:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EC632EF5C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


