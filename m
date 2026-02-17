Return-Path: <linux-arm-msm+bounces-93066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIrWLnkelGk1AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEF8149617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D20D300844F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9BA2DCF52;
	Tue, 17 Feb 2026 07:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g93e3sep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdZt3y0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3F2DAFA9
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314764; cv=none; b=LeIOEBjAYr418FQInYXY27RZpXHdcERfgdyzhpYAFj0OAE3nMr/PkOlL5szPMLC5odsnHjxXY67jvruw8VGLbkWGt+lro+ZVsS2ZG9K/jfFqJ3pquQAnQNi5ius/dPYuzbMcMlAZUnpcpvafLcaFOzDSGVfueEVl6N2nXpwRE4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314764; c=relaxed/simple;
	bh=ljNAanNsQX3haUgfK2VNArM8xCcxc69jvU1l9y/w+to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NNKkCV9bfeDq+4nBNF0p0wKStiG5IusRcpHYLpF2LotsaXH2gKCF6ID+s9qoo0kUWX6UV0h+WD4Vf3abJPZxjQPWCZI2HtgWY986bQTCsN3lSNJhSt1oG4bcyQqWDylAinNPQ0f5T5Gs5UZU8s8GjruE2ToAsyb8alXSj68UNqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g93e3sep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdZt3y0s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GG1dco048739
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=; b=g93e3sepjWrNTdhq
	/KVLdzNZiaWehs0tpxuGBjv5+0uS3LkXr1LZbeqzjGBIE914a6JkIXDqv5maLfvX
	66WHMwfS004FDtnb6riOiKvwYRLzD0vhZuf9Fd2T981Rl9m0GtyPLQDQYH5prz5h
	Pm7liXqMBHG77A1dxf7wdISX8NaC6MvCVjEuPnrgtKDB2LVU2IzokOQhC5QsG6+N
	lhCc892In4brusw8D9lRv1ZjodQgQpGj79mNw1Ym/vqEP3iWm3YQXEuvTlRN8EP3
	8zhu4bZlJhYIwgxo7HhIot6hHlnmMl9MqFAH4TQM01PPO+kgJYbK7KLOTyi2VJza
	qPBeFg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81k82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:52:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f4dcef67so349476136d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314762; x=1771919562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=bdZt3y0sl6tFonuaXSmZoh1fPT5+nd7KYUhDCqaJPxyBzDlJ75Q4Q4iyhilaUU/nPn
         8DTWF2DUL/B/0S3gZ4H2MHIFm4xxG14AkMoghNGVA9ioPqIpwtpRH9+gXKPuVw4+HZ5k
         NScA8u5rxX7DIAvVnHcw3VE2wKmDllLI6rO2B+lCv2iSpQOC0cJXy2wD9ox7a3guEw6H
         5u3bQUGLvpro/fUarL6oplwCvBmcSEOOLI1laq6vuBtKWn6z2fQxlmKrjxEc0isHaWUo
         J8EcAemw1DyeVQgD4ShPYCoF9HpSF+a+vh0RnFeiDaquRzYVFDveeSYsE+CGV62lG1+q
         7u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314762; x=1771919562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44Jhd6TeZL4PPKiVLdK78+OKBcNZjGbvEfGHis15NrM=;
        b=e4kGvxd3PcLkY5rlEfNKga37ofDJ5nOlthKd8Aa3BCxXSas0SkNGK4RM1ZBRMFzFHV
         6vkB1ulhhVELwLCoi6aRqHhVX/H0pMe4VbE6f4XHy3zTp4MCj28eIcuysIQnetrrXUJD
         nqIX6KdU76rGp9UXD2CuYhyuH1oD5mTSwuTxAwZ1vVkYHJXVErTNALeLLttvph7A0TxS
         fONvrEL+QktxSI/XIJww/STM8x6wN7Hk9aJtR2QvMNu83G2gRahayVrWyS+Ph8X+H4Hn
         yLlh/7agpgyhfKZVFOV/HUeipmK6GidYrPw4rcbMOgF14wpkfv+EhpgjzoDzpje4ye3h
         0YrA==
X-Gm-Message-State: AOJu0Yy/Ap14lVvxh5jgPFuIqulV4o7R9qR2LMkyLNNoRXs9Eh1mdctt
	Ec2KgvT5VbRH4RdqW6vmMzzO92tivgDp855JTeueyeSJHOPlSIfPhyYlJm2iU62dgNARttiWA5o
	fGCEgZuxc068FE+36wrsrJomGpVvkOjAC4Gt6HQtuhSsTHzpVXNCvKfWDuzUJgm4zgxaN
