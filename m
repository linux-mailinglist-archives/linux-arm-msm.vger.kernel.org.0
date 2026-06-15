Return-Path: <linux-arm-msm+bounces-113121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ltDCMMa6L2r7FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:41:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74264684A71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:41:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ITu98fO3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hnLt2QcM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113121-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113121-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81E55301FCA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E673CDBC6;
	Mon, 15 Jun 2026 08:36:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CED3D8105
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512569; cv=none; b=JhsZj7IABxQRl0He0xbLKpmvq99lCVgVNhUBmA2x44XCjs2W/UgSd+EFHN9Uz7EnWHMcCw54EBV4iVpa6Ke3HlpSrbgW3vuzTCgxYHRm4dWV+275aA8H/UbJDIak9bUED0I6JoE48rz0JLOxatzX5s1pELow6RM3vteV91zyjqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512569; c=relaxed/simple;
	bh=Mh/csXgMe8/xbAvwGXq1r5Tg27UMC/uoEBfmXq+celk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QCy75zxowCxtNaz0dCa5tw7SqGJNUaEWiwB8pEjwwEW9JWFQMDrPcrP/ngbm01KV5AANYF/zCqHWcIPtXIxG1Oq8Fe654wdRYOxkpN/cKuESsODooB3wvl6Z+IoIbb07sta7LGktZI6i8vYJEAQX4G/dcgF3/KeEWMGhk16Z/1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ITu98fO3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnLt2QcM; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LkM13853257
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avNKz3SExU6rh/XKynzctCgh7xbdNurw/Ta/aNH0L3U=; b=ITu98fO3IenwcMHI
	dKfVni5Ud9clQSuSFPjxWCE3Y4vBzYlQ4IMYAglpEk0eWD8ZJ2MnZJLk3qOQmg89
	E1Sb+RIM8H5y4zHXflol2QDb0+++Dj6mVx1a7KIlLO2a3VwwV69eHj0GbG/H5aaF
	PB4f9YzTLSzhHrprmJmCHBYUxMmyYpkRbtEPxc+CBh+FaSGDIFdDhKwuyB5+ZsyK
	AbIG906CC4lQqbhqarXMVmBBeySBbkZleHJQwsik5xAp7EjzNhrxu3YaAHSX696U
	ISfpVoBPV29soNNzoe+UGG+U3aKkNWjSKkF+QQzXvFfrnw0e4MNRVALEaI/qdg/3
	JXl9Og==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxgh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:36:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so3468685a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512564; x=1782117364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avNKz3SExU6rh/XKynzctCgh7xbdNurw/Ta/aNH0L3U=;
        b=hnLt2QcMYoFitdX4fe2+C6bmI3mjz7ADIYNQNJVDKbxAbbbyp7RGe+g6PNchKx/Vg+
         sVSnHai/uecURaAypHRTFuvmLiuoUUdwswwdcvPT4k1Ns/VGb6Kfn0NyPB13i2LchXpC
         umIkeKSmP+ed1FK15u7g9l/3yHJp/PCJfBFDTqSjWSgMzLbY8xPBRrKrvT3At9u6pBuB
         48HgAkPGnPq+qdrVRjE4iGk9styFz3g6psJcrtrpSPY5XUDfIqA6kHYxmsNwhSlAI3LS
         0gTOsS44JMG5JK2yGYhVw4j3O7WRDnMLNzCyZtC9EpQ2Ctl2IxiHG5UMQOhA3ANNJh3I
         YN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512564; x=1782117364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avNKz3SExU6rh/XKynzctCgh7xbdNurw/Ta/aNH0L3U=;
        b=eayVkDQ4JACBgR9XYJm7bpHZE7qSfpVqOBTufcEP5wMQXc8A1CmLGP26C0EeXoVwc/
         4h4aUCLz3l2k3HkOBbcbo3T1WegiOaUgkFPH0XDDKosk0lAP3HwfjDapcn+pG/zMLEq9
         phJg6hOOFBfqbafwWy1stUdPgYVQLuAclaSBvhmjzAriG1meFMNJJc7eUfovo57gyPLF
         u9zJ+w/4Xv40P+5xNBWTVKrO+30CmqK6DtCaMYUvakWN/YW6DBY/kFAhJRj1JdkqiiED
         Gw3/w5hySWrB0u7O0NW2quv8hoWYHIZPXcJwPJONLPaXPPvmS/ZfQkHKIixVYRWZLZTw
         Vu8A==
X-Gm-Message-State: AOJu0YwRm0bU1MjXy5CjSoGgkoOr26E8fNcEfYsHREpjuS3LBnyURHjI
	F6Fj8tzZf8qZ9a/JcBm+AgQYPWFPoUu2rhEyJVBG2QoMEkpMmlZn0AxF/htCDo7xL1XT2NSIXYB
	S2fP3Fj9lcO6xtxrAUo/UzcufrXmuU0jd8xqHuUi0jGwF99gse5PSqs7uT7j+EnfQybp8
