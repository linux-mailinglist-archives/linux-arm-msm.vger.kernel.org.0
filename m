Return-Path: <linux-arm-msm+bounces-108590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBxBMn2rDGrukgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:27:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BAF583A5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 20:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C857830CFD1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB44369236;
	Tue, 19 May 2026 18:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2/682VB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flOuue5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A73368263
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214911; cv=none; b=AReKahyCVQWqTEBK6NMysmVWQ7mFGgPb7tuyjRims2oq6IGBykehkX1pWZD2SLdpVf0Y+UBAFPpmI2YIPFno+DNUex6IG4bCQUkKeuwKgNjJOgkq1mEOoBAmEoiV3WIZNic0Kjqx9WhGXA+744klCF1mI6Z3IuEv+Pn38dSgnvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214911; c=relaxed/simple;
	bh=XkhpJJhTxaR1mdX9SVljopSCxme6ARb1aPmwShm4dTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rr2XGOZUC4UWKI0GSLe6GcvaEnMrNz+TjB4ofKcCHb6xWygWRf8t0tQxKhHFJ3MyRafKuYKl8hFbSIsENXf/mcVk/CProfsZIqz2M42Lf4gO04KnilTkAXaYPYcnoUB6nVva7yB/W0/hgn3oet1Ym03R00RIg2cTuOvSc+jPLnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2/682VB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flOuue5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JExBmu1963413
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qezk0Iam8mPwaTXWCYu//VmCdG3zlrpj2jPYJFIKOoA=; b=a2/682VBSkQ1hrtV
	8g0jVpJZveoCFQISh0nqmXE6OpF0rgoZgGgk7A3sNpxOUAdYJsd4COnfypk5QytB
	zal1FDZnZCXSQClZsxeVt4+Ffh0F55AADZ8lbAMHlOlOo3ExQEl7zmxBPVgDcEu+
	g6rPihxej5H0SgY6vuL6C0D0rwa4HkZo+ZUPKMTEEKfpOz8OI++hBDIDYGj441MZ
	YmUZs25sL07HYiBc2nTRsG5zTJasJ5BakGUox+6b4q9uH2BuS2PMLjfG4xXmkX1S
	tLvKlLhIUYjYkpB2emsyHJytOicBNFIbM/8qt6es5wb4S7AUKe8ZGxOn5oAGIbu0
	KlrIog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t0weu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 18:21:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367f715cbd0so4004288a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779214907; x=1779819707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qezk0Iam8mPwaTXWCYu//VmCdG3zlrpj2jPYJFIKOoA=;
        b=flOuue5TolFoydTx2FlvM5z1DOUov3KVpEzxNJ3+GPUcSDolLFoNui3Nv9DW7pxHS0
         GI7iIvqGFzk6NrsrcU4IbFPjMwB86V5nfvyX6S9xPbFwhxzh7d79tyXG3t2jL2pBf2PQ
         HuN/AoqnAIxXlfO8dTsVM/hswk6TdpWJ5AAEZvkcS/e9RbpKDYl8DxzA3lYlq/jt78lw
         TPCsJg1xImmg8SGtibIe6Qx27Sn4OUV5ZH2dpzBmop5ALxkYtdGCD8jljdqv92y1b05B
         tgjUiWZ+RC7jR8GvbElQaAs/pC1pjFnhMp9Jfn0RnNKb6cFzwviluY+a+wDTxG+zEnS6
         D9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214907; x=1779819707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qezk0Iam8mPwaTXWCYu//VmCdG3zlrpj2jPYJFIKOoA=;
        b=ewGuIhwkLFA+MHDp/PyMzCSf218S1jCHdu0slkaZTvi0+EYxROC+tMURymjIAZy9hq
         UaxtFQsjDfNm6Wdp3/1zQRDMMU2Q87Funay0puW/j1ZGVu0e9tmfv/AKAfjCPragpTRW
         c27I5NMad/JlcwRR6ogxwYewcN7qg8g1UlZFuQ/dBeNe4g8h5hgC/wnHL93tPBz/2EzA
         OdweMWcSQQbnwa9tycyMIqmIT4cL99SCyLww9yN+bejDFs7k4jTik8cxboEeYb6GB7vt
         mKaQlxSyuOw7AsaHrjmbMJryi3mAzj6oR711n/BBYgWd3lj+WlqY4h7KSEeYeZack29W
         lfYg==
X-Forwarded-Encrypted: i=1; AFNElJ/LIfp8zuB1XPL9RirEEi84ng8efSivOwOpw/pnq3b4YhtQQGtwHDwxQfFB7r7ROsAqItCUychZkxSbeH0Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8v8xq0Q1pbiQV52GxweHSCHlVW2oxyf/ftzFa+YgWMf6Fj4Z5
	PLk+R0Z+9p299OPWhYKtUJIu8AJD1E7gR9uKdNQJmIDSj77Tcy/DgZXTSX/mULymdkPan11sfDy
	eDFEMzB0/mwJ32bgA8GkRdBhyqv0GROYSlD0+lh2nSmEdiVzeqmXiks6tLiP7IkBhnPS5
