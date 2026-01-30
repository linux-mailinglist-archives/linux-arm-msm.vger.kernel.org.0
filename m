Return-Path: <linux-arm-msm+bounces-91293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGAEExScfGn2NwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:55:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3DBA332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D41853011794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C6C372B24;
	Fri, 30 Jan 2026 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwXPi20m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2X0kxGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1C371057
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774089; cv=none; b=YQVfZTFpRkSTNb3gVU6rKvLdx3s1aHGVKiIG7CvIHIWxk9yawA2hvDfgBIZzTdYJVGlF8i2RjyMU7r421zI1zqEstfKYJB5KltSbh2VrYv4I4s21WzHYwQBptgjdH03/BE/EfVrLcUMz+4Rld5m6X1oZYiC6tx6Hq2qINfVc74k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774089; c=relaxed/simple;
	bh=DbLPeovYiwjXpn5dbWMK4U8Irz//NWlC2tACaOAzwNI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dhb8S5ovTcJWZ5l0QLm+yseiUKpDyQIesM0Hw1EjJEtgzHmP1TlYd0/2MMCGJvweCDmjAiwYBd3UKooF6/AvqEtreo/NJp9Gg7lpUukbaRvzLP5IRTGkTGzo3tsnKxhwf6MUQLnzRoQUMpKBOp1HVyhfxP+V0Mos5xN8Y3poFyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwXPi20m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I2X0kxGq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9V4jY2675492
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+Sy9zUDZs56
	f6JnqKzFkwx6XwPXTc9MqxOFBhYwgs2A=; b=RwXPi20mZcnXJvmHbn85Q5p3J4o
	fNfxwJ3urE1VgK/IzEKQDOM35vYwOYZxW2L9imLK/rvez0ilGEjlABOZopFljqAq
	sUbnhUMrMvPM6Bj72VItRM1ju7IM8DlpPPvpe+d9Ff+RB1/iKKxZYC0RLsugFCot
	KzA3WdEb3CYnFX35FXZs+W9mZLwm/wenHK0vWJcdM8jlpTDwqJhH69Bl1xRI0ii8
	5JBSS76M1fj519BJjd07yU2tZNyYYp+450PUU3SoxaO9XHcKtKjsViuI8nMs3oEN
	qC4xV87XBg381sPkJlD4G8rQlAxH2X//I1bw1JQ6cpA6Hfn4MdbcdKTLhTQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t340dg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 11:54:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352ec74a925so3603539a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769774085; x=1770378885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Sy9zUDZs56f6JnqKzFkwx6XwPXTc9MqxOFBhYwgs2A=;
        b=I2X0kxGqkrbar+KdvpjRe2mZt41xJ9on2lJoDc7zyUrvMz9GFlsDfpwKX7hy+PJXXK
         hApDbV1q77jaBRjXWF4joA2obe0xWd/EUCOo68lV0z8qedrmwD/gB9zxlD200GkhMxvm
         SVZ8DefyLeaxkoQi2nj0NlNldN6OyApIGNdWVU1g3vaEXDZDOJu46PWoKQ+FM5ZL0jdy
         VDwObdsAO9vmZX+BjKcuV/czwV+ffY882Kp1fNBH3cGE6q9ZJQZ1C5fjSCPfPuNOm5op
         1Fjg/IaqdpStRwWMUESNxyfovxEmrZItzUnW9vlNOf/aEdXVDdqsl0SmtLqR+RMv41gE
         oP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774085; x=1770378885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Sy9zUDZs56f6JnqKzFkwx6XwPXTc9MqxOFBhYwgs2A=;
        b=WrI6j2hVPjN4u9bZvjO5BDYi+Pnf5BMBBVUNVRP6+ZGDJ9rKtYbsKh4zr7WT0j6Eui
         FUo7A63sXdpakk/bhHDaHlY0PVOPn5wK1YBqzR3aDvmBX+ok0+0Dqn3+em0F9/dw27g2
         bThhy85ftdAJq2lZ7Voe+N2XxdDZxudbkoHC3Ik/yh0zEvVLzgkNX4RA4nEi6pt0CZ77
         gyygB+XOtYiqBCS8f6f+/XCBFnBmmYzo3H7ACEdt1bHmg2x231Hv7o0/9Fni3VbHfpmF
         b+7eMsyexCaBjPSiT7g+8mHwjBGbNT8KWy1SryWVetop7cUa2jbEhpW2Ll9FQOz185To
         qosQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQrau6m/I7/WIJN/0bDaLG080nUtRAaoxbXxrIbhaB/vTWL/K5eFcgwWATPsFEh3sNcW6MBo8j618fEywf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Bmp+YtnHjXfHjKU74nHHpkVW/DEn/b51tTksoZcLA7AVt6Js
	3bgjS6RKlsjbg8dGBIa5jOltIVbx+kIZPs2hiJohMQQZ3qlzbMK97ck8IY5Y6l+6trYbVwX4FQY
	9um4aFsZD/FS3ftnxjEe78UewObIoubz2Cqy+JIL+fWyCbmPXHtixiwKs3tiEI8QyhxDq
