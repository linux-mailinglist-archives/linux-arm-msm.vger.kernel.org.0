Return-Path: <linux-arm-msm+bounces-83423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E6FC8909D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 10:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B16A8355A41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03CB31D367;
	Wed, 26 Nov 2025 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvatAegm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GqmQ9gyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A462F363B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150124; cv=none; b=pBwYtThSmvGyFe0G31N/xoNHOsq/u1XmnbAU81jp0WE+CLODIBp0jxdnIx4BWMRGWN+xIKRkbyIZj1jqDm6A8LbyPdruWpTAW1dO4njotNSPMVe0zb5G6yekRoNcSThsgazvedDoEWCCr40gRERoI6Ft+zNVBfYRnwYWUzTbgX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150124; c=relaxed/simple;
	bh=PEszj94UmZrlOqu8kjPM06p3g5SyuWzzyqxwFEqmxnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ke1mhNv/ivRq+URXfNfaj4YiQe1Wb99hfr6LZaUyyvE5u8JzZyi0EvsCt4lg/3/Bd5zH7wzPeGt67/4t4gl8J/FSgDBF0vl94Qogp3IGT3QhldvFrsUfKSPgLyg0FtFlQ10aMUdadtSS4UmHPKy1rDP23/TxIxnjRM2Ym3HXPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvatAegm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GqmQ9gyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ98JDr3666161
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=; b=hvatAegm9j/RX6Wb
	97zkFE09DunLqK1t7gU6iYvloVe5Ml9F2QWtLhtFnYDB2IBlb31w7poF+mnU231e
	dELddOLh/IL9w0I6Gh+OFVVg3xjQU3GgVeME3S5q/44AAU8REbWCD9629NndApVx
	1Y0CNp9WyXSgus9IwXaUJU3WRPW0YAWEe5pHIXF1JZ+vbglIE7kbi/qowgilgMTl
	ny8ER5JuJKFm865XlXfJUA94SuC6M/18GYL1RFYVrxj0saEzEmguyzSIc4ytJMg8
	fwlW6CWWOHRdqS+DRXrhA7H9J7//Oyr4amSjgqeYG2LGjhV7J+lFEm59+3HsvqMZ
	WUqlIQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemsne4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 09:42:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823f71756dso77929786d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764150121; x=1764754921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=;
        b=GqmQ9gyy4VNoMjB7EFY30BTzfwJZhmmSkX8obFD6Ssba1nlz3tQaCBBlJLMVwEjUar
         ft0ukgr3HY/ahVDHqSP13/wFpuwpICWEKPOPJJCl77NBUjelZK5FYHGNCM4+uE9bBWDe
         6jMn7Kzsl5EVxjQqzLFZTyf5Om5mx3qbVK7We9c8oSeQtH+bdCvjRBag3I6kRtTJnZQy
         ziPvoyNa3y8y8RXK7d6Fn7flruFlxLBZMdRTKxhYGHHtNhju8tELKJSVhitH2lBlr3Zz
         WVBDP9WGIwBWsBT4ICEOqDOE5GFqp2FY9Ibcl0N9BOd8wY7OYJUK1NXPfPUjd7Tf/lD9
         Dxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150121; x=1764754921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJkgW/Uvf1cq5FzERoTioInV4MshvX7rg+ISf0Tc/jQ=;
        b=mENJa/tD4mwhKYkCUltRIDocjZVgqYi3+8I12iie1yorfkRr4LwJXkkTSoeVcdHHPx
         V9pmMXx7X3BXK3/FyTV+8NFO77/gWthX3KkklXZU4fsJ4uh5XzsgQltYa9qcLzN5cOvc
         zW8KWLC3xKthI/IHQUzg89wTojUhbkeGVQl2c3hAe0qTXMFlzR0lhWDr23sI2/Hxn6/J
         nKRwSjJAm0Ellxt4ebbrUZECR/7dUf3oGKYWXBGhk1uvYOFSTfgHO3Jiu7WgDViWelUc
         dRC5QOf5KKtUj1bpenjYSHWkaoaBLvoPIbfRE37pnpIdVNHYRiKLtKlSf3Wf2mBhvPb8
         voBA==
X-Forwarded-Encrypted: i=1; AJvYcCU0xYyM/+DNkZNXMdifB0IwKR6HhnsY0x0AJeaa+Nnvp5LrDa4P7oX3QKDVszEnX7uW0ynN4MM0OV9fO840@vger.kernel.org
X-Gm-Message-State: AOJu0YyILKL++aRpqxpgzvj7u1B5D56LUOzFoFGgZkNSB//zj/7c6umh
	r5TeIV95LcAlkhr3797JhTf47j67K2X5T5n6w0eNkoyny/YSimJOhVUES5D86nhpC60v5vm8pQt
	NE/vKGHmMdW6isQcjJlLdOYOd7vPOAKR7j+xxesCuXDy8500GzvAQkQJwf7M7YBSCZHMg
X-Gm-Gg: ASbGncvmERsia8Iu7nNv1K2XjARGO51nc5D0hNhYZ+CuGv7+Xle+ozxBTtMwser7KdH
	3Dw/R3IcbrY2HDj7NxFIMcW4+P3F4ZRQi6klzfEWV1iCEvYJ+YDlYNjp7bdRCzhEevbfCp6rimH
	w+jo5EcBRTwkeV7dalN+dMqh3NtL9VkuzpLiprPfJu5flL25DrSjRWis7Fwc173gFr59ox/7paL
	RFZ+w860qWDRsHKb6No3Ddb8OLDCqDKR3ptJnN/7I2UDkzfPV/puXLGeS93NHcjWazOOHXjREzp
	mc0GrHTuNvnSTn0C1TEurMzjNTQXxXssQ6LvDGRoqNRq8isuHCXDLDtALTSn+JKpG8ir4GVGmas
	nxvIA21u8t1St/ZWrf8ppusNz3leZdoV2bxideapnjPVeAUYdlDX37kUv+niAgRvAtRabhe0/Ss
	gOT7TtORF28DKeMUWPibFVdOY=
