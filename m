Return-Path: <linux-arm-msm+bounces-89391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 836EBD30E3A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 13:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB1A2305C4F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 12:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A86B379981;
	Fri, 16 Jan 2026 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xl8OXfXQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvIIle49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E633337BE8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565414; cv=none; b=LYn+TNTK2ILhQLH0zaZnVy28fBBoRhoFZ0bSwGYRCYGFcu/Kw9aTqn/U4zF2f4nzkoncMDhr01/2KKd9di3WE7Qu9su1j07ef1qMqU8ffv31G/c3hvtj0Ija8veoVrsbMrXVwBmu5XAy1VajNmQElS0nGSganZJDq0uhQMUhzxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565414; c=relaxed/simple;
	bh=6f1yewdQNAvzhTorAE4vlmfc43dQqF127s3Sj9aOM8M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X1UKX46pSX/TjRHSw2K74y4OPrYb+jrB4mycVJsmZzN+R/HPgatBbgFkJHF0+dLFwpJcTRydeHe6lTKulLYCGl1ItR/76W+RLnt0HAfM352s370EktgLqvuRoCBjpU28tQ5VSiMjICtsjyNuaQ1MhNevewPN94PhbfjM1FF/T0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xl8OXfXQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvIIle49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8gg4E3892945
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jfVgXHiiwMr5n57sN+arNA+BDgMG+rIWJxI
	PeANId+s=; b=Xl8OXfXQPq0X6onNu3HI9gqaFB/4yoAD6sV7FiD1Gw+lQgLC+Px
	TX0rkwTmUrHH2CmbNBVRcrG9gW6qsT5ybqgoYq59qDV/LAne6SMAEoa4AfKBVHcM
	/hkr8eo4BvVxNmCoJwf1uDJzVlpcu7IpbwLV22QgzRXJJSIZjF0AWZ4+DlSabLsU
	3tzeX9zzeMOexzRdDqoj3ozc/VqEIMxdGXBB6MJFTu5QejO/KNQnD8OcP91QSizR
	4aI6pQs0iXW5YnvSTgVXdJOMUI6vav8HWYmlmAQ6a8s8i1UOHfzrrcPx1FgOQaUt
	COf0IaGcymb6FI9lBbTScyHfHrq5we4bx/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b0a2ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 12:10:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ac819b2f2so1730406a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 04:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768565411; x=1769170211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfVgXHiiwMr5n57sN+arNA+BDgMG+rIWJxIPeANId+s=;
        b=jvIIle49wdLGLYnWe1HwVyq8JleRJk7R4EjQrMfC3jRj+XbBC4dqOm5K8NltuszPkX
         v70msIt91p3hUcPIRWWH/40E40GXImDFKs37qKGQeX1KdPxO5LIl3iG74WeLfW0y01oU
         D9Fz6lqYOgHUgDK5MPzAOr28ssnIJwF6/dEroqiGcCAfrcb4pmx4fFo9ZEghDD9zj5x/
         Y83XouL5b/7DuqfRTDDZb/5nsol45bhY0ESnVtzgUrA7XMsvWx/+vsc/fkcXDq2nQnWZ
         AU9gnh18Cq1WbfB6oFKDqQ97xHA/pvowQgGwKKHMXZ94RgVWcGK/9tqxuT/TxsnhlH26
         1ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768565411; x=1769170211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfVgXHiiwMr5n57sN+arNA+BDgMG+rIWJxIPeANId+s=;
        b=nynEb53aAwOYmkhGUMo3KxN/tY7s0NoeOc7VR9rfyxqpmmenDld0yebo83S1Sgs+SE
         gi5U/4hIK8NlP5C7660PDtyV2HxKpy8yGNt0V8DLbVghs2L/MMnBvY2eYv0dyqMTaNap
         XP24B2w20ukJmRO4sc7jvtt1fOZAcw6UUkUllqzR3l9FT0iqTOytD3hDqatCZlg2qDgl
         QTGFM0hb5OfpYFrK49nUQssa/14jukY+duvNd4Wb6xurr+UIkJvuQAgYBbpWrwadU/uE
         Eih6t4hzO2fjzM2cMA5pK/ttF3o3euhtkNfivtXfJNmk6GfvHcQTPtftm92XE/tyakhW
         DiKA==