X-Gm-Gg: AZuq6aKFL/U8ScBiLad2SlijBdFKX5WAguWJqSJDfYDTzfRfgjJiYrgPtMtKJjqzsT8
	M+6nA0RNbk+NKTLJcwgP12EvLOG/4yYSdvQlhenqbDGp3LdeQ/FWQ/bPCT82tWVP5vxG424PyQo
	sIBcoTLfLZ7f3D9XNbDYCM6b+1f4V8dWTFLSNuMBU1DY05OrEmTTyWiUGkrV9BgRJDR5hy/efGy
	R7sqMmsRHU7O8CwGTejnm67b2Uuh3PjicD/m2z3oJLlP16+4//edd95vAhclgAHg6TR8z0vTP/T
	PMSzRG6WVyXpqDEdPXaIvgTXA1xS4BOHDaWfWnua9xAz4BXZuliQT5KlZkrCPxzsBwZaR/c4G2s
	Po/sJwl0viLfZuKcFM5Byqu7+YRFu5uPkJ+ilot36p910
X-Received: by 2002:a17:90b:6c3:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-3543b3b54b3mr2889532a91.29.1769774084724;
        Fri, 30 Jan 2026 03:54:44 -0800 (PST)
X-Received: by 2002:a17:90b:6c3:b0:341:8601:d77a with SMTP id 98e67ed59e1d1-3543b3b54b3mr2889517a91.29.1769774084217;
        Fri, 30 Jan 2026 03:54:44 -0800 (PST)
Received: from hu-jprakash-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f2f24ccsm10431278a91.8.2026.01.30.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:54:43 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
To: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org, lumag@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org,
        daniel.lezcano@linaro.org, sboyd@kernel.org, amitk@kernel.org,
        thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org,
        subbaraman.narayanamurthy@oss.qualcomm.com,
        david.collins@oss.qualcomm.com, anjelique.melendez@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, jishnu.prakash@oss.qualcomm.com,
        quic_kotarake@quicinc.com, neil.armstrong@linaro.org,
        stephan.gerhold@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH V10 1/4] dt-bindings: iio: adc: Split out QCOM VADC channel properties
