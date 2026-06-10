Return-Path: <linux-arm-msm+bounces-112294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dmf+Cm78KGrzOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:55:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76012666072
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:55:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=agb8W8PN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Dn2WS6zv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112294-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112294-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E18A314F30E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2DA346AC4;
	Wed, 10 Jun 2026 05:54:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEAF345745
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070860; cv=none; b=NGV9cSVDkmfwOboD9A0Psqw//S/6NVdqae7avHg6j8L4rHT1ySJqo/Hmfg1kXSzQTqw+2XbKJCLk0ZDhkNIiMErIW17jlbqMZv4mOC5W89WLg6dC6sgDwQ/7Bo8tsAgtyCFKGyAFjVB7L4Yb/1YrnVMHPc06wE3fAOtvGBDHlYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070860; c=relaxed/simple;
	bh=d0pc5XLYB20EUdMDozhH6d9NLxhlhJieCpOBI1G5dVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=My+drkluZ/SINQHIVCOZZz/gfEHOzkH317z1my/+s36lcWFajuZfYSP9b4n9f9vCHb6Vi8FeHZrkbpBaGr2kS/cx5ir+xY9BYXwTjkUjnkNGCbPvBbOhKGvX5YWRcYrAAIb6cXnmpz0E4ryuDD+av+SW/rzx819rwFXi3P2Ag0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agb8W8PN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dn2WS6zv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2elqU2481851
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r++WJ9p5aERTSYrUGn4QNXdHa6+E5osO+Zj7aaUlLs4=; b=agb8W8PNK6Ys2DQe
	dApLItqd11RVQbpFwpTsji0yJLVxdtHBvc1Id9HodtBiF4tPAyksUs89xu/vsAFg
	wrt0I2HCsPQW+0nbhbdP201EfChGn4oBeiakythfLinO76gwvpLCbac+JMaBXG9d
	xp3cTvmVAb/ORQLqxjkDVtHzQ+gxUGu6egcpIKucbhUs0saXtVxu2rsHnxK5BJyl
	IQHnACz5u1ATK+OMZj/3MYs0Ie9mz11nwapBclG7GMPxeyAIbDBTU37f2HTxV4xe
	/m+39G5s5zokk25ej30b+yLFkrT/OfkPRfwYdDxNVT+15hS47+2gELPr/gsUvuAo
	w1kuZA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnerx2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so4394327b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070857; x=1781675657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r++WJ9p5aERTSYrUGn4QNXdHa6+E5osO+Zj7aaUlLs4=;
        b=Dn2WS6zvDsCPqcCXN4Kf+sngwQ7KBLq6/0xnSdVjJwrtMdtas4NVpebNFWrMOO6ydB
         oI1NoL1L3gj8kqWcAkqIMcuwYzceAobaIHXtX7Rk08kdUjyAD3UfzWyjqpabbMtxCblA
         J78mCFCpUjDndigyQJ0yNpQ21vseohUR7d585C4aK46LTNJ+i+bOlOPgWFI8+fKJdGPk
         r3X7ypEmO6SQBHQmNSyEhhGLWSj0+KNMqjh0LaCAUSt4eGfvHoFSnInMQbrYndnlFkIp
         UZgyWyTdtUHu5rCWsq2jcjBm/ya/kcew4O1mC5quWyVbPf68xVnHkeywtzGmRbJ4F3ZG
         zovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070857; x=1781675657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r++WJ9p5aERTSYrUGn4QNXdHa6+E5osO+Zj7aaUlLs4=;
        b=Zq9ISKOaI9tKwvRyezu+7cBE+v4wiOWM8g4KY8FDaUZsGfzxl3Ljs4tCfI4ZhV/Kc5
         w1d1LkdHXuKrblehZ+1i/54nbyrDpaA7/7ZFfEOp+c2xblcr2CG9sfC1GjechaOxNez2
         SJmNet7SXir12n/gNBRTg1vgo+ymoSummtiA6mLPctPFHqVmWiR3wks0f7Pz2Aw1PljM
         PN59yFXFJx9vZyQAxQoF1jwixKs9v+LSG/Yuw2AlS1VXizRmLF8LA36xZeLHB7x2FNmG
         bj5id0GI4BBP+GFkySG5Po9AMU/1eDfhkSp4lZst6dlew6mFPrra+TaqjvIc/aCy5uT4
         gZlw==
X-Forwarded-Encrypted: i=1; AFNElJ/hP0OjSFaofntwIENYSjp97SiDdHXVK93fFj1ze3Ox3UT86ZeMx9qNC0zfb7UqyJxvlQnbtFbhM/dXa9Kq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzc+tyZdfGaWAV+0ps/zsnSD3FDQIEIqcQGILk7ekGX8b1D0Fd
	2R14sUAje5Fv6BsB6WqBV0UYvZQsdgLZPzxS7s//8p/PGRfigyJeGjk/YNrZrCJgDGc65VkcTyC
	OyEjtXXu71Jc9q3/RX6JKCTZHhf6cOGuu3aBVtbtiW8JRvj4aiezDrK3LBxE0jwTvK75EgapbVb
	JX