X-Forwarded-Encrypted: i=1; AJvYcCVTJaAmjtwibMEsxK+mzZSVRZtR8+CBqUJp2fkRYm2qp3vd3sP0QWK/EnXGid4C6SHBhoqjiLQ4dGOGC23+@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNretfFpErSn9Mp5qAcUJ6wBn6b49ecu9LsOScjV7vZHiKbpm
	DfHlNQtJGkFyE2XZMyofoNcIYXRPsXE+yTvHbsfS2wAMsZO4FDOzKVCDuG+QWoj5OOOigX7j2zG
	FxhYFW9LO8cLGUpLebrfUW6zkjmOB/Ree6m0Mn84LIr+HntDybLcJNy7UKw5qMByXNO7X
X-Gm-Gg: AY/fxX6LK9tMqSpUBIwWo/FOLsaqGHhw9Dr9ihRLPEBP4NIx4wn9jKyWOwsBXhmxhl/
	vgOjsFSFgD8Bb9y74JfhD72qLFqqL4UaG7hm/B/hMn15oBPNtlGZ8pOTrkR+0k7URTfNt94p2dY
	DXp1AAvSwxRKNrOQg52C8DC0Vv9NBptGLeTcK2FfI1G36qqafPX8hOpXWeXw6uWmVcWP69M3oZf
	Jl9XNQUfqG26PxGTA7FUNOoQ+EdaA9W/5d1I6GUxVR49BPQqoqk4YOwODOdSZEt5Amgyd+IAcFL
	DwE9K8QuwOZzSluXr68WYeQTCgw8rqi/Xztpj3/5jZCtB/2dXwBiqia6XcPgSrGi1S+hZw5z3yY
	Le9NYqdj1OWJsflO7hql0LH2FBnbtt+2vfQ+LuDpO
X-Received: by 2002:a17:90b:4d0d:b0:34c:c866:81f2 with SMTP id 98e67ed59e1d1-35272ec4aaemr2154763a91.4.1768565411233;
        Fri, 16 Jan 2026 04:10:11 -0800 (PST)
X-Received: by 2002:a17:90b:4d0d:b0:34c:c866:81f2 with SMTP id 98e67ed59e1d1-35272ec4aaemr2154736a91.4.1768565410744;
        Fri, 16 Jan 2026 04:10:10 -0800 (PST)
Received: from hu-neersoni-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ca9acsm4527093a91.1.2026.01.16.04.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:10:10 -0800 (PST)
From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
To: ebiggers@kernel.org, ulf.hansson@linaro.org, adrian.hunter@intel.com
Cc: quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neeraj.soni@oss.qualcomm.com
Subject: [PATCH v4] mmc: Avoid reprogram all keys to Inline Crypto Engine for MMC runtime suspend resume
Date: Fri, 16 Jan 2026 17:40:04 +0530
Message-Id: <20260116121004.1829223-1-neeraj.soni@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 80sV3UOoIvLpIl2NXg0u6tlBorvHkTM_
X-Proofpoint-ORIG-GUID: 80sV3UOoIvLpIl2NXg0u6tlBorvHkTM_
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696a2aa4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=d846rY_4ajozEFWswkwA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA4NSBTYWx0ZWRfXxQUQKDaaUGde
 wYxRe8IIteMumoifyhOX6UdWMjJiZzGsmyJG9nouBLmkAoGDN883Q6bjXcVVennyfG1zImVTeEV
 zsdptHZ9+t5VLhjbO1H08PWFsXNBXKo9PFIHS/s4pqsFz3TqCwfAYjoeVPtr6QMCdGlbEo8RCWL
 19hb0CXvt4sXJZ0X66LSOvKAs5+0NPeQY+m4OMxnbYhZ4H3QOqm+Bfwmn1A4Wb9eqaFenvxn1Q4
 tCaxSUZmx3fl+1MYIUjX7WgNxSC6KQjgNimDUvW2G1+jl0O87xn3rXZ4+DAJUkfPrAXCEOm5XjO
 Of1zmZ0pNDDXahfaiPhNAW45l2XwoT3DtcRBlQ0yRGQ+LAZPmdrYmf5o/Ratb6IEeShAsjOpJHL
 fzs909qdjRGXx0xLh1pYAI/HDEwipouguOnGcuSW3FIHyK7Ma2Mu9QjvGqlPEQhfxkzlKyfCn2d
 4Somc1EtSR6Hd0REV8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_04,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160085

