Return-Path: <linux-arm-msm+bounces-109948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLiWIiO4Fmo6pwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:23:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3845E1BBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A5C730086AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733C63EB813;
	Wed, 27 May 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/Ezx8zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jm9nNa+u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C6391E7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779873813; cv=none; b=bK23hBJESFJjRpIovsNEIQZ2s43ZzHjry/9Dx1xehsqhvatdjx6okdTZAGbP9x9WGh/Z6GTg8oJ5kgME/UfLik2KXxD5Tcn5E4KmL9Oxy1JNiELyesBOCyzu165BicyAOCb+SZ4wFWtaq9Y7/xnPYCR5YJCciUdMh8tQ869f/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779873813; c=relaxed/simple;
	bh=zzUV0jy6gFznLS/8IxgTuw9hcE+Kof+0IvFnyhhZ+74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHBkRpZfC3x13Zl+usXfOcAamPyWmvBIW8YTw7IyDOUBPwQ3dOfLEzA1qV6Tuedp24zS7JqnFrjtuvqtyqi1HgZhu/p631U8Et+/3ZQsKDWrWX9qqdvFHp4+Q6CV+7+CWF69MZZsLUeb9jOqsbQGLy3jlLuuEf4wdvW8Y0HDq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/Ezx8zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jm9nNa+u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mUoY3830824
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yH718uLubEk87H++cFbixr/BktM2LwHrJfhtUjmE6/Y=; b=D/Ezx8zyQksA+gAz
	V8Ghh6KCdjVozZVAN8nR4wKjP7ynwuEAUWRCw8lTrWhCA++qdRZCzxPGyOrNzyPW
	H2GwoTasnHFGkVInV1MUJTUOAwpGKuaD3ayVXVWLXFgz7yxM6CiU2KOmKaaId4yQ
	zlqEhr9mRvDkVzq+UwRDxX87aEhebzW/1KNLbMWJ4by+4Zu0Yaj8Do0odgq4g3AR
	EQqv+k1LkQWgtCMBN9I5QeyCRT3GEzL1LF2JmAe328EIdsoBp4Fif3eBvyhCh6C0
	rgv58GlpSrRpPAvnNedCugxZLdde9MXaehsWxVvXJYK8UQ0Can0w03T9GafbDI3F
	thumVw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edn17hutm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:23:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304950e5901so1581274eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779873806; x=1780478606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH718uLubEk87H++cFbixr/BktM2LwHrJfhtUjmE6/Y=;
        b=jm9nNa+uoi09vnPfbB5njnsdwVzqraimNxpglIb4fCWqDM+Jx9hG/yogvFD4mU+n8r
         5nxYv4bPlAHU6Q93JxcBeN3wSuSQHuP4DYNzaXxBF3m+VewhGbMX2tFvC1Eyt5WLKeIg
         4rzzH2/PoKb5uHyZON8v6NYAX6tHxJOERGhw900a1moHsBzfDVgMBtobAcbsKhA0FUVv
         qDMAHedMY2U6NwPRLU/2jF4MoOUPrGcd7+qlXu4ZJi0NgzAVb+cU1Uh5kXBxXHwbsopX
         2iAH1V7ecbMjtTgeEA+OlHWESPCksfP7Ivp5N4DKjoeiqXMTigEWi3ItQHW2596fF4km
         W2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779873806; x=1780478606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yH718uLubEk87H++cFbixr/BktM2LwHrJfhtUjmE6/Y=;
        b=SkaVEiEoE48WwRWManmhxjPYfQFc4fvy7qEDPRd5+xwgER9XH/ZIbqxqzl9qwqwfFh
         oDxGU63Fj71XtmFumIu8R2dn4hiyWCqHNm23AQV1tgFne3R5Gr+vt5DH/9YazGFLJVg8
         FgpytRHyIbrcklIN7fESv46eddTbVXncAj9rPtYPmv5J5CnHjo6jeqoDf5A5S4+JBs/d
         0Q+ihcWwMR6VEJ37pCbvoj0DN/6COySzdUad67lfS88n9UleXW2O1oNqWWuvcn/p762j
         eMfyjVcKPX014Gt5fzdONTdRlKm9IPdPv4EOH1VWGQ8DPlrTSsyl0JfJ44dmUs/FzJI8
         /59A==
