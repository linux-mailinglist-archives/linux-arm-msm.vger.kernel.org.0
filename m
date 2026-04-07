Return-Path: <linux-arm-msm+bounces-102178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OITcNB4N1WlQzwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:56:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 496623AF912
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A493306D1F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9482B3B95F6;
	Tue,  7 Apr 2026 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gpm6wg0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cNhp6N5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B613B8BDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569921; cv=none; b=XC2BrX8ZH7EVN4t2QFEDCde08T+Bv00Uz1UBHBZC2yDK5RzLXPEcNzS9u1sNK1QWaOQ3eFhzVrovLoPYdydEoxYQQ8OLe0elo+hy6x/0aeZK0h8sBGCNJykw4P6TE6hnpEWFuVCWKgPCJpmAkzI36OSFz3E0op1/bXMSiqbJ19Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569921; c=relaxed/simple;
	bh=CteRO5i+StFpZ/Hbkxhr8vj7aUpLMovvcEdfVXjBI9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MFpg3MQWkOYF8lZuSD2qkLALbDQ934O8iaD+2OGf1CUjtyIHTICWUSWg1j398wtQH83pw0ZdYM3Fp6F5hB99HleHpndeN8/EmrHDJpAgl86wAPo825nkIDKm3/nr7sZbKmPgXDe65lcGQxxishyWgWerbJXyGvAv/VIPvxujeZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gpm6wg0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cNhp6N5M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Cheix3815666
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2OdwveVLuWKs4xR/AeCW7VX+1fWjnBXzZwDqkn4RY8=; b=Gpm6wg0J8tP2rOQi
	F5hDgsxHElF37sl9lXhAzdfldIqOnzfQa8Wvr3eyOukxbyBP73ZWdA9yuiQpX7S8
	kOp5eAJwp927Ye5ALyl/TUDrQtDaBwkzCHqqBCaw3pIzSOzYCOrOPBVFRCqq9EwT
	NsbH8bBwF3CLmFAgFMkSH6DM23EdiQGSbSVS0cGfXk/GIFMy6WTJx6lzLVT1QrOH
	ugJ70s8Oi67gPp3iUsPPWHbnn3d5vIAb6dnWVUnPkJq9OFD5AdVQWMNpWkS6/yp/
	lG1iV/J3/g1m1cuJRzWdQE578JERueUjBWhiqRHVL6OqofEHvSgrJj1BvS0hzx2t
	3js7nA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4u06t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:51:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso58911181cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775569918; x=1776174718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2OdwveVLuWKs4xR/AeCW7VX+1fWjnBXzZwDqkn4RY8=;
        b=cNhp6N5MxWvo/iOCI366bESaIhniM4Z0APXqKsooDq9YLaiuaBPzYGPzWuj+Jq8EKM
         INylf1pUnVXRqHhLggCmGmM55wsS5FK6BX0caj8NnePfrMQWhnqTylsSHPzpGgRovcLm
         wt/6+z2nzgveelcsswvB3HSsqmrET0bD0ritucfNCNi+kgwRgvAB3YuQrsLFIEEQzrrr
         zynhj25FTPPHssatOXBCpbpYwREu11sv0HIgiVIMVLPqd5jfxg4Ovm9/zv5eKcY+lVbf
         MzL6chUhJOjsUXH93lmDWO06rFdKk67B/72vccBf7F65Le7EGnhZooo6oTVbJzklZYS+
         TtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569918; x=1776174718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H2OdwveVLuWKs4xR/AeCW7VX+1fWjnBXzZwDqkn4RY8=;
        b=is0hSySUg8N/B7mdaFHSongyAscVcnrAlwXIejKW1Iql4zJIgX8CMMCOtfCto9iBzj
         WY83DQi4ShmNDjQig8kVEKbu0BpPkCBFJz17fvQHH7y9snkrfrJxzoj+OOJuoTRnwCP8
         iU/nYbhDB3cddSKgSMKESammj6xje1jf3PJ8ooDC3/YmC5yUJNOfdRh5EjNnIem9eGbB
         x1Xk6oxdPRon1iQsIAxTTk6+oTh3UgwaGppmd5jvNCb7ZPoLwVUlfoLWlKVJMQCYNrCA
         HdCXN6RT8Wdmf4aExcA1WhqAv6E3yMMSGNMk7Vu7WyaOyKrRU4UFWZffIplmoPD6jaIL
         6aQA==
X-Gm-Message-State: AOJu0YzwUwGPoT0P2C5xs0A9eeP1QvPrOKFf7jvX+Edu/gS7UayfrMFe
	Cp7LmfE2iZ+8NsojyEWcQOKKLt5cleMYQOTTLx7VHqcGqtfQGY9jQ+kPIjZVGYH3j1TMU1BCPbH
	aLfL86PEg41nspD6yJ7BulP1b2gbxe0On5xIN6xD3YJmG9GmB+Ud2dmq//05U5Sk+Le6N
