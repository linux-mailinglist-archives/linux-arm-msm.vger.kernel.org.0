Return-Path: <linux-arm-msm+bounces-92859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DWUEqGokWn8lAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 12:06:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4713E8B9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 12:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 044573012266
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 11:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED5072DE6FF;
	Sun, 15 Feb 2026 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afR04gB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTJFzSvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532D1E1C11
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771153562; cv=none; b=C8EDk38FKyHAVafVNGDjaUr12TUQR0xzB7DI/FtMR7DkKDvrNs89jOZQygzhFnO5DOq03BACWOZF7dVquXrMr4wvf1E2Gt/Z2Y1LzBw2ictR/X09Uuq2rmOEHjtccvabpYQLPn5HXGFW9WWMXhYPLiJJvbTUkk4QZuBDEL4LHqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771153562; c=relaxed/simple;
	bh=YMM6hRyuGH5ZD25s3Z4Iu3ZbEbU3ua52M37GRpM5g9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5dnkegWatoCJerT1ekhmVGFYZaV13O5dGURQiHooypEFC636qkvXEynf/RzNjo8zLxfPpNKMBGadcohPfi0ii99zmRTFpZVLMPmn7wNe50tOt5jGZjmHvjLHnZIQsuREKWLqqMbFcM1gx4cy4k3I+nO7Eyh38btK63ELZiIEUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afR04gB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTJFzSvC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61F4RXYR3816881
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xTcg7y4EwpA6Pa5FJveTnB2I4t7KspsnD1i
	lkQH3q6E=; b=afR04gB8GGUL3ysRKSZaJo8vP+N87wIslMZeoa5Joty8LByDMyP
	jcgcTiWzxG5vKG1zrklsJShO2K+XM5hZocpp4PaZGFZhwEj78I+/opMOLeDoXSoq
	tV/3aD2zPGnlR4jBZHEzulh+CZNZkvFfv4Vz8ZauZPzohiTQjPzefTtYLnDWAnbe
	Pc34iXns/RiQ0fEi+9F5+iloGCmqTXDCqXy/KwbqC9tP9W6jqosWL8YuYVxMI6X7
	oN2r+mUc7+cIGcNdF6BNj3M5yReGNutWI3H2ySxYNpn6kXw2EQ2epUWSPs8R/TRC
	LDmQmyXTMjj5k1QJhsRiWP1CmQCBrRISQRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagmy28c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 11:06:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4b8e9112so102914085a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771153559; x=1771758359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTcg7y4EwpA6Pa5FJveTnB2I4t7KspsnD1ilkQH3q6E=;
        b=LTJFzSvCxlnMc0A/V2VAgaDDgWAEaX9mPCfSIJ+rW69yMmJBOoigfY1YMOGnF1UNdS
         FPFsEfdmGNNBqWqNbWTS8c+1A3ZBFWiw0Fftd4s/scsT7GJQaIZOeHo75MIyjd9Al9Z7
         wnou1Icc2N199r9fOZcSNy+wqX9XieM416zdhNyugUFzyQAkGR7ZMYFZQHLjK4nrX5qy
         vWYqHDJreL1LdGpta0n6Ibg6btsKBEnP7XITB4pNspWHZTvqeT4c2fHjnede1InM9uqK
         OES50+bh7pKDzvCgAR1V+MNggdcXSScWKaY2L4WjrXhvm2GfJz8sWajXxNza3fci1kNE
         jUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771153559; x=1771758359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTcg7y4EwpA6Pa5FJveTnB2I4t7KspsnD1ilkQH3q6E=;
        b=wV5unSKPcX4YJjhMZYHo1Gk2gSSNjx1l6j5rmgvMuZv8UGTKYgbw1rG43/jvMD3kA+
         rtnuKSE/1ejOTR19Zv831SdNGYUW8/ghdEkVNr2UuzOFrA7YrrA+Rbmum1+1Jk6f8g6y
         eJiRbOyQq//ZzqL+72O/W9O+JesKjUtbvx1hROIRR4BZpB5hPDD7gUO/lE3mcBuhI1JK
         aSY2v9SU5JF7F/2VK4bDHqpjqSAJeKaZQT1flJ54KjLglJSthqmX0n6JA2u7laygFZ+s
         oN2mVDJRw605mootCueq2dSoBI5vDd7YpoUZZrCwH4CK4cPBcnM3zSjSAAN7PSDr9Esa
         4MpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1CLyhXeHg1IIwAwpRqAoXkLyvkzwRUtgGriY7ymFfzxUEgVToAtvfj9iV3gY1t2T343Yt9Kpx11IfCti8@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBD9lUQNVN20z01ugrUP1QlZUlNDpVkTBZf/KAAGph8GoktZp
	bdSss2kKyuTSRmIRHLUiCVH0cT/If5onyEnnMaWe7PUtr9HFmItdKZ9dRNPi3ZYTD9pGoP8OMk0
	GGvtRtCyTgHd5PQNMGdomS/8MoFOqu1gyti9R1y4NAyVzEOBCeU/nHoV2d6d8fNRwC1bE3ilH+9
	cN