X-Gm-Message-State: AOJu0YwTFgRdb576HEgSE2fK4xB5xcvHO8t6ZoEWRLbP+JyxI3Bo73Nj
	FWMYey5dWAC7fPivn5ACbZxDaqfO4dlO05DJfRdPFpds6xDGG+/HmiF+NzZbKV92DU4hs+0/Es4
	v+Z4UzjV3DEH/75RcyzDOPbrJc6Wiz3mIH3XITwcLdojOpoXjrLA5E3AZR5g49vPh0zew
X-Gm-Gg: Acq92OEHW8NjpqGZk7KrB0vTuiqa3fewMTQGWntEMeZfP6sa8yyTcRiYGQ/eOBCqwa0
	s3gAuXWVOjXxLsXYRCWJ2EzsSr2VZODiCaOzMPZ8ZnTt+NBOidbGFX+1LG6TiHQQjnDR69DIs6j
	aOSrfOVcz1L+JcGNUh7HoL2w2rtYX168V/X1BLaFYaAqT44GM0V7y+XUhDGlccBy/a0o0HkB0Gn
	pc0cuIS160D9hgpzoIojw5N31CQRCLTLaINZPfTNpwGg/T2nBPApdIoJ5KD+/MprKWwZh8Cad/r
	qwKTzVAirzPXK7xHOutytN1ibIsTlGVAz1GaFQtLCTaZ5c3U/glG1mTuNs+7qVt33NLXnDEBgWq
	4yVeRfxfXGh+n2b6MT7ca7Zxt+UCkr0cMT2vgo7PGf6SKhAuZzIwQmhixLjhO/eyc9lZ/7Q2xoE
	rAUNLh5Vho
X-Received: by 2002:a05:693c:3103:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-3044a5ed1abmr8284042eec.13.1779873806034;
        Wed, 27 May 2026 02:23:26 -0700 (PDT)
X-Received: by 2002:a05:693c:3103:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-3044a5ed1abmr8284028eec.13.1779873805481;
        Wed, 27 May 2026 02:23:25 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4afdsm12598732eec.5.2026.05.27.02.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:23:25 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 27 May 2026 02:22:45 -0700
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-pinctrl-level-shifter-v1-2-1965461d0a7c@oss.qualcomm.com>
References: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
In-Reply-To: <20260527-pinctrl-level-shifter-v1-0-1965461d0a7c@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779873802; l=4717;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=zzUV0jy6gFznLS/8IxgTuw9hcE+Kof+0IvFnyhhZ+74=;
 b=fm6Vm71vjQ/cT5mcOuidqAMfp7wRPDLJX12JtwvLLlUkIMDa+aqpgsCT6K1PffhADWwuRzWOq
 QOnugF/WWqJAPhXlAfXePWogIlHMVFVoluKtfYDyHJodt7otBTACn4E
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5MCBTYWx0ZWRfX7OQ+yp/0QUXX
 XWZRrJthygYzgBN1ht3dRDMZ12psRkKLoS97WsuJQQzqmmZKkQ7zJ/yRC+Q/6XQ9WpuzAuyuRpX
 GIh53NLBUGQLfym2WDwRRCMKi+mRFyQb6r2vAXnOl5SBYSJ769tosnCI4IJ0NrC7xDwIwkAWH/L
 gpvX//BcQJsrPRWh7EjXX4XdbCtXZPF0MQ3eM3OFxY0eKRR6NlObO+1bqsQ9TfAI4ghdNLTmjg0
 UkBrmiDVtxirN8MyrWBMW8JeNSMaXl8JMhv/NcWOCrIJOqNl55xJ4x80YWLksxZMyXKpDWGYJZ/
 QxzIDsEZ6V+cQ8YD9Cxtm+LVbo6FWMJesS3JezYwonlHlygZXOKYWWcst03m3jeHf909BKYNYrO
 VuqrH0DhggIt63qIvRYodT4bBenSKtKtd+aU+yJ7SPgc/eMxW/TnhvzdVxoGIfT0/Q5mzy5dsFx
 mjYLIveLp8fy5QD5caQ==