X-Gm-Gg: AeBDiet+yk/K/ky22f/An1sz+5958thGpAbyiIj6U42tKuL6E6TWAUEDhG7TxE3XDQg
	C0WOv4s1TSCsWd+kYNvoYVyYf7z9X6dw5RKGHDIEjOpd74JqJQYCaX7eptQfaxkOr6hmu9lAoJX
	PJ0TmygQ+ndbihYPyU1/5IqV/BBuoFvkREn3t+wWBZBXi8dHS92iBLfepsiu4AcUINJjrvKIjSi
	8dtH50LK+3KoqmBU0x5P01vQRg63hMFCP5iJXDX5vyQk1Z9k/927gcsZ2kYWAqKbBbMKE00SI92
	bpES+gSBwMY4DJerFqobt8zFOsla2Ze20qAfrUYVyBvd7wXZTZ6AMiGr6IlIv0/3yFXpQdA33el
	egO/KunhL87H5p/ZNy+jjps02gA77eztYR3nNyL9zKFj3
X-Received: by 2002:a05:622a:1990:b0:50d:998a:2d with SMTP id d75a77b69052e-50d998a09bfmr76447241cf.50.1775569918463;
        Tue, 07 Apr 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1990:b0:50d:998a:2d with SMTP id d75a77b69052e-50d998a09bfmr76446671cf.50.1775569917954;
        Tue, 07 Apr 2026 06:51:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm49788420f8f.22.2026.04.07.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 06:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 15:51:42 +0200
Subject: [PATCH 1/2] dt-bindings: crypto: qcom-qce: Add Qualcomm Eliza QCE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-crypto-qcom-eliza-v1-1-40f61a1454a2@oss.qualcomm.com>
References: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
In-Reply-To: <20260407-crypto-qcom-eliza-v1-0-40f61a1454a2@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CteRO5i+StFpZ/Hbkxhr8vj7aUpLMovvcEdfVXjBI9A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp1Qv4uXLNfGZ9jichnIdi4AfX/zJ9xv08DvHek
 JHOYEzvi9aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadUL+AAKCRDBN2bmhouD
 1/EFD/wLHQteB6O28x3jC4oi28Wvoi9oeB7SyHR8+wf4vIXYIko2Pbs+cCVwT30saV6PmaDFrRP
 JQztRLJVl7UKHAExI6KNotQQjLXzw1M5gAqYvyUEJ7igZDN61BNP6IWjsLI9pc+TrzRdtrBTtQ2
 JcHFzv67kuLC1d32kHOCpiJDcrnYqpKXKT0ysRMeUzZwAY2uLVXmtMwQI6BSFZY6shROpb+AhGC
 xDqWTgvAwXfnduBBFO8SyAz3oSHbW+i5tq4DZgQB1rSh3i59q8neo96kidatDSNoYmSkKVkIlNX
 wrIywMEOrBl3XzbEpMtBE0um2VARfxwCfsGo/sWGwA8xXSL6K+RT32AZ6A004q8ht/4k0ut/nvb
 jSsotAAB+XJlcBsQJxIhUPsYEohbPI3gq2H/292ney43KUKRuJy47Ea+MOOpU1mIXoqYMkAUZ6w
 0KzhehlSpGwZcq3OrNCm+/ZXYlABw2HKaBeX9g0Ta4FHHJfQx1f9KwFk7BOTvkKZJo/3m20UNp1
 OlT94ikQ4j8qodtuCoeYJTxl15T0Io9qvrx23ygJkewOadFMWyS79ifdHK3BeQuk6VLTFjfXP2a
 OruExZ3V6smu4iaX/kvmaScsYtwYfYaEZdmqwcKz11QTSLAvKt4lW5831JHLZ6fL6kkQxHJDzmM
 lCvLV4sjMIzk6Jg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d50bff cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=wJ7VZ_Z-PFiF5o5xSc4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: oHgJpuH6lV1iCRH9644ac77hS9UAC5aQ
X-Proofpoint-ORIG-GUID: oHgJpuH6lV1iCRH9644ac77hS9UAC5aQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyOCBTYWx0ZWRfX4ijo/fAD/l2B
 2g2pvir0XUhdW0xgLUwEMmmZVQ/VeB2KkTSsVWAycOWRVjAccWZ9mW+92JIzw16wVKFEsHd7rXB
 Xec9SsfOdfObopXK2zdUI3U3Il1ZbqEW6f6jnRjKc8oejTpZwIwdMpydKOApqLRpKrYMbYUCbLK
 Csoo6m6xVLGOV2L38C7JZrxE/r9it1j28pZ3hq2OWjc35vANJZ6SiyWZHvbzXOgPk1gXjQ3UP/A
 jbZMnrKvs5svwtq+vBzezM3rSar6j78qXyBw77Z2ZGA7N1CRh1u+XKnelaKpQTBTtliea6QXw4K
 T6kOcOFuCBeBDhIFdJMMeW2oPH/Hxn1DB5vlZM8tu9GGN4Cuvn8MoEXIMqTm63T3bcu4wDRFDUS
 oQ+LXq6AtMTXhXiAtIKbDKtUHieuzcLNKV9cnIsQZ9WtMvAP41HHKVayUh09oGovhN8CeUzISNa
 MXzN6UkWBf663B0+YmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070128
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102178-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 496623AF912
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the QCE crypto engine on Qualcomm Eliza SoC, fully compatible
with earlier generations.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc..8ca7b3257b39 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-qce
               - qcom,kaanapali-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce

-- 
2.51.0


