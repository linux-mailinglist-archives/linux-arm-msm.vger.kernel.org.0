Return-Path: <linux-arm-msm+bounces-107023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPH3LZ2gAmpwvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:38:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB945195C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A28873002519
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B422D7D2E;
	Tue, 12 May 2026 03:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MMnT+jYK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWei9E0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3F296BBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557080; cv=none; b=Sm4IbA+OZBzVsH1GALfRCRHnM7vg4ixQlESETe5CjuZSQQzmb9l1GSCouHJq+7d3C6Jy3jkZAWAlscyWKO0mMEc3VdhaBcged5Oemb0AbzMw/YjkvSWyJXQnxQvrWBTBNJCXYpQ410CtzEMRmPN9Szn7OVRwB5vf9OsZBeXEgvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557080; c=relaxed/simple;
	bh=evVlV5QhwdsHRVHassrrlpvsT6O77VZkUS8aHmvhG8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jpgCHooaUv8ccYatlx0xS4geuC7r/zaMFHEYPdfrYNLMdLrsZuvbh4ZO2kG+tkROTjhvvk+PinsxjQoqnK5G0nVb2wM5VXIWXyOy87kMLtOoPvIsXYBUV7SKqc2jv6tKNzt74GSOHLSXkspDupDLQ+Ag6KjL+hfhmPP4JQrGbhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MMnT+jYK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWei9E0F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK80Ti2172829
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gE84wqweCwZ
	bNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=; b=MMnT+jYK5WvHqsQkin17MDBUQMj
	O2oIxpngC+mo8NmtcbC+CZz+74Dvn80gwIsVW61q15Fwc9Jgaqptv/b7l9yNZSAV
	jupPuw1hTY6eCgvBW0efAVR7hk7qbkG73kvqBviASKAh6H7MaXLpMwAsFn86UK+2
	LBZQUvYi9+q1aPp1AWkEuYZpe0j64iSksT95oRzKqwgR1xn9aKIS6aS6WMwpy98i
	2ulzYT1HJIee3YKf4uoQ3lilC6BihjN5hRj7h37S3M3CfIB24Q2ykj+Vyv9BXiU0
	3+PHhiIXtjsVpMdqwOMWjAj4YqKeGkT/8MXr+lR+5Y9fbLq48bL9NdQtd3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj99xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:37:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so2860761eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557077; x=1779161877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=EWei9E0FeNle3yM21vC14rtKmepTH+b+t4UHCtPqgdqhr/Ue45RuYgsXcU2elfU2Xw
         ybLTOWG06Zmg22Xu/0y1PHGNbTojuKJ3mTRsv7maYF69vxYFvYSVCFsEpiOWL0zLKVdD
         1Etfn6v/TC4Ksm9O4WeP6DXSvGDlHyWgbDZ+2OqUyF45PQMZIilHbebX8tb/SlAxG1rh
         ktsyqq51fc1C2HnVCmNS4QQGZmHV4yKpZ2s24CXXxHLKrr9WQd4Y9nJ8MAyGzMaKdW1r
         IZtDOwih/1A/0OL7yVrbhK18SopcTAMAWe8ARJ7ChS8heXnLn9Z91Vy6sAq90w9ECsZx
         +88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557077; x=1779161877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gE84wqweCwZbNXasDDRhQ76QGeX+FWtTrNkIbNe56u0=;
        b=h5bHdnOtgLmpqY4auObNALKtgedwQdfvaFdBrB9nCnmf2f6uHHOaH9vqrza7LiCs09
         1DV8O40Vh+S045AyQrmYuwsXAuPJyI7dOTYqrvmQCOvaK3UlGbEbJN0JaoR11Jj+xler
         Eej/SHbNnOCXPoAvzU5TK2YJbYPw8KrF+uqXXQ/cW6LqCav/OCtL8DkCZmoTNlTOxE3N
         AMTEmf7vJOxMPg1FDujwQCOwYnZ8K0Ti7hz3tqdg9Nq24tosGpmn1Euu+kRwv8XfK4Tn
         k3t0dTH/7MBytSA7NQbL7B5huiS1ZHfdswY3I14oY89yblcHz9ptXNO+WFKS9u4dUm25
         YZUw==
