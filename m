Return-Path: <linux-arm-msm+bounces-106341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKkEOll3/Gm3QQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:28:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 488884E775B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 13:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D2293038B8F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 11:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3773C7DEB;
	Thu,  7 May 2026 11:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g1I2n4r7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQM2ScXZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A23B8920
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 11:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153104; cv=none; b=M4X0zR1etl/n45J6FGmEtvQW8GPpTOko+HvyUeCr+elBLME1IB1INXqP4wTboE4PH7vWL1O0ENCw0WUOTq0GHrSXO2pRDE34HY+ru1ytF3FYo/2wk6DeDDkzubmfbREGV6suNbtuFx+jkvWDot2pej1FuLBEyhccfIn+WmvXMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153104; c=relaxed/simple;
	bh=evVlV5QhwdsHRVHassrrlpvsT6O77VZkUS8aHmvhG8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lobe7loBZSAEIMdfWIpM9+KRl4OrdeEQxKi3NR2dUw4c/olU+gbZHHnxSfdEzSBBrayS/ztRztN2a/UcbtwRBjOuvmSYyWT4swQ/+01YDfx/0cxc8YSFQVMdAjTFZJUnJV9PHaNlvLK7Wbbh9tYKUo7DkVzLdb61iguFNGLhvTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g1I2n4r7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQM2ScXZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64759hY43924960
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 11:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gE84wqweCwZ
	bNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=; b=g1I2n4r7RI9LVPrcWupj0OZxnEF
	6y2hj+IvhgSeHH1T78PFTXI9zbOJ9QUr/IZ05/kxc8WoBfj+ioPX1FTA1JUkJaWC
	Jv1yC4EfBNDYo4bBMBPYdgou3Cxxjs+9EChc4to9K6Odnp9Q73i1pPQIwaptA5Xt
	+gHnz0fbqH0PcNy0yb5SFl3bZ1xkVjN+j6DkgBsLo7n1ndzdzSggfwM8774HVATp
	mB6GkqbqMdfuzaDF2dSNC89w6z5p7A6gCcV8Kpwz6nZrfrGYJpjCTPX7zBHIZ5mT
	L5q4Jp7eimUG2YkwZ1IvpFoO6mDNUggQB3aPftY4tpCcmyHM4GMYz4iArXw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88au5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 11:25:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so3337567eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 04:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778153099; x=1778757899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=RQM2ScXZ41EDnh8hoOiYX4ISbAeWR4e7zO031rfYDi/Zm7hYo8hSGvdJr+aFNrGs6x
         Mn9iix+J0SutxKfk5Err8SC4b6unof74TJLYV/pSeA0QSQL55AOAJKn1S0TQCwd4Ld7f
         diA3zV6vQvJQYNmlch7J4hIr2D3rAvAVZtyNLedUdIiff25bggbP5mi5Tm+KnFikYuVk
         pSfdelSF7RBBcN3bABY/M5IcCAfuwXmXjewVs668cauw17eWlQKZ11vnT6Z9V6P6N43u
         XDqy+UHEL9/zx2Av8xDwBiuh9v1w4vjR7HKNtN4jqNNDSdT/NpnQQpMaSwc+sChuRVhW
         oFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778153099; x=1778757899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=lq83QBD5oWI3CY0Kv4mz87YYY5nnkX04zHrdSVOjVJUb37BT8s2hvXF2NDfGiS010W
         ugceCHNvie7QlFUfGcq79frNNyk7nTTEayZlt0UWTEYrrzVD6TvNe6HIzbl8G/WTj2+e
         cREej7abJaFwtSMb6Jpg5GnpJxNanR/tb4MtMwckD3/qKuIgXW7lsKI/NmBzRHl1aVyJ
         jIOIjgqxtr/FKrPf/yHvtzwonB2qf2V9fYwt5vCm2iyEhB8qsP83BZJLUznBnmVKtGF4
         zMxAtRDBAcJK7S6LZ0RMjz27gl/7+AHTzH+3uvhHvSGOiA7l68gn8LNiL5SOg/fdy59B
         ngCA==
X-Forwarded-Encrypted: i=1; AFNElJ/BnRy+yYQluWQFxPEdFIsNZ/9PZSgWWQqCbLD8P1uQI9wtcdF9ISlgEQvtLa3zqqHqjuyx/b5MxrQN23np@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo88HesH1jcafYMP35rW9BgVtry+OGJMD5mh2CjQL4lDxB3OyA
	DPna7HknfunqLSw6oTSDi665YPmU5N0ORDvXM2CSkTQ+4erryo4Pi+05XlJUlLKKwhW/eYCJmPF
	gSg+7bFSffOx7XDhKczQ+HT9lcrqaMYDT5S8tyJe6A4NYMC8B2VyjILS8QZ2QThKDCzgT
