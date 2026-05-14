Return-Path: <linux-arm-msm+bounces-107632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKT8INLWBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:06:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D82D542C1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 16:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 273FF300B5A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 14:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A2B3F9F3C;
	Thu, 14 May 2026 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hmvhyae7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDoEy0I9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6663FCB29
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767556; cv=none; b=JJkEJrODbiZFZZEhYycLMeswD5G88GteWkrOOCR09BHdXW3BIIavbNG7MGB9THTaX0KSBQMJ2GPp93466LYKfOGdGHaO4T4ZyNUykaEBNPjqRVIWIQEBoB4i60aPrE+HQt8pbjPNmGni3I+yJ9/paKfONBe34a9kamdR6ceJFZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767556; c=relaxed/simple;
	bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnVC8sqoR8Jb5GsKzsojlVL3v59hNfuXRKIKaKT9v9g9l5yGZdbcI8tzzQX8kKxtBV9qfacMA4VSLL/QMGR98oyH18MB1Hx6w7m03gjyJ4TKG3sYcYqWYdqDqf/eba8RoCAV1msd/Ra6uumiKFO3dqDxEKXL17Hg6Q66oUORIww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hmvhyae7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDoEy0I9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeTlR2241694
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=; b=Hmvhyae7gOInviTr
	u14Omp53WCI2Cuh6GKq0s36OCSb+3So98ytyqw9hHUVhNUMal8t6CWhn74vf2u4R
	9sevqb/AuDfcgLbEZzLMNnOg7k5p8+fVht7Dr2SlseJoXXUh4iPrSCZbW+Gr1h42
	MPKxxG5DYM7bEhA9rZ7Ooll/jV6iXDm5FVD5UB25L2asBkYT0UvVc6bapiXtNnf7
	Ds/RxEPD7Bp+Jx+XoCnTV8XWNHppsXVTjPxMV15bVVIaezNTSiv4GBUem3A9wuUT
	z3tdVElH2zHu+Lqit/cSYU14ezsb0zHNPNtGTXPZEvX85dKEMrjglh57/uJn1LJp
	fXBmzQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gaxtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 14:05:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3662990c03fso5646981a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778767554; x=1779372354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=RDoEy0I9c+9CS+JTsEvgoLYJcndl/Xskh/QM7TLbeY0b7Jjku4nftfXspEwxqEHzmp
         zPo8HUlMrmar85vCjPHD18KTFGsQmKnNBySt5hd1rcywjQpURor7eg5ogl5yVJih8G+a
         g/CRyeJSLlGs+V8Gpjvz3oavQHT4R49+BonKluGJ2QqK0OPX+xeLTDsMW0eLWTlQTrmh
         hQUPavRDqpAQrvWNXic8RJqA5ec+Y5+FDzoPL7YklYdfkZ73Sq/EbXffz1t+ck7HKv6m
         Wm1rO15f+5jQ7lZZvW9r5qHTPixBf7UZYynL8SV67bYQNORtPB+JnhZjmHP1GMceQftc
         PJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778767554; x=1779372354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=XcmzXH2TSPXrt3eJ7WymM79eCE6ixqJ7jrHN11eS7xoowkuxibGd7PSQYqMGxq0p3z
         Ndt/Uz2wGnLWrzXZ/YDcYlUSvnGIXTp1nWt2ATPeGBAdRLSCndkUqLwG0HIv6cVJZ54Q
         vZVRTngdOoZ9nW//IdtboaiLdSYvHx7/yG49JurokHksUHtWRIqAI/wn37eMrYrZ9s6Q
         fULnWsHifRpFPNCmKQtyDUoRZynMmUgzOjJkwseyF6fBzQkmbvnj8cc8OkIXZCyzk+BL
         ugjE/KzG0nIB0kCXPPKtkcshQJHxsknpEhRLcQIDwhp3wQ9pWdyljLcundTsbrVOOMnJ
         EbfA==
X-Gm-Message-State: AOJu0YyMuMbDVqVz8Dp30K2OA9XOwQf0TTo+T3yIBsFhxZW7sxJoQhat
	XPFc0JhBYZqhmfHODqNgwsT6iTrMSU3nx+isK4RNeoAt3kEyIsHIkc4bbtvTzA3Y6rIfebiNxGU
	Wim1vQIcDzC1h2eMj8pVaoefw0LLk6I9oNhsTKa/Hi+e0/p7DlO/B84IJ6d+IdCCCijVGLo2T1l
	E=
