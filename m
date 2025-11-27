Return-Path: <linux-arm-msm+bounces-83529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5CC8D1D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB9A84E5BDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF4131A07C;
	Thu, 27 Nov 2025 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVtmayMz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rv1XXYjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5B30EF75
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228658; cv=none; b=fz1YToASTU9US0r02LigIZwo4MYhNkoFPdT4gk6SqFX81DmoXVqZxSVKCgxAJi8CRiPTOS9sWVdNplIFNU06IFouVYwPPRZUb3saMOGq/WKamKxWFqQ17YPCZEa2mNu32xwB/dhYyh32VCfbtzMKbY4W9c+VvMYdLWP6gerrnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228658; c=relaxed/simple;
	bh=/HqXxzUq6RnJYu48ZoJP0fcWuWCt+4vybB3tnbONtlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wj7go46J59TwY8Hv77gqEgm+3qv1CBe4IrKuLrCUSDsHuNX7zz4LoiZJ5SiQkykWiBlvhWyxEmuYgDs25/o68HrpvvxHf/0bxvQQkvHXoAlgUNfadoAWhHB7Tb7q2Yh6L39zgbuzHmg24YXOprjdL1Pk3fDPYA9LE73aR4eQFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVtmayMz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rv1XXYjR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR4U2TB1458075
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oqFyPtIZkLJnIdiBLjjAW8uXCSO1QldO+0G
	b72ywrxM=; b=VVtmayMzHr6xessuybatzysEI6SlKlmrCykGiPEwq0jMfjSEjvN
	rAuopbAu+HyVOthoc+SxeGyjiMn9zhUqB2Q2O0Gvh9ePDbxrVVYj5xMiiNLXZyOI
	pf3XIaf7CQY+h5u0yyW2WA0gf+QPgo46XRNr0fsUj2kUVWn84Gu3H2E2O1SqMRD5
	hkVMS7F+ygi706WTSBpQjHNwvlSJx+h4uLX0obiWhEPnndCQ1RxygaDO0Btx/Q++
	KJcT6rtzO6Kewr2ESZ993jNpAV8EM1cpyUdD6LULLWcYLaXrZ46dvCcnvJp0NM7I
	Wi3z+OqwKY3FxyzALlCABhGUjU5EUz+m6Qw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvkmy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:30:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29806c42760so21058855ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 23:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764228654; x=1764833454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqFyPtIZkLJnIdiBLjjAW8uXCSO1QldO+0Gb72ywrxM=;
        b=Rv1XXYjR4JXMxzrRMNmQwPB+PL6+Pl2zexkU/4HlIlAlgrMrppwzE0aoVTzhop4lvK
         U0FNgKYGiF3XvH/kjl82lcEy7lCrhKIBzzaqFNAJ7CUpOJ7MQtRRqbWb27Yp62REulL/
         F9axvOC8VLISenDwEAPUZ9tQd33c0+6R6cTGQYlLedRkd9HzGWZyIKkgeQmBXfpCJ5cj
         +bCdpB1Dvf25ogzv7tjS4jAOJ794bHZYw+U7FqsEHlemboOt4MwpbxIpErn1HssI/NEj
         jYpIm8Z5LnLRDZP1g+jdaPeYZUBl4xGmV2Kp1msmw4pyCHENxRUE980+p1Sk3rNmqInX
         jr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764228654; x=1764833454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqFyPtIZkLJnIdiBLjjAW8uXCSO1QldO+0Gb72ywrxM=;
        b=qFUYHhnZ1wjsNviKS4NUq9OQjMLQHKwKoxPQIbIzMx+RxDmhvTeuLbU725xGNttmGr
         ml47ZcpTr5a/UkhduohHiNR5nhe+WBtXlzIMQ7otXXphpEpjIN+JohY0QyD3fSLT9UiM
         rEU+R6WkPiPY0DjGIWIxQ7oKltyLGsUOVDIk6FNP7THgPN/hVVtJfcdKm2jvYY1/fNxk
         HsxbJ4PYe8sWnQZNrNtPLqPSQjFyZhyRLQkmp3c0mvY1Yt8vrzeokrMn1k2qg+eymHi3
         JFbk1+X92CS5DK/c2lRv1bsohJqXD7pEF2Txv4tHwOZRRZ9obsLjYtTwk7qNqz7WtyoI
         8YAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXe0QSKYFln+oth7GT/9kSf9nIes55grDueJMZwruNEjUKtz7bGSbbdkaHOvQOCuLejFmebiafu5xN2/lUu@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8JqYRiXvZsStYQsttU9s/Rq08aaM11gDLSqWUF3hst7A1iIz
	6ZgXR3nuJv3QhAQVL+Q+SiMO46gbjSv1ufIVDYEdfPdOhEMSY/EW9n7VeTWArSfc0xYai9fC2Up
	AoVSMvvsb5yEFxCWkhEJDii9mP3RNOTDFSBvgiKoAr059UXX5F9/Kr0g5VD8QKFnberMMbl5I59
	sY
