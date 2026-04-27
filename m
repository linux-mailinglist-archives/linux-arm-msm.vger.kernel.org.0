Return-Path: <linux-arm-msm+bounces-104574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO3cK2617mkSxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:01:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B146BC80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98ACB300144E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49DA1C8603;
	Mon, 27 Apr 2026 01:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GiFcGBJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y9MWmM7B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6AD76026
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777251691; cv=none; b=kNQtlDZpRNVFkdQTZ2UEeK+6QKZ25HOpZF+ua01YMIHxQYfaYCSGH7gmd/FST6+lZqBkgV24BlPzDx6qLhpbK8Wa3HhabJcQO27tRKZH68M0ozuhvZT+Pg1Lc2bH/6INA1oaU5zlbzkcr6jih1CYDSnWrBnhld1k0sydMXFtpdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777251691; c=relaxed/simple;
	bh=64X6gRZj24EJLRck7nWbtxsgY31WTgogrdqax7U5WCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KGrRyTxeDqiJGKspMsA5jRu5RoJp3Td3m6BY21vOX6K+IeGxwnBmDR8bZH3dQw72Llg7eEf6jZkKVbxPWvCpH4Ion0gxDzXpiq7P1/p/qBRpWEb+c0yChivbT0ksq/od7LI9MN4VdSPaB5Wa9aK9Bn+RE1rLLeQMn8DW2IwsilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GiFcGBJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y9MWmM7B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QKg2S32552128
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=b8d9RUs3iXEEZexOSccbKlP+1XK/y+cdxl/
	s6ARmPiM=; b=GiFcGBJ/kfHCmFu3BQ5wUarQy51kCJxLR5KzjFS7bt3UoXIVH7/
	FwfmpENr4IuMdvOL/WKdYSWo1VY++SuvK+/SswrJKR+4w1c1VCMbZ/sYkh35m5iM
	gIEgPyOOvER/QmUWJYiU2IeTEVlUmieG1ky9VF+SYhtLdZuUT4NJTLYtGrlPC750
	JzYdpDHxE5FmExz7m3QqFufD9xZpbL33zuxSxrFowsK+UIKaY22f5AWOVz9zMNvu
	B+iyJjLCutVYFR1tp95f5I0DoEKODVAOBGV67wsSMYuxMb8qh/w0GSZWYifhmqKG
	CY/EIUQZ/aE0KW6Ehq4dSrF6qaWqlDmA3lw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxbvtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:01:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c20d5d7f4so47005706c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777251688; x=1777856488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b8d9RUs3iXEEZexOSccbKlP+1XK/y+cdxl/s6ARmPiM=;
        b=Y9MWmM7BsP9L2YZRRIEkGhgpltGhKSk80xVUObc39VIVri3lNVcPQ9Rz3E7IUVNogX
         eOqwk2ds3skIMHCi87QhaVn/KOc1dxqasAqgNl3wvezJj2Y9mcExfInaDuPbhwM4DD9N
         23EpaCApE1qZ3avNgdtHDpYb27FWhCqRE+37ajBff1Koa9f4AFxPwYz4JGwyn32UVuSV
         tS3OBu+yYDyN0VcFErJF4NT3aamN3ioceexpJxMnk6iUN8VHONAFUTEz275w1Cs/Oexf
         8sE2vQyG9sSuAnTls4TKqw8Q4VQA32+JHjGFQx/V6WE6ZP70e+6jwCrUqgzl0WEB8Dfj
         wLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777251688; x=1777856488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8d9RUs3iXEEZexOSccbKlP+1XK/y+cdxl/s6ARmPiM=;
        b=OU1nEEGGsc3m+dN71dN/q/xf4elhI/Vvur13r0nevJZgpPa+J12pMed5KXcDjVQtGN
         tEoqTPDQi46H86oO2tlRpY5P/6LHruIvFJJEyHm+X7ObRjIQUVR72zmKrC8FAnx7HGCa
         R0Zn3jbn9iPOsZQCuKPOucf3EBmDi+ybjJKICVBbM/aysuoKSDP05WX7hOdr/UN8AWOM
         3j5oggChlj9nobin6SF3PTvmyxALViFk2eEyuTRCOCpIcuahUvIcLHGi9qPLun5v7Uo1
         rLA7/tgJlcDAeOB7l5uZ70bhLbsg/nYasbXmGvuPPEulj9OQ8rcnemS+vbnMLYplMVI1
         BMlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uaQGTil3VxO6Rp37fArExfa/1ML1XkJ7aSfWNE2QLmRJl+BA0xlDkLaO7lKqxZthl5IQsM/oq6yiu8WMm@vger.kernel.org
