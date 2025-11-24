Return-Path: <linux-arm-msm+bounces-83049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C95C8034C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 12:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DAD7E341B99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D0B2FD662;
	Mon, 24 Nov 2025 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TfgUHrDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIUA2tsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB682FBE03
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983757; cv=none; b=DOkiPJ4C5SVhdZe1uEn0nDuN7sjiIucyjHP6I1xXp4DpvRyb2u00XBXvwrgb2KwJl3rljSgaSfNzPYM5dBkAjpUYvpecpy7BsOi/3jbFvw21NJRurgaYB0eR2sMA2lciWdeTDAAsvOiAogwWc8SEosX0o4deeuBFl4RiK1To/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983757; c=relaxed/simple;
	bh=Ly7lLYY3bIPXjpAH7bKNc9BZsAhfKZRUM/kCY/y4Aig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HEjsbZ8Zwi+s41HkENla8z2xctuDjOF6ho7mXpw8fYpaXuDJBu14EKFfoAVSevt9doNXDsFyHufpQQVX1EM11b5LtjxshLa44wGF0NvG4xphGcZesxksnVghKY5+ldqbk5PWuQkajOrE0PDifw26g7hdoCPR6evrFZmEp2gQSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TfgUHrDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIUA2tsj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB5gdT4003037
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M3M9y8dqcilpF3eUX0QRY29iWzqFVt7BaBs
	tvCWE+yo=; b=TfgUHrDcnwjv/khYff1QO0rat0iapcvQJqd1qEOSLJHvzUhEgqX
	/anQwmYe1YnWjJt3x4DFnp36U2vprbH3QP0kIJ3gptTUxqvdSdhh0u9+5lVnmCmx
	Ub0fhOOf5Flxajm/67G8UezTkCzbAxxb2h8Ihfs3Rr9ZRvJzTl5YTHyYiNayHmpc
	tUTAE1CG36rzrYniB+KHdPOVEtR3jhr0gt4fD7Cukln+S2jthB4LUkauf587cH3f
	b+Qyj0aWdCVn25mVKxnqou1vugfJa+EKCU8Ml2LI0P/bzhX35PsLS7AFllJeTOX7
	w+8nNXcXrRqrB6ev1iEJHuxe6HkZQP9kpoQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h0285-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 11:29:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2955555f73dso67150335ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 03:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763983753; x=1764588553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M3M9y8dqcilpF3eUX0QRY29iWzqFVt7BaBstvCWE+yo=;
        b=UIUA2tsjydy3TiYLIUS7rF2ZCj3tmJ+TjecnOiY6r8ZEMg41awQBc2c0obdzY+4Ndg
         qaWuOYMkBFUnJlSeTzH9D+6mtpBkVXfx7uQ31Qfj2Lk/Nuy/bgqCjxlNJidPwbEarPnh
         qWJj9ndvRmwpkwM8IC5x6rWpPc2yY2Oez2tj8mW/WzHP4YtkkT3rJ/98i56nIiaaI5LI
         xctUcimnrpglnJmo221NDqEeTtWJ6ck3xib3xlXQF7BNyY0F3NbpwGTMLhHmhOele8d6
         CscPnOKWZEVL7FLbUvygnvYkUSZbfRtIxyd8xH5FCUwLKzODQvPAOlEhQWh2NQ0tJeW9
         2Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763983753; x=1764588553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3M9y8dqcilpF3eUX0QRY29iWzqFVt7BaBstvCWE+yo=;
        b=NN1PS9qj5eT2pdOynQwiqvdNUWyFmOscfqm+AURmn9UvkSlNCDLwWj/Iab/he+R30D
         3FDtD7pQ2jGelYNKXS2u5oq0pAl25gLpArBF5wQltUHCUv/E3mhH0zZatb+fj9RTK4FR
         yLeuUVSEaDWACcSRMspsi67zP/I7UXmr8doTJfTDyMqlmdQgNOOrXyR9uToGxf+ay0VO
         ImTSjdl2k1BfztH5Di1YHCGC2MXXcGN7ZAqJueOTSDstmkEeaBhb+VfQPxOby3Gh2Psw
         iY5fW3RtNDaIB6YEIUMNfi9w7gsc7BLtHt6pLbf4tYSoE1PwcMGEKKVS+Zpcm+ym2goM
         tEmg==
