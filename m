Return-Path: <linux-arm-msm+bounces-112292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xwoGBEj8KGrtOQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:55:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F35666068
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:55:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T68vd5Sp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V5mAlq5B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112292-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112292-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D1A530E9D6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 05:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27465351C06;
	Wed, 10 Jun 2026 05:54:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF9829D281
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070854; cv=none; b=MDSi7rw/akhQbR0dInTL+cm9ntXf3BCCgb8UqxMyJSxZ8iRBfHRU+A7nl5zCwQZyl1a7HIJNgWMbdj6mtEdOoJ6hhDzFWHped3vZV3VvvGipOTO1ankyYOBYnyHls6NIfAjo4lCdQ+BX1p4kPrOaavaR/yTDAlIugwW9meqFwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070854; c=relaxed/simple;
	bh=N7tD3f9Ln/OjK9UFbjnvbfgV8hf5Ynv3naFrUZ3/PEM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q9I7hsRQGLpborIK8Iwim4n7lK4+v471jN4P21Bnz1RVfp3pCEeo9NG3ulV6DrqMk/QTh95KEPQdvwJiGvC+EmgnSNmnWix2Uf8S4CBpnXjzrt8UwFKRk77XjRzESkBr9o6aKVpbU95gWwjcwuYZcOrReUPMebzptDPRTpXqaHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T68vd5Sp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V5mAlq5B; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A45TfZ388089
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DzbkyHrykCfB9lfvTmUvUV
	YIFdKphCwy1C3gk2YCmoc=; b=T68vd5SpD2v85QNvq9CvykOnt2U9uE1wwOYlVD
	Zl/EPJB7I1vhB554GwWCg2/uAYXE4obW0DUrwBgfQ6RRyNWPWIkRp+L2xyTwpg7M
	ujWICPGnsuQgkHecOZ6MxYH3wd2Inrmqzc9IYGhPGrHZIhJyN74DDcThHuWW/I36
	dU7EXC5QFRJ91o29Vf+QqAbHazeAMy06uCX1hjz95QNKUvZCQ34YohWYhC9OJhPF
	vG4KDltxpacyDejRg+o7OIzbJFVpwKoqQxVSbw0C886uMjZpJP/jfgJ+rd9KzX9G
	q0j0xUFH1TZiQIgCBso1fwEmiRK5RIfcE4hdk2lkJblVKnog==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8aau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:54:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c86487a8ce1so573711a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781070850; x=1781675650; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzbkyHrykCfB9lfvTmUvUVYIFdKphCwy1C3gk2YCmoc=;
        b=V5mAlq5BQnesv0mKOnIYp2/RXJYGLk+ouwWhO1lPBXyx7lvxZm02NpwmDnXJ8abXle
         DJlrVOy3MfEkC5PxOJ72LBeSHxxHXJFJSYDL9w4BbHdK0sJVh4YE2UvkmSbahu68/sNd
         I7XMAvtE3VWSlEPqWNhmbAavCI8+6xtUNS1Cj0NwbmH2BxNFh57w/it0HDv8cBtXp95R
         DPtbNwSAFtp69VT/R3Zc9KcmSAYAwbbtuQ9R8c7VDSzpgE6vlvA50WrxyZWe8NbQWhGp
         iNQidBwuQRhDNrUBd4vXJ2XIN1NSC1RlT5yNUVFmoWz9wzvoOGSgvZY0YttjTbKxdD2q
         3aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070850; x=1781675650;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzbkyHrykCfB9lfvTmUvUVYIFdKphCwy1C3gk2YCmoc=;
        b=Rnmg3Tr8JWuOwIystOU6cN0nNgnBFpEqGZLOxLM/cAF4xJyjZ4pfAW2hG+5bY7yXvO
         4NdzQqKyT44GvwJm/VHychCAbvVXW+sVwOai1AuGouw5pkytyMG8do0uSCGF3jXeYNEn
         ZMKuwHOmHoGHmlOkc3225XNB3vsZ3MVXSrq7P10nmLpY1sPecUjan4VYRu4Wya/S12he
         Ge0J5RCVJI17wyngvjhfKLwvr0RDA9DqWqQXJR/gBVdeijG43DASxqmNO/tExAWlT+gG
         t+zrjD9jkQ8jmsNclN7AJuDnmUCfReAgOYl3eOGNHVgBblOEYuGMMGW2JX2GJz9VFCgZ
         JndQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bLnZUVQZdBzHIja2S42l6wCehdo8DqEoLaKwdVCOJ1Vn3Ob5v1mysiUK3b+bn1IzBwz1FErxNIMQ1aGut@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0EuLVzXLk8zgSvPYEUUIr33F+3AU15um4eaB0GFO0nAIoWRpk
	SilXn21OoExhweLjeJ5sQku3nvw7i61iwVL4c+CqBkfPSEzNZWMdKPS34AdRk9uJr9b5qm4lTJZ
	EdmrP3y/NGIA0egdB6HUSuwJHArODp+GYheHtKNBrw2jhBYDI2/sNHD9qGsCcmCypYZ6x
