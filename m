Return-Path: <linux-arm-msm+bounces-116766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t2hcF3ysS2pRYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:24:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885C711385
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:24:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Bo2G3XOd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e9zzsY5a;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9293C32E1A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4C541DEC0;
	Mon,  6 Jul 2026 11:32:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BC41D4FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:32:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337534; cv=none; b=jA3gPzHf9prP5ApDWDlLcky6ELIrBx3l7Sv84WkpcS57Q8fnkR+P2kQY4epIK1+VVAx4721reGv6CMqrqepAi4rsBv0hOog6M7u6WZpInIWZ/GgON9YK2BgMy8knu5EQSNp7s2kURp1DZqe3CeZmpjhc4NcfnYqfgRs4TyOFP6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337534; c=relaxed/simple;
	bh=BDlrAUN+dv5+3Nw0wSTNRFS1ZjZcXmnx3mZxq8ZQoV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HHS6zIV9+L7da8A7qGECVxCeo7yIRtL5Eb4GW0jKTvo6Z6WITiATuiuS+xWk17MclfNOv/K7HQssOSb7bcqUvHzc1JAhbYfWBgXwdilly4YL7JLLe19AJGu4M/hF/jzyvmHVWJSELyqP6WRKNMapd3j6/cEyradhzwyFEPulBRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bo2G3XOd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9zzsY5a; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDk9366706
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bs/O1MjHi9/C1TWYd/oU2riKYYdfbWdhGH5f0Eox9B0=; b=Bo2G3XOd3wvd1+vn
	o1OXbYwH7u5LOrb9J7Z9FLcCWONijS3X1b2nk4BB3zTuiz3XLdO2LpPSqwGZF4Ec
	kyqUCGMftOkvnMr/zRmO3HMBoyb0C+OIF8/WVZFiR+KlXCkrLotRvGNDShUrMs+c
	n9pW7XdV/i65tzJP1QYwyMHKqmssA5esjAWTTVDXO2vgpoSspxOmB4l7qzwjKhnY
	ScEvT7GUDOk1NEaoiZPJoMLn1hQdbJuQv66m33ntmi7evTcdoeO2o7Qw4R5cnVKH
	551Q8LZxt3opdZ6g4dEoHlGoqhR6wKLDQIO0GgRG7tRDQR+OzjcsS2HRK3uSDuba
	GKLohw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urn13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:32:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845317fa7e6so4488046b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337531; x=1783942331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs/O1MjHi9/C1TWYd/oU2riKYYdfbWdhGH5f0Eox9B0=;
        b=e9zzsY5aScRe9inXpHG3vc3ua5FfVUMs0apkdGHpZwrgn2g9gpjuOEYbLTSjvxXlp2
         DCZs2OgbQaIsgG3FKHGuFX6njYVyo5cTnwuEx3NKelvSFf2lVukZMSLN4/BAO3OLunrV
         Q+vxOB/cqsXDlXQwKlTxAjF+y5wd5KSMLirL/Ocgx5SqNQ5n838XUh4wvtQWvW15uQfq
         Tz6m68jdtr4JhC0K2Yp1a6BdKpX+uk5XStCrXZ/L+mhe/QdZX3fv70QQw16HCBYZ/5T+
         FJMPTCoeqYOBcnFe3joZ7V7Q6MLrRk6pkGPg3L9ORCKzNspR6PRqkQD9Ln/MQWA1NrJH
         gQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337531; x=1783942331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bs/O1MjHi9/C1TWYd/oU2riKYYdfbWdhGH5f0Eox9B0=;
        b=XD8BOwZIIXF1QK5DdDSapet9pPGdC6cU7wOr6fAqwX6ZXqyDOMCFoCb3Zm/luPYnAO
         EgzYhoA0fX9MvbGDX58/yYr8DuhPysIE2/AmBE3w9YGycU0ExVfrFad3jXiN7X20kyq1
         ujIjUVl5zW+9kEvtzzMUUi69nSvCTcREtxWmcbfh3nSf9/lDJzVCWL+ilySbHf88TCfC
         TIUxRwLXCde/yfkdAKCcNISxTRHAWSSvDh5ahJ1I8u2LZCGM/GkImSbjbVkDfiIz65w3
         9wpW7n1A4rLN5GgRUcuicNI7IDGyo4TCYTTVyHpic1QOyAMqjhNSkxWAFUdaJLt6e2O+
         1Acw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1skDjPxBnhQCUT0m4nE+iKi9tQ4cdViX49+4Lm59pTHd521QYs2ZQnpYPEEB3DWgeztACXUXEhOQfAoJ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tGsPT3s+mjh4BWpeazvjSeRchN1F5VuF23s5N2Km13icAHrH
	Kqkw615QyFlSOgNyECjrUX3Vb4nbgruppDL9FGb7ep/dwH+gBHZKaBdjb197kG92ngsosAhZype
	XnwllxxzvcxtcmDBgVvN+XoCR2vi3OEaITfZr8sXm5Z4/FX/ojRmASJhm5n0sYsyt4WLR
