Return-Path: <linux-arm-msm+bounces-97357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAgTDGPJs2kqawAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:22:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629E27F883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 09:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED553205792
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FD737F017;
	Fri, 13 Mar 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+sZ2bp7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQtrihuX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA679375F65
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773389756; cv=none; b=VT5H2tByO6tKcLrQLPSskvtnjTl/Gh34mL8T9oRmsT1AXPYBTecARy4RMpo3uGmBZ75HD1a/2FLrSRThuEBcrFDWmezmCcZV4J+cycPtlABDTXLzldDTkrIE1V96XLU3tZURMVCUHDJkmKnJ2thmeGZ3sFon7/ltd27518/7tzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773389756; c=relaxed/simple;
	bh=HtZ7UHaIZ5d4GpPFkpIcr7qnrP+FXUHAis/ov3Tet4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=El5RPN9YoAkm0vACmyeNFUrrgSX1sPY56AbpihPbREpPhcWxIksIwDjv9LfCMNiyaAeb6fl3J0zSTmA7wU0UREe0yHfYxTxq6ZNShywnlUqWeMus7pr59I/VL4SJQadvLEXjHtBMVsJu8CX0V50EumML9LFWFnr7TXkKvgWmVKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+sZ2bp7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQtrihuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tgIe1176553
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xfR7KDCiWXdpXvk8xsnZ6c1wZFLaqKZZVra
	zB8UN08k=; b=n+sZ2bp7B4KzaAUFuTWXGLZRjpqBmhZsyq2vzha5b1j/z9DMLpZ
	0z/WBPFv9K72gqpJ35bBeEP0zg6svVS8K/q5q8hCE0gcWcxY8eeL0rMhSlx2O1lp
	1kQiRTygCWX8sGSGe9JVLAlfDEEVN/no69V2AuRsMvCKUy1/yvGn0xvRTCVtTt/c
	xEYjEpJciziCpsjuXsM1AUkWjVGQe8SYcpV0iBZnEwx4UoCl0cqepy3Yd3SQMF4n
	XfC2DyVJvjabuNdWw499Zt3LR0VpPvfxmrfJbmQdSMkGWjIaFSVT8q38bjleqDXc
	l3Z2MYkWwmVwVsG5dVcFfF2W1utSV4P0NaA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqcm69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 08:15:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0b5cf34dso2200742a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 01:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773389753; x=1773994553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfR7KDCiWXdpXvk8xsnZ6c1wZFLaqKZZVrazB8UN08k=;
        b=GQtrihuX4cwCEi9al412MtoV8DuUZ8B1R9l/AOrbapcCQxKRfuwoxNXhvqHuohJ56D
         c7XHk4dbbo9F1B7/ZugkX6wfqSGMB2XA85w4j33gT2nNoZvi9b3FZs54o9N5dEBmJGVc
         zeOTsYlX4ZqMiiewtE4TW5I4H/AlD/rxt+DrhBt6o/mB8HjM15W1GqdWsBgH6E8XSDBb
         Uk5FqMLh+R6fydz4WzfEO0nUE7LNyCJLOWAsmovEVwE35+8oOX7bcgzTl7Nh3k3NTQwK
         JujJ4gmJPQjpL2Pym6wl72wp5YfGQ89JxfK6RPe13XYfWjbINeXJ8plSCDN9jQlG+/Lz
         ZjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773389753; x=1773994553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfR7KDCiWXdpXvk8xsnZ6c1wZFLaqKZZVrazB8UN08k=;
        b=SDpGLTNB5YtwkKsBQkYtF2ny4oKKOPtl6PDevfBbbm/6wq1RX31xHM7UzDq0gNlpir
         XB5O6i0wFw5n5u+C0O+ZeYkv3jjyGlUcz6Xl9Ys4R+ZO22tDVYYRRdz5cgDYXG0WZjKK
         yJ+7kFMdpLOGC1SE+xgf/m/i6XT2Yr0P7fRVSZpvgxE2ugotD6tECtd0HDkImhmSFeJ5
         S+rwtyh8rULNlgBcBUq0NEycwsXJ4VkGSKv4M0L8O9hQCWpgJOcM4jOOWZt8nph4ZRBx
         6EwJFpzRJgGohP95ao447MI6JrGwfp509OarW3eEIW+4UVEvVw4A+q7/k43TuHeUI3Qd
         I5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ9eljeYhW0WGJefvO0jrhrZ+OsYxChBP84mDkLBKFY77ob4g2lI6PdITRdq7JM5vT2h91fIUYgUiseonN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SWS9QsgJhlgBIGbeSU1X4o+3C+DjFejto0G/NzlNzEhnMrfZ
	/DMnw6pPUfDJGoAYgTYSkXqdj0EcheQuFg6nw3JUYQTfU/0F1Di5+ma4YGuDtRqvtjFGL2xpQA0
	mXhBwZM1adaGR86cflgpn4AT+MvWVknRQSuctRxuMxyM7MFeFOwfTy3f3EJyD2kXMCyyt