X-Gm-Gg: AeBDietidNpWoNsGLBknB4nPFL29nzRISF//g1kTzpSWvMjo5twDG17lm+Ahd/qbul+
	6uy4NMevmbmoYUbTooSg9F0ukYKKb1jhzP8GWhrmiUKDB0afKzPBvh1WLy/GQhu9poH/tndhc4D
	EH/+huJwWqvKGrvglLyrV4rv1ELWvYgEYIvubRcQgWM5mmVBcyzPyaqlIkB9lPuN8FApNY0XxES
	Z/KHF6ZdSlWkml5eA+nw6u8pE0SlLYYagBjRqW4tY6qauVMigVwoCi5AEQLDEtYVjGvtFP0nVHn
	XlS5Ah4pKS8LoiPlyzR0mIyKbACYXQfNeVWtXoSAzbOr28ce+ViRw/5F8OzavuUOg063UP308fE
	AguscQaY8lruxif9MDFxpl3Guhv5iXzpMrGF0AihcsNPNSVyd7NJ2DrMj6jxzSbvaKw60AMZ0h/
	bVWnTzpOwsbS7XrZI=
X-Received: by 2002:a05:7301:6784:b0:2f2:1b3c:d832 with SMTP id 5a478bee46e88-2f548a9867emr3949412eec.5.1778153099428;
        Thu, 07 May 2026 04:24:59 -0700 (PDT)
X-Received: by 2002:a05:7301:6784:b0:2f2:1b3c:d832 with SMTP id 5a478bee46e88-2f548a9867emr3949391eec.5.1778153098909;
        Thu, 07 May 2026 04:24:58 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec592asm8151115eec.5.2026.05.07.04.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:24:58 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
Date: Thu,  7 May 2026 04:24:53 -0700
Message-Id: <20260507112454.2527088-2-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260507112454.2527088-1-linlin.zhang@oss.qualcomm.com>
References: <20260507112454.2527088-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gXip32Z0GZq4ztqTzRG63u9Kezy8vcyq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDExMyBTYWx0ZWRfX0Rh7RtJkdtML
 J2CU/wauJsTDz4CM0PdHFsd202/y0uYJUbrcxrXZcq8rjdMw5pI5wh3bJ65dIt+ypAfY86tp5bK
 Gdfsmk2uz8GoAft3M+cAaiTtcHIHY02ifFZ44f866ascT0vLUM/kh1KRk6h69qt6PonEpxEDbMl
 aJFrgL+gi1+c+puBwAWR5nF7Cwgsio3QA4M5zxWZpLSm45kATUbaAxbZADrlfm6gig2rFIdC38I
 yr9IYmH47jrhNApz1VFRFopNpPq5iIRHVKvdaOi3wYehVABtW/EPjJcT6PGvwS3+fE6HEbbY7VP
 6tUeg5kQ83/w00r/aAyLmYyy01HoDi6+08FaCA6fEoIMQupTP3zbRHILAnpBtrABtc5pgi68HZE
 8phZCzdFog7Tn7Z7a6aJ6KKW2aAIOfeTM2qtkYQmh+3/GHDs2nhWJC3IcszuwIXNg1h08dUIEXO
 YUS7Hw2GrSSS8VPb2Fw==
X-Proofpoint-GUID: gXip32Z0GZq4ztqTzRG63u9Kezy8vcyq
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc768c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UuHxjPGgWbCNvu6MkpoA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070113
X-Rspamd-Queue-Id: 488884E775B
X-Rspamd-Server: lfdr
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
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106341-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On sa8255p, resources such as PHY, clocks, regulators, and resets are
managed by remote firmware via the SCMI power protocol. As a result, the
ICE driver cannot directly access clocks and must instead use power-domains
to request resource configuration.

Add the qcom,sa8255p-inline-crypto-engine compatible string and make clocks
optional for platforms that use power-domains instead.

Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 .../crypto/qcom,inline-crypto-engine.yaml     | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..4e7d9111d0eb 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
+          - qcom,sa8255p-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
@@ -32,6 +33,9 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   operating-points-v2: true
 
   opp-table:
@@ -40,7 +44,20 @@ properties:
 required:
   - compatible
   - reg
-  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8255p-inline-crypto-engine
+    then:
+      required:
+        - power-domains
+    else:
+      required:
+        - clocks
 
 additionalProperties: false
 
@@ -75,4 +92,12 @@ examples:
         };
       };
     };
+
+  - |
+    crypto@1d88000 {
+      compatible = "qcom,sa8255p-inline-crypto-engine",
+                   "qcom,inline-crypto-engine";
+      reg = <0x01d88000 0x8000>;
+      power-domains = <&scmi26_pd 0>;
+    };
 ...
-- 
2.34.1


