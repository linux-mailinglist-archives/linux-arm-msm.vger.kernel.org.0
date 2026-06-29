Return-Path: <linux-arm-msm+bounces-114852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4F0wDvIUQmpmzwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:47:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C62596D67F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:47:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WLCimOUw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IaHsF8vj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114852-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114852-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 877913001318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514173A5E72;
	Mon, 29 Jun 2026 06:45:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E543C3A1D02
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715524; cv=none; b=JLfZGh7eLY7KcHRIkRJYUHg9JchezYIab7NTJKQPbluep6ZiscnfXtIivrAjw1Ah/3Pd3wFzxJnvBwEInFM3hfw72j/o5dJ3SjA36udLBQKIClv7evvRvho/CmpAUD2MdmczSUS7UqQyIIijYjzokrL2btLB+gBl63L29GGBW5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715524; c=relaxed/simple;
	bh=dn0QrbOG/qJL5Pj+WWw2i/sCV3opwAw6wsixL8ZNvMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRAk2xigKFtSjhdmXYUsICp2+7khNXWbrdXult5/fSFcfWY50qQe76IgvAnAvIfyMUi4H+/fz677vNzrmYDyRM3b5I8Zcvist7KVsAHaqGYABOAqHs8iqXaMUw3/5GeJ7hHwuBpTjBF2cq7HfwO0alWHVfBf5AK+Lvhx9/iwjOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WLCimOUw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaHsF8vj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHRr1737513
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wg0phjeYuJAzt0H6//vmnVHPlLlmV584ynLqAFL10Mk=; b=WLCimOUwL2rA/sji
	/B7YjjllcgGb6v+5LZI3fYJlq3FppLz8K40aed+TwqMxR0aiIR4mk2gUqhQCNZQV
	AkBGd0AlOaRh/20o6yCk3vzfPOickXnjV84/oDED8BGgs1yxRrPCRG+jcUveU2ZU
	4RksXFM7s5kZAIw6Me35cwdBcsQwCrRg75HHRCeIQKPsybygzp+XHI+0Qq8Awyw/
	l2oFepcC9EbE7u26de1qWOCZxagu3bbwmJd1xEt3aAUkefT2E1j5VbwEfLdVocBC
	VJX4lQjSLioT+rs/Hz8ubG2+s809TAJTBxCbhudkmGVzxVM1dTtzmHTHA+n8ZVYS
	SkysjA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmynj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 06:45:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30e773699d6so1678434eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 23:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715522; x=1783320322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wg0phjeYuJAzt0H6//vmnVHPlLlmV584ynLqAFL10Mk=;
        b=IaHsF8vjyQ8elUCeVEb/MrCB5RBGqFfr4WB1CqrKBNnt9EkfvEZ9slCw+FpKpveMa+
         dDDYJrKD6VsxDu7hMPuzRWdbyTUr/WGGr7F2lYAlD5T+xz0HejTy7wUK8IpY543De1qV
         JVhiZHuClt4xyCymGZVgDhr1ZQsdHZt2hT4Xn8VLE8WOucZ/16xFbxR4JbSKGlPQW08U
         TV6UI8W2sN7SnTp3FMfQPz5UY8xWhan3VRXtQprE0VnJrxu0zjqriLZ/ReadQ1ALHxIh
         dg6U9xd3cByYMMZZIDzd/6d94Lg5o073780YaRyWSoCPLcP/U50FX2tN/ksblJ/gE/lH
         ZAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715522; x=1783320322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wg0phjeYuJAzt0H6//vmnVHPlLlmV584ynLqAFL10Mk=;
        b=giDbS9fewnJo/lJ4JcToMONSaWxOo0QUdaRbR2USFBKBhtBYDQGTyNp0BNGc4z4/Yo
         1TZbNV+NJqW698pl1wfec+6tKyIzTBRc8v75wjY8W0uvE3LSR7LtzXpUZiNut9HaBssZ
         ghRj7yKXwTggVArir+1vb+TiEyqG2yIL60S18Lenj+jeTbuL2S7Y3l6JODcUSM4GCB/D
         DPpZNRh6jI9vmrXLF2JEMoYV/DxnZ6u8nagoa9TIvfafZWzWEAogfos5/svQWatGRLs7
         2MERU5Egfd859FMe/V3tlIMbPm5wL3oNYlulSz+UNh9gGAJitX0IGClr9psj9WsiQ1qs
         Motg==