X-Gm-Gg: ASbGncsPho9HPv5VXZoUOl7/w6FvPnFeMJEMUVFEA5j3HBYGD+pQaSAvhUvJpJR59r+
	SURW80YBJRMsCphcHNggz0Lr2ZmsQLdgjxljINbCDFRJz1TXJDlEl4G+bOrvuf33LQo+vHROuZU
	R6iWp9I/LAVwzpLF28bsdY+6NAiirZfClkZKt8jStGusdTkXvA+tadgDbKTkKNpuKXVI7Kskggm
	7NWC6kECz93+0cIRdhFir4QLHVTRwggqXoFsrSOo0NVtZnRcz5SoV/tAq14cjbltjprMlTR1ugb
	tywf6ArjphOgk7O7/Pz02Rm/1PWVg2gUzsvjfgtwIag1bAEgIcz7QvPnWv90whhbMAQgYK5Hu1D
	MqTrqERVpyeYCVpWYT5BocVk43STfQnNxFmusryku
X-Received: by 2002:a17:903:3b86:b0:297:e59c:63cc with SMTP id d9443c01a7336-29bab148c59mr115917825ad.35.1764228653638;
        Wed, 26 Nov 2025 23:30:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3AgkPTp+z2F6CoIMkOpiaOZow5qFjiecrr/JEgR34HUl/1xnIxTVopp+SGDfG6wqyDb46rg==
X-Received: by 2002:a17:903:3b86:b0:297:e59c:63cc with SMTP id d9443c01a7336-29bab148c59mr115917545ad.35.1764228653128;
        Wed, 26 Nov 2025 23:30:53 -0800 (PST)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7d4f4sm7621775ad.101.2025.11.26.23.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:30:52 -0800 (PST)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, ebiggers@kernel.org,
        abel.vesa@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v2] mmc: host: sdhci-msm: Add support for wrapped keys
Date: Thu, 27 Nov 2025 13:00:48 +0530
Message-Id: <20251127073048.2759159-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1MyBTYWx0ZWRfX7Z462MO3ISw7
 J4B9+T55UnlQJ9JQ/z4K94CxlEqpxRnfPcYdvhMxhshMCq0CeOzO4S6vvL5NZRT4+mC+gcHxJbT
 xiTZ4OgeoOPGJjGfqL5Ih0wUIAtfnnBeXRaeotNw1QM3DodD7IDSkN6vk/VGrf9Ti3OPF3Ko2nP
 nCEv6UTE1UWe21txBbUqlCmzG21NENyj5MdBoyRhXs5osLdZP1qH7o+7fOA5s6u1bOPDPhjtfWa
 2R9zzrpzVdNNACFrOJf7AqkRnvPY47EnBe5gIk00TU8yBoe4gRChZJmHOEEZAT1b8aBNhXn/JTd
 iz+cSLR603fLSbXTfMk2Z1XA3pNAMFiMmGXbz6eBPK4YXxNB3AmeHZiU8kZxXB6x16mlWbax7Fd
 sKgbQDKtHYxtUsdHfJqZW30AYp0uoA==
X-Proofpoint-GUID: JwOOT2rTZdThCHfaePvEAlQB_QtUEV-h
X-Proofpoint-ORIG-GUID: JwOOT2rTZdThCHfaePvEAlQB_QtUEV-h
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6927fe2f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyxRHT4sbPtUm1NgsYkA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270053

Add the wrapped key support for sdhci-msm by implementing the needed
methods in struct blk_crypto_ll_ops and setting the appropriate flag in
blk_crypto_profile::key_types_supported.

---
This is a reworked version of the patchset
https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
that was sent by Seshu Madhavi Puppala.

My changes rebase it to use the custom crypto profile support.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
---

Changes in v2:
- Updated commit message for clarity.

Changes in v1:
- Added initial support for wrapped keys.
---
 drivers/mmc/host/sdhci-msm.c | 51 +++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..351f2a77068b 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1911,11 +1911,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	if (IS_ERR_OR_NULL(ice))
 		return PTR_ERR_OR_ZERO(ice);
 
-	if (qcom_ice_get_supported_key_type(ice) != BLK_CRYPTO_KEY_TYPE_RAW) {
-		dev_warn(dev, "Wrapped keys not supported. Disabling inline encryption support.\n");
-		return 0;
-	}
-
 	msm_host->ice = ice;
 
 	/* Initialize the blk_crypto_profile */
@@ -1929,7 +1924,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	profile->ll_ops = sdhci_msm_crypto_ops;
 	profile->max_dun_bytes_supported = 4;
-	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
+	profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
 	profile->dev = dev;
 
 	/*
@@ -2009,9 +2004,53 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
 	return qcom_ice_evict_key(msm_host->ice, slot);
 }
 
+static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
+					  const u8 *eph_key, size_t eph_key_size,
+					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	struct sdhci_msm_host *msm_host =
+		sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
+					sw_secret);
+}
+
+static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
+				    const u8 *raw_key, size_t raw_key_size,
+				    u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_msm_host *msm_host =
+		sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
+}
+
+static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
+				      u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_msm_host *msm_host =
+		sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_generate_key(msm_host->ice, lt_key);
+}
+
+static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
+				     const u8 *lt_key, size_t lt_key_size,
+				     u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_msm_host *msm_host =
+		sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_prepare_key(msm_host->ice, lt_key, lt_key_size, eph_key);
+}
+
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops = {
 	.keyslot_program	= sdhci_msm_ice_keyslot_program,
 	.keyslot_evict		= sdhci_msm_ice_keyslot_evict,
+	.derive_sw_secret	= sdhci_msm_ice_derive_sw_secret,
+	.import_key		= sdhci_msm_ice_import_key,
+	.generate_key		= sdhci_msm_ice_generate_key,
+	.prepare_key		= sdhci_msm_ice_prepare_key,
 };
 
 #else /* CONFIG_MMC_CRYPTO */
-- 
2.34.1