X-Gm-Gg: Acq92OEYiy7FaO3l0jmUZK+6GjkMUopQ4gYK/5NI3zR0QP7Tg3zOwf+EUeitSwwwlMZ
	wXdFYKwJMH3HaMROvIiT+ttIbjbm7LqLrjHFUzeKBCUt0TBsqwwDz/UFzmsXobyWMAKiOU+OlaX
	iiAgA5lbgd0IbRxBoE0Rgf6HSw5cd+LuwCs9iw1TtKMD5lldCCqKY1usOaMcUhC9J0jIb/7/MYS
	iW/hPM6AU80T/xNxOAj3/mkEjNRat+x8nNt1gfJnEQtex+AxttxL71JjK/eKHEdCaOkmLtJtil6
	dXQYO9rGD/KcympCpzzk57kVWI9bUHt4pIKv/1pT8NajS3/ZEg2cz6sudKQkGiqqI7Ig8ww/Tpj
	zfnu9FI0nXxkmOfbRxdcol+6gbuiG+B0ulYqZhanARGYiKW4ry/kaH7HTLibvznjmdg==
X-Received: by 2002:a05:6a00:8d6:b0:842:329e:7635 with SMTP id d2e1a72fcca58-8430a7dc0c1mr6897715b3a.45.1781070857520;
        Tue, 09 Jun 2026 22:54:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d6:b0:842:329e:7635 with SMTP id d2e1a72fcca58-8430a7dc0c1mr6897688b3a.45.1781070857095;
        Tue, 09 Jun 2026 22:54:17 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm23687470b3a.10.2026.06.09.22.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:54:16 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:24:05 +0530
Subject: [PATCH 2/2] crypto: qce: Fix CTR-AES for partial block requests
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-qce_selftest_fix-v1-2-1b0504783a46@oss.qualcomm.com>
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
X-Proofpoint-GUID: EWl8HIDhmpKtaIpHVtPExmxm2R7MDsle
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a28fc0a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=J69qjfz861JwZTRCukIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: EWl8HIDhmpKtaIpHVtPExmxm2R7MDsle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX0Z9frHM3rcZ7
 wmzSYa7sZAfJdKfsaL2iFjADgbw3dwz4DS2zGQgJ8MkbsCP66KGzt+mVhz1D+2laV38JU6VSQb6
 b474Qctoc9GsGU312Caj9MaQGMSvoPAkPI5EPpU93S5eE3IteVoadaoD+/hOKxDMAcqTgQgYoyM
 DiE9EHhUby4AcUG7FyuLJ5qkD1NBTmEpAEbzjc1tHfpjVOoK03MH4Lojj0CVP0gGr3KrzYFZC7y
 T30bz6CyRfvvStBIOE1C+ZqB2rzKDLOqra/UF11LvtpRk3qXzAszskvQVx/fuERdHjqbEEUajuu
 rqLuPqqJo3OoFFtgTEwiyYeewhhWJKs4zP9m1fSg3344918zbmDyWgFlVSRPL7gJVwcuSPaQQcF
 AR2lhtJP1GHA63fVP2jYmIqGKxG+o5KMwGBqgeEiquk0259xrMX+MdpibiuVV3l5w96iXKyb+zg
 9LQX01YXpIgETKPsUZg==
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
	TAGGED_FROM(0.00)[bounces-112294-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 76012666072

In CTR mode, the IV acts as the initial counter block.
APer NIST SP 800-38A, after a CTR mode operation the next unused counter
value is:

IV_next = IV_in + ceil(cryptlen / AES_BLOCK_SIZE)

The skcipher requires req->iv to hold this updated counter on
completion, ensuring chained requests produce correct results.

Referring to Crypto6.0 documentation, Section 2.2.5 says:
"The count value increments automatically once per block of data (in
AES, a block is 16 bytes) based on the value in the
CRYPTO_ENCR_CNTR_MASK registers."

QCE increments internal counter register once per full 16-byte block(for
ctr-aes) is processed. In case of partial request length, the hardware
uses the current counter to generate keystreams but does not increment
the counter register afterwards. So the counter value written in
CRYPTO_ENCR_CNTRn_IVn later once read by software is one less than the
expected value.

Crypto selftest framework capture this scenario with test vector
4 comprising of a 499-byte payload (31 full blocks + 3 partial bytes).
Error:
[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
Expected iv_out: 0x62 (iv_in + 32)
Obtained iv_out: 0x61 (iv_in + 31, partial block not counted)

To fix this, just increase the counter value for partial block requests
by 1 and for the full block size requests, don't take any action as
expected value is already returned by the hardware.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 224693a831f5..b25e3b76b6c8 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 #include <linux/errno.h>
 #include <crypto/aes.h>
+#include <crypto/algapi.h>
 #include <crypto/internal/des.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/xts.h>
@@ -59,6 +60,14 @@ static void qce_skcipher_done(void *data)
 		dev_dbg(qce->dev, "skcipher operation error (%x)\n", status);
 
 	memcpy(rctx->iv, result_buf->encr_cntr_iv, rctx->ivsize);
+	/*
+	 * QCE hardware does not increment the counter for a partial final
+	 * block. Increment it in software so that iv_out reflects the correct
+	 * next counter value expected by the CTR mode.
+	 */
+	if (IS_CTR(rctx->flags) &&
+	   (rctx->cryptlen % crypto_skcipher_chunksize(crypto_skcipher_reqtfm(req))))
+		crypto_inc(rctx->iv, rctx->ivsize);
 	qce->async_req_done(tmpl->qce, error);
 }
 

-- 
2.34.1


