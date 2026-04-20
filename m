Return-Path: <linux-arm-msm+bounces-103670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ByJCtDM5WlIoAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:50:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DD427749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 08:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0492300DF7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 06:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED962382376;
	Mon, 20 Apr 2026 06:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aQwdBXjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwfbHQZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96173822BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776667456; cv=none; b=eBiuJ6mMgr6DQU0iu3vdhwI+WEoRLiZgvah+yimb9sFr/9N3pc/9kNc35RlmBZUo6bJ2vxxsrXO0URllS3fCA7bmQXSjhnh/RovSnp2+zp+PGDFbGwhhy14WPhzmN61bKiNLcOmn8/Aen9PmeNC/GiCqmxCV0LK6DyLwmctg/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776667456; c=relaxed/simple;
	bh=s6pdxHoI5hvCRhFDkqXtAgC7HtCveanbHrTod1f/yLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNzBrn1+9CDnLq7eY3ii0SwUnpw9ppGe4ScZNoSOVvUbG63kQFg+Nc67v8eXuu3Gxbs4T+l8gjnjCmyEGz8rB61TsIpToPDI/FlqXsruHP/MQ5pePyCehj+OUh8MBR1vNlfI6oUONAWCAEHy9gqcrKQPni4BG+NwCbiaZdrY/Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aQwdBXjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwfbHQZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K2Uqhf287707
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D7K7654DJb4U5jc4p5qdGIOfHpVUN7aYFET
	3b2LG/ok=; b=aQwdBXjSXkfr+kOhmVtzoe+vG1mV36ULNo6iltWCRtAtsr0d9yV
	+l0B/SkB1DKB7dL7yT/C7mk33y0P9TX+r9naL+GTC+1zJg6xbk4gpFmc1Vk6N1Fz
	HO3OzUYxJVxiTCIaONEthrbEWW8SHPGtBVMnLsvXPrTM9nV3m1MWyNf9nK6oaTTS
	h1m1ers9emvTHG9Br79TSL2KU1/4LxmO1BxZQWNg9XLbdQozlyk9Ln6++WhGlBhE
	jxhqBApAhk5jW9N6z5WbexGAJPX4dzyHXOcAKKxF8g8ChxjFFr3PyRFm4Z2R3423
	D8UGuVZ1uQlb/fErKhbS5jOnBGeX69kzI4g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y64maj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 06:44:14 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12c87ba0890so2848196c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 23:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776667454; x=1777272254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D7K7654DJb4U5jc4p5qdGIOfHpVUN7aYFET3b2LG/ok=;
        b=HwfbHQZmBAfv0Tuq5vM+RJYqGJWwCJ24x3mxU7d0eZj/tw7t0mDlZ6DKzytHmc2wU9
         s+uE69pVBH+CjYWe7jhLufTNfJd+YCGVGS6HbQVqD/O0dk36THreagJ3YNYWyaPE/CRU
         MMsBKKGw/XLDlz0OBDWPJvwJh1edwd79YnBKGUERTATVkE4SnoJDhyfhutYfvigMNjSN
         8lvNhUPicWkyqK2PtYti0ozngX4gsRLKNUa5wa1pTSypuu4gugr3tGF/q7FD44xSLCkh
         fscU5UuxDoR8WHh+AtOLmBv8V2ZnlHxmBGfXuotsUOZGtlFvUMGXaHuI3VJHxhaKRH4i
         ofoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667454; x=1777272254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7K7654DJb4U5jc4p5qdGIOfHpVUN7aYFET3b2LG/ok=;
        b=Xg/ErQsSIBuDQTV3Xsh7/O0k009qBEJO+HQGAC4ApVBjMYIGC85EkxZadBHYt+yNo+
         gQ+8Zx0xRSOHraiSzyBurqJLfmSphBj4IpDDSH980N3Dmr2q4JzBwzVCqahCQirLa0ml
         X/L2WTbtoUIbF5aV2iGt7i72+zeES6/9Lz9cprD9390wyxWoMLSj8iWljP/FuNUvLn5i
         1BhLRxhQT7s484SEh2eQ1MiOuUUVl3HG0g+ye0nSG2doIcCBvRyhl5QzHg+JB54VD2XN
         j3XV/WO8ro0OIBweYIseBNJP9pG4QwHyjp0pO+YvSWTq6P9MeQaJM+UCBOU3HgC97Z3W
         Sjhw==
X-Forwarded-Encrypted: i=1; AFNElJ/SUnoM7kL6I4T9DW6qNeAFYrpgqj9W2yXqc6O3z76A+HQ+YdBz2cXbZySRmnmIN65U/oi4m6BC/qnfiMV2@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJUSGE4P5yDm6lkXGJiyMv7MXCDe9SGlK4xRc0/76DhARjnN1
	UFtgineyq7Y2+4Ubb3Fd1fsDP6XW5bsde70mVwBuLy1r6RYgjsfBC6u4owwNTEbvtGHOVEOKXei
	PW1sXPXtJIwG64gqKcXSQb335z3dcGEZip2g1dU5olCgHYk72dnZSSwax3h1rT9Sk7ubY
