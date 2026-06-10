Return-Path: <linux-arm-msm+bounces-112293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6XLODl/8KGruOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:55:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140666606C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g0VMXOBm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h4Aekahq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112293-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112293-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E97BE311A67C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FC233B6F9;
	Wed, 10 Jun 2026 05:54:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FC344D8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070857; cv=none; b=pBCPO3ycYdtsz1yI3s0VgEmgZ7SKj47usVk02qW1ITh6v0SPmgy65EbjfkogD9xym+OpYPiRf+QwIa3mFeP0wfVDMhwNW2YD4oqHev8GMN4FKXfn3KG2NZHKSexK+LiYMZ56nie+XvmOpA7nTmzHJIeIxWPgx2xY54q11C8DW34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070857; c=relaxed/simple;
	bh=mvyd7QXo5Pn2uhq0NJV0Q0P072HsXKULRifWb7YxThk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Po1tQtRerbVOZdCzuYiV+4XdZEwHsCM+885d4i0ZZINW6zUhXPr5f3WltIH9i3IH2BypqHDPQILtulPIc1DHKy6D9RrG21sR4pbrRbjZt0UGk8mH+YD7B6drcahFcnOVdtLhSJ/WYONHWBiCVpHN/yxDTQDnmlQQ1QCOPPb4u/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0VMXOBm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h4Aekahq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2efjk2481554
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ull92GEuB/9QqoFhRIs7hs1YWJ8Iv9duCP/H11KRLOM=; b=g0VMXOBmzhXF8Dde
	lW6Kxz9dbhO+ktIEVrB0KrB8OMI4v1RwVsBbpBdzliJypcVBq/VCt/SGHf3SENUQ
	h0D3SHqyzvJKAJFgA2YjXTcuP4BoaQjlkzc4Iy+JyQbbjgHBLJmIGHGORonu9Iz0
	DMUMjFctfWReEWbvOCcwqllKRqYeiOXV4AFD6S+xLCXxQdJQXOvWn6nE4mlkN776
	NJ/fxovA3HAkPGmESB9z3rze9QFu2UiC7oL09fA7bObOXtUJVinPwcV79Ga0Phrf
	5o8ELAkw6SE/x9KJgeesIRG77cwc/YD9C3acc1s+n4QpeKuY2JTmR/VX6olMG+of
	TNaAbA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnerx2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso6997754b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070854; x=1781675654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ull92GEuB/9QqoFhRIs7hs1YWJ8Iv9duCP/H11KRLOM=;
        b=h4AekahqDbBWZMa6Xnw92ZRU0618PZv+j97ocYMSkG0/Hr0BUQmv5Q6w5aZlljJX6C
         X2nI0i6nsoToFuX6z9rGw9RjtILlEY9UFi7Cy9gTsTi4YlytX4Po48WDOEZnnDjULd92
         xUlKP3WJPvaM9N1/EcgRXW6OJaVR+3E+lwWQH2HeMs8NDgojQg2nZkzgD5TEUZiYWglS
         iU5iS7L4Sy3UoVRMUX3kXP4UG416rWdf+fKkW9ZV/z7obewoH2tMxpmr7UCdjPtqDudO
         2yNtvUcX+VNwM4PQOIc/d2LA9pX61WjCgSgLGHQE1IofcxeEn6ErmQbmjDuvV85+a+oL
         nvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070854; x=1781675654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ull92GEuB/9QqoFhRIs7hs1YWJ8Iv9duCP/H11KRLOM=;
        b=GPKDFvGOTJuqODJ26qshGI/Lzh+rsKMHCKOOfvyfaJNFrYPaR4DyITn2DTn6csMv7X
         ze7N2eOaWPwkI1WefG1rJsPwrQQ0wZ9LIZmkueu7L6d+h/+BzEaDHvgQXhGM5gX4JawS
         +E8XAx72UA7NlKgrMuzkDYJbuyj44oSI0iSosJCMNRoK5lG9Q28Z/YM8YQgDaKFMa+nB
         3049/j7aDDGmoN2IEpEtVgC3+et4jT+/YzuaGnSHb+OhxLbJhTxzAOrT2dja0zxUVPtj
         aSTFEkQ94T0RcYcOlhhog91/3VERw2MpTp53FYzJVNLdKaa2ewSJQLHn/exsBXrF+98m
         izWg==
