Return-Path: <linux-arm-msm+bounces-115786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oS8OOpR2RWquAgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:20:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1C6F166D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TifYpNU8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gn8Qz9kW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115786-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115786-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9835E3067C8F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91FCE29D27A;
	Wed,  1 Jul 2026 20:17:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8753BCD29
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 20:17:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782937063; cv=none; b=B5t7zzLvSuWJpofP+UfD1C5psUUnc2Tc2R9d6wrd1DIEubYhTqc0nPO0TWGRW0HR9+CQioS2r2eMW19emY4U6t5ut10VTfNRY+hI34e/7A3cmeSZlkWz3YHuDwIbbp4fiz9oe43PdgifVtiDmVFWA8c7VqtJkkzQRfa0h2WCC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782937063; c=relaxed/simple;
	bh=fUfTQ+WGGqb9ciSQbpp28uE1qLiRFaDJmt4FAE0yCHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOmSluKlfzfSypSqBESRQk9ApIvAHCfVXmgu6gvL3VQOt7to2fMCPMgoElbWzeR3hFPvV/G633wc1JVRhsQUHFMcspy8FTT/msMbreWvSV7AsGVt8gUv44fDPSpsZ8Hhch7+T6PeYbiP4uHP0XPwl40otqeocoHVSdK5WkXWq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TifYpNU8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gn8Qz9kW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmU5m1630402
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 20:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hIELCf9duknysKswcBTO3BHzbOM16+pkKsWIvb8AmDE=; b=TifYpNU8yhMH0nWe
	tBrcEwKQl4WmWmPsPzppe1M5omDMVDtEt4HwlaKGJ5q5DNOVp/kEIC5QtbWFu2NR
	TeG9CwOqTU45vvqWFNCHozxviaQRgL8uBTVwD2583ccZiQCurwK3d8NfZs3ANUdJ
	SXMCboVQc81nWk1JsbIfPihFogNJb7V2RvQPZGGYIKpKq+XOWaWtc6LmIyWI1oZP
	ZjKT1sWwVgASZqida9xHLs2wVJEvKYP6Am8Ns97Ncruj13doGdmK+L7W1XcrYPuU
	iNs3i1+eMrEuqSyEB4bp8Vdmt6M9eubEL7u2TEi7pjC5wZBaiNd8YcPwKX+2Tp4N
	nn4tfQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mh0kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 20:17:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso1637336a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782937061; x=1783541861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIELCf9duknysKswcBTO3BHzbOM16+pkKsWIvb8AmDE=;
        b=gn8Qz9kWq0DFs90gf8cdEtEfHaGbaICONRbZHUYmZ4UGzt9Tm5tdEvuyhvtxElxNRv
         6MwOD3j7MOWPvu8A2bdJfEpfWOnarKJEq/cGm2dwSSWqvGsImTZAccuC684aArrcp5iL
         C1+gZ2T2CeDWG6uLHY8ATqmoDMW0r9BKSG+4liQ3/KTmY5+V5WL4hHpuzmFL1+8oGmY9
         sLxZiSFkcP8t50/stH76Cx6IZdFd0oGTq/OUtdepG9t9zpUkuQw8T0pnTvFZJ0BYdp72
         O4N5jlWt0KDNcY24kjKyi9+G8PpDsQB4OH9jygu/dQa+noqWJbfI6v7pC8M6rWivz8+A
         WbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782937061; x=1783541861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hIELCf9duknysKswcBTO3BHzbOM16+pkKsWIvb8AmDE=;
        b=mzrVz/kJKXxP/AV4JdA0MjD68EEIhRTepHhESqJ1ysi3k9oi3SQl69zg8oUuUzUqb7
         pxptWX+CB+BveIOmAjO/ovtwUG6nUE0PPaafBzxK9DMO7gcDeeqa8Y7yIW4+43gZ6Ktc
         f8tvOV0P5exfwt0N3SJht3tCnBivr5IwDQvECbaF/M1y6zDe34b2LpdFs9h15nHvS6Hr
         I0oI83CqL698sGmKKPi5waeiXDI0vfge/MNF1WWvXW9Pz9nmhMnuxDuTbDLlN0VN/aoa
         PqYraU3U4hL8pz8EvBIAjDgl4y+ywx0ZGTbcJ86Z91IxiNq8RJI6eprZWOenfUuUL6l/
         MFqw==
