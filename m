Return-Path: <linux-arm-msm+bounces-110222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMUHLWNCGWqNuAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:38:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F385FEA4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 09:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 839AB3120C40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 07:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBE83AFAF9;
	Fri, 29 May 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avyeEaf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VSPSiRXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354A3AFCED
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780040117; cv=none; b=KO2w2LBVYxDQ39xx7HfXG0vOSv+smKdDRb9e/KdgEZB2TQSmmgmp0MbPYUhYFWTsoT+AuaF+GZwx9OKl+rOIJz9mmw8GYP4J6woenrqa/wQLIJtxXCbh8DL/WRCtZ4votqOafD7bAshG7Nmy03ed3JFFvjezveh44UEUafZJQvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780040117; c=relaxed/simple;
	bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SKLh3MrYVOc8UCZUPrJOCpxEO7jOirelB5B1FvReaHnWD/J5Es5AlM85IK2/38oTi15G7u+VwmlqFkYkKKG8ivELOcoqBU7uE8hvlFSRoIjEW1+fyHEO3YHaP7v9bORXyabGEaNywXkDTe9bPtnCSOpF9kd6Mh9jDVOQ0pQ2y6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avyeEaf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VSPSiRXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T739kD1829458
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=; b=avyeEaf3WLr9mVrL
	HrmvUOeEEZmmv0zbo6K2GXZ9S6+DK4Ir1tv+kENTy85CjdVPyKsQfgHaOL3ao3U2
	GErFd0URfRd7xEodcbcKo/kiraz0BFeazxx62j6UL1dHxnnrHmcFNsvPWk+Kf91m
	pwn35ccFFCotLIsXdQhFlZo6uH3dNFrWEA3I/D+yOIDxdeZ1S8oUU3whoIxvgVjD
	cZhr9d8oxH9Zx28gxSjjkkoGXigXHrAl5i5HRK27b0UScUsRTWn17TqWy86nFDcY
	4aoWdx17hmQr1o9L2Pa7ss6xzTTvNdQv7rOA0dcjVhLyVSTboczRkvvpSmYFzgM6
	jOhDZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m22ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:35:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba5f794825so109435705ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 00:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780040114; x=1780644914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=VSPSiRXzUzBSR9O8r3uXVpjkzoQlGInZBvHdFb4VWl50PiyYq28cA/aaGuVUu6QZr5
         eI7teqnTvpyYATNPGX4yuaJWdZUyrgmtwRgFQN0Fb8OfBCGVSXVZSJEdW+Bpgk/v0dOb
         5MRvDtpO3HZItHhIdtMXb7n7g4Vy3dPV+SRqUUVnNZif7XcVh2It2zz8pNmc1Xo5p6Tu
         tcJPXAKoGgaIJqtzhuL2blF/ZrXJNpj7UyoMi9EzB8jMxK2aiYadC5yV9Wu22mI4xiRf
         Au/OS7g7PQd0DixsJivVmeH5fgmNDR80Id+bijO1VlmFk+ljYYoAHlbBhjox3IaXGdN3
         u7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040114; x=1780644914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv0Q3qXYjO//4B2sqOti7qmJfsMpQF0kLrKt+skq6Aw=;
        b=SctGdJGP9mBTsjkqDu2blH3CD9VklHdAmEY/ho65BAT5d5o3wQDDpYhl3mrfXGAAkT
         Q7Z+KFcdQ7lEkUDrk0SYgNU1wxeCrbbGGYbZGYFx1xQAmNDmDjJU3JMxo96TNdhdM2Ho
         /rydd+kBOse+n3SkhLh0jkphu/DFIH7/29qOeaa2hQqf9eQ5Wq60DMsuPQjrqFTraYgv
         yRJbccnbjfsgxT2Sw7+x3lwYdiP4FjcSPbFwlIOtDsFSCAj8LwoYs5Ks8yjoyppXawWG
         fP38hEy2bHh4E8bGdWWlh2nKxZIt2/wqHiSSp0HLg9EJGK94xvhXYJ6uVnRsuCriAlEB
         0bWw==
X-Forwarded-Encrypted: i=1; AFNElJ+oNrac/hKcGl2pbPxzqa+BZbsrlnptatBUGWgkUICXQLfnKKMce5mc5aZ+CVRh3EhLf56v0yaU7hgAc6Jp@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWBlPh7Hnm+tlkUZfH9oPUJ8H6y4lKiu679FJK8PVD60+xwjP
	I1Newa8TUqqaqjXRKl7UAMfOOjQDyOCdpukXPv3iEdBqBwm9mhhxHmPE0M9EwO+yCcRpWTgzA7t
	BGhTqE7vp8hHCxg5Fty5kZmpMdwXWMUHG5SQMidEpJcEsnBpkoC3SbdiiZ9vWdDO23f5h
