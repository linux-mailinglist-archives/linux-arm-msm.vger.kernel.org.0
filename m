Return-Path: <linux-arm-msm+bounces-103678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJIgOYLX5WnWoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:36:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46196427CB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 09:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD34B30056CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 07:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D50F2D738A;
	Mon, 20 Apr 2026 07:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAgE+gVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVPSztZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135F2765D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670436; cv=none; b=RntTEZk06zlg6uNx8dVZH78RdcfytzGiBdxltvgayKkyEQhGo/afWzBdSbr8UZThwztkKKJRpFYSANgoJA1r5ELUHZuyU+VQABv2KAZDLkWV5sxY2uFk9UynLQlZenu6ogqyh8z1aI5zd0jYJUhDp5cDQU/BXEyaM1lbxlmXzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670436; c=relaxed/simple;
	bh=CSaLB4+lx66rKWA1HMABpkbkL8JeBB916Ok+DqqthyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFwquszvP2l1cREALiC5/l/t3Tud/ozyZaV84MBBG1AeJPHrY8bXj0BmuGIClx9Z83G+O2D1c2zTqooBpyDN2bkCAnEGLrQHjvuJaaaMovHdM8lBovEOBhkSkd2JqAZ2XmbpJZU32SC5Me6n4seQ6VZmHCEQGn/V5+e0agHtcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAgE+gVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVPSztZ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7Wtg71532096
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KxFF83B13ERhO+7XgUP8mezEJV8Qj/w8oxH
	Q4pf6is4=; b=CAgE+gVkp6yzMJNwJqI8W93ABEOu7uZDkZ/gCGIPZVIQ6l2uVQv
	bxY48LDRcRNCOj9a7QAduHZI2cnLtYLMt/Hh+eUKI04ijnX+jKOi5LTZN48aNT6f
	7PmALc3DUD63qH/I7ib1Fl1nKxmIGqiWCRC0UWuJeLzPfQG6j+UghOFkeYC1U48x
	l6wVjJftxyXL6aVo+2UWaFSHm8pJ9F5uB28LaQ6qiuU6fjfD4l7Xp9JzkU8zCQKQ
	IAUGUlK7GGF/NuwT20PqzTZYOq/MHp/Hu+oStIpEh0WTFxGI6ha8b5SqFnUK6YaH
	cPoMH9foAVL0GudTyTsE0wMoCv29ui/UGng==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus00c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 07:33:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12c8de02a4dso2471313c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 00:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670391; x=1777275191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KxFF83B13ERhO+7XgUP8mezEJV8Qj/w8oxHQ4pf6is4=;
        b=bVPSztZ2d9V7WHdanAEDS59n7o+A0fhxx2iZJAd4x9yFlcg3oeFNbiG/InI8jtS4wH
         FbTog+zfpDGgf3hTXg3qZlWmmetsuPmemsHSjPWYmxvLCEQXCIazfOjyIUb4sfWHM8T6
         ovFPpBDNTLlpj0gGMBRaSUrvdoV0fjwLdyLYXQpREyCLSLWCGVBs/wku1kLRzEeF2dBF
         9mnbG0XdoDZc//SPG8ZqcT0v5FfWWzTpxJ5FSk/W6RSusFjfJRwkKRiOv9mF6hWEgsh+
         NpmeU/HZGcElNzSkeBlhbTwzKAMLgKFJCIwWfNj2LxmVGP1uDE5YHf4TjKD3VUq35pIb
         ZRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670391; x=1777275191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxFF83B13ERhO+7XgUP8mezEJV8Qj/w8oxHQ4pf6is4=;
        b=Lx/Q3FOOKKV/0my7O9VGhhTq77BkolVeaMqGOoy6ikcbUKjtxpmD2Yu13uFR0FNlI+
         sDHu6ZTlZDBswbLAoaqxVNKo6N7Oe7XafK134Iioaa00W1ieJ2oouudgFcpOpCwaFWhP
         8uLjFO8ay+pc6a8VeXOXhhqLzgCMh9o+ZF59rtTHyXkhgIe5req18y6HmwGNvwp6vHwY
         r2RyAgGAgVDVhkS8z7ZhQp0kY5SSpPQQLSFvT40IADQoRU1mO3q+x1fSKJ+ZFSPS6WuE
         qltDkfgrYk9vnu5vxd8259zC08QP4gLf5HxlwmGVUP7d9KFb4LnqLTjoVrvc1bpvPvHq
         7kbg==