Date: Fri, 30 Jan 2026 17:24:18 +0530
Message-Id: <20260130115421.2197892-2-jishnu.prakash@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com>
References: <20260130115421.2197892-1-jishnu.prakash@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA5NyBTYWx0ZWRfXwB8nWfreftnr
 2PgNQXrm6JZZgv5slSpCobNkuKPS9jZpOVjNO7phnmkq0g95lM5v5vxceJuhTz78U/qCEy1WQWM
 FipfuKk1h353XYxI8s3J6OA1zRuD7DXgaeg0H9SOjR5yFOGynGfjYeOdCgMCNw03eY5ayQX3A54
 6pE07ZL6UolMYCnT7eXNnAAi7QE5i61EX2voMVpC172JUEKGn4Ij51ATnWcyg0oynE9yZEqAQGe
 ULWwpl0IAjeUSbTeZfn8v677nztNHvCgQXHwNHS9irDnY2Z1LDPCQ75YtLV8+W34HYw2zuSKagd
 iLpSlhHUORbjD2ddhgYeNvNmMiJUrbg2pJJG17XaKqj1qpZVbJ00jVwVzagBKmKUi0oJVmdGYLw
 tEhYZUt4+yY8tSuzPAWjomhU0DzG6b/SLiQfs46MitOUsJmK0es3kfquV3f09wYbRLUooF04O3a
 PMrKKDefBdbDCtkEB7g==
X-Proofpoint-ORIG-GUID: NMHNeOV2hBP6anUC-kcGX-oYmJJSUhcq
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697c9c05 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=4vDKtjJwf6yegxfEYBcA:9 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NMHNeOV2hBP6anUC-kcGX-oYmJJSUhcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linaro.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91293-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,huawei.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0F3DBA332
X-Rspamd-Action: no action

Split out the common channel properties for QCOM VADC devices into a
separate file so that it can be included as a reference for devices
using them. This will be needed for the upcoming ADC5 Gen3 binding
support patch, as ADC5 Gen3 also uses all of these common properties.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes since v7:
- Removed binding file paths mentioned under `reg` property description in
  Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc-common.yaml, and
  updated the description slightly, to simplify it and avoid any dependencies
  on patch 1 from the earlier series.
- Removed an extra blank line present in
  Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
  in previous versions.

Changes since v6:
- Collected Acked-by tag from Jonathan.

Changes since v5:
- Collected Reviewed-by tag from Krzysztof.

 .../iio/adc/qcom,spmi-vadc-common.yaml        | 84 +++++++++++++++++++
 .../bindings/iio/adc/qcom,spmi-vadc.yaml      | 76 +----------------
 2 files changed, 86 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc-common.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc-common.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc-common.yaml
new file mode 100644
index 000000000000..3ae252c17b91
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc-common.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SPMI PMIC ADC channels
+
+maintainers:
+  - Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
+
+description:
+  This defines the common properties used to define Qualcomm VADC channels.
+
+properties:
+  reg:
+    description:
+      ADC channel number (PMIC-specific for versions after PMIC5 ADC).
+    maxItems: 1
+
+  label:
+    description:
+      ADC input of the platform as seen in the schematics.
+      For thermistor inputs connected to generic AMUX or GPIO inputs
+      these can vary across platform for the same pins. Hence select
+      the platform schematics name for this channel.
+
+  qcom,decimation:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      This parameter is used to decrease ADC sampling rate.
+      Quicker measurements can be made by reducing decimation ratio.
+
+  qcom,pre-scaling:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Used for scaling the channel input signal before the signal is
+      fed to VADC. The configuration for this node is to know the
+      pre-determined ratio and use it for post scaling. It is a pair of
+      integers, denoting the numerator and denominator of the fraction by which
+      input signal is multiplied. For example, <1 3> indicates the signal is scaled
+      down to 1/3 of its value before ADC measurement.
+      If property is not found default value depending on chip will be used.
+    oneOf:
+      - items:
+          - const: 1
+          - enum: [ 1, 3, 4, 6, 20, 8, 10, 16 ]
+      - items:
+          - const: 10
+          - const: 81
+
+  qcom,ratiometric:
+    type: boolean
+    description: |
+      Channel calibration type.
+      - For compatible property "qcom,spmi-vadc", if this property is
+        specified VADC will use the VDD reference (1.8V) and GND for
+        channel calibration. If property is not found, channel will be
+        calibrated with 0.625V and 1.25V reference channels, also
+        known as absolute calibration.
+      - For other compatible properties, if this property is specified
+        VADC will use the VDD reference (1.875V) and GND for channel
+        calibration. If property is not found, channel will be calibrated
+        with 0V and 1.25V reference channels, also known as absolute calibration.
+
+  qcom,hw-settle-time:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Time between AMUX getting configured and the ADC starting
+      conversion. The 'hw_settle_time' is an index used from valid values
+      and programmed in hardware to achieve the hardware settling delay.
+
+  qcom,avg-samples:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Number of samples to be used for measurement.
+      Averaging provides the option to obtain a single measurement
+      from the ADC that is an average of multiple samples. The value
+      selected is 2^(value).
+
+required:
+  - reg
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
index b9dc04b0d307..16c80709a3ee 100644
--- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.yaml
@@ -56,7 +56,7 @@ required:
 patternProperties:
   "^channel@[0-9a-f]+$":
     type: object