X-Gm-Message-State: AOJu0YySYw1fZ5Wks0Zkv22jBfbAayODdbpB5EH6LrZQLwPUFPt3D6s6
	BCX/SpwZZgL4L4kY5AJJLhB9YOzF5OIGGd2O1nYE0lRTp6MKi+kOHcGgEb5roWJelC9uc90tL3r
	6ODG1YT86XevGrkypnap5iDnYmfxVG2n2stkcez7QthryyUsHBGgOmT6aIKbp0uvsScn9
X-Gm-Gg: AeBDietnfFf0wq7ju3b5rN10SkV0aKBAriEWmgSWxIqYE/oWM/5wCgNh8Zmq7FfbS/5
	IY9u6ZlBk5/HxdAeM/SCa7ShzixC7L+Y6fTfGK9nsA54bsL+8un6nqV3bNWwSkR4Pp/APPTYncB
	ZiFrffByIUjPYb1iFIoUI90/O9jGc8KnEZmdTAyIKT35mCHRgbFJ7jwomFrZF/irfrucAX5Dlub
	lc0jZLPjjapyRlNnJhRGJ6T/hQivgGS1VL9gqdUEbnuUfdR4wAS5nU5CPs6NLkTG7uI2pLTjxBg
	xlzg5EWhItl5r7FBjNL2Rb086lAjLEt+7VjdvkXqi4aM7TA2irUC3tU4idVkudYpF44SLw+Dt6w
	eVxVWkmAcjoVMKKqVJEHTeGIysW8J4NC54mziZ9t9e2roby/cRL5T6vmNhafe9yYuxGInpwmtpd
	mdcHZIm3m7gx8JAFsg
X-Received: by 2002:a05:7022:6889:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12c73e28127mr24549034c88.0.1777251687796;
        Sun, 26 Apr 2026 18:01:27 -0700 (PDT)
X-Received: by 2002:a05:7022:6889:b0:11b:1c7e:27d0 with SMTP id a92af1059eb24-12c73e28127mr24548879c88.0.1777251682930;
        Sun, 26 Apr 2026 18:01:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm64223410c88.10.2026.04.26.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:01:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: serial: Add compatible for Qualcomm SA8797P SoC
Date: Mon, 27 Apr 2026 09:01:14 +0800
Message-ID: <20260427010114.230341-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WA5uav0BlQIeO4-jT-OqDSnU5ZxOIiT5
X-Proofpoint-ORIG-GUID: WA5uav0BlQIeO4-jT-OqDSnU5ZxOIiT5
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69eeb569 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xQiCpKoPW3SF3YnsE2AA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwOCBTYWx0ZWRfX9INtOJxvyGa5
 ivpUQW5xP06gezIDmIUFBa8UHP1+EipGExOZTqudHrs9rF6onM59wFtW1jIW3gQ9/rJrEQz6tFI
 2hIvyUQRfyFbz1duBz6BI+kqcsma4MHT7N2DOVagfgxycfaSVbq3SYbKN0A7jHVk+Mo1J/p1Vu4
 XPC0NNKWs83dedEMgYFu270vlKQ4D2YDHKazUQQbn/PIlXUnbeeFNJF+zKC3ALgbC4f1pRFQzvK
 zO1ALb2OL0g0aY/H6pazJDWqV5f38bfrJtBxa78gtsDkFwEyDDGjEoqJKCeuGhD3jfoU6WS1+KO
 ogvRE5tgcs7f7R9IxesgzOfISMfTOk+5No/SDhUkW9D0diYU73525bcnltVVX9QoLZP4iDMPZnj
 NDm9TDmH+3gCtmeXJx16ytcSEFzgg9tqZPcWzlSAg33Fmx8SMbyjmAJT8yZt8oyR+DqKi29eGWp
 uSpbYD7i7syYMgJHcKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270008
X-Rspamd-Queue-Id: 526B146BC80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104574-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document QUP GENI UART controller on Qualcomm Nord SA8797P SoC which is
compatible with SA8255P controller.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Use 'sa8797p' instead of 'nord-auto' in compatibles
 - Update subject and commit log accordingly
 - Link to v1: https://lore.kernel.org/all/20260420060524.1248432-1-shengchao.guo@oss.qualcomm.com/

 .../bindings/serial/qcom,sa8255p-geni-uart.yaml     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
index c8f01923cb25..8496f822dfa5 100644
--- a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -14,9 +14,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8255p-geni-uart
-      - qcom,sa8255p-geni-debug-uart
+    oneOf:
+      - enum:
+          - qcom,sa8255p-geni-uart
+          - qcom,sa8255p-geni-debug-uart
+      - items:
+          - const: qcom,sa8797p-geni-uart
+          - const: qcom,sa8255p-geni-uart
+      - items:
+          - const: qcom,sa8797p-geni-debug-uart
+          - const: qcom,sa8255p-geni-debug-uart
 
   reg:
     maxItems: 1
-- 
2.43.0