From: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>

Crypto reprogram all keys is called for each MMC runtime
suspend/resume in current upstream design. If this is implemented
as a non-interruptible call to TEE for security, the cpu core is
blocked for execution while this call executes although the crypto
engine already has the keys. For example, glitches in audio/video
streaming applications have been observed due to this. Add the flag
MMC_CAP2_CRYPTO_NO_REPROG as part of host->caps2 to control reprogramming
keys to crypto engine for socs which dont require this feature.

Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

---
Changes in v4:
- Removed the "CONFIG_MMC_CRYPTO" encapsulation for "MMC_CAP2_CRYPTO" and
  "MMC_CAP2_CRYPTO_NO_REPROG".

Changes in v3:
- Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG
  in the commit message for clarity.
- Added parentheses around the condition: (host->caps2 & MMC_CAP2_CRYPTO)
  to improve readability and correctness.
- Updated the comment associated with MMC_CAP2_CRYPTO_NO_REPROG
  to better reflect its purpose.

Changes in v2:
- Renamed MMC_CAP2_DONT_REPROGRAM to MMC_CAP2_CRYPTO_NO_REPROG for
  improved clarity.
- Defined MMC_CAP2_CRYPTO_NO_REPROG for MMC targets that do not support
  a Crypto Engine.
- Restricted the usage of struct crypto_profile to MMC devices that
  support a Crypto Engine.

Changes in v1:
- Addressed the comments from:
  https://lore.kernel.org/lkml/20241006135530.17363-3-
  quic_spuppala@quicinc.com/T/#m69c9ab538bd9efd54515646952d0d7d1d7c17690
- Avoided reprogram of keys for Qualcomm SOCs only.
- Ensured reprogram of all keys on host controller reset.
---
 drivers/mmc/core/crypto.c    | 2 +-
 drivers/mmc/host/sdhci-msm.c | 6 ++++++
 include/linux/mmc/host.h     | 5 +----
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/core/crypto.c b/drivers/mmc/core/crypto.c
index fec4fbf16a5b..a5a90bfc634e 100644
--- a/drivers/mmc/core/crypto.c
+++ b/drivers/mmc/core/crypto.c
@@ -15,7 +15,7 @@
 void mmc_crypto_set_initial_state(struct mmc_host *host)
 {
 	/* Reset might clear all keys, so reprogram all the keys. */
-	if (host->caps2 & MMC_CAP2_CRYPTO)
+	if ((host->caps2 & MMC_CAP2_CRYPTO) && !(host->caps2 & MMC_CAP2_CRYPTO_NO_REPROG))
 		blk_crypto_reprogram_all_keys(&host->crypto_profile);
 }
 
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..2ccb63dde9c1 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1949,6 +1949,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+	mmc->caps2 |= MMC_CAP2_CRYPTO_NO_REPROG;
 	return 0;
 }
 
@@ -2526,6 +2527,11 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	usleep_range(200, 210);
 	reset_control_put(reset);
 
+#ifdef CONFIG_MMC_CRYPTO
+	if (host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		blk_crypto_reprogram_all_keys(&host->mmc->crypto_profile);
+#endif
+
 	return ret;
 }
 
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index e0e2c265e5d1..2fd76f966e24 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -457,12 +457,9 @@ struct mmc_host {
 #define MMC_CAP2_CQE_DCMD	(1 << 24)	/* CQE can issue a direct command */
 #define MMC_CAP2_AVOID_3_3V	(1 << 25)	/* Host must negotiate down from 3.3V */
 #define MMC_CAP2_MERGE_CAPABLE	(1 << 26)	/* Host can merge a segment over the segment size */
-#ifdef CONFIG_MMC_CRYPTO
 #define MMC_CAP2_CRYPTO		(1 << 27)	/* Host supports inline encryption */
-#else
-#define MMC_CAP2_CRYPTO		0
-#endif
 #define MMC_CAP2_ALT_GPT_TEGRA	(1 << 28)	/* Host with eMMC that has GPT entry at a non-standard location */
+#define MMC_CAP2_CRYPTO_NO_REPROG (1 << 29)	/* Host handles inline crypto key reprogramming */
 
 	bool			uhs2_sd_tran;	/* UHS-II flag for SD_TRAN state */
 	bool			uhs2_app_cmd;	/* UHS-II flag for APP command */
-- 
2.34.1