X-Gm-Gg: Acq92OF0CFzciX9X3S4NOQLQUmBHEwnoorFf/FeRlL88d9+ydEnK3fK8rBed304zpbp
	Kb7JmxvYQyTqfGR2W3r2trTc0J05E9nttyJfofrPVB27vxpeVysD6UBLwoyazX4axG33yOPyupA
	cVZfAivd8R2li1ZXI+tl6T76BdCLqFNcIfRJobPYRGcO8+ifaK2tDvK1+l/ESiTvGgelkHhRiCG
	WT4wU6LX9NiPkzzgxh9wTUr5iCpmfX//2aBJoQj7vxyhISrH3mZpU1eIQgdetYB/DCJB3LjGFnQ
	r7WVGZWa2rGRUpzfCgg7ypuSQQAyeCPAMQPKRfQY3EsgJY7HxyNlOP2LUiaixXRvjzcX63IWOj7
	qPbzn7d5X5O7bAhvtmY/gMIIPP/KagMBATgEXSTRmsAXRMjgOW+s=
X-Received: by 2002:a17:90b:4a42:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-3692345e3eamr4061903a91.7.1778767553948;
        Thu, 14 May 2026 07:05:53 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-3692345e3eamr4061856a91.7.1778767553407;
        Thu, 14 May 2026 07:05:53 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36928a8c1fbsm1502813a91.4.2026.05.14.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:05:52 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Thu, 14 May 2026 19:35:29 +0530
Subject: [PATCH v2 1/2] dt-bindings: power: qcom,rpmpd: document the Shikra
 RPM Power Domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-add_rpmpd_shikra-v2-1-20bbd37592b0@oss.qualcomm.com>
References: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
In-Reply-To: <20260514-add_rpmpd_shikra-v2-0-20bbd37592b0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778767543; l=969;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
 b=KipiXPGoYtvXA1TlrHwmk2qWj7MfBtpBdSNtWn79hI5oMFPG1WGwcfCjBA3TmLlDm48PV2Td4
 Nm9sS3CWwVGCM0pw18wY3j9n3umq0ekHPzG50sy3avvaZj+tESJlGgr
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MyBTYWx0ZWRfXzH8misEeW9m/
 fDo43pyQhGwP4bhuN3j/Igtmq6XPVHn1scIztAQXraZ2Ef6/ASwFuOOyJ2g31wVUoJvx2+InTK/
 D+zdLB2bINWomgSPxK0HqEaRDnckay1KpZcT5hHVlos0e6YlT1F/5/fCVnRWZ84IvkBVa+SCllr
 GJXDeiwoZ/wA3vE+MgvdnOZicDHy5Oq/bOSl9NNREbYNjv3K1I+JAc027KUi6V5BU9GNz6BDGAV
 pOD1Ec6VeuOI2Pc23zl9AmzqX86wZJYMGbhyR6hKot5J5akbjL3bTB/t0mCPYkmw6CqJ0SDzXXa
 CfgQ0oCPohBscLJ3DyF1MyhtBW8/fD4/vHXVGgS7kki7PQczQ2GFIa+tQfkbrQteIiwEyaLz1AC
 sjC1whDiJDyvtjpz8pErsswI41FRaOnLszQAJdXpUsE6PUEDGx6uhfTNNY+4WO4cgg2oK2uhEpF
 zjY2qlDCR7SWsnf3RLQ==
X-Proofpoint-ORIG-GUID: aIgI_a_GJ5d4tRQWLeiluCbNJ3tX6OE2
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05d6c2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jkam1OttE9FODJyLpI0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: aIgI_a_GJ5d4tRQWLeiluCbNJ3tX6OE2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140143
X-Rspamd-Queue-Id: 1D82D542C1E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107632-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the RPM Power Domains on the Shikra Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
 - Collected Reviewed-by tags.
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a99646c0325b03fc5b3297ebada21cdb6..1abb4b733fe79dfa267e953f48219093ad759330 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd
           - qcom,sm6125-rpmpd

-- 
2.34.1


