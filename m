Return-Path: <linux-arm-msm+bounces-95832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE6mBFDfqmlqXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:06:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11222246F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:06:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6725305D4CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E83B3C1B;
	Fri,  6 Mar 2026 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gcX/xm6H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9X/K4GC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181D3AE71D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805831; cv=none; b=GAm+GVxx1CcFolrLEKvjwTNF9z8OCOmHJEv3N+ObMSkWKvQXLNASwZoR22kX4fESAul8MXCQ2WCUVsE4CFlV6uW9XBrnwUE4MBM8ouw/CIF3v2VEMcfRyLd9xW/Xvh9VwLu5qvQRWJW2BXbcl9sbWQHfkd29eLID5icOrbuDP2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805831; c=relaxed/simple;
	bh=kJAc7f5m5jxavMkgdIHdotCTd133ITydGJDsM8ctX+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffeAnxE8eG9XMZ9vuygw0wG/y3zt8za8YwvBKDT3snRNy5kuCMyETAXOeJE6jW6dFulgkkF2mWrhVdHzxCyTVwfVX/pcffDbwfh9a9ABF+/ne8Viy/K/R9wHV8BtAc5iA3T8qkdBruJVvu69Cnz8ATAJNOK4zfRxfRZlSsE+B6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gcX/xm6H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9X/K4GC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbH6H2022741
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 14:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=thDMk6e40n+6IH98mjP5Yb1qMk17Ss9qvkj
	Pv6/pb60=; b=gcX/xm6HmU67074MVmE9teSdUwGPWt3J/qIS1GhXSsOazi/ExHV
	pJk6bTRxemgeDPsKFShQXxKJiAabAE5ssaIzRoi89goD5LalNGSCnMPuCYPx6JTW
	PbNQkBJtoeNaWYXo9HtvOtYnw9gNM/gWcTqO3rCWksNEPaySjg+sIObP8Qe+89W6
	uxff01OfydmJkr3AP7qge1bWiN31Et+sidktV/B9kYKJonuye7fa3DDKD1I9kBUd
	7oBQn5lZlYMN4PxhpT/7PjK8wSXJQyQxzIsLNkrWMT2sQvAtx++zpaO0acSwvYd9
	oGyiTQSa91e+U03q4t5jKKKaIiQPi9h7djw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6bcge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 14:03:47 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be21146933so6577480eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772805827; x=1773410627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=thDMk6e40n+6IH98mjP5Yb1qMk17Ss9qvkjPv6/pb60=;
        b=C9X/K4GCviyYahOoB4o7NYj8g4SOm4Egf1ZHhwbbYr8KhapwTiFB67jIofac/0uEhf
         HS5fYuLQ9u8HaD9uSqWFEGSWHvqAgqpXUUMSKmyjxW5N0e6KhDO6OaMF7t/xcA26qZeo
         +It42emCIyKZkzG0oteFWohQHphfzbZq5eIVsxVzTjfzUsY2Zm38f5n9x1+uGnlIbjkA
         40IDKacQs5k4dTavvbZtzU047wCeqwiMiZSaSHTZKhuf2KId4npB6GGE8kBc66Tlqym2
         bu6+vfjeyQHC6JCksdSR6AbS6MsbpUCxhYHgQd+vS3OU+R9jgwGKO+waYzqQrAwIBSuh
         Tepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805827; x=1773410627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thDMk6e40n+6IH98mjP5Yb1qMk17Ss9qvkjPv6/pb60=;
        b=KHr+xcRU2gzEGgYnybW63fDxiuRJfdtIIf6qrwsnShKGXbALZKRUfo9rpDuEPkJWwg
         NfCblm0z0vrDQT1YX3/BT/IpPG7ZtjfIKRT/zHSe/TEBKYyc0dQvMMyhnHKre4BSc7OS
         QGBgRiUfvNBxnOCSn3kxLe+JIP6ZwMr7xgp+JEG+Vuw4eJ752lXXzlASQA5+aZrkInz4
         ZhANmlm8h0FvQwcYAxDZw6PRTLR0NyMqYfmiC0QbzP56sNPA3E6JmWL92ya+uTLEPfZK
         Cvv0EEPzydo9/GJBw8CT0lWssbCD1p3copB7T8F4mtptPct85eabs9nOOUlGGXxFOSFr
         YHNA==
X-Forwarded-Encrypted: i=1; AJvYcCVbmypNlDXHf2f+Fa8ErA6xk5QdhAMEFGw96r99fXwOD0MO56inqahC2GfwNlQEQU87j3op1wmTrU7dApI8@vger.kernel.org
X-Gm-Message-State: AOJu0YwVtmYxwRrvK2gecppTYiW1VlhBjvjntLJHdh2sjk9/u/VKB+Ru
	ecKZSYANlY/GpsZaEVoeUtFwc0LEoBhbzPYik+dhsB/ERyimsrLg6yrQOExEix7CuEGl0cwvzth
	loRbpcUg/d9ETd5wPEUzhIhR9AgcZA44uUk72hI2DfxeQaSBjchIchouRFH72JT2bIf87
