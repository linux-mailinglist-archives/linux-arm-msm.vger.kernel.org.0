Return-Path: <linux-arm-msm+bounces-108661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKRXNOyCDWrUyQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:46:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D1B58B062
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9EC030D2652
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:39:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64663CB2CF;
	Wed, 20 May 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nMC1nkYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLHOEWV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E03CA4A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269958; cv=none; b=rfHclO8f3rdyrJbqGt9GGhqmEJXHHb7CpNXwdrhQSUbLoA+DTIPRj0VoYdn69/a+AE+plU6AU9ToJJQrwIkQwJE54SuCBJe8j2eEc8Tmz/kBzTQEmywOmWU5GyuoKcfT/Du7gAcZxjGJLT11BD5MAl/Sr4nV7JELhzOdSrdUFMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269958; c=relaxed/simple;
	bh=VjmAyLpFp8zNGqonBIRDshgs8RRJf85JKuuFbxk9I14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UOa10fwVwDfQ5aGqlBQhgkn+UKczY1aTGYEtaIwnYA81I0bRBKXwy5eCypgqWmFJ4c1bGvDjScvdB9pxQqCJIRQNUwx26zNW7+lye8VV7qYTmZnTwapeSKgdD4ntg9r8H9XnXmuEoK0RhQx1PUSh+JhiG0sU73h4RIvM8BpB708=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nMC1nkYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLHOEWV9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7VRij1963413
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X5eVfZamXwF
	MjVsIVsWPO8Qd/aPzlLSRxu14EJplPNY=; b=nMC1nkYrXJBKocqILePBzB53oUZ
	wcA7eyE1tL0jbKCN3DoUa3mlJFUST3Sv7bKzlNXILDrEjTD0rpAzILKn3pbjJteB
	dQVMBYVDepv1CP1Ro8hM3yG8YE3h0Vgv3CIFJsFRVopa1CnJv0oUnhrNLnrJl21j
	qxhqHClMRKXqvapL4Znzt/pPrdkxPuczBw2UReg/rWLCzqSUgVxnh8JF221py5Uw
	ZeOVs+zSV02f1acX82+s4k5q9pIvP62qC+fPF94m3HGS5UK5S8LxjWxuu+zJMIOV
	Y1fTN7fbSDibUoJYHjn/jlR5nrp5y1JeJToiPtdSjQ6+wKqCpxAWaBvUu5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t424m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:39:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bc763c7256so109210935ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269953; x=1779874753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5eVfZamXwFMjVsIVsWPO8Qd/aPzlLSRxu14EJplPNY=;
        b=YLHOEWV985Ai8ypMhFJrx26x1e+Uos7b5UFdb1U5ZkSjgWnuKFA64duGbXo/tRin8M
         gI2lYTQcaDo/saVUtu6hCve0yBnmJ9fnTdj8Td0np3J3xPHvxUC0ZgQDAGdB2G58+B+F
         +GvHuvPiLySQOWZvpFZ88sD2pWWTZU+/+goQgn1ekD0YDxqhGHAnHFf35TfBxms3BPnp
         K6IEhNTC5FeSM+p3Ob6+MWGSV+si3ZptZMu578fW0WH+yNfqkU9vY0Epytn8XGyym76g
         oXSz9hG830xuhzKOgir3unjBXpOkg3zkROwDaY+4MAsaU8/su255ngTDdAHyTqBXx53u
         mB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269953; x=1779874753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5eVfZamXwFMjVsIVsWPO8Qd/aPzlLSRxu14EJplPNY=;
        b=tSwuryWsRM2nfuuo2aDHde8voyZQeOpVdVsOL/bCngorKcRj2AgW2ZE1QMEJ4XUnaH
         1tac/d4TpIl6ESyuSDWAI4TxBOrKEIAARz0L2sgBlCkF4n/5GKQ8H6kbsLM1hCTMLWx5
         /BFpveTFQfk1HEfgGvqdudxnerR87dpHNX9eLNq4ceEbWwMC9T0O7+k6vLxoyWGWKmfT
         +bLYhRe+M5hdAnOLrsHRMvPbjdcxvoZ0WLbTRruzYL9ADMF8RW5fTDK4gLtdK/LHc48q
         wDdb2l2+0k2fFy4F2r7GCFENsUepxbRBck4XnKyTkYrLWpu2WF2GxL4AwmEFrMOdygPh
         thHA==
X-Forwarded-Encrypted: i=1; AFNElJ+X0A60jWBUUqNxr/722lAbmtvKZCbiAeUEzfY7uZZZJtaviyVZGwWwVXtzxvNQQ5nCN1evTXfq+nd1z2I3@vger.kernel.org
X-Gm-Message-State: AOJu0YxTyTwG1ep4cgRDaOeTFLp4dU1jfDDbNaZDU9FUwSAF46auEzzt
	rWr5W4g3ApBYo4ysZ00V45hFipcBGnUE2aWyTQ2uLVp6WtqDoAHT4g2DOTH/uCoqkPX61OQHrtY
	xJtO8pl5ee2BO1Qw5eQ7DtGpATwVUV1r5/yv9RzQs5+G2SnlluGRpwbZlzx3AuV1+/+XL
