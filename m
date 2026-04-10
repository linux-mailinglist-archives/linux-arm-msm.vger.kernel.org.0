Return-Path: <linux-arm-msm+bounces-102591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMJpF76f2GnegAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:59:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A65E13D3023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AB4330078D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870B838A728;
	Fri, 10 Apr 2026 06:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N639SMMv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWaOo+qc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F33938A715
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804322; cv=none; b=FZTkx5nNYZRYEHRVICMH26qoMpt5D8AVWCI90EByzUyzlFll5olRm/c3I8M19K4rrSeKIOdL+jmIWYlxBCOPIfEQN1Bs6rMkAib6bqcMao/DYKuf15j53VkGpPsC8JL6fBfhUf4c/4vymrhTzATpV4aPNw9YCQS3u1ZtTD2QQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804322; c=relaxed/simple;
	bh=hnYKIDCRQOxEBVlFTcHqpJxqYH5vnq7RHHs5Ebb1Ybo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m/5qQwjX2XHG/HvnU/9XAY5oqGJQDeKPPA/Pl/4JlK0SiidvA9b1ceU/uKQnYA9VbKwyQqKGYq9wLE+AncjPSo8DoESE35bU/Klx/LDce3goVfTN68TiLzXIrNvucGEbN3nfW3Xj4N9hQaCMOPX9V6kHoBuFIZYqWJX++a7xME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N639SMMv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWaOo+qc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Mtb3p3934514
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 06:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2ga0uhkKrN3dwtYVwyFTuYZAFChPPjjvvUy
	2WCvfTbo=; b=N639SMMvuVPyu68jblqx3MmzfR93mlVCAgzix/ZhfBPdkuJTXux
	0EAzHEw825i/LZSVZRXu8V89eqXbx51YM9ljKz28DePqcNQTOuxCDEBzVnUJy123
	KwrtNpDDvCjovWwF0wt0JlEWjFHePZng+EYlgzdKBLbXaDiVTu2vMSH2M5MIGNiM
	dC5iN7d7ONvrmPxe3e4KQkFg4iFzlmNx23z8UDkg5QvK5tpS+P6mLrmUykfWyaBd
	fIuTm7/Ijk3LZFV6LeIlVxulUDNJV8xHnnkTuELTy7jTTh0J2rNnWBK5Ctd2g4D+
	BfP+tzzZ9kPU96ypO/s1n7DLtPIx1o9p5KQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ded5sawq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 06:58:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2523e0299so41434985ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775804319; x=1776409119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ga0uhkKrN3dwtYVwyFTuYZAFChPPjjvvUy2WCvfTbo=;
        b=XWaOo+qcm7omoH2HLJSv60uO0OsITDx4gyzRcQthk1gUEGTO5LgPkgn8I9L+/60LbM
         ZHnB222E6Q0EnIkIy2DaygErOKRxlhtynz1uau+6MD6MjyfZ17XZBek1JRWIyjBHFe+w
         xxv5uveLi63l25+KERm3BqdbcVZQBAlOSx0c1ozxkvaOCzNXF3i0PXGF3WtLpk61WrvU
         x4MszZ7kfn1mrflXvqfIXHm0HkLXONBqW/Ir4UiyACSgbPvlrLxe9SkmNokeu6/AsSXr
         j76R93KiKHVgTpmcQgf0ZZwW3Q5rjmSOH9RlznyHrqgI8Tr34QvDiA1mceJ9yslSdPtM
         Q8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804319; x=1776409119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ga0uhkKrN3dwtYVwyFTuYZAFChPPjjvvUy2WCvfTbo=;
        b=ebLYl+JypQjZMQzX1T1Mgyicy4mgbXAwDCpWe6LaXT5Zs+Ew7wHT3+s1LpzPkk1N9m
         cI36P9eJLWCaYQq5Ty2aRfKLQ8sQdbQAb58923m+ro1TxVlxfSJAZB+rl5c8zVBVyaKh
         zfF3DYAy+seMkslvaNJ/S9Q+D66MOJ2RBOI4NtCXfLF1EKkNromIAhlRiiq0A0hl7dCn
         JmwlR8wjh5djnFmA1eKtamxJlfo5pHoRZTKRnMXQ7PdQZL5lGWJ11vM0oEnz4LNFXO9+
         PGtxmJZhDdYGHvX3cBxf5TFM5A09Z6kT41yrQzgIlX+6OEY4jasw45k6Zbn3vrXzJuAW
         MTOg==
X-Forwarded-Encrypted: i=1; AJvYcCXkTDLp1x3Ug9mgw1Fmfqu6qhTAUpqIIKaB6OYiGf6iHyogcBmksx7gXusuNW216R4TokVhyNtS0RSAdVHF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywav3rlSwO2xh12zdpMYhVKXI/Ekxij1mpeWrJTh3r/Wya/OXFf
	e0vRkesvIekubCepTF2C7pwiMdvJOYr7fz6AI1mIB2f0j5wWBRygJAtxeYG4Hp3noVyXWTjQktK
	VQdUjvMg9pE2ksQ3JGCi7+gsKcgkHxE/XJ+gffkEbSyE4UPwHnhiMys1VJJ8hTD715op7
