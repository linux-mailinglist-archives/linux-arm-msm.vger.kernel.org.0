Return-Path: <linux-arm-msm+bounces-87235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D215CEE8DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2E563014AD7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311A130F7F3;
	Fri,  2 Jan 2026 12:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTS6x8EV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxKAX7jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A9C2D47F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767357628; cv=none; b=DnsdLBatvXl/GfnQiL2dMdLs/Vqte/rUAVUozKhxt83DjX7zc86a6nrhCzkoSx1Pwx6Z/d87/bBFPF6hhtU4uJPIBt4ZQKS8v8/pKwbR6MAvrgKADCOGZbH6jclqmhUfvtrNEqnypyYNoipFzxoQlpzAtOOfsD78xvpjuYoPfC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767357628; c=relaxed/simple;
	bh=vV2nmrOl+t4OdYmghvPwINneUWYZKWPyzTh+ELChZx4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L0BL63KicEXLpeYG+iYbd81xoRN454eX8HUE8r/PmBdHAZPsJWfOKys4gmqeBEc8kFjOzyFJ8sLjiunuSp/cHc4uhNQNH1bhEpDuXtH+IuSS/4C6eVpZu5+dEZ2PAQgNqG1sdtrxd4sZTUa77odVUBlctod++ArkWzRcclE0vRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTS6x8EV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxKAX7jh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602BnlIJ1095111
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wDzocy7j+gQrNEnjx+nc/YBJjQhj3MoB0EM
	yBICOBZI=; b=KTS6x8EVWsOGxLM+qZHr3aZdLFJC2TdCT89WL7ilH72yRoTOt+E
	a9Ez0W3y1WTFjdaENTFKDICKGGYhjm3L8PtscP9shdHF5VQBGNqbdlhV3r+uYd7F
	BVng3GDSG7+UPCYRFq1aBSJw5fO8OoeavoymedQudxaY25G9ILtT1sGy3sK/XZmu
	BhuJwIk4D+/PvR1YJCaOa6w25FeJf32+0+UAqjF0p8BMQQxBQuoYRd6j6Co9FpXE
	Ic6K6hpheLmHu0sCHkjQbc0at9fdke7T1lQtFg13DZX70fznSmLez0Zhh1Ss4vZT
	497KC/0MKw2S38x45rihSZ+ze82OuqlJc2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg402p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:40:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a31087af17so253428745ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767357624; x=1767962424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wDzocy7j+gQrNEnjx+nc/YBJjQhj3MoB0EMyBICOBZI=;
        b=jxKAX7jhbGeoggszZe3rQLYLjzHXHZRjLOEjm4PfLpDu5iqPcB//iOgWWVcQlpLrDh
         RceTqoIM5k2WE93mBQ4q5Q+76JJK10LZ6v4l805ubXRI2KMR219vY4aR7romSzYnjBJJ
         xH5xv12vjEdEGgQD2JICEw4COB5gX0phhEn5lDmLudIK8Si+hPlpEQBVnNkiuFC3Ir4m
         ycZ1FPMKFOlFzLpgScJkfhve7loD3Epw3RDD2CatF+eyoeYl+bNtyeZfKnpQQZjlv1AA
         JfY2kpM5/PGMKJsQ4tiwWixSqkhSjilGB0dsLXPgXGUKpxe57zL2X5jbPgkzMxdgtUAf
         xkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767357624; x=1767962424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDzocy7j+gQrNEnjx+nc/YBJjQhj3MoB0EMyBICOBZI=;
        b=jwnQ/OM56v0P/Bnsw07ejutCG0I1LOmg6gFaTCNxlWz2J41eFceordQWNe3/ZdLucd
         QEOVh187otLPjSiwEFn+IbQjPp8F3PaMcB5FdwdQJc7HK4WWu4BwPCbNKTcJbsgi2hMH
         usGjrLUDuOp1SWqNYbrCM1hhihg1v85mvDSsDDNJsuTOs0LeaGOC4/LcBh6T9scUM++A
         fQ7DYR+c0Y/AycFkJJC52Prh3UQlD/wF038vB6/3slRVyiI7zdg+S9Ey+T8kT1udrnTK
         5JQmZJ1bMoZM35bBmY/aM8QQJYimsL8zwsWyZ46QWx5oPBsOFx/lZzKBNeKNRJzlPvSA
         YMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeZKnTaHeo7Kuc91oe8+2qMnLwRphmzC8WdEKr0Ip8ahycg15Z3fewLb/NNG6ffu5YroRQkjGVlAFq/Q0S@vger.kernel.org