X-Gm-Gg: Acq92OEwHJWdhQCBBaSL4F7EUAK0zhw8WMvHErDqfBcPDxwMX8bki2mbpmmkih+dx6o
	o5m9jqwIzy+pyL8G623qLKRn5kk6ugeIhPp8RxOsLdWW/v4sbp3xshHWWEVBEkXVSIYLvnWWHrc
	4UDc7bLMIk8VR/xXe0+7c6q42ChGIFAm3LBOtbsu0PUwAIyKJ+dOsbaBQx65hiTNSlF8LdLKR1a
	bPpyUN3KqrghSvDe97MeqF/fCFVuXUvFB2PJE0BBlGrJd4MMkYVzyZhjO2gBMas2AfcH4tUqTcW
	w/a51xqvzcjTwNkQg0oDi1ojuG1CFPF3IJOyWLpBriFOT8ncLOussGzCeVgh1ElDbnRE6ssmSB8
	1BUQ9YtA1dDMXOfG0GcB/B5YTZ8U4ltIf6mstjGYfC0vKmHxvS2fxRTATKWdEdxy9kIqTwLdgaj
	vTpVg16B5GxAGd08YcI+2GCtASJHCTnkg=
X-Received: by 2002:a17:902:ea0d:b0:2bd:4b8c:fd30 with SMTP id d9443c01a7336-2bf20ce71d1mr23149645ad.41.1780040114131;
        Fri, 29 May 2026 00:35:14 -0700 (PDT)
X-Received: by 2002:a17:902:ea0d:b0:2bd:4b8c:fd30 with SMTP id d9443c01a7336-2bf20ce71d1mr23148655ad.41.1780040112841;
        Fri, 29 May 2026 00:35:12 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23b011d3sm9767335ad.52.2026.05.29.00.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:35:12 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 29 May 2026 15:34:58 +0800
Subject: [PATCH v8 1/5] dt-bindings: media: qcom,sm8550-iris: Add X1P42100
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-enable_iris_on_purwa-v8-1-b1b9670459ab@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
In-Reply-To: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780040102; l=2090;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hN+CcMR/4h+yCDcjXi3OC+yJFGiVPGnsEedi4k8nUsQ=;
 b=8ZAMmoJONTi8l/umFhkC2sOa0L9b4o45/2EgRUWWydk6hU5M/O7pGnEswHAG77EHEASth8lTj
 Q9kLskIVOWEBGqwCHMTkV3qYyp/meYN7m9Q+tcD6uyYi0JARnae5/88
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3MiBTYWx0ZWRfX7TCQOYV/9s8W
 yLYj8i4IhS8g42GNkc8qlNdHzHUlEKbJpe9RiHX3LQFb1Py0Y/+E4jPNJn9Hy5dIyS6NTiwyT0w
 qj6P7/fvAnfx3qDKV7eYrEGbInT5WWP/GEf2ZWpItC9Ic4BE8k8wkldg112PmtQctiREsjYpL37
 LHnpPxopxZxNKUOucOnkGXMaJ5VkDGbSVdspeTcZEdyZqKgfMA8p16EJZt7Ll+mJju1Qs4NRZSU
 ha5G9PYUWYJvI78cbUdStvAqz9lrsZUtsVdsmS0hfwNnKUbi5Y8mWKjcp1Zst8qgAF0cAlWshu3
 4Er64HGlfRJxwIBO2MsfuaovkUw5dGvTb5P2cA943L8+2JstJn3WW9ACSYtVBlakmPZTmLgU8z+
 1YlFS3Fu48eOkWHqBfHF0vM8Pn+kbWc3Sog0KkbbLPvMV3QiWr8gQGkC2GUciUTXRHoZ93/rn3d
 pXdaFymZ6cRBYYozVCg==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a1941b3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vdEEYnp-zpI4J6gZ5dEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mNLMyrt0Gfc_u7mnKxwlBDbOvHYv83GO
X-Proofpoint-ORIG-GUID: mNLMyrt0Gfc_u7mnKxwlBDbOvHYv83GO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290072
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110222-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34F385FEA4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new compatible string "qcom,x1p42100-iris".

Unlike SM8550 where the BSE (Bitstream Engine) is clocked implicitly
via vcodec0_core, x1p42100 exposes a dedicated BSE clock vcodec0_bse
that requires explicit enable/disable and frequency configuration.
The SM8550 driver has no knowledge of this clock and therefore cannot
operate x1p42100 hardware correctly.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8550-iris.yaml           | 23 +++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 9c4b760508b50251ac467ad44a366689260bfc0d..0400ca1bff05dcef6b742c3fbf77e38adca9f280 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
+          - qcom,x1p42100-iris
 
   reg:
     maxItems: 1
@@ -41,13 +42,16 @@ properties:
       - const: mmcx
 
   clocks:
-    maxItems: 3
+    minItems: 3
+    maxItems: 4
 
   clock-names:
+    minItems: 3
     items:
       - const: iface
       - const: core
       - const: vcodec0_core
+      - const: vcodec0_bse
 
   firmware-name:
     maxItems: 1
@@ -115,6 +119,23 @@ allOf:
           maxItems: 1
         reset-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,x1p42100-iris
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
 
 unevaluatedProperties: false
 

-- 
2.43.0