X-Gm-Gg: AZuq6aJAdfSXpnzmD8uKvS/Sk7GJwPQ5RQmTo4+weQo1j7Y2kFjj8p4kq1NiWDwOWDw
	Kds0S2Tn8BaANgaxqPkVyFGxvEURU4z42Fy9C4XPJwp9SjHYBb6cV/WIRMjRZeHVY9i5soSE5qD
	QF3PvCU2MfbyouKwTV9K0qdvli6nZMwW7h1Sza0sF0aOab9gMW1gglE+hwDvgXbvB5EeeFqVVUO
	m1cNvCbl8UUz5jUR/cHpBg3bnBhuQKsfc4aG4s/O8yWKvqNglVf+CO1eOQDJkYXDjc3xA0+rlLf
	P1IIAy6oJgUecj+dnqTdiuO9DCv9HhE3ER+7OvmoBvnzTwQ9dKJ53TUixyaiMkj4aQOSI1VoPzm
	drmczYJ/4JhOTyXG76zXgIaGBhXLr03hBAWAo4w==
X-Received: by 2002:a05:620a:29c2:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb423d4f56mr831181285a.38.1771153559307;
        Sun, 15 Feb 2026 03:05:59 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:8b2:9fab:d7d4 with SMTP id af79cd13be357-8cb423d4f56mr831179285a.38.1771153558807;
        Sun, 15 Feb 2026 03:05:58 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a15dd9sm83550155e9.5.2026.02.15.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 03:05:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] firmware: qcom: uefisecapp: Simplify mutex with guard
Date: Sun, 15 Feb 2026 12:05:49 +0100
Message-ID: <20260215110548.34152-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=YMM6hRyuGH5ZD25s3Z4Iu3ZbEbU3ua52M37GRpM5g9w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkaiMG0MpEYUDLMNZYm2WLxHFSOZuYlKFZJjGt
 cEgxc5iT+aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZGojAAKCRDBN2bmhouD
 12ycD/9icxbx3n0nDDB6sflcai6AloiEutOqx9kd8RHFCQvTeU7tCa7C4O4U13Cf8+2Rx9/1xEt
 j2A5fIWi90l3E44cirhRTziUgA48ci5IUi2HcmgFu/3vnKrksLbxQ/S92luLHqTHbil4/Luh9Qu
 LMlQcVk0zc6xdXDr95DGBt8ZXWKgn8zsoTJAwiwON4MSYtC908QgpDROwyW8dOEV2bQG8LORLGG
 J9tsXV2o//LkLNMiMvfqH383puieR/otkioZfUDlryflesoGCuLCfFjovkEGC/5lH1CM9uxwBwu
 +Q8Itmy4ARA4uu3IkGjggogY/Cnxf/oI+Xfkrn0HZl5cpjRmv87Ubv75njnNTllntuJHOmlYDFB
 1sJtc1sME+Mg/7hVghSufgAQ33QVqN0JqeQaYMpMRw8xkc+C25MMiBOeONc4zGSDjk949dW1hZz
 dOmrTO8KBGwv+3/EbpavK0etkpVRz7IdZjD8Hk/9R0n9JX7DTkbX8bYpwhCKfW6kb176DbO4PBP
 C5mgESNal78ssLwzHE2pliKfA9m7+D/UnipYh8bLWTAqrXdK4gJedPEUYC/W01jLtG08BoXBiMq
 Leqst4/qhW8iVCfRIRxWjzk/is27dnctaFM7I39iMXLut7dMxjK1c+NJR1huU+Q1RIlUxO9uZT4 r8QP8Rs9KuD0vAQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8tcgM01S5Z1J_B42es_xBIJsGE173TZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE1MDA4OCBTYWx0ZWRfX3zMVSuF46g8S
 JFIBBdRJNFSGzdUkpsD7ziZt4zEn2addYQmW6P/9BYWnRtVx9F5dDXx9IP5Tz5cQVJUr8ukJ/aK
 LnUDrIxldRlynqPl7+BrQs4Hp19VUoRmYbU0Goa4YPFyTzHm5481Yc/COBnk4i3lZrrHu3mLbvo
 HWO0SBqvI7g0pttiE+P4Jfoc7vaRKd5iYOjY2cEKHp0iFn4h/zPHYKXzsuSgRFwx4cw7UW5Z3lE
 b6X54LeaPFp/dgwpp9eIy9cRHG7hfetr6w7O8qzqz2c25bHbVUKgME5BJO24fwcG8I89fOsmglG
 Sg2a1Q4lv7J+9fJyPs7fNAIOq0rkJdvv+RqNjbr4l/lo+dApwVcI/39JSwch5TYjT8HrtBRdSL3
 xaf2dBUKW2S6TJXk0fMPfoER+vqhQhEB5SPLHXKQUYMclYxZYuEwinBSibdFZz0QcTtfxT7IBVl
 dLPFAmrMxlxbz5zUHkQ==
X-Authority-Analysis: v=2.4 cv=f5xFxeyM c=1 sm=1 tr=0 ts=6991a898 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=SNk_nCt-9yVKVlh-3MUA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 8tcgM01S5Z1J_B42es_xBIJsGE173TZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-15_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602150088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92859-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95F4713E8B9
X-Rspamd-Action: no action

Simplify error path unlocking mutex with the guard.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 98a463e9774b..21be447374aa 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -699,16 +699,13 @@ static DEFINE_MUTEX(__qcuefi_lock);
 
 static int qcuefi_set_reference(struct qcuefi_client *qcuefi)
 {
-	mutex_lock(&__qcuefi_lock);
+	guard(mutex)(&__qcuefi_lock);
 
-	if (qcuefi && __qcuefi) {
-		mutex_unlock(&__qcuefi_lock);
+	if (qcuefi && __qcuefi)
 		return -EEXIST;
-	}
 
 	__qcuefi = qcuefi;
 
-	mutex_unlock(&__qcuefi_lock);
 	return 0;
 }
 
-- 
2.51.0