X-Gm-Message-State: AOJu0YxmreE5NVaflqExER7sKjwhr3fJIpMc5x1X2is4EvcIYKkr2zcB
	llL64tV6UMJ+ynMHkTfyCvOSgQn0uPGisj4mzXmn40eNHGwjNWGF7O+0eMCbJpyUrJOVgi6doTq
	tbLRntgfxTtkG1etI8dRUpQySRKhtNF4Ld2zYtWiaXfBxPXWcA8OOEz67OVelRDb4dORX
X-Gm-Gg: AY/fxX5PkvefVzH/pXf2oor9GzlLS2LGsbLSQL+YZNW2O5pT87C1wVnW44OW1byrD3F
	oULyGSBG/nQ4vDZi9QWg9WNVyYmTSilG1WodUVniQWID7/TaK5YXaXaR+Xg3A2so5ZqaNb8Km3H
	mIrw1TPjXTsPGzYsxUNvKmJg7oxcnq3NuMXU2IzONcsk+X8sYwzu0pRYtCgFzGTe8PJNeXUCA9P
	OzfFluz1lcQhWWF/yo1RcQIl+9y5MOZJmo6uDg5gORyj8MXv806epqT4JXwEeNoVQYuMJhEHsoa
	DoupbTLJ3P/Jok84ROfUG1w3JSeg3STRc+WnGIRQi2DEErFsqHRVjsRw1sk5wXrbDfvGi7j3uwD
	jQQzKyf5YbkUrrifyhYK/2xml4KGV0s0nRM2OHQiH
X-Received: by 2002:a17:902:d488:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a2f2202ccamr395490565ad.4.1767357624376;
        Fri, 02 Jan 2026 04:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8A/uRbQ2+nH9MV72MQr84R+/Z3/LjbIDBmGCuDgNg5Cy+ibvYVOtw6HxMTm6h0Elj7WTxmg==
X-Received: by 2002:a17:902:d488:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a2f2202ccamr395490445ad.4.1767357623880;
        Fri, 02 Jan 2026 04:40:23 -0800 (PST)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0baf3sm36141763a12.34.2026.01.02.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:40:23 -0800 (PST)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, ebiggers@kernel.org,
        abel.vesa@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: [PATCH v4] mmc: host: sdhci-msm: Add support for wrapped keys
Date: Fri,  2 Jan 2026 18:10:18 +0530
Message-Id: <20260102124018.3643243-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aRdTiG7c3hjasZd4ADRb8Z1_OYg_W8aU
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957bcb9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=qqNy_vziDfUGqepx9HcA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aRdTiG7c3hjasZd4ADRb8Z1_OYg_W8aU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMSBTYWx0ZWRfX3sCKG47c49G6
 mdtD8Jyd6uT3mpE4g/JK00jkLMipFInFiKzM+Cg2VsSsSHYWTwOTt9K0bNoqxmjMRxoRhnlq7C0
 J8T+fCcedd9YyJweCQ1Ae4SvDHnJ7u4aZcl3mKOtvvuYAgKnN52/L/NHrgm5Qy4ndcMmH4+gg2a
 pGPq0reG4bCd5kLrEYKSdZgT/DN7zmstfPjR6fmee612UY3NOncSAW8LIYnrHuUTnCFTV/hHNQq
 8ZHrfpBGUcAKym2JN1PNGVIjQ/2H7b+RQbD4qVXGunT/0U0VKIZf7FXnFwefIupSpWNqHvaHj3e
 Hy4sfxaWipoP7HK+gKeBBl51xKmaQkXgbqlGIhsfZtzZv1D47vcCv/bw+1b1F6E3FBtThV7C2aP
 CprdyUZ7BgRVYRez4wqofy7blZGn2ugJIi4hajwRqVcYItJF3LF71QqisY8qEJxIFkKU2OA6MOd
 TsVhtQ3aZc2OLaClTDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020111

