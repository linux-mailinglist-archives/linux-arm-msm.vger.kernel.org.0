Return-Path: <linux-arm-msm+bounces-107893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GmBpD3UVB2plrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:45:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB7154FD86
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48FBF31C0FEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8585147DFBA;
	Fri, 15 May 2026 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YeRYgX69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WVZ7MEFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F347D94F
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847088; cv=none; b=d50467j7rx0fAkd+59Lyff8NbPPtuSuOuS3P5IQh1W+yTDfWUt7eH+vnlYNcDOSQ7Ii3xP//YWXetrdxidfBdXcxZZaYxN2JfInLbU1Bupz1jJZPDG/p1ETbl7to90vVzlP2wWEsk2sk6hyD8o84cxo3fRQN0H7WFsj5HORcU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847088; c=relaxed/simple;
	bh=yQAWJBywT6pwqGJLKFwuedfSMNGXnwkl9Ism4JarDpQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gOgxxRAvhrkcnw6Hjh4EcNxEPGJUuvOJS4JRHb36OdV57RzD7uR6UYBIUYePvJiWQZuGuZy1yeuR1+NWfY5iAevl1thsdQwb05GIr7HzqdRyiCeb1cmYaGQ4DhDdAOEnBKICF8WqibcEDaVQ6Oy2SQs5QcRZAqE/vjmGGy8mCck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YeRYgX69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WVZ7MEFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAooSG655515
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=; b=YeRYgX69CVp1RTMy
	3uoFCAnJNW3U9LUp3+WLIDD1NWbefBnXMApn4+qPufnndd7gjdsFY/68s4+7xIhz
	EFiU3WGsS8uiA7RYKv3QKS8V33KVN1OuMeJ67doqghVf8XVIc87R4EjbIWeof/fw
	KL2Ynhoed73Tv8KTeZIQJGnfq6jMJSwf4OuXaaJMTQY1rY9ikyHjVYPinzQV+rdr
	Ff5pJ7BIFYh834GyDNMbogG0BTepg49tn8viwMPKShbU4nSE4ndQaGsaH/lLtgJ/
	VLdQSjn8J6FiYLGR8PAyqgak9KYt994C1ZFCG6ikMRLqNlmBQkhymGqvmka7pYPF
	Z6EebA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1pu7p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:11:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6343b1bcbe8so4239371137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847085; x=1779451885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=WVZ7MEFiTHD33NoejhDSx+hRQmWmv0WYmfA5EwLoI00Ja0EF5xBUcnAN64tplXVmlt
         rIBt3qqtVHXg1YkNLNBOQEDnsK4Q6HxiOZXGWVy5SyvrkZU3ZJOM481Hm1ObpRJru/W4
         YBWCqVtEptU+4nhA5QjSJVrDbasDOsnTy4snHAT+kzge/qIK7sz5vg7PqFQ6nT8dNQW9
         15Wa6JndXSw24E+yEYT7Tj6gkzfBCGMxnaLjpnIqaJ1WZbO/nzCM9s2VlBPMqCKrvUU/
         RWnN4/lO42ojqdt53WiEB0/T4buPKDU3WWdiJa332JP5ABHAr5dIsG4FNoUNVsPWm73z
         aKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847085; x=1779451885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dEMWb3CKiGmBJqcMxJUz+Micd4CN6K2YYETwoBGc6kg=;
        b=RWwJFbVen65QZpLe/Wg5G8G53Y1k8MA+Ce4WDf6/1oG3vXONgQsJp9mK4EXl6kX3vP
         KyVpNsBacUF6i07T75n/IdAvbZdotx3Cn2mF78vS888crr8Q+l4RSlZI3I8DXcA58pii
         cJk60LdQKRjrJ22NEHlb3F+ke5TWfm2ggJjAdDUsHNIHIYd5yrVIykAZo2MNlKPk7vsB
         tFs1AgGXdfcUoB1wu3q+cCjDIO/fRr8AJhoRzfn+U2RhaqBYySWSfMPLv79ii1X59+Oe
         2+NxSLXK2LX1w4nYeil7+TnU+ZZGPCIKRRNX4lJ88ZKBFdECWlW2KtAyJ9YEK94I6Osy
         QPYQ==
X-Gm-Message-State: AOJu0YzgQsshbON80H4rMPnSI+swFbNUsnccyYjI5NE4UhIXJZoi3yok
	t+eeHJetR75gHu2nddEB6Zomc/yP9sKH8vt4IQvDNOOETJtl9eO8QImy7ZBH9LSWVFPKz3bkn4s
	7yNLgAtNitP4lVcB181g1llamS7Z9RmBj39y1GLY3X2xXBXVR/h+3Fd/TZze3JvIDpJb5
X-Gm-Gg: Acq92OFUW/wKm/P6qQlK+dZ7ZXQFV5Nle4lmVGgnF35Io25u6bf0+aJoEeV4b176wsH
	oJpVfcH6riTKgQ9znrJBILk5wfKQej3Aa0iBuuj4oK9rQHXN9NrK21p0sc0OZNgYO579XftF07J
	95x6h+vHT3oH5Q5EVg64KXX1E98kNzuylI7l22BTiwOiqhOb/RUsGF//iOUKVydu+tU5u2SzYDf
	wyOEWIH34s961yvT2jDAphn95U7x7/V8m//4xdl7E8QznK+4BLQu3B+UDxooarfiNtWGbknxrla
	kTwlHpziUbJD4wOxb+j0LmizPrdWRmia9L6GeDDPn6M5Vg9IdZHgebrSC0JOJJ5gqBPOiJ6VfnM
	OaHNTjkHCsPeymqobn3uKm3GKbQY75C/SmGmsi8tLPdWq