X-Authority-Analysis: v=2.4 cv=R6Uz39RX c=1 sm=1 tr=0 ts=6a16b80f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oPYuZtxd-o3nixQqOr8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: qmdyB22F0gDdNW37LuoFmaJYLfthW38B
X-Proofpoint-ORIG-GUID: qmdyB22F0gDdNW37LuoFmaJYLfthW38B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-109948-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6A3845E1BBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the "level-shifter" function and add the required DT properties to
allow RPMh firmware to control the level-shifter. Introduce a custom
parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
level-shifter function.

Additionally, add the "groups" property with the allowed group names
that can be used to control the level-shifter function on pmh0101.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 69 +++++++++++++++++++++-
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
 2 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index b8109e6c2a10..016f4ad75033 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -119,6 +119,21 @@ properties:
       The first cell will be used to define gpio number and the
       second denotes the flags for this gpio
 
+  qcom,rpmh:
+    description:
+      Phandle to the RPMh controller device. Required for PMICs that support
+      bidirectional level shifters (e.g., pmh0101) to enable communication
+      with RPMh firmware for level shifter control.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  qcom,pmic-id:
+    description:
+      The ID of the PMIC which supports bidirectional level shifter function.
+      It is used as the RPMh resource name suffix to request control of the
+      level shifter to the RPMh firmware.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: "^[A-N]_E[0-3]+$"
+
 additionalProperties: false
 
 required:
@@ -330,6 +345,25 @@ allOf:
           contains:
             enum:
               - qcom,pmh0101-gpio
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 18
+          maxItems: 18
+        gpio-reserved-ranges:
+          minItems: 1
+          maxItems: 9
+        qcom,rpmh: true
+        qcom,pmic-id: true
+      required:
+        - qcom,rpmh
+        - qcom,pmic-id
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,pmih0108-gpio
     then:
       properties:
@@ -523,6 +557,19 @@ $defs:
         items:
           pattern: '^gpio([0-9]+)$'
 
+      groups:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description:
+          List of GPIO groups to apply properties to. Only valid for
+          function "level-shifter" on pmh0101. Valid groups are
+          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
+        items:
+          enum:
+            - gpio11, gpio12
+            - gpio13, gpio14
+            - gpio15, gpio16
+            - gpio17, gpio18
+
       function:
         items:
           - enum:
@@ -536,6 +583,7 @@ $defs:
               - dtest4
               - func3  # supported by LV/MV GPIO subtypes
               - func4  # supported by LV/MV GPIO subtypes
+              - level-shifter  # supported only by pmh0101
 
       bias-disable: true
       bias-pull-down: true
@@ -592,9 +640,24 @@ $defs:
           configured as digital input.
         enum: [1, 2, 3, 4]
 
-    required:
-      - pins
-      - function
+      qcom,1p2v-1p8v-ls-en:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Enable or disable the bidirectional 1.2V/1.8V level shifter
+          associated with the specified GPIO group. When set to 1, an RPMh
+          vote is sent to AOP to enable the level shifter. When set to 0,
+          the vote is withdrawn. Only valid when function is "level-shifter"
+          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
+          on pmh0101).
+        enum: [0, 1]
+
+    oneOf:
+      - required:
+          - pins
+          - function
+      - required:
+          - groups
+          - function
 
     additionalProperties: false
 
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
index e5df5ce45a0f..b0824d5eb056 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
@@ -105,6 +105,7 @@
 #define PMIC_GPIO_FUNC_DTEST2		"dtest2"
 #define PMIC_GPIO_FUNC_DTEST3		"dtest3"
 #define PMIC_GPIO_FUNC_DTEST4		"dtest4"
+#define PMIC_GPIO_FUNC_LEVEL_SHIFTER	"level-shifter"
 
 #define PM8038_GPIO1_2_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
 #define PM8038_GPIO3_5V_BOOST_EN	PMIC_GPIO_FUNC_FUNC1

-- 
2.43.0


