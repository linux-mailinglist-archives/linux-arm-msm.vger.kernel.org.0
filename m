Return-Path: <linux-arm-msm+bounces-106790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMmfJv/q/2n1AAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 04:18:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53D50242A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 04:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 744D2300B119
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 May 2026 02:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4698023C512;
	Sun, 10 May 2026 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bOhaBbLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIQuA5Ty"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9341C2AA
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778379509; cv=none; b=ka64JN/bci+XBdZoc2T+fIS6tQdSCYGefFrwvrnhWe6pWo4vpGCiFCkGrUDK12laihueLuX5FC9JEr7zOa/haktszllrTenj31FbVnLcnMiIanyh3e5RpAhq9jyybzYofBj5d7yj10Y5niyy0BCiM+10W+fN6yWnV5wi99PRJnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778379509; c=relaxed/simple;
	bh=/V7DicQaZr6wCX6VuoEC1W2T0ZF12u5EWIfNyRIj0C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prrBze0uGxcvJCMX+Lz6Z1194Swco8/jCNImgXoGiyIx6rze6rWBgqXO2v0MeuLDkzQWcvBHeeq+SPxBdwui3qHUvpRkVv8udiF3rgGJ7UE0VLzS/lAvLAN1uhQRw14gmK4UgSikmW2IWxdBYCYc82kseo2NZ4oek2TIjpae90I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bOhaBbLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIQuA5Ty; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64A1e3p31000216
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NW4bdPppQ8oWlykcUk/k6r/XF/JERaCkDWt
	baw0Jne4=; b=bOhaBbLn5ilCXS6zp8NeZ5hyq12qUhYUl0S+iDGYpVVM65pD8TJ
	LJoHb+2x7s5jLVGJ8HoEFm+vpeOm2hxnVLWOKEurk+GOBZfhPCrr/C+HCY+NXDOZ
	XCEGnovlJTc+a8sRvurWJS7buN2gkEIqgjgVVwnvhu0BX1MxJufsoEv9l4H5dxfn
	cw+7OnqbUiukNW3zf4W9wEfzQyp9RcYeyN6VcpOTNEkLU9uRaoTuQoB82TAx+pO7
	XhfaYbzU/7V3gxJOPNlPHTIJgGJ/tzj5/PpaLrh8L+ZjKFiwUwbrb9xN7dcHCJfK
	uaGVnhg4eaA5UDLQiVUJ1wgFUCYIZbWa5VA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1w0uj2wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 02:18:26 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2eebb099efbso2721142eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 19:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778379506; x=1778984306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW4bdPppQ8oWlykcUk/k6r/XF/JERaCkDWtbaw0Jne4=;
        b=MIQuA5TyeSxYwGr6P3IeAMym4pIL9CMFQAacYwZXT+6mpfs2ssa8gs9lZS+3cTZgAe
         NFgIK+pzbJ6NCtm0C2D2tlj/GSWwhtbh0zXpABSgAVulrS5og8L9T6g4gXVqVS2LkO/U
         j9bO1Qlt4nD8+7k9yZukKL3g6gOBMdgwXE83Kw4gFtLu4313CswYDKeESzy9r+s2UhPX
         3B2DXxFaf4ci1ztKi7vzG7Dv9vELWcHC7rCgGv4jhIw5ik4DBVlctjW7Blpvq5rsxWek
         DG/SKgM69lAeIq+r1YyFWw2++Ac+hL3HT2TYqgzcExqbxBCvQ3FcxmrtjV2nDey7MJyy
         DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778379506; x=1778984306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW4bdPppQ8oWlykcUk/k6r/XF/JERaCkDWtbaw0Jne4=;
        b=BCatDcP+NpWrePTqkzTImOiDBID1PcMBlbAHwx6gLg004A942YmQ8/bJuX2tYOGd04
         fNAcGk0rX4vYLKuZj16qYWp6IQWZ5sbL6yjcyzIZlWY+UmF4buxr5IgW2yep+ZAHu28j
         MCFnoOF1L/puKHgDCa74tk7OE5w8Tkv7IwizQcYZVjHlsCqGGy2cf/6kzUH1hw925stl
         LrjefMWMZt7mNtTMQlFtH5qGP26/J1vkArUBWwCd4kWGFURgUeaokhZng2fdaNRJ+7EC
         sD1pMtEKvImGwqW6fQVCUM2PCao73Hb77qm54UjD3PLakRRcKqvrPYJv1EiuLGWCcFzd
         +1Ig==