X-Gm-Gg: Acq92OHBreTlTexLB+tDQOzZxtxx/EgXf5aRonNjRFku6onqXNMZN7er1GIFOVf6Kwn
	NiuAZuIIidZ00+Yev2jcIvdDgDMOH69aWAGFRFdtrEKHeLxLv1AMjmpQ3GGUOXU1HOH0I36xmGa
	Hx54lQ4SH/rEesxYPcNLZD/DTns7fVl4QeOV1JK6G0SZbYBapdkl0BXkhnXATxgf0vJONDq6foK
	ieCEtP5tQ3xSs0nuHCvSu2SzwUvWfJpMQDM4e4HSIDkkG+EBi3vdJzx00iyzy6h8kJF1J8rptQk
	9k/9TP3Xn11u8XKdD7sEkXaOQ4/c4DkvXYL19EitpLkIH8m2bvm4oVuUkreDA3xvQMGvADl8SfE
	HUNwC7h83AMm18IfKuPcBkqxumN+QrXPldODkcZVY5vx6qXp85ySx12/ub909fyKEgtI1gadNNh
	dxDqW1bcBB+FtNkDNacLdVhVRZXj82dYIYq+Dz1dxgHNQ7KAlC1nSUFYPOuQw6eg==
X-Received: by 2002:a17:90b:3505:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-36951b9adcbmr19549480a91.20.1779214907412;
        Tue, 19 May 2026 11:21:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3505:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-36951b9adcbmr19549458a91.20.1779214906886;
        Tue, 19 May 2026 11:21:46 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514aecaesm15434362a91.17.2026.05.19.11.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 11:21:46 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Tue, 19 May 2026 23:51:05 +0530
Subject: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
In-Reply-To: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
To: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779214899; l=2158;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=XkhpJJhTxaR1mdX9SVljopSCxme6ARb1aPmwShm4dTs=;
 b=eQ0oeWLfLTdgtsPRQonmNwadLBpKtMzTW0ghXVu+hct9bjiTwXb5i++cEH29mqlZUG1yhfWMI
 TB0nWzExm+lBWG6xd+oAkdEuHFK6w/lSfgH5SJ6QpxD07cXGeWR//A3
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-ORIG-GUID: s77KaejTQ7Cweu0cCuRxfwahYgI6JrLv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE4MyBTYWx0ZWRfX4zx4QtLX3wgO
 E0NORyYMFNNnuxOED3V/ZFta2rRBvl4XSVjPYqJA4KkDvb6zpgrbzykz0F3BbeyGvSvgAhhK/nr
 x6pPpgOF3GzBal57VKPQVtSvK4VEYFk4zk8VudIH5BrCSPT7257q/f33hi0n+5cLBnRcPG5NxGF
 qL2tQkvd80iNAT2m4yhtljyP55mVSVc3uZ5nkWekrWKk9Z6rbn8gnlL+sPv4fm+ak4Fv77ojb/k
 D5KNDUYfMcn1JN6ynqgzFRHrJsLFNgQJCuCfn8NA9di/GwStWaPIdqjGHzgHU5mVij0ksjOXRGP
 QP5+8awooeDiFnbtIIPAwKfR19/53GmZ8m4onbhYMVOtEjMIW8ILbr3WMwmUsbAqDLF1DUR3pXD
 /I/57YIp9lp+nN/x953UYEGbMCeESceZ1D1pGsiWuzLSKUi1smVRMd8Q1tXzsDFEj5bYHDE7XkI
 c4D7sLZWVygry3nbbGQ==
X-Authority-Analysis: v=2.4 cv=Y/bIdBeN c=1 sm=1 tr=0 ts=6a0caa3c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sHb7p39yKR-EH3ZyzjsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: s77KaejTQ7Cweu0cCuRxfwahYgI6JrLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190183
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108590-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,0.0.0.68:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29BAF583A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree binding documentation for the Monolithic Power Systems
MP8899 PMIC, which provides four synchronous buck converters controlled
over I2C.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/mps,mp8899.yaml  | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
new file mode 100644
index 000000000000..3225c92db2c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mps,mp8899.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power System MP8899 PMIC
+
+maintainers:
+  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
+
+properties:
+  $nodename:
+    pattern: "^pmic@[0-9a-f]{1,2}$"
+  compatible:
+    enum:
+      - mps,mp8899
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts BUCK[1-4]
+
+    patternProperties:
+      "^buck[1-4]$":
+        type: object
+        $ref: regulator.yaml#
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@68 {
+            compatible = "mps,mp8899";
+            reg = <0x68>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <550000>;
+                    regulator-max-microvolt = <960000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
+...

-- 
2.43.0


