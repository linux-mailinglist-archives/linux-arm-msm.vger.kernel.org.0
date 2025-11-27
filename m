Return-Path: <linux-arm-msm+bounces-83528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5EC8D163
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 943A13A6327
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83957314A85;
	Thu, 27 Nov 2025 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvSPqMI0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pym2pRcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059F29D26E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228426; cv=none; b=Z3RN2njRFEOnrcjS0XWc/XYdqLZoW2cNJqGpy9ta7l1Tqc15cPBkUme/48Gtp3ibM/lo0N3n5FJv6jXknA8z925JTWP0wdVXwI+Bo61k18fwmPaU8CMSV+8Unib1TWXKZJkYkx1dHz8/GikzUGSmJyYUe4q1W53rqw0x6lRUWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228426; c=relaxed/simple;
	bh=/HqXxzUq6RnJYu48ZoJP0fcWuWCt+4vybB3tnbONtlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eip1Ywm9heZoL8LbDj7JRe4+SjpbfVBs9XSjNejA7LlEZXZZ70Xygn+mUhIYAf0ZCAIQ6LNM6QfbfbGoKtqXvNK86qcl68OAShRISP7jxqedyNaN3qqwSugw+3m0wu+toQiDOGeO91AC8KqM5zyVvKVguTheVhNTN3tXhNP8S84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvSPqMI0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pym2pRcI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQN32S83331649
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oqFyPtIZkLJnIdiBLjjAW8uXCSO1QldO+0G
	b72ywrxM=; b=jvSPqMI05o7CW7tOHZKrBCfzCublF4EJ54snyr0ZSWJBoNyxA5h
	WbnM8zy4S66/vOfBuVSbU2rh9RF72z69ikSieVnBj8savnOh/MOIg+mocwk4XMIw
	39ozbb1VRy0tc4wgdc0qChYGAVExJuqNPgSR7PWmr3NUSu5f6ecCla4sG33boElC
	tsQQNZIWJOktw5UD13usOhLh0kvlLgi7zEY+J64mGVPmWyhxwqLvrfldeR3Lt9Rz
	8FrpxRtGO8EiYIqcZAn3bWmkvLBLi88MPPaTwAMh6QrxLBWgUC9ssQkQBUIPxJBf
	7UygLFx6sSlHIuYsfOOJlcDdSQ8r4WK6oXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apavs13q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:27:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295592eb5dbso11199115ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 23:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764228422; x=1764833222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqFyPtIZkLJnIdiBLjjAW8uXCSO1QldO+0Gb72ywrxM=;
        b=Pym2pRcIJ44xM9Pb4ospwvpgPIKkyZ0NYybHlWOMyEZADXRrgr9/5p7rIhf73Wkhvq
         JNI5BE994kZVqhl3EnhVIUvylatJDcXyFOjgRQxP9cdmgGKx5335UQmUdBWLAGQmuWjc
         d7SOmCV8A+X60faCl/Aspr/hg5A5prwp7oOnBMdvIU/auHxU1n+xwsNOEXJ2GSNg+mxz
         iL31T8CkghwGhs/qApuIBULpb1QydK3+Udmwoa2t5VRP9G1LQg7gXJswrvlITaZoTVnd
         opZzVZelFinOt6JGZExfBPtHc5G1nt+MXrWAqIcph7P6SBbK1KLbpEUOEEEObY5trgQ5
         zIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764228422; x=1764833222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqFyPtIZkLJnIdiBLjjAW8uXCSO1QldO+0Gb72ywrxM=;
        b=omQ4krNwV8owI3GTYhNORjtktYPg2H1uIqAtlPQ+MoCECcGn/mClkLkGRl9/5jJE2y
         6Ezw461PfBjULspxgV829nawpIpQ/krPv4eVmSPwBQqPTCmw1QnqPyxbe1kvx8Id0Du4
         Z8yhlTfvdVthtgwXjv/W83MEKfkwCEeXgRvsK2uLrN9tk5nT3Pbpxyu+EQputcVr/shS
         PPJCjdkAJcWRTq+VHgbnH4zOEeH+oLzf+tJNsc4XvXRHxu+QvyRR/2m3zEZv6lw8chds
         ZDLwc58rGahJ5tppBWGReAwqcQHHZQLyUoo1ZFlUCk3F4rOqgUEa4n/s+U1ia3Ws/zjB
         dCyg==
