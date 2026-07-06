Return-Path: <linux-arm-msm+bounces-116768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jRmSI5SsS2pWYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:24:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E88AC711397
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:24:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="k/0wiCVA";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D1vjafZZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116768-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116768-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10DD733759A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E246421F00;
	Mon,  6 Jul 2026 11:32:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D341D4D2
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:32:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337547; cv=none; b=STFXDOCvxmoYmYyBvP6j3m82/W3Mdo92woaCca0ZJt+vPUsu7+6/griCUr/3PGeHVdQifW7Tz1K9I47gIJOWSKiGqAPtEdUD/GvdgiYRbDfC4MgLbYQi0cepqjtrlorbU+5+IhtVlX8Dtz/oVwUcOcJPZInFiQa/Yzoj190xYnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337547; c=relaxed/simple;
	bh=1pydzzpuEgb99srFhSDcm9R9pFLKSlB5QaWbAzMzsLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KVwgWBDj/8S4QJQTYBTS/X/A3KubsGzAG4xZ+4xVB+gHOs+Qq19x6gvAS0G7IVHs/oC/8KqzT/mSqrF3BqoosBVs0gfB8D+PTuNd6FOJSX2yaUOXDG84WUjYJZf/ocVGtyaZ3CO6IE9NXOcdwp2tZ1Jf9vVfecy2u+yBJ80Z3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/0wiCVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D1vjafZZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxV5T175070
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6TsjOFxinHMTdktlzXIAquk5+1TYhiyxBMyPgakzTtU=; b=k/0wiCVAxdc0lvmY
	AGxukyenVES+/EL/HdcZgGTRO1AxXjMyW1i6e72AJxhmGpx6vVwCMxyCBQD3tCSX
	MJP0/Z1xXwVUN0ddLQkuAJS7fqQS1r+aVrJ0tryEYgH0iCYNX6KnNdWht0CWdyu3
	JSL55dSaFtvBioX18YENlyF0MCR4G/kDj+hIrFJgUtPgTcJMLsH2+m1nIHOy+WHQ
	NeXrnnf00q32PMAIV7IFbmP0ALBSogjK6uMkL90MabD+/vG2JZV28IrPHmAmJuWe
	Q9M2aKcpHaFKus5eD8cocap0TgtWz0elN6nYIX1eAWgrKo5QER9vmzWre9cWnqPA
	ik4TLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxs147-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:32:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8620ee0971so3392097a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783337544; x=1783942344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TsjOFxinHMTdktlzXIAquk5+1TYhiyxBMyPgakzTtU=;
        b=D1vjafZZ6firn78uiedXmMJyKmPNNzCKHCeWcqgZVYERDtRUQ7fzb6GeN0HjovH8Uw
         XRaGrC+PZliIQA8DuQQguPY9PJCeQF3/gxsxThRQCWbR5GaLRVn64yL9+pEf1mAdkbYX
         xtBrzHrFwBeeIi2IBa3wza3JR/dyCaWd0m/TDyMqYiWSWMJkP/VIdOJrcdvS4ip8Ax2M
         69M5o5HY4EwnxPjFrDKEPXEsBxOj6aymcKzsIxfIItDe84VENJOrhjHeJnWNHSupJXHy
         Bbdtlc1gh6RvIJ4JEcXQUaGr0nxurXkEwBVsqE4gqbAyuUWKyj/5Ewp3MTqVR2yWvQs1
         P2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783337544; x=1783942344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TsjOFxinHMTdktlzXIAquk5+1TYhiyxBMyPgakzTtU=;
        b=JhfCM1Pbd0yPqEPIOEC5qr1M2jvj3LPjOfB+B9aIASETiJjPxdT37OBYOYcoQLFBx/
         FAkhii3kqVAkLMPtCHiJ1NNlm/0601MBXFjPJdipUOQxeaixP0GKCyhqmCGRKytyqfqP
         EziN9yxVF24HPandlksjCWaUXe3p8AvHZuVu4PFmg79ELnpjqNj3Fq09b/z3y87qRHwT
         hniEwF9fGql/Wta13ILVS4Yne4LnyuR0uunn/Yr8DF61/ssu36SdGWsewXZjrj1ZKesN
         26F6QoKKvmn8m1yTgsSYKinLMUyynmMoaS2ZH+VniLQfUDSvI+oPZ62QTrCxRPo2O+aE
         zmkA==