-    additionalProperties: false
+    unevaluatedProperties: false
     description: |
       Represents the external channels which are connected to the ADC.
       For compatible property "qcom,spmi-vadc" following channels, also known as
@@ -64,79 +64,7 @@ patternProperties:
       configuration nodes should be defined:
       VADC_REF_625MV and/or VADC_SPARE1(based on PMIC version) VADC_REF_1250MV,
       VADC_GND_REF and VADC_VDD_VADC.
-
-    properties:
-      reg:
-        maxItems: 1
-        description: |
-          ADC channel number.
-          See include/dt-bindings/iio/qcom,spmi-vadc.h
-          For PMIC7 ADC, the channel numbers are specified separately per PMIC
-          in the PMIC-specific files in include/dt-bindings/iio/.
-
-      label:
-        description: |
-            ADC input of the platform as seen in the schematics.
-            For thermistor inputs connected to generic AMUX or GPIO inputs
-            these can vary across platform for the same pins. Hence select
-            the platform schematics name for this channel.
-
-      qcom,decimation:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: |
-            This parameter is used to decrease ADC sampling rate.
-            Quicker measurements can be made by reducing decimation ratio.
-
-      qcom,pre-scaling:
-        description: |
-            Used for scaling the channel input signal before the signal is
-            fed to VADC. The configuration for this node is to know the
-            pre-determined ratio and use it for post scaling. It is a pair of
-            integers, denoting the numerator and denominator of the fraction by which
-            input signal is multiplied. For example, <1 3> indicates the signal is scaled
-            down to 1/3 of its value before ADC measurement.
-            If property is not found default value depending on chip will be used.
-        $ref: /schemas/types.yaml#/definitions/uint32-array
-        oneOf:
-          - items:
-              - const: 1
-              - enum: [ 1, 3, 4, 6, 20, 8, 10, 16 ]
-          - items:
-              - const: 10
-              - const: 81
-
-      qcom,ratiometric:
-        description: |
-            Channel calibration type.
-            - For compatible property "qcom,spmi-vadc", if this property is
-              specified VADC will use the VDD reference (1.8V) and GND for
-              channel calibration. If property is not found, channel will be
-              calibrated with 0.625V and 1.25V reference channels, also
-              known as absolute calibration.
-            - For compatible property "qcom,spmi-adc5", "qcom,spmi-adc7" and
-              "qcom,spmi-adc-rev2", if this property is specified VADC will use
-              the VDD reference (1.875V) and GND for channel calibration. If
-              property is not found, channel will be calibrated with 0V and 1.25V
-              reference channels, also known as absolute calibration.
-        type: boolean
-
-      qcom,hw-settle-time:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: |
-            Time between AMUX getting configured and the ADC starting
-            conversion. The 'hw_settle_time' is an index used from valid values
-            and programmed in hardware to achieve the hardware settling delay.
-
-      qcom,avg-samples:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description: |
-            Number of samples to be used for measurement.
-            Averaging provides the option to obtain a single measurement
-            from the ADC that is an average of multiple samples. The value
-            selected is 2^(value).
-
-    required:
-      - reg
+    $ref: /schemas/iio/adc/qcom,spmi-vadc-common.yaml
 
 allOf:
   - if:
-- 
2.25.1