X-Forwarded-Encrypted: i=1; AFNElJ92blEXG7OShZTZ15PxSTQsPS4Dcu0tfKq5u4vaRUkeCCxUvJlLgAT8A8B6Na3JYgAbVR7a9bx+TUEFA1M8@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHDwFOtyg71cqcr1jR6pX6TfCLoQseoHwdyIT7O1Q01y5ZG3F
	yIOavpxE84H4sPWAVnBTyGoTZ6wAusuS1CJ6mIzsYabfZObupipbeihhOjyDmA+aEY0IWnFdafw
	TShSls6klteYEMcZ/Yi/OLORxh643rPnEeo7Ll4486Gcrt1Pznl6b5GQ1jm6QFvJJ1vF2
X-Gm-Gg: AfdE7clqZvHcY/g+FjtJ9YIjDKZfjeOF4yL7QCl38n+lqflh12WID4ZZLOhbSPALtFE
	aCi7JR2y1MIQx22oje9nzTZG8tTdv8ewl+SfvLjA95X67/WmqdH/8qWxsI8mxBM30+OvpLaJWj+
	4pFEJ/1OQ4yZF1lSNKPB18E0hJhJSt1T28VHe+0+g/ALQUbPPkvoVs6R73QwVIQdSBrBLgQiIAx
	0PUXLYuMSIYu2ktqcOVbIYEV1IPQRT8kkGz6HHbrAbFUS08nUktwr+T3Fv8lxJQJSkvN0wl6Z2c
	A3qcMZR/Hr7+JydPXqOVzbhYIASYMtT/jEQrD6nHnA8+CuwrQLD2wCmYzfM8nI1JwUvYP4TAkzc
	uEAI/46LpGRZ06CYgK0okN4Vd+rxOAqw+M6QC8YqRlFbU
X-Received: by 2002:a05:6a20:7490:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3bff42828a1mr2740851637.40.1782937060626;
        Wed, 01 Jul 2026 13:17:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:7490:b0:3bd:203b:b587 with SMTP id adf61e73a8af0-3bff42828a1mr2740802637.40.1782937060021;
        Wed, 01 Jul 2026 13:17:40 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc79231sm948685eec.31.2026.07.01.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:17:39 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 01:47:12 +0530
Subject: [PATCH v2 2/6] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Shikra ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-b4-shikra_crypto_changse-v2-2-66173f2f28b3@qti.qualcomm.com>
References: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
In-Reply-To: <20260702-b4-shikra_crypto_changse-v2-0-66173f2f28b3@qti.qualcomm.com>
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
X-Proofpoint-GUID: nmOy4pq2CIdEJOZYPOsJKtnN4Rlo3UqM
X-Proofpoint-ORIG-GUID: nmOy4pq2CIdEJOZYPOsJKtnN4Rlo3UqM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX/2bFjLuxebIi
 QhOAeyNa/HjeOfXqhS+oFsWlZ4x3Y34cWg39r7YbjVYrdu7f7RZRGcOuqdR6Jh9EjoiBqKEkop/
 AOAOc/BfiXdhaV970QlsfER+vpgWeiXtI1+bYVKeXpVPVyFWLIutKRUgpoyHiqKGHTrR2CNOps6
 +fwS3EqJ4yG+dAAzNWgQlWUOhXDEv7um02m1mtcjQUuXFqLruP9pJ+nGjSO3wi4ugCNHJ+59WMq
 6Q0tuaKK5HpcJIrzv0Tol1gN1B5XCFfcL5pmgN1tcBHzIrsZwHu0S29RhrtnlJ6sj78NZeG3E7c
 BzKLRX8wmEZoQjS+XpbdeiAdSWSWRFnYg1oys8TLsnXrbMLdEZq7QAIFpDIzcrjopAID53VnKBH
 mjU/KBtVg49wAQleEZvm5AWkgvNxxVMt0WzmB9KOz0OcZI1AfZ1I4w4s6NmNiAvtuXyAvjXnnjE
 s/kjN2oL3eLbCVteS7Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNyBTYWx0ZWRfX6SVGQl95LS0d
 sn8bKMuuA9cjP7a0ihhZU/deZva2l43915vaU/JvMdvKUk9C3671jg75lLEBNObDXvT2+x99A8O
 YDJXM7XBtm4IBVgNK+oUhL95/K26c8M=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a4575e5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qMhC6LGQ_1aKn5J9HqIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qti.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:harshal.dev@oss.qualcomm.com,m:vkoul@kernel.org,m:brgl@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@kernel.org,m:agross@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmaengine@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 85E1C6F166D

Document the Inline Crypto Engine (ICE) on the Qualcomm Shikra platform.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 4f3689a24410..9e6d3af42971 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
           - qcom,sc7280-inline-crypto-engine
+          - qcom,shikra-inline-crypto-engine
           - qcom,sm8450-inline-crypto-engine
           - qcom,sm8550-inline-crypto-engine
           - qcom,sm8650-inline-crypto-engine

-- 
2.34.1