X-Gm-Gg: Acq92OFiSMOWy1ROkeTbrKeRq+iTmVoy8mezDoyaD3K9A7XqwPVzpJqtcVPH9Jrn6tL
	ciuo9MaxDaJ03XdecyVHwUa0J/1RJHZmk+HOZUKfNq1c4mBvYtd2DuE4KKknoUyglm02wAQUiiQ
	gKVMf/VWVLB1LX8YUsBjC42EaF8r7s3xEbWF0sGloYL3a+pWL5rnYa0ICevHp2BIaKhLlBZrDHm
	xHZoBR21Ycz7I5VSlFfGlDmkz4W2Sp8C2BDC5hr4fWA6sq0Mm4rYqxuYQaKTJc05mGsh9atRzem
	1LRny8S+q/coAaz/T3PPFucWsQCxYYEVXQqQhXDxQzBO8vfnIi07iXbVcZ3zvQtdLSjurhweehA
	yFXnXdbOo5IUrNE2ztUpl2xJSCGGpwGy0+2phUmUOKwWfgvJHiBrXB/glhMeQNQ+JxRlyOI88na
	FCSJPYoanavCvW640KOtK3erBjPlRJtcq06PPznUe1J3plUZbfW5lfHjb5
X-Received: by 2002:a17:90b:3fce:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-37a1f74517fmr9264017a91.7.1781512564295;
        Mon, 15 Jun 2026 01:36:04 -0700 (PDT)
X-Received: by 2002:a17:90b:3fce:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-37a1f74517fmr9263973a91.7.1781512563689;
        Mon, 15 Jun 2026 01:36:03 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a210ad64esm9558974a91.0.2026.06.15.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:36:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:05:48 +0530
Subject: [PATCH v3 2/3] regulator: dt-bindings:
 qcom,sdm845-refgen-regulator: Document IPQ9650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-ipq9650_refgen-v3-2-5f611623629c@oss.qualcomm.com>
References: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
In-Reply-To: <20260615-ipq9650_refgen-v3-0-5f611623629c@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX9V3aTuDEuaSI
 mDFHlVW8KUc8uXnJtTos96E16UwvUUeWsnDKKV2A7lsQ6aNdnjHep6EQIrEou5Xfu8C0EW4qNhg
 /B6Nx4kMluDRE4aQoDv3Tembq/GqX90=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fb975 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=be7_h8-LoVvd1EpECVAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX2cmFEWKbqGFS
 SHmMGoWnODP9dP164/ML3DFRcIgQxJm5NDGAH9r2vqfk4MnULOTFIoaVb9dv6EaHQHCs2Qi27ej
 0I0a/uRTRVpt7wJYR84jxxFVAMgESMJ5yDeVZCnGo5dxg5XwB4UpGl8rLEcEwrUYKbX1IoZwEL3
 p+o2uMDoTa4Vu7dY4e5dTHTZsAXlh4KM+XLYEJx/L/ndu92vUD1s6bkxKcv3FZZnmclLVLLClwT
 vIyT5h+POVz1yJOx2ej7T7aH4jc2pFHf/VfvqMrzormqlghXNURvRiPRFBiRm51oUcmoOyO6rWE
 rAKmPCKoIitvN1kt6KSxrmwsTVsjtj4u2tq0Sn2tCzHrf5EAzj3Utq/11q0Z7OoqJ4DG+zV3m8U
 gVKvE8GKbgdnEf+PqsqHXM/6YhWABQDgMx/2LRYruNSHAYKpdPJN+EX2ZW83UPzj9GyIHQEz2jq
 WsFl45QBMNidnsbjq8A==
X-Proofpoint-GUID: Uy2PVUwpGnFgX2utQb6MCy8T_x2SyiWj
X-Proofpoint-ORIG-GUID: Uy2PVUwpGnFgX2utQb6MCy8T_x2SyiWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74264684A71

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

While at it, move the allOf block after the 'required' property section.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml    | 31 +++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..0bbf7c806fbc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -13,9 +13,6 @@ description:
   The REFGEN (reference voltage generator) regulator provides reference
   voltage for on-chip IPs (like PHYs) on some Qualcomm SoCs.
 
-allOf:
-  - $ref: regulator.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -39,16 +36,44 @@ properties:
           - const: qcom,sm8250-refgen-regulator
 
       - enum:
+          - qcom,ipq9650-refgen-regulator
           - qcom,sdm845-refgen-regulator
           - qcom,sm8250-refgen-regulator
 
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Core reference clock
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: hclk
+
 required:
   - compatible
   - reg
 
+allOf:
+  - $ref: regulator.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9650-refgen-regulator
+    then:
+      required:
+        - clocks
+        - clock-names
+    else:
+      properties:
+        clocks: false
+        clock-names: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1