X-Received: by 2002:a05:6214:519b:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-8863ae886e8mr90713646d6.8.1764150121354;
        Wed, 26 Nov 2025 01:42:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGC5djSElZsKO3EDcFcfPi617QMf6JHLy+ZCw0r27LCZYcjpxFAaKu0JzF2v/wVweu3a2cxyw==
X-Received: by 2002:a05:6214:519b:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-8863ae886e8mr90713396d6.8.1764150120843;
        Wed, 26 Nov 2025 01:42:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbbee86sm5772682e87.49.2025.11.26.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 01:42:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:41:56 +0200
Subject: [PATCH RFC 1/2] dt-bindings: drm/bridge: anx7625: describe Type-C
 connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-anx7625-typec-v1-1-22b30f846a88@oss.qualcomm.com>
References: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
In-Reply-To: <20251126-anx7625-typec-v1-0-22b30f846a88@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PEszj94UmZrlOqu8kjPM06p3g5SyuWzzyqxwFEqmxnw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ6ba6bRssQeqcj6b7rLaCO0L60k8JJpme8ViR2pz+4pj2
 lqn9nJ0MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAicQLs/91fFodYy9e11jF1
 KErtCsku5Vxiv1rDWCuvctlD9XzT1kSH82Zi+RKPHrWKLY8T4ZONnSn8Jbdx54HV7rrdjxTvnii
 4s20V440Tj3ex/L50S3kmt7Lr/MpvWzp2StUZJsh7HO7gffLQiX+V18kLzxzmqiyoKqrUkP1cMX
 uP42/Nsu5LUobxWu/KVIs/lmc6rPzfIb7u+ZrpmmeNf6zXjy81VzzZvyjXjynmRb9xrtafe/t2P
 uJeUnVxW+pl5tQYzi2BgR9UrrntkJz9a/WeX87LJ6tO9Ve7oHpngdWZW7/WystdUGzQnJFlz9hY
 VmbqG55u/dN/9edwx18lXh0+1UWVdlc3h8xeybiqhjcZAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: G6Q5kwWhBIiTVZza7Td_b4jFzCUozTwD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3OSBTYWx0ZWRfXxBKF7Rs536qd
 1JfoM9Rv8XZZJxMn25is9gpRadqa1tskn4tQbrrydY2PvtNjVETd8sAYhPl3gWe3BK2AKMtkMZ0
 znYf6JhGqZBtZKMWbzx99dSbm2q4SbPZWKG3zkhF5B91/ENnH6EPMaCcp+ymmrd3coglzKurA2M
 JyNI7i4WsFlJvV5Z/kN/dDAt0nFvOtbFCNl9aJdcDc1uGwq3fOB91Wbh2qtDaQwGRoCwiTmxqrA
 uGP+712x0nfSGEv8JElMaqRQP9SN04m9AfDPa2g/MafBv7YVY2GKdJ5ACHJRbxIa5lE2jetVkvx
 lyr9PNVr0Y5hwP4QJQ2S4cTt2uLlyKnCLgDQd0VW210/0BQK5xOoGJK+o0gsqJSflkhHuYjPiUL
 pFuTx5+lx4k/ERpve5CrZr1pck5fLA==
X-Proofpoint-GUID: G6Q5kwWhBIiTVZza7Td_b4jFzCUozTwD
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=6926cb6a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=eOiPeOEgsxahVY17qz8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260079

ANX7625 can be used to mux converted video stream with the USB signals
on a Type-C connector. Describe the optional connector subnode, make it
exclusive with the AUX bus and port@1 as it is impossible to have both
eDP panel and USB-C connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/bridge/analogix,anx7625.yaml  | 98 +++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index a1ed1004651b9a8c13474d8a3cda153a4ae6d210..6ad466952c02dbba0b1dd9b7de11e56514a438e1 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -85,6 +85,11 @@ properties:
   aux-bus:
     $ref: /schemas/display/dp-aux-bus.yaml#
 
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -117,7 +122,6 @@ properties:
 
     required:
       - port@0
-      - port@1
 
 required:
   - compatible
@@ -127,6 +131,28 @@ required:
   - vdd33-supply
   - ports
 
+allOf:
+  - if:
+      required:
+        - aux-bus
+        - connector
+    then:
+      false
+
+  - if:
+      required:
+        - connector
+    then:
+      properties:
+        ports:
+          properties:
+            port@1: false
+    else:
+      properties:
+        ports:
+          required:
+            - port@1
+
 additionalProperties: false
 
 examples:
@@ -185,3 +211,73 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        encoder@58 {
+            compatible = "analogix,anx7625";
+            reg = <0x58>;
+            enable-gpios = <&pio 45 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&pio 73 GPIO_ACTIVE_HIGH>;
+            vdd10-supply = <&pp1000_mipibrdg>;
+            vdd18-supply = <&pp1800_mipibrdg>;
+            vdd33-supply = <&pp3300_mipibrdg>;
+            analogix,audio-enable;
+            analogix,lane0-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+            analogix,lane1-swing = /bits/ 8 <0x14 0x54 0x64 0x74>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                vbus-supply = <&vbus_reg>;
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_ss>;
+                        };
+                    };
+
+                    port@2 {
+                        reg = <2>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_sbu>;
+                        };
+                    };
+                };
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&mipi_dsi>;
+                        bus-type = <7>;
+                        data-lanes = <0 1 2 3>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.47.3