X-Received: by 2002:a05:6102:3f4b:b0:631:28c1:1554 with SMTP id ada2fe7eead31-63a3cc0dc23mr1573644137.1.1778847084852;
        Fri, 15 May 2026 05:11:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3f4b:b0:631:28c1:1554 with SMTP id ada2fe7eead31-63a3cc0dc23mr1573593137.1.1778847084298;
        Fri, 15 May 2026 05:11:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:11:06 +0200
Subject: [PATCH v2 1/3] interconnect: qcom: Fix indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-1-adeebc73596d@oss.qualcomm.com>
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yQAWJBywT6pwqGJLKFwuedfSMNGXnwkl9Ism4JarDpQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1mhAma1Kk7FbCijArenpJeNhTmVnIGkALV1
 KtJL8knmb2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNZgAKCRDBN2bmhouD
 12QYD/9aaKMboLXLPWMgjwnKO2Be23qM/DK4PugY7JAqiYGANjGhjx9rAtxPlW1S9LIvvzGNgco
 9cfzcqQbdDYAVJP77tdtbL+UoOJ7i63UmDGeQsijiMrUGqtvzWK3D9R3nd179lJCauo0tzUucEK
 eA8PUEFnVw8DTKzLbnFKLCSbl7eOAUtkJpO/5eL3Wp1oaFQX9jBEWC9X75N9rHnZ6fq7fiPGWly
 +GDSO9SZ2vS0sLUZlBqeR4y4HqzHRzO9n73Ip713ouscPK0F8mJjzRmEEI+fYUfc7z/narbZurB
 KxMUeIF11FRX/2WFrS1y7Q5z+TCY2P1ri59s3l1fOLXjw4yi5XwacviJ/oTDp30AofSAvzai9PC
 84Lg9OkUFW2C0NEHIOqXZt7+67OHVf8Jotan3Dr3bby7lI6eJ3vgYox2xGRNtZH/mjplWbeo/yW
 HPyuvfnv3uMOIFB7XC2qG4AFFCrJbDL4u0BqKCoezCsy1IgwigkCtJ+KOCnDmFHqwGcWj8cxiQi
 t6O18lZKtdFlxf6gIR24UbY8E/lWAAklCZq8+joR+yyipoFovQqCQjf5XGqucPQbB529Tvs+XWt
 9llMzWTvdq1HdJcPXdBHRMrSTrdfdnzVIcSXXsX/wQgXujI3qGQRykwOQXl/6MBAnW4iLPM4ePQ
 Xd9i8x2Bm8L1bog==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: K5gXm3VnVQZVBVvzXrMVplAVGxPyFTmh
X-Proofpoint-ORIG-GUID: K5gXm3VnVQZVBVvzXrMVplAVGxPyFTmh
X-Authority-Analysis: v=2.4 cv=GrhyPE1C c=1 sm=1 tr=0 ts=6a070d6d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UCTw9GvNnafMAvUb21oA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfXwtKX59aLdIDq
 5gS7a+M2s40/yCIZP7/r1wGkmcBsj/CUlsvBH/w+VwwHqW+p/VTlmGuVWgmHlNBnel+TFV9HQr7
 aHSc+/O7L0rHB8+SxFUSgQ9mYZigG6+8chGeQbearUD1KD5yIirnNo44vdICnsyVsNIukTRWJkI
 32XMobOonLRnmLzX9mpgUVOIw8xV4kDRKQlrsT20gOhtJ+sf5Drlq9918biFE/iSy1r+gzUnGab
 y2gt4ytPg5OU9YxAbWrg9XbA+nAMeUU3/SzUn9f2jspPubhw2KkNjvQE1kQhdtAg42xewXRzwi/
 ke5N8b+pTGzjjRGOPAFdQXPwRGkv253L3XlJxjKzV1li0YO893QTEO9G4NCr4R9zjjYN1J5THcB
 l7Tjp+JN2upkw3B2lVEZ25CZmWVG+tFDUfycFG3mgw92TIGYHKdTRXljvJVO7GP5zAzAHrn9dEC
 6ilRWYkOmO3hW4wHiMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-Rspamd-Queue-Id: 6BB7154FD86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-107893-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

KConfig entries should be indented starting with one tab, so replace
spaces with it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 786b4eda44b4..871663bfd094 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -9,22 +9,22 @@ config INTERCONNECT_QCOM_BCM_VOTER
 	tristate
 
 config INTERCONNECT_QCOM_ELIZA
-       tristate "Qualcomm Eliza interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on Eliza-based
-         platforms.
+	tristate "Qualcomm Eliza interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on Eliza-based
+	  platforms.
 
 config INTERCONNECT_QCOM_GLYMUR
-       tristate "Qualcomm Glymur interconnect driver"
-       depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
-       select INTERCONNECT_QCOM_RPMH
-       select INTERCONNECT_QCOM_BCM_VOTER
-       help
-         This is a driver for the Qualcomm Network-on-Chip on glymur-based
-         platforms.
+	tristate "Qualcomm Glymur interconnect driver"
+	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	select INTERCONNECT_QCOM_RPMH
+	select INTERCONNECT_QCOM_BCM_VOTER
+	help
+	  This is a driver for the Qualcomm Network-on-Chip on glymur-based
+	  platforms.
 
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"

-- 
2.51.0