X-Gm-Gg: Acq92OGMu7ga6frbxMT5afwj9+NZbELnYxHp9j+hqi7gHuG7jUsrvhy5jrF0EU9VnKJ
	sRwIJg3wOdsPExsfh6SU50UlfTfZpedaXUSEa2kd4CJCt4jqLgpJIVV0zvscwshqySaxSqaBLZR
	ODVwD0Ds5qfJgLPIIjTTA75ospfD5lhVdrlMu3HH5iQxYDJIVdjTy7wc2jrnmMMtBrsOvopa6zg
	iE5hd237FAVc2ImrubmZekeoHxU0IL4GObGSyyAX48j5LsHYh7X4YEp9JoZj/cYPuTAGOLCbYho
	pc1Js3N0730DnbTuKiXRXIKUieXRQFk6QEkyVwR+a6WjiWXaqSyGnKm8Bn6NuQgY5T4Y0zBRWiG
	6TD255nQMbJ+fTp6D2YrxETWFC5rvbP+2jxJ6aOScf8Fdxzlcgx5expio9sbnbRWqyA==
X-Received: by 2002:a05:6a00:21cf:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-842b0e1e1f7mr24836328b3a.7.1781070850352;
        Tue, 09 Jun 2026 22:54:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:21cf:b0:83a:3135:edbd with SMTP id d2e1a72fcca58-842b0e1e1f7mr24836298b3a.7.1781070849915;
        Tue, 09 Jun 2026 22:54:09 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221086sm23687470b3a.10.2026.06.09.22.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:54:09 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix Qualcomm Crypto engine self tests failures
Date: Wed, 10 Jun 2026 11:24:03 +0530
Message-Id: <20260610-qce_selftest_fix-v1-0-1b0504783a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPv7KGoC/yXMUQqDMBCE4avIPjeQBLuUXkVENI7tlqI2mxZBv
 LupPn4D86+kiAKle7FSxE9UpjHDXQoKz3Z8wEifTd56tuys+QQ0iveQoKkZZDEetmN25Y2vjvJ
 tjsjzkazq0/rtXgjp36Ft2wECvMZrdAAAAA==
X-Change-ID: 20260610-qce_selftest_fix-2e0b66148651
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Biggers <ebiggers@kernel.org>
Cc: Thara Gopinath <thara.gopinath@linaro.org>, linux-crypto@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a28fc03 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SQGNcDTCvMNP9r5F9YYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: K7OvLLAfZGxrgQ2Nzs3x-g8ecWFP4Frb
X-Proofpoint-ORIG-GUID: K7OvLLAfZGxrgQ2Nzs3x-g8ecWFP4Frb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1MiBTYWx0ZWRfX7IdWYhLSGX+i
 YJFNnOSbQFThHneFlIugIdB2mfgiXV2TAjVCZKTAVk7v0ka/mae5pTRKCIdJELJsrVTzOwJwYqG
 1AjiT0Vjp9UQhluVT4gyKFKYp+kgL6dUa2kEF2n+W0da1cSpwZyeXPfRmbaNpZd0L3Y6pDh/B3F
 178qXrwHeZMmB9zUFFF83D1QYmNmyapIxItJnmCMw3cmsxnYg/qIxuYEc3eOvzLPvXr5U1lULxF
 rSvlGzBHpBT5mN1snuC4KKi9Q19yGb3LPaPkK/jmOFsLZ3GTPqyTR07iwICi7SqLphWjI9viU3J
 8YqdRBlBchsS1irOfK4FsvPEAlQlWdVGD+ovIOwCh76ybCFuv660MAM5KYCLfK3SweC41VKLhQX
 9j1FYLtSknlcuJNH/wK8PuV9YAOUietHYiXcmM6cmnoINp3USjf+PkudlWujoB2hUo6RNKOEiMG
 8DIoNgLOduOFAiqoaPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100052
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
	TAGGED_FROM(0.00)[bounces-112292-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 96F35666068

QCE currents fails with crypto_sefltests for below 2 ciphers.
xts-aes qce and ctr-aes-qce.

Failure log snippet:
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)
[    5.599187] ------------[ cut here ]------------
[    5.599189] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)
[    5.599222] WARNING: crypto/testmgr.c:5804 at alg_test+0x2a0/0x3bc, CPU#3: cryptomgr_test/150

[    5.606169] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    5.606176] 00000000: e7 82 1d b8 53 11 ac 47 e2 7d 18 d6 71 0c a7 61
[    5.606192] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
[    5.606196] ------------[ cut here ]------------
[    5.606198] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
[    5.606231] WARNING: crypto/testmgr.c:5804 at alg_test+0x2a0/0x3bc, CPU#3: cryptomgr_test/149

This patch series attempt to stabilize QCE and stabilize selftest
framework. The failures are common for all targets and is currently
validated on sm8750-mtp and qcs6490-rb3gen2 device.

Steps followed:
  - Enable EXPERT and CRYPTO_SEFLTESTS config.
  - Bootup validation and confirm selftests is triggered.

Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
Kuldeep Singh (2):
      crypto: qce: Fix xts-aes-qce for weak keys
      crypto: qce: Fix CTR-AES for partial block requests

 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 29 ++++++++++++++++++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260610-qce_selftest_fix-2e0b66148651

Best regards,
--  
Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