Add the wrapped key support for sdhci-msm by implementing the needed
methods in struct blk_crypto_ll_ops and setting the appropriate flag in
blk_crypto_profile::key_types_supported.

Tested on SC7280 eMMC variant.

How to test:

Use the "v1.3.0" tag from https://github.com/google/fscryptctl and build
fscryptctl that supports generating wrapped keys.

Enable the following config options:
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_QCOM_INLINE_CRYPTO_ENGINE=y
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
CONFIG_MMC_CRYPTO=y

Enable "qcom_ice.use_wrapped_keys" via kernel command line.

$ mkfs.ext4 -F -O encrypt,stable_inodes /dev/disk/by-partlabel/vm-data
$ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
$ fscryptctl generate_hw_wrapped_key /dev/disk/by-partlabel/vm-data > /mnt/key.longterm
$ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
$ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
$ rm -rf /mnt/dir
$ mkdir /mnt/dir
$ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
$ dmesg > /mnt/dir/test.txt
$ sync

Reboot the board

$ mount /dev/disk/by-partlabel/vm-data -o inlinecrypt /mnt
$ ls /mnt/dir # File should be encrypted
$ fscryptctl prepare_hw_wrapped_key /dev/disk/by-partlabel/vm-data < /mnt/key.longterm > /tmp/key.ephemeral
$ KEYID=$(fscryptctl add_key --hw-wrapped-key < /tmp/key.ephemeral /mnt)
$ fscryptctl set_policy --iv-ino-lblk-32 "$KEYID" /mnt/dir
$ cat /mnt/dir/test.txt # File should now be decrypted

Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

---
This is a reworked version of the patchset
https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
that was sent by Seshu Madhavi Puppala.

My changes rebase it to use the custom crypto profile support.

Changes in v4:
- Updated the link for fscryptctl tool in commit message to "https://github.com/google/fscryptctl".
- Aligned the indentation at few places.
- Unwrapped few lines of code.

Changes in v3:
- Updated commit message with test details and moved "Signed-off-by" above the
  scissors line.

Changes in v2:
- Updated commit message for clarity.

Changes in v1:
- Added initial support for wrapped keys.
---
 drivers/mmc/host/sdhci-msm.c | 47 +++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..8ac4aee2cb3b 100644
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
@@ -2009,9 +2004,49 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
 	return qcom_ice_evict_key(msm_host->ice, slot);
 }
 
+static int sdhci_msm_ice_derive_sw_secret(struct blk_crypto_profile *profile,
+					  const u8 *eph_key, size_t eph_key_size,
+					  u8 sw_secret[BLK_CRYPTO_SW_SECRET_SIZE])
+{
+	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_derive_sw_secret(msm_host->ice, eph_key, eph_key_size,
+					 sw_secret);
+}
+
+static int sdhci_msm_ice_import_key(struct blk_crypto_profile *profile,
+				    const u8 *raw_key, size_t raw_key_size,
+				    u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_import_key(msm_host->ice, raw_key, raw_key_size, lt_key);
+}
+
+static int sdhci_msm_ice_generate_key(struct blk_crypto_profile *profile,
+				      u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
+
+	return qcom_ice_generate_key(msm_host->ice, lt_key);
+}
+
+static int sdhci_msm_ice_prepare_key(struct blk_crypto_profile *profile,
+				     const u8 *lt_key, size_t lt_key_size,
+				     u8 eph_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE])
+{
+	struct sdhci_msm_host *msm_host = sdhci_msm_host_from_crypto_profile(profile);
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


