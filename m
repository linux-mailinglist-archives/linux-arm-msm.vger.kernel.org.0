Return-Path: <linux-arm-msm+bounces-108654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uItnDjiADWosyAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:34:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A558ADA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 722B431538E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C856D3BADB4;
	Wed, 20 May 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="giY5nvR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmyVu73I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEE43BAD82
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268052; cv=none; b=dgX/IFU4jGxQvqWjerqZkeyUkXCADDG9VZtNaWqeoxxFCs4xk/WVCri8sU1qJmQpKomUlRWLNV56OUA0Eo2K19Hv/pIG13Glzi5CblGOvJpwqS4vKySFmzXhA2lLHHi2AnYwk9DZvSrZQgFo2tXajnq7KXs3/reOHFeXAFsbIzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268052; c=relaxed/simple;
	bh=YX58XETFNrFK6fPHF1U0S0cwb54Jv2xjL5zfxBSQE9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ejIwxi+4yMpetJZZ13ud2JDu//tjpE+fKqWlD7O8URTj6oLwe7kVW7T4X871PF292mT4iwYghhNxAog7uh+pFTrMmfuEd4k0U1o80qmA4nw915/8K/mAnZ8zFN7NBLtBjjrTexPdEozfYcLRyMIcC8Vn3MH0u5zWOcYm8ISvj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=giY5nvR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmyVu73I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7qASc2065195
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpJzTEmNOgzw3NFClHoM7kG4QCGYRRJbTUYE5H6k9EE=; b=giY5nvR/8n/ACJa8
	EvrW1R9FhSoOeuT9UfuwSvCM/mG9+gL+0PokUrV7hmcawC4Ogalwr3yyUs8oEKd8
	TjSg+pDYo3xU8UaxBCfrH+wL6g2IwoB4VTuKXaU3f3QLbuOAij0EffrCOejLPK2C
	uzAurM90Gp/9cfmhmFO6KZxxbrTAlLMxJYYitpHA8FEKdBo0vz3mWRzIdgxWBoRU
	zUPu9qZPWPOdA7kWv4pMBeCC2PsxrmEL5byu522TZcMEdSvnY/nHQeBPdadH9Kvv
	LSE+u8jrFtadrxoR1IoKCsUSXyCPAkGC2yylyEyj8+9JUqa+yuZgcbvEUPM9FS4d
	j/2nVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3t3wbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:07:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36641bb3d97so2794260a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779268048; x=1779872848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpJzTEmNOgzw3NFClHoM7kG4QCGYRRJbTUYE5H6k9EE=;
        b=hmyVu73Iom8pLD5yvzmlaVnjWNW58r1vm6kZ+Fe1jiS3LEPFTBS1Q/Rpm9QYxyFw01
         AEtcXva4Sl1r7ylfM88/Resh/skCptcqkCXMliiAlOhmTqqrVCrwgvwH5nWDPDrv0Q5O
         yxdHRHoiAlRq3/1oooNCkku1mEZaxXwB2MCWtP5HPCY/jgfqY+bLUyaV/z0NTmIKHGuV
         8sbN+Z/Giltd4q/Ov2PGU2b/8bnacCrNXpCioyicxQF+4M4g1T7p/uMvpGooSPYNlJ5y
         WMD29VPIZxDW/LEAQyfyR3I4i7HttvuRs4+vQplxytsBlRN0JC2G+0Xitp/eMqruwiGC
         7YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268048; x=1779872848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpJzTEmNOgzw3NFClHoM7kG4QCGYRRJbTUYE5H6k9EE=;
        b=amq60apTx3dIz1X9Fp8RXJcBLEysd9KqNqxC0ZMhMpf4HqT6EpUoS9uQavbPv8VmPy
         LupM4Cx9wcma+xoR/EzIcWW9dowyqD1sNsiC49Yk/yVCRjvHNdZT2fGdYg5zN6bHRFWC
         Y3fEZbkadARR0s7BdDrFArNuuqpADEbLsYklIID3V4YxQD3ws05slLRasGwSVt4czKNv
         ryFohW5gNUQqSVXKY5HPZ4iByIi0etVXZUVWeENLjvifKjQKtwtPy1PB9eYvTF07XVBg
         GTcH2p+S+2TTFeNDoy5RpI70gsCWCw7TYvRdMYuk58HlVgolbnbdFTarrpGWW6eZwTmN
         YheQ==