X-Forwarded-Encrypted: i=1; AJvYcCUiBtZHcmvf2++04l9xw4uEibNj3X8VN5LJyrYda/WBeJjqBqr+R9ovgohUXJBUpWAKcYBCiXD7MAmoZczH@vger.kernel.org
X-Gm-Message-State: AOJu0YxGo+FP++aHPGDOL4MinLw4dUNRyXJIYUNkgezdcjlgTfVgwBk1
	zBKPv5UafVeuHf+HHlQ9tkOu8mjoEr1nZii6X3tWrdmBRRFMmsMJjzse6t0GemmsDmKfjaLOVme
	2KoShu0KFs1AUYYFuagc6uypEhN51UHklZzKHaMjMGTpGgMiEJyB7RTKmhj56S69D2sxi
X-Gm-Gg: ASbGncvl1RWabvH1lwm7S9V+TycTLE2ncnwUqsCXeE3KPuxM3Hycnj9TdmSCeZmVVMk
	Va7UOtq2hOakSr5R6A9/nsZdk4+e9H/jS3x1oQjj1pBKTnrlI+Y6yKiLhUoRdw1y3BpsnaNkBQK
	zdzPow+3DfN2cdcYY7V8Jl+uT80nEW7YKVLqfB6DxA7tn7a7uNyNAOqzCM4quu9g+wzNsV1lKR2
	E03ktOPx6Q5M/lwAxbkuzu3EZemYkasiyo9We4JnWsBMt0UXMeuRQfag3NSdMKDFZWs6DRUAqKp
	cju6o1OysTCVqirosRs1NOstgZWesy/Xlthiyk9npQfrNgdCosBhbvMw57VppTWSnysbg7RQjQb
	vWp+QIj71qmm94Ci4nG42htHYW9xO43Mnal6mt07F
X-Received: by 2002:a17:902:e5c8:b0:295:987d:f7ff with SMTP id d9443c01a7336-29b6c6925c1mr284666195ad.42.1764228422438;
        Wed, 26 Nov 2025 23:27:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELYQqGkB99TK63vcv4nYkMbNC7kIgCg02DD3dbWmRRPljsea7e1w0hT+HzLPsmDdC9Upzz9Q==
X-Received: by 2002:a17:902:e5c8:b0:295:987d:f7ff with SMTP id d9443c01a7336-29b6c6925c1mr284665985ad.42.1764228422002;
        Wed, 26 Nov 2025 23:27:02 -0800 (PST)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ac99sm8044715ad.7.2025.11.26.23.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:27:01 -0800 (PST)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com
Subject: [PATCH v2] mmc: host: sdhci-msm: Add support for wrapped keys
Date: Thu, 27 Nov 2025 12:56:57 +0530
Message-Id: <20251127072657.2755050-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OfWCjZvK1jaZmzku2LJqLrIY4p66eXuN
X-Authority-Analysis: v=2.4 cv=PYPyRyhd c=1 sm=1 tr=0 ts=6927fd47 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZyxRHT4sbPtUm1NgsYkA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1MiBTYWx0ZWRfX6cWqvrkZS87Q
 ECeSEmAigjrMMuKfSsV3BcjXAtLSyOwMLjfbi+gbqb3yzRlWcb7UFJQt3bBUw2XT16fgVUPaMBC
 cB1UltMopcH9wLywKmN0vTT1l0CAZlRK1ioFjh/YbntNC4hDieWFVbJ1Bd8KzTLXnHjG5hzZCPY
 EJnHTyimxuhLV4oJX6LkCdn4DJkavADdboNYxiHLpsdqYjIChBZpVVLlTvz4rLX/tmfVIiWZgZ0
 dzah8ObGN6Op7HHNR9yAE3nVHmgMLwI1ORCp9MuEr7ut169wmo5ny1h0C62fBAt9h+Ei1tIafEu
 UFs4GZK9HrBM9q98uRZLa8TC4dMMxhHJZpxL/Dhsu3INlpZ8geuHvrQ7Ku0Dhzbh4nggRfAmBB+
 eDQAcwdUcX2UDEYCbzlIzAWJrcK0QQ==
X-Proofpoint-GUID: OfWCjZvK1jaZmzku2LJqLrIY4p66eXuN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270052

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