X-Gm-Gg: AeBDievtlj392A8ex5s1/oMSyY3yAo7lwXoD0EFaTuY+iCnHex67Y7wY4k0lDYbDHNQ
	uwurLZDZV8fySule5Oo4Gzed0/9k529IVXFVVRRBgWqbMjSJKV9BiJRPi/qOGyMtyOPLXKemkA6
	HxJN5BC9FsLJVRT9phdoDs7xPaYto3OFOSjBgcdbC/LIHeNTGEvcP7SmoHErkTOkBOpmhVUQOAs
	+UOu5OaKtGAoeJTVFiA2D/fQK8WR1CIYzd5MsYFjT8Y3Y5wAzW3RbdsFRRY0u+fhLg1bkq5pIjG
	FP2DhkhwgwqrpTWu+t/xMxAWqnXTFxFNB6luoa/HUjcf4ejhwFlxpm4lw/+z2OlD09eFWhgIl3z
	bG7YhJgNwIQK5w2H5Tu61iBvS/r4ZylLTYrCCRcxU1TOcLMLNaXkr
X-Received: by 2002:a17:903:1a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b2d5a64f08mr20389735ad.41.1775804318978;
        Thu, 09 Apr 2026 23:58:38 -0700 (PDT)
X-Received: by 2002:a17:903:1a8f:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b2d5a64f08mr20389505ad.41.1775804318464;
        Thu, 09 Apr 2026 23:58:38 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f43994sm17645835ad.80.2026.04.09.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:58:37 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ebiggers@kernel.org, abel.vesa@linaro.org,
        ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v2] mmc: host: sdhci-msm: Fix the wrapped key handling
Date: Fri, 10 Apr 2026 12:28:33 +0530
Message-Id: <20260410065833.3189808-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lyIJcj4-jdAKWPLNEBD0k41ZbZmmcspK
X-Proofpoint-GUID: lyIJcj4-jdAKWPLNEBD0k41ZbZmmcspK
X-Authority-Analysis: v=2.4 cv=Ko59H2WN c=1 sm=1 tr=0 ts=69d89fa0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=REOQkW6a7pLLFZWo_7YA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX+BBfNhhno4sW
 QO3M1+rup82QEVIa9FjpVJkf5ttNHl8gbKpmIuoK8Q1UwzenCKanbBk47kkbzd18vQN1g/q5REF
 yquEDIoWS4czUxJxunVja/f3n7zttws27VdAhlWMp2V12tZ/I2VqIqDoZO3V23Y7MLJZMAKR0Ve
 FovirJEMqoT/zJJY8EVYXHS92XClRqvIuVLIrNNCzFp19rQWV4GMkS6EcjB6eiVIwyZZbIOcmab
 TMZJy87fzTYIrC0JT+oxfhYgSSR+ApJ9NShHk5SPFBCiq2EM1pv6lNPyH04dhvh2TomxeIT4PBC
 oA6C+AnLYoSp34xmrL1KKd43+P0CaH7MFhgOuUGMNLwbLoLIwG6K2mVLCQvnW6LHoviIkwAQ3N4
 jyBNup3vmcwtofDlP+y1HcU5CdoJ+sJBtMR1VAo8pNpFvMiTF0c57iVqtLXzGqeC5p0uL7XbGen
 uTX+ZZzzFeLVXQBm2Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100063
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102591-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A65E13D3023
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Inline Crypto Engine (ICE) supports wrapped key generation.
While registering crypto profile the supported key types are queried
from ICE driver. So the explicit check for RAW key is not needed.

Fixes: fd78e2b582a0 ("mmc: sdhci-msm: Add support for wrapped keys")
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

---
The patch series "mmc: host: sdhci-msm: Add support for wrapped keys"
was originally discussed here: https://lore.kernel.org/all/CAPDyKFqRG1_1aYavfrA0Ss85B0kcTnjVBeqLgq8PUJUcSx5LUg@mail.gmail.com/

Changes in v2:
- Updated the commit message.
- Added the "Fixes:" tag.

Changes in v1:
- Initial changes to fix wrapped key support.
- Link to v1 https://lore.kernel.org/all/20260403105949.1007447-1-neeraj.soni@oss.qualcomm.com/
---
 drivers/mmc/host/sdhci-msm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index da356627d9de..df0a038269d4 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1926,11 +1926,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	if (IS_ERR_OR_NULL(ice))
 		return PTR_ERR_OR_ZERO(ice);
 
-	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
-		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
-		return 0;
-	}
-
 	msm_host->ice = ice;
 
 	/* Initialize the blk_crypto_profile */
-- 
2.34.1