X-Forwarded-Encrypted: i=1; AJvYcCUbBhl4dNc6HA3atIJaY6kWpVrAuwYnlU8aLQdIdP0gcFnfGWDj8lRfSkPU/G34dn7gu9idlr0CXsEz7U7t@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xovZpzkikkOj25/AQxt78MeJQ7BxIoLOXv7C0Q9f/lfdP6yj
	2KkNaGxi+pxRr9FFpr8iSessLb6Zbb3ctzqewQExSc4GfBBtXUUm4t0JuuLt86s//eu1lY+uNqg
	oc21ZruedmIAnVijZbz73MZ8MxaVbSBxWKGuPPVV71LoPyo0g/roJVDbXqR/zrXjXU+W0fk5nk9
	93
X-Gm-Gg: ASbGncv1j296zub4ekkeE1fmDMVMFkrYmdlVF63dmjTXbpcAImtYfRxItGii/F4xbpY
	t1vTOWEEkyTBmFUN+VNqFf21EAJmJW54Cef8J5stOQZUACyeO2tPjrwoLFf15GvG0ttQL90DCFS
	L06qHSHDx8ZL2RwWMayg6XipW31U0b9ZG08n3N4agkhsUQcps8RAEDa2+Rl/ZxT7Ca0ygeErPb1
	dtiWdrHDPKUYkcDslux2H543F3aWDkrusjIBFBbHifrid2e6XooSEvRgIGM+cvH+n5OiEpDgEz8
	1C+ntztm1v4q+4alVESk6HTnbbCl2Z22BmLeDXr0tn07M4dvY06QoEQlTNN39esTbNNwvu0Pf8q
	xf4CIzsAlRNmYpHFXWc5bwPIdQFlQfVx9ScQUgkPt
X-Received: by 2002:a17:902:d4d0:b0:295:9383:543 with SMTP id d9443c01a7336-29b6bee2c8emr139460145ad.27.1763983752648;
        Mon, 24 Nov 2025 03:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6HDY47fcT6Lp1tR/8iFhrEEnMqzWSigNega4FnN7afcdlOzSJ4ONZeVJtQJ7yGBhH6cXbog==
X-Received: by 2002:a17:902:d4d0:b0:295:9383:543 with SMTP id d9443c01a7336-29b6bee2c8emr139459925ad.27.1763983752134;
        Mon, 24 Nov 2025 03:29:12 -0800 (PST)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b27509dsm132034165ad.78.2025.11.24.03.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 03:29:11 -0800 (PST)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH] mmc: host: sdhci-msm: Add support for wrapped keys
Date: Mon, 24 Nov 2025 16:59:08 +0530
Message-Id: <20251124112908.3193211-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwMSBTYWx0ZWRfXyuwIwXe8mYAd
 7RxoirIuSbX10NBh4h70HqWPvO/WVAOva3b7vonEmce8MeML1VvhH88fxWJvE0PZ2b/ZLIVM8dk
 TjkbwGS74fBYmfdEYFrBBRdX5sw1qWPdWpAYs1Mojzf2R4Kf8OTbmbPv4EDx41kiXgBhpf4C68v
 sVlLGYBXmL/jO7N7K6twHyJ0snGZgrYZS02K3v3Rei+L/bj0uTs8gM5GpRYK2dciCBBrEO2/4C+
 dnKizKv6787lVjmwWz4sM9zxBvU9yZg6PuyujSbtsZji6AKaEeOxqRVt7PP9D3oE606aDBGxd1v
 ZL9NXks6u6/s7aBn8QbmVDO2JDSbd/5JINBataaCoGw8dit4mUTyx2ykhqySZVKdWbQAisZ6Daz
 ktkOWa7rXQY368rm8CAmqRRiNe0OmA==
X-Proofpoint-GUID: d3jgckVVXp4ux66EEH5MhAFRn_Rl1jrE
X-Proofpoint-ORIG-GUID: d3jgckVVXp4ux66EEH5MhAFRn_Rl1jrE
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=69244189 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyxRHT4sbPtUm1NgsYkA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240101

Add the wrapped key support for sdhci-msm by implementing the needed
methods in struct blk_crypto_ll_ops and setting the appropriate flag in
blk_crypto_profile::key_types_supported.

This is a reworked version of the patchset
https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
that was sent by Seshu Madhavi Puppala.

My changes rebase it to use the custom crypto profile support.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
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