X-Gm-Gg: ATEYQzysreAC8J0F5ivmNbIHMdJ2yOPyinFiLRdbcl/a9SpnHY3qpwb2M0mwUVxOdq6
	lEQF5muMiPSxgzJyd60rdq5t9HgEZFOcV5mAVrrtF3pQ/89PaJ/myJeMNlUJPV2F5dYjY54VAMF
	JsbPE+Ai7m1UuAsSTJ77RQhMjY4dC0t3ZL21xh9agAWFGVC+Yv1+bBtO+MIan+lOXwynonPr8QK
	gHw2pI9Qgj8HNO8kw4yIawpjx7njZhvChnYouPLOBws33zCh8MRWj3NEcRYDUZagr/NM6jmIZTv
	mBv2UK+GsdIAcgEwMykXl5mHdc+MwM0rQ0PpfSZbx6i9UsII0hpXKk2YT+EoQ7LVxndeN1l73nM
	YY/KFTBPq00rDp9P/qGXa2xn/ArA2jb+JNN4G54pwzKUsB3UlVZuJ
X-Received: by 2002:a17:90b:2e45:b0:356:2fc5:30e5 with SMTP id 98e67ed59e1d1-35a21fc20e7mr2198966a91.21.1773389753279;
        Fri, 13 Mar 2026 01:15:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:356:2fc5:30e5 with SMTP id 98e67ed59e1d1-35a21fc20e7mr2198944a91.21.1773389752817;
        Fri, 13 Mar 2026 01:15:52 -0700 (PDT)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e9861csm8039046a91.8.2026.03.13.01.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:15:52 -0700 (PDT)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, ebiggers@kernel.org,
        abel.vesa@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, neeraj.soni@oss.qualcomm.com,
        wenjia.zhang@oss.qualcomm.com
Subject: [PATCH v5] mmc: host: sdhci-msm: Add support for wrapped keys
Date: Fri, 13 Mar 2026 13:45:48 +0530
Message-Id: <20260313081548.3556577-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1biz5FgpUGWTLom2Cah63cB32VogxfV6
X-Proofpoint-GUID: 1biz5FgpUGWTLom2Cah63cB32VogxfV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2MyBTYWx0ZWRfXyK58eh4lOD0r
 4jiD+f9oYnBtJaKWGJK0K812QhU5NkJQTVWTUbeEWFQvWx/eQ9iKP/eGmomfbxOX1rTmxme7uUQ
 TiIRWk6n7MZzS7oocnFPdYKa19G4CNpNxB3OZHacQbq+rfZ+jejLrtgeSiqbuzJ8wKfgec4nuiL
 ZS3eL1awbi6d1lJDKQU335gZwwpwsqwqh/h0u+RjL1Ek6KFMH35YdyOTpbUj/aPUFJHcCMlOyrP
 Da9sS2TJZQJzHEYkXKCeeRfkjAVGr+jHVkEYZIqr545iZ0sRbPGeA7A1Ix0PPk4nbaS59t6AM0g
 qMtpEAgxFrYaJJtQ22sJW4wNCDwNWxDrpg6YMzbtzkatbO6BB9/CxUYy/xPxUP0k4uUeh4xtr+p
 9SGUaFDTnfnQLWG66eST0Xilqw4anMSh2NPm8LTZCXXdqSS7L4XykXTdOJEGzQFL0MQty+ZgirK
 u3njftKN9e1kdaK5iGQ==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b3c7ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=qqNy_vziDfUGqepx9HcA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130063
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
	TAGGED_FROM(0.00)[bounces-97357-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neeraj.soni@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8629E27F883
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>

---
This is a reworked version of the patchset
https://lore.kernel.org/all/20241101031539.13285-1-quic_spuppala@quicinc.com/
that was sent by Seshu Madhavi Puppala.

My changes rebase it to use the custom crypto profile support.

Changes in v5:
- Rebased on mmc-next.

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
 drivers/mmc/host/sdhci-msm.c | 42 +++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index da356627d9de..b4131b12df56 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1944,7 +1944,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 
 	profile->ll_ops = sdhci_msm_crypto_ops;
 	profile->max_dun_bytes_supported = 4;
-	profile->key_types_supported = BLK_CRYPTO_KEY_TYPE_RAW;
+	profile->key_types_supported = qcom_ice_get_supported_key_type(ice);
 	profile->dev = dev;
 
 	/*
@@ -2024,6 +2024,42 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
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
 static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -2089,6 +2125,10 @@ static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
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