X-Gm-Gg: AZuq6aIYMJK74Z4qACmeZWOitNfezfWtxUSyADsQOSD4vztD8Z+XhDhqvdfVxyh1oXS
	cy1hhWFf4ZTGl8MJv7l3V9l/iutJD8OTYjIiw1NOJDO46LC72xfgzu98BKtFR3z73aouX+EbOnS
	FZd2/rAz/4eDHfD7+WLYsHx9Pbxp4lYD7RB2POkP5NORgYmIur39Cd3hb3RHLpGxCNZE5fCon0h
	u3cqh2P0zVflZk61h9fJOhcENI2bCmSwH1UcUtz6lZPU/yRhIv38pgL901bD5loFZcu0f1/uFyd
	57T9igNuTb4gzzD8KmcaevKsykXyBnHhoHHNnibUmThxGzN5ACpdcpTt0Fnw7f5TDOsVhpPPFDo
	86DRJoGJ0FjOzAQHEkzmBPcLPb1NkWA==
X-Received: by 2002:a05:620a:171e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb42412460mr1479044785a.46.1771314761545;
        Mon, 16 Feb 2026 23:52:41 -0800 (PST)
X-Received: by 2002:a05:620a:171e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb42412460mr1479043085a.46.1771314761032;
        Mon, 16 Feb 2026 23:52:41 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29860229f8f.33.2026.02.16.23.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:52:40 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 09:52:23 +0200
Subject: [PATCH v4 3/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-eliza-clocks-v4-3-5d09f28d4251@oss.qualcomm.com>
References: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
In-Reply-To: <20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=RKCYGsJFqEQSzos+9ejqQfu8ULxnCzq56BctAEfqjW4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBplB49QQnlb0qw1wGUJvCx0m/XPk5jwp8b9dPRN
 8/upQ3/mIOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZQePQAKCRAbX0TJAJUV
 Vi42D/9C82yRRnYnVLZBdbzrEdqD6mkCuKAyOuynWjTTRKAVEyAoivog70Ffk1L488gt4nP9E4z
 PEXTRo9F4J3Prcit0au2KkXuUpjG0xzWf5fcIA+vlxngQ0kGsDiLFuZWNfocO9s7yX5ahGiPjxV
 m7dIyeX7BgcMeEIPm2v+CVlWs3/yfM6bURBRUarD4P/6+Y1r8jtzakMKQazN4H1FJAT9bUx0M6/
 57jDkOvL7uNq1gO5xKMLoHzlKO/byly6DNWokzm6klWqK6UTysZoty0md5RiIbhEW5eO++NaBnw
 dtrdgIWtojglW/z9w6QeCo7q2ZeXZlszgE9t8JC3DNvGioJZM0gokKyjjocnpSkGu68izmbjkYC
 FSESYFblO6VrfTJCI0kA+AQHKrS4XD+YkGH30UT5FiDwNak2EXNzgBRzNx5mrf6paLV0tgfPfve
 QxOasgs9oswe4A3u/DKRhOn34xrJTaf4RR7TfSIbFrxALCPsAiTVNx2zQnhLneZu/iF30s6S7I5
 ZBuFqJpCde/QKB/F0vkJ1d1wmMdYZiEgnke1uRT0ufd3mwhArelx8IhiE8bzbsqbLTMlPaq8p8D
 oXfEUp3151rak6cVNTZtVaFr1MtlhSUbSBMdBKYZ4SaBUu75Czl1vJf3o0bqARSO900Eh7QUUO3
 rj1pM1HemvJPc1g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69941e4a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PJhJesWDv2iQC9CHGcgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfXyqxMjG6bl2CQ
 k/U5BgFWjWxOg8rRyORtLFxrNmqdlnPkHZAQfgLdKLvqsCT2gHbwG8UyVTKhtKiUGBgRJoBWJ9t
 /X7C3ttjiZqlMYDQd3QlD0e8LM+vMgMmjPB3LRHEnAZSDgJFRZ5b1TTa0vnlqSuwfwbGOxKi1qI
 T7WuoXS9YSCiRl17xB1hC0Z8B12IhoYWgOG76DJAnxX1aH5oHNVVPTHYSwpNZGEkR6sBvgbqKfy
 J/MwMeznfSbycLpCHt/M8F90Jk/WH7SAkZbL4gszDgdiRxpihSyz2ux23LoqgbWuiWuuVyZSD+T
 C+9C/LHEcxJzC2FnEpoAF5VZs7MchMq+mP30k7tu/nGd81GSuVlJcpI3tKXSYIRhhamvhZwmm+4
 x8kHnY8TxWkkNGsKvDMuvrfa4KlfZi9ieI5iPvEtXEJhbswGQcoRJt+XAzR6P43p5bo4STYVJkK
 GUgdcdtBKq4PgfqeYzQ==
X-Proofpoint-GUID: iDzyMcZoOm4Igi4birpUnMveUfPpN5sP
X-Proofpoint-ORIG-GUID: iDzyMcZoOm4Igi4birpUnMveUfPpN5sP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93066-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ECEF8149617
X-Rspamd-Action: no action

From: Taniya Das <taniya.das@oss.qualcomm.com>

Update the documentation for RPMH clock controller for Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 3f5f1336262e..9690169baa46 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-rpmh-clk
       - qcom,glymur-rpmh-clk
       - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk

-- 
2.48.1