X-Gm-Message-State: AOJu0YwrSFP1Eb9wFvtXo4NFQpYMRgm2VY15hA5VzfiOxW1JW3KOX6EF
	03Uv6Cct456c5c5EEgcZlndyDw667eHKBKfVFkMihkj16Jye1zv29IFU1coh+f9fCR4VU7cd/hy
	QWNmS0gkowF56pkb1DSxgyqNnC+q8G91mGQK0QryBNVpkUXSSOQqQ2z6X73pjLM7hur0=
X-Gm-Gg: Acq92OHw8YsR1cWoylfQtxdPm3QAnwg7tUPndLmDD3uG9Po3tE+wWrA69KifdyA9W36
	Rqu7Kboh0Oy0zo308HcqRSqRhRsK6h+/mvjI1D3eKJFCMTStOVYE7UmBglzLAeTgnxw8tMjiju5
	BjBQt45XxB/oxZRhMRYXlzxzz0wXEfU/doCaA+jrFLONUobxTvJ6pd7FtDR/80JIlQFemyEJxj5
	lS1epMSZEzlarhj/+VbXOkR00ufWVUt25P8/TY6pqTkbWvQ0mH9LY925xYKZeR+Qayy6Ra1eWyi
	8muQSq8qHueJPvjle1c1TSLxSZHlF7iuJaOcECqOLhi1CfbMKNlnxJEiJArrQxHfXyX3fVHa1bQ
	qm1hGSqaaAzoN2XGATus2LLcaeEAuyjvyUuCBw7A4XIn2y5oIjvAKKhJaZCP0zA==
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr22994547a91.9.1779268048010;
        Wed, 20 May 2026 02:07:28 -0700 (PDT)
X-Received: by 2002:a17:90b:5290:b0:35c:30a8:32a with SMTP id 98e67ed59e1d1-369519ffc97mr22994507a91.9.1779268047522;
        Wed, 20 May 2026 02:07:27 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a8612sm17079903a91.12.2026.05.20.02.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:07:27 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 20 May 2026 14:37:11 +0530
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 qcom,pm4125-vbus-reg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-add_pm4125-vbus-reg-v1-1-f6d15d7dbbe8@oss.qualcomm.com>
References: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
In-Reply-To: <20260520-add_pm4125-vbus-reg-v1-0-f6d15d7dbbe8@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jishnu.prakash@oss.qualcomm.com,
        kamal.wadhwa@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779268039; l=3411;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=YX58XETFNrFK6fPHF1U0S0cwb54Jv2xjL5zfxBSQE9A=;
 b=FYO6JZIg/E+L4Ms/oyS6kYiq2jeQdFBLSlRnhvDrv7p0M2iNQFPuv8zj8HFdGJ1Zw9+hhAfZe
 mtOg4ctn9lzAYNngoNoCD5MMN1y/7tbD1kVd0kupDc6QsSWA0NkQZ1s
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-GUID: VhIHTWMbgcxGkF6bPjcsSmR41_GjJhAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA4NyBTYWx0ZWRfX0btawAjsl3of
 t7tg25x+v3CNRXjnt5Oji03VWIUP0AZZXGc/gUDbniiAWcREPi9gOQbkJ0rkX4Hsh583ee3TRT2
 zKW06L0L/7AX3oL0c1ABcl/IYMjpPbAzr2E96B4fNWpI2tTllu+cs8s8RdRhdjTITuULBAMGGz7
 Z+1NkLhd8c3bj54EmoQE4OPq5Jcuqx//JQ0/8T+dxlQJ3wOy+dWgbBai8cmiFNGIp087vT4MLrZ
 zJ+pNpbYrQbcU5/5AmBeGwc8z1TC2PFOaRFaj5vcpEIk6OgE8EgU0ACLEF8TxuNIRvHKt1QXS+d
 8ZV3vwl/b76fYLZGyAS6aIlY9/QalbLcWclQdk4IizdvJo4TewljxoMcOdKZ735lHlOUvKTObdh
 Nj4FiMCxxCsvz85bPWTlUmZCrVjgGa97XBYE0ZFkRuhBThvSe5N5Ry0MOrkgvWYo2DFr5Ma8ITF
 62ubVBxgIGoE+qFnT+Q==