X-Forwarded-Encrypted: i=1; AFNElJ/WqElCD8EYqxu81iP/fH9Peo05h0cGABY573pbC1XjdrPobmEXVZuY/j8rQjf5s9zMDX1oqDvjoFyU4QoI@vger.kernel.org
X-Gm-Message-State: AOJu0YxfsILm2AD9tAQb75GzYRgSoC+Xe3uS+qZyooLldjifUSdQWUI+
	57+6HP9rjkPwbkj9QbGaRlpk8DcU9MX8n7t1ajK4kPRgINQpiV7VbU86wtThKUuxgXXeUFK8itf
	WuxFRhZ48VNeBIXu8wZsznwntnKkB0yvaerrsO8v88mTEr0PFBxp/fCY9ncIieWOE40iO
X-Gm-Gg: AeBDieuHHcl8FXz0CaYdfni08X+8kaTLJaLrDPCkrMgYQgBJ6f5qrDXvTeVQlFgoxTi
	7bVraE/4J3CkNO4/CRQUAQktgUYY9FaJkMLIWX8cCktIMzvRRVjTGrwmrJT5frL+JHkhyNzgXxt
	f0v/dW+rbn1/i0gqGaZVZUrrFPgwgkA7+R35QOr0wnIeeim07bhtddE2NukvrNuHHWd3TTTptr2
	oEY5lazwmoPWjibaQosO1WzUyCHyR1hjCbtXmwuJ/p/iG7SSjrQJO1m8mxLHkaCA5vuubfsVzfe
	BajakJK8kFnVJM8twu+zT6+RjzgdnowXKNLX/vraEbi6jKHNtUmiN8yh0d80rewTEyMdTjc7ieY
	lZeqGKerxcurVKw2JaPq+3olQsdG4CTCoN5+y8cDhVLwXYsKp+e6G8qp/dpqxstsQ+mkhC6/ZWm
	nF8BSOuTdVlNM1Ct3x
X-Received: by 2002:a05:7022:fa0:b0:12a:72af:83d1 with SMTP id a92af1059eb24-12c73f6f6famr6516765c88.11.1776670390797;
        Mon, 20 Apr 2026 00:33:10 -0700 (PDT)
X-Received: by 2002:a05:7022:fa0:b0:12a:72af:83d1 with SMTP id a92af1059eb24-12c73f6f6famr6516739c88.11.1776670390198;
        Mon, 20 Apr 2026 00:33:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c749c422csm13714081c88.3.2026.04.20.00.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:33:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
Date: Mon, 20 Apr 2026 15:33:01 +0800
Message-ID: <20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3MiBTYWx0ZWRfXwi2Y+sbJMpFL
 vfR1z00ZhP4TwxjV68O8q+TMLmDRXghNV6SBEawIzoFt70bmrUSJfNufH9fYpp5or79nZaIW5aZ
 9OC7UmEbNbh8ucbJ6MzEQUS9aXk3jaYteYrEPh314tcERO5RFeXJ71AtV1MPqatmTPqULPsRm3c
 GR2VJMRHpE3BKWDBBAO4GQ4Gd/doWaWWhxeUPPW3uefRw1fVO6w7g2J6Mqvg46nLcGXnhM1VX/D
 nO5SDQMWzxqdGEOYd9gGSxKrk9HBC2/IzB5ZZ3aNTOkgyErFrRoyVUgYhDs8GmTeHO4vljCwPfa
 +jJfTarIC3p+bMthiSTHmAFdaXAjXb/55igkpQCQek1CddjF0wbumUTOnVZ8kUDnOL+h87XGRmn
 4UN6LXYsIgwmZpFrV+mWVK28QHBtloD9nY62VXvREr+skiffH2C3PUt2C7NahXstnTnd4f2qpP9
 9cfPRFzgJ7v5JEANFFg==
X-Proofpoint-GUID: M83IhdPEuNkKFQcjhxd8iSYqmDajt-Nf
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e5d6e2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SOTGmrOMbzj5vsbwRJkA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: M83IhdPEuNkKFQcjhxd8iSYqmDajt-Nf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103678-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 46196427CB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible for Inline Crypto Engine (ICE) on Qualcomm Nord SoC
witha fallback on qcom,inline-crypto-engine.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
index 876bf90ed96e..9251db2b8fcd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,eliza-inline-crypto-engine
           - qcom,kaanapali-inline-crypto-engine
           - qcom,milos-inline-crypto-engine
+          - qcom,nord-inline-crypto-engine
           - qcom,qcs8300-inline-crypto-engine
           - qcom,sa8775p-inline-crypto-engine
           - qcom,sc7180-inline-crypto-engine
-- 
2.43.0