X-Forwarded-Encrypted: i=1; AFNElJ+Bn2I1v2kZLqziOibtUihyxKv8NSgLIzf8wTbihXfJDCuZgbwAomd9/jU9ZTkcYdmj8M7kG/i1BzHzHc0U@vger.kernel.org
X-Gm-Message-State: AOJu0YyadmdKm4+SiJJGjqRsNF5EdCdJtju6ivqpTdZm11icf/N/s/PF
	oOtNbe1tnYjw1fqaEocifCqzBpnfGG9OPWsyuOJyJEhrcWG8mpuKTtaUIftsR+VZPGMstOMwHhb
	AxB24iFMVwS+dKBzezrYUiEBVmUZpqq1GQVkxVtl6vlELy9KdRFVq9tWs5JlpVEyiQz/E
X-Gm-Gg: Acq92OGYPLVPhG4O7BxL4rIq4KhpsZvEQKT94kboKFu6C/ak4BNyzhfJaLb/AVy/+gN
	iDd+fQos5SyL786LunpFF7FooGHdeUwUn2omLSDhaOAyDd1bEE8f9xJ+Hqau7BCopEpp7db+EhI
	ZybjrnewKJ1RbGH607Ion8xGpEMeloxS3lZ6LwoARsSSM8Vt8JGCImvghZM8lexKl/bC9p6jtys
	GGZ538x2cbQXViSrFY0dj/WY0yxWHNtqnXUfBU5K02BeyuBZzSKtBQNy6RAcUBjpp80l2nuFZzE
	qls2NKRSIhnO2Xb8fet7BDFgxPniXlDtVchmYAFvZdnR+Atn3LEoBZQNF9n2dk0RAa4Wtu3DGrS
	8oo22CvdTZqmz6X3JsCXMuhqHsa6tEOijEA5ocWM/CGvzBv68mre/FGthVLcPHSn/ZA==
X-Received: by 2002:a05:6a00:b90b:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-842b0f49acamr23141428b3a.46.1781070853961;
        Tue, 09 Jun 2026 22:54:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:b90b:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-842b0f49acamr23141408b3a.46.1781070853526;
        Tue, 09 Jun 2026 22:54:13 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm23687470b3a.10.2026.06.09.22.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:54:13 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:24:04 +0530
Subject: [PATCH 1/2] crypto: qce: Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-qce_selftest_fix-v1-1-1b0504783a46@oss.qualcomm.com>
References: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
In-Reply-To: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@linaro.org>, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Proofpoint-GUID: j8V7-pfIkIkSDMBoVbiELLvx69V4Urzq
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a28fc06 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=09uMWaUiLw9_HUPRBkgA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: j8V7-pfIkIkSDMBoVbiELLvx69V4Urzq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX74p8GqZPVO4b
 nFhUiytpyKFn6qCNdNa7ItwdJRjcuDxyhX+dmJBXSmmo0o4Pbhrlk5dEGigqNdy6BgaN5IKmgrE
 Wp7khC3e0uxHCptcCTX1yg/rxSfjITAWo+nVWEDJGMwgIeBMSUmQcLRRLmpiXJEVHsCocjuZ6LW
 CRgb7T7lCsaR6aALjTyX4eCw/KPoU5Am33XPst77HrLQG8kcBuSgICEdcoUmnIIPrlZ18YDxqWj
 t2a33fId00m2ILnN0rt4O2MlShileNapqzqMM2Zwg0C5MXdT/6Zxdrj0lMn0xq7xqQS69X7lyWy
 +uYz1lUR4uwi4NMHZNZLY7oN+2Z5wTO1ZdgG7E6nt0miZMz8/SF4sVZAvl/gGDQns0ysRE9zO5h
 tnoq+Q9tfFFCBxBrdGsgbPF29iPGFquFH62od1JhNE9stV53Phl+5BIPGs/ELGKxOEY+E934UMm
 fKGwWsKRaqkwJHvGveg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100052
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
	TAGGED_FROM(0.00)[bounces-112293-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:brgl@kernel.org,m:ebiggers@kernel.org,m:thara.gopinath@linaro.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8140666606C

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3..daea07551118 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index db0b648a56eb..224693a831f5 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -13,6 +13,7 @@
 #include <crypto/aes.h>
 #include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -180,14 +181,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -287,12 +291,14 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-XTS for weak keys in non-FIPS mode.
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback))) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.34.1