X-Forwarded-Encrypted: i=1; AFNElJ+u6U6uO5mUrgrTn4zF9Pox+U5ksOZgQFCuJRPy5HE2bGbqzJiNVcoEusP5oKXOaZ7t9fcmNSerKiFaS2az@vger.kernel.org
X-Gm-Message-State: AOJu0YzWVXQqSEUGyxvlMYKFpeM/fz3VgRSwTfGPSk+hAgthx+QIsfFh
	AHnOGJY1G1rGj9DzUWdoW7tYMyLpi55JnFMnrBYJKXwwl6MOIm8+J1pwSY4VCwRLI/TUWqno3xM
	0psjutBQXr7az7hl69x3AVbLTa7oA8dZQ0elnmfcNXiCsPEI3rt1/Z62u+2xjjLZZ8wg10cfWNx
	Dj
X-Gm-Gg: Acq92OGlV6GtXFRE9MFHOhIzyD9oItRKYSh1wGCS0dSCsWQr+RmCovn0RNMI5NM6g6B
	ev/hpNOKyq8LJdS1lJf17DjNQj/ghYqpqxH1eB2cCRvfhcsQakoaDBrf6mhmpbH7C/AbTuSrrVf
	Va0gavKGdZfC1FFsNvZCSWPPUn5mFI4+Ipw5gHAjpAN239C/BmNogIJAFMbd8sijLQlhbEvUHG/
	qZLlMPPWTO9VuvKxQPNyxZQdcGkz/kxRnudhCEkVWbR1zOjLKgvf94ENH3hQZ/Rs3GYRIag6prr
	oDJ/grih/Iem09fGliQa0A0zYYKr4fbpZzdF8cJdY6OreKUq+YoqnUOVH/liFg3uOSbqIdKuqrO
	wMHKVKdFceKWROfLm6iR/57Od5Yggc04sBDps6PCnlwK48oGGMen2Xvex39HupkAuD1kz2GB/Yk
	owPC0QQA==
X-Received: by 2002:a05:693c:2c14:b0:2dd:6937:79c8 with SMTP id 5a478bee46e88-2f54ad730a3mr9259971eec.5.1778379505648;
        Sat, 09 May 2026 19:18:25 -0700 (PDT)
X-Received: by 2002:a05:693c:2c14:b0:2dd:6937:79c8 with SMTP id 5a478bee46e88-2f54ad730a3mr9259959eec.5.1778379505174;
        Sat, 09 May 2026 19:18:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d429asm8333538eec.12.2026.05.09.19.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 19:18:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: crypto: qcom,prng: Document TRNG on Nord SoC
Date: Sun, 10 May 2026 10:18:09 +0800
Message-ID: <20260510021809.1130114-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kYM96g1k3F_1oV7PYKJ3yGkuuI5EkZ9i
X-Authority-Analysis: v=2.4 cv=asaCzyZV c=1 sm=1 tr=0 ts=69ffeaf2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WCKKRaTC9nc9FdfpmMsA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kYM96g1k3F_1oV7PYKJ3yGkuuI5EkZ9i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEwMDAyMSBTYWx0ZWRfXw3M4miFcR0X8
 dxIKgdpBJ0Hnsd2jOOUsv6Ed20LE0BWFux5I2lw/YTbyGJRoEcAKY8Cw5m8xoTJO8Oa9uHaRXh3
 RteOWm03k597yk2dmbrnaaNsRfFmOD8LHVT6Jm1W7xiuxGVguf2LcXag0+bo6Rn6cXunE1b9g75
 Qtg21uYfMbD24GOeSVIk2NRP54+rHy76JB8GSBcltyJRz+pKkQwO1SQDCetVfQChvoRWr9INVko
 ZGROrgMNekdkSEVBLj9DdhI6COxa1uRjLQlxxpXqqAGWb+2pogwiudgwGQnNjm2KuZHQhYL1TPr
 Bh2VvIja5HsmnCoFssyCsmJ8GkAYMGs86M806+pVSSFEOfVIidbejCpOB+OeKR3CZkrbAMvbrOL
 ef+n0VmZ6otN3M1nkzpFIa42zrTMvHEYAKwBd6ga+Ox6+Cq18vfiXjl6mK1vc2SYzRr8iOUwRy3
 l8MemnlzOSZtZ8hp91Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-10_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605100021
X-Rspamd-Queue-Id: DD53D50242A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106790-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document True Random Number Generator on Qualcomm Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with qcom,trng" part
 - Link to v2 (TRNG): https://lore.kernel.org/all/20260427012308.231350-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Add missing SoB
 - Link to v1: https://lore.kernel.org/all/20260420025732.1240525-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 41402599e9ab..1362a8b748a7 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,ipq9574-trng
               - qcom,kaanapali-trng
               - qcom,milos-trng
+              - qcom,nord-trng
               - qcom,qcs615-trng
               - qcom,qcs8300-trng
               - qcom,sa8255p-trng
-- 
2.43.0