X-Gm-Gg: AfdE7cnAhVNn3O7IqqzHFQJHuwe1ulphxah4/z+Scytr+zXiCWholcDaBofD+w2p0r2
	d83+HJYuizVoV7Opo36RtT5usWgHLJHZVtgTTR56+vXQLnibtTs/PmxjMeaF/0L3ZyuUloUxn0F
	/NBEM9MRvF+IaIBqRRDb+oFNaPKHsYtgnwB5m568hx5W4dU3PD9aLCR2ehzbLE+//OEs144CfE0
	0YGv5AI17NXXN3v9hPuzI3/1sI9Dry41cZiaVz9GMyM3smu5MlvvH0flVJCW8xK1zYmnZLpTrJf
	y4Pa8QhXvB4ko7eQdKsDiZK+5lyiqLix5fgfyNxIeliULzp3q0zzP8zKkphnUeVpHDZSTOh5xgD
	uhEms1TpsMeaCK+mQPg7eB2A7lt1vdQ5lnuzvpyhxj964
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr129684b3a.4.1783337531503;
        Mon, 06 Jul 2026 04:32:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:2381:b0:845:dffa:3740 with SMTP id d2e1a72fcca58-84826d1260bmr129633b3a.4.1783337530993;
        Mon, 06 Jul 2026 04:32:10 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:10 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:29 +0530
Subject: [PATCH v3 1/6] dt-bindings: crypto: qcom,inline-crypto-engine: Fix
 legacy/new SoC strictness split
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-1-23b4c2054227@oss.qualcomm.com>
References: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
In-Reply-To: <20260706-b4-shikra_crypto_changse-v3-0-23b4c2054227@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: uGvCFksWcq0ooqqRjwQqDccHoBoIdYbm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfXzsyegDhGzQ7T
 I0SXJkvzCoM0Fq+QOPmUmveyYQvDxV6edlbKpTt0bjdRUeRN3iN0GsuR8XVNl8Re9GXmwPEsfgc
 lZXPTaGcwP4unCX1P593GrNUKOWHiJQ=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b923c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LJhxytyqajTry7azkiQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX8MiWVhcEAn7x
 Im8Z9XEwTRaj2y2YOYL4loqzsRT4jJ2WENjVCeDHIF8rxV/uCfFSm1RaLl4SGf19ZDrPda45vEW
 Cz0oBHpfsUcyExb8bDCfTfm0sAQREebSt4Q3W0bbTy4Cy8mJu1FxC0DhIXHkdcmKy8ml+jKF+vp
 Ls2hEfNhLSEV1my9sqBc1ktVlGmq0RcoisWq/4r1rI38RGcBXWEjJolrQVAFFOqcYMbZfBLYfRF
 eALbnGo5IzC6b5Hw5IhRd01QNWDC53SmwaP59CuKOrdUHGC6NRnjCg2t/PyMgpzdQIlf5Ni7bMM
 XvlmaTw6EsyFHypblcv7iJAvYYs5ibwdv+2gRZ/48hBZ7ygLTmuLFGuX5bgbkmBDF4hALo8ckUv
 snklwnPbDtuWgTGxujv//Xm0mUoSVid1decTYvKERCvyufgJrWtQvPmbxKSEI588t4hpYjEe5Ok
 A0WA8bOe7k2QLxzfWVA==
X-Proofpoint-ORIG-GUID: uGvCFksWcq0ooqqRjwQqDccHoBoIdYbm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4885C711385

Couple of already merged SoCs(like sc7280, sm8750, kaanapali etc.)
describe ICE as single clock historically which are recently updated
with mandatory 2 clocks.

Keep only the known legacy compatibles flexible, and make strict
validation default(of power-domains and 2 clocks) for all other Soc
compatibles.

This ensures old DTs are valid while ensuring any new SoC (like hawi,
milos, eliza) must follow latest requirements by default.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 23 ++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index db895c50e2d2..4f3689a24410 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -55,14 +55,25 @@ required:
 
 additionalProperties: false
 
+# Do not extend the list.
+# Legacy SoCs are allowed for single clock.
+# New SoCs must provide both clocks and power domains.
 allOf:
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,eliza-inline-crypto-engine
-              - qcom,milos-inline-crypto-engine
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,kaanapali-inline-crypto-engine
+                - qcom,qcs8300-inline-crypto-engine
+                - qcom,sa8775p-inline-crypto-engine
+                - qcom,sc7180-inline-crypto-engine
+                - qcom,sc7280-inline-crypto-engine
+                - qcom,sm8450-inline-crypto-engine
+                - qcom,sm8550-inline-crypto-engine
+                - qcom,sm8650-inline-crypto-engine
+                - qcom,sm8750-inline-crypto-engine
 
     then:
       required:

-- 
2.34.1