X-Gm-Gg: ATEYQzxsotX68IafWX56yL3FaGOFD7BgHxe+wlqMmJjIZ8/NAtyifTWIegPf6xBGKr4
	xAPhCEGYUFCr13hdmeQPPyTAwmKbWqOuju5kcRIT1Nig73hYn5D7rXByW/IOhZ4NqZfJagFuNi2
	FwKDCHQz+DSysHhjiom5I0L61n/aPL10AlNlow4BR9lq6d+Lpu6dsMrZjWq8CaLgXNkUK6d/FEf
	3eRA4mM2VIcCsByacIFyiVbzoNzFAyfe4WBq/8K6vGr7T9U5DUodfpSguyzxJ9NimgVnDDa2Yk8
	seGG+a1/fmu1gAmGTpavQldJNs715lrDesLvlA+FOPyZX79S0GdVbsuO+x9lY3XT2frDoLoZnzV
	M5moPcRhlMwfktC6JuKBJClW1L0YuUBQD0TU5qk63Sf81YTxfaxo6ZF9t4HWMphQFggABmdo7KZ
	in6o6JRQ==
X-Received: by 2002:a05:7300:a44d:b0:2b8:6ad3:804e with SMTP id 5a478bee46e88-2be4e0555a3mr767855eec.22.1772805826477;
        Fri, 06 Mar 2026 06:03:46 -0800 (PST)
X-Received: by 2002:a05:7300:a44d:b0:2b8:6ad3:804e with SMTP id 5a478bee46e88-2be4e0555a3mr767820eec.22.1772805825537;
        Fri, 06 Mar 2026 06:03:45 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948631sm1200531eec.19.2026.03.06.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:03:44 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom: Drop types for firmware-name
Date: Fri,  6 Mar 2026 22:03:06 +0800
Message-ID: <20260306140306.1328719-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2Fyx9zL8mFiYbOBdQNCe6DUvujibAPap
X-Proofpoint-ORIG-GUID: 2Fyx9zL8mFiYbOBdQNCe6DUvujibAPap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzNCBTYWx0ZWRfX8N/Aqud9/M4t
 KfBxFJs2hlK+pVrGEXhemFgFC4uHjLnhPdhJ0CZFSlIauOJneuMlBrQYZkbVlu1DpUt0gVv7D7+
 cmjYCiuv9KqeGMU4xHfrGM9jEOr0W2H0a2tSe8ANXvzfjKdYO5bjT85Xy9R21mQm2xTAHw4xvu/
 TmPmB+kalkZ/zJTKCX56/3hapbNDs0jhstwZh05MzwqUohfyH4jdr9pwfQm8NXzujSBDwPA9O3v
 FpGObkFGJhB9zV2H6WVL7lPZz6Se6nYxhmE2JFi8TIV5Teh1dXw6syaUIJ4sUas3ip9GYexE6Nw
 ibn7xFz5u1Be70xkF/1EElSlAsNWXKbUXBR0nKAqY+WuXzf0hMUG7AJR/+bN8w4KfULoN4BmToV
 rkSSX6nX3hhyPRAIsRR2lcGE/+XykK/fnLcVQDC1o3Prw6A+97I/GFd+7vZCAQxoAl/Yk2VfUs/
 IRTi3w2j6uAcEod30yw==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aadec3 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nzWYI2exGoiye4W2V5EA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060134
X-Rspamd-Queue-Id: 7B11222246F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95832-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The type of firmware-name is already defined by core schemas.  Some of
qcom remoteproc bindings define it redundantly, while others do not.
Drop it to be consistent and avoid it being copied over to new files.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml     | 1 -
 .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml     | 1 -
 .../devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml         | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml      | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml      | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml        | 1 -
 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml | 1 -
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 -
 8 files changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index c179b560572b..1e7c165f925e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -137,7 +137,6 @@ properties:
       - description: MPSS reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
index 4d2055f283ac..1b65813cc8ad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml
@@ -126,7 +126,6 @@ properties:
       - description: Metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index 188a25194000..bcd2bcf96e24 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -51,7 +51,6 @@ properties:
     description: Reference to the AOSS side-channel message RAM.
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Firmware name of the Hexagon core
 
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
index b1402bef0ebe..7c9accac92d0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-mss-pil.yaml
@@ -98,7 +98,6 @@ properties:
       - description: metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
index 005cb21732af..f349c303fa07 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
@@ -98,7 +98,6 @@ properties:
       - description: metadata reserved region
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Name of MBA firmware
       - description: Name of modem firmware
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 5dbda3a55047..63ae3a30f626 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -42,7 +42,6 @@ properties:
     description: Reference to the reserved-memory for the Hexagon core
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 5d463272165f..7e67eda13240 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -56,7 +56,6 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
     description: Firmware name for the Hexagon core
 
 required:
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 11b056d6a480..27b8c127d74f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -52,7 +52,6 @@ properties:
   smd-edge: false
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - description: Firmware name of the Hexagon core
       - description: Firmware name of the Hexagon Devicetree
-- 
2.43.0