X-Forwarded-Encrypted: i=1; AHgh+Ros3UvPwUX5U9kD3WnGSnjfncLtMFp7GISiz9zVtbb3Yow139Bz24IzDEbCyCp5Dzt346dPhcRXGz89HVnY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/D+iplssirxu1Nmra73RxOMbsdjeJmA+42oHr7awH1kDvRyt0
	9caabRclXqvmSftDSNKjR26CmZ6T6rg0oQjluf1VfiLv3UEGp7mOSpfS4wuKKJgc9QxxaW/EAMm
	zzSnK0+AQ2VvXghbcygx61cVAmoH6r4YHhTDopJZiJM5PPpuk2pDg52bDB7PRAg6tbXqa
X-Gm-Gg: AfdE7cmN8U5t3vH2To7ggOFn1R9coFYvxOFtK5hPRciMlivUBMfpRp6yrM4IeSxqfvs
	D+tip/okkSlhN83zHRE7EEPlAqPdRiNXj/xfBg34EPxvyn26Lcf6feuDDnWx4qst1X+KjQGoqVt
	04Le0XW2FWjWddNbJQgD8na1eq77nX5sRl//zTo126xLTHL4Y2csNNMxTMXoXsdGbfgNwF9e1Ni
	0EAL4t3t67y2ZnzTZlTeS8N8e66JjxkK4bFKPJ27pvIKUr6x9cS4NLaeu5iZb6EfBfIQluW6SEM
	4JfpKt/pOrOAvbemMLsxhYSa9fDWgnoL5wlt0MkIq8KgaBTXLEdqMrhB+B03Smcj2RyQxy6siVk
	2Md1zGBa4vH/s+imV6aKFPHCEoVU7c/grfVG/2Q0OJtPT
X-Received: by 2002:a05:6a00:4501:b0:847:84b9:f3e2 with SMTP id d2e1a72fcca58-84826f0df14mr86385b3a.50.1783337544430;
        Mon, 06 Jul 2026 04:32:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:4501:b0:847:84b9:f3e2 with SMTP id d2e1a72fcca58-84826f0df14mr86360b3a.50.1783337543972;
        Mon, 06 Jul 2026 04:32:23 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm3576621b3a.55.2026.07.06.04.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 04:32:23 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:01:31 +0530
Subject: [PATCH v3 3/6] dt-bindings: crypto: qcom,prng: Document Shikra
 TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-b4-shikra_crypto_changse-v3-3-23b4c2054227@oss.qualcomm.com>
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
        dmaengine@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: AXQdwWSJMB6ocM2Y5WScM0pADSepEtCu
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b9249 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mVMjwrqIa5QPTF8STQQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX6YxYr3D4FHAJ
 oeqRyElXyAGUDUoH2cLAXKxXTskbNjatGx2Zq/JUn0/qx5uwdJ4Nr1duPP0y9KjR+CCXDdLf1Xy
 hF1WuQH9oGDzbxFc8WyqziFWvT3/YoY=
X-Proofpoint-GUID: AXQdwWSJMB6ocM2Y5WScM0pADSepEtCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNiBTYWx0ZWRfX/eHOD1UEzMgO
 oFmSqj599YMCeEOXLpj5uaxpyLDrlDr4QLhtLlGbvIxPO3bYDVzUq6/ek1lcSjRvvwEQ+sdwuP3
 NqqIwaxeIZep+7SVcLsay3+MEaDBMlCW4e0T1azy3et7E930L/moXwem+XJ+gEoUpRFxhNWNq1Q
 Y2wpaMP0nZTh59oqTjVxImESUWYPm7gM9L7CNEFxy7JtSwfgPx7NLcfIzYiHM91Y6LeT2jiapc2
 hHwM7qfnFm/8w67j+nLhhBHrb35Rorxx9z2nvTl9iwCP14lqyTOvnz1GzhQLJTcUM4kh9gEx1P2
 g6Z+P/KsLL7XYrxXfXlVWRNOkXgjQEcklct+mVqg9swmBBEquAuiMuiBEOPepJjojtKJsyCE3zR
 IBQOrmfarRYjxbFGYT72OGpAgYKH60iQe5+D8+PIkSe2ggmC60KtC84eFHsD6FKI4dVlMutiVmQ
 J4kd1yMFIxiGnkPZD3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: E88AC711397

Document shikra compatible for the True Random Number Generator.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..5de52d7a745c 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sa8255p-trng
               - qcom,sa8775p-trng
               - qcom,sc7280-trng
+              - qcom,shikra-trng
               - qcom,sm8450-trng
               - qcom,sm8550-trng
               - qcom,sm8650-trng

-- 
2.34.1