X-Gm-Gg: Acq92OE111y+l83HRooSZbiScotmA1i6c+jDY7KA4A/w+3jrPThXncInyU2xojizqSP
	URDiQJUCWeFHO5dXxNiScynHr/oKtybToCKmgce9GUSCciNkRIRgTwZ40X629mkSBlyawygZle2
	fi80mft+/761HHLbB+YN2H7SriyNpgALeNf8cOcVygSVY3Bpg5Y1fhBTISwoViBik9KoikVm807
	RDli2ADehAos5bJgDL8ezhAZRU5jjC75byMIjdcViqFbs9pY3rGeHD7r2qbNpPs6rE9kXzsK6n9
	UuJFl9EYKpYS7yIpiJhWOZ7DjpS3hdKQiyhUjpaaidmXJsFLSYtPyBHp7nuXbCgaddvK6q+GJlL
	q/o7m4O2WpigZcmcioztHid+OEQlnAeiOTxLJnYe0FtV3qNvFEg==
X-Received: by 2002:a17:903:3d55:b0:2bc:dd58:3dc4 with SMTP id d9443c01a7336-2bd7e8bd185mr189331095ad.32.1779269953185;
        Wed, 20 May 2026 02:39:13 -0700 (PDT)
X-Received: by 2002:a17:903:3d55:b0:2bc:dd58:3dc4 with SMTP id d9443c01a7336-2bd7e8bd185mr189330845ad.32.1779269952698;
        Wed, 20 May 2026 02:39:12 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:12 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI controller compatible
Date: Wed, 20 May 2026 15:07:32 +0530
Message-ID: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: e30zcMlGTBpbNR5txdIXXNlSgK4gnX5D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MSBTYWx0ZWRfX0B2Ya7ftYESe
 1TVSpjh8eD55kgc5jHH5MuPQRxRlSrkNHIfv0zBjPsktzUoTCorLrQfJE8IJAopcc77E1M3DQUG
 5ZrSDCsc1QcPAW+bNccGFME1Qpugls2WrvhRxpzJlbtYiYAEl+Vfj45nl7KK8cdYfuBOmQj+zoE
 JJsLuYlsBlmaZ9Ob/z7iY2b+9gurHSMxwAkJzCsxpYDhB5QH+5rbUvJ/QO2pDqy1C3eyQmSQehh
 2uqT2y7lQzX5RGHj/ozgWRmxiDi0mv5dzHTnHGYP3DZ5gAJhPJIpzVqlCJvyE3mofbgI3PxCsbI
 h9UDyjvFy//VUrU1yzOXyWjzbLNXS1ow5xP0aYA4pA9oTS3NpBMJlajU6QjTfWsx+ygx1P7bX//
 o/UlY1hgIVub1qDVX09bcKxIoXm27u1aKqhEEwddveg5DPi1MtPRClIaMVtFDPjEiAjfreoMFPL
 VkUdrZqPF5Ou1u4OrrQ==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0d8142 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Rq4y0vzsd-bTeKJpaI0A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: e30zcMlGTBpbNR5txdIXXNlSgK4gnX5D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200091
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108661-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,0.0.0.8:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 32D1B58B062
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
EZ-PD CCGx UCSI controller.

The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
valid compatible and permit the existing "cypress,cypd4226" fallback where
appropriate.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 0620d82508c1..90769c43ac95 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -15,7 +15,13 @@ description:
 
 properties:
   compatible:
-    const: cypress,cypd4226
+    oneOf:
+      - enum:
+          - cypress,cypd6129
+          - cypress,cypd4226
+      - items:
+          - const: cypress,cypd6129
+          - const: cypress,cypd4226
 
   '#address-cells':
     const: 1
@@ -63,10 +69,42 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+        #interrupt-cells = <2>;
+
+        typec@8 {
+            compatible = "cypress,cypd6129";
+            reg = <0x08>;
+            interrupt-parent = <&node>;
+            interrupts = <GPIO IRQ_TYPE_LEVEL_LOW>;
+            firmware-name = "ccg_primary.cyacd2";
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
 
-      typec@8 {
+                    port@0 {
+                        reg = <0>;
+                        endpoint {
+                            remote-endpoint = <&usb_role_switch0>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+  - |
+    typec@8 {
         compatible = "cypress,cypd4226";
         reg = <0x08>;
         interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
@@ -74,20 +112,19 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         connector@0 {
-          compatible = "usb-c-connector";
-          reg = <0>;
-          label = "USB-C";
-          data-role = "dual";
-          ports {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            port@0 {
-              reg = <0>;
-              endpoint {
-                remote-endpoint = <&usb_role_switch0>;
-              };
+            compatible = "usb-c-connector";
+            reg = <0>;
+            label = "USB-C";
+            data-role = "dual";
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&usb_role_switch0>;
+                    };
+                };
             };
-          };
         };
-      };
     };
-- 
2.43.0