X-Forwarded-Encrypted: i=1; AHgh+RqFNVHDYSwB7t2nlZqvKQHOH+mlavP0h+D5TjYjkY10M7sDY1p3jERM+yJlSrUDW82ApWw7KQwubBiGu9LD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9dnqHbsXy9HK1Bp3PCaI/9sI4UHADqNuNJq9ZYpbmFsldJMPh
	8fkz6TzYhOICs/LdZkjxWrxsUf43mDBrJi85VUFfJDuAgnzgJtLFRt43a5WnwNZvWYUQP32FA7g
	4E9nHtCeIDjFko4i+8K7dRJ6gvhvJtrBW9CrNA35XWs75dR+wQfepTDczmK5z3xYJGluC
X-Gm-Gg: AfdE7cn5zh1RgXnGrbP7M1D6MVO9rbfM5eSCf9xkT18yuAqG6mCPAIk/val1XDS+ktd
	Wox078I568CPwVZrCXf1uubUIFBjRgATabArC+a5nsuTGDTK6UP5BVgFTKoTZUfwNo9dL3Ojbz1
	0JC70b9N/lvUgBj+YCvyNBIB5yVpLkaWP0QktncxfORwVE+kOwi7/IfyF54mjgAFPCembWap51D
	KfK3urk6z+KNsOMS0tdOF/6flN/N16lLpjircuk2JryguBuBRSEiYWE78BbgNRsIR1WP7zekGS0
	Se2iYAPIhzFgNT3Pl6LFIFF/0BD24IaKYbBs7utPCXGlTe0AEvCXQh4/8T4VU4Sz1hOq5/Li/XZ
	zlhpSNPSk0hTnSHkc6d8RYYtSACbY1d6rCMBGkN/Dt2rFdx6SJhX300m1BuywkQ==
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr1650420eec.22.1782715521585;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
X-Received: by 2002:a05:7300:ad24:b0:30e:cb91:659d with SMTP id 5a478bee46e88-30ecb916ac9mr1650400eec.22.1782715521105;
        Sun, 28 Jun 2026 23:45:21 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52d669sm43580424eec.11.2026.06.28.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 23:45:20 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:44:35 -0700
Subject: [PATCH v2 1/3] dt-bindings: crypto: qcom,prng: Document Maili TRNG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-maili-crypto-v2-1-f8ce760f71d6@oss.qualcomm.com>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
In-Reply-To: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715519; l=972;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=dn0QrbOG/qJL5Pj+WWw2i/sCV3opwAw6wsixL8ZNvMM=;
 b=BIK2h/4rF4ldwJ5ch+79v1P6T02xj813rGfQ5I36mSWZTK25sO8VzdvhDTOz+83jb3XwEHABZ
 h1h1nAx4JXPCVjUxGz07RJ3YYH6fZnzi13nVeo0ipay28uGnsNgaK0P
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a421482 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FNAlisUgfRrBHgIoG2YA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX7vUE42IDWwxI
 mD+MqW3TG51zuO7YApaRVpsULsunzullhgJqx2M/iFrY6m/LDR8Ye9g6CLYTGEu3lIW2iwp6FDd
 MeBjh9XOKCIIhLHjQq48+R8iXhuyIqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX3Lhu4m4TK3s1
 yGkqBpn0t5649qyOzXVfc2jwU2uhpU/5cLijQYQ/o5/eL+7YAruY6OPwO6IsIz4zmFpu9vN8mMx
 dPlnV18fU9ZkS4vu8EM3zksGHdIdZp6Byse48DcO2fmJ/A9gAVBKYCTKj60BDj+CmFnjszWOvxI
 rmadsOWQ3G2MP8vG/Lio78zNoAaYFLVj+3+Qp+Hq0eSTLZt50Tfwz1xYsDggvmoh2N6NkgIOI9U
 HfnTgnBtvwWrZOf9J36udhoWs/qwJeeYXUG94AkMZ55qOt7EpCDW9APk0aG6fGV5m6qV0ahjo0m
 Xx8ArGf5o5BJK22MmVMqvsgasSxT7FqMN0Vpa2GWJwKXoL48pIKyaAXSMEOw5UrAi2neHpRO70g
 VXJHeueJyoX979eERXqpQzGS37U/t/Kidxd3pNTskuUYiBFSQQ4IKY9Rzhu4qTx7OnMxvutC5nP
 XQEkfhphoHktWovpkKQ==
X-Proofpoint-GUID: tO2n7aiyYySY2z_HYIPG4_ALakpwNu9P
X-Proofpoint-ORIG-GUID: tO2n7aiyYySY2z_HYIPG4_ALakpwNu9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114852-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C62596D67F2

Maili SoC has the True Random Number Generator (TRNG) which is compatible
with the baseline IP "qcom,trng". Hence, document the compatible as such.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index dc270c8aedf3..6116289ec413 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
+              - qcom,maili-trng
               - qcom,milos-trng
               - qcom,nord-trng
               - qcom,qcs615-trng

-- 
2.34.1