X-Forwarded-Encrypted: i=1; AFNElJ8yB3JV06bRLaUb89Wkd6MA3T4RrCC3DrZEZ1p0aBIBgx6JPVxyuD8b/707YWTqVp1vbUdYU2nOnzLLYhKa@vger.kernel.org
X-Gm-Message-State: AOJu0YxWehcfWFuJ2u6Vv3DKyJ8wMGjfdvVJTeU83y2JU9c+BjfrXsLB
	rhtiR9TYmnLHcDYVv7/yoc679K35wmjUmA11FCkcj2SKY7BmgMa5zPs8c+g+38rAAFEBnGuqamt
	z8Mqz+7Vqp4jIrcOZ0jKGGMO5X/HaJzHhmpFTTDRE69TawRxgxPzrlYdcJtEYD9ZRtgEo
X-Gm-Gg: Acq92OGWAvDyytvr7OnOJI25Wh1uD4djSE2RdaUUdrK4eFKlBcyQANqEUZzQjqireUj
	of8Ae5iNTDHPLtERsqOgcsvGE2RLQXjilyOkjzPX3e3ghaGc5hZ/Xd/0fyngSIUTamcgwovIOlM
	iX2G3ziQGjyjmoRC8abQXjqf0bxjDL+1LxGrCQFoplcdfZs59YutNscBla+YwaykhpIvXhfet/y
	6/1FLaOXZ8limhbAbv5R5nb3vPwSnpAtw4sF2LgvDrUaGC4cR9jIzJVnfBjkFDFRei+Mt1VS8a/
	smqplRX0IjSHcEdcxu0JO8fX3ZulgfP2IxdT3tqsOo/3ENgDKHK9KjwJqrQOcLyhB7/JFHD1/SA
	pUNikQbRw2m+r1w9FZ9Z3YvNoqpyuDA3JwdFM8wNl+UKkr8Wa+y0h88EllF0uOs1kanHePPM6X/
	om2NP9
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr765286eec.13.1778557076492;
        Mon, 11 May 2026 20:37:56 -0700 (PDT)
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr765277eec.13.1778557075905;
        Mon, 11 May 2026 20:37:55 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:55 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
Date: Mon, 11 May 2026 20:37:48 -0700
Message-Id: <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WoK8EIDTMig6pKT2exrnoXITt1s-rnj3
X-Proofpoint-GUID: WoK8EIDTMig6pKT2exrnoXITt1s-rnj3
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02a095 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=UuHxjPGgWbCNvu6MkpoA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX6jIHNh2gIqUA
 yxs77Gg5N+1/iVcOsWwL+qcZ2o1mK/rUVLkaCQ+9pKnwu1rOmbaEq0BtRcUMP8zKjz13NlBGxPq
 BjZnNV+h4z1RRa27smnu0q5GTFonmcU012yuZRWNDXTjrMpC9KII7qD0lu3hd5KWlsvDwtXTFyZ
 GUgnYL7CAvnbvZ87tGEj/4AgpKgxU/k+/MW6y1GVTZRIeqvbamu/gwji7DWlfgOlzkrtS1psy9M
 q6pLmRQOCGhFjtsEZNCbSoQMVJ2qxQoLK5FkotBtD/ksvb/62sPTeEb2hWQPWPONlQmg9ygBo+x
 ADHVagZvD89LrbFmqNLhfUT9iIRMgupFA76a/0tGj5u33BLy7ePhPxGDKemLBOvtgEXSFLduR1X
 uDsT45IQRKAuEqdhVTPhi+I+tPrjuuluKIkTpzI8WuUlbi0NBbAI3h1omeB4UcmrxYQT+xzKIhJ
 tb9vy7yaBCd++Vlhn2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120030
X-Rspamd-Queue-Id: BFB945195C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[linlin.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107023-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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