X-Gm-Gg: AeBDies+mcyjpxMDH5IgwlsP9vpOe/5wOU/Hwc6gqy8N/gKYa6I2Z119aff3b+Ay6Sm
	SPmAVQ5AtJWmm+0EnGykJpaDQ4Dn4+XMi+2NRFUB5yLFd3iBIKJ8FU/+3JhSQadrbyd9NVt8H+D
	MBcDUrngjPPBCFc/Ra/1upygDVcDnLQ5RNPpYhLfebXAYERx8ljF5FgZiQ6OhW/e5TSIrnEeYX7
	jWeTg3frhTYMlhIWRlNnc0cYrtVH+J5LhDeNsc+V/s8ZszZhj+fw6n6nkq1qpeisNLWXCLLdiMl
	rA3eJRRocleJmVFyevWaw6plgc1yJ7NPpcPNnOrVnbpyLMPTZdiNxk4QbJPDhCwH2eIru8iB6+u
	IQyLQkcpUjQNggeg4kNZYPDv8Rk66WaWpUaSvC8pa7uNyF7mxcwef/DsC0iEzqS5GMDi2fnFgyT
	0z5NcFvD7IY5pQH14M
X-Received: by 2002:a05:7022:eac5:b0:128:ca6f:adf0 with SMTP id a92af1059eb24-12c73f975aamr6675253c88.17.1776667453626;
        Sun, 19 Apr 2026 23:44:13 -0700 (PDT)
X-Received: by 2002:a05:7022:eac5:b0:128:ca6f:adf0 with SMTP id a92af1059eb24-12c73f975aamr6675216c88.17.1776667452659;
        Sun, 19 Apr 2026 23:44:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749d29cdsm13731352c88.6.2026.04.19.23.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:44:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <quic_ptalari@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Nord SoC
Date: Mon, 20 Apr 2026 14:44:01 +0800
Message-ID: <20260420064401.1248833-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F_qcOIklbHIvmI4JR1dxggcR6cJ9VMhl
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e5cb3e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=RtP18x_fKbAUknpFPucA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: F_qcOIklbHIvmI4JR1dxggcR6cJ9VMhl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA2MyBTYWx0ZWRfX3wVEm91LZvVR
 L4Dp/pvhal0obmM0x5zj5ayefwhnttRZF8uJ51u7G/u1lObHaTweAHTtyW3BQXXI91WBPOivFo1
 5ybJ4zbQDs3ItQnquhXg+aK7uVp5vDSDTogq82QxfdUtD7FwRlDvCJMf4L52mjiOtcm4+TCYQrM
 BV+9a0+UbOX11aAY5YtAN8JUzv0eLGNGxQjL4+6fv3VtaWaCoF5bruSbymwfkEd9Bfk1yscGbfA
 hbGZYPzaSW7I/3Upmbkx1T6PrkH/tY6zcOJuLIDtNGAp7W6OV/Tf8xiSVIJeYtm5goULN3YfNff
 MDoF9v5TdjX3Wi6fVMRfltG52iLQtGFCp05Zw1nWJ5HBcHcnaQ2/iNK4PkXm2rHaFyx26fAxH2Q
 0fmKV9USN6HKOG+x4ViGTaMGbXx1558VNEke8kkYONcZb5MncMBJkk2p3zxAxpu5tk4XMFKzczc
 fSakOSQUMqyS2B376ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200063
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103670-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE0DD427749
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add compatibles for GENI Serial Engine QUP Wrapper Controller on Nord SoC
with fallback on SA8255P compatibles.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
index 352af3426d34..d73f9edcbbdb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -19,7 +19,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,sa8255p-geni-se-qup
+    oneOf:
+      - enum:
+          - qcom,sa8255p-geni-se-qup
+      - items:
+          - const: qcom,nord-auto-geni-se-qup
+          - const: qcom,sa8255p-geni-se-qup
 
   reg:
     description: QUP wrapper common register address and length.
@@ -67,9 +72,16 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - qcom,sa8255p-geni-uart
-          - qcom,sa8255p-geni-debug-uart
+        oneOf:
+          - enum:
+            - qcom,sa8255p-geni-uart
+            - qcom,sa8255p-geni-debug-uart
+          - items:
+            - const: qcom,nord-auto-geni-uart
+            - const: qcom,sa8255p-geni-uart
+          - items:
+            - const: qcom,nord-auto-geni-debug-uart
+            - const: qcom,sa8255p-geni-debug-uart
 
 required:
   - compatible
-- 
2.43.0