X-Proofpoint-ORIG-GUID: VhIHTWMbgcxGkF6bPjcsSmR41_GjJhAf
X-Authority-Analysis: v=2.4 cv=C4LZDwP+ c=1 sm=1 tr=0 ts=6a0d79d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=nDMmG0lKkFKFsl1axvUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108654-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.19.136:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 880A558ADA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The pm4125 PMIC uses a different USB VBUS register layout than pm8150b.
It uses a 2-bit VBOOST voltage selector supporting output voltages of
4.25 V, 4.5 V, 4.75 V and 5.0 V, instead of a current-limit selector.

Move qcom,pm4125-vbus-reg from the pm8150b fallback items list into the
standalone enum since the driver handles it with its own match-data and
register layout.

Make regulator-min/max-microamp conditional so they are only required
for current-limit variants (pm8150b, pm6150, pm7250b, pmi632). Add an
if/then condition for qcom,pm4125-vbus-reg requiring regulator-min/
max-microvolt instead, and update the pm4125 example accordingly.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../regulator/qcom,usb-vbus-regulator.yaml         | 50 +++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
index fcefc722ee2a495837fedba026669de97350c566..7c74573848bcdafbf6260f69cfcd7a9b58bc9f2d 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
@@ -14,17 +14,21 @@ description: |
   regulator will be enabled in situations where the device is required to
   provide power to the connected peripheral.
 
-allOf:
-  - $ref: regulator.yaml#
+  The pm8150b variant uses an OTG current-limit selector, supporting limits
+  of 500 mA, 1000 mA, 1500 mA, 2000 mA, 2500 mA and 3000 mA.
+
+  The pm4125 variant uses a different register layout with a 2-bit VBOOST
+  voltage selector supporting output voltages of 4.25 V, 4.5 V, 4.75 V
+  and 5.0 V.
 
 properties:
   compatible:
     oneOf:
       - enum:
           - qcom,pm8150b-vbus-reg
+          - qcom,pm4125-vbus-reg
       - items:
           - enum:
-              - qcom,pm4125-vbus-reg
               - qcom,pm6150-vbus-reg
               - qcom,pm7250b-vbus-reg
               - qcom,pmi632-vbus-reg
@@ -34,11 +38,35 @@ properties:
     maxItems: 1
     description: VBUS output base address
 
+allOf:
+  - $ref: regulator.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,pm8150b-vbus-reg
+              - qcom,pm6150-vbus-reg
+              - qcom,pm7250b-vbus-reg
+              - qcom,pmi632-vbus-reg
+    then:
+      required:
+        - regulator-min-microamp
+        - regulator-max-microamp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm4125-vbus-reg
+    then:
+      required:
+        - regulator-min-microvolt
+        - regulator-max-microvolt
+
 required:
   - compatible
   - reg
-  - regulator-min-microamp
-  - regulator-max-microamp
 
 unevaluatedProperties: false
 
@@ -55,4 +83,16 @@ examples:
             regulator-max-microamp = <3000000>;
         };
      };
+  - |
+     pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        usb-vbus-regulator@5000 {
+            compatible = "qcom,pm4125-vbus-reg";
+            reg = <0x1100>;
+            regulator-min-microvolt = <4250000>;
+            regulator-max-microvolt = <5000000>;
+        };
+     };
 ...

-- 
2.34.1


